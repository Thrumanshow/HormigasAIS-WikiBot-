HormigasAIS-WikiBot 

Autor: Thrumanshow (Cristhiam Quiñonez)
Tecnologías: Python, discord.py, requests
Última actualización: Reciente (ver historial en GitHub) 

Descripción 

HormigasAIS-WikiBot es un bot desarrollado en Python para Discord, diseñado para facilitar la interacción con contenidos de Wikipedia o recursos internos de la comunidad HormigasAIS. El bot permite automatizar consultas y respuestas dentro de un servidor Discord, integrando funcionalidades útiles para la comunidad digital que busca conectar mente y máquina. 

Características principales 

• Interacción vía comandos en Discord. 

• Consulta y recuperación de información usando APIs. 

• Fácil de configurar y extender. 

• Automatización de tareas dentro del ecosistema HormigasAIS. 

Estructura del repositorio 

• bot.py: Código principal del bot. 

• requirements.txt: Dependencias necesarias para ejecutar el bot. 

• .gitignore: Archivos y carpetas ignorados en Git. 

• LICENSE: Licencia del proyecto. 

• HormigasAIS-WikiBot.zip: Archivo comprimido con versión empaquetada del bot. 

• .github/workflows/lint-discord-bot.yml: Workflow para integración continua (CI) y chequeo de calidad. 

Instalación y configuración 

• Clona el repositorio: 

bash 

CopiarEditar 

git clone https://github.com/Thrumanshow/HormigasAIS-WikiBot.git cd HormigasAIS-WikiBot 

• Crea un entorno virtual (opcional pero recomendado): 

bash 

CopiarEditar 

python -m venv env source env/bin/activate # Linux/macOS env\Scripts\activate # Windows 

• Instala las dependencias: 

bash 

CopiarEditar 

pip install -r requirements.txt 

• Configura el archivo .env con las variables necesarias (como token de Discord, URLs de APIs, etc). Asegúrate de que el .env no esté público para proteger tus credenciales. 

• Ejecuta el bot: 

bash 

CopiarEditar 

python bot.py 

Uso 

• El bot responde a comandos prefijados (configurar en bot.py o en .env). 

• Ideal para comunidades que usan Discord y requieren consultas rápidas a Wikipedia u otras fuentes. 

• Se puede extender para añadir nuevas funcionalidades específicas. 

Contribuciones 

¡Las contribuciones son bienvenidas! Puedes abrir issues o pull requests para proponer mejoras o corregir errores. 

Licencia 

Este proyecto está bajo la licencia especificada en el archivo LICENSE.

