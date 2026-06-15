
#!/usr/bin/env bash
set -euo pipefail

REPO_PATH="/mnt/Respaldos/data/respaldos/invitacion-reyna"
BRANCH="main"
LOCK_FILE="/tmp/invitacion-reyna-update.lock"

# Evita ejecuciones simultaneas cuando cron dispara de nuevo antes de terminar.
exec 9>"$LOCK_FILE"
if ! flock -n 9; then
	echo "[$(date '+%F %T')] Ya hay una actualizacion en curso."
	exit 0
fi

echo "[$(date '+%F %T')] Iniciando actualizacion..."
cd "$REPO_PATH"

echo "[$(date '+%F %T')] Descargando cambios de GitHub..."
git fetch origin "$BRANCH"

LOCAL_COMMIT="$(git rev-parse HEAD)"
REMOTE_COMMIT="$(git rev-parse "origin/$BRANCH")"

if [ "$LOCAL_COMMIT" = "$REMOTE_COMMIT" ]; then
	echo "[$(date '+%F %T')] Sin cambios."
	exit 0
fi

echo "[$(date '+%F %T')] Aplicando cambios..."
git reset --hard "origin/$BRANCH"

echo "[$(date '+%F %T')] Actualizacion completada."
