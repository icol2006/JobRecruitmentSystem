USE [master]
GO
/****** Object:  Database [BDRecruitment]    Script Date: 16/08/2018 21:29:40 ******/
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
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 16/08/2018 21:29:40 ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 16/08/2018 21:29:41 ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 16/08/2018 21:29:41 ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 16/08/2018 21:29:41 ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 16/08/2018 21:29:41 ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 16/08/2018 21:29:41 ******/
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
/****** Object:  Table [dbo].[tb_Candidate]    Script Date: 16/08/2018 21:29:41 ******/
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
/****** Object:  Table [dbo].[tb_Category]    Script Date: 16/08/2018 21:29:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](350) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_Company]    Script Date: 16/08/2018 21:29:41 ******/
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
/****** Object:  Table [dbo].[tb_Job]    Script Date: 16/08/2018 21:29:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Job](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [nvarchar](128) NULL,
	[description] [varchar](2500) NULL,
	[date_publication] [date] NULL,
	[enable_job] [bit] NULL,
	[name] [varchar](350) NULL,
	[id_category] [int] NULL,
 CONSTRAINT [PK_JobOffer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_JobAplications]    Script Date: 16/08/2018 21:29:41 ******/
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
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1', N'administrator')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'2', N'candidate')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'3', N'company')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'efdc8ad5-4eb0-4c11-a0e5-4d9214df6657', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'717cc7c8-917f-4786-905d-c9d1d88f74e7', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'802314ee-0dc3-481a-adc6-bce57593d526', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5f1bb70a-c3ed-4b33-aa2e-dde9e3366b65', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'be9046be-10f2-400f-a981-60f52c61a3b1', N'3')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'pizzahut@gmail.com', 0, N'AHdsBNxBqCJgsluGo4sA1TPkbcWIVy0ZdkMXPT/kv0aN1lqeAzNW/mNDh/no8miAAw==', N'933933b2-4e3c-4359-ae82-b2d9c1485559', NULL, 0, 0, NULL, 1, 0, N'pizzahut@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'5f1bb70a-c3ed-4b33-aa2e-dde9e3366b65', N'uber@gmail.com', 0, N'AONTFIiKRRgGqUzpxsTarwO1J7L/jlJyQsGRSaV8mZb0U4nbTYAB1lPNL+YO8TO+ew==', N'12c15b9c-1d9a-4410-9d5e-3741a844016a', NULL, 0, 0, NULL, 1, 0, N'uber@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'717cc7c8-917f-4786-905d-c9d1d88f74e7', N'usuario2@gmail.com', 0, N'AIXV+H0ECkpMVdpuxV+jh9b0t5dG7KTGOLI0YcILyjQemUYyTWjVfY1tQqi8RqNalg==', N'dcb9c255-02c7-4a26-8ec6-0c721ba17bf9', NULL, 0, 0, NULL, 1, 0, N'usuario2@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'802314ee-0dc3-481a-adc6-bce57593d526', N'usuario1@gmail.com', 0, N'ADDb1ImMfLfD4B7Ol+bvIRHyuMdI4HH8hxttQnqIuYa8n2JCv0F6R8Mc80Pf+Ks8dA==', N'45a55792-7b28-4ea2-a37d-19b0e58df1d6', NULL, 0, 0, NULL, 1, 0, N'usuario1@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'be9046be-10f2-400f-a981-60f52c61a3b1', N'icol2006@gmail.com', 0, N'AD/jW3oKHmo9T7cz6OqV/k5V1e86HVrZcRYI34V3dNDRm9+iQLCehpt6GeCZz7pNuw==', N'3e4d69a9-195b-475e-b166-3a2b4d0d4247', NULL, 0, 0, NULL, 1, 0, N'icol2006@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'efdc8ad5-4eb0-4c11-a0e5-4d9214df6657', N'admin@gmail.com', 0, N'AFzKJYJ2L1QfNPsfHEolsQeRorgEHGI/Iqf6eax75kouSvrVd41aAVMQETEUXhr1/g==', N'f4636944-5b25-4f8e-bc1a-cfa75e741581', NULL, 0, 0, NULL, 1, 0, N'admin@gmail.com')
INSERT [dbo].[tb_Candidate] ([firstname], [lastname], [identification], [resume], [id]) VALUES (N'Usuario2', N'Bonilla', 511818, N'18h9hEQTkXSkTtid42899scwE0U2Rgt48', N'717cc7c8-917f-4786-905d-c9d1d88f74e7')
INSERT [dbo].[tb_Candidate] ([firstname], [lastname], [identification], [resume], [id]) VALUES (N'Usuario1', N'Alvarez', 32131535, N'15D85OAzvyE-WTrDQAfpKtcRkYZY7METr', N'802314ee-0dc3-481a-adc6-bce57593d526')
SET IDENTITY_INSERT [dbo].[tb_Category] ON 

