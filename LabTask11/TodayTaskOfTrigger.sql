
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
alter trigger tr_updateviews 
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
	--UPDATE StudentInfo set name=@name where StudentId=@StudentId;
	--UPDATE Subjects set SubName=@SubName where StudentId=@StudentId;
	Update vDetails set name=@name where StudentId=@StudentId
	Update vDetails set SubName=@SubName where StudentId=@StudentId
    -- Insert statements for trigger here

END
GO

update vDetails set name='fghjhfg' ,SubName='qwerwee' where StudentId=2

select * from vDetails

select * from StudentInfo

select * from Subjects



alter view vDetails as
SELECT dbo.StudentInfo.name, dbo.Subjects.SubName, dbo.StudentInfo.StudentId
FROM StudentInfo ,Subjects where dbo.StudentInfo.StudentId=Subjects.StudentId