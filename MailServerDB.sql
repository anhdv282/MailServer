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
VALUES ('After a solid iOS developer?','Viet Anh','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.','event1.jpg','2014-07-10'),
('House finished','Viet Em','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.','event2.jpg','2014-07-11'),
('WebP decoding on iOS','Dang Anh','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.','event3.jpg','2014-07-12'),
('Moving on again','To Hoai','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.','event4.jpg','2014-07-13'),
('Skeleton Key Cocoaheads','Kim Dung','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.','event5.jpg','2014-07-14'),
('Another app marketing idea','Duong Qua','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.','event6.jpg','2014-07-15'),
('Promoting apps presentation','Doan Du','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.','event7.jpg','2014-07-16'),
('The Finishing Line','Long Nu','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.','event8.jpg','2014-07-17'),
('Indie iPhone app marketing','Minh Duc','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.','event9.jpg','2014-07-18')

go
INSERT INTO tblStaff(emailId,name,[address],dob,photo)
VALUES 
('staff1@fpt.com','staff 1','Ha Noi','1993-11-12','staff1'),
('staff2@fpt.com','staff 2','Ho Chi Minh','1992-10-12','staff2'),
('staff3@fpt.com','staff 3','Hai Phong','1990-12-22','staff3'),
('staff4@fpt.com','staff 4','Ha Noi','1994-12-02','staff4'),
('staff5@fpt.com','staff 5','Ho Chi Minh','1993-04-12','staff5'),
('staff6@fpt.com','staff 6','Hai Phong','1992-05-23','staff1')

INSERT INTO tblStudent(emailId,name,[address],dob,photo)
VALUES
('student1@fpt.com','student 1','Ha Noi','1993-11-12','student1'),
('student2@fpt.com','student 2','Ho Chi Minh','1992-10-12','student2'),
('student3@fpt.com','student 3','Hai Phong','1990-12-22','student3'),
('student4@fpt.com','student 4','Da Nang','1994-12-02','student4'),
('student5@fpt.com','student 5','Lao Cai','1993-04-12','student5'),
('student6@fpt.com','student 6','Can Tho','1992-05-23','student1'),
('student7@fpt.com','student 7','Ha Noi','1993-11-12','student1'),
('student8@fpt.com','student 8','Ho Chi Minh','1992-10-12','student2'),
('student9@fpt.com','student 9','Hai Phong','1990-12-22','student3'),
('student10@fpt.com','student 10','Da Nang','1994-12-02','student1'),
('student11@fpt.com','student 11','Lao Cai','1993-04-12','student1'),
('student12@fpt.com','student 12','Can Tho','1992-05-23','student1'),
('student13@fpt.com','student 13','Ha Noi','1993-11-12','student1'),
('student14@fpt.com','student 14','Ho Chi Minh','1992-10-12','student4'),
('student15@fpt.com','student 15','Hai Phong','1990-12-22','student4'),
('student16@fpt.com','student 16','Da Nang','1994-12-02','student5'),
('student17@fpt.com','student 17','Lao Cai','1993-04-12','student5'),
('student18@fpt.com','student 18','Can Tho','1992-05-23','student3'),
('student19@fpt.com','student 19','Ha Noi','1993-11-12','student1'),
('student20@fpt.com','student 20','Ho Chi Minh','1992-10-12','student2'),
('student21@fpt.com','student 21','Hai Phong','1990-12-22','student3'),
('student22@fpt.com','student 22','Da Nang','1994-12-02','student4'),
('student23@fpt.com','student 23','Lao Cai','1993-04-12','student5'),
('student24@fpt.com','student 24','Can Tho','1992-05-23','student1'),
('student25@fpt.com','student 25','Ha Noi','1993-11-12','student2'),
('student26@fpt.com','student 26','Ho Chi Minh','1992-10-12','student3'),
('student27@fpt.com','student 27','Hai Phong','1990-12-22','student4'),
('student28@fpt.com','student 28','Da Nang','1994-12-02','student5'),
('student29@fpt.com','student 29','Lao Cai','1993-04-12','student2')

INSERT INTO tblCourse(courseName,teacherId)
VALUES
('C1301G','1'),
('C1209G','3'),
('C1208G','6')

INSERT INTO tblCourseStudent(courseId,studentId)
VALUES
('1','1'),
('1','2'),
('1','3'),
('1','4'),
('1','5'),
('1','6'),
('1','7'),
('1','8'),
('1','9'),
('1','10'),
('2','11'),
('2','12'),
('2','13'),
('2','14'),
('2','15'),
('2','16'),
('2','17'),
('2','18'),
('2','19'),
('2','20'),
('3','21'),
('3','22'),
('3','23'),
('3','24'),
('3','25'),
('3','26'),
('3','27'),
('3','28'),
('3','29')

