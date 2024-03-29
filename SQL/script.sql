USE [Base]
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
ALTER TABLE [dbo].[peliculas_precio] DROP CONSTRAINT [DF__peliculas__estad__6EF57B66]
GO
ALTER TABLE [dbo].[peliculas_categoria] DROP CONSTRAINT [DF__peliculas__estad__71D1E811]
GO
ALTER TABLE [dbo].[peliculas] DROP CONSTRAINT [DF__peliculas__estat__6754599E]
GO
ALTER TABLE [dbo].[peliculas] DROP CONSTRAINT [DF__peliculas__fecha__66603565]
GO
ALTER TABLE [dbo].[pais] DROP CONSTRAINT [DF__pais__nombre_pai__117F9D94]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 21/04/2021 23:42:37 ******/
DROP TABLE [dbo].[usuario]
GO
/****** Object:  Table [dbo].[telefono]    Script Date: 21/04/2021 23:42:37 ******/
DROP TABLE [dbo].[telefono]
GO
/****** Object:  Table [dbo].[peliculas_usuario]    Script Date: 21/04/2021 23:42:37 ******/
DROP TABLE [dbo].[peliculas_usuario]
GO
/****** Object:  Table [dbo].[peliculas_precio]    Script Date: 21/04/2021 23:42:37 ******/
DROP TABLE [dbo].[peliculas_precio]
GO
/****** Object:  Table [dbo].[peliculas_categoria]    Script Date: 21/04/2021 23:42:37 ******/
DROP TABLE [dbo].[peliculas_categoria]
GO
/****** Object:  Table [dbo].[peliculas]    Script Date: 21/04/2021 23:42:37 ******/
DROP TABLE [dbo].[peliculas]
GO
/****** Object:  Table [dbo].[pais]    Script Date: 21/04/2021 23:42:37 ******/
DROP TABLE [dbo].[pais]
GO
/****** Object:  Table [dbo].[login]    Script Date: 21/04/2021 23:42:37 ******/
DROP TABLE [dbo].[login]
GO
/****** Object:  Table [dbo].[ciudad]    Script Date: 21/04/2021 23:42:37 ******/
DROP TABLE [dbo].[ciudad]
GO
/****** Object:  StoredProcedure [dbo].[sp_total_by_usuario]    Script Date: 21/04/2021 23:42:37 ******/
DROP PROCEDURE [dbo].[sp_total_by_usuario]
GO
/****** Object:  StoredProcedure [dbo].[sp_total_all_usuarios]    Script Date: 21/04/2021 23:42:37 ******/
DROP PROCEDURE [dbo].[sp_total_all_usuarios]
GO
/****** Object:  StoredProcedure [dbo].[reservaPelicula]    Script Date: 21/04/2021 23:42:37 ******/
DROP PROCEDURE [dbo].[reservaPelicula]
GO
/****** Object:  StoredProcedure [dbo].[reservaPelicula]    Script Date: 21/04/2021 23:42:37 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_total_all_usuarios]    Script Date: 21/04/2021 23:42:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_total_all_usuarios]
as


SELECT u.id_usuario,u.nombre,sum(precio.precio) as total,precio.tipo
FROM  [dbo].[usuario] u
INNER JOIN [dbo].[peliculas_usuario] p_u
ON u.id_usuario=p_u.id_usuario
INNER JOIN [dbo].[peliculas_precio] precio
ON p_u.tipo=precio.tipo
WHERE precio.tipo='R'


GROUP BY u.id_usuario,u.nombre,precio.tipo


UNION ALL


SELECT u.id_usuario,u.nombre,sum(precio.precio) as total,precio.tipo
FROM  [dbo].[usuario] u
INNER JOIN [dbo].[peliculas_usuario] p_u
ON u.id_usuario=p_u.id_usuario
INNER JOIN [dbo].[peliculas_precio] precio
ON p_u.tipo=precio.tipo
WHERE precio.tipo='C'


GROUP BY u.id_usuario,u.nombre,precio.tipo
GO
/****** Object:  StoredProcedure [dbo].[sp_total_by_usuario]    Script Date: 21/04/2021 23:42:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_total_by_usuario](@id_usuario int)
as


SELECT u.id_usuario,u.nombre,sum(precio.precio) as total,precio.tipo
FROM  [dbo].[usuario] u
INNER JOIN [dbo].[peliculas_usuario] p_u
ON u.id_usuario=p_u.id_usuario
INNER JOIN [dbo].[peliculas_precio] precio
ON p_u.tipo=precio.tipo
WHERE precio.tipo='R'
AND u.id_usuario=@id_usuario

GROUP BY u.id_usuario,u.nombre,precio.tipo
HAVING u.id_usuario=@id_usuario

UNION ALL


SELECT u.id_usuario,u.nombre,sum(precio.precio) as total,precio.tipo
FROM  [dbo].[usuario] u
INNER JOIN [dbo].[peliculas_usuario] p_u
ON u.id_usuario=p_u.id_usuario
INNER JOIN [dbo].[peliculas_precio] precio
ON p_u.tipo=precio.tipo
WHERE precio.tipo='C'
AND u.id_usuario=@id_usuario

GROUP BY u.id_usuario,u.nombre,precio.tipo
HAVING u.id_usuario=@id_usuario

GO
/****** Object:  Table [dbo].[ciudad]    Script Date: 21/04/2021 23:42:37 ******/
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
/****** Object:  Table [dbo].[login]    Script Date: 21/04/2021 23:42:37 ******/
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
/****** Object:  Table [dbo].[pais]    Script Date: 21/04/2021 23:42:37 ******/
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
/****** Object:  Table [dbo].[peliculas]    Script Date: 21/04/2021 23:42:37 ******/
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
/****** Object:  Table [dbo].[peliculas_categoria]    Script Date: 21/04/2021 23:42:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[peliculas_categoria](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_pelicula] [int] NULL,
	[tipo] [varchar](100) NULL,
	[estado] [tinyint] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[peliculas_precio]    Script Date: 21/04/2021 23:42:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[peliculas_precio](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_pelicula] [int] NULL,
	[precio] [money] NULL,
	[tipo] [varchar](2) NULL,
	[estado] [tinyint] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[peliculas_usuario]    Script Date: 21/04/2021 23:42:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[peliculas_usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NULL,
	[id_pelicula] [int] NULL,
	[estatus] [tinyint] NULL,
	[fecha_registro] [datetime] NULL,
	[cantidad] [int] NULL,
	[tipo] [varchar](2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[telefono]    Script Date: 21/04/2021 23:42:37 ******/
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
/****** Object:  Table [dbo].[usuario]    Script Date: 21/04/2021 23:42:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuario](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
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
	[image_path] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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

INSERT [dbo].[peliculas] ([id], [nombre], [fecha_registro], [cantidad], [ruta_pelicula], [estatus]) VALUES (1, N'Rambo3', CAST(0x0000AD070173AED3 AS DateTime), -4, NULL, 0)
INSERT [dbo].[peliculas] ([id], [nombre], [fecha_registro], [cantidad], [ruta_pelicula], [estatus]) VALUES (2, N'Matrix 1', CAST(0x0000AD070173AEDA AS DateTime), 12, NULL, 0)
INSERT [dbo].[peliculas] ([id], [nombre], [fecha_registro], [cantidad], [ruta_pelicula], [estatus]) VALUES (3, N'Terminator', CAST(0x0000AD070173AEDD AS DateTime), 10, NULL, 0)
INSERT [dbo].[peliculas] ([id], [nombre], [fecha_registro], [cantidad], [ruta_pelicula], [estatus]) VALUES (4, N'Duro de Matar 1', CAST(0x0000AD070173AEDF AS DateTime), 5, NULL, 0)
SET IDENTITY_INSERT [dbo].[peliculas] OFF
SET IDENTITY_INSERT [dbo].[peliculas_categoria] ON 

INSERT [dbo].[peliculas_categoria] ([id], [id_pelicula], [tipo], [estado]) VALUES (1, 1, N'Accion/Aventura', 0)
INSERT [dbo].[peliculas_categoria] ([id], [id_pelicula], [tipo], [estado]) VALUES (2, 2, N'Accion/Aventura', 0)
INSERT [dbo].[peliculas_categoria] ([id], [id_pelicula], [tipo], [estado]) VALUES (3, 3, N'Drama', 0)
INSERT [dbo].[peliculas_categoria] ([id], [id_pelicula], [tipo], [estado]) VALUES (4, 4, N'Suspenso', 0)
SET IDENTITY_INSERT [dbo].[peliculas_categoria] OFF
SET IDENTITY_INSERT [dbo].[peliculas_precio] ON 

INSERT [dbo].[peliculas_precio] ([id], [id_pelicula], [precio], [tipo], [estado]) VALUES (1, 1, 100.0000, N'R', 0)
INSERT [dbo].[peliculas_precio] ([id], [id_pelicula], [precio], [tipo], [estado]) VALUES (2, 2, 100.0000, N'R', 0)
INSERT [dbo].[peliculas_precio] ([id], [id_pelicula], [precio], [tipo], [estado]) VALUES (3, 3, 100.0000, N'R', 0)
INSERT [dbo].[peliculas_precio] ([id], [id_pelicula], [precio], [tipo], [estado]) VALUES (4, 4, 100.0000, N'R', 0)
INSERT [dbo].[peliculas_precio] ([id], [id_pelicula], [precio], [tipo], [estado]) VALUES (5, 1, 200.0000, N'C', 0)
INSERT [dbo].[peliculas_precio] ([id], [id_pelicula], [precio], [tipo], [estado]) VALUES (6, 2, 150.0000, N'C', 0)
INSERT [dbo].[peliculas_precio] ([id], [id_pelicula], [precio], [tipo], [estado]) VALUES (7, 3, 50.0000, N'C', 0)
INSERT [dbo].[peliculas_precio] ([id], [id_pelicula], [precio], [tipo], [estado]) VALUES (8, 4, 20.0000, N'C', 0)
SET IDENTITY_INSERT [dbo].[peliculas_precio] OFF
SET IDENTITY_INSERT [dbo].[peliculas_usuario] ON 

INSERT [dbo].[peliculas_usuario] ([id], [id_usuario], [id_pelicula], [estatus], [fecha_registro], [cantidad], [tipo]) VALUES (1, 10, 1, 0, CAST(0x0000AD09014EEA57 AS DateTime), 1, N'R')
INSERT [dbo].[peliculas_usuario] ([id], [id_usuario], [id_pelicula], [estatus], [fecha_registro], [cantidad], [tipo]) VALUES (2, 10, 2, 0, CAST(0x0000AD09014F15AA AS DateTime), 2, N'C')
INSERT [dbo].[peliculas_usuario] ([id], [id_usuario], [id_pelicula], [estatus], [fecha_registro], [cantidad], [tipo]) VALUES (3, 10, 1, 0, CAST(0x0000AD09016334C2 AS DateTime), 1, N'R')
INSERT [dbo].[peliculas_usuario] ([id], [id_usuario], [id_pelicula], [estatus], [fecha_registro], [cantidad], [tipo]) VALUES (4, 0, 1, 0, CAST(0x0000AD090164132C AS DateTime), 1, N'C')
INSERT [dbo].[peliculas_usuario] ([id], [id_usuario], [id_pelicula], [estatus], [fecha_registro], [cantidad], [tipo]) VALUES (5, 10, 1, 0, CAST(0x0000AD1101717166 AS DateTime), 1, NULL)
INSERT [dbo].[peliculas_usuario] ([id], [id_usuario], [id_pelicula], [estatus], [fecha_registro], [cantidad], [tipo]) VALUES (6, 10, 1, 0, CAST(0x0000AD1101727F3C AS DateTime), 1, NULL)
INSERT [dbo].[peliculas_usuario] ([id], [id_usuario], [id_pelicula], [estatus], [fecha_registro], [cantidad], [tipo]) VALUES (7, 10, 1, 0, CAST(0x0000AD110172964F AS DateTime), 1, NULL)
INSERT [dbo].[peliculas_usuario] ([id], [id_usuario], [id_pelicula], [estatus], [fecha_registro], [cantidad], [tipo]) VALUES (8, 0, 1, 0, CAST(0x0000AD11017330EC AS DateTime), 2, NULL)
INSERT [dbo].[peliculas_usuario] ([id], [id_usuario], [id_pelicula], [estatus], [fecha_registro], [cantidad], [tipo]) VALUES (9, 10, 1, 0, CAST(0x0000AD1101742F25 AS DateTime), 2, NULL)
INSERT [dbo].[peliculas_usuario] ([id], [id_usuario], [id_pelicula], [estatus], [fecha_registro], [cantidad], [tipo]) VALUES (12, 9, 1, 0, CAST(0x0000AD110175201A AS DateTime), 2, NULL)
INSERT [dbo].[peliculas_usuario] ([id], [id_usuario], [id_pelicula], [estatus], [fecha_registro], [cantidad], [tipo]) VALUES (19, 10, 2, 0, CAST(0x0000AD110181284E AS DateTime), 1, NULL)
INSERT [dbo].[peliculas_usuario] ([id], [id_usuario], [id_pelicula], [estatus], [fecha_registro], [cantidad], [tipo]) VALUES (10, 10, 1, 0, CAST(0x0000AD1101743C58 AS DateTime), 2, NULL)
INSERT [dbo].[peliculas_usuario] ([id], [id_usuario], [id_pelicula], [estatus], [fecha_registro], [cantidad], [tipo]) VALUES (22, 10, 2, 0, CAST(0x0000AD1101858BD8 AS DateTime), 1, NULL)
INSERT [dbo].[peliculas_usuario] ([id], [id_usuario], [id_pelicula], [estatus], [fecha_registro], [cantidad], [tipo]) VALUES (11, 9, 1, 0, CAST(0x0000AD110174C65B AS DateTime), 2, NULL)
INSERT [dbo].[peliculas_usuario] ([id], [id_usuario], [id_pelicula], [estatus], [fecha_registro], [cantidad], [tipo]) VALUES (13, 10, 1, 0, CAST(0x0000AD110176025F AS DateTime), 2, NULL)
INSERT [dbo].[peliculas_usuario] ([id], [id_usuario], [id_pelicula], [estatus], [fecha_registro], [cantidad], [tipo]) VALUES (14, 10, 1, 0, CAST(0x0000AD110177E5F7 AS DateTime), 2, NULL)
INSERT [dbo].[peliculas_usuario] ([id], [id_usuario], [id_pelicula], [estatus], [fecha_registro], [cantidad], [tipo]) VALUES (15, 10, 2, 0, CAST(0x0000AD110178C323 AS DateTime), 1, NULL)
INSERT [dbo].[peliculas_usuario] ([id], [id_usuario], [id_pelicula], [estatus], [fecha_registro], [cantidad], [tipo]) VALUES (16, 10, 1, 0, CAST(0x0000AD11017CBD80 AS DateTime), 2, NULL)
INSERT [dbo].[peliculas_usuario] ([id], [id_usuario], [id_pelicula], [estatus], [fecha_registro], [cantidad], [tipo]) VALUES (17, 11, 2, 0, CAST(0x0000AD11017FD9B6 AS DateTime), 1, NULL)
INSERT [dbo].[peliculas_usuario] ([id], [id_usuario], [id_pelicula], [estatus], [fecha_registro], [cantidad], [tipo]) VALUES (18, 11, 1, 0, CAST(0x0000AD110180A5EE AS DateTime), 2, NULL)
INSERT [dbo].[peliculas_usuario] ([id], [id_usuario], [id_pelicula], [estatus], [fecha_registro], [cantidad], [tipo]) VALUES (20, 9, 2, 0, CAST(0x0000AD110182B97A AS DateTime), 1, NULL)
INSERT [dbo].[peliculas_usuario] ([id], [id_usuario], [id_pelicula], [estatus], [fecha_registro], [cantidad], [tipo]) VALUES (21, 9, 2, 0, CAST(0x0000AD110184549B AS DateTime), 1, NULL)
SET IDENTITY_INSERT [dbo].[peliculas_usuario] OFF
INSERT [dbo].[telefono] ([id_telefono], [numero], [tipo]) VALUES (1, N'83131815', 1)
INSERT [dbo].[telefono] ([id_telefono], [numero], [tipo]) VALUES (2, N'0448116137002', 2)
SET IDENTITY_INSERT [dbo].[usuario] ON 

INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [estados_civil], [telefono], [id_pais_fk], [ciudad], [id_telefono_fk], [fecha_registro], [estatus_borrado], [image_path]) VALUES (1, N'saaa', N'&nbsp;', 21, 1, N'83254585', N'3', N'3', N'83254585', CAST(0xCE400B00 AS Date), 1, N'https://www.iconninja.com/files/634/848/842/man-user-customer-icon.png')
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [estados_civil], [telefono], [id_pais_fk], [ciudad], [id_telefono_fk], [fecha_registro], [estatus_borrado], [image_path]) VALUES (2, N'lalolanda', N'cardenas', 21, 1, N'83254585', N'1', N'Monterrey', N'83254585', CAST(0xD2400B00 AS Date), 1, N'https://www.iconninja.com/files/634/848/842/man-user-customer-icon.png')
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [estados_civil], [telefono], [id_pais_fk], [ciudad], [id_telefono_fk], [fecha_registro], [estatus_borrado], [image_path]) VALUES (3, N'luisfffxxxyyyjjjjjjbvbmxxxjjjNNN', N'&nbsp;', 32, 1, N'luis', NULL, N'0', NULL, NULL, 1, N'https://www.iconninja.com/files/634/848/842/man-user-customer-icon.png')
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [estados_civil], [telefono], [id_pais_fk], [ciudad], [id_telefono_fk], [fecha_registro], [estatus_borrado], [image_path]) VALUES (4, N'luisfffxxxyyyjjjjjjbvbmxxxjjjNNN', N'&nbsp;', 32, 1, N'luis', NULL, N'0', NULL, NULL, 1, N'https://www.iconninja.com/files/634/848/842/man-user-customer-icon.png')
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [estados_civil], [telefono], [id_pais_fk], [ciudad], [id_telefono_fk], [fecha_registro], [estatus_borrado], [image_path]) VALUES (5, N'Jorgex', N'&nbsp;', 34, 1, N'83123815', NULL, N'Monterrey', NULL, NULL, 1, N'https://www.iconninja.com/files/634/848/842/man-user-customer-icon.png')
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [estados_civil], [telefono], [id_pais_fk], [ciudad], [id_telefono_fk], [fecha_registro], [estatus_borrado], [image_path]) VALUES (6, N'Jorgex', N'&nbsp;', 34, 1, N'83123815', NULL, N'Monterrey', NULL, NULL, 1, N'https://www.iconninja.com/files/634/848/842/man-user-customer-icon.png')
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [estados_civil], [telefono], [id_pais_fk], [ciudad], [id_telefono_fk], [fecha_registro], [estatus_borrado], [image_path]) VALUES (7, N'Jorgex', N'&nbsp;', 34, 1, N'83123815', NULL, N'Monterrey', NULL, NULL, 1, N'https://www.iconninja.com/files/634/848/842/man-user-customer-icon.png')
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [estados_civil], [telefono], [id_pais_fk], [ciudad], [id_telefono_fk], [fecha_registro], [estatus_borrado], [image_path]) VALUES (8, N'Jorgex', N'&nbsp;', 34, 1, N'83123815', NULL, N'Monterrey', NULL, NULL, 1, N'https://www.iconninja.com/files/634/848/842/man-user-customer-icon.png')
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [estados_civil], [telefono], [id_pais_fk], [ciudad], [id_telefono_fk], [fecha_registro], [estatus_borrado], [image_path]) VALUES (9, N'Jorgex', N'&nbsp;', 34, 1, N'83123815', NULL, N'Monterrey', NULL, NULL, 0, NULL)
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [estados_civil], [telefono], [id_pais_fk], [ciudad], [id_telefono_fk], [fecha_registro], [estatus_borrado], [image_path]) VALUES (10, N'Luis_pensativo', N'Cardenas', 34, 1, N'83123815', NULL, N'Mexico', NULL, NULL, 0, NULL)
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [estados_civil], [telefono], [id_pais_fk], [ciudad], [id_telefono_fk], [fecha_registro], [estatus_borrado], [image_path]) VALUES (11, N'Isabel', N'Cardenas', 32, 2, N'83123815', NULL, N'Monterrey', NULL, NULL, 0, NULL)
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [estados_civil], [telefono], [id_pais_fk], [ciudad], [id_telefono_fk], [fecha_registro], [estatus_borrado], [image_path]) VALUES (12, N'Jorgex', N'&nbsp;', 34, 1, N'83123815', NULL, N'Monterrey', NULL, NULL, 1, N'https://www.iconninja.com/files/634/848/842/man-user-customer-icon.png')
SET IDENTITY_INSERT [dbo].[usuario] OFF
ALTER TABLE [dbo].[pais] ADD  DEFAULT (NULL) FOR [nombre_pais]
GO
ALTER TABLE [dbo].[peliculas] ADD  DEFAULT (getdate()) FOR [fecha_registro]
GO
ALTER TABLE [dbo].[peliculas] ADD  DEFAULT ((0)) FOR [estatus]
GO
ALTER TABLE [dbo].[peliculas_categoria] ADD  DEFAULT ((0)) FOR [estado]
GO
ALTER TABLE [dbo].[peliculas_precio] ADD  DEFAULT ((0)) FOR [estado]
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
