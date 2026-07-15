# Guía de Implementación - Sistema de Alerta de Emergencia

## Resumen de Cambios

Se ha creado un sistema completo para guardar ubicaciones de emergencia en la base de datos, con acceso desde el panel de administración web.

---

## BACKEND (Python + FastAPI) ✅ COMPLETADO

### 1. Modelo (`backend/models/emergency_alert.py`)
- Tabla `emergency_alerts` con campos: id, user_id, latitude, longitude, description, device_name, status, created_at, updated_at
- Relación N-1 con la tabla users

### 2. Schema (`backend/schemas/emergency_alert.py`)
- EmergencyAlertStore: para crear nuevas alertas
- EmergencyAlertResponse: para las respuestas de la API
- EmergencyAlertUpdate: para actualizar estados

### 3. Controlador (`backend/controllers/emergency_alert.py`)
Endpoints disponibles:
- **POST** `/api/v1/emergency-alerts` - Crear nueva alerta de emergencia
- **GET** `/api/v1/emergency-alerts` - Listar todas las alertas (admin)
- **GET** `/api/v1/emergency-alerts/{alert_id}` - Obtener alerta específica
- **PATCH** `/api/v1/emergency-alerts/{alert_id}` - Actualizar estado de la alerta
- **DELETE** `/api/v1/emergency-alerts/{alert_id}` - Eliminar alerta

### 4. Actualizado
- `main.py`: Importaciones del modelo y router agregadas
- `models/user.py`: Relación con emergenciaAlerts agregada

---

## FRONTEND ANDROID (Kotlin) - INSTRUCCIONES

### PASO 1: Agregar Dependencias

Edita tu `build.gradle.kts` (Module: app) y agrega:

```gradle
dependencies {
    // Retrofit para llamadas HTTP
    implementation("com.squareup.retrofit2:retrofit:2.9.0")
    implementation("com.squareup.retrofit2:converter-gson:2.9.0")
    
    // OkHttp para logging
    implementation("com.squareup.okhttp3:okhttp:4.11.0")
    implementation("com.squareup.okhttp3:logging-interceptor:4.11.0")
    
    // Gson
    implementation("com.google.code.gson:gson:2.10.1")
}
```

Luego sincroniza el proyecto.

### PASO 2: Crear los Archivos de API

#### 2.1 Crea `api/ApiService.kt`
```kotlin
// Copiar contenido del archivo ANDROID_API_SERVICE.kt
```

#### 2.2 Crea `models/EmergencyAlertModels.kt`
```kotlin
// Copiar contenido del archivo ANDROID_MODELS.kt
```

#### 2.3 Crea `api/RetrofitClient.kt`
```kotlin
// Copiar contenido del archivo ANDROID_RETROFIT_CLIENT.kt
// ⚠️ IMPORTANTE: Cambiar BASE_URL por tu URL del backend
```

### PASO 3: Reemplazar HomeFragment.kt

Reemplaza el contenido completo de tu `HomeFragment.kt` con el archivo `ANDROID_HOME_FRAGMENT_MODIFIED.kt`

**Cambios principales realizados:**
1. Agregada la función `sendEmergencyLocationToBackend()`
2. Agregada la función `requestNewLocationForBackend()`
3. Agregada la función `sendAlertToBackend(latitude, longitude)`
4. modificada la función `executeEmergencyActions()` para llamar a `sendEmergencyLocationToBackend()`

### PASO 4: Agregar Permisos en AndroidManifest.xml

Asegúrate que estos permisos estén en tu `AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.SEND_SMS" />
<uses-permission android:name="android.permission.CALL_PHONE" />
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.RECORD_AUDIO" />
```

### PASO 5: Guardar el User ID

Cuando el usuario inicia sesión, guarda su ID en SharedPreferences:

```kotlin
val sharedPreferences = context.getSharedPreferences("UserPrefs", Context.MODE_PRIVATE)
sharedPreferences.edit().putInt("user_id", userId).apply()
```

Este ID se usa para enviar la alerta al backend.

### PASO 6: Configurar la URL del Backend

Edita `RetrofitClient.kt` y cambia:

```kotlin
private const val BASE_URL = "http://tu-backend-url.com"
```

Por tu URL real, por ejemplo:
- Desarrollo local: `http://192.168.1.100:8000`
- Producción: `https://tudominio.com`

---

## FLUJO COMPLETO

Cuando el usuario presiona el botón rojo:

1. **App Android**
   - Obtiene la ubicación actual
   - Envía un POST a `/api/v1/emergency-alerts` con latitud, longitud y ID del usuario
   - También envía alertas por SMS a contactos de emergencia

2. **Backend FastAPI**
   - Recibe la petición en el endpoint POST
   - Valida que el usuario existe
   - Guarda la alerta en la tabla `emergency_alerts`
   - Retorna confirmación

3. **Panel Admin (Frontend Angular)**
   - El admin puede ver todas las alertas de emergencia
   - Puede filtrar por usuario, fecha, estado
   - Puede hacer clic en la ubicación para ver en Google Maps
   - Marca las alertas como resueltas

---

## PRUEBA LOCAL

#### Backend (Crear tabla)
```bash
cd backend
python main.py
# La tabla se creará automáticamente
```

#### Test POST a través de curl:
```bash
curl -X POST "http://localhost:8000/api/v1/emergency-alerts" \
  -H "Content-Type: application/json" \
  -d '{
    "user_id": 1,
    "latitude": -17.8252,
    "longitude": -63.1687,
    "description": "Alerta de prueba",
    "device_name": "Xiaomi Mi 11"
  }'
```

---

## REQUISITOS EN LA APP WEB (Frontend Angular)

Para que el admin vea las alertas:

1. Crear una vista/componente para mostrar emergencias
2. Hacer GET a `/api/v1/emergency-alerts`
3. Mostrar un mapa con las ubicaciones
4. Permitir actualizar el estado

Ejemplo de componente a crear:
```typescript
// dashboard/services/emergency.service.ts
getEmergencyAlerts(): Observable<any> {
  return this.http.get('/api/v1/emergency-alerts');
}

updateAlert(alertId: number, status: string): Observable<any> {
  return this.http.patch(`/api/v1/emergency-alerts/${alertId}`, { status });
}
```

---

## TROUBLESHOOTING

### Error: "User ID not found in SharedPreferences"
- Asegúrate de guardar el ID cuando el usuario inicia sesión
- Verifica que la clave sea "user_id"

### Error: "Cannot connect to backend"
- Verifica que BASE_URL está correcta
- En emulador, usa `10.0.2.2` en lugar de `localhost`
- Para dispositivo físico, usa la IP de tu máquina

### Error: "Alerta no guardada en BD"
- Verifica que la tabla se creó (ejecuta migrations)
- Verifica que el user_id existe en la tabla users

---

## ESTRUCTURA FINAL

```
backend/
├── models/
│   └── emergency_alert.py ✅ CREADO
├── schemas/
│   └── emergency_alert.py ✅ CREADO
├── controllers/
│   └── emergency_alert.py ✅ CREADO
└── main.py ✅ ACTUALIZADO

android/
├── api/
│   ├── ApiService.kt
│   └── RetrofitClient.kt
├── models/
│   └── EmergencyAlertModels.kt
└── ui/inicio/
    └── HomeFragment.kt ✅ REEMPLAZAR
```

---

**¿Necesitas ayuda con la implementación en el frontend Angular para visualizar las alertas?**
