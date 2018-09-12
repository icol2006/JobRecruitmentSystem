USE [BDRecruitment]
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
