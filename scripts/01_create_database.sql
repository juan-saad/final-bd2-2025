PRINT 'Creating databases with suffix: $(Suffix)';

DECLARE @sql NVARCHAR(MAX);

IF NOT EXISTS (SELECT name
FROM sys.databases
WHERE name = 'staging_2025_$(Suffix)') 
BEGIN
    SET @sql = 'CREATE DATABASE [staging_2025_$(Suffix)]';
    EXEC(@sql);
END

IF NOT EXISTS (SELECT name
FROM sys.databases
WHERE name = 'intermedia_2025_$(Suffix)' ) 
BEGIN
    SET @sql = 'CREATE DATABASE [intermedia_2025_$(Suffix)]';
    EXEC(@sql);
END

IF NOT EXISTS ( SELECT name
FROM sys.databases
WHERE name = 'datawarehouse_2025_$(Suffix)' ) 
BEGIN
    SET @sql = 'CREATE DATABASE [datawarehouse_2025_$(Suffix)]';
    EXEC(@sql);
END

GO