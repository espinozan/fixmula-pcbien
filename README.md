
```markdown
# fixmula-pcbien.bat: Simulador de Reparación Exitosa de PC

**fixmula-pcbien.bat** es un script en **Batch** diseñado para simular una reparación exitosa de una computadora. El script presenta un proceso interactivo con mensajes técnicos de diagnóstico y reparación que sugieren que el sistema está siendo arreglado exitosamente. Además, ejecuta varios comandos de bajo nivel de forma inofensiva para dar la sensación de que el sistema está siendo revisado y optimizado.

---

## 🖥️ **Características**

- **Simulación de reparación exitosa:** Muestra mensajes que indican que el sistema se está reparando correctamente.
- **Comandos técnicos en ventanas adicionales:** Ejecuta comandos como `netstat`, `tree`, `tasklist`, etc., en ventanas CMD secundarias para generar una sensación de análisis activo.
- **Progreso continuo:** El script está diseñado para ejecutarse durante un largo período (más de 4 horas) para simular una intervención técnica completa.
- **Pantalla principal inmersiva:** Se ejecuta en modo pantalla completa para proporcionar una experiencia profesional.
- **Interactividad:** El script abre nuevas ventanas CMD con comandos aleatorios de forma periódica para mantener la inmersión.

---

## 🚀 **Cómo Usarlo**

1. **Descargar el archivo:** Obtén el archivo `fixmula-pcbien.bat` desde este repositorio.
2. **Ejecutar el script:**
   - Haz clic derecho en el archivo y selecciona **Ejecutar como administrador**.
   - Esto garantiza que el script pueda ejecutar todos los comandos necesarios correctamente.
3. **Simulación de reparación:**
   - El script comenzará mostrando mensajes que indican que el sistema se está reparando de manera exitosa.
   - Se abrirán ventanas adicionales de CMD para simular comandos de diagnóstico y optimización del sistema.

---

## 🔧 **Personalización**

### Cambiar mensajes de reparación
Puedes personalizar los mensajes que indican que el sistema está siendo arreglado:
```batch
set "mensajes_reparacion=Comprobando sistema de archivos;Corriendo herramientas de optimización;Reparación de red completada;Verificando registros de seguridad;Restaurando archivos críticos;Reparación exitosa completada"
```

### Personalizar comandos de las ventanas secundarias
Puedes modificar los comandos que se ejecutan en las ventanas CMD adicionales:
```batch
set "comandos_aleatorios=netstat -ano;tree;tasklist;ipconfig;ping localhost;dir"
```

### Configurar la duración de la ejecución
Puedes ajustar el tiempo entre cada ciclo de simulación:
```batch
timeout /t 60 >nul
```

---

## ⚠️ **Advertencias**

- Este script es **completamente inofensivo** y no realiza cambios reales en el sistema.
- **Uso responsable:** Está diseñado solo para simulaciones y demostraciones técnicas.
- **No engañar con fines malintencionados:** Usa el script solo en un entorno controlado donde tengas permiso para ejecutar este tipo de simulaciones.

---

## 📂 **Estructura del Código**

### Funciones principales del script:

1. **Generación de mensajes de progreso:** 
   Muestra mensajes de diagnóstico y reparación:
   ```batch
   echo Reparación de disco en curso...
   echo Reparación exitosa completada.
   ```

2. **Apertura de ventanas CMD secundarias:**
   Ejecuta comandos inofensivos de diagnóstico:
   ```batch
   start "Reparando red" cmd /c "color 0a & netstat -ano & timeout /t 10 >nul"
   start "Verificando archivos" cmd /c "color 0f & tree & timeout /t 10 >nul"
   ```

3. **Pantalla completa:**
   Hace que el script se ejecute en pantalla completa para dar una sensación más profesional:
   ```batch
   powershell -Command "& {Add-Type -Name WinAPI -Namespace Win32 -MemberDefinition '[DllImport(\"user32.dll\")]\public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow); [DllImport(\"user32.dll\")]\public static extern IntPtr GetConsoleWindow();' -PassThru | Out-Null; $consolePtr = [Win32.WinAPI]::GetConsoleWindow(); [Win32.WinAPI]::ShowWindowAsync($consolePtr, 3)}"
   ```

---

## 📜 **Licencia**

Este proyecto está bajo la licencia MIT. Consulta el archivo [LICENSE](LICENSE) para más información.

---

## 📧 **Contacto**

- **Autor:** Nahuel Espinoza  
- **LinkedIn:** [Nahuel Espinoza](https://www.linkedin.com/in/nahuel-espinoza)

---

