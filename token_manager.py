import os
from datetime import datetime, timedelta
import sys

# Recuperar token desde secrets de GitHub
LICENSE_TOKEN = os.getenv("LICENSE_TOKEN")
CLIENT_TYPE = os.getenv("CLIENT_TYPE", "PYMES")

# Configuración de caducidad según tipo de cliente
EXPIRATION_DAYS = {
    "PYMES": 30,
    "Empresa": 60,
    "Organización": 90,
    "Cooperativa": 120
}

# Base de datos de tokens válidos (puede ser reemplazada por un archivo seguro o DB)
VALID_TOKENS = {
    "TOKEN123ABC": "2025-10-14",  # fecha de creación del token
    "TOKEN456DEF": "2025-10-01"
}

def validate_token(token, client_type):
    if token not in VALID_TOKENS:
        print(f"[ERROR] Token inválido: {token}")
        return False

    created_str = VALID_TOKENS[token]
    created_date = datetime.strptime(created_str, "%Y-%m-%d")
    expiration = created_date + timedelta(days=EXPIRATION_DAYS.get(client_type, 30))
    
    if datetime.now() > expiration:
        print(f"[ERROR] Token caducado para cliente {client_type}. Expiró el {expiration.date()}")
        return False
    
    print(f"[OK] Token válido para cliente {client_type}. Válido hasta {expiration.date()}")
    return True

if __name__ == "__main__":
    success = validate_token(LICENSE_TOKEN, CLIENT_TYPE)

    # Escribir log de validación
    log_file = f"workflow_token_log_{datetime.now().strftime('%Y%m%d_%H%M%S')}.txt"
    with open(log_file, "w") as f:
        f.write(f"Token: {LICENSE_TOKEN}\n")
        f.write(f"Cliente: {CLIENT_TYPE}\n")
        f.write(f"Validación: {'OK' if success else 'FAIL'}\n")
        f.write(f"Fecha: {datetime.now()}\n")

    # Salir con código 1 si el token es inválido (fallo workflow)
    if not success:
        sys.exit(1)
