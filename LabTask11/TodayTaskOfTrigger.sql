-- ================================================
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create trigger tr_updateviews 
   ON  vDetails 
   instead of update as
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	declare @name varchar(50);
	declare @SubName varchar(50);
	declare @StudentId int;
	declare @SubId int;
	select @SubName=SubName from inserted
	select @StudentId=StudentId from inserted
	select @name=name from inserted
	UPDATE StudentInfo set name=@name where StudentId=@StudentId;
	UPDATE Subjects set SubName=@SubName where StudentId=@StudentId;
    -- Insert statements for trigger here

END
GO

update vDetails set name='darshil' ,SubName='guj' where StudentId=1

select * from vDetails

select * from StudentInfo

select * from Subjects