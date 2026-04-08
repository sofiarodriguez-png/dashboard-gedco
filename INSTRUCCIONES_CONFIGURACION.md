# 📋 Instrucciones de Configuración - Dashboard GEDCO

## ✅ Lo que ya está configurado:

1. ✅ Repositorio GitHub creado: https://github.com/sofiarodriguez-png/dashboard-gedco
2. ✅ GitHub Pages habilitado
3. ✅ Dashboard publicado en: **https://sofiarodriguez-png.github.io/dashboard-gedco/**
4. ✅ Scripts de actualización creados

## 🔧 Configuración Final: Actualización Automática Cada 6 Horas

### Opción 1: Importar Tarea Programada (Recomendada)

1. Presiona `Win + R` y escribe: `taskschd.msc` y presiona Enter
2. En el panel derecho, haz clic en "Importar tarea..."
3. Navega a: `C:\Users\sorodriguez\dashboard-gedco-github\tarea_programada.xml`
4. Selecciona el archivo y haz clic en "Abrir"
5. En la ventana que aparece:
   - Verifica que el nombre sea: "Dashboard GEDCO - Actualización Automática"
   - Ve a la pestaña "Desencadenadores" y verifica que diga "Cada 6 horas"
   - Ve a la pestaña "Acciones" y verifica la ruta del .bat
   - Haz clic en "Aceptar"
6. ✅ ¡Listo! El dashboard se actualizará automáticamente cada 6 horas

### Opción 2: Crear Manualmente la Tarea

1. Presiona `Win + R` y escribe: `taskschd.msc` y presiona Enter
2. Haz clic en "Crear tarea básica..."
3. Nombre: `Dashboard GEDCO - Actualización Automática`
4. Descripción: `Actualiza el dashboard cada 6 horas`
5. Desencadenador: Selecciona "Diariamente"
6. Hora de inicio: `08:00:00`
7. Acción: "Iniciar un programa"
8. Programa: `C:\Users\sorodriguez\dashboard-gedco-github\actualizar_dashboard.bat`
9. En "Opciones avanzadas" marca:
   - ✅ Repetir la tarea cada: `6 horas`
   - ✅ Durante: `Indefinidamente`
10. ✅ Finaliza y acepta

### Opción 3: Actualización Manual

Si prefieres actualizar manualmente el dashboard cuando lo necesites:

1. Abre una terminal en: `C:\Users\sorodriguez\dashboard-gedco-github`
2. Ejecuta: `actualizar_dashboard.bat`
3. El dashboard se actualizará y publicará en GitHub Pages automáticamente

## 🧪 Probar la Actualización Ahora

Para verificar que todo funciona correctamente:

```bash
cd C:\Users\sorodriguez\dashboard-gedco-github
actualizar_dashboard.bat
```

Deberías ver:
```
[1/3] Generando dashboard actualizado...
[OK] Dashboard generado exitosamente
[2/3] Haciendo commit de cambios...
[OK] Commit realizado
[3/3] Subiendo a GitHub...
[OK] Dashboard publicado en GitHub Pages
```

Luego ve a: https://sofiarodriguez-png.github.io/dashboard-gedco/ (puede tardar 1-2 minutos en actualizarse)

## 📊 URLs Importantes

- **Dashboard Público**: https://sofiarodriguez-png.github.io/dashboard-gedco/
- **Repositorio GitHub**: https://github.com/sofiarodriguez-png/dashboard-gedco
- **Carpeta Local**: C:\Users\sorodriguez\dashboard-gedco-github

## 🔍 Verificar que la Tarea Programada Funciona

1. Abre el Programador de tareas (`taskschd.msc`)
2. Busca: "Dashboard GEDCO - Actualización Automática"
3. Haz clic derecho → "Ejecutar" para probar manualmente
4. Revisa la pestaña "Historial" para ver las ejecuciones

## ⚠️ Notas Importantes

- **Tu PC debe estar encendida** para que la actualización automática funcione
- La primera actualización será a las 08:00 AM, luego cada 6 horas (08:00, 14:00, 20:00, 02:00)
- Los cambios en GitHub Pages pueden tardar 1-2 minutos en reflejarse
- El dashboard usa tus credenciales de BigQuery actuales (sofia.rodriguez@mercadolibre.com)

## 🐛 Solución de Problemas

### El dashboard no se actualiza

1. Verifica que la tarea programada esté habilitada en Task Scheduler
2. Revisa que tu PC tenga conexión a internet
3. Ejecuta manualmente `actualizar_dashboard.bat` para ver si hay errores

### Error "Permission denied" al hacer push

- Tu token de GitHub puede haber expirado
- Contacta para regenerar el token

### Error al conectar con BigQuery

- Verifica que estés autenticada: `gcloud auth list`
- Re-autentica si es necesario: `gcloud auth login`

## 📞 Soporte

Si tienes problemas, puedes:
1. Ejecutar manualmente `actualizar_dashboard.bat` para ver el error completo
2. Revisar los logs en el Programador de tareas
3. Contactar para ayuda adicional

---

**¡Tu dashboard está listo y público! 🎉**

Comparte esta URL con tu equipo:
👉 **https://sofiarodriguez-png.github.io/dashboard-gedco/**
