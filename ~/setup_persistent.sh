#!/data/data/com.termux/files/usr/bin/bash
# setup_persistent.sh – barrera.js persistente y supervisado en Termux

# 1️⃣ Evitar que Termux se suspenda
echo "🔒 Activando wake lock para que Termux no se detenga..."
termux-wake-lock

# 2️⃣ Actualizar Termux
echo "🔄 Actualizando Termux..."
pkg update -y && pkg upgrade -y

# 3️⃣ Instalar Node.js LTS si no está
if ! command -v node &> /dev/null
then
    echo "📦 Node.js LTS no encontrado. Instalando..."
    pkg install nodejs-lts -y
fi

# 4️⃣ Ir al directorio del proyecto
PROJECT_DIR=~/Thrumanshow/HormigasAIS-WikiBot
mkdir -p "$PROJECT_DIR"
cd "$PROJECT_DIR" || { echo "❌ No se pudo acceder al directorio $PROJECT_DIR"; exit 1; }

# 5️⃣ Instalar dependencias Node.js
echo "📦 Instalando dependencias Node.js..."
npm install @slack/web-api node-fetch dotenv

# 6️⃣ Crear archivo de log si no existe
LOG_FILE=src/utils/barrera_log.txt
mkdir -p "$(dirname "$LOG_FILE")"
touch "$LOG_FILE"

# 7️⃣ Función para ejecutar y reiniciar barrera.js automáticamente
run_barrera() {
    while true
    do
        echo "🚀 Iniciando barrera.js..."
        node src/utils/barrera.js >> "$LOG_FILE" 2>&1
        echo "⚠️ barrera.js se detuvo. Reiniciando en 3 segundos..."
        sleep 3
    done
}

# 8️⃣ Ejecutar la función en segundo plano con nohup
nohup bash -c run_barrera >> "$LOG_FILE" 2>&1 &

# 9️⃣ Configurar arranque automático al iniciar Termux
BOOT_SCRIPT=~/.termux/boot.sh
mkdir -p ~/.termux
if ! grep -Fxq "bash ~/setup_persistent.sh" "$BOOT_SCRIPT" 2>/dev/null; then
    echo "bash ~/setup_persistent.sh" >> "$BOOT_SCRIPT"
fi
chmod +x "$BOOT_SCRIPT"

echo "✅ barrera.js ahora está supervisado y persistente en segundo plano."
echo "📄 Logs disponibles en $LOG_FILE"
