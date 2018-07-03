USE [master]
GO
/****** Object:  Database [BDRecruitment]    Script Date: 03/07/2018 16:46:41 ******/
CREATE DATABASE [BDRecruitment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDRecruitment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BDRecruitment.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BDRecruitment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BDRecruitment_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BDRecruitment] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDRecruitment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDRecruitment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDRecruitment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDRecruitment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDRecruitment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDRecruitment] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDRecruitment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BDRecruitment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDRecruitment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDRecruitment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDRecruitment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDRecruitment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDRecruitment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDRecruitment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDRecruitment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDRecruitment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BDRecruitment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDRecruitment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDRecruitment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDRecruitment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDRecruitment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDRecruitment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDRecruitment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDRecruitment] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BDRecruitment] SET  MULTI_USER 
GO
ALTER DATABASE [BDRecruitment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDRecruitment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDRecruitment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDRecruitment] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BDRecruitment] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BDRecruitment]
GO
/****** Object:  Table [dbo].[tb_Candidate]    Script Date: 03/07/2018 16:46:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Candidate](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [varchar](150) NULL,
	[lastname] [varchar](150) NULL,
	[identification] [int] NULL,
	[resume] [varchar](150) NULL,
	[user_id] [int] NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_Company]    Script Date: 03/07/2018 16:46:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Company](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NULL,
	[Description] [varchar](150) NULL,
	[user_id] [int] NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_Job]    Script Date: 03/07/2018 16:46:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Job](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NULL,
	[description] [varchar](150) NULL,
	[date_publication] [date] NULL,
	[enable_job] [bit] NULL,
 CONSTRAINT [PK_JobOffer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_JobAplications]    Script Date: 03/07/2018 16:46:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_JobAplications](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_jobOffer] [int] NOT NULL,
	[id_candidate] [int] NOT NULL,
	[dateofaplication] [date] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_UserProfile]    Script Date: 03/07/2018 16:46:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_UserProfile](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](150) NULL,
	[password] [varchar](150) NULL,
	[rol] [varchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[tb_Candidate]  WITH CHECK ADD  CONSTRAINT [FK_Candidate_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[tb_UserProfile] ([id])
GO
ALTER TABLE [dbo].[tb_Candidate] CHECK CONSTRAINT [FK_Candidate_User]
GO
ALTER TABLE [dbo].[tb_Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[tb_UserProfile] ([id])
GO
ALTER TABLE [dbo].[tb_Company] CHECK CONSTRAINT [FK_Company_User]
GO
ALTER TABLE [dbo].[tb_Job]  WITH CHECK ADD  CONSTRAINT [FK_JobOffer_Company] FOREIGN KEY([company_id])
REFERENCES [dbo].[tb_Company] ([Id])
GO
ALTER TABLE [dbo].[tb_Job] CHECK CONSTRAINT [FK_JobOffer_Company]
GO
ALTER TABLE [dbo].[tb_JobAplications]  WITH CHECK ADD  CONSTRAINT [FK_JobOffer_Candidate_Candidate] FOREIGN KEY([id_candidate])
REFERENCES [dbo].[tb_Candidate] ([id])
GO
ALTER TABLE [dbo].[tb_JobAplications] CHECK CONSTRAINT [FK_JobOffer_Candidate_Candidate]
GO
ALTER TABLE [dbo].[tb_JobAplications]  WITH CHECK ADD  CONSTRAINT [FK_JobOffer_Candidate_JobOffer] FOREIGN KEY([id_jobOffer])
REFERENCES [dbo].[tb_Job] ([id])
GO
ALTER TABLE [dbo].[tb_JobAplications] CHECK CONSTRAINT [FK_JobOffer_Candidate_JobOffer]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddCandidate]    Script Date: 03/07/2018 16:46:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_AddCandidate] 
@email varchar(150),
@password varchar(150),
@rol int,
@firtsname varchar(150),
@lastname varchar(150),
@identification int,
@resume varchar(1150)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE  @id int
    -- Insert statements for procedure here
	Insert into tb_UserProfile (email, [password], rol) Output Inserted.id
    Values (@email, @password, @rol)

	select @id = id from tb_UserProfile

	insert into tb_Candidate(firstname,lastname,identification,[resume],user_id)
	values(@firtsname,@lastname,@identification,@resume,@id)


END

GO
/****** Object:  StoredProcedure [dbo].[sp_AddCompany]    Script Date: 03/07/2018 16:46:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[sp_AddCompany] 
@email varchar(150),
@password varchar(150),
@rol int,
@Name varchar(150),
@Description varchar(150)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE  @id int
    -- Insert statements for procedure here
	Insert into tb_UserProfile (email, [password], rol) Output Inserted.id
    Values (@email, @password, @rol)

	select @id = id from tb_UserProfile

	insert into tb_Company(Name,[Description])
	values(@Name,@Description)


END

GO
/****** Object:  StoredProcedure [dbo].[sp_AddJob]    Script Date: 03/07/2018 16:46:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_AddJob] 
@company_id INT,
@description varchar(150),
@date_publication DATE,
@enable_job BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE  @id int
    -- Insert statements for procedure here
	Insert into tb_Job (company_id, [description], date_publication, enable_job) 
    Values (@company_id, @description, @date_publication, @enable_job)


END

GO
/****** Object:  StoredProcedure [dbo].[sp_AddJobAplication]    Script Date: 03/07/2018 16:46:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[sp_AddJobAplication] 
@id_job INT,
@id_candidate int,
@dateofaplication DATE
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE  @id int
    -- Insert statements for procedure here
	Insert into JobAplications (id_job, id_candidate, dateofaplication) 
    Values (@id_job, @id_candidate, @dateofaplication)


END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetCandidate]    Script Date: 03/07/2018 16:46:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetCandidate] 
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT up.email, up.password, up.rol, c.firstname, c.lastname, c.identification, c.resume, c.user_id
	from tb_UserProfile up, tb_Candidate c
	where c.user_id=up.id and up.id=@id

END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetCompany]    Script Date: 03/07/2018 16:46:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetCompany] 
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT up.email, up.password, up.rol, c.name, c.Description
	from tb_UserProfile up, tb_Company c
	where c.user_id=up.id and up.id=@id

END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetJob]    Script Date: 03/07/2018 16:46:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetJob] 
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT j.id, j.company_id, j.[description], j.date_publication, j.enable_job
	from tb_Job j
	where j.id=@id

END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetJobAplication]    Script Date: 03/07/2018 16:46:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[sp_GetJobAplication] 
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT j.id, j.id_job, j.id_candidate, j.dateofaplication
	from JobAplications j
	where j.id=@id

END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetListCandidate]    Script Date: 03/07/2018 16:46:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetListCandidate] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT up.email, up.password, up.rol, c.firstname, c.lastname, c.identification, c.resume, c.user_id
	from tb_UserProfile up, tb_Candidate c
	where c.user_id=up.id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetListCompanies]    Script Date: 03/07/2018 16:46:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetListCompanies] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT up.email, up.password, up.rol, c.Name, c.Description
	from tb_UserProfile up, tb_Company c
	where c.user_id=up.id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetListJobAplication]    Script Date: 03/07/2018 16:46:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[sp_GetListJobAplication] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT j.id, j.id_job, j.id_candidate, j.dateofaplication
	from JobAplications j

END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetListJobs]    Script Date: 03/07/2018 16:46:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetListJobs] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT j.id, j.company_id, j.[description], j.date_publication, j.enable_job
	from tb_Job j

END

GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateCandidate]    Script Date: 03/07/2018 16:46:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateCandidate] 
@id int,
@email varchar(150),
@password varchar(150),
@rol int,
@firtsname varchar(150),
@lastname varchar(150),
@identification int,
@resume varchar(1150)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Update statements for procedure here
	Update tb_UserProfile 
	set email=@email, [password]=@password, rol=@rol
	where id=@id

	update tb_Candidate
	set firstname=@firtsname, lastname=@lastname,
	identification=@identification, [resume]=@resume
	where [user_id]=@id

END

GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateCompany]    Script Date: 03/07/2018 16:46:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateCompany] 
@id int,
@email varchar(150),
@password varchar(150),
@rol int,
@name varchar(150),
@Description varchar(150)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Update statements for procedure here
	Update tb_UserProfile 
	set email=@email, [password]=@password, rol=@rol
	where id=@id

	update tb_Company
	set Name=@Name, Description=@Description
	where [user_id]=@id

END

GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateJob]    Script Date: 03/07/2018 16:46:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateJob] 
@id int,
@company_id INT,
@description varchar(150),
@date_publication DATE,
@enable_job BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Update statements for procedure here
	Update tb_Job 
	set company_id=@company_id, description=@description, date_publication=@date_publication, enable_job=@enable_job
	where id=@id

END

GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateJobAplication]    Script Date: 03/07/2018 16:46:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[sp_UpdateJobAplication] 
@id int,
@id_job INT,
@id_candidate int,
@dateofaplication DATE
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Update statements for procedure here
	Update JobAplications 
	set id_job=@id_job, id_candidate=@id_candidate, dateofaplication=@dateofaplication
	where id=@id

END

GO
USE [master]
GO
ALTER DATABASE [BDRecruitment] SET  READ_WRITE 
GO
