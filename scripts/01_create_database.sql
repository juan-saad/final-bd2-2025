IF NOT EXISTS (
    SELECT name
    FROM sys.databases
    WHERE name = 'staging_2025_g01'
) BEGIN CREATE DATABASE staging_2025_g01;
END
GO