INSERT INTO tblMail(senderId, [subject], content)
VALUES
('staff1@fpt.com','Hello','Hello My Students'),
('student1@fpt.com','Hello','Hello Teacher'),
('staff1@fpt.com','Assignment','C Assignment'),
('staff1@fpt.com','Assignment','Java Assignment'),
('student1@fpt.com','Reply: Assignment','My C Assignment'),
('staff1@fpt.com','Assignment','C# Assignment'),
('student1@fpt.com','Reply: Assignment','My C# Assignment'),
('student1@fpt.com','Reply: Assignment','My Java Assignment'),
('staff1@fpt.com','Result','Excellent')

INSERT INTO tblMailDetail(mailId, receiverId)
VALUES
(1,'student1@fpt.com'),
(1,'student2@fpt.com'),
(2,'staff1@fpt.com'),
(3,'student1@fpt.com'),
(4,'student1@fpt.com'),
(5,'staff1@fpt.com'),
(6,'student1@fpt.com'),
(7,'staff1@fpt.com'),
(8,'staff1@fpt.com'),
(9,'student1@fpt.com')

INSERT INTO tblFeedback(email,title,content)
VALUES
('Guess 1','Feedback 1','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.'),
('Guess 2','Feedback 2','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.'),
('Guess 3','Feedback 3','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.'),
('Guess 4','Feedback 4','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.'),
('Guess 5','Feedback 5','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.'),
('Guess 6','Feedback 6','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.'),
('Guess 7','Feedback 7','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.'),
('Guess 8','Feedback 8','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.'),
('Guess 9','Feedback 9','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.'),
('Guess 10','Feedback 10','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.'),
('Guess 11','Feedback 11','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.'),
('Guess 12','Feedback 12','Nam sollicitudin consectetur ante a pharetra. Aliquam sit amet lorem vitae tortor volutpat iaculis in sed erat. Sed a magna tortor, sit amet dapibus mi. Sed dictum volutpat dictum. Cras rhoncus ultrices lobortis. Pellentesque quis mauris et neque egestas mattis. Nunc congue dapibus lacus. Pellentesque aliquet suscipit pharetra. In dictum, nibh non mattis dapibus, purus sapien vulputate felis, at fermentum arcu dolor in ligula. Etiam adipiscing leo lacinia augue tincidunt eget porta mi bibendum.')

SELECT * FROM tblStudent

create proc LoadEvents
as
select E.eventId, E.title, E.author, E.content, E.photo, E.created
from tblEvent as E
where E.status = 0
order by created desc

go
create proc LoadEventDetailById
@eventId int
as
select E.eventId, E.title, E.author, E.content, E.photo, E.created
from tblEvent as E
where E.eventId = @eventId


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
--ok
create proc DeleteEvent
@eventId int
as
update tblEvent
set [status] = 1
where eventId = @eventId
----
go

create proc CheckLogin
@emailId nvarchar(100),
@pass nvarchar(100)
as
select A.emailId, A.pass, A.accType, A.changePass, A.[status]
from tblAccount as A
where A.[status] = 1 and A.emailId = @emailId and A.pass = @pass

go
create proc ChangePass
@emailId nvarchar(100),
@pass nvarchar(100)
as
update tblAccount
set pass = @pass,
	changePass = 1
where emailId = @emailId
go

create proc SentFeedBack
@email nvarchar(max),
@title nvarchar(max),
@content nvarchar(max)
as
insert into tblFeedback(email,title,content)
VALUES (@email,@title,@content)

go
create proc GetAllFeedBack
as
select F.feedId,F.email,F.title,F.created
from tblFeedback as F
order by F.created desc

go
create proc GetFeedbackById
@feedId int
as
select F.email,F.title,F.content,F.created
from tblFeedback as F
where F.feedId = @feedId 

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
insert tblMailDetail(mailId, receiverId) values (@mailId, @receiverId)

go

create proc LoadSentMail
@senderId nvarchar(100)
as
select MD.mailId, M.senderId, M.[subject], M.content, M.created, M.[status]
from tblMailDetail as MD join tblMail as M
on MD.mailId = M.mailId
where M.senderId = @senderId
group by MD.mailId, M.senderId,M.[subject], M.content, M.created, M.[status]
order by created desc

go

create proc LoadInboxMail
@receiverId nvarchar(100)
as
select MD.mailId, M.senderId,M.[subject], M.content, M.created, M.[status]
from tblMailDetail as MD join tblMail as M
on MD.mailId = M.mailId
where MD.receiverId = @receiverId
group by MD.mailId,M.senderId, M.[subject], M.content, M.created, M.[status]
order by created desc

go

create proc SearchInbox
@receiverId nvarchar(100),
@search nvarchar(100)
as
select MD.mailId, M.senderId,M.[subject], M.content, M.created, M.[status]
from tblMailDetail as MD join tblMail as M
on MD.mailId = M.mailId
where MD.receiverId = @receiverId and (M.senderId like '%' + @search + '%' or M.[subject] like '%' + @search + '%')
group by MD.mailId,M.senderId, M.[subject], M.content, M.created, M.[status]
order by created desc

