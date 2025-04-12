#!/bin/bash
# Start SQL Server in the background
/opt/mssql/bin/sqlservr &

# Wait for SQL Server to start
until /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "$MSSQL_SA_PASSWORD" -N -C -Q "SELECT 1" &>/dev/null; do
    echo "⏳ Waiting for SQL Server to start..."
    sleep 1
done

echo "✅ SQL Server is up. Running initialization scripts..."

# Run initialization scripts (only if necessary)
for file in /usr/src/app/scripts/*.sql; do
    echo "▶️ Running $file"
    /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "$MSSQL_SA_PASSWORD" -N -C -i "$file" -v Suffix="$DB_SUFFIX"
done

echo "✅ Initialization complete. SQL Server is ready to use."

# Keep the container running
wait
