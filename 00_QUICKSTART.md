🚀 QUICK START - COMIENZA EN 5 MINUTOS
════════════════════════════════════════════════════════════════════════════════

█ ANTES DE NADA:
  Abre: 00_INDICE_ARCHIVOS.md
  ├─ Sabrás dónde está cada archivo
  └─ Es tu mapa del tesoro 🗺️

════════════════════════════════════════════════════════════════════════════════
█ PASO 1: VERIFICAR BACKEND ✅
════════════════════════════════════════════════════════════════════════════════

En PowerShell:
┌─────────────────────────────────────────────────────────────────────┐
│ cd "C:\Users\Daleska\OneDrive\Desktop\MAYPI_FINAL\backend"         │
│ python main.py                                                       │
└─────────────────────────────────────────────────────────────────────┘

✅ Si ves algo como:
   INFO:     Uvicorn running on http://127.0.0.1:8000
   
   ÉXITO: Backend está corriendo

❌ Si ves error:
   Ver: TROUBLESHOOTING en 00_RESUMEN_COMPLETO.md

════════════════════════════════════════════════════════════════════════════════
█ PASO 2: PROBAR ENDPOINT CON CURL ✅
════════════════════════════════════════════════════════════════════════════════

En otra ventana de PowerShell:
┌─────────────────────────────────────────────────────────────────────┐
│ curl -X POST "http://localhost:8000/api/v1/emergency-alerts" `     │
│   -H "Content-Type: application/json" `                            │
│   -d '{                                                            │
│     "user_id": 1,                                                  │
│     "latitude": -17.8252,                                          │
│     "longitude": -63.1687,                                         │
│     "description": "Prueba desde curl",                            │
│     "device_name": "Test Device"                                   │
│   }'                                                                │
└─────────────────────────────────────────────────────────────────────┘

✅ Si ves respuesta JSON con "message": "Alerta registrada..."
   ÉXITO: Backend acepta alertas

❌ Si ves "Usuario no encontrado"
   El user_id 1 debe existir en la tabla users

════════════════════════════════════════════════════════════════════════════════
█ PASO 3: ABRIR ANDROID STUDIO ✅
════════════════════════════════════════════════════════════════════════════════

1. Android Studio → Abre tu proyecto
2. Lee: PASO_A_PASO_ANDROID.txt (en este directorio)
3. Sigue EXACTAMENTE los 10 pasos

⚠️  PASOS CRÍTICOS:
    ✅ Paso 1: Agregar dependencias Gradle
    ✅ Paso 5: CAMBIAR BASE_URL en RetrofitClient.kt
    ✅ Paso 8: Guardar user_id en login

════════════════════════════════════════════════════════════════════════════════
█ PASO 4: COMPILAR ANDROID ✅
════════════════════════════════════════════════════════════════════════════════

En Android Studio:
┌─────────────────────────────────────────────────────────────────────┐
│ Build → Clean Project                                              │
│ Build → Rebuild Project                                            │
│ ▶ (Play button para ejecutar)                                     │
└─────────────────────────────────────────────────────────────────────┘

✅ Si compila sin errores y la app inicia
   ÉXITO: Android está listo

════════════════════════════════════════════════════════════════════════════════
█ PASO 5: PROBAR EN EMULADOR/DISPOSITIVO ✅
════════════════════════════════════════════════════════════════════════════════

1. Inicia sesión en la app (asegúrate que se guarde user_id)
2. Navega a HomeFragment
3. Presiona el botón rojo (redButton)
4. Otorga permisos de ubicación cuando pida
5. Espera 5-8 segundos

✅ Si ves Toast: "Alerta enviada al administrador"
   ÉXITO: Datos fueron al backend

═ Ver logs en Android Studio:
   View → Tool Windows → Logcat
   
   Buscar líneas:
   D/BACKEND_ALERT: Emergency alert sent successfully
   D/BACKEND_ALERT: Location sent: -17.8252, -63.1687

════════════════════════════════════════════════════════════════════════════════
█ PASO 6: VERIFICAR EN BASE DE DATOS ✅
════════════════════════════════════════════════════════════════════════════════

En terminal SQL (psql, mysql, sqlite, etc.):
┌─────────────────────────────────────────────────────────────────────┐
│ SELECT * FROM emergency_alerts;                                    │
└─────────────────────────────────────────────────────────────────────┘

✅ Si ves registros con latitud y longitud
   ÉXITO: Datos guardados en BD

Ejemplo de salida:
┌───┬────────┬──────────┬───────────┬──────────────┬────────────┐
│id │user_id │latitude  │longitude  │status        │created_at  │
├───┼────────┼──────────┼───────────┼──────────────┼────────────┤
│1  │1       │-17.8252  │-63.1687   │active        │2024-03-30  │
└───┴────────┴──────────┴───────────┴──────────────┴────────────┘

