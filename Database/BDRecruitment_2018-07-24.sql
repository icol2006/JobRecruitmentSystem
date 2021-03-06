USE [master]
GO
/****** Object:  Database [BDRecruitment]    Script Date: 24/07/2018 16:56:44 ******/
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
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 24/07/2018 16:56:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 24/07/2018 16:56:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 24/07/2018 16:56:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 24/07/2018 16:56:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 24/07/2018 16:56:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 24/07/2018 16:56:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_Candidate]    Script Date: 24/07/2018 16:56:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Candidate](
	[firstname] [varchar](150) NULL,
	[lastname] [varchar](150) NULL,
	[identification] [int] NULL,
	[resume] [varchar](150) NULL,
	[id] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_tb_Candidate] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_Company]    Script Date: 24/07/2018 16:56:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Company](
	[Name] [varchar](150) NULL,
	[Description] [varchar](150) NULL,
	[id] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_tb_Company] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_Job]    Script Date: 24/07/2018 16:56:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Job](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [nvarchar](128) NULL,
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
/****** Object:  Table [dbo].[tb_JobAplications]    Script Date: 24/07/2018 16:56:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_JobAplications](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_job] [int] NOT NULL,
	[id_candidate] [nvarchar](128) NOT NULL,
	[dateofaplication] [date] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_UserProfile]    Script Date: 24/07/2018 16:56:45 ******/
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
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 24/07/2018 16:56:45 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 24/07/2018 16:56:45 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 24/07/2018 16:56:45 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 24/07/2018 16:56:45 ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 24/07/2018 16:56:45 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 24/07/2018 16:56:45 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[tb_Candidate]  WITH CHECK ADD  CONSTRAINT [FK_tb_Candidate_AspNetUsers] FOREIGN KEY([id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[tb_Candidate] CHECK CONSTRAINT [FK_tb_Candidate_AspNetUsers]
GO
ALTER TABLE [dbo].[tb_Company]  WITH CHECK ADD  CONSTRAINT [FK_tb_Company_AspNetUsers] FOREIGN KEY([id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[tb_Company] CHECK CONSTRAINT [FK_tb_Company_AspNetUsers]
GO
ALTER TABLE [dbo].[tb_Job]  WITH CHECK ADD  CONSTRAINT [FK_tb_Job_tb_Company] FOREIGN KEY([company_id])
REFERENCES [dbo].[tb_Company] ([id])
GO
ALTER TABLE [dbo].[tb_Job] CHECK CONSTRAINT [FK_tb_Job_tb_Company]
GO
ALTER TABLE [dbo].[tb_JobAplications]  WITH CHECK ADD  CONSTRAINT [FK_JobOffer_Candidate_JobOffer] FOREIGN KEY([id_job])
REFERENCES [dbo].[tb_Job] ([id])
GO
ALTER TABLE [dbo].[tb_JobAplications] CHECK CONSTRAINT [FK_JobOffer_Candidate_JobOffer]
GO
ALTER TABLE [dbo].[tb_JobAplications]  WITH CHECK ADD  CONSTRAINT [FK_tb_JobAplications_tb_Candidate] FOREIGN KEY([id_candidate])
REFERENCES [dbo].[tb_Candidate] ([id])
GO
ALTER TABLE [dbo].[tb_JobAplications] CHECK CONSTRAINT [FK_tb_JobAplications_tb_Candidate]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddCandidate]    Script Date: 24/07/2018 16:56:45 ******/
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
@firtsname varchar(150),
@lastname varchar(150),
@identification int,
@resume varchar(1150),
@user_id nvarchar(128)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	--DECLARE  @id int
    -- Insert statements for procedure here
	--Insert into tb_UserProfile (email, [password], rol) Output Inserted.id
    --Values (@email, @password, @rol)

	--select @id = id from tb_UserProfile

	insert into tb_Candidate(firstname,lastname,identification,[resume],id)
	values(@firtsname,@lastname,@identification,@resume,@user_id)


END

GO
/****** Object:  StoredProcedure [dbo].[sp_AddCompany]    Script Date: 24/07/2018 16:56:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_AddCompany] 
@Description varchar(150),
@Name varchar(150),
@Id varchar(150)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	insert into tb_Company(Name,[Description],[id])
	values(@Name,@Description,@Id)
	
END

GO
/****** Object:  StoredProcedure [dbo].[sp_AddJob]    Script Date: 24/07/2018 16:56:45 ******/
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
@company_id NVARCHAR(128),
@description varchar(150),
@date_publication DATE,
@enable_job BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into tb_Job (company_id, [description], date_publication, enable_job) 
    Values (@company_id, @description, @date_publication, @enable_job)


END

GO
/****** Object:  StoredProcedure [dbo].[sp_AddJobAplication]    Script Date: 24/07/2018 16:56:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_AddJobAplication] 
@id_job INT,
@id_candidate nvarchar(128),
@dateofaplication DATE
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE  @id int
    -- Insert statements for procedure here
	Insert into tb_JobAplications (id_job, id_candidate, dateofaplication) 
    Values (@id_job, @id_candidate, @dateofaplication)


END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetCandidate]    Script Date: 24/07/2018 16:56:45 ******/
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
	@id nvarchar(128)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	SELECT aspUs.Email as 'email', aspUsRl.RoleId as 'rol', c.firstname, c.lastname, c.identification, c.resume, c.id
	from  tb_Candidate c, AspNetUsers aspUs, AspNetUserRoles aspUsRl
	where aspUs.Id=c.id and aspUsRl.UserId=aspUs.Id and c.id=@id

END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetCompany]    Script Date: 24/07/2018 16:56:45 ******/
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
	@id nvarchar(128)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	SELECT aspUs.Email as 'email', aspUsRl.RoleId as 'rol', c.Name, c.Description, c.id
	from  tb_Company c, AspNetUsers aspUs, AspNetUserRoles aspUsRl
	where aspUs.Id=c.id and aspUsRl.UserId=aspUs.Id and c.id=@id

END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetJob]    Script Date: 24/07/2018 16:56:45 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetJobAplication]    Script Date: 24/07/2018 16:56:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetJobAplication] 
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT j.id, j.id_job, j.id_candidate, j.dateofaplication
	from tb_JobAplications j
	where j.id=@id

