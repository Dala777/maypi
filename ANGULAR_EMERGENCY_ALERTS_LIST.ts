// COMPONENTE: frontend/src/app/modules/dashboard/components/emergency-alerts-list.component.ts

import { Component, OnInit, OnDestroy, ViewChild, TemplateRef } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MatPaginator, PageEvent } from '@angular/material/paginator';
import { MatSnackBar } from '@angular/material/snack-bar';
import { EmergencyAlertService, EmergencyAlert } from '../services/emergency-alert.service';
import { Subject } from 'rxjs';
import { takeUntil, debounceTime, distinctUntilChanged } from 'rxjs/operators';

@Component({
  selector: 'app-emergency-alerts-list',
  templateUrl: './emergency-alerts-list.component.html',
  styleUrls: ['./emergency-alerts-list.component.css']
})
export class EmergencyAlertsListComponent implements OnInit, OnDestroy {
  
  emergencyAlerts: EmergencyAlert[] = [];
  displayedColumns: string[] = ['id', 'user', 'location', 'device', 'status', 'date', 'actions'];
  
  isLoading = false;
  totalAlerts = 0;
  currentPage = 1;
  pageSize = 10;
  
  searchTerm = '';
  statusFilter = '';
  
  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild('detailsDialog') detailsDialog: TemplateRef<any>;
  
  private destroy$ = new Subject<void>();
  private searchSubject$ = new Subject<string>();

  constructor(
    private emergencyAlertService: EmergencyAlertService,
    private dialog: MatDialog,
    private snackBar: MatSnackBar
  ) { }

  ngOnInit(): void {
    this.loadAlerts();
    
    // Configurar búsqueda con debounce
    this.searchSubject$.pipe(
      debounceTime(300),
      distinctUntilChanged(),
      takeUntil(this.destroy$)
    ).subscribe(() => {
      this.currentPage = 1;
      this.loadAlerts();
    });
  }

  /**
   * Cargar alertas de emergencia
   */
  loadAlerts(): void {
    this.isLoading = true;
    
    this.emergencyAlertService.getEmergencyAlerts(
      this.currentPage,
      this.pageSize,
      this.searchTerm
    ).pipe(
      takeUntil(this.destroy$)
    ).subscribe({
      next: (response) => {
        this.emergencyAlerts = response.data || [];
        this.totalAlerts = response.total || 0;
        this.isLoading = false;
      },
      error: (error) => {
        console.error('Error al cargar alertas:', error);
        this.snackBar.open('Error al cargar las alertas', 'Cerrar', { duration: 5000 });
        this.isLoading = false;
      }
    });
  }

  /**
   * Búsqueda con debounce
   */
  onSearchChange(term: string): void {
    this.searchSubject$.next(term);
  }

  /**
   * Filtro por estado
   */
  onStatusFilterChange(status: string): void {
    this.currentPage = 1;
    this.loadAlerts();
  }

  /**
   * Cambio de página
   */
  onPageChange(event: PageEvent): void {
    this.currentPage = event.pageIndex + 1;
    this.pageSize = event.pageSize;
    this.loadAlerts();
  }

  /**
   * Actualizar alertas
   */
  refreshAlerts(): void {
    this.currentPage = 1;
    this.searchTerm = '';
    this.statusFilter = '';
    this.loadAlerts();
  }

  /**
   * Ver detalles de la alerta
   */
  viewDetails(alert: EmergencyAlert): void {
    this.dialog.open(this.detailsDialog, {
      width: '500px',
      data: alert
    });
  }

  /**
   * Marcar alerta como resuelta
   */
  resolveAlert(alert: EmergencyAlert): void {
    this.emergencyAlertService.updateEmergencyAlert(
      alert.id,
      'resolved',
      'Alerta resuelta por el administrador'
    ).pipe(
      takeUntil(this.destroy$)
    ).subscribe({
      next: () => {
        this.snackBar.open('Alerta marcada como resuelta', 'Cerrar', { duration: 3000 });
        this.loadAlerts();
      },
      error: (error) => {
        console.error('Error al actualizar alerta:', error);
        this.snackBar.open('Error al actualizar la alerta', 'Cerrar', { duration: 5000 });
      }
    });
  }

  /**
   * Eliminar alerta
   */
  deleteAlert(alert: EmergencyAlert): void {
    if (confirm('¿Estás seguro de que deseas eliminar esta alerta?')) {
      this.emergencyAlertService.deleteEmergencyAlert(alert.id).pipe(
        takeUntil(this.destroy$)
      ).subscribe({
        next: () => {
          this.snackBar.open('Alerta eliminada correctamente', 'Cerrar', { duration: 3000 });
          this.loadAlerts();
        },
        error: (error) => {
          console.error('Error al eliminar alerta:', error);
          this.snackBar.open('Error al eliminar la alerta', 'Cerrar', { duration: 5000 });
        }
      });
    }
  }

  /**
   * Abrir ubicación en Google Maps
   */
  openMapsInNewTab(alert: EmergencyAlert): void {
    const mapsUrl = `https://maps.google.com/?q=${alert.latitude},${alert.longitude}`;
    window.open(mapsUrl, '_blank');
  }

  ngOnDestroy(): void {
    this.destroy$.next();
    this.destroy$.complete();
  }
}
