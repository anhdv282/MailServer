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
(2,'staff3@fpt.com','123456','Staff3','Da Nang','1989-01-14','avatar2',1),
(2,'staff4@fpt.com','123456','Staff4','Ha Noi','1988-09-28','avatar3',1),
(2,'staff5@fpt.com','123456','Staff5','Ho Chi Minh','1988-09-28','avatar3',1),
(2,'staff6@fpt.com','123456','Staff6','Da Nang','1989-01-14','avatar2',1),
(3,'student1@fpt.com','123456','Student1','Ha Noi','1993-04-25','avatar04',1),
(3,'student2@fpt.com','123456','Student2','Da Nang','1994-07-24','avatar5',1),
(3,'student3@fpt.com','123456','Student3','Ha Noi','1992-03-25','avatar04',1),
(3,'student4@fpt.com','123456','Student4','Ho Chi Minh','1991-07-24','avatar5',1),
(3,'student5@fpt.com','123456','Student5','Ha Noi','1993-04-25','avatar04',1),
(3,'student6@fpt.com','123456','Student6','Da Nang','1994-07-24','avatar5',1),
(3,'student7@fpt.com','123456','Student7','Ha Noi','1996-04-25','avatar04',1),
(3,'student8@fpt.com','123456','Student8','Ho Chi Minh','1990-07-24','avatar5',1),
(3,'student9@fpt.com','123456','Student9','Ha Noi','1993-04-25','avatar04',1),
(3,'student10@fpt.com','123456','Student10','Da Nang','1994-07-24','avatar2',1),
(3,'student11@fpt.com','123456','Student11','Ha Noi','1996-04-25','avatar04',1),
(3,'student12@fpt.com','123456','Student12','Da Nang','1990-06-24','avatar5',1),
(3,'student13@fpt.com','123456','Student13','Ha Noi','1993-04-25','avatar04',1),
(3,'student14@fpt.com','123456','Student14','Ho Chi Minh','1992-07-24','avatar5',1),
(3,'student15@fpt.com','123456','Student15','Da Nang','1994-07-24','avatar5',1),
(3,'student16@fpt.com','123456','Student16','Ha Noi','1991-04-25','avatar3',1),
(3,'student17@fpt.com','123456','Student17','Da Nang','1994-07-24','avatar5',1),
(3,'student18@fpt.com','123456','Student18','Ha Noi','1993-04-25','avatar04',1),
(3,'student19@fpt.com','123456','Student19','Ho Chi Minh','1992-03-24','avatar2',1),
(3,'student20@fpt.com','123456','Student20','Da Nang','1994-02-24','avatar5',1),
(3,'student21@fpt.com','123456','Student21','Ha Noi','1993-04-25','avatar04',1),
(3,'student22@fpt.com','123456','Student22','Da Nang','1990-07-24','avatar3',1),
(3,'student23@fpt.com','123456','Student23','Ha Noi','1993-04-25','avatar04',1),
(3,'student24@fpt.com','123456','Student24','Ho Chi Minh','1994-07-24','avatar5',1),
(3,'student25@fpt.com','123456','Student25','Da Nang','1990-07-24','avatar5',1),
(3,'student26@fpt.com','123456','Student26','Ha Noi','1993-04-25','avatar04',1),
(3,'student27@fpt.com','123456','Student27','Ho Chi Minh','1994-07-24','avatar5',1),
(3,'student28@fpt.com','123456','Student28','Ha Noi','1990-04-25','avatar',1),
(3,'student29@fpt.com','123456','Student29','Da Nang','1994-07-24','avatar5',1)

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
select * from tblEvent
order by created desc
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
