#!/bin/bash
# Script para actualizar la invitacion desde GitHub
# Ejecutar en el servidor donde corre Dockge

REPO_PATH="/mnt/Respaldos/data/respaldos/invitacion-reyna"

echo "==> Descargando cambios de GitHub..."
cd "$REPO_PATH" && git pull origin main

echo "✓ Actualización completada. Los cambios ya están activos en el sitio."
