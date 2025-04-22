# Use official SQL Server image
FROM mcr.microsoft.com/mssql/server:2022-latest@sha256:ea73825f3d88a23c355ac2f9fdc6bd960fec90171c12c572109b36a558f77bb8

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

# Use the entrypoint script to start SQL Server
ENTRYPOINT ["./entrypoint.sh", "$DB_SUFFIX"]