INSERT [dbo].[tb_Category] ([id], [name]) VALUES (1, N'Otros')
INSERT [dbo].[tb_Category] ([id], [name]) VALUES (2, N'Ingeniería')
INSERT [dbo].[tb_Category] ([id], [name]) VALUES (3, N'Producción / Operarios / Manufactura')
INSERT [dbo].[tb_Category] ([id], [name]) VALUES (4, N'Mantenimiento y Reparaciones Técnicas')
INSERT [dbo].[tb_Category] ([id], [name]) VALUES (5, N'Servicios Generales, Aseo y Seguridad ')
INSERT [dbo].[tb_Category] ([id], [name]) VALUES (6, N'CallCenter / Telemercadeo')
INSERT [dbo].[tb_Category] ([id], [name]) VALUES (7, N'Construccion y obra')
INSERT [dbo].[tb_Category] ([id], [name]) VALUES (8, N'Mercadotécnia / Publicidad / Comunicación')
INSERT [dbo].[tb_Category] ([id], [name]) VALUES (9, N'Medicina / Salud')
INSERT [dbo].[tb_Category] ([id], [name]) VALUES (10, N'Diseño / Artes gráficas')
INSERT [dbo].[tb_Category] ([id], [name]) VALUES (11, N'Recursos Humanos')
INSERT [dbo].[tb_Category] ([id], [name]) VALUES (12, N'Docencia')
INSERT [dbo].[tb_Category] ([id], [name]) VALUES (13, N'Compras / Comercio Exterior')
INSERT [dbo].[tb_Category] ([id], [name]) VALUES (14, N'Dirección / Gerencia')
INSERT [dbo].[tb_Category] ([id], [name]) VALUES (15, N'Investigación y Calidad')
INSERT [dbo].[tb_Category] ([id], [name]) VALUES (16, N'Legal / Asesoría')
SET IDENTITY_INSERT [dbo].[tb_Category] OFF
INSERT [dbo].[tb_Company] ([Name], [Description], [id]) VALUES (N'Pizza Hut', N'Comidas Rapidas', N'59083eaa-bc6d-462f-bbe4-03bd21100dc2')
INSERT [dbo].[tb_Company] ([Name], [Description], [id]) VALUES (N'Uber', N'Empresa de transportes', N'5f1bb70a-c3ed-4b33-aa2e-dde9e3366b65')
INSERT [dbo].[tb_Company] ([Name], [Description], [id]) VALUES (N'dsalk', N'klads', N'be9046be-10f2-400f-a981-60f52c61a3b1')
SET IDENTITY_INSERT [dbo].[tb_Job] ON 

INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (17, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Mesero', CAST(N'2013-10-10' AS Date), 1, N'Meseros', 1)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (19, N'5f1bb70a-c3ed-4b33-aa2e-dde9e3366b65', N'Mensajero', CAST(N'2018-10-10' AS Date), 1, N'Mensajero', 8)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (20, N'5f1bb70a-c3ed-4b33-aa2e-dde9e3366b65', N'Contador', CAST(N'2016-10-10' AS Date), 1, N'Contador', 6)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (21, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Similar to the contextual text color classes, easily set the background of an element to any contextual class. Anchor components will darken on hover,', CAST(N'2015-10-10' AS Date), 1, N'Cocinero', 11)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (22, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Ayudante de cocina', CAST(N'2015-10-10' AS Date), 0, N'Ayudante de cocina', 3)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (23, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Administrador', CAST(N'2017-09-14' AS Date), 1, N'Administrador', 11)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (24, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Se busca gente', CAST(N'2018-08-07' AS Date), 0, N'Mesero', 4)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (25, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Similar to the contextual text color classes, easily set the background of an element to any contextual class. Anchor components will darken on hover,In the above example, the first parameter in TextAreaFor() method is a lambda expression that specifies the model property to be bound with the textarea element. We have specified Description property in the above example. So, it generatesIn the above example, the first parameter in TextAreaFor() method is a lambda expression that specifies the model property to be bound with the textarea element. We have specified Description property in the above example. So, it generatesIn the above example, the first parameter in TextAreaFor() method is a lambda expression that specifies the model property to be bound with the textarea element. We have specified Description property in the above example. So, it generates', CAST(N'2018-08-02' AS Date), 1, N'Miscelaneo', 5)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (26, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Abogado', CAST(N'2015-10-10' AS Date), 1, N'Abogado', 16)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1066, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Abogado', CAST(N'2015-10-10' AS Date), 1, N'Abogado', 16)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1067, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Abogado', CAST(N'2014-10-10' AS Date), 1, N'Abogado', 16)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1068, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Abogado', CAST(N'2015-10-10' AS Date), 1, N'Abogado', 16)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1069, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Abogado', CAST(N'2015-10-10' AS Date), 1, N'Abogado', 16)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1070, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Abogado', CAST(N'2015-10-10' AS Date), 1, N'Abogado', 16)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1071, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Abogado', CAST(N'2012-10-10' AS Date), 1, N'Abogado', 16)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1072, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Abogado', CAST(N'2015-10-10' AS Date), 1, N'Abogado', 16)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1073, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Abogado', CAST(N'2015-10-10' AS Date), 1, N'Abogado', 16)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1074, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Abogado', CAST(N'2015-10-10' AS Date), 1, N'Abogado', 16)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1075, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Abogado', CAST(N'2015-10-10' AS Date), 1, N'Abogado', 16)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1076, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Abogado', CAST(N'2015-10-10' AS Date), 1, N'Abogado', 16)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1077, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Abogado', CAST(N'2015-10-10' AS Date), 1, N'Abogado', 16)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1078, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Abogado', CAST(N'2015-10-10' AS Date), 1, N'Abogado', 16)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1079, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Abogado', CAST(N'2015-08-10' AS Date), 1, N'Abogado', 16)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1080, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Abogado', CAST(N'2015-10-10' AS Date), 1, N'Abogado', 16)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1082, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Abogado', CAST(N'2015-10-10' AS Date), 1, N'Abogado', 16)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1083, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'In the above example, the first parameter in TextAreaFor() method is a lambda expression that specifies the model property to be bound with the textarea element. We have specified Description property in the above example. So, it generates', CAST(N'2018-06-09' AS Date), 1, N'Abogado', 16)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1084, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Abogado', CAST(N'2013-10-10' AS Date), 1, N'Asistente Abogado', 16)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1085, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Abogado', CAST(N'2015-10-10' AS Date), 1, N'Abogado', 16)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1086, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Mesero', CAST(N'2015-10-10' AS Date), 1, N'Mesero', 1)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1087, N'5f1bb70a-c3ed-4b33-aa2e-dde9e3366b65', N'Mensajero', CAST(N'2015-10-10' AS Date), 1, N'Mensajero', 2)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1088, N'5f1bb70a-c3ed-4b33-aa2e-dde9e3366b65', N'Contador', CAST(N'2015-10-10' AS Date), 1, N'Contador', 12)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1089, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Cocinero', CAST(N'2015-10-10' AS Date), 1, N'Cocinero', 11)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1090, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Ayudante de cocina', CAST(N'2015-10-10' AS Date), 0, N'Ayudante de cocina', 3)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1091, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Administrador', CAST(N'2015-10-10' AS Date), 1, N'Administrador', 1)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1092, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Se busca gente', CAST(N'2015-10-10' AS Date), 0, N'Mesero', 4)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1093, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Limpiar ', CAST(N'2015-10-10' AS Date), 0, N'Miscelaneo', 4)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1094, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Mesero', CAST(N'2015-10-10' AS Date), 1, N'Mesero', 1)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1095, N'5f1bb70a-c3ed-4b33-aa2e-dde9e3366b65', N'Mensajero', CAST(N'2015-10-10' AS Date), 1, N'Mensajero', 2)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1096, N'5f1bb70a-c3ed-4b33-aa2e-dde9e3366b65', N'Contador', CAST(N'2000-10-10' AS Date), 1, N'Contador', 1)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1097, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Cocinero', CAST(N'2015-10-10' AS Date), 1, N'Cocinero', 11)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1098, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Ayudante de cocina', CAST(N'2015-10-10' AS Date), 0, N'Ayudante de cocina', 3)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1099, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Administrador', CAST(N'2015-10-10' AS Date), 1, N'Administrador', 1)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1100, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Se busca gente', CAST(N'2015-10-10' AS Date), 0, N'Mesero', 4)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1101, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Limpiar ', CAST(N'2015-10-10' AS Date), 0, N'Miscelaneo', 4)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1103, N'5f1bb70a-c3ed-4b33-aa2e-dde9e3366b65', N'Mensajero', CAST(N'2015-10-10' AS Date), 1, N'Mensajero', 2)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1104, N'5f1bb70a-c3ed-4b33-aa2e-dde9e3366b65', N'Contador', CAST(N'2015-10-10' AS Date), 1, N'Contador', 1)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1106, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Ayudante de cocina', CAST(N'2015-10-10' AS Date), 0, N'Ayudante de cocina', 3)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1107, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Administrador', CAST(N'2015-10-10' AS Date), 1, N'Administrador', 1)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1108, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Se busca gente', CAST(N'2015-10-10' AS Date), 0, N'Mesero', 4)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1109, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Limpiar ', CAST(N'2015-10-10' AS Date), 0, N'Miscelaneo', 4)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1110, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'escuela en alajuela', CAST(N'2014-10-10' AS Date), 1, N'Maestra', 12)
INSERT [dbo].[tb_Job] ([id], [company_id], [description], [date_publication], [enable_job], [name], [id_category]) VALUES (1111, N'59083eaa-bc6d-462f-bbe4-03bd21100dc2', N'Educacion fisica', CAST(N'2019-08-14' AS Date), 1, N'Profesor de fisica', 12)
SET IDENTITY_INSERT [dbo].[tb_Job] OFF
SET IDENTITY_INSERT [dbo].[tb_JobAplications] ON 

