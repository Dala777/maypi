from pydantic import BaseModel
from typing import Optional
from datetime import datetime

class EmergencyAlertStore(BaseModel):
    user_id: int
    latitude: float
    longitude: float
    description: Optional[str] = None
    device_name: Optional[str] = None

class EmergencyAlertResponse(BaseModel):
    id: int
    user_id: int
    latitude: float
    longitude: float
    description: Optional[str] = None
    device_name: Optional[str] = None
    status: str
    created_at: datetime
    updated_at: datetime

    class Config:
        from_attributes = True

class EmergencyAlertUpdate(BaseModel):
    status: Optional[str] = None
    description: Optional[str] = None

    class Config:
        from_attributes = True
