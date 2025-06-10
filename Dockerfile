# Use official SQL Server image
FROM mcr.microsoft.com/mssql/server:2022-latest@sha256:147ee765ff1db3b86ce6ec05908e51fd0dab2feda5dd85b2721f28c77ca305eb

# Create a working directory
WORKDIR /usr/src/app

# Copy entrypoint script and SQL scripts
COPY entrypoint.sh .
COPY healthcheck.sh .
COPY scripts/ ./scripts/

# Expose SQL Server port
EXPOSE 1433

# Set default suffix value
ENV DB_SUFFIX=01
ENV PATH="$PATH:/opt/mssql-tools18/bin"

# Use the entrypoint script to start SQL Server
ENTRYPOINT ["./entrypoint.sh", "$DB_SUFFIX"]
