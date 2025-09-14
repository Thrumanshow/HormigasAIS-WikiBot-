#!/bin/bash
# setup.sh – Script de inicialización para HormigasAIS-WikiBot en Termux

set -e  # Detener ejecución si hay errores

# === 1. Ir al directorio del proyecto ===
echo "📂 Entrando al repositorio HormigasAIS-WikiBot..."
cd ~/Thrumanshow/HormigasAIS-WikiBot

# === 2. Inicializar NodeJS si no existe package.json ===
if [ ! -f package.json ]; then
  echo "⚡ Creando package.json..."
  npm init -y
fi

# === 3. Instalar dependencias necesarias ===
echo "📦 Instalando dependencias..."
npm install @slack/web-api node-fetch dotenv

# === 4. Crear estructura de directorios si no existe ===
echo "📂 Creando estructura src/utils..."
mkdir -p src/utils

# === 5. Crear archivo barrera.js con contenido actualizado ===
cat > src/utils/barrera.js << 'EOF'
/**
 * barrera.js
 * - Registra intentos de acción en un log local
 * - Envía notificaciones a Slack (Webhook o Bot Token)
 * - Compatible con NodeJS / Termux 16
 */

const fs = require('fs');
const path = require('path');
const { WebClient } = require('@slack/web-api');
const fetch = require('node-fetch'); 
require('dotenv').config();

// Rutas y variables
const LOG_PATH = path.join(__dirname, 'barrera_log.txt');
const SLACK_WEBHOOK = process.env.SLACK_WEBHOOK_URL || '';
const SLACK_BOT_TOKEN = process.env.SLACK_BOT_TOKEN || '';
const SLACK_CHANNEL = process.env.SLACK_CHANNEL || '#general';

// Inicializar cliente Slack si hay BOT_TOKEN
let slackClient = null;
if (SLACK_BOT_TOKEN) {
  slackClient = new WebClient(SLACK_BOT_TOKEN);
}

/** Escribe log local */
function writeLog(message) {
  const entry = [
    '=== BLOQUEO DE ACCIÓN ===',
    message,
    \`Timestamp: \${new Date().toISOString()}\`,
    '=========================\\n'
  ].join('\\n');
  try {
    fs.appendFileSync(LOG_PATH, entry);
  } catch (e) {
    console.error('Error escribiendo log:', e.message);
  }
}

/** Envía notificación a Slack */
async function notifySlack(text) {
  const payload = { text };
  try {
    if (slackClient) {
      await slackClient.chat.postMessage({ channel: SLACK_CHANNEL, text });
      console.log('✅ Notificación enviada a Slack (Bot Token).');
      return;
    }
    if (SLACK_WEBHOOK) {
      const res = await fetch(SLACK_WEBHOOK, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload)
      });
      if (res.ok) {
        console.log('✅ Notificación enviada a Slack (Webhook).');
        return;
      } else {
        console.error('❌ Slack webhook respondió status', res.status);
      }
    }
    console.warn('⚠️ No se configuró Slack (WEBHOOK ni BOT_TOKEN).');
  } catch (err) {
    console.error('❌ Error notificando a Slack:', err.message);
  }
}

/** Función pública para registrar intento */
async function registrarIntento(mensaje) {
  writeLog(mensaje);
  console.log('\\n' + '=== BLOQUEO DE ACCIÓN ===\\n' + mensaje + '\\nTimestamp: ' + new Date().toISOString() + '\\n=========================\\n');
  await notifySlack(\`🚨 Acción bloqueada: \${mensaje}\`);
}

/** Función principal de barrera */
function barrera(make) {
  if (make) {
    registrarIntento('decromatiza');
    return false;  // Acción bloqueada
  }
  return true;   // Acción permitida
}

module.exports = barrera;

/** Ejemplo de prueba rápido */
(async () => {
  console.log("🚀 Simulando llamada a barrera...");
  const allowed = await barrera(true);
  console.log("Resultado:", allowed ? "Permitido" : "Bloqueado");
})();
EOF

# === 6. Mensaje final ===
echo "✅ Setup completo. Para probar ejecuta:"
echo "   node src/utils/barrera.js"
