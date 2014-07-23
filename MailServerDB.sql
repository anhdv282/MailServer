create database MailServerDB
use MailServerDB
drop database MailServerDB

create table tblEvent
(
	eventId int primary key identity (1,1),
	title nvarchar(max),
	author nvarchar(100),
	content nvarchar(max),
	photo nvarchar(max),
	created date default getdate(),
	[status] int default 0
)

create table tblFeedback
(
	feedId int primary key identity (1,1),
	email nvarchar(max),
	title nvarchar(max),
	content nvarchar(max),
	created date default getdate(),
	[status] int default 0
)

create table tblAccount
(
	emailId nvarchar(100) primary key,
	pass nvarchar(100) not null,
	accType nvarchar(10),
	changePass bit default 0,
	[status] int default 1
)

create table tblStudent
(
	studentId int primary key identity(1,1),
	emailId nvarchar(100) foreign key references tblAccount(emailId),
	name nvarchar(100),
	[address] nvarchar(max),
	dob date,
	photo nvarchar(max),
	created date default getdate(),
	[status] int default 1
)

create table tblStaff
(
	staffId int primary key identity(1,1),
	emailId nvarchar(100) foreign key references tblAccount(emailId),
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
	senderId nvarchar(100) foreign key references tblAccount(emailId),
	[subject] nvarchar(max),
	content nvarchar(max),
	created date default getdate(),
	[status] int default 1
)

create table tblMailDetail
(
	detailId int primary key identity (1,1),
	mailId int foreign key references tblMail(mailId),
	receiverId nvarchar(100)
)

create table tblCourse
(
	courseId int primary key identity (1,1),
	courseName nvarchar(100) unique,
	teacherId int foreign key references tblStaff(staffId)
)

create table tblCourseStudent
(
	courseId int foreign key references tblCourse(courseId),
	studentId int foreign key references tblStudent(studentId),
	primary key (courseId, studentId)
)

INSERT INTO tblAccount(emailID,pass,accType)
VALUES ('admin@fpt.com','admin','admin'),
('staff1@fpt.com','123456','staff'),
('staff2@fpt.com','123456','staff'),
('staff3@fpt.com','123456','staff'),
('staff4@fpt.com','123456','staff'),
('staff5@fpt.com','123456','staff'),
('staff6@fpt.com','123456','staff'),
('student1@fpt.com','123456','student'),
('student2@fpt.com','123456','student'),
('student3@fpt.com','123456','student'),
('student4@fpt.com','123456','student'),
('student5@fpt.com','123456','student'),
('student6@fpt.com','123456','student'),
('student7@fpt.com','123456','student'),
('student8@fpt.com','123456','student'),
('student9@fpt.com','123456','student'),
('student10@fpt.com','123456','student'),
('student11@fpt.com','123456','student'),
('student12@fpt.com','123456','student'),
('student13@fpt.com','123456','student'),
('student14@fpt.com','123456','student'),
('student15@fpt.com','123456','student'),
('student16@fpt.com','123456','student'),
('student17@fpt.com','123456','student'),
('student18@fpt.com','123456','student'),
('student19@fpt.com','123456','student'),
('student20@fpt.com','123456','student'),
('student21@fpt.com','123456','student'),
('student22@fpt.com','123456','student'),
('student23@fpt.com','123456','student'),
('student24@fpt.com','123456','student'),
('student25@fpt.com','123456','student'),
('student26@fpt.com','123456','student'),
('student27@fpt.com','123456','student'),
('student28@fpt.com','123456','student'),
('student29@fpt.com','123456','student')

INSERT INTO tblEvent(title,author,content,photo,created)
VALUES ('After a solid iOS developer?','Viet Anh','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.','event1','2014-07-10'),
('House finished','Viet Em','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.','event2','2014-07-11'),
('WebP decoding on iOS','Dang Anh','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.','event3','2014-07-12'),
('Moving on again','To Hoai','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.','event4','2014-07-13'),
('Skeleton Key Cocoaheads','Kim Dung','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.','event5','2014-07-14'),
('Another app marketing idea','Duong Qua','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.','event6','2014-07-15'),
('Promoting apps presentation','Doan Du','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.','event7','2014-07-16'),
('The Finishing Line','Long Nu','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.','event8','2014-07-17'),
('Indie iPhone app marketing','Minh Duc','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.','event9','2014-07-18')

go

create proc LoadEvents
as
select E.eventId, E.title, E.author, E.content, E.photo, E.created
from tblEvent as E
order by created desc

go

create proc AddNewEvent
@title nvarchar(max),
@author nvarchar(100),
@content nvarchar(max),
@photo nvarchar(max)
as
insert tblEvent(title, author, content, photo) values (@title, @author, @content, @photo)
return @@IDENTITY

go

create proc UpdateEvent
@eventId int,
@title nvarchar(max),
@author nvarchar(100),
@content nvarchar(max),
@photo nvarchar(max)
as
update tblEvent
set title = @title,
	author = @author,
	content = @content,
	photo = @photo
where eventId = @eventId

go
--ongoing
create proc DeleteEvent
@eventId int
as
delete tblEvent
where eventId = @eventId

go

create proc CheckLogin
@emailId nvarchar(100),
@pass nvarchar(100)
as
select A.emailId, A.pass, A.accType, A.changePass, A.[status]
from tblAccount as A
where A.[status] = 1

go

create proc InsertMail
@senderId nvarchar(100),
@title nvarchar(100),
@content nvarchar(100)
as
insert tblMail(senderId, [subject], content) values ( @senderId, @title, @content)
return @@IDENTITY

go

create proc SendMail
@mailId int,
@receiverId nvarchar(100)
as
insert tblAccountMail(mailId, receiverId) values (@mailId, @receiverId)

go

create proc LoadSentMail
@senderId nvarchar(100)
as
select MD.mailId, M.[subject], M.content, M.created, M.[status]
from tblMailDetail as MD join tblMail as M
on MD.mailId = M.mailId
where M.senderId = @senderId
group by MD.mailId, M.[subject], M.content, M.created, M.[status]
order by created desc

go

create proc LoadInboxMail
@receiverId nvarchar(100)
as
select MD.mailId, M.[subject], M.content, M.created, M.[status]
from tblMailDetail as MD join tblMail as M
on MD.mailId = M.mailId
where MD.receiverId = @receiverId
group by MD.mailId, M.[subject], M.content, M.created, M.[status]
order by created desc

go

create proc GetAllAccount
as
select A.emailId, A.pass, A.accType, A.changePass, A.[status]
from tblAccount as A

go
--ongoing
create proc GetAllStudent
as
select A.emailId, S.name, S.[address], A.pass, A.[address], A.dob, A.photo, A.created, A.[status]
from tblAccount as A join tblStudent as S
on A.emailId = S.emailId

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

select * from tblMail