/**
 * GUÍA DE CONFIGURACIÓN DE ENVIRONMENTS
 * 
 * Este archivo sirve como referencia para entender cómo configurar
 * los diferentes ambientes del frontend.
 */

// ============================================
// DESARROLLO LOCAL
// ============================================
// Archivo: environment.development.ts
// Uso: ng serve --configuration development
export const developmentEnvironment = {
    baseUrl: 'http://localhost:8000/api/v1',  // API local en Docker
    baseUrlAlt: 'http://localhost:8000/',
    production: false,
    googleMapsApiKey: 'TU_CLAVE_DE_API_DE_GOOGLE_MAPS',
};

// ============================================
// DESARROLLO (por defecto)
// ============================================
// Archivo: environment.ts
// Uso: ng serve (sin especificar configuración)
export const defaultEnvironment = {
    baseUrl: 'http://localhost:8000/api/v1',  // API local en Docker
    baseUrlAlt: 'http://localhost:8000/',
    production: false,
    googleMapsApiKey: 'TU_CLAVE_DE_API_DE_GOOGLE_MAPS',
};

// ============================================
// PRODUCCIÓN
// ============================================
// Archivo: environment.production.ts
// Uso: ng build --configuration production
export const productionEnvironment = {
    baseUrl: 'https://tu-dominio-produccion.com/api/v1',  // Cambiar por tu dominio real
    baseUrlAlt: 'https://tu-dominio-produccion.com/',
    production: true,
    googleMapsApiKey: 'TU_CLAVE_DE_API_DE_GOOGLE_MAPS',
};