go

create proc SearchSent
@senderId nvarchar(100),
@search nvarchar(100)
as
select MD.mailId, M.senderId,M.[subject], M.content, M.created, M.[status]
from tblMailDetail as MD join tblMail as M
on MD.mailId = M.mailId
where M.senderId = @senderId and (MD.receiverId like '%' + @search + '%' or M.[subject] like '%' + @search + '%')
group by MD.mailId,M.senderId, M.[subject], M.content, M.created, M.[status]
order by created desc

go
create proc GetMailByID
@Id int
as
select MD.mailId, M.senderId,MD.receiverId,M.[subject], M.content, M.created, M.[status]
from tblMail as M join tblMailDetail as MD
on M.mailId = MD.mailId
where M.mailId = @Id

go

create proc GetAllAccount
as
select A.emailId, A.pass, A.accType, A.changePass, A.[status]
from tblAccount as A

go

create proc GetAllStudent
as
select S.studentId,S.emailId,S.name,S.[address],S.dob,S.photo,S.created,S.[status]
from tblStudent as S
where S.status = 1
order by S.created desc

go

create proc SearchStudent
@search nvarchar(100)
as
select S.studentId,S.emailId,S.name,S.[address],S.dob,S.photo,S.created,S.[status]
from tblStudent as S
where S.name like '%' + @search + '%' or S.emailId like '%' + @search + '%'
order by S.created desc

go

create proc UpdateStudent
@emailId nvarchar(100),
@name nvarchar(100),
@address nvarchar(max),
@dob date,
@photo nvarchar(max)
as
update tblStudent
set name = @name,
	[address] = @address,
	dob = @dob,
	photo = @photo
where emailId = @emailId

go
create proc DeleteStudent
@emailId nvarchar(100)
as
update tblStudent
set status = 0
where emailId = @emailId

go
create proc AddStudent
@emailId nvarchar(100),
@name nvarchar(100),
@address nvarchar(max),
@dob date,
@photo nvarchar(max)
as
insert into tblAccount (emailId,pass,accType) VALUES (@emailId,'123456','student')
insert into tblStudent (emailId,name,[address],dob,photo)
VALUES (@emailId,@name,@address,@dob,@photo)


go
create proc GetStudentById
@id int
as
select S.studentId,S.emailId,S.name,S.[address],S.dob,S.photo,S.created,S.[status]
from tblStudent as S
where S.studentId = @id

go

create proc GetStudentByMail
@emailId nvarchar(100)
as
select S.studentId,S.emailId,S.name,S.[address],S.dob,S.photo,S.created,S.[status]
from tblStudent as S
where S.emailId = @emailId

go

create proc GetAllStaff
as
select S.staffId,S.emailId,S.name,S.[address],S.dob,S.photo,S.created,S.[status]
from tblStaff as S
where S.status = 1
order by S.created desc

go

create proc SearchStaff
@search nvarchar(100)
as
select S.staffId,S.emailId,S.name,S.[address],S.dob,S.photo,S.created,S.[status]
from tblStaff as S
where S.name like '%' + @search + '%' or S.emailId like '%' + @search + '%'
order by S.created desc

go

create proc GetStaffById
@id int
as
select S.staffId,S.emailId,S.name,S.[address],S.dob,S.photo,S.created,S.[status]
from tblStaff as S
where S.staffId = @id

go

create proc GetStaffByMail
@emailId nvarchar(100)
as
select S.staffId,S.emailId,S.name,S.[address],S.dob,S.photo,S.created,S.[status]
from tblStaff as S
where S.emailId = @emailId

go
create proc UpdateStaff
@emailId nvarchar(100),
@name nvarchar(100),
@address nvarchar(max),
@dob date,
@photo nvarchar(max)
as
update tblStaff
set name = @name,
	[address] = @address,
	dob = @dob,
	photo = @photo
where emailId = @emailId

go
create proc DeleteStaff
@emailId nvarchar(100)
as
update tblStaff
set status = 0
where emailId = @emailId

go
create proc AddStaff
@emailId nvarchar(100),
@name nvarchar(100),
@address nvarchar(max),
@dob date,
@photo nvarchar(max)
as
insert into tblAccount (emailId,pass,accType) VALUES (@emailId,'123456','staff')
insert into tblStaff (emailId,name,[address],dob,photo)
VALUES (@emailId,@name,@address,@dob,@photo)

go

create view Course
as
select C.courseId, C.courseName, C.teacherId, CS.studentId
from tblCourse as C join tblCourseStudent as CS
on C.courseId = CS.courseId

go

create proc GetCourse
as
select C.courseName,C.courseId
from tblCourse as C

go

create proc GetCourseById
@courseId int
as
select C.courseId ,C.courseName, C.teacherId, C.studentId
from Course as C
where C.courseId = @courseId

go
select * from tblStudent