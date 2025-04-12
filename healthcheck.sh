#!/bin/bash
# healthcheck.sh
sqlcmd -S localhost -U SA -P "$MSSQL_SA_PASSWORD" -N -C -Q "SELECT 1" &>/dev/null
if [ $? -eq 0 ]; then
    echo "SQL Server is healthy"
    exit 0
else
    echo "SQL Server is unhealthy"
    exit 1
fi
