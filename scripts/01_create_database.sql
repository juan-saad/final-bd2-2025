PRINT 'Creating databases with suffix: $(Suffix)';

DECLARE @sql NVARCHAR(MAX);

IF NOT EXISTS (SELECT name
FROM sys.databases
WHERE name = 'bd_staging_2025_G$(Suffix)') 
BEGIN
    SET @sql = 'CREATE DATABASE [bd_staging_2025_G$(Suffix)]';
    EXEC(@sql);
END

IF NOT EXISTS (SELECT name
FROM sys.databases
WHERE name = 'bd_intermedia_2025_G$(Suffix)' ) 
BEGIN
    SET @sql = 'CREATE DATABASE [bd_intermedia_2025_G$(Suffix)]';
    EXEC(@sql);
END

IF NOT EXISTS ( SELECT name
FROM sys.databases
WHERE name = 'datawarehouse_2025_G$(Suffix)' ) 
BEGIN
    SET @sql = 'CREATE DATABASE [datawarehouse_2025_G$(Suffix)]';
    EXEC(@sql);
END

GO