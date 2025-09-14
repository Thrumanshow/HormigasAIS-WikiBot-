#!/data/data/com.termux/files/usr/bin/bash
# setup_wikibot.sh – Script persistente para HormigasAIS-WikiBot en Termux

echo "🔒 Activando wake lock para que Termux no se detenga..."
termux-wake-lock

echo "🔄 Actualizando Termux..."
pkg update -y && pkg upgrade -y

# Instalar Node.js LTS si no está presente
if ! command -v node &> /dev/null
then
    echo "📦 Node.js LTS no encontrado. Instalando..."
    pkg install nodejs-lts -y
fi

# Instalar git si no está presente
if ! command -v git &> /dev/null
then
    echo "📦 Git no encontrado. Instalando..."
    pkg install git -y
fi

# Clonar o actualizar el repositorio
PROJECT_DIR=~/downloads/HormigasAIS-WikiBot
if [ ! -d "$PROJECT_DIR" ]; then
    git clone https://github.com/Thrumanshow/HormigasAIS-WikiBot.git "$PROJECT_DIR"
else
    cd "$PROJECT_DIR"
    git pull
fi

cd "$PROJECT_DIR" || { echo "❌ No se pudo acceder al directorio $PROJECT_DIR"; exit 1; }

# Instalar dependencias Node.js
echo "📦 Instalando dependencias Node.js..."
npm install @slack/web-api node-fetch dotenv

# Crear archivo de log si no existe
LOG_FILE=src/utils/barrera_log.txt
mkdir -p "$(dirname "$LOG_FILE")"
touch "$LOG_FILE"

# Función para ejecutar y reiniciar barrera.js automáticamente
run_barrera() {
    while true
    do
        echo "🚀 Iniciando barrera.js..."
        node src/utils/barrera.js >> "$LOG_FILE" 2>&1
        echo "⚠️ barrera.js se detuvo. Reiniciando en 3 segundos..."
        sleep 3
    done
}

# Ejecutar en segundo plano con nohup
nohup bash -c run_barrera >> "$LOG_FILE" 2>&1 &

# Configurar auto-arranque en Termux
termux-job-scheduler \
  --script "$PROJECT_DIR/setup_wikibot.sh" \
  --period-ms 60000 \
  --persisted true

echo "✅ HormigasAIS-WikiBot ahora está supervisado y persistente."
echo "📄 Logs disponibles en $LOG_FILE"
