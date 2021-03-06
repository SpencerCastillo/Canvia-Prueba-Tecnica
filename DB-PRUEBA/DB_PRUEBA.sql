USE [master]
GO
/****** Object:  Database [DB_PRUEBA]    Script Date: 15/06/2022 03:19:29 p. m. ******/
CREATE DATABASE [DB_PRUEBA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_PRUEBA_SISTEMA', FILENAME = N'D:\SQLSERVER2019\DB_PRUEBA\DATA\DB_PRUEBA_SISTEMA.mdf' , SIZE = 102400KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%), 
 FILEGROUP [FG_AUDITORIA] 
( NAME = N'DB_PRUEBA_AUDITORIA', FILENAME = N'D:\SQLSERVER2019\DB_PRUEBA\DATA\DB_PRUEBA_AUDITORIA.ndf' , SIZE = 102400KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%), 
 FILEGROUP [FG_BINARIO] 
( NAME = N'BDB_PRUEBA_BINARIO', FILENAME = N'D:\SQLSERVER2019\DB_PRUEBA\DATA\DB_PRUEBA_BINARIO.ndf' , SIZE = 102400KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%), 
 FILEGROUP [FG_DATA] 
( NAME = N'DB_PRUEBA_DATA', FILENAME = N'D:\SQLSERVER2019\DB_PRUEBA\DATA\DB_PRUEBA_DATA.ndf' , SIZE = 102400KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%), 
 FILEGROUP [FG_HISTORICO] 
( NAME = N'DB_PRUEBA_HISTORICO', FILENAME = N'D:\SQLSERVER2019\DB_PRUEBA\DATA\DB_PRUEBA_HISTORICO.ndf' , SIZE = 102400KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%), 
 FILEGROUP [FG_INDICE] 
( NAME = N'BDB_PRUEBA_INDICE', FILENAME = N'D:\SQLSERVER2019\DB_PRUEBA\DATA\DB_PRUEBA_INDICE.ndf' , SIZE = 102400KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'DB_PRUEBA_SISTEMA_log', FILENAME = N'D:\SQLSERVER2019\DB_PRUEBA\DATA\DB_PRUEBA_SISTEMA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DB_PRUEBA] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_PRUEBA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_PRUEBA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_PRUEBA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_PRUEBA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_PRUEBA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_PRUEBA] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_PRUEBA] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DB_PRUEBA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_PRUEBA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_PRUEBA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_PRUEBA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_PRUEBA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_PRUEBA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_PRUEBA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_PRUEBA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_PRUEBA] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB_PRUEBA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_PRUEBA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_PRUEBA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_PRUEBA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_PRUEBA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_PRUEBA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_PRUEBA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_PRUEBA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_PRUEBA] SET  MULTI_USER 
GO
ALTER DATABASE [DB_PRUEBA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_PRUEBA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_PRUEBA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_PRUEBA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_PRUEBA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_PRUEBA] SET QUERY_STORE = OFF
GO
USE [DB_PRUEBA]
GO
/****** Object:  Schema [FACT]    Script Date: 15/06/2022 03:19:29 p. m. ******/
CREATE SCHEMA [FACT]
GO
/****** Object:  Table [FACT].[DET_FACTURA_DETALLE]    Script Date: 15/06/2022 03:19:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FACT].[DET_FACTURA_DETALLE](
	[inIdFacturaDetalle] [int] IDENTITY(1,1) NOT NULL,
	[inIdFactura] [int] NOT NULL,
	[inIdItem] [int] NOT NULL,
	[vcItem] [varchar](500) NOT NULL,
	[dePrecio] [decimal](18, 2) NOT NULL,
	[inCantidad] [int] NOT NULL,
	[deSubTotal] [decimal](18, 2) NOT NULL,
	[deImpuesto] [decimal](18, 2) NOT NULL,
	[deTotal] [decimal](18, 2) NOT NULL,
	[biNoEliminadoLogicoBD] [bit] NULL,
	[chTipoOperacion_Aud] [char](1) NULL,
	[inCodUsuario_Aud] [int] NULL,
	[dtFecOperacion_Aud] [datetime] NULL,
	[vcNomSistemaOperacion_Aud] [varchar](100) NULL,
	[vcModuloSistema_Aud] [varchar](100) NULL,
	[vcProcedimientoAlmacenado_Aud] [varchar](200) NULL,
	[vcNomTerminalRegistro_Aud] [varchar](100) NULL,
	[vcIPTerminalRegistro_Aud] [varchar](100) NULL,
	[vcObservaciones_Aud] [varchar](400) NULL,
 CONSTRAINT [PK_FACT_DET_FACTURA_DETALLE] PRIMARY KEY CLUSTERED 
(
	[inIdFacturaDetalle] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_DATA]
) ON [FG_DATA]
GO
/****** Object:  Table [FACT].[MAE_CLIENTE]    Script Date: 15/06/2022 03:19:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FACT].[MAE_CLIENTE](
	[inIdCliente] [int] IDENTITY(1,1) NOT NULL,
	[chTipoPersona] [char](1) NULL,
	[vcNumeroDocumento] [varchar](20) NOT NULL,
	[nvApellidoPaterno] [nvarchar](100) NOT NULL,
	[nvApellidoMaterno] [nvarchar](100) NULL,
	[nvNombres] [nvarchar](100) NOT NULL,
	[vcRazonSocial] [varchar](300) NULL,
	[vcEmail] [varchar](200) NULL,
	[vcDireccion] [varchar](300) NULL,
	[chSexo] [char](1) NULL,
	[biNoEliminadoLogicoBD] [bit] NULL,
	[chTipoOperacion_Aud] [char](1) NULL,
	[inCodUsuario_Aud] [int] NULL,
	[dtFecOperacion_Aud] [datetime] NULL,
	[vcNomSistemaOperacion_Aud] [varchar](100) NULL,
	[vcModuloSistema_Aud] [varchar](100) NULL,
	[vcProcedimientoAlmacenado_Aud] [varchar](200) NULL,
	[vcNomTerminalRegistro_Aud] [varchar](100) NULL,
	[vcIPTerminalRegistro_Aud] [varchar](100) NULL,
	[vcObservaciones_Aud] [varchar](400) NULL,
 CONSTRAINT [PK_FACT_MAE_CLIENTE] PRIMARY KEY CLUSTERED 
(
	[inIdCliente] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_DATA]
) ON [FG_DATA]
GO
/****** Object:  Table [FACT].[MAE_ITEM]    Script Date: 15/06/2022 03:19:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FACT].[MAE_ITEM](
	[inIdItem] [int] IDENTITY(1,1) NOT NULL,
	[vcDescripcionItem] [varchar](500) NOT NULL,
	[dePrecio] [decimal](18, 2) NOT NULL,
	[inStockMinimo] [int] NOT NULL,
	[biNoEliminadoLogicoBD] [bit] NULL,
	[chTipoOperacion_Aud] [char](1) NULL,
	[inCodUsuario_Aud] [int] NULL,
	[dtFecOperacion_Aud] [datetime] NULL,
	[vcNomSistemaOperacion_Aud] [varchar](100) NULL,
	[vcModuloSistema_Aud] [varchar](100) NULL,
	[vcProcedimientoAlmacenado_Aud] [varchar](200) NULL,
	[vcNomTerminalRegistro_Aud] [varchar](100) NULL,
	[vcIPTerminalRegistro_Aud] [varchar](100) NULL,
	[vcObservaciones_Aud] [varchar](400) NULL,
 CONSTRAINT [PK_FACT_MAE_ITEM] PRIMARY KEY CLUSTERED 
(
	[inIdItem] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_DATA]
) ON [FG_DATA]
GO
/****** Object:  Table [FACT].[TAB_FACTURA]    Script Date: 15/06/2022 03:19:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FACT].[TAB_FACTURA](
	[inIdFactura] [int] IDENTITY(1,1) NOT NULL,
	[vcSerie] [varchar](5) NOT NULL,
	[vcNumeroComprobante] [varchar](10) NOT NULL,
	[inIdCliente] [int] NOT NULL,
	[vcNumeroDocumentoCliente] [varchar](20) NOT NULL,
	[vcCliente] [varchar](300) NULL,
	[deSubTotal] [decimal](18, 2) NOT NULL,
	[deImpuesto] [decimal](18, 2) NOT NULL,
	[deTotal] [decimal](18, 2) NOT NULL,
	[biNoEliminadoLogicoBD] [bit] NULL,
	[chTipoOperacion_Aud] [char](1) NULL,
	[inCodUsuario_Aud] [int] NULL,
	[dtFecOperacion_Aud] [datetime] NULL,
	[vcNomSistemaOperacion_Aud] [varchar](100) NULL,
	[vcModuloSistema_Aud] [varchar](100) NULL,
	[vcProcedimientoAlmacenado_Aud] [varchar](200) NULL,
	[vcNomTerminalRegistro_Aud] [varchar](100) NULL,
	[vcIPTerminalRegistro_Aud] [varchar](100) NULL,
	[vcObservaciones_Aud] [varchar](400) NULL,
 CONSTRAINT [PK_FACT_TAB_FACTURA] PRIMARY KEY CLUSTERED 
(
	[inIdFactura] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FG_DATA]
) ON [FG_DATA]
GO
SET IDENTITY_INSERT [FACT].[DET_FACTURA_DETALLE] ON 

INSERT [FACT].[DET_FACTURA_DETALLE] ([inIdFacturaDetalle], [inIdFactura], [inIdItem], [vcItem], [dePrecio], [inCantidad], [deSubTotal], [deImpuesto], [deTotal], [biNoEliminadoLogicoBD], [chTipoOperacion_Aud], [inCodUsuario_Aud], [dtFecOperacion_Aud], [vcNomSistemaOperacion_Aud], [vcModuloSistema_Aud], [vcProcedimientoAlmacenado_Aud], [vcNomTerminalRegistro_Aud], [vcIPTerminalRegistro_Aud], [vcObservaciones_Aud]) VALUES (1, 1, 1, N'MOUE', CAST(18.00 AS Decimal(18, 2)), 1, CAST(14.76 AS Decimal(18, 2)), CAST(3.24 AS Decimal(18, 2)), CAST(18.00 AS Decimal(18, 2)), 1, N'I', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [FACT].[DET_FACTURA_DETALLE] OFF
GO
SET IDENTITY_INSERT [FACT].[MAE_CLIENTE] ON 

INSERT [FACT].[MAE_CLIENTE] ([inIdCliente], [chTipoPersona], [vcNumeroDocumento], [nvApellidoPaterno], [nvApellidoMaterno], [nvNombres], [vcRazonSocial], [vcEmail], [vcDireccion], [chSexo], [biNoEliminadoLogicoBD], [chTipoOperacion_Aud], [inCodUsuario_Aud], [dtFecOperacion_Aud], [vcNomSistemaOperacion_Aud], [vcModuloSistema_Aud], [vcProcedimientoAlmacenado_Aud], [vcNomTerminalRegistro_Aud], [vcIPTerminalRegistro_Aud], [vcObservaciones_Aud]) VALUES (15, N'N', N'46607488', N'CASTRO', N'CORTEZ', N'HEYDI', N'', N'', N'LORETO 54', N'F', 1, N'I', 0, CAST(N'2022-06-15T10:18:56.463' AS DateTime), N'PRUEBA', N'CLIENTES', N'[FACT].[usp_insertar_update_cliente]', N'DESKTOP-OSVTO5T', N'192.168.208.203', NULL)
INSERT [FACT].[MAE_CLIENTE] ([inIdCliente], [chTipoPersona], [vcNumeroDocumento], [nvApellidoPaterno], [nvApellidoMaterno], [nvNombres], [vcRazonSocial], [vcEmail], [vcDireccion], [chSexo], [biNoEliminadoLogicoBD], [chTipoOperacion_Aud], [inCodUsuario_Aud], [dtFecOperacion_Aud], [vcNomSistemaOperacion_Aud], [vcModuloSistema_Aud], [vcProcedimientoAlmacenado_Aud], [vcNomTerminalRegistro_Aud], [vcIPTerminalRegistro_Aud], [vcObservaciones_Aud]) VALUES (14, N'N', N'46605232', N'GARCIA', N'MENDOZA', N'GABRIELA', N'', N'gabriela@gmail.com', N'LORETO 256', N'F', 1, N'I', 0, CAST(N'2022-06-15T10:06:43.300' AS DateTime), N'PRUEBA', N'CLIENTES', N'[FACT].[usp_insertar_update_cliente]', N'DESKTOP-OSVTO5T', N'192.168.208.203', NULL)
INSERT [FACT].[MAE_CLIENTE] ([inIdCliente], [chTipoPersona], [vcNumeroDocumento], [nvApellidoPaterno], [nvApellidoMaterno], [nvNombres], [vcRazonSocial], [vcEmail], [vcDireccion], [chSexo], [biNoEliminadoLogicoBD], [chTipoOperacion_Aud], [inCodUsuario_Aud], [dtFecOperacion_Aud], [vcNomSistemaOperacion_Aud], [vcModuloSistema_Aud], [vcProcedimientoAlmacenado_Aud], [vcNomTerminalRegistro_Aud], [vcIPTerminalRegistro_Aud], [vcObservaciones_Aud]) VALUES (13, N'J', N'20122535621', N'', N'', N'', N'SOFT SAC', N'soft@gmail.com', N'LORETO', N' ', 1, N'D', 0, CAST(N'2022-06-15T12:09:30.347' AS DateTime), NULL, NULL, N'[FACT].[usp_anular_cliente]', N'DESKTOP-OSVTO5T', N'192.168.208.203', NULL)
INSERT [FACT].[MAE_CLIENTE] ([inIdCliente], [chTipoPersona], [vcNumeroDocumento], [nvApellidoPaterno], [nvApellidoMaterno], [nvNombres], [vcRazonSocial], [vcEmail], [vcDireccion], [chSexo], [biNoEliminadoLogicoBD], [chTipoOperacion_Aud], [inCodUsuario_Aud], [dtFecOperacion_Aud], [vcNomSistemaOperacion_Aud], [vcModuloSistema_Aud], [vcProcedimientoAlmacenado_Aud], [vcNomTerminalRegistro_Aud], [vcIPTerminalRegistro_Aud], [vcObservaciones_Aud]) VALUES (12, N'J', N'20122535914', N'', N'', N'', N'NOTARIA BENVENUTO', N'benvenuto@gmail.com', N'LIMA', N' ', 1, N'D', 0, CAST(N'2022-06-15T12:09:33.247' AS DateTime), NULL, NULL, N'[FACT].[usp_anular_cliente]', N'DESKTOP-OSVTO5T', N'192.168.208.203', NULL)
INSERT [FACT].[MAE_CLIENTE] ([inIdCliente], [chTipoPersona], [vcNumeroDocumento], [nvApellidoPaterno], [nvApellidoMaterno], [nvNombres], [vcRazonSocial], [vcEmail], [vcDireccion], [chSexo], [biNoEliminadoLogicoBD], [chTipoOperacion_Aud], [inCodUsuario_Aud], [dtFecOperacion_Aud], [vcNomSistemaOperacion_Aud], [vcModuloSistema_Aud], [vcProcedimientoAlmacenado_Aud], [vcNomTerminalRegistro_Aud], [vcIPTerminalRegistro_Aud], [vcObservaciones_Aud]) VALUES (11, N'N', N'46607490', N'CASTILLO', N'ALZAMORA', N'YULEYSI', N'', N'yuleysi@gmail.com', N'LORETO 268', N'F', 1, N'I', 0, CAST(N'2022-06-15T10:03:54.077' AS DateTime), N'PRUEBA', N'CLIENTES', N'[FACT].[usp_insertar_update_cliente]', N'DESKTOP-OSVTO5T', N'192.168.208.203', NULL)
INSERT [FACT].[MAE_CLIENTE] ([inIdCliente], [chTipoPersona], [vcNumeroDocumento], [nvApellidoPaterno], [nvApellidoMaterno], [nvNombres], [vcRazonSocial], [vcEmail], [vcDireccion], [chSexo], [biNoEliminadoLogicoBD], [chTipoOperacion_Aud], [inCodUsuario_Aud], [dtFecOperacion_Aud], [vcNomSistemaOperacion_Aud], [vcModuloSistema_Aud], [vcProcedimientoAlmacenado_Aud], [vcNomTerminalRegistro_Aud], [vcIPTerminalRegistro_Aud], [vcObservaciones_Aud]) VALUES (10, N'N', N'46607491', N'CASTILLO', N'ALZAMORA', N'CARLOS', N'', N'carlos@gmail.com', N'LORETO', N'M', 1, N'I', 0, CAST(N'2022-06-15T10:03:18.470' AS DateTime), N'PRUEBA', N'CLIENTES', N'[FACT].[usp_insertar_update_cliente]', N'DESKTOP-OSVTO5T', N'192.168.208.203', NULL)
INSERT [FACT].[MAE_CLIENTE] ([inIdCliente], [chTipoPersona], [vcNumeroDocumento], [nvApellidoPaterno], [nvApellidoMaterno], [nvNombres], [vcRazonSocial], [vcEmail], [vcDireccion], [chSexo], [biNoEliminadoLogicoBD], [chTipoOperacion_Aud], [inCodUsuario_Aud], [dtFecOperacion_Aud], [vcNomSistemaOperacion_Aud], [vcModuloSistema_Aud], [vcProcedimientoAlmacenado_Aud], [vcNomTerminalRegistro_Aud], [vcIPTerminalRegistro_Aud], [vcObservaciones_Aud]) VALUES (9, N'J', N'20122535914', N'', N'', N'', N'CONSTRUCTORA SAC', N'constructora@gmail.com', N'LOS ALGARROBOS', N' ', 1, N'D', 0, CAST(N'2022-06-15T12:09:35.507' AS DateTime), NULL, NULL, N'[FACT].[usp_anular_cliente]', N'DESKTOP-OSVTO5T', N'192.168.208.203', NULL)
INSERT [FACT].[MAE_CLIENTE] ([inIdCliente], [chTipoPersona], [vcNumeroDocumento], [nvApellidoPaterno], [nvApellidoMaterno], [nvNombres], [vcRazonSocial], [vcEmail], [vcDireccion], [chSexo], [biNoEliminadoLogicoBD], [chTipoOperacion_Aud], [inCodUsuario_Aud], [dtFecOperacion_Aud], [vcNomSistemaOperacion_Aud], [vcModuloSistema_Aud], [vcProcedimientoAlmacenado_Aud], [vcNomTerminalRegistro_Aud], [vcIPTerminalRegistro_Aud], [vcObservaciones_Aud]) VALUES (8, N'J', N'10446074958', N'', N'', N'', N'SOFTWARE SAC', N'software@gmail.com', N'LORETO 145', N' ', 1, N'D', 0, CAST(N'2022-06-15T12:09:38.270' AS DateTime), NULL, NULL, N'[FACT].[usp_anular_cliente]', N'DESKTOP-OSVTO5T', N'192.168.208.203', NULL)
INSERT [FACT].[MAE_CLIENTE] ([inIdCliente], [chTipoPersona], [vcNumeroDocumento], [nvApellidoPaterno], [nvApellidoMaterno], [nvNombres], [vcRazonSocial], [vcEmail], [vcDireccion], [chSexo], [biNoEliminadoLogicoBD], [chTipoOperacion_Aud], [inCodUsuario_Aud], [dtFecOperacion_Aud], [vcNomSistemaOperacion_Aud], [vcModuloSistema_Aud], [vcProcedimientoAlmacenado_Aud], [vcNomTerminalRegistro_Aud], [vcIPTerminalRegistro_Aud], [vcObservaciones_Aud]) VALUES (7, N'N', N'46607495', N'HUERTAS', N'QUINTANA', N'CARMEN', N'', N'carmen@gmail.com', N'LOS ALGARROBOSS', N'F', 1, N'D', 0, CAST(N'2022-06-15T10:02:50.970' AS DateTime), NULL, NULL, N'[FACT].[usp_anular_cliente]', N'DESKTOP-OSVTO5T', N'192.168.208.203', NULL)
INSERT [FACT].[MAE_CLIENTE] ([inIdCliente], [chTipoPersona], [vcNumeroDocumento], [nvApellidoPaterno], [nvApellidoMaterno], [nvNombres], [vcRazonSocial], [vcEmail], [vcDireccion], [chSexo], [biNoEliminadoLogicoBD], [chTipoOperacion_Aud], [inCodUsuario_Aud], [dtFecOperacion_Aud], [vcNomSistemaOperacion_Aud], [vcModuloSistema_Aud], [vcProcedimientoAlmacenado_Aud], [vcNomTerminalRegistro_Aud], [vcIPTerminalRegistro_Aud], [vcObservaciones_Aud]) VALUES (5, N'N', N'74859632', N'GARCIA', N'PEREZ', N'ANA', N'', N'ana@gmail.com', N'LOS ALGARROBOS', N'F', 1, N'D', 0, CAST(N'2022-06-14T16:11:19.880' AS DateTime), NULL, NULL, N'[FACT].[usp_anular_cliente]', N'DESKTOP-OSVTO5T', N'192.168.208.203', NULL)
INSERT [FACT].[MAE_CLIENTE] ([inIdCliente], [chTipoPersona], [vcNumeroDocumento], [nvApellidoPaterno], [nvApellidoMaterno], [nvNombres], [vcRazonSocial], [vcEmail], [vcDireccion], [chSexo], [biNoEliminadoLogicoBD], [chTipoOperacion_Aud], [inCodUsuario_Aud], [dtFecOperacion_Aud], [vcNomSistemaOperacion_Aud], [vcModuloSistema_Aud], [vcProcedimientoAlmacenado_Aud], [vcNomTerminalRegistro_Aud], [vcIPTerminalRegistro_Aud], [vcObservaciones_Aud]) VALUES (1, N'N', N'46607494', N'CASTILLOI', N'ALZAMORAA', N'MIGUEL SPENCERR', N'', N'spencer.leo04089090@gmail.com', N'LORETO 2689', N'M', 1, N'U', 0, CAST(N'2022-06-14T17:23:07.443' AS DateTime), N'PRUEBA', N'CLIENTES', N'[FACT].[usp_insertar_update_cliente]', N'DESKTOP-OSVTO5T', N'192.168.208.203', NULL)
SET IDENTITY_INSERT [FACT].[MAE_CLIENTE] OFF
GO
SET IDENTITY_INSERT [FACT].[MAE_ITEM] ON 

INSERT [FACT].[MAE_ITEM] ([inIdItem], [vcDescripcionItem], [dePrecio], [inStockMinimo], [biNoEliminadoLogicoBD], [chTipoOperacion_Aud], [inCodUsuario_Aud], [dtFecOperacion_Aud], [vcNomSistemaOperacion_Aud], [vcModuloSistema_Aud], [vcProcedimientoAlmacenado_Aud], [vcNomTerminalRegistro_Aud], [vcIPTerminalRegistro_Aud], [vcObservaciones_Aud]) VALUES (4, N'PARLANTES', CAST(25.00 AS Decimal(18, 2)), 3, 1, N'I', 0, CAST(N'2022-06-15T14:05:40.370' AS DateTime), N'PRUEBA', N'ITEMS', N'[FACT].[usp_insertar_update_item]', N'DESKTOP-OSVTO5T', N'192.168.208.203', NULL)
INSERT [FACT].[MAE_ITEM] ([inIdItem], [vcDescripcionItem], [dePrecio], [inStockMinimo], [biNoEliminadoLogicoBD], [chTipoOperacion_Aud], [inCodUsuario_Aud], [dtFecOperacion_Aud], [vcNomSistemaOperacion_Aud], [vcModuloSistema_Aud], [vcProcedimientoAlmacenado_Aud], [vcNomTerminalRegistro_Aud], [vcIPTerminalRegistro_Aud], [vcObservaciones_Aud]) VALUES (3, N'IMPRESORA', CAST(900.00 AS Decimal(18, 2)), 5, 1, N'D', 0, CAST(N'2022-06-15T14:13:28.500' AS DateTime), NULL, NULL, N'[FACT].[usp_anular_item]', N'DESKTOP-OSVTO5T', N'192.168.208.203', NULL)
INSERT [FACT].[MAE_ITEM] ([inIdItem], [vcDescripcionItem], [dePrecio], [inStockMinimo], [biNoEliminadoLogicoBD], [chTipoOperacion_Aud], [inCodUsuario_Aud], [dtFecOperacion_Aud], [vcNomSistemaOperacion_Aud], [vcModuloSistema_Aud], [vcProcedimientoAlmacenado_Aud], [vcNomTerminalRegistro_Aud], [vcIPTerminalRegistro_Aud], [vcObservaciones_Aud]) VALUES (1, N'MOUSE', CAST(20.00 AS Decimal(18, 2)), 5, 1, N'D', 0, CAST(N'2022-06-15T14:13:31.207' AS DateTime), NULL, NULL, N'[FACT].[usp_anular_item]', N'DESKTOP-OSVTO5T', N'192.168.208.203', NULL)
SET IDENTITY_INSERT [FACT].[MAE_ITEM] OFF
GO
SET IDENTITY_INSERT [FACT].[TAB_FACTURA] ON 

INSERT [FACT].[TAB_FACTURA] ([inIdFactura], [vcSerie], [vcNumeroComprobante], [inIdCliente], [vcNumeroDocumentoCliente], [vcCliente], [deSubTotal], [deImpuesto], [deTotal], [biNoEliminadoLogicoBD], [chTipoOperacion_Aud], [inCodUsuario_Aud], [dtFecOperacion_Aud], [vcNomSistemaOperacion_Aud], [vcModuloSistema_Aud], [vcProcedimientoAlmacenado_Aud], [vcNomTerminalRegistro_Aud], [vcIPTerminalRegistro_Aud], [vcObservaciones_Aud]) VALUES (1, N'001', N'000001', 1, N'466074945', N'CASTILLO ALZAMORA MIGUEL SPENCER', CAST(82.00 AS Decimal(18, 2)), CAST(18.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), 1, N'I', 1, CAST(N'2022-06-13T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [FACT].[TAB_FACTURA] OFF
GO
ALTER TABLE [FACT].[DET_FACTURA_DETALLE]  WITH CHECK ADD FOREIGN KEY([inIdFactura])
REFERENCES [FACT].[TAB_FACTURA] ([inIdFactura])
GO
ALTER TABLE [FACT].[DET_FACTURA_DETALLE]  WITH CHECK ADD FOREIGN KEY([inIdItem])
REFERENCES [FACT].[MAE_ITEM] ([inIdItem])
GO
ALTER TABLE [FACT].[TAB_FACTURA]  WITH CHECK ADD FOREIGN KEY([inIdCliente])
REFERENCES [FACT].[MAE_CLIENTE] ([inIdCliente])
GO
/****** Object:  StoredProcedure [FACT].[usp_anular_cliente]    Script Date: 15/06/2022 03:19:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [FACT].[usp_anular_cliente]
@inIdCliente			    INT,
@biNoEliminadoLogicoBD			BIT = NULL,
-- AUDITORIA --
@inCodUsuario_Aud				INT,
@vcNomSistemaOperacion_Aud		VARCHAR(100) = NULL,
@vcModuloSistema_Aud			VARCHAR(100) = NULL,
@vcNomTerminalRegistro_Aud		VARCHAR(100) = NULL,
@vcIPTerminalRegistro_Aud		VARCHAR(100) = NULL
AS
BEGIN

	DECLARE @vProcedimiento VARCHAR(200)
	DECLARE @vcMensaje VARCHAR(300)
	SET @vProcedimiento = (QUOTENAME(OBJECT_SCHEMA_NAME(@@PROCID)) + '.' +QUOTENAME(OBJECT_NAME(@@PROCID)))

    IF @biNoEliminadoLogicoBD = 1 SET @vcMensaje = 'ACTIVADO CORRECTAMENTE';
	IF @biNoEliminadoLogicoBD = 0 SET @vcMensaje = 'ANULADO CORRECTAMENTE' ;


	UPDATE FACT.MAE_CLIENTE SET 
	biNoEliminadoLogicoBD = @biNoEliminadoLogicoBD,

	-- AUDITORIA --
	chTipoOperacion_Aud = 'D', 
	inCodUsuario_Aud = @inCodUsuario_Aud, 
	dtFecOperacion_Aud = GETDATE(), 
	vcNomSistemaOperacion_Aud = @vcNomSistemaOperacion_Aud, 
	vcModuloSistema_Aud = @vcModuloSistema_Aud, 
	vcProcedimientoAlmacenado_Aud = @vProcedimiento, 
	vcNomTerminalRegistro_Aud = @vcNomTerminalRegistro_Aud, 
	vcIPTerminalRegistro_Aud = @vcIPTerminalRegistro_Aud

	WHERE inIdCliente = @inIdCliente

	SELECT	200 [inCodigoRespuesta],
			@vcMensaje [vcMensaje],
			'Éxito' [vcStatus],
			@inIdCliente [inIdGenerado] 
END
GO
/****** Object:  StoredProcedure [FACT].[usp_anular_item]    Script Date: 15/06/2022 03:19:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [FACT].[usp_anular_item]
@inIdItem			    INT,
@biNoEliminadoLogicoBD			BIT = NULL,
-- AUDITORIA --
@inCodUsuario_Aud				INT,
@vcNomSistemaOperacion_Aud		VARCHAR(100) = NULL,
@vcModuloSistema_Aud			VARCHAR(100) = NULL,
@vcNomTerminalRegistro_Aud		VARCHAR(100) = NULL,
@vcIPTerminalRegistro_Aud		VARCHAR(100) = NULL
AS
BEGIN

	DECLARE @vProcedimiento VARCHAR(200)
	DECLARE @vcMensaje VARCHAR(300)
	SET @vProcedimiento = (QUOTENAME(OBJECT_SCHEMA_NAME(@@PROCID)) + '.' +QUOTENAME(OBJECT_NAME(@@PROCID)))

    IF @biNoEliminadoLogicoBD = 1 SET @vcMensaje = 'ACTIVADO CORRECTAMENTE';
	IF @biNoEliminadoLogicoBD = 0 SET @vcMensaje = 'ANULADO CORRECTAMENTE' ;


	UPDATE FACT.MAE_ITEM SET 
	biNoEliminadoLogicoBD = @biNoEliminadoLogicoBD,

	-- AUDITORIA --
	chTipoOperacion_Aud = 'D', 
	inCodUsuario_Aud = @inCodUsuario_Aud, 
	dtFecOperacion_Aud = GETDATE(), 
	vcNomSistemaOperacion_Aud = @vcNomSistemaOperacion_Aud, 
	vcModuloSistema_Aud = @vcModuloSistema_Aud, 
	vcProcedimientoAlmacenado_Aud = @vProcedimiento, 
	vcNomTerminalRegistro_Aud = @vcNomTerminalRegistro_Aud, 
	vcIPTerminalRegistro_Aud = @vcIPTerminalRegistro_Aud

	WHERE inIdItem = @inIdItem

	SELECT	200 [inCodigoRespuesta],
			@vcMensaje [vcMensaje],
			'Éxito' [vcStatus],
			@inIdItem [inIdGenerado] 
END
GO
/****** Object:  StoredProcedure [FACT].[usp_eliminar_cliente]    Script Date: 15/06/2022 03:19:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [FACT].[usp_eliminar_cliente] --1,0
@inIdCliente			    INT,
-- AUDITORIA --
@inCodUsuario_Aud				INT,
@vcNomSistemaOperacion_Aud		VARCHAR(100) = NULL,
@vcModuloSistema_Aud			VARCHAR(100) = NULL,
@vcNomTerminalRegistro_Aud		VARCHAR(100) = NULL,
@vcIPTerminalRegistro_Aud		VARCHAR(100) = NULL
AS
BEGIN

		

	DECLARE @vProcedimiento VARCHAR(200)
	DECLARE @vcMensaje VARCHAR(300)
	SET @vProcedimiento = (QUOTENAME(OBJECT_SCHEMA_NAME(@@PROCID)) + '.' +QUOTENAME(OBJECT_NAME(@@PROCID)))
	
	IF NOT EXISTS (SELECT inIdFactura FROM FACT.TAB_FACTURA WHERE inIdCliente = @inIdCliente)  BEGIN

		DELETE FROM FACT.MAE_CLIENTE WHERE inIdCliente = @inIdCliente
		SET @vcMensaje  = 'ELIMINADO CORRECTAMENTE' 

	END 
	ELSE BEGIN
		SET @vcMensaje  = 'ERROR!!! EXISTEN REGISTROS ASOCIADOS EN FACTURACIÓN' 
	END





	SELECT	200 [inCodigoRespuesta],
			 @vcMensaje [vcMensaje],
			'Éxito' [vcStatus],
			@inIdCliente [inIdGenerado] 
END
GO
/****** Object:  StoredProcedure [FACT].[usp_eliminar_item]    Script Date: 15/06/2022 03:19:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [FACT].[usp_eliminar_item] --1,0
@inIdItem			    INT,
-- AUDITORIA --
@inCodUsuario_Aud				INT,
@vcNomSistemaOperacion_Aud		VARCHAR(100) = NULL,
@vcModuloSistema_Aud			VARCHAR(100) = NULL,
@vcNomTerminalRegistro_Aud		VARCHAR(100) = NULL,
@vcIPTerminalRegistro_Aud		VARCHAR(100) = NULL
AS
BEGIN

		

	DECLARE @vProcedimiento VARCHAR(200)
	DECLARE @vcMensaje VARCHAR(300)
	SET @vProcedimiento = (QUOTENAME(OBJECT_SCHEMA_NAME(@@PROCID)) + '.' +QUOTENAME(OBJECT_NAME(@@PROCID)))
	
	IF NOT EXISTS (SELECT inIdItem FROM FACT.DET_FACTURA_DETALLE WHERE inIdItem = @inIdItem)  BEGIN

		DELETE FROM FACT.MAE_ITEM WHERE inIdItem = @inIdItem	
		SET @vcMensaje  = 'ELIMINADO CORRECTAMENTE' 

	END 
	ELSE BEGIN
		SET @vcMensaje  = 'ERROR!!! EXISTEN REGISTROS ASOCIADOS EN FACTURACIÓN' 
	END





	SELECT	200 [inCodigoRespuesta],
			 @vcMensaje [vcMensaje],
			'Éxito' [vcStatus],
			@inIdItem	 [inIdGenerado] 
END
GO
/****** Object:  StoredProcedure [FACT].[usp_insertar_update_cliente]    Script Date: 15/06/2022 03:19:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [FACT].[usp_insertar_update_cliente]
	-- Add the parameters for the stored procedure here
@inIdCliente INT,
@chTipoPersona CHAR(1),
@vcNumeroDocumento VARCHAR(20),
@nvApellidoPaterno NVARCHAR(100),
@nvApellidoMaterno NVARCHAR(100),
@nvNombres NVARCHAR(100),
@vcRazonSocial VARCHAR(300),
@vcEmail NVARCHAR(200),
@vcDireccion NVARCHAR(300),
@chSexo CHAR(1) ,
@inType						INT,
	-- AUDITORIA --
@inCodUsuario_Aud						INT,
@vcNomSistemaOperacion_Aud				VARCHAR(100) = NULL,
@vcModuloSistema_Aud					VARCHAR(100) = NULL,
@vcNomTerminalRegistro_Aud				VARCHAR(100) = NULL,
@vcIPTerminalRegistro_Aud				VARCHAR(100) = NULL

AS
BEGIN
	DECLARE @tabla TABLE (inIdClienteTemp INT)
	DECLARE @inIdClienteTemp int
	DECLARE @vProcedimiento VARCHAR(200)
	SET @vProcedimiento = (QUOTENAME(OBJECT_SCHEMA_NAME(@@PROCID)) + '.' +QUOTENAME(OBJECT_NAME(@@PROCID)))


	IF(@inType = 1)
	BEGIN
	

	INSERT INTO FACT.MAE_CLIENTE(
	        chTipoPersona,
			vcNumeroDocumento,
			nvApellidoPaterno,
			nvApellidoMaterno,
			nvNombres,
			vcRazonSocial,
			vcEmail,
			vcDireccion,
			chSexo,			
			biNoEliminadoLogicoBD,
			chTipoOperacion_Aud,
			inCodUsuario_Aud,
			dtFecOperacion_Aud,
			vcNomSistemaOperacion_Aud,
			vcModuloSistema_Aud,
			vcProcedimientoAlmacenado_Aud,
			vcNomTerminalRegistro_Aud,
			vcIPTerminalRegistro_Aud
		)
		OUTPUT inserted.inIdCliente INTO @tabla
		VALUES
		(
		    @chTipoPersona,
			@vcNumeroDocumento,
			@nvApellidoPaterno,
			@nvApellidoMaterno,
			@nvNombres,
			@vcRazonSocial,
			@vcEmail,
			@vcDireccion,
			@chSexo,	
			1,
		  -- AUDITORIA --
			'I', @inCodUsuario_Aud, GETDATE(), @vcNomSistemaOperacion_Aud, @vcModuloSistema_Aud, 
			@vProcedimiento, @vcNomTerminalRegistro_Aud, @vcIPTerminalRegistro_Aud
		)
		SELECT TOP 1  @inIdClienteTemp = inIdClienteTemp FROM @tabla

		SELECT	200 [inCodigoRespuesta],
			'REGISTRADO CORRECTAMENTE' [vcMensaje],
			'Éxito' [vcStatus],
			@inIdClienteTemp [inIdGenerado] 
	END
	ELSE
	BEGIN
		UPDATE FACT.MAE_CLIENTE SET

		vcNumeroDocumento				= @vcNumeroDocumento,
	    nvApellidoPaterno				= @nvApellidoPaterno,
		nvApellidoMaterno				= @nvApellidoMaterno,
		nvNombres					    = @nvNombres,
		vcEmail							= @vcEmail,
		vcRazonSocial					= @vcRazonSocial,
		vcDireccion						= @vcDireccion,
		chSexo							= @chSexo,
		-- AUDITORIA --
		chTipoOperacion_Aud				= 'U', 
		inCodUsuario_Aud				= @inCodUsuario_Aud, 
		dtFecOperacion_Aud				= GETDATE(), 
		vcNomSistemaOperacion_Aud		= @vcNomSistemaOperacion_Aud, 
		vcModuloSistema_Aud				=  @vcModuloSistema_Aud, 
		vcProcedimientoAlmacenado_Aud	= @vProcedimiento, 
		vcNomTerminalRegistro_Aud		= @vcNomTerminalRegistro_Aud, 
		vcIPTerminalRegistro_Aud		= @vcIPTerminalRegistro_Aud

		WHERE inIdCliente			= @inIdCliente AND biNoEliminadoLogicoBD = 1

		SELECT	200 [inCodigoRespuesta],
			'MODIFICADO CORRECTAMENTE' [vcMensaje],
			'Éxito' [vcStatus],
			@inIdCliente [inIdGenerado] 
	END
END
GO
/****** Object:  StoredProcedure [FACT].[usp_insertar_update_item]    Script Date: 15/06/2022 03:19:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [FACT].[usp_insertar_update_item]
	-- Add the parameters for the stored procedure here
@inIdItem INT,
@vcDescripcionItem VARCHAR(500),
@dePrecio DECIMAL(18,2),
@inStockMinimo INT,

@inType						INT,
	-- AUDITORIA --
@inCodUsuario_Aud						INT,
@vcNomSistemaOperacion_Aud				VARCHAR(100) = NULL,
@vcModuloSistema_Aud					VARCHAR(100) = NULL,
@vcNomTerminalRegistro_Aud				VARCHAR(100) = NULL,
@vcIPTerminalRegistro_Aud				VARCHAR(100) = NULL

AS
BEGIN
	DECLARE @tabla TABLE (inIdItemTemp INT)
	DECLARE @inIdItemTemp int
	DECLARE @vProcedimiento VARCHAR(200)
	SET @vProcedimiento = (QUOTENAME(OBJECT_SCHEMA_NAME(@@PROCID)) + '.' +QUOTENAME(OBJECT_NAME(@@PROCID)))


	IF(@inType = 1)
	BEGIN
	

	INSERT INTO FACT.MAE_ITEM(
	        vcDescripcionItem,
			dePrecio,
			inStockMinimo,
			biNoEliminadoLogicoBD,
			chTipoOperacion_Aud,
			inCodUsuario_Aud,
			dtFecOperacion_Aud,
			vcNomSistemaOperacion_Aud,
			vcModuloSistema_Aud,
			vcProcedimientoAlmacenado_Aud,
			vcNomTerminalRegistro_Aud,
			vcIPTerminalRegistro_Aud
		)
		OUTPUT inserted.inIdItem INTO @tabla
		VALUES
		(
		    @vcDescripcionItem,
			@dePrecio,
			@inStockMinimo,
			1,
		  -- AUDITORIA --
			'I', @inCodUsuario_Aud, GETDATE(), @vcNomSistemaOperacion_Aud, @vcModuloSistema_Aud, 
			@vProcedimiento, @vcNomTerminalRegistro_Aud, @vcIPTerminalRegistro_Aud
		)
		SELECT TOP 1  @inIdItemTemp = inIdItemTemp FROM @tabla

		SELECT	200 [inCodigoRespuesta],
			'REGISTRADO CORRECTAMENTE' [vcMensaje],
			'Éxito' [vcStatus],
			@inIdItemTemp [inIdGenerado] 
	END
	ELSE
	BEGIN
		UPDATE FACT.MAE_ITEM SET

		vcDescripcionItem				= @vcDescripcionItem,
	    dePrecio						= @dePrecio,
		inStockMinimo					= @inStockMinimo,
		
		-- AUDITORIA --
		chTipoOperacion_Aud				= 'U', 
		inCodUsuario_Aud				= @inCodUsuario_Aud, 
		dtFecOperacion_Aud				= GETDATE(), 
		vcNomSistemaOperacion_Aud		= @vcNomSistemaOperacion_Aud, 
		vcModuloSistema_Aud				=  @vcModuloSistema_Aud, 
		vcProcedimientoAlmacenado_Aud	= @vProcedimiento, 
		vcNomTerminalRegistro_Aud		= @vcNomTerminalRegistro_Aud, 
		vcIPTerminalRegistro_Aud		= @vcIPTerminalRegistro_Aud

		WHERE inIdItem			= @inIdItem AND biNoEliminadoLogicoBD = 1

		SELECT	200 [inCodigoRespuesta],
			'MODIFICADO CORRECTAMENTE' [vcMensaje],
			'Éxito' [vcStatus],
			@inIdItem [inIdGenerado] 
	END
END
GO
/****** Object:  StoredProcedure [FACT].[usp_listar_cliente]    Script Date: 15/06/2022 03:19:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [FACT].[usp_listar_cliente] --'','','',0,15,1
@vcNumeroDocumento		VARCHAR(20)  = NULL,
@nvNombres				VARCHAR(100) = NULL,
@biNoEliminadoLogicoBD	BIT	= 1,
@pageIndex				INT = 0,
@pageSize				INT,
@inCodUsuario_Aud				INT = NULL,	
@vcNomSistemaOperacion_Aud		VARCHAR(100) = NULL,
@vcModuloSistema_Aud			VARCHAR(100) = NULL,
@vcNomTerminalRegistro_Aud		VARCHAR(100) = NULL,
@vcIPTerminalRegistro_Aud		VARCHAR(100) = NULL
AS
BEGIN


 
  /*-------------------------------------------------------------*/  
	
	IF @vcNumeroDocumento = ''	SET @vcNumeroDocumento = NULL
	IF @nvNombres = ''			SET @nvNombres = NULL


	DECLARE @inTotalRegistros int, @inRowIndex int

	SELECT DISTINCT
		
		C.inIdCliente,
		C.chTipoPersona,
		UPPER(C.nvApellidoPaterno) [nvApellidoPaterno],
		UPPER(C.nvApellidoMaterno) [nvApellidoMaterno],
		UPPER(C.nvNombres) [nvNombres],
		ISNULL(UPPER(C.vcRazonSocial),'') [vcRazonSocial],
		C.vcNumeroDocumento,
		C.vcEmail,
		C.vcDireccion,
		C.chSexo,
		C.biNoEliminadoLogicoBD
	INTO #TABLA_BASE
	FROM FACT.MAE_CLIENTE C 
	
	ORDER BY [nvApellidoPaterno], [nvApellidoMaterno], [nvNombres]

	SELECT DISTINCT
		ROW_NUMBER() OVER ( ORDER BY nvApellidoPaterno, nvApellidoMaterno, nvNombres) as Fila,
		C.inIdCliente,
		C.chTipoPersona,
		C.nvApellidoPaterno,
		C.nvApellidoMaterno,
		C.nvNombres,
		C.vcRazonSocial,
		C.vcNumeroDocumento,
		C.vcEmail,
		C.vcDireccion,
		C.chSexo,
		C.biNoEliminadoLogicoBD
	INTO #TABLA_REPORTE
	FROM #TABLA_BASE C
	WHERE C.vcNumeroDocumento  =  ISNULL(@vcNumeroDocumento, C.vcNumeroDocumento) 
	AND
	 (C.nvApellidoPaterno + ' ' + C.nvApellidoMaterno + ' ' + C.nvNombres +' '+ C.vcRazonSocial)  like '%' + 
	ISNULL(@nvNombres, (C.nvApellidoPaterno + ' ' + C.nvApellidoMaterno + ' ' + C.nvNombres + ' '+C.vcRazonSocial)) + '%'
	AND C.biNoEliminadoLogicoBD = @biNoEliminadoLogicoBD
	ORDER BY [nvApellidoPaterno], [nvApellidoMaterno], [nvNombres]
	---------------------------------------------------------------------------------------
	
	SELECT @inTotalRegistros = COUNT(1) FROM #TABLA_REPORTE
	
	SELECT	
	@inTotalRegistros [inRowCount],
	Fila [inRowIndex],
	inIdCliente,
	chTipoPersona,
	nvApellidoPaterno,
	nvApellidoMaterno,
	nvNombres,
	vcRazonSocial,
	vcNumeroDocumento,
	vcEmail,
	vcDireccion,
	chSexo,
	biNoEliminadoLogicoBD

	FROM #TABLA_REPORTE
	WHERE Fila BETWEEN (@pageSize * @pageIndex + 1)
	and (@pageSize * (@pageIndex + 1))	

	DROP TABLE #TABLA_REPORTE	
END
GO
/****** Object:  StoredProcedure [FACT].[usp_listar_item]    Script Date: 15/06/2022 03:19:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [FACT].[usp_listar_item] --'',1,0,15,1
@vcDescripcionItem		VARCHAR(20)  = NULL,
@biNoEliminadoLogicoBD	BIT	= 1,
@pageIndex				INT = 0,
@pageSize				INT,
@inCodUsuario_Aud				INT = NULL,	
@vcNomSistemaOperacion_Aud		VARCHAR(100) = NULL,
@vcModuloSistema_Aud			VARCHAR(100) = NULL,
@vcNomTerminalRegistro_Aud		VARCHAR(100) = NULL,
@vcIPTerminalRegistro_Aud		VARCHAR(100) = NULL
AS
BEGIN


 
  /*-------------------------------------------------------------*/  
	
	IF @vcDescripcionItem = ''	SET @vcDescripcionItem = NULL
	


	DECLARE @inTotalRegistros int, @inRowIndex int

	SELECT DISTINCT
		
		I.inIdItem,
	
		UPPER(I.vcDescripcionItem) [vcDescripcionItem],
		I.dePrecio,
		I.inStockMinimo,
		
		I.biNoEliminadoLogicoBD
	INTO #TABLA_BASE
	FROM FACT.MAE_ITEM I 
	
	ORDER BY [vcDescripcionItem]

	SELECT DISTINCT
		ROW_NUMBER() OVER ( ORDER BY vcDescripcionItem) as Fila,
		I.inIdItem,
		I.vcDescripcionItem,
		I.dePrecio,
		I.inStockMinimo,
		
		I.biNoEliminadoLogicoBD
	INTO #TABLA_REPORTE
	FROM #TABLA_BASE I
	WHERE 
	     I.vcDescripcionItem
	   like '%' + 
	ISNULL(@vcDescripcionItem, I.vcDescripcionItem) + '%'
	AND I.biNoEliminadoLogicoBD = @biNoEliminadoLogicoBD
	ORDER BY [vcDescripcionItem]
	---------------------------------------------------------------------------------------
	
	SELECT @inTotalRegistros = COUNT(1) FROM #TABLA_REPORTE
	
	SELECT	
	@inTotalRegistros [inRowCount],
	Fila [inRowIndex],
	inIdItem,
	vcDescripcionItem,
	dePrecio,
	inStockMinimo,

	biNoEliminadoLogicoBD

	FROM #TABLA_REPORTE
	WHERE Fila BETWEEN (@pageSize * @pageIndex + 1)
	and (@pageSize * (@pageIndex + 1))	

	DROP TABLE #TABLA_REPORTE	
END
GO
/****** Object:  StoredProcedure [FACT].[usp_listar_todos_clientes]    Script Date: 15/06/2022 03:19:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [FACT].[usp_listar_todos_clientes]
  ---AUDITORIA---   
@inCodUsuario_Aud				INT = NULL,	
@vcNomSistemaOperacion_Aud		VARCHAR(100) = NULL,
@vcModuloSistema_Aud			VARCHAR(100) = NULL,
@vcNomTerminalRegistro_Aud		VARCHAR(100) = NULL,
@vcIPTerminalRegistro_Aud		VARCHAR(100) = NULL
AS
BEGIN
 

	SELECT 
		ISNULL(c.inIdCliente, 0) [inIdCliente]
		 ,c.chTipoPersona
		,ISNULL(c.vcNumeroDocumento, '')	[vcNumeroDocumento]		
		,ISNULL(c.nvApellidoPaterno, '')	[nvApellidoPaterno]
		,ISNULL(c.nvApellidoMaterno, '')	[nvApellidoMaterno]
		,ISNULL(c.nvNombres, '')	[nvNombres],
		ISNULL(C.vcRazonSocial,'') [vcRazonSocial]
		,ISNULL(c.vcEmail, '')	[vcEmail]
		,ISNULL(c.vcDireccion, '')	[vcDireccion]
		,ISNULL(c.chSexo, '')	[chSexo]
	FROM FACT.MAE_CLIENTE c
	
	WHERE biNoEliminadoLogicoBD = 1

	
END
GO
/****** Object:  StoredProcedure [FACT].[usp_obtener_cliente]    Script Date: 15/06/2022 03:19:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [FACT].[usp_obtener_cliente]
	-- Add the parameters for the stored procedure here
@inIdCliente		INT,

  ---AUDITORIA---   
@inCodUsuario_Aud				INT = NULL,	
@vcNomSistemaOperacion_Aud		VARCHAR(100) = NULL,
@vcModuloSistema_Aud			VARCHAR(100) = NULL,
@vcNomTerminalRegistro_Aud		VARCHAR(100) = NULL,
@vcIPTerminalRegistro_Aud		VARCHAR(100) = NULL
AS
BEGIN
	 /*-------------------------AUDITORIA-------------------------*/  
  
 /*=============================================================================================================================================================================================================================*/

	 SELECT 
	 ISNULL(c.inIdCliente, 0) [inIdCliente]
	 ,c.chTipoPersona
	,ISNULL(c.vcNumeroDocumento, '')	[vcNumeroDocumento]		
	,ISNULL(c.nvApellidoPaterno, '')	[nvApellidoPaterno]
	,ISNULL(c.nvApellidoMaterno, '')	[nvApellidoMaterno]
	,ISNULL(c.nvNombres, '')	[nvNombres],
	ISNULL(C.vcRazonSocial,'') [vcRazonSocial]
	,ISNULL(c.vcEmail, '')	[vcEmail]
	,ISNULL(c.vcDireccion, '')	[vcDireccion]
	,ISNULL(c.chSexo, '')	[chSexo]
		
	FROM FACT.MAE_CLIENTE c
	WHERE inIdCliente = @inIdCliente
	AND c.biNoEliminadoLogicoBD = 1 
	ORDER BY c.inIdCliente DESC 
END
GO
/****** Object:  StoredProcedure [FACT].[usp_obtener_item]    Script Date: 15/06/2022 03:19:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [FACT].[usp_obtener_item]
	-- Add the parameters for the stored procedure here
@inIdItem		INT,

  ---AUDITORIA---   
@inCodUsuario_Aud				INT = NULL,	
@vcNomSistemaOperacion_Aud		VARCHAR(100) = NULL,
@vcModuloSistema_Aud			VARCHAR(100) = NULL,
@vcNomTerminalRegistro_Aud		VARCHAR(100) = NULL,
@vcIPTerminalRegistro_Aud		VARCHAR(100) = NULL
AS
BEGIN
	 /*-------------------------AUDITORIA-------------------------*/  
  
 /*=============================================================================================================================================================================================================================*/

	 SELECT 
	 ISNULL(c.inIdItem, 0) [inIdItem]
	,ISNULL(c.vcDescripcionItem, '')	[vcDescripcionItem],		
	c.dePrecio [dePrecio],
	c.inStockMinimo [inStockMinimo]
	
		
	FROM FACT.MAE_ITEM c
	WHERE inIdItem = @inIdItem
	AND c.biNoEliminadoLogicoBD = 1 
	ORDER BY c.inIdItem DESC 
END
GO
USE [master]
GO
ALTER DATABASE [DB_PRUEBA] SET  READ_WRITE 
GO
