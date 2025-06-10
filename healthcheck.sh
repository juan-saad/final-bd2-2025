#!/bin/bash

echo "Password: $MSSQL_SA_PASSWORD"

sqlcmd -S localhost -U SA -P "$MSSQL_SA_PASSWORD" -N -C -Q "SELECT 1"
RESULT=$?
echo "sqlcmd exit code: $RESULT"
if [ $RESULT -eq 0 ]; then
    echo "✅ SQL Server is healthy"
    exit 0
else
    echo "❌ SQL Server is unhealthy"
    exit 1
fi
