# HormigasAIS-WikiBot License

## 1. Propósito
HormigasAIS-WikiBot es un bot de Discord centrado en la automatización, gestión de contenidos y supervisión persistente en nuestro ecosistema digital.  
Este software requiere una licencia válida y un token de acceso para su funcionamiento completo.

## 2. Licencia y Token
Para activar el bot, debes poseer un **LICENSE_TOKEN** válido, que se valida mediante `token_manager.py`.  
El token asegura que solo usuarios autorizados puedan usar el software y sus funcionalidades avanzadas.

### Configuración del token:
En tu archivo `.env`:


### token_manager.py leerá este archivo y habilitará las funciones correspondientes según el nivel de licencia. 

3. Escalonamiento de licencias 

• Nivel 1 – Básico (gratuito): Acceso limitado a funciones de consulta y supervisión mínima. 

• Nivel 2 – PYME: Acceso completo a barrera.js y logs de actividad; permite integración con Slack y GitHub. 

• Nivel 3 – Empresa/Organización: Funcionalidades avanzadas, integraciones extendidas y prioridad en soporte técnico. 

• Nivel 4 – Cooperativa: Acceso completo a todos los módulos internos y posibilidad de personalización del bot bajo acuerdo. 

Cada token define el nivel de acceso automáticamente, gestionado por token_manager.py. 

4. Restricciones 

• El código fuente es público, pero el uso comercial está limitado a los niveles de licencia adquiridos. 

• Redistribución o venta sin licencia está prohibida. 

• Cualquier intento de manipulación del token o bypass será considerado violación de los términos de uso. 

5. Soporte y contacto 

Para consultas sobre licencias, soporte o información, contacta con el equipo de HormigasAIS:
Email: soporte@hormigasais.com
Canales oficiales de la comunidad: Discord, Slack. 

6. Términos legales 

• HormigasAIS S.A. mantiene todos los derechos de propiedad intelectual sobre HormigasAIS-WikiBot. 

• El usuario acepta que el software se utiliza bajo su propio riesgo y que HormigasAIS S.A. no se hace responsable por daños derivados del uso.

```bash
export LICENSE_TOKEN=tu_token_aqui
export CLIENT_TYPE=PYME  # O el tipo de cliente: Empresa, Organización, Cooperativa
