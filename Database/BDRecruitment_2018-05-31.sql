USE [master]
GO
/****** Object:  Database [BDRecruitment]    Script Date: 31/05/2018 22:22:42 ******/
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
/****** Object:  Table [dbo].[Candidate]    Script Date: 31/05/2018 22:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Candidate](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](150) NULL,
	[firstname] [varchar](150) NULL,
	[lastname] [varchar](150) NULL,
	[identification] [int] NULL,
	[email] [varchar](150) NULL,
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
/****** Object:  Table [dbo].[Company]    Script Date: 31/05/2018 22:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NULL,
	[Description] [varchar](150) NULL,
	[Email] [varchar](100) NULL,
	[user_id] [int] NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JobOffer]    Script Date: 31/05/2018 22:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JobOffer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NULL,
	[description] [varchar](150) NULL,
	[date] [date] NULL,
	[enable] [bit] NULL,
 CONSTRAINT [PK_JobOffer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JobOffer_Candidate]    Script Date: 31/05/2018 22:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobOffer_Candidate](
	[id_jobOffer] [int] NOT NULL,
	[id_person] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JobOffer_Person]    Script Date: 31/05/2018 22:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobOffer_Person](
	[id_jobOffer] [int] NOT NULL,
	[id_person] [int] NOT NULL,
 CONSTRAINT [PK_JobOffer_Person] PRIMARY KEY CLUSTERED 
(
	[id_jobOffer] ASC,
	[id_person] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 31/05/2018 22:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] NOT NULL,
	[username] [varchar](150) NULL,
	[password] [varchar](150) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Candidate]  WITH CHECK ADD  CONSTRAINT [FK_Candidate_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Candidate] CHECK CONSTRAINT [FK_Candidate_User]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_User]
GO
ALTER TABLE [dbo].[JobOffer]  WITH CHECK ADD  CONSTRAINT [FK_JobOffer_Company] FOREIGN KEY([company_id])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[JobOffer] CHECK CONSTRAINT [FK_JobOffer_Company]
GO
ALTER TABLE [dbo].[JobOffer_Candidate]  WITH CHECK ADD  CONSTRAINT [FK_JobOffer_Candidate_Candidate] FOREIGN KEY([id_person])
REFERENCES [dbo].[Candidate] ([id])
GO
ALTER TABLE [dbo].[JobOffer_Candidate] CHECK CONSTRAINT [FK_JobOffer_Candidate_Candidate]
GO
ALTER TABLE [dbo].[JobOffer_Candidate]  WITH CHECK ADD  CONSTRAINT [FK_JobOffer_Candidate_JobOffer] FOREIGN KEY([id_jobOffer])
REFERENCES [dbo].[JobOffer] ([id])
GO
ALTER TABLE [dbo].[JobOffer_Candidate] CHECK CONSTRAINT [FK_JobOffer_Candidate_JobOffer]
GO
USE [master]
GO
ALTER DATABASE [BDRecruitment] SET  READ_WRITE 
GO
