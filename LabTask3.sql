create database HumanResourcesDb;
GO
ALTER DATABASE HumanResourcesDb ADD FILEGROUP FG0
GO
ALTER DATABASE HumanResourcesDb ADD FILE (NAME = F0, FILENAME = 'D:\Labfiles\Lab03\SetupFiles\F0.ndf', SIZE = 3MB, FILEGROWTH = 50%) TO FILEGROUP FG0;
GO
ALTER DATABASE HumanResourcesDb ADD FILEGROUP FG1
GO
ALTER DATABASE HumanResourcesDb ADD FILE (NAME = F1, FILENAME = 'D:\Labfiles\Lab03\SetupFiles\F1.ndf', SIZE = 3MB, FILEGROWTH = 50%) TO FILEGROUP FG1;
GO
ALTER DATABASE HumanResourcesDb ADD FILEGROUP FG2
GO
ALTER DATABASE HumanResourcesDb ADD FILE (NAME = F2, FILENAME = 'D:\Labfiles\Lab03\SetupFiles\F2.ndf', SIZE = 3MB, FILEGROWTH = 50%) TO FILEGROUP FG2;
GO
ALTER DATABASE HumanResourcesDb ADD FILEGROUP FG3
GO
ALTER DATABASE HumanResourcesDb ADD FILE (NAME = F3, FILENAME = 'D:\Labfiles\Lab03\SetupFiles\F3.ndf', SIZE = 3MB, FILEGROWTH = 50%) TO FILEGROUP FG3;
GO

CREATE PARTITION FUNCTION pfHumanResourcesDates (datetime) 
AS RANGE RIGHT 
FOR VALUES ('2011-10-01 00:00','2012-01-01 00:00','2012-04-01 00:00');

CREATE PARTITION SCHEME psHumanResourcesDb 
AS PARTITION pfHumanResourcesDates TO (FG0, FG1, FG2, FG3);


CREATE TABLE TimeSheet (TimeSheetId int Identity(1,1), TimeSheetDate smalldatetime)  
    ON psHumanResources (TimeSheetDate) ;  
GO 

select * from TimeSheet;

SELECT $PARTITION.pfHumanResourcesDates('2012-01-01 00:00') FROM TimeSheet 

DECLARE @p int = $PARTITION.pfHumanResourcesDates('2012-01-06 00:00');
print(@p);
 

 CREATE TABLE TimeSheetStaging(
 RegisteredStartTime smalldatetime
 
) ON FG0


alter table TimeSheetStaging drop constraint CHK_datetime;

ALTER TABLE TimeSheetStaging
ADD CONSTRAINT CHK_date CHECK (RegisteredStartTime<'2015-02-07 00:00' and RegisteredStartTime>='2015-01-01 00:00');


DECLARE @p1 int = $PARTITION.pfHumanResourcesDates('2010-10-10 00:00');
print @p1;
ALTER TABLE TimeSheet
SWITCH PARTITION @p1 TO TimeSheetStaging;

select pstats.partition_number as PartitionNumber,
pstats.row_count as PartitionRowCount
from sys.dm_db_partition_stats as pstats where
pstats.object_id=OBJECT_ID('TimeSheet')
Order by PartitionNumber;