INSERT [dbo].[tb_JobAplications] ([id], [id_job], [id_candidate], [dateofaplication]) VALUES (56, 26, N'717cc7c8-917f-4786-905d-c9d1d88f74e7', CAST(N'2018-08-03' AS Date))
INSERT [dbo].[tb_JobAplications] ([id], [id_job], [id_candidate], [dateofaplication]) VALUES (52, 19, N'717cc7c8-917f-4786-905d-c9d1d88f74e7', CAST(N'2018-07-31' AS Date))
INSERT [dbo].[tb_JobAplications] ([id], [id_job], [id_candidate], [dateofaplication]) VALUES (1059, 17, N'802314ee-0dc3-481a-adc6-bce57593d526', CAST(N'2018-08-07' AS Date))
INSERT [dbo].[tb_JobAplications] ([id], [id_job], [id_candidate], [dateofaplication]) VALUES (58, 23, N'802314ee-0dc3-481a-adc6-bce57593d526', CAST(N'2018-08-03' AS Date))
INSERT [dbo].[tb_JobAplications] ([id], [id_job], [id_candidate], [dateofaplication]) VALUES (1054, 21, N'717cc7c8-917f-4786-905d-c9d1d88f74e7', CAST(N'2018-08-07' AS Date))
INSERT [dbo].[tb_JobAplications] ([id], [id_job], [id_candidate], [dateofaplication]) VALUES (1055, 17, N'717cc7c8-917f-4786-905d-c9d1d88f74e7', CAST(N'2018-08-07' AS Date))
INSERT [dbo].[tb_JobAplications] ([id], [id_job], [id_candidate], [dateofaplication]) VALUES (1060, 17, N'802314ee-0dc3-481a-adc6-bce57593d526', CAST(N'2018-08-10' AS Date))
INSERT [dbo].[tb_JobAplications] ([id], [id_job], [id_candidate], [dateofaplication]) VALUES (1061, 17, N'802314ee-0dc3-481a-adc6-bce57593d526', CAST(N'2018-08-10' AS Date))
INSERT [dbo].[tb_JobAplications] ([id], [id_job], [id_candidate], [dateofaplication]) VALUES (1058, 20, N'717cc7c8-917f-4786-905d-c9d1d88f74e7', CAST(N'2018-08-07' AS Date))
INSERT [dbo].[tb_JobAplications] ([id], [id_job], [id_candidate], [dateofaplication]) VALUES (1062, 19, N'802314ee-0dc3-481a-adc6-bce57593d526', CAST(N'2018-08-13' AS Date))
INSERT [dbo].[tb_JobAplications] ([id], [id_job], [id_candidate], [dateofaplication]) VALUES (1063, 1111, N'802314ee-0dc3-481a-adc6-bce57593d526', CAST(N'2018-08-16' AS Date))
INSERT [dbo].[tb_JobAplications] ([id], [id_job], [id_candidate], [dateofaplication]) VALUES (1064, 1079, N'802314ee-0dc3-481a-adc6-bce57593d526', CAST(N'2018-08-16' AS Date))
INSERT [dbo].[tb_JobAplications] ([id], [id_job], [id_candidate], [dateofaplication]) VALUES (49, 19, N'802314ee-0dc3-481a-adc6-bce57593d526', CAST(N'2018-07-31' AS Date))
SET IDENTITY_INSERT [dbo].[tb_JobAplications] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 16/08/2018 21:29:41 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 16/08/2018 21:29:41 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 16/08/2018 21:29:41 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 16/08/2018 21:29:41 ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 16/08/2018 21:29:41 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 16/08/2018 21:29:41 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AddCandidate]    Script Date: 16/08/2018 21:29:41 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AddCompany]    Script Date: 16/08/2018 21:29:41 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AddJob]    Script Date: 16/08/2018 21:29:41 ******/
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
@name varchar(350),
@description varchar(2500),
@date_publication DATE,
@enable_job BIT,
@id_category int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into tb_Job (company_id, [description], date_publication, enable_job, name,id_category) 
    Values (@company_id, @description, @date_publication, @enable_job,@name,@id_category)


