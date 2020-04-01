USE [DirectMarketing]
GO

/****** Object:  Schema [DirectMarketing]    Script Date: 01-04-2020 07:24:13 PM ******/
CREATE SCHEMA [DirectMarketing]
GO


Create table DirectMarketing.Competitors(CompetitorId int primary key identity(1,1),ComprtitorName varchar(50) Not null,
CompatitorLocation varchar(50) not null,CompatitorNetWorth int not null,CompatitorStatus bit null);Go


Create table DirectMarketing.TvAdvertisements(TvAddId int primary key identity(1,1),TvAddType varchar(50) not null,
TvAddDuretion Date not null,TvAddPrice int not null,TvAddStatus bit null,TvAddChannel varchar(50) null);Go

create table DirectMarketing.CampaignResponses(CampaignId int primary key identity(1,1),CampaignName VARCHAR(50) NOT NULL,
CampaignLocation VARCHAR(50) NOT NULL,StartDate DATETIMEOFFSET(7) NOT NULL,EndDate DATETIMEOFFSET(7) NOT NULL,
CampaignStatus bit NOT NULL,CampaignProfit money not null,CampaignInvest money not null);Go