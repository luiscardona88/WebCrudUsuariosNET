USE [master]
GO
/****** Object:  Database [Base]    Script Date: 01/11/2020 17:37:36 ******/
CREATE DATABASE [Base]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Base', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Base.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Base_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Base_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Base] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Base].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Base] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Base] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Base] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Base] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Base] SET ARITHABORT OFF 
GO
ALTER DATABASE [Base] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Base] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Base] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Base] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Base] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Base] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Base] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Base] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Base] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Base] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Base] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Base] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Base] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Base] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Base] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Base] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Base] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Base] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Base] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Base] SET  MULTI_USER 
GO
ALTER DATABASE [Base] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Base] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Base] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Base] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Base]
GO
/****** Object:  Table [dbo].[ciudad]    Script Date: 01/11/2020 17:37:36 ******/
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
/****** Object:  Table [dbo].[login]    Script Date: 01/11/2020 17:37:36 ******/
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
/****** Object:  Table [dbo].[pais]    Script Date: 01/11/2020 17:37:36 ******/
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
/****** Object:  Table [dbo].[telefono]    Script Date: 01/11/2020 17:37:36 ******/
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
/****** Object:  Table [dbo].[usuario]    Script Date: 01/11/2020 17:37:36 ******/
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
	[estatus_borrado] [tinyint] NULL
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
INSERT [dbo].[telefono] ([id_telefono], [numero], [tipo]) VALUES (1, N'83131815', 1)
INSERT [dbo].[telefono] ([id_telefono], [numero], [tipo]) VALUES (2, N'0448116137002', 2)
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [estados_civil], [telefono], [id_pais_fk], [ciudad], [id_telefono_fk], [fecha_registro], [estatus_borrado]) VALUES (5, N'saaa', N'&nbsp;', 21, 1, N'83254585', N'3', N'3', N'83254585', CAST(0xCE400B00 AS Date), 1)
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [estados_civil], [telefono], [id_pais_fk], [ciudad], [id_telefono_fk], [fecha_registro], [estatus_borrado]) VALUES (6, N'lalolanda', N'cardenas', 21, 1, N'83254585', N'1', N'Monterrey', N'83254585', CAST(0xD2400B00 AS Date), 1)
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [estados_civil], [telefono], [id_pais_fk], [ciudad], [id_telefono_fk], [fecha_registro], [estatus_borrado]) VALUES (9, N'luisfffxxxyyyjjjjjjbvbmxxxjjjNNN', N'&nbsp;', 32, 1, N'luis', NULL, N'0', NULL, NULL, 0)
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [estados_civil], [telefono], [id_pais_fk], [ciudad], [id_telefono_fk], [fecha_registro], [estatus_borrado]) VALUES (9, N'luisfffxxxyyyjjjjjjbvbmxxxjjjNNN', N'&nbsp;', 32, 1, N'luis', NULL, N'0', NULL, NULL, 0)
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [estados_civil], [telefono], [id_pais_fk], [ciudad], [id_telefono_fk], [fecha_registro], [estatus_borrado]) VALUES (10, N'55', N'12121', 11, 111, N'1', NULL, N'8122317791', NULL, NULL, 1)
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [estados_civil], [telefono], [id_pais_fk], [ciudad], [id_telefono_fk], [fecha_registro], [estatus_borrado]) VALUES (10, N'55', N'44', 44, 4, N'1', NULL, N'ff', NULL, NULL, 1)
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [estados_civil], [telefono], [id_pais_fk], [ciudad], [id_telefono_fk], [fecha_registro], [estatus_borrado]) VALUES (10, N'', N'ss', 121, 121, N'1', NULL, N'1211', NULL, NULL, 1)
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [estados_civil], [telefono], [id_pais_fk], [ciudad], [id_telefono_fk], [fecha_registro], [estatus_borrado]) VALUES (10, N'', N'xxxx', 66, 111, N'1', NULL, N'8122317791', NULL, NULL, 0)
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellido], [edad], [estados_civil], [telefono], [id_pais_fk], [ciudad], [id_telefono_fk], [fecha_registro], [estatus_borrado]) VALUES (10, N'dddd', N'xxxx', 111, 1, N'8122317791', NULL, N'Apodaca', NULL, NULL, 0)
ALTER TABLE [dbo].[pais] ADD  DEFAULT (NULL) FOR [nombre_pais]
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
USE [master]
GO
ALTER DATABASE [Base] SET  READ_WRITE 
GO