END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetListCandidate]    Script Date: 24/07/2018 16:56:45 ******/
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
	SELECT aspUs.Email as 'email', aspUsRl.RoleId as 'rol', c.firstname, c.lastname, c.identification, c.resume, c.id
	from  tb_Candidate c, AspNetUsers aspUs, AspNetUserRoles aspUsRl
	where aspUs.Id=c.id and aspUsRl.UserId=aspUs.Id 
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetListCompanies]    Script Date: 24/07/2018 16:56:45 ******/
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

	SELECT aspUs.Email as 'email', aspUsRl.RoleId as 'rol', c.Name, c.Description,  c.id
	from  tb_Company c, AspNetUsers aspUs, AspNetUserRoles aspUsRl
	where aspUs.Id=c.id and aspUsRl.UserId=aspUs.Id 

END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetListJobAplication]    Script Date: 24/07/2018 16:56:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetListJobAplication] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT j.id, j.id_job, j.id_candidate, j.dateofaplication
	from tb_JobAplications j

END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetListJobs]    Script Date: 24/07/2018 16:56:45 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateCandidate]    Script Date: 24/07/2018 16:56:45 ******/
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
@id nvarchar(128),
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
	--Update tb_UserProfile 
	--set email=@email, [password]=@password, rol=@rol
	--where id=@id

	update tb_Candidate
	set firstname=@firtsname, lastname=@lastname,
	identification=@identification, [resume]=@resume
	where [id]=@id

END

GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateCompany]    Script Date: 24/07/2018 16:56:45 ******/
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
@Id nvarchar(128),
@name varchar(150),
@Description varchar(150)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	update tb_Company
	set Name=@Name, Description=@Description
	where [id]=@Id

END

GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateJob]    Script Date: 24/07/2018 16:56:45 ******/
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
@company_id nvarchar(128),
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateJobAplication]    Script Date: 24/07/2018 16:56:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateJobAplication] 
@id int,
@id_job INT,
@id_candidate nvarchar(128),
@dateofaplication DATE
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Update statements for procedure here
	Update tb_JobAplications 
	set id_job=@id_job, id_candidate=@id_candidate, dateofaplication=@dateofaplication
	where id=@id

END

GO
USE [master]
GO
ALTER DATABASE [BDRecruitment] SET  READ_WRITE 
GO
