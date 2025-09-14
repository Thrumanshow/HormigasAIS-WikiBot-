--- a/README.md
+++ b/README.md
@@ -1,30 +1,50 @@
-# HormigasAIS-WikiBot
-Un bot de Discord enfocado en enlazar conocimiento colaborativo desde Wikipedia, con el estilo de la comunidad HormigasAIS.
-
-### ¿Qué es HormigasAIS-WikiBot?
-HormigasAIS-WikiBot es un bot de Discord desarrollado en Python. Su propósito es ayudar a los miembros de nuestra comunidad a acceder rápidamente a contenidos relevantes de Wikipedia, fomentar el aprendizaje colectivo y fortalecer la automatización dentro del ecosistema digital de HormigasAIS.
-
-Este bot nace como parte de una iniciativa educativa y de innovación tecnológica, dirigida por @Thrumanshow Cristhiam Quiñonez, diseñador gráfico, autodidacta en desarrollo web y fundador del proyecto HormigasAIS.
-
-### Características
-Comandos personalizados para compartir desafíos y recursos educativos.
-Búsqueda inteligente de artículos de Wikipedia.
-Mensajes automáticos con estilo visual y control de menciones.
-Integración pensada para crecer con GitHub, Slack y otras plataformas.
-Control de licencias mediante token único, validado automáticamente.
-
-### Licencia y Token de Acceso
-
-```bash
-export LICENSE_TOKEN=tu_token_aquí
-export CLIENT_TYPE=PYME # Ajusta según tu tipo de cliente: PYME, Empresa, Organización, Cooperativa
-```
+## HormigasAIS-WikiBot
+
+Un bot de Discord centrado en la **automatización, la gestión de contenidos y la interacción** en la comunidad de **HormigasAIS**. Este proyecto es una pieza clave de nuestra infraestructura digital, diseñada para ser flexible y escalable.
 
-
+---
+
+### Lo que hace HormigasAIS-WikiBot
+
+Este bot no es solo una herramienta, es un **gestor de automatización** para nuestro ecosistema digital. Su propósito principal es facilitar la distribución y gestión de contenido, mejorando la interacción y la experiencia de los miembros de la comunidad.
+
+La innovación clave es la implementación de **`barrera.js`**, un motor de procesamiento que actúa como el núcleo de las operaciones del bot, garantizando una **comunicación fluida y segura** entre las plataformas.
+
+---
+
+### Características Destacadas
+
+* **Motor de Barrera (`barrera.js`)**: Una solución personalizada para la **integración de datos y la supervisión de procesos**.
+* **Gestión de Licencias**: El bot utiliza un sistema de **licenciamiento basado en tokens** para su activación y uso, asegurando que solo los usuarios autorizados tengan acceso a sus funciones.
+* **Diseño Modular**: El código está estructurado para permitir una fácil expansión con nuevas funcionalidades.
+* **Procesos Persistentes**: Gracias a un sistema de supervisión integrado, el bot se mantiene en ejecución de forma persistente.
+
+---
+
+### El Sistema de Licenciamiento
+
+Este software requiere una **licencia válida y un token de acceso** emitido por **HormigasAIS S.A.** para su funcionamiento. Aunque el código fuente es público, el uso y la redistribución están restringidos por los términos de nuestra licencia.
+
+Si tienes una licencia, configura el archivo `.env` con tu `LICENSE_TOKEN` y tu tipo de cliente (`CLIENT_TYPE`).
+
+```bash
+export LICENSE_TOKEN=tu_token_aqui
+export CLIENT_TYPE=PYME # O el tipo de cliente que corresponda
+```
+
+Para más detalles sobre los términos de uso, consulta el archivo **LICENSE.md**.
+
+---
+
+### Estructura de Archivos
+
+* **`src/utils/barrera.js`**: El corazón del proyecto.
+* **`setup_persistent.sh`**: El script de Termux para la supervisión con `PM2`.
+* **`bot.py`**: El archivo principal que gestiona las interacciones de Discord.
+* **`token_manager.py`**: Se encarga de la validación del token.
+* **`LICENSE.md`**: El acuerdo de licencia.
+
+---
+
+### Instalación y Puesta en Marcha
+
+Para usuarios con licencia, sigue estos pasos:
+
+1. **Clona el repositorio:**
+ ```bash
+ git clone [https://github.com/Thrumanshow/HormigasAIS-WikiBot-.git](https://github.com/Thrumanshow/HormigasAIS-WikiBot-.git)
+ cd HormigasAIS-WikiBot-
+ ```
+
+2. **Ejecuta el script de instalación y supervisión:**
+ ```bash
+ bash setup_persistent.sh
+ ```
+
+---
+
+### Contribuciones
+
+Actualmente, no se aceptan contribuciones externas de código. El desarrollo es gestionado internamente por el equipo de HormigasAIS S.A.
+
+---
+
+### Contacto
+
+Para consultas sobre licencias, soporte o información, contacta con nosotros a través de los canales de la comunidad HormigasAIS.
