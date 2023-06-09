USE [master]
GO
/****** Object:  Database [DB-FRIGORIFICO]    Script Date: 28/4/2023 19:48:33 ******/
CREATE DATABASE [DB-FRIGORIFICO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB-FRIGORIFICO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DB-FRIGORIFICO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB-FRIGORIFICO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DB-FRIGORIFICO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DB-FRIGORIFICO] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB-FRIGORIFICO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB-FRIGORIFICO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB-FRIGORIFICO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB-FRIGORIFICO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB-FRIGORIFICO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB-FRIGORIFICO] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB-FRIGORIFICO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB-FRIGORIFICO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB-FRIGORIFICO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB-FRIGORIFICO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB-FRIGORIFICO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB-FRIGORIFICO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB-FRIGORIFICO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB-FRIGORIFICO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB-FRIGORIFICO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB-FRIGORIFICO] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB-FRIGORIFICO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB-FRIGORIFICO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB-FRIGORIFICO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB-FRIGORIFICO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB-FRIGORIFICO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB-FRIGORIFICO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB-FRIGORIFICO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB-FRIGORIFICO] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB-FRIGORIFICO] SET  MULTI_USER 
GO
ALTER DATABASE [DB-FRIGORIFICO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB-FRIGORIFICO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB-FRIGORIFICO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB-FRIGORIFICO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB-FRIGORIFICO] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB-FRIGORIFICO] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DB-FRIGORIFICO] SET QUERY_STORE = OFF
GO
USE [DB-FRIGORIFICO]
GO
/****** Object:  Table [dbo].[Camion]    Script Date: 28/4/2023 19:48:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Camion](
	[Patente] [varchar](50) NOT NULL,
	[Marca] [varchar](100) NOT NULL,
	[Modelo] [smallint] NOT NULL,
	[NumeroSenasa] [int] NOT NULL,
	[Frigorias] [int] NOT NULL,
	[IdProductor] [int] NOT NULL,
 CONSTRAINT [PK_Camion] PRIMARY KEY CLUSTERED 
(
	[Patente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 28/4/2023 19:48:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[Tipo] [tinyint] NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CorteCarnico]    Script Date: 28/4/2023 19:48:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CorteCarnico](
	[IdCorte] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[NumeroPiezas] [int] NOT NULL,
	[PesoTotal] [int] IDENTITY(1,1) NOT NULL,
	[NumeroPedido] [int] NOT NULL,
 CONSTRAINT [PK_CorteCarnico] PRIMARY KEY CLUSTERED 
(
	[IdCorte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CuentaCorriente]    Script Date: 28/4/2023 19:48:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuentaCorriente](
	[NumeroCuenta] [int] IDENTITY(1,1) NOT NULL,
	[Saldo] [int] NOT NULL,
	[Deuda] [int] NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
 CONSTRAINT [PK_CuentaCorriente] PRIMARY KEY CLUSTERED 
(
	[NumeroCuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeudaProveedor]    Script Date: 28/4/2023 19:48:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeudaProveedor](
	[IdDeuda] [int] IDENTITY(1,1) NOT NULL,
	[NombreProveedor] [varchar](max) NOT NULL,
	[MontoTotal] [int] NOT NULL,
	[IdSucursal] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Distribuidor]    Script Date: 28/4/2023 19:48:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Distribuidor](
	[IdDistribuidor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[IdSucursal] [int] NOT NULL,
 CONSTRAINT [PK_Distribuidor] PRIMARY KEY CLUSTERED 
(
	[IdDistribuidor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Distribuidor_Cliente]    Script Date: 28/4/2023 19:48:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Distribuidor_Cliente](
	[IdDistribuidor] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
 CONSTRAINT [PK_Distribuidor_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdDistribuidor] ASC,
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 28/4/2023 19:48:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[IdEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
	[AutorizacionRecepcion] [bit] NOT NULL,
	[TipoEmpleado] [tinyint] NOT NULL,
	[IdDistribuidor] [int] NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entrega]    Script Date: 28/4/2023 19:48:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entrega](
	[NumeroEntrega] [int] IDENTITY(1,1) NOT NULL,
	[FechaEntrega] [datetime] NOT NULL,
	[FechaCarga] [datetime] NOT NULL,
	[NombreCortes] [varchar](100) NOT NULL,
	[NumeroPiezas] [int] NOT NULL,
	[PesoTotal] [int] NOT NULL,
	[IdDistribuidor] [int] NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[IdFactura] [int] NOT NULL,
	[PatenteCamion] [varchar](50) NOT NULL,
	[ResponsableCarga] [int] NOT NULL,
 CONSTRAINT [PK_Entrega] PRIMARY KEY CLUSTERED 
(
	[NumeroEntrega] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entrega_Pedido]    Script Date: 28/4/2023 19:48:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entrega_Pedido](
	[NumeroEntrega] [int] NOT NULL,
	[NumeroPedido] [int] NOT NULL,
 CONSTRAINT [PK_Entrega_Pedido] PRIMARY KEY CLUSTERED 
(
	[NumeroEntrega] ASC,
	[NumeroPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura-Nota-Recibo]    Script Date: 28/4/2023 19:48:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura-Nota-Recibo](
	[IdDocumento] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [tinyint] NOT NULL,
	[Numero] [int] NOT NULL,
	[Monto] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[IdSucursal] [int] NOT NULL,
 CONSTRAINT [PK_Factura-Nota-Recibo] PRIMARY KEY CLUSTERED 
(
	[IdDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mantenimiento]    Script Date: 28/4/2023 19:48:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mantenimiento](
	[IdMantenimiento] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
	[PatenteCamion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Mantenimiento] PRIMARY KEY CLUSTERED 
(
	[IdMantenimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PagoProveedor]    Script Date: 28/4/2023 19:48:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PagoProveedor](
	[IdPago] [int] IDENTITY(1,1) NOT NULL,
	[NroFactura] [int] NOT NULL,
	[NombreProveedor] [varchar](100) NOT NULL,
	[Monto] [int] NOT NULL,
	[SaldoAnterior] [int] NOT NULL,
	[NuevoSaldo] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[IdSucursal] [int] NOT NULL,
 CONSTRAINT [PK_PagoProveedor] PRIMARY KEY CLUSTERED 
(
	[IdPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 28/4/2023 19:48:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[NumeroPedido] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[IdCliente] [int] NOT NULL,
 CONSTRAINT [PK_Pedido] PRIMARY KEY CLUSTERED 
(
	[NumeroPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productor]    Script Date: 28/4/2023 19:48:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productor](
	[IdProductor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[IdSucursal] [int] NOT NULL,
 CONSTRAINT [PK_Productor] PRIMARY KEY CLUSTERED 
(
	[IdProductor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Remito]    Script Date: 28/4/2023 19:48:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Remito](
	[IdRemito] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[IdSucursal] [int] NOT NULL,
 CONSTRAINT [PK_Remito] PRIMARY KEY CLUSTERED 
(
	[IdRemito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 28/4/2023 19:48:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursal](
	[IdSucursal] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Ciudad] [varchar](100) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Sucursal] PRIMARY KEY CLUSTERED 
(
	[IdSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoCliente]    Script Date: 28/4/2023 19:48:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoCliente](
	[IdTipo] [tinyint] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
 CONSTRAINT [PK_TipoCliente] PRIMARY KEY CLUSTERED 
(
	[IdTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDocumento]    Script Date: 28/4/2023 19:48:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDocumento](
	[IdTipo] [tinyint] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_TipoDocumento] PRIMARY KEY CLUSTERED 
(
	[IdTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoEmpleado]    Script Date: 28/4/2023 19:48:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoEmpleado](
	[IdTipo] [tinyint] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_TipoEmpresa] PRIMARY KEY CLUSTERED 
(
	[IdTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Viaje]    Script Date: 28/4/2023 19:48:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Viaje](
	[IdViaje] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NOT NULL,
	[PatenteCamion] [varchar](50) NOT NULL,
	[IdEmpleado] [int] NOT NULL,
 CONSTRAINT [PK_Viaje] PRIMARY KEY CLUSTERED 
(
	[IdViaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Distribuidor] ON 

INSERT [dbo].[Distribuidor] ([IdDistribuidor], [Nombre], [Direccion], [IdSucursal]) VALUES (1, N'Distribuidora Tita', N'Piamonte 323', 1)
INSERT [dbo].[Distribuidor] ([IdDistribuidor], [Nombre], [Direccion], [IdSucursal]) VALUES (2, N'Saladero Distribuidora', N'Alberdi 2456', 2)
INSERT [dbo].[Distribuidor] ([IdDistribuidor], [Nombre], [Direccion], [IdSucursal]) VALUES (3, N'IyC Distribuidora', N'Ameghino 546', 3)
INSERT [dbo].[Distribuidor] ([IdDistribuidor], [Nombre], [Direccion], [IdSucursal]) VALUES (4, N'Distribuidor Krow', N'San Jose 754', 4)
SET IDENTITY_INSERT [dbo].[Distribuidor] OFF
GO
SET IDENTITY_INSERT [dbo].[Productor] ON 

INSERT [dbo].[Productor] ([IdProductor], [Nombre], [Direccion], [IdSucursal]) VALUES (1, N'Las chilcas', N'Ruta nacional 34 Km 434', 1)
INSERT [dbo].[Productor] ([IdProductor], [Nombre], [Direccion], [IdSucursal]) VALUES (2, N'Ganaderia Flia Roberto', N'Ruta nacional 9 Km 968', 2)
INSERT [dbo].[Productor] ([IdProductor], [Nombre], [Direccion], [IdSucursal]) VALUES (3, N'Alfonso Ganaderia', N'Ruta nacional 11 Km 213', 3)
INSERT [dbo].[Productor] ([IdProductor], [Nombre], [Direccion], [IdSucursal]) VALUES (4, N'Los robles', N'Ruta nacional 42 Km 12', 4)
SET IDENTITY_INSERT [dbo].[Productor] OFF
GO
SET IDENTITY_INSERT [dbo].[Sucursal] ON 

INSERT [dbo].[Sucursal] ([IdSucursal], [Nombre], [Ciudad], [Direccion]) VALUES (1, N'Sucursal 1', N'Sunchales', N'Faustino 123')
INSERT [dbo].[Sucursal] ([IdSucursal], [Nombre], [Ciudad], [Direccion]) VALUES (2, N'Sucursal 2', N'Rafaela', N'Varela 231')
INSERT [dbo].[Sucursal] ([IdSucursal], [Nombre], [Ciudad], [Direccion]) VALUES (3, N'Sucursal 3', N'Santa Fe', N'Belgrano 4214')
INSERT [dbo].[Sucursal] ([IdSucursal], [Nombre], [Ciudad], [Direccion]) VALUES (4, N'Sucursal 4', N'Rosario', N'Alvarez 865')
SET IDENTITY_INSERT [dbo].[Sucursal] OFF
GO
ALTER TABLE [dbo].[Camion]  WITH CHECK ADD  CONSTRAINT [FK_Camion_Productor] FOREIGN KEY([IdProductor])
REFERENCES [dbo].[Productor] ([IdProductor])
GO
ALTER TABLE [dbo].[Camion] CHECK CONSTRAINT [FK_Camion_Productor]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_TipoCliente] FOREIGN KEY([Tipo])
REFERENCES [dbo].[TipoCliente] ([IdTipo])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_TipoCliente]
GO
ALTER TABLE [dbo].[CorteCarnico]  WITH CHECK ADD  CONSTRAINT [FK_CorteCarnico_Pedido] FOREIGN KEY([NumeroPedido])
REFERENCES [dbo].[Pedido] ([NumeroPedido])
GO
ALTER TABLE [dbo].[CorteCarnico] CHECK CONSTRAINT [FK_CorteCarnico_Pedido]
GO
ALTER TABLE [dbo].[CuentaCorriente]  WITH CHECK ADD  CONSTRAINT [FK_CuentaCorriente_Sucursal] FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
ALTER TABLE [dbo].[CuentaCorriente] CHECK CONSTRAINT [FK_CuentaCorriente_Sucursal]
GO
ALTER TABLE [dbo].[DeudaProveedor]  WITH CHECK ADD  CONSTRAINT [FK_DeudaProveedor_Sucursal] FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
ALTER TABLE [dbo].[DeudaProveedor] CHECK CONSTRAINT [FK_DeudaProveedor_Sucursal]
GO
ALTER TABLE [dbo].[Distribuidor]  WITH CHECK ADD  CONSTRAINT [FK_Distribuidor_Sucursal] FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
ALTER TABLE [dbo].[Distribuidor] CHECK CONSTRAINT [FK_Distribuidor_Sucursal]
GO
ALTER TABLE [dbo].[Distribuidor_Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Distribuidor_Cliente_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Distribuidor_Cliente] CHECK CONSTRAINT [FK_Distribuidor_Cliente_Cliente]
GO
ALTER TABLE [dbo].[Distribuidor_Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Distribuidor_Cliente_Distribuidor] FOREIGN KEY([IdDistribuidor])
REFERENCES [dbo].[Distribuidor] ([IdDistribuidor])
GO
ALTER TABLE [dbo].[Distribuidor_Cliente] CHECK CONSTRAINT [FK_Distribuidor_Cliente_Distribuidor]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Cliente]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Distribuidor] FOREIGN KEY([IdDistribuidor])
REFERENCES [dbo].[Distribuidor] ([IdDistribuidor])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Distribuidor]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Sucursal] FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Sucursal]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_TipoEmpleado] FOREIGN KEY([TipoEmpleado])
REFERENCES [dbo].[TipoEmpleado] ([IdTipo])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_TipoEmpleado]
GO
ALTER TABLE [dbo].[Entrega]  WITH CHECK ADD  CONSTRAINT [FK_Entrega_Camion] FOREIGN KEY([PatenteCamion])
REFERENCES [dbo].[Camion] ([Patente])
GO
ALTER TABLE [dbo].[Entrega] CHECK CONSTRAINT [FK_Entrega_Camion]
GO
ALTER TABLE [dbo].[Entrega]  WITH CHECK ADD  CONSTRAINT [FK_Entrega_Distribuidor] FOREIGN KEY([IdDistribuidor])
REFERENCES [dbo].[Distribuidor] ([IdDistribuidor])
GO
ALTER TABLE [dbo].[Entrega] CHECK CONSTRAINT [FK_Entrega_Distribuidor]
GO
ALTER TABLE [dbo].[Entrega]  WITH CHECK ADD  CONSTRAINT [FK_Entrega_Empleado] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
ALTER TABLE [dbo].[Entrega] CHECK CONSTRAINT [FK_Entrega_Empleado]
GO
ALTER TABLE [dbo].[Entrega]  WITH CHECK ADD  CONSTRAINT [FK_Entrega_Empleado1] FOREIGN KEY([ResponsableCarga])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
ALTER TABLE [dbo].[Entrega] CHECK CONSTRAINT [FK_Entrega_Empleado1]
GO
ALTER TABLE [dbo].[Entrega]  WITH CHECK ADD  CONSTRAINT [FK_Entrega_Factura-Nota-Recibo] FOREIGN KEY([IdFactura])
REFERENCES [dbo].[Factura-Nota-Recibo] ([IdDocumento])
GO
ALTER TABLE [dbo].[Entrega] CHECK CONSTRAINT [FK_Entrega_Factura-Nota-Recibo]
GO
ALTER TABLE [dbo].[Entrega_Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Entrega_Pedido_Entrega] FOREIGN KEY([NumeroEntrega])
REFERENCES [dbo].[Entrega] ([NumeroEntrega])
GO
ALTER TABLE [dbo].[Entrega_Pedido] CHECK CONSTRAINT [FK_Entrega_Pedido_Entrega]
GO
ALTER TABLE [dbo].[Entrega_Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Entrega_Pedido_Pedido] FOREIGN KEY([NumeroPedido])
REFERENCES [dbo].[Pedido] ([NumeroPedido])
GO
ALTER TABLE [dbo].[Entrega_Pedido] CHECK CONSTRAINT [FK_Entrega_Pedido_Pedido]
GO
ALTER TABLE [dbo].[Factura-Nota-Recibo]  WITH CHECK ADD  CONSTRAINT [FK_Factura-Nota-Recibo_Sucursal] FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
ALTER TABLE [dbo].[Factura-Nota-Recibo] CHECK CONSTRAINT [FK_Factura-Nota-Recibo_Sucursal]
GO
ALTER TABLE [dbo].[Factura-Nota-Recibo]  WITH CHECK ADD  CONSTRAINT [FK_Factura-Nota-Recibo_TipoDocumento] FOREIGN KEY([Tipo])
REFERENCES [dbo].[TipoDocumento] ([IdTipo])
GO
ALTER TABLE [dbo].[Factura-Nota-Recibo] CHECK CONSTRAINT [FK_Factura-Nota-Recibo_TipoDocumento]
GO
ALTER TABLE [dbo].[Mantenimiento]  WITH CHECK ADD  CONSTRAINT [FK_Mantenimiento_Camion] FOREIGN KEY([PatenteCamion])
REFERENCES [dbo].[Camion] ([Patente])
GO
ALTER TABLE [dbo].[Mantenimiento] CHECK CONSTRAINT [FK_Mantenimiento_Camion]
GO
ALTER TABLE [dbo].[PagoProveedor]  WITH CHECK ADD  CONSTRAINT [FK_PagoProveedor_Sucursal] FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
ALTER TABLE [dbo].[PagoProveedor] CHECK CONSTRAINT [FK_PagoProveedor_Sucursal]
GO
ALTER TABLE [dbo].[Productor]  WITH CHECK ADD  CONSTRAINT [FK_Productor_Sucursal] FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
ALTER TABLE [dbo].[Productor] CHECK CONSTRAINT [FK_Productor_Sucursal]
GO
ALTER TABLE [dbo].[Remito]  WITH CHECK ADD  CONSTRAINT [FK_Remito_Sucursal] FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
ALTER TABLE [dbo].[Remito] CHECK CONSTRAINT [FK_Remito_Sucursal]
GO
ALTER TABLE [dbo].[Viaje]  WITH CHECK ADD  CONSTRAINT [FK_Viaje_Camion] FOREIGN KEY([PatenteCamion])
REFERENCES [dbo].[Camion] ([Patente])
GO
ALTER TABLE [dbo].[Viaje] CHECK CONSTRAINT [FK_Viaje_Camion]
GO
ALTER TABLE [dbo].[Viaje]  WITH CHECK ADD  CONSTRAINT [FK_Viaje_Empleado] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
ALTER TABLE [dbo].[Viaje] CHECK CONSTRAINT [FK_Viaje_Empleado]
GO
USE [master]
GO
ALTER DATABASE [DB-FRIGORIFICO] SET  READ_WRITE 
GO
