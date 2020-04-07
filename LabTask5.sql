--create schema sales
create database AdvantureWorks;

Use AdvantureWorks
go
Create Table Sales.Mediaoutlet (
MediaoutletId int NOT NULL primary key IDENTITY(1,1),
MediaoutletName nvarchar(50),
PrimaryContact nvarchar (50),
City nvarchar (50)
);



CREATE TABLE Sales.PrintMediaPlacement( 
PrintMediaPlacementId int NOT NULL primary key IDENTITY(1,1),
MediaoutletId int,
PlacementDate datetime,
PublicationDate datetime,
RelatedProductId int,
PlacementCost decimal(18,2)
);

Alter Table Sales.Mediaoutlet drop PK__MEDIAOUT__120FD1D04F6EAE26


Alter Table Sales.Mediaoutlet ADD CONSTRAINT IX_Mediaoutlet UNIQUE CLUSTERED (
MediaoutletId);

Alter Table Sales.PrintMediaPlacement drop PK__PRINTMED__A5786DCA3F5641F9



CREATE CLUSTERED INDEX UCIX_PrintMediaPlacement 
ON Sales.PrintMediaPlacement (PrintMediaPlacementId);


CREATE NONCLUSTERED INDEX NCIX_PrintMediaPlacement_Name 
ON Sales.PrintMediaPlacement (PlacementDate);