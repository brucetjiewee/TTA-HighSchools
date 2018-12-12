EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'TTA ERD'
GO
USE [master]
GO
ALTER DATABASE [TTA ERD] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
USE [master]
GO
DROP DATABASE [TTA ERD]
GO

USE Master
GO
CREATE DATABASE [TTA ERD]
GO
USE [TTA ERD]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AcademicYear]') AND type in (N'U'))
    DROP TABLE [dbo].[AcademicYear]
GO
CREATE TABLE [dbo].[AcademicYear] (
[AcademicYearID] INTEGER  NOT NULL  
, [Description] VARCHAR(255)  NOT NULL  
, [Duration] INTEGER  NULL  
)
GO

ALTER TABLE [dbo].[AcademicYear] ADD CONSTRAINT [AcademicYear_PK] PRIMARY KEY CLUSTERED (
[AcademicYearID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Session]') AND type in (N'U'))
    DROP TABLE [dbo].[Session]
GO
CREATE TABLE [dbo].[Session] (
[SessionID] INTEGER  NOT NULL  
, [VenueID] INTEGER  NULL  
, [WeekdayID] INTEGER  NULL  
, [SessionTypeID] INTEGER  NOT NULL  
, [SubjectID] INTEGER  NULL  
, [AcademicYearID] INTEGER  NOT NULL  
)
GO

ALTER TABLE [dbo].[Session] ADD CONSTRAINT [Session_PK] PRIMARY KEY CLUSTERED (
[SessionID]
, [SessionTypeID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SessionType]') AND type in (N'U'))
    DROP TABLE [dbo].[SessionType]
GO
CREATE TABLE [dbo].[SessionType] (
[SessionTypeID] INTEGER  NOT NULL  
, [Description] VARCHAR(255)  NOT NULL  
)
GO

ALTER TABLE [dbo].[SessionType] ADD CONSTRAINT [SessionType_PK] PRIMARY KEY CLUSTERED (
[SessionTypeID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Venue]') AND type in (N'U'))
    DROP TABLE [dbo].[Venue]
GO
CREATE TABLE [dbo].[Venue] (
[VenueID] INTEGER  NOT NULL  
, [Location] VARCHAR(255)  NOT NULL  
, [Name] VARCHAR(255)  NOT NULL  
, [MaxCapacity] INTEGER  NOT NULL  
)
GO

ALTER TABLE [dbo].[Venue] ADD CONSTRAINT [Venue_PK] PRIMARY KEY CLUSTERED (
[VenueID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Weekday]') AND type in (N'U'))
    DROP TABLE [dbo].[Weekday]
GO
CREATE TABLE [dbo].[Weekday] (
[WeekdayID] INTEGER  NOT NULL  
, [WeekdayName] VARCHAR(255)  NOT NULL  
)
GO

ALTER TABLE [dbo].[Weekday] ADD CONSTRAINT [Weekday_PK] PRIMARY KEY CLUSTERED (
[WeekdayID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Subject]') AND type in (N'U'))
    DROP TABLE [dbo].[Subject]
GO
CREATE TABLE [dbo].[Subject] (
[SubjectID] INTEGER  NOT NULL  
, [SubjectName] VARCHAR(255)  NOT NULL  
)
GO

ALTER TABLE [dbo].[Subject] ADD CONSTRAINT [Subject_PK] PRIMARY KEY CLUSTERED (
[SubjectID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
    DROP TABLE [dbo].[User]
GO
CREATE TABLE [dbo].[User] (
[UserID] INTEGER  NOT NULL  
, [UserName] VARCHAR(255)  NOT NULL  
, [Password] VARCHAR(255)  NOT NULL  
, [AccessLevelID] INTEGER  NULL  
, [SchoolID] INTEGER  NOT NULL  
, [StartDate] DATETIME  NOT NULL  
, [EndDate] DATETIME  NOT NULL  
)
GO

ALTER TABLE [dbo].[User] ADD CONSTRAINT [User_PK] PRIMARY KEY CLUSTERED (
[UserID]
, [SchoolID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Parent]') AND type in (N'U'))
    DROP TABLE [dbo].[Parent]
GO
CREATE TABLE [dbo].[Parent] (
[ParentID] INTEGER  NOT NULL  
, [Name] CHAR(10)  NULL  
, [Surname] CHAR(10)  NULL  
, [Gender] CHAR(10)  NULL  
, [IDNumber] CHAR(10)  NULL  
, [UserID] INTEGER  NULL  
, [SchoolID] INTEGER  NULL  
)
GO

ALTER TABLE [dbo].[Parent] ADD CONSTRAINT [Parent_PK] PRIMARY KEY CLUSTERED (
[ParentID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StudentParent]') AND type in (N'U'))
    DROP TABLE [dbo].[StudentParent]
GO
CREATE TABLE [dbo].[StudentParent] (
[ParentID] INTEGER  NOT NULL  
, [StudentID] INTEGER  NOT NULL  
, [SchoolID] INTEGER  NOT NULL  
)
GO

ALTER TABLE [dbo].[StudentParent] ADD CONSTRAINT [StudentParent_PK] PRIMARY KEY CLUSTERED (
[ParentID]
, [StudentID]
, [SchoolID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AccessLevel]') AND type in (N'U'))
    DROP TABLE [dbo].[AccessLevel]
GO
CREATE TABLE [dbo].[AccessLevel] (
[AccessLevelID] INTEGER  NOT NULL  
, [Description] VARCHAR(255)  NOT NULL  
)
GO

ALTER TABLE [dbo].[AccessLevel] ADD CONSTRAINT [AccessLevel_PK] PRIMARY KEY CLUSTERED (
[AccessLevelID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Student]') AND type in (N'U'))
    DROP TABLE [dbo].[Student]
GO
CREATE TABLE [dbo].[Student] (
[SchoolID] INTEGER  NOT NULL  
, [StudentID] INTEGER  NOT NULL  
, [Name] VARCHAR(255)  NOT NULL  
, [Surname] VARCHAR(255)  NOT NULL  
, [IDNumber] VARCHAR(13)  NOT NULL  
, [DOB] DATETIME  NOT NULL  
)
GO

ALTER TABLE [dbo].[Student] ADD CONSTRAINT [Student_PK] PRIMARY KEY CLUSTERED (
[StudentID]
, [SchoolID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StudentSession]') AND type in (N'U'))
    DROP TABLE [dbo].[StudentSession]
GO
CREATE TABLE [dbo].[StudentSession] (
[SessionID] INTEGER  NOT NULL  
, [SessionTypeID] INTEGER  NOT NULL  
, [StudentID] INTEGER  NOT NULL  
, [SchoolID] INTEGER  NOT NULL  
)
GO

ALTER TABLE [dbo].[StudentSession] ADD CONSTRAINT [StudentSession_PK] PRIMARY KEY CLUSTERED (
[StudentID]
, [SessionTypeID]
, [SchoolID]
, [SessionID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StudentSubject]') AND type in (N'U'))
    DROP TABLE [dbo].[StudentSubject]
GO
CREATE TABLE [dbo].[StudentSubject] (
[SubjectID] INTEGER  NULL  
, [StudentID] INTEGER  NULL  
, [SchoolID] INTEGER  NULL  
)
GO

GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[School]') AND type in (N'U'))
    DROP TABLE [dbo].[School]
GO
CREATE TABLE [dbo].[School] (
[SchoolID] INTEGER  NOT NULL  
, [Name] VARCHAR(255)  NOT NULL  
, [Addess] VARCHAR(255)  NULL  
, [ContactNo] VARCHAR(20)  NULL  
, [ContactPerson] VARCHAR(255)  NOT NULL  
, [Email] VARCHAR(255)  NOT NULL  
)
GO

ALTER TABLE [dbo].[School] ADD CONSTRAINT [School_PK] PRIMARY KEY CLUSTERED (
[SchoolID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Teacher]') AND type in (N'U'))
    DROP TABLE [dbo].[Teacher]
GO
CREATE TABLE [dbo].[Teacher] (
[SchoolID] INTEGER  NULL  
, [TeacherID] INTEGER  NOT NULL  
, [Name] CHAR(10)  NULL  
, [Surname] CHAR(10)  NULL  
, [Type] CHAR(10)  NULL  
)
GO

ALTER TABLE [dbo].[Teacher] ADD CONSTRAINT [Teacher_PK] PRIMARY KEY CLUSTERED (
[TeacherID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Grade]') AND type in (N'U'))
    DROP TABLE [dbo].[Grade]
GO
CREATE TABLE [dbo].[Grade] (
[GradeID] INTEGER  NOT NULL  
, [Description] VARCHAR(255)  NOT NULL  
)
GO

ALTER TABLE [dbo].[Grade] ADD CONSTRAINT [Grade_PK] PRIMARY KEY CLUSTERED (
[GradeID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GradeSubjectTeacher]') AND type in (N'U'))
    DROP TABLE [dbo].[GradeSubjectTeacher]
GO
CREATE TABLE [dbo].[GradeSubjectTeacher] (
[SubjectID] INTEGER  NOT NULL  
, [TeacherID] INTEGER  NOT NULL  
, [GradeID] INTEGER  NULL  
)
GO

ALTER TABLE [dbo].[GradeSubjectTeacher] ADD CONSTRAINT [GradeSubjectTeacher_PK] PRIMARY KEY CLUSTERED (
[SubjectID]
, [TeacherID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TeacherSession]') AND type in (N'U'))
    DROP TABLE [dbo].[TeacherSession]
GO
CREATE TABLE [dbo].[TeacherSession] (
[SessionID] INTEGER  NOT NULL  
, [SessionTypeID] INTEGER  NOT NULL  
, [TeacherID] INTEGER  NOT NULL  
)
GO

ALTER TABLE [dbo].[TeacherSession] ADD CONSTRAINT [TeacherSession_PK] PRIMARY KEY CLUSTERED (
[SessionID]
, [SessionTypeID]
, [TeacherID]
)
GO
GO

GO

ALTER TABLE [dbo].[Session] WITH CHECK ADD CONSTRAINT [Subject_Session_FK1] FOREIGN KEY (
[SubjectID]
)
REFERENCES [dbo].[Subject] (
[SubjectID]
)
ALTER TABLE [dbo].[Session] WITH CHECK ADD CONSTRAINT [Weekday_Session_FK1] FOREIGN KEY (
[WeekdayID]
)
REFERENCES [dbo].[Weekday] (
[WeekdayID]
)
ALTER TABLE [dbo].[Session] WITH CHECK ADD CONSTRAINT [Venue_Session_FK1] FOREIGN KEY (
[VenueID]
)
REFERENCES [dbo].[Venue] (
[VenueID]
)
ALTER TABLE [dbo].[Session] WITH CHECK ADD CONSTRAINT [SessionType_Session_FK1] FOREIGN KEY (
[SessionTypeID]
)
REFERENCES [dbo].[SessionType] (
[SessionTypeID]
)
ALTER TABLE [dbo].[Session] WITH CHECK ADD CONSTRAINT [AcademicYear_Session_FK1] FOREIGN KEY (
[AcademicYearID]
)
REFERENCES [dbo].[AcademicYear] (
[AcademicYearID]
)
GO

GO

GO

GO

GO

ALTER TABLE [dbo].[User] WITH CHECK ADD CONSTRAINT [School_User_FK1] FOREIGN KEY (
[SchoolID]
)
REFERENCES [dbo].[School] (
[SchoolID]
)
ALTER TABLE [dbo].[User] WITH CHECK ADD CONSTRAINT [AccessLevel_User_FK1] FOREIGN KEY (
[AccessLevelID]
)
REFERENCES [dbo].[AccessLevel] (
[AccessLevelID]
)
GO

ALTER TABLE [dbo].[Parent] WITH CHECK ADD CONSTRAINT [User_Parent_FK1] FOREIGN KEY (
[UserID]
, [SchoolID]
)
REFERENCES [dbo].[User] (
[UserID]
, [SchoolID]
)
GO

ALTER TABLE [dbo].[StudentParent] WITH CHECK ADD CONSTRAINT [Student_StudentParent_FK1] FOREIGN KEY (
[StudentID]
, [SchoolID]
)
REFERENCES [dbo].[Student] (
[StudentID]
, [SchoolID]
)
ALTER TABLE [dbo].[StudentParent] WITH CHECK ADD CONSTRAINT [Parent_StudentParent_FK1] FOREIGN KEY (
[ParentID]
)
REFERENCES [dbo].[Parent] (
[ParentID]
)
GO

GO

ALTER TABLE [dbo].[Student] WITH CHECK ADD CONSTRAINT [School_Student_FK1] FOREIGN KEY (
[SchoolID]
)
REFERENCES [dbo].[School] (
[SchoolID]
)
GO

ALTER TABLE [dbo].[StudentSession] WITH CHECK ADD CONSTRAINT [Session_StudentSession_FK1] FOREIGN KEY (
[SessionID]
, [SessionTypeID]
)
REFERENCES [dbo].[Session] (
[SessionID]
, [SessionTypeID]
)
ALTER TABLE [dbo].[StudentSession] WITH CHECK ADD CONSTRAINT [Student_StudentSession_FK1] FOREIGN KEY (
[StudentID]
, [SchoolID]
)
REFERENCES [dbo].[Student] (
[StudentID]
, [SchoolID]
)
GO

ALTER TABLE [dbo].[StudentSubject] WITH CHECK ADD CONSTRAINT [Student_StudentSubject_FK1] FOREIGN KEY (
[StudentID]
, [SchoolID]
)
REFERENCES [dbo].[Student] (
[StudentID]
, [SchoolID]
)
ALTER TABLE [dbo].[StudentSubject] WITH CHECK ADD CONSTRAINT [Subject_StudentSubject_FK1] FOREIGN KEY (
[SubjectID]
)
REFERENCES [dbo].[Subject] (
[SubjectID]
)
GO

GO

ALTER TABLE [dbo].[Teacher] WITH CHECK ADD CONSTRAINT [School_Teacher_FK1] FOREIGN KEY (
[SchoolID]
)
REFERENCES [dbo].[School] (
[SchoolID]
)
GO

GO

ALTER TABLE [dbo].[GradeSubjectTeacher] WITH CHECK ADD CONSTRAINT [Subject_GradeSubjectTeacher_FK1] FOREIGN KEY (
[SubjectID]
)
REFERENCES [dbo].[Subject] (
[SubjectID]
)
ALTER TABLE [dbo].[GradeSubjectTeacher] WITH CHECK ADD CONSTRAINT [Teacher_GradeSubjectTeacher_FK1] FOREIGN KEY (
[TeacherID]
)
REFERENCES [dbo].[Teacher] (
[TeacherID]
)
ALTER TABLE [dbo].[GradeSubjectTeacher] WITH CHECK ADD CONSTRAINT [Grade_GradeSubjectTeacher_FK1] FOREIGN KEY (
[GradeID]
)
REFERENCES [dbo].[Grade] (
[GradeID]
)
GO

ALTER TABLE [dbo].[TeacherSession] WITH CHECK ADD CONSTRAINT [Session_TeacherSession_FK1] FOREIGN KEY (
[SessionID]
, [SessionTypeID]
)
REFERENCES [dbo].[Session] (
[SessionID]
, [SessionTypeID]
)
ALTER TABLE [dbo].[TeacherSession] WITH CHECK ADD CONSTRAINT [Teacher_TeacherSession_FK1] FOREIGN KEY (
[TeacherID]
)
REFERENCES [dbo].[Teacher] (
[TeacherID]
)
GO