════════════════════════════════════════════════════════════════════════════════
█ PASO 7: IMPLEMENTAR ANGULAR (OPCIONAL) ✅
════════════════════════════════════════════════════════════════════════════════

Solo si quieres ver el dashboard admin:

1. Copia 4 archivos ANGULAR_*
   └─ Al directorio: src/app/modules/dashboard/
   
2. Lee: IMPLEMENTACION_ALERTA_EMERGENCIA.md
3. Sigue la sección "FRONTEND ANGULAR"

═ En terminal:
┌─────────────────────────────────────────────────────────────────────┐
│ cd frontend                                                         │
│ ng serve                                                            │
│ Abre http://localhost:4200/dashboard/emergency-alerts              │
└─────────────────────────────────────────────────────────────────────┘

✅ Si ves tabla con alertas
   ÉXITO: Sistema completo funcionando

════════════════════════════════════════════════════════════════════════════════

═══════════════════════════════════════════════════════════════════════════════
█ RESUMEN RÁPIDO
═══════════════════════════════════════════════════════════════════════════════

✅ Backend: python main.py
✅ Android: Copiar archivos → Compilar → Presionar botón rojo
✅ Base de datos: SELECT * FROM emergency_alerts;
✅ Angular: Opcional pero recomendado

════════════════════════════════════════════════════════════════════════════════

═══════════════════════════════════════════════════════════════════════════════
█ CHEQUEO FINAL
═══════════════════════════════════════════════════════════════════════════════

¿Completaste TODOS estos pasos?

1. [ ] Leí 00_INDICE_ARCHIVOS.md
2. [ ] Backend corriendo: python main.py
3. [ ] Probé con curl → Funcionó
4. [ ] Agregué dependencias Gradle
5. [ ] Creé directorios: api/, models/
6. [ ] Copié ANDROID_API_SERVICE.kt
7. [ ] Copié ANDROID_MODELS.kt
8. [ ] Copié ANDROID_RETROFIT_CLIENT.kt (+ CAMBIÉ BASE_URL)
9. [ ] Reemplacé HomeFragment.kt
10.[ ] Agregué permisos en AndroidManifest.xml
11.[ ] Guardé user_id en login
12.[ ] Compilé Android sin errores
13.[ ] Presioné botón rojo en la app
14.[ ] Vi alerta registrada en BD
15.[ ] (Opcional) Implementé dashboard Angular

Si TODOS los ☑ están marcados: ¡ÉXITO! 🎉

════════════════════════════════════════════════════════════════════════════════

═══════════════════════════════════════════════════════════════════════════════
█ ERRORES COMUNES Y SOLUCIONES
═══════════════════════════════════════════════════════════════════════════════

❌ "Cannot connect to server"
   ├─ BASE_URL está mal configurada
   ├─ Backend no está corriendo
   └─ Solución: Verifica python main.py está activo

❌ "User ID not found"
   ├─ No guardaste user_id en login
   └─ Solución: Agrega prefs.edit().putInt("user_id", userId).apply()

❌ "Build fails in Android Studio"
   ├─ Gradle no sincronizó
   └─ Solución: Build → Clean → Rebuild

❌ "No inserts in database"
   ├─ user_id no existe en tabla users
   ├─ Tabla no se creó
   └─ Solución: Verifica SELECT * FROM users; y SELECT * FROM emergency_alerts;

❌ "Android app closes after button press"
   ├─ Tienes un error en el código
   ├─ Verifica logcat (View → Tool Windows → Logcat)
   └─ Solución: Lee el error y busca en TROUBLESHOOTING

════════════════════════════════════════════════════════════════════════════════

═══════════════════════════════════════════════════════════════════════════════
█ DOCUMENTACIÓN COMPLETA
═══════════════════════════════════════════════════════════════════════════════

Si necesitas más detalles:

📄 00_RESUMEN_COMPLETO.md
   └─ Todo lo que se hizo y checklist completo

📄 PASO_A_PASO_ANDROID.txt
   └─ Tutorial visual para Android Studio (10 pasos exactos)

📄 ARQUITECTURA_SISTEMA.txt
   └─ Diagramas y flujo de datos

📄 IMPLEMENTACION_ALERTA_EMERGENCIA.md
   └─ Guía técnica detallada

════════════════════════════════════════════════════════════════════════════════

🎉 ¡LISTO!

Cuando todo funcione, tu sistema:
✅ Captura ubicación en Android
✅ Envía al backend
✅ Guarda en BD
✅ Admin ve en dashboard web

═══════════════════════════════════════════════════════════════════════════════
