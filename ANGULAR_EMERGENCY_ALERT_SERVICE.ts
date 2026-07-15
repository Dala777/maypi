// SERVICIO: frontend/src/app/modules/dashboard/services/emergency-alert.service.ts

import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../../../../environments/environment';

export interface EmergencyAlert {
  id: number;
  user_id: number;
  latitude: number;
  longitude: number;
  description?: string;
  device_name?: string;
  status: string;
  created_at: string;
  updated_at: string;
}

export interface EmergencyAlertResponse {
  message: string;
  data: EmergencyAlert;
  total?: number;
  page?: number;
  size?: number;
}

@Injectable({
  providedIn: 'root'
})
export class EmergencyAlertService {
  private apiUrl = `${environment.apiUrl}/api/v1`;

  constructor(private http: HttpClient) { }

  /**
   * Obtener todas las alertas de emergencia
   */
  getEmergencyAlerts(page: number = 1, size: number = 10, search: string = ''): Observable<any> {
    let params = new HttpParams()
      .set('page', page.toString())
      .set('size', size.toString());

    if (search) {
      params = params.set('search', search);
    }

    return this.http.get<any>(`${this.apiUrl}/emergency-alerts`, { params });
  }

  /**
   * Obtener una alerta específica
   */
  getEmergencyAlertById(alertId: number): Observable<EmergencyAlertResponse> {
    return this.http.get<EmergencyAlertResponse>(`${this.apiUrl}/emergency-alerts/${alertId}`);
  }

  /**
   * Actualizar el estado de una alerta
   */
  updateEmergencyAlert(alertId: number, status: string, description?: string): Observable<EmergencyAlertResponse> {
    const body = { status };
    if (description) {
      (body as any).description = description;
    }

    return this.http.patch<EmergencyAlertResponse>(`${this.apiUrl}/emergency-alerts/${alertId}`, body);
  }

  /**
   * Eliminar una alerta
   */
  deleteEmergencyAlert(alertId: number): Observable<any> {
    return this.http.delete<any>(`${this.apiUrl}/emergency-alerts/${alertId}`);
  }
}