END

GO
/****** Object:  StoredProcedure [dbo].[sp_AddJobAplication]    Script Date: 16/08/2018 21:29:41 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DeleteJob]    Script Date: 16/08/2018 21:29:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteJob] 
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from tb_JobAplications where id_job=@id
	delete from tb_Job where id=@id

END

GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteJobAplication]    Script Date: 16/08/2018 21:29:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteJobAplication] 
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from tb_JobAplications where id=@id

END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetCandidate]    Script Date: 16/08/2018 21:29:41 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetCategory]    Script Date: 16/08/2018 21:29:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[sp_GetCategory] 
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT c.id, c.name
	from tb_Category c
	where c.id=@id

END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetCompany]    Script Date: 16/08/2018 21:29:41 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetJob]    Script Date: 16/08/2018 21:29:41 ******/
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
	SELECT j.id, j.company_id, j.[description], j.date_publication, j.enable_job, j.name, j.id_category
	from tb_Job j
	where j.id=@id

END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetJobAplication]    Script Date: 16/08/2018 21:29:41 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetListCandidate]    Script Date: 16/08/2018 21:29:41 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetListCategories]    Script Date: 16/08/2018 21:29:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[sp_GetListCategories] 
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT c.id,  c.Name
	from tb_Category c

END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetListCompanies]    Script Date: 16/08/2018 21:29:41 ******/
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

	SELECT c.id, c.Description, c.Name
	from tb_Company c

END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetListJobAplication]    Script Date: 16/08/2018 21:29:41 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetListJobs]    Script Date: 16/08/2018 21:29:41 ******/
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
	SELECT j.id, j.company_id, j.[description], j.date_publication, j.enable_job, j.name,j.id_category
	from tb_Job j

END

GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateCandidate]    Script Date: 16/08/2018 21:29:41 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateCompany]    Script Date: 16/08/2018 21:29:41 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateJob]    Script Date: 16/08/2018 21:29:41 ******/
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
@name nvarchar(350),
@description varchar(2550),
@date_publication DATE,
@enable_job BIT,
@id_category int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Update statements for procedure here
	Update tb_Job 
	set company_id=@company_id, description=@description, date_publication=@date_publication, enable_job=@enable_job, name=@name, id_category=@id_category
	where id=@id

END

GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateJobAplication]    Script Date: 16/08/2018 21:29:41 ******/
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
