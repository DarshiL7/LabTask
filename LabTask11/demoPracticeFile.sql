use StudentsDb
go

create trigger tr_insert
on dbo.StudentInfo
after insert as 
begin
	set nocount on;
	insert into StudentInfo(StudentId,name)
	select i.StudentId,i.name from inserted as i;
end;

insert into StudentInfo (StudentId,name) values (14,'xyz');

select * from StudentInfo;

create trigger tr_delete
on dbo.StudentInfo
after delete as
begin
	declare @StudentId int;
	declare @name varchar(50);
	set nocount on;
	update p set p.name=@name
	from StudentInfo as p
	where exists(select * from deleted as d where p.StudentId=d.StudentId);
end;
go

update StudentInfo set name='DKK' where StudentId=2;

delete StudentInfo where StudentId=3;

select * from StudentInfo;

select * from OldValues;



alter trigger tr_delete_insertTempDb
on dbo.StudentInfo
after delete as
begin
	declare @StudentId int;
	declare @name varchar(50);
	set nocount on;
	select * from inserted;
	select @StudentId=StudentId,@name=name from deleted;
	insert into OldValues values(@StudentId,@name) 
	
end;
go

create trigger tr_insert_instedof
on dbo.StudentInfo
after insert as 
begin
	set nocount on;
	insert into StudentInfo(StudentId,name)
	select i.StudentId,i.name from inserted as i;
end;
