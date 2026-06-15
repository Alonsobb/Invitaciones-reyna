#!/bin/bash
# Script para actualizar la invitacion desde GitHub y redeployar

echo "==> Descargando cambios de GitHub..."
git pull origin main

echo "==> Reconstruyendo imagen Docker..."
docker compose build --no-cache

echo "==> Reiniciando contenedor..."
docker compose up -d

echo "✓ Actualización completada. Sitio disponible en http://localhost:8080"
