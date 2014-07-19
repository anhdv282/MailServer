create database MailServerDB
use MailServerDB

create table tblEvent
(
	eventId int primary key identity (1,1),
	title nvarchar(max),
	author nvarchar(100),
	content nvarchar(max),
	photo nvarchar(max),
	created date default getdate()
)

create table tblRole
(
	roleId int primary key identity (1,1),
	roleName nvarchar(10) unique
)

create table tblFeedback
(
	feedId int primary key identity (1,1),
	email nvarchar(max),
	title nvarchar(max),
	content nvarchar(max),
	created date default getdate()
)

create table tblAccount
(
	accId int primary key identity (1,1),
	roleId int foreign key references tblRole(roleId),
	emailId nvarchar(100) unique,
	pass nvarchar(100) not null,
	name nvarchar(100),
	[address] nvarchar(max),
	dob date,
	photo nvarchar(max),
	created date default getdate(),
	[status] int default 1
)

create table tblMail
(
	mailId int primary key identity (1,1),
	[subject] nvarchar(max),
	content nvarchar(max),
	created date default getdate(),
	[status] int default 1
)

create table tblAccountMail
(
	mailId int foreign key references tblMail(mailId),
	senderId int foreign key references tblAccount(accId),
	receiverId int foreign key references tblAccount(accId),
	primary key (mailId, senderId, receiverId)
)

create table tblCourse
(
	courseId int primary key identity (1,1),
	courseName nvarchar(100) unique,
	teacherId int foreign key references tblAccount(accId)
)

create table tblCourseStudent
(
	courseId int foreign key references tblCourse(courseId),
	studentId int foreign key references tblAccount(accId),
	primary key (courseId, studentId)
)

INSERT INTO tblRole(roleName) VALUES ('admin'),('staff'),('student')

INSERT INTO tblAccount(roleId,emailID,pass,name,[address],dob,photo,[status])
VALUES (1,'admin@fpt.com','admin','Administrator','Ha Noi','1990-02-28','avatar',1),
(2,'staff1@fpt.com','123456','Staff1','Hai Phong','1989-01-14','avatar2',1),
(2,'staff2@fpt.com','123456','Staff2','Ho Chi Minh','1988-09-28','avatar3',0),
(3,'student1@fpt.com','123456','Student1','Ha Noi','1993-04-25','avatar04',1),
(3,'student2@fpt.com','123456','Student2','Da Nang','1994-07-24','avatar5',0)

INSERT INTO tblEvent(title,author,content,photo,created)
VALUES ('Lorem ipsum dolor sit amet','Lorem ipsum dolor','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.','event1','2014-07-10'),
('Lorem ipsum dolor sit amet','Lorem ipsum dolor','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.','event2','2014-07-11'),
('Lorem ipsum dolor sit amet','Lorem ipsum dolor','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.','event3','2014-07-12'),
('Lorem ipsum dolor sit amet','Lorem ipsum dolor','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.','event4','2014-07-13'),
('Lorem ipsum dolor sit amet','Lorem ipsum dolor','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.','event5','2014-07-14'),
('Lorem ipsum dolor sit amet','Lorem ipsum dolor','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.','event6','2014-07-15'),
('Lorem ipsum dolor sit amet','Lorem ipsum dolor','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.','event7','2014-07-16'),
('Lorem ipsum dolor sit amet','Lorem ipsum dolor','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.','event8','2014-07-17'),
('Lorem ipsum dolor sit amet','Lorem ipsum dolor','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.','event9','2014-07-18')

go

create proc CheckLogin
@emailId nvarchar(100),
@pass nvarchar(100)
as
select A.accId, R.roleName, A.emailId, A.pass, A.name, A.[address], A.dob, A.photo, A.created, A.[status]
from tblAccount as A join tblRole as R
on A.roleId = R.roleId
where A.emailId = @emailId and A.pass = @pass and A.[status] = 1

go

create proc InsertMail
@title nvarchar(100),
@content nvarchar(100)
as
insert tblMail([subject],content) values (@title, @content)
return @@IDENTITY

go

create proc SendMail
@mailId int,
@senderId int,
@receiverId int
as
insert tblAccountMail(mailId, senderId, receiverId) values (@mailId, @senderId, @receiverId)

go

create proc LoadSentMail
@senderId int
as
select tblAccountMail.mailId, [subject], content, created, [status]
from tblAccountMail join tblMail 
on tblAccountMail.mailId = tblMail.mailId
where senderId = @senderId
group by tblAccountMail.mailId, [subject], content, created, [status]
order by created desc

go

create proc LoadInboxMail
@receiverId int
as
select tblAccountMail.mailId, [subject], content , created, [status]
from tblAccountMail join tblMail 
on tblAccountMail.mailId = tblMail.mailId
where receiverId = @receiverId
group by tblAccountMail.mailId, [subject], content, created, [status]
order by created desc

go

create proc GetAllRole
as
select R.roleId, R.roleName
from tblRole as R

go

create proc GetAllAccount
as
select A.accId, R.roleName, A.emailId, A.pass, A.[address], A.dob, A.photo, A.created, A.[status]
from tblAccount as A join tblRole as R
on A.roleId = R.roleId

go

create proc GetAllStudent
as
select A.accId, R.roleName, A.emailId, A.pass, A.[address], A.dob, A.photo, A.created, A.[status]
from tblAccount as A join tblRole as R
on A.roleId = R.roleId
where R.roleId = 3

go

create proc GetAllStaff
as
select A.accId, R.roleName, A.emailId, A.pass, A.[address], A.dob, A.photo, A.created, A.[status]
from tblAccount as A join tblRole as R
on A.roleId = R.roleId
where R.roleId = 2

go

create proc CreateNewAccount
@roleId int,
@emailId int,
@pass nvarchar(100),
@name nvarchar(100),
@address nvarchar(100)
as
insert tblAccount(roleId, emailId, pass, name, [address]) values (@roleId, @emailId, @pass, @name, @address)

go 

create view Course
as
select C.courseId, C.courseName, C.teacherId, CS.studentId
from tblCourse as C join tblCourseStudent as CS
on C.courseId = CS.courseId

go
create proc GetStudentsByCourse
@courseId int
as
select AR.accId, AR.roleName, AR.emailId, AR.pass, AR.[address], AR.dob, AR.photo, AR.created, AR.[status]
from
(select A.accId, R.roleName, A.emailId, A.pass, A.[address], A.dob, A.photo, A.created, A.[status]
from tblRole as R join tblAccount as A
on R.roleId = A.roleId)
as AR  join Course as C
on AR.accId = C.studentId
where C.courseId = @courseId
