use master 
go

sp_configure;
GO
sp_configure 'show advanced options', 1;
GO
RECONFIGURE;
GO
sp_configure 'clr enabled', 1;

GO
sp_configure 'clr strict security', 1;
RECONFIGURE;
GO 