#!/bin/bash
set -e 


yarn install




rm -f /myapp/tmp/pids/server.pid


# Verifica se há migrações pendentes e as executa
echo "Verificando e aplicando migrações pendentes..."

# Verifica se há migrações pendentes
if rails db:migrate:status | grep -q "down"; then
  echo "Existem migrações pendentes. Executando..."
  # Executa as migrações pendentes
  rails db:migrate
else
  echo "Nenhuma migração pendente."
fi

# RUN MAIN PROCESS
exec "$@"   