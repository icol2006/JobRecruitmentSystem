
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


CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

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

CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

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

CREATE TABLE [dbo].[tb_Candidate](
	[id] [nvarchar](128) NOT NULL,
	[firstname] [varchar](150) NULL,
	[lastname] [varchar](150) NULL,
	[identification] [int] NULL,
	[resume] [varchar](150) NULL,
	[maritalStatus] [nchar](20) NULL,
	[placeResidence] [nvarchar](150) NULL,
	[phone] [int] NULL,
	[Birthdate] [date] NULL,
	[Nationality] [nvarchar](50) NULL,
 CONSTRAINT [PK_tb_Candidate] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[tb_Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](350) NULL
) ON [PRIMARY]

CREATE TABLE [dbo].[tb_Company](
	[Name] [varchar](150) NULL,
	[Description] [varchar](150) NULL,
	[id] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_tb_Company] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

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

CREATE TABLE [dbo].[tb_JobAplications](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_job] [int] NOT NULL,
	[id_candidate] [nvarchar](128) NOT NULL,
	[dateofaplication] [date] NOT NULL
) ON [PRIMARY]


CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

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




SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON


CREATE PROCEDURE [dbo].[sp_AddCandidate] 
@firtsname varchar(150),
@lastname varchar(150),
@identification int,
@resume varchar(1150),
@user_id nvarchar(128),
@maritalStatus nvarchar(50),
@placeResidence nvarchar(150),
@phone int,
@birthdate date,
@nationality nvarchar(50)
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

	insert into tb_Candidate(firstname,lastname,identification,[resume],id,maritalStatus, placeResidence,phone,Birthdate,Nationality)
	values(@firtsname,@lastname,@identification,@resume,@user_id,@maritalStatus,@placeResidence,@phone,@birthdate,@nationality)


END

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
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

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
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

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
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

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
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

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
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

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [dbo].[sp_GetCandidate] 
	@id nvarchar(128)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	SELECT aspUs.Email as 'email', aspUsRl.RoleId as 'rol', c.firstname, c.lastname, c.identification, c.resume, c.id, 
	c.maritalStatus, c.Nationality, c.phone, c.placeResidence, c.Birthdate
	from  tb_Candidate c, AspNetUsers aspUs, AspNetUserRoles aspUsRl
	where aspUs.Id=c.id and aspUsRl.UserId=aspUs.Id and c.id=@id

END

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
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

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
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

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
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

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
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

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
Create PROCEDURE [dbo].[sp_GetJobAplicationByIdJob] 
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT j.id, j.id_job, j.id_candidate, j.dateofaplication
	from tb_JobAplications j
	where j.id_job=@id

END

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [dbo].[sp_GetListCandidate] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT aspUs.Email as 'email', aspUsRl.RoleId as 'rol', c.firstname, c.lastname, c.identification, c.resume, c.id,
	c.maritalStatus, c.Nationality, c.phone, c.placeResidence, c.Birthdate
	from  tb_Candidate c, AspNetUsers aspUs, AspNetUserRoles aspUsRl
	where aspUs.Id=c.id and aspUsRl.UserId=aspUs.Id 
END

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
create PROCEDURE [dbo].[sp_GetListCategories] 
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT c.id,  c.Name
	from tb_Category c

END

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [dbo].[sp_GetListCompanies] 
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT c.id, c.Description, c.Name
	from tb_Company c

END

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
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

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
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

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [dbo].[sp_UpdateCandidate] 
@id nvarchar(128),
@firtsname varchar(150),
@lastname varchar(150),
@identification int,
@resume varchar(1150),
@maritalStatus nvarchar(50),
@placeResidence nvarchar(150),
@phone int,
@birthdate date,
@nationality nvarchar(50)
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
	identification=@identification, [resume]=@resume,
	maritalStatus=@maritalStatus, placeResidence=@placeResidence,
	phone=@phone, birthdate=@birthdate,nationality=@nationality
	where [id]=@id

END

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
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

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
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

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
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
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1', N'administrator')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'2', N'candidate')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'3', N'company')
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

