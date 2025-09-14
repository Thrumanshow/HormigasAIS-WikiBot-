--- a/README.md
+++ b/README.md
@@ -1,30 +1,50 @@
-# HormigasAIS-WikiBot
-Un bot de Discord enfocado en enlazar conocimiento colaborativo desde Wikipedia, con el estilo de la comunidad HormigasAIS.

---

### ¿Qué es HormigasAIS-WikiBot?
-HormigasAIS-WikiBot es un bot de Discord desarrollado en Python. Su propósito es ayudar a los miembros de nuestra comunidad a acceder rápidamente a contenidos relevantes de Wikipedia, fomentar el aprendizaje colectivo y fortalecer la automatización dentro del ecosistema digital de HormigasAIS.

--- 

### Licencia y Acceso

HormigasAIS-WikiBot requiere una **licencia válida** y un **token de acceso** para funcionar correctamente.  
El archivo **`LICENSE.md`** explica los niveles de licenciamiento, mientras que **`token_manager.py`** valida automáticamente tu token y habilita funciones según tu nivel:

- **Nivel Básico (gratuito)**: Funciones limitadas de consulta y supervisión.  
- **PYME**: Acceso completo a `barrera.js`, logs y algunas integraciones.  
- **Empresa / Organización**: Funcionalidades avanzadas y soporte prioritario.  
- **Cooperativa**: Acceso total y personalización del bot bajo acuerdo.

Para activar tu licencia, configura tu archivo `.env`:

```bash
export LICENSE_TOKEN=tu_token_aqui
export CLIENT_TYPE=PYME  # O el tipo de cliente que corresponda Cristhiam Quiñonez 

---
