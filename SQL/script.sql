USE [Base]
GO
ALTER TABLE [dbo].[usuario] DROP CONSTRAINT [DF__usuario__image_p__47DBAE45]
GO
ALTER TABLE [dbo].[usuario] DROP CONSTRAINT [usuario_constraint]
GO
ALTER TABLE [dbo].[usuario] DROP CONSTRAINT [DF__usuario__fecha_r__276EDEB3]
GO
ALTER TABLE [dbo].[usuario] DROP CONSTRAINT [DF__usuario__id_tele__267ABA7A]
GO
ALTER TABLE [dbo].[usuario] DROP CONSTRAINT [DF__usuario__ciudad__25869641]
GO
ALTER TABLE [dbo].[usuario] DROP CONSTRAINT [DF__usuario__id_pais__24927208]
GO
ALTER TABLE [dbo].[usuario] DROP CONSTRAINT [DF__usuario__telefon__239E4DCF]
GO
ALTER TABLE [dbo].[usuario] DROP CONSTRAINT [DF__usuario__estados__22AA2996]
GO
ALTER TABLE [dbo].[usuario] DROP CONSTRAINT [DF__usuario__edad__21B6055D]
GO
ALTER TABLE [dbo].[usuario] DROP CONSTRAINT [DF__usuario__apellid__20C1E124]
GO
ALTER TABLE [dbo].[usuario] DROP CONSTRAINT [DF__usuario__nombre__1FCDBCEB]
GO
ALTER TABLE [dbo].[telefono] DROP CONSTRAINT [DF__telefono__tipo__145C0A3F]
GO
ALTER TABLE [dbo].[telefono] DROP CONSTRAINT [DF__telefono__numero__1367E606]
GO
ALTER TABLE [dbo].[peliculas_usuario] DROP CONSTRAINT [DF__peliculas__canti__693CA210]
GO
ALTER TABLE [dbo].[peliculas_usuario] DROP CONSTRAINT [DF__peliculas__fecha__6383C8BA]
GO
ALTER TABLE [dbo].[peliculas_usuario] DROP CONSTRAINT [DF__peliculas__estat__628FA481]
GO
ALTER TABLE [dbo].[peliculas] DROP CONSTRAINT [DF__peliculas__estat__6754599E]
GO
ALTER TABLE [dbo].[peliculas] DROP CONSTRAINT [DF__peliculas__fecha__66603565]
GO
ALTER TABLE [dbo].[pais] DROP CONSTRAINT [DF__pais__nombre_pai__117F9D94]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 13/04/2021 21:42:33 ******/
DROP TABLE [dbo].[usuario]
GO
/****** Object:  Table [dbo].[telefono]    Script Date: 13/04/2021 21:42:33 ******/
DROP TABLE [dbo].[telefono]
GO
/****** Object:  Table [dbo].[peliculas_usuario]    Script Date: 13/04/2021 21:42:33 ******/
DROP TABLE [dbo].[peliculas_usuario]
GO
/****** Object:  Table [dbo].[peliculas]    Script Date: 13/04/2021 21:42:33 ******/
DROP TABLE [dbo].[peliculas]
GO
/****** Object:  Table [dbo].[pais]    Script Date: 13/04/2021 21:42:33 ******/
DROP TABLE [dbo].[pais]
GO
/****** Object:  Table [dbo].[login]    Script Date: 13/04/2021 21:42:33 ******/
DROP TABLE [dbo].[login]
GO
/****** Object:  Table [dbo].[ciudad]    Script Date: 13/04/2021 21:42:33 ******/
DROP TABLE [dbo].[ciudad]
GO
/****** Object:  StoredProcedure [dbo].[reservaPelicula]    Script Date: 13/04/2021 21:42:33 ******/
DROP PROCEDURE [dbo].[reservaPelicula]
GO
/****** Object:  StoredProcedure [dbo].[reservaPelicula]    Script Date: 13/04/2021 21:42:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[reservaPelicula](@id_usuario int,@id_pelicula int,@cantidad int)
	AS
	BEGIN
	IF(@cantidad>0)
	BEGIN

	BEGIN TRANSACTION

	UPDATE peliculas
	SET cantidad=cantidad -@cantidad
	WHERE id=@id_pelicula


	INSERT INTO [dbo].[peliculas_usuario]
	(id_usuario,id_pelicula,cantidad) VALUES(@id_usuario,@id_pelicula,@cantidad)

	IF(@@ERROR)>0
	BEGIN
	ROLLBACK
	END

	ELSE
	BEGIN
	COMMIT
	END 


	END --fin transaccion
	END

GO
/****** Object:  Table [dbo].[ciudad]    Script Date: 13/04/2021 21:42:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ciudad](
	[id_ciudad] [int] NOT NULL,
	[nombre_ciudad] [varchar](100) NOT NULL,
	[id_pais_fk] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[login]    Script Date: 13/04/2021 21:42:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[login](
	[id] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[pass] [varchar](100) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[pais]    Script Date: 13/04/2021 21:42:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pais](
	[id_pais] [int] NOT NULL,
	[nombre_pais] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[peliculas]    Script Date: 13/04/2021 21:42:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[peliculas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[fecha_registro] [datetime] NULL,
	[cantidad] [int] NULL,
	[ruta_pelicula] [varchar](150) NULL,
	[estatus] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[peliculas_usuario]    Script Date: 13/04/2021 21:42:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[peliculas_usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NULL,
	[id_pelicula] [int] NULL,
	[estatus] [tinyint] NULL,
	[fecha_registro] [datetime] NULL,
	[cantidad] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[telefono]    Script Date: 13/04/2021 21:42:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[telefono](
	[id_telefono] [int] NOT NULL,
	[numero] [varchar](15) NULL,
	[tipo] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 13/04/2021 21:42:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuario](
	[id_usuario] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[edad] [int] NULL,
	[estados_civil] [tinyint] NULL,
	[telefono] [varchar](50) NULL,
	[id_pais_fk] [varchar](15) NULL,
	[ciudad] [varchar](100) NULL,
	[id_telefono_fk] [varchar](15) NULL,
	[fecha_registro] [date] NULL,
	[estatus_borrado] [tinyint] NULL,
	[image_path] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[login] ([id], [nombre], [pass]) VALUES (1, N'Luis', N'1234')
INSERT [dbo].[pais] ([id_pais], [nombre_pais]) VALUES (1, N'Mexico')
INSERT [dbo].[pais] ([id_pais], [nombre_pais]) VALUES (2, N'Spain')
INSERT [dbo].[pais] ([id_pais], [nombre_pais]) VALUES (3, N'Colombia')
INSERT [dbo].[pais] ([id_pais], [nombre_pais]) VALUES (4, N'Usa')
INSERT [dbo].[pais] ([id_pais], [nombre_pais]) VALUES (5, N'Otros')
SET IDENTITY_INSERT [dbo].[peliculas] ON 

INSERT [dbo].[peliculas] ([id], [nombre], [fecha_registro], [cantidad], [ruta_pelicula], [estatus]) VALUES (1, N'Rambo3', CAST(0x0000AD070173AED3 AS DateTime), 17, NULL, 0)
INSERT [dbo].[peliculas] ([id], [nombre], [fecha_registro], [cantidad], [ruta_pelicula], [estatus]) VALUES (2, N'Matrix 1', CAST(0x0000AD070173AEDA AS DateTime), 18, NULL, 0)
INSERT [dbo].[peliculas] ([id], [nombre], [fecha_registro], [cantidad], [ruta_pelicula], [estatus]) VALUES (3, N'Terminator', CAST(0x0000AD070173AEDD AS DateTime), 10, NULL, 0)
INSERT [dbo].[peliculas] ([id], [nombre], [fecha_registro], [cantidad], [ruta_pelicula], [estatus]) VALUES (4, N'Duro de Matar 1', CAST(0x0000AD070173AEDF AS DateTime), 5, NULL, 0)
SET IDENTITY_INSERT [dbo].[peliculas] OFF
SET IDENTITY_INSERT [dbo].[peliculas_usuario] ON 

INSERT [dbo].[peliculas_usuario] ([id], [id_usuario], [id_pelicula], [estatus], [fecha_registro], [cantidad]) VALUES (1, 10, 1, 0, CAST(0x0000AD09014EEA57 AS DateTime), 1)
INSERT [dbo].[peliculas_usuario] ([id], [id_usuario], [id_pelicula], [estatus], [fecha_registro], [cantidad]) VALUES (2, 10, 2, 0, CAST(0x0000AD09014F15AA AS DateTime), 2)
INSERT [dbo].[peliculas_usuario] ([id], [id_usuario], [id_pelicula], [estatus], [fecha_registro], [cantidad]) VALUES (3, 10, 1, 0, CAST(0x0000AD09016334C2 AS DateTime), 1)
INSERT [dbo].[peliculas_usuario] ([id], [id_usuario], [id_pelicula], [estatus], [fecha_registro], [cantidad]) VALUES (4, 0, 1, 0, CAST(0x0000AD090164132C AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[peliculas_usuario] OFF
INSERT [dbo].[telefono] ([id_telefono], [numero], [tipo]) VALUES (1, N'83131815', 1)
INSERT [dbo].[telefono] ([id_telefono], [numero], [tipo]) VALUES (2, N'0448116137002', 2)
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [estados_civil], [telefono], [id_pais_fk], [ciudad], [id_telefono_fk], [fecha_registro], [estatus_borrado], [image_path]) VALUES (5, N'saaa', N'&nbsp;', 21, 1, N'83254585', N'3', N'3', N'83254585', CAST(0xCE400B00 AS Date), 1, N'https://www.iconninja.com/files/634/848/842/man-user-customer-icon.png')
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [estados_civil], [telefono], [id_pais_fk], [ciudad], [id_telefono_fk], [fecha_registro], [estatus_borrado], [image_path]) VALUES (6, N'lalolanda', N'cardenas', 21, 1, N'83254585', N'1', N'Monterrey', N'83254585', CAST(0xD2400B00 AS Date), 1, N'https://www.iconninja.com/files/634/848/842/man-user-customer-icon.png')
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [estados_civil], [telefono], [id_pais_fk], [ciudad], [id_telefono_fk], [fecha_registro], [estatus_borrado], [image_path]) VALUES (9, N'luisfffxxxyyyjjjjjjbvbmxxxjjjNNN', N'&nbsp;', 32, 1, N'luis', NULL, N'0', NULL, NULL, 1, N'https://www.iconninja.com/files/634/848/842/man-user-customer-icon.png')
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [estados_civil], [telefono], [id_pais_fk], [ciudad], [id_telefono_fk], [fecha_registro], [estatus_borrado], [image_path]) VALUES (9, N'luisfffxxxyyyjjjjjjbvbmxxxjjjNNN', N'&nbsp;', 32, 1, N'luis', NULL, N'0', NULL, NULL, 1, N'https://www.iconninja.com/files/634/848/842/man-user-customer-icon.png')
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [estados_civil], [telefono], [id_pais_fk], [ciudad], [id_telefono_fk], [fecha_registro], [estatus_borrado], [image_path]) VALUES (10, N'Jorgex', N'&nbsp;', 34, 1, N'83123815', NULL, N'Monterrey', NULL, NULL, 1, N'https://www.iconninja.com/files/634/848/842/man-user-customer-icon.png')
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [estados_civil], [telefono], [id_pais_fk], [ciudad], [id_telefono_fk], [fecha_registro], [estatus_borrado], [image_path]) VALUES (10, N'Jorgex', N'&nbsp;', 34, 1, N'83123815', NULL, N'Monterrey', NULL, NULL, 1, N'https://www.iconninja.com/files/634/848/842/man-user-customer-icon.png')
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [estados_civil], [telefono], [id_pais_fk], [ciudad], [id_telefono_fk], [fecha_registro], [estatus_borrado], [image_path]) VALUES (10, N'Jorgex', N'&nbsp;', 34, 1, N'83123815', NULL, N'Monterrey', NULL, NULL, 1, N'https://www.iconninja.com/files/634/848/842/man-user-customer-icon.png')
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [estados_civil], [telefono], [id_pais_fk], [ciudad], [id_telefono_fk], [fecha_registro], [estatus_borrado], [image_path]) VALUES (10, N'Jorgex', N'&nbsp;', 34, 1, N'83123815', NULL, N'Monterrey', NULL, NULL, 1, N'https://www.iconninja.com/files/634/848/842/man-user-customer-icon.png')
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [estados_civil], [telefono], [id_pais_fk], [ciudad], [id_telefono_fk], [fecha_registro], [estatus_borrado], [image_path]) VALUES (10, N'Jorgex', N'&nbsp;', 34, 1, N'83123815', NULL, N'Monterrey', NULL, NULL, 0, NULL)
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [estados_civil], [telefono], [id_pais_fk], [ciudad], [id_telefono_fk], [fecha_registro], [estatus_borrado], [image_path]) VALUES (10, N'Luis_pensativo', N'Cardenas', 34, 1, N'83123815', NULL, N'Mexico', NULL, NULL, 0, NULL)
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [estados_civil], [telefono], [id_pais_fk], [ciudad], [id_telefono_fk], [fecha_registro], [estatus_borrado], [image_path]) VALUES (10, N'Isabel', N'Cardenas', 32, 2, N'83123815', NULL, N'Monterrey', NULL, NULL, 0, NULL)
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [estados_civil], [telefono], [id_pais_fk], [ciudad], [id_telefono_fk], [fecha_registro], [estatus_borrado], [image_path]) VALUES (10, N'Jorgex', N'&nbsp;', 34, 1, N'83123815', NULL, N'Monterrey', NULL, NULL, 1, N'https://www.iconninja.com/files/634/848/842/man-user-customer-icon.png')
ALTER TABLE [dbo].[pais] ADD  DEFAULT (NULL) FOR [nombre_pais]
GO
ALTER TABLE [dbo].[peliculas] ADD  DEFAULT (getdate()) FOR [fecha_registro]
GO
ALTER TABLE [dbo].[peliculas] ADD  DEFAULT ((0)) FOR [estatus]
GO
ALTER TABLE [dbo].[peliculas_usuario] ADD  DEFAULT ((0)) FOR [estatus]
GO
ALTER TABLE [dbo].[peliculas_usuario] ADD  DEFAULT (getdate()) FOR [fecha_registro]
GO
ALTER TABLE [dbo].[peliculas_usuario] ADD  DEFAULT ((0)) FOR [cantidad]
GO
ALTER TABLE [dbo].[telefono] ADD  DEFAULT (NULL) FOR [numero]
GO
ALTER TABLE [dbo].[telefono] ADD  DEFAULT (NULL) FOR [tipo]
GO
ALTER TABLE [dbo].[usuario] ADD  DEFAULT (NULL) FOR [nombre]
GO
ALTER TABLE [dbo].[usuario] ADD  DEFAULT (NULL) FOR [apellido]
GO
ALTER TABLE [dbo].[usuario] ADD  DEFAULT (NULL) FOR [edad]
GO
ALTER TABLE [dbo].[usuario] ADD  DEFAULT (NULL) FOR [estados_civil]
GO
ALTER TABLE [dbo].[usuario] ADD  DEFAULT (NULL) FOR [telefono]
GO
ALTER TABLE [dbo].[usuario] ADD  DEFAULT (NULL) FOR [id_pais_fk]
GO
ALTER TABLE [dbo].[usuario] ADD  DEFAULT (NULL) FOR [ciudad]
GO
ALTER TABLE [dbo].[usuario] ADD  DEFAULT (NULL) FOR [id_telefono_fk]
GO
ALTER TABLE [dbo].[usuario] ADD  DEFAULT (NULL) FOR [fecha_registro]
GO
ALTER TABLE [dbo].[usuario] ADD  CONSTRAINT [usuario_constraint]  DEFAULT ((0)) FOR [estatus_borrado]
GO
ALTER TABLE [dbo].[usuario] ADD  DEFAULT (NULL) FOR [image_path]
GO
