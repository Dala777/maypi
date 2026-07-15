from fastapi import APIRouter, status, Query, Depends, HTTPException, Security
from fastapi_pagination import Params
from fastapi_pagination.ext.sqlalchemy import paginate
from sqlalchemy import or_, desc
from sqlalchemy.orm import Session
from models.emergency_alert import EmergencyAlert
from models.user import User
from schemas.emergency_alert import EmergencyAlertResponse, EmergencyAlertUpdate, EmergencyAlertStore
from utils.dependency import get_db
from utils.security import get_current_user

router = APIRouter()

@router.get(
    '/emergency-alerts',
    status_code=status.HTTP_200_OK,
    tags=['emergency-alerts']
)
def list(
    page: int = Query(1, ge=1, description="Numero de pagina"),
    size: int = Query(10, ge=1, le=100, description="Alertas por pagina"),
    search: str = Query("", description="Buscar por id de usuario o descripción"),
    db: Session = Depends(get_db),
    current_user: User = Security(get_current_user, scopes=["view emergency-alerts"])
):
    try:
        params = Params(page=page, size=size)
        query = db.query(EmergencyAlert).order_by(desc(EmergencyAlert.created_at))
        
        if search:
            query = query.filter(
                or_(
                    EmergencyAlert.user_id == int(search) if search.isdigit() else False,
                    EmergencyAlert.description.like(f"%{search}%")
                )
            )
        
        response = paginate(query, params)

        next_page = page + 1 if page * size < response.total else None
        prev_page = page - 1 if page > 1 else None
        
        return {
            "message": "Se ha obtenido la lista de alertas de emergencia correctamente",
            "data": [EmergencyAlertResponse.model_validate(alert) for alert in response.items],
            "total": response.total,
            "page": response.page,
            "size": response.size,
            "links": {
                "next": f"/api/v1/emergency-alerts?page={next_page}&size={size}" if next_page else None,
                "previous": f"/api/v1/emergency-alerts?page={prev_page}&size={size}" if prev_page else None,
                "first": f"/api/v1/emergency-alerts?page=1&size={size}",
                "last": f"/api/v1/emergency-alerts?page={response.pages}&size={size}"
            }
        }
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail=f"Error al obtener la lista de alertas de emergencia: {e}"
        )

@router.post(
    '/emergency-alerts',
    status_code=status.HTTP_201_CREATED,
    tags=['emergency-alerts']
)
def store(
    emergency_alert_store: EmergencyAlertStore,
    db: Session = Depends(get_db)
):
    try:
        # Verificar que el usuario existe
        user = db.query(User).filter(User.id == emergency_alert_store.user_id).first()
        if not user:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail="Usuario no encontrado"
            )
        
        new_alert = EmergencyAlert(**emergency_alert_store.model_dump())
        db.add(new_alert)
        db.commit()
        db.refresh(new_alert)
        
        return {
            "message": "Alerta de emergencia registrada correctamente",
            "data": EmergencyAlertResponse.model_validate(new_alert)
        }
    except HTTPException:
        raise
    except Exception as e:
        db.rollback()
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail=f"Error al registrar la alerta de emergencia: {e}"
        )

@router.get(
    '/emergency-alerts/{alert_id}',
    status_code=status.HTTP_200_OK,
    tags=['emergency-alerts']
)
def show(
    alert_id: int,
    db: Session = Depends(get_db),
    current_user: User = Security(get_current_user, scopes=["view emergency-alerts"])
):
    try:
        alert = db.query(EmergencyAlert).filter(EmergencyAlert.id == alert_id).first()
        
        if not alert:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail="Alerta de emergencia no encontrada"
            )
        
        return {
            "message": "Se ha obtenido la alerta de emergencia correctamente",
            "data": EmergencyAlertResponse.model_validate(alert)
        }
    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail=f"Error al obtener la alerta: {e}"
        )

@router.patch(
    '/emergency-alerts/{alert_id}',
    status_code=status.HTTP_200_OK,
    tags=['emergency-alerts']
)
def update(
    alert_id: int,
    emergency_alert_update: EmergencyAlertUpdate,
    db: Session = Depends(get_db),
    current_user: User = Security(get_current_user, scopes=["edit emergency-alerts"])
):
    try:
        alert = db.query(EmergencyAlert).filter(EmergencyAlert.id == alert_id).first()
        
        if not alert:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail="Alerta de emergencia no encontrada"
            )
        
        update_data = emergency_alert_update.model_dump(exclude_unset=True)
        for field, value in update_data.items():
            setattr(alert, field, value)
        
        db.commit()
        db.refresh(alert)
        
        return {
            "message": "Alerta de emergencia actualizada correctamente",
            "data": EmergencyAlertResponse.model_validate(alert)
        }
    except HTTPException:
        raise
    except Exception as e:
        db.rollback()
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail=f"Error al actualizar la alerta: {e}"
        )

@router.delete(
    '/emergency-alerts/{alert_id}',
    status_code=status.HTTP_200_OK,
    tags=['emergency-alerts']
)
def destroy(
    alert_id: int,
    db: Session = Depends(get_db),
    current_user: User = Security(get_current_user, scopes=["delete emergency-alerts"])
):
    try:
        alert = db.query(EmergencyAlert).filter(EmergencyAlert.id == alert_id).first()
        
        if not alert:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail="Alerta de emergencia no encontrada"
            )
        
        db.delete(alert)
        db.commit()
        
        return {
            "message": "Alerta de emergencia eliminada correctamente"
        }
    except HTTPException:
        raise
    except Exception as e:
        db.rollback()
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail=f"Error al eliminar la alerta: {e}"
        )
