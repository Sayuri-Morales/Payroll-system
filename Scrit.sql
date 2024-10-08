USE [master]
GO
/****** Object:  Database [Sistema_Planilla]    Script Date: 15/8/2024 09:10:20 ******/
CREATE DATABASE [Sistema_Planilla]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sistema_Planilla', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Sistema_Planilla.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sistema_Planilla_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Sistema_Planilla_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Sistema_Planilla] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sistema_Planilla].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sistema_Planilla] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sistema_Planilla] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sistema_Planilla] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sistema_Planilla] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sistema_Planilla] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sistema_Planilla] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sistema_Planilla] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sistema_Planilla] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sistema_Planilla] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sistema_Planilla] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sistema_Planilla] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sistema_Planilla] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sistema_Planilla] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sistema_Planilla] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sistema_Planilla] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Sistema_Planilla] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sistema_Planilla] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sistema_Planilla] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sistema_Planilla] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sistema_Planilla] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sistema_Planilla] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sistema_Planilla] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sistema_Planilla] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Sistema_Planilla] SET  MULTI_USER 
GO
ALTER DATABASE [Sistema_Planilla] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sistema_Planilla] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sistema_Planilla] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sistema_Planilla] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Sistema_Planilla] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Sistema_Planilla] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Sistema_Planilla', N'ON'
GO
ALTER DATABASE [Sistema_Planilla] SET QUERY_STORE = ON
GO
ALTER DATABASE [Sistema_Planilla] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Sistema_Planilla]
GO
/****** Object:  DatabaseRole [UsuarioGenerico]    Script Date: 15/8/2024 09:10:21 ******/
CREATE ROLE [UsuarioGenerico]
GO
/****** Object:  DatabaseRole [FuncionarioPlanilla]    Script Date: 15/8/2024 09:10:21 ******/
CREATE ROLE [FuncionarioPlanilla]
GO
/****** Object:  DatabaseRole [Funcionario]    Script Date: 15/8/2024 09:10:21 ******/
CREATE ROLE [Funcionario]
GO
/****** Object:  DatabaseRole [AdministradorGeneral]    Script Date: 15/8/2024 09:10:21 ******/
CREATE ROLE [AdministradorGeneral]
GO
/****** Object:  Table [dbo].[Concepto]    Script Date: 15/8/2024 09:10:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Concepto](
	[ID_Concepto] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Tipo] [varchar](50) NULL,
	[Forma_Calculo] [float] NULL,
 CONSTRAINT [PK_Concepto] PRIMARY KEY CLUSTERED 
(
	[ID_Concepto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacto]    Script Date: 15/8/2024 09:10:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacto](
	[ID_Sucursal] [int] NULL,
	[Nombre] [varchar](50) NULL,
	[Correo_Electronico] [varchar](50) NULL,
	[Mensaje] [text] NULL,
	[ID_Contacto] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Contacto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle_Planilla]    Script Date: 15/8/2024 09:10:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle_Planilla](
	[ID_Detalle] [int] NOT NULL,
	[ID_Planilla] [int] NOT NULL,
	[ID_Empleado] [int] NOT NULL,
	[ID_Concepto] [int] NOT NULL,
	[Valor] [float] NULL,
 CONSTRAINT [PK_Detalle_Planilla] PRIMARY KEY CLUSTERED 
(
	[ID_Detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 15/8/2024 09:10:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[Nombre] [varchar](50) NULL,
	[ID] [int] NOT NULL,
	[ApellidoP] [varchar](50) NULL,
	[ApellidoS] [varchar](50) NULL,
	[Nacionalidad] [varchar](50) NULL,
	[Fecha_Nacimiento] [date] NULL,
	[Provincia] [varchar](50) NULL,
	[Canton] [varchar](50) NULL,
	[Distrito] [varchar](50) NULL,
	[Barrio] [varchar](50) NULL,
	[Direccion_Ubicacion] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
	[Correo_Electronico] [varchar](50) NULL,
	[Estado] [varchar](50) NULL,
	[ID_Sucursal] [int] NULL,
	[Fecha_Ingreso] [date] NULL,
	[Salario_Base] [decimal](10, 2) NULL,
	[Salario_Horas_Extras] [decimal](18, 2) NULL,
	[Salario_Horas_Extras_Dobles] [decimal](18, 2) NULL,
	[SEM] [decimal](18, 2) NULL,
	[IVM] [decimal](18, 2) NULL,
	[Aporte_Popular] [decimal](18, 2) NULL,
	[Deduccion_Fija] [decimal](18, 2) NULL,
	[Deduccion_Porcentaje] [decimal](18, 2) NULL,
	[Salario_Neto] [decimal](18, 2) NULL,
	[Mes] [int] NULL,
	[Estado_Proceso] [nvarchar](50) NULL,
	[RowVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Planilla]    Script Date: 15/8/2024 09:10:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Planilla](
	[ID_Planilla] [int] NOT NULL,
	[Mes] [date] NULL,
	[Fecha_Creacion] [date] NULL,
	[ID_empleado] [int] NOT NULL,
	[Estado] [varchar](50) NULL,
 CONSTRAINT [PK_Planilla] PRIMARY KEY CLUSTERED 
(
	[ID_Planilla] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 15/8/2024 09:10:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursal](
	[ID_Sucursal] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Direccion] [varchar](100) NULL,
 CONSTRAINT [PK_Sucursal] PRIMARY KEY CLUSTERED 
(
	[ID_Sucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 15/8/2024 09:10:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[ID_Empleado] [int] NOT NULL,
	[Nombre_Usuario] [varchar](50) NOT NULL,
	[Contrasena] [varchar](50) NOT NULL,
	[Tipo_Usuario] [varchar](50) NULL,
	[Estado] [varchar](50) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[ID_Empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Concepto] ([ID_Concepto], [Nombre], [Tipo], [Forma_Calculo]) VALUES (1, N'Salario Base', N'Ingreso', NULL)
INSERT [dbo].[Concepto] ([ID_Concepto], [Nombre], [Tipo], [Forma_Calculo]) VALUES (2, N'Bonificación', N'Ingreso', NULL)
INSERT [dbo].[Concepto] ([ID_Concepto], [Nombre], [Tipo], [Forma_Calculo]) VALUES (3, N'SEM-CCSS', N'Deduccion', NULL)
INSERT [dbo].[Concepto] ([ID_Concepto], [Nombre], [Tipo], [Forma_Calculo]) VALUES (4, N'Horas Extra', N'Ingreso', NULL)
INSERT [dbo].[Concepto] ([ID_Concepto], [Nombre], [Tipo], [Forma_Calculo]) VALUES (5, N'IVM-CCSS', N'Deduccion', NULL)
INSERT [dbo].[Concepto] ([ID_Concepto], [Nombre], [Tipo], [Forma_Calculo]) VALUES (6, N'Impuesto al Salario', N'Deduccion', NULL)
INSERT [dbo].[Concepto] ([ID_Concepto], [Nombre], [Tipo], [Forma_Calculo]) VALUES (7, N'Pago Prestamo', N'Deduccion', NULL)
GO
SET IDENTITY_INSERT [dbo].[Contacto] ON 

INSERT [dbo].[Contacto] ([ID_Sucursal], [Nombre], [Correo_Electronico], [Mensaje], [ID_Contacto]) VALUES (NULL, N'Sayuri', N'sayorims12@hotmail.com', N'Hello', 1)
INSERT [dbo].[Contacto] ([ID_Sucursal], [Nombre], [Correo_Electronico], [Mensaje], [ID_Contacto]) VALUES (NULL, N'Sayuri', N'sayorims12@hotmail.com', N'Prueba', 2)
SET IDENTITY_INSERT [dbo].[Contacto] OFF
GO
INSERT [dbo].[Detalle_Planilla] ([ID_Detalle], [ID_Planilla], [ID_Empleado], [ID_Concepto], [Valor]) VALUES (1, 1, 202220222, 1, 1500.5)
INSERT [dbo].[Detalle_Planilla] ([ID_Detalle], [ID_Planilla], [ID_Empleado], [ID_Concepto], [Valor]) VALUES (2, 1, 202220222, 1, 2000.75)
INSERT [dbo].[Detalle_Planilla] ([ID_Detalle], [ID_Planilla], [ID_Empleado], [ID_Concepto], [Valor]) VALUES (3, 2, 202220222, 1, 1800.25)
INSERT [dbo].[Detalle_Planilla] ([ID_Detalle], [ID_Planilla], [ID_Empleado], [ID_Concepto], [Valor]) VALUES (4, 2, 202220222, 2, 1750)
INSERT [dbo].[Detalle_Planilla] ([ID_Detalle], [ID_Planilla], [ID_Empleado], [ID_Concepto], [Valor]) VALUES (5, 3, 202220222, 3, 2100.35)
GO
INSERT [dbo].[Empleado] ([Nombre], [ID], [ApellidoP], [ApellidoS], [Nacionalidad], [Fecha_Nacimiento], [Provincia], [Canton], [Distrito], [Barrio], [Direccion_Ubicacion], [Telefono], [Correo_Electronico], [Estado], [ID_Sucursal], [Fecha_Ingreso], [Salario_Base], [Salario_Horas_Extras], [Salario_Horas_Extras_Dobles], [SEM], [IVM], [Aporte_Popular], [Deduccion_Fija], [Deduccion_Porcentaje], [Salario_Neto], [Mes], [Estado_Proceso]) VALUES (N'Sayuri', 101110111, N'Sayuri', N'Morales', N'CR', CAST(N'2002-07-30' AS Date), N'Cartago', N'Paraiso', N'Cachi', N'Vista al lago', N'Vista Al Lago', N'83993198', N'sayorims12@hotmail.com', N'Activo', 1, CAST(N'2024-07-17' AS Date), CAST(400.00 AS Decimal(10, 2)), CAST(75.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), CAST(63.25 AS Decimal(18, 2)), CAST(47.96 AS Decimal(18, 2)), CAST(11.50 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), CAST(1700.00 AS Decimal(18, 2)), NULL, NULL)
INSERT [dbo].[Empleado] ([Nombre], [ID], [ApellidoP], [ApellidoS], [Nacionalidad], [Fecha_Nacimiento], [Provincia], [Canton], [Distrito], [Barrio], [Direccion_Ubicacion], [Telefono], [Correo_Electronico], [Estado], [ID_Sucursal], [Fecha_Ingreso], [Salario_Base], [Salario_Horas_Extras], [Salario_Horas_Extras_Dobles], [SEM], [IVM], [Aporte_Popular], [Deduccion_Fija], [Deduccion_Porcentaje], [Salario_Neto], [Mes], [Estado_Proceso]) VALUES (N'Sayuri', 202220222, N'Morale', N'Serrano', N'CR', CAST(N'2002-07-30' AS Date), N'Cartago', N'Paraiso', N'Cachi', N'Vista al lago', N'Vista Al Lago', N'83993198', N'sayorims12@hotmail.com', N'Activo', 1, CAST(N'2024-07-17' AS Date), CAST(14400.00 AS Decimal(10, 2)), CAST(21600.00 AS Decimal(18, 2)), CAST(31200.00 AS Decimal(18, 2)), CAST(3696.00 AS Decimal(18, 2)), CAST(2802.24 AS Decimal(18, 2)), CAST(672.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(2016.00 AS Decimal(18, 2)), CAST(65172.00 AS Decimal(18, 2)), 5, N'Activo')
GO
INSERT [dbo].[Planilla] ([ID_Planilla], [Mes], [Fecha_Creacion], [ID_empleado], [Estado]) VALUES (1, CAST(N'2024-01-01' AS Date), CAST(N'2024-01-05' AS Date), 202220222, N'Aprobada')
INSERT [dbo].[Planilla] ([ID_Planilla], [Mes], [Fecha_Creacion], [ID_empleado], [Estado]) VALUES (2, CAST(N'2024-02-01' AS Date), CAST(N'2024-02-10' AS Date), 202220222, N'Pendiente')
INSERT [dbo].[Planilla] ([ID_Planilla], [Mes], [Fecha_Creacion], [ID_empleado], [Estado]) VALUES (3, CAST(N'2024-03-01' AS Date), CAST(N'2024-03-15' AS Date), 202220222, N'Aprobada')
INSERT [dbo].[Planilla] ([ID_Planilla], [Mes], [Fecha_Creacion], [ID_empleado], [Estado]) VALUES (4, CAST(N'2024-04-01' AS Date), CAST(N'2024-04-20' AS Date), 202220222, N'En Proceso')
INSERT [dbo].[Planilla] ([ID_Planilla], [Mes], [Fecha_Creacion], [ID_empleado], [Estado]) VALUES (5, CAST(N'2024-05-01' AS Date), CAST(N'2024-05-25' AS Date), 202220222, N'Pendiente')
GO
INSERT [dbo].[Sucursal] ([ID_Sucursal], [Nombre], [Direccion]) VALUES (1, N'Sucursal Central', N'123 Calle Principal')
INSERT [dbo].[Sucursal] ([ID_Sucursal], [Nombre], [Direccion]) VALUES (2, N'Sucursal Norte', N'1 Calle Norte')
INSERT [dbo].[Sucursal] ([ID_Sucursal], [Nombre], [Direccion]) VALUES (3, N'Sucursal sur', N'Polo Sur')
GO
INSERT [dbo].[Usuario] ([ID_Empleado], [Nombre_Usuario], [Contrasena], [Tipo_Usuario], [Estado]) VALUES (10000021, N'empleadodos', N'123', N'Empleado', N'Activo')
INSERT [dbo].[Usuario] ([ID_Empleado], [Nombre_Usuario], [Contrasena], [Tipo_Usuario], [Estado]) VALUES (10411011, N'Maria', N'123', N'Encargado', N'Activo')
INSERT [dbo].[Usuario] ([ID_Empleado], [Nombre_Usuario], [Contrasena], [Tipo_Usuario], [Estado]) VALUES (101110111, N'Encargado', N'123', N'Encargado', N'Activo')
INSERT [dbo].[Usuario] ([ID_Empleado], [Nombre_Usuario], [Contrasena], [Tipo_Usuario], [Estado]) VALUES (102110111, N'Empleado', N'123', N'Empleado', N'Activo')
INSERT [dbo].[Usuario] ([ID_Empleado], [Nombre_Usuario], [Contrasena], [Tipo_Usuario], [Estado]) VALUES (103110111, N'Raul', N'123', N'Encargado', N'Inactivo')
INSERT [dbo].[Usuario] ([ID_Empleado], [Nombre_Usuario], [Contrasena], [Tipo_Usuario], [Estado]) VALUES (202220222, N'Sayuri', N'123', N'Empleado', N'Activo')
INSERT [dbo].[Usuario] ([ID_Empleado], [Nombre_Usuario], [Contrasena], [Tipo_Usuario], [Estado]) VALUES (303330333, N'Mara', N'123', N'Empleado', N'Activo')
GO
ALTER TABLE [dbo].[Concepto]  WITH CHECK ADD  CONSTRAINT [FK_Concepto_Concepto] FOREIGN KEY([ID_Concepto])
REFERENCES [dbo].[Concepto] ([ID_Concepto])
GO
ALTER TABLE [dbo].[Concepto] CHECK CONSTRAINT [FK_Concepto_Concepto]
GO
ALTER TABLE [dbo].[Detalle_Planilla]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Planilla_Concepto] FOREIGN KEY([ID_Concepto])
REFERENCES [dbo].[Concepto] ([ID_Concepto])
GO
ALTER TABLE [dbo].[Detalle_Planilla] CHECK CONSTRAINT [FK_Detalle_Planilla_Concepto]
GO
ALTER TABLE [dbo].[Detalle_Planilla]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Planilla_Empleado] FOREIGN KEY([ID_Empleado])
REFERENCES [dbo].[Empleado] ([ID])
GO
ALTER TABLE [dbo].[Detalle_Planilla] CHECK CONSTRAINT [FK_Detalle_Planilla_Empleado]
GO
ALTER TABLE [dbo].[Detalle_Planilla]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Planilla_Planilla] FOREIGN KEY([ID_Planilla])
REFERENCES [dbo].[Planilla] ([ID_Planilla])
GO
ALTER TABLE [dbo].[Detalle_Planilla] CHECK CONSTRAINT [FK_Detalle_Planilla_Planilla]
GO
ALTER TABLE [dbo].[Detalle_Planilla]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Planilla_Usuario] FOREIGN KEY([ID_Empleado])
REFERENCES [dbo].[Usuario] ([ID_Empleado])
GO
ALTER TABLE [dbo].[Detalle_Planilla] CHECK CONSTRAINT [FK_Detalle_Planilla_Usuario]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Sucursal] FOREIGN KEY([ID_Sucursal])
REFERENCES [dbo].[Sucursal] ([ID_Sucursal])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Sucursal]
GO
ALTER TABLE [dbo].[Planilla]  WITH CHECK ADD  CONSTRAINT [FK_Planilla_empleado] FOREIGN KEY([ID_empleado])
REFERENCES [dbo].[Empleado] ([ID])
GO
ALTER TABLE [dbo].[Planilla] CHECK CONSTRAINT [FK_Planilla_empleado]
GO
ALTER TABLE [dbo].[Planilla]  WITH CHECK ADD  CONSTRAINT [FK_Planilla_Usuario] FOREIGN KEY([ID_empleado])
REFERENCES [dbo].[Usuario] ([ID_Empleado])
GO
ALTER TABLE [dbo].[Planilla] CHECK CONSTRAINT [FK_Planilla_Usuario]
GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarEmpleado]    Script Date: 15/8/2024 09:10:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ActualizarEmpleado]
    @ID INT,
    @Nombre NVARCHAR(100),
    @ApellidoP NVARCHAR(100),
    @ApellidoS NVARCHAR(100),
    @Nacionalidad NVARCHAR(50),
    @Fecha_Nacimiento DATE,
    @Provincia NVARCHAR(50),
    @Canton NVARCHAR(50),
    @Distrito NVARCHAR(50),
    @Barrio NVARCHAR(50),
    @Direccion_Ubicacion NVARCHAR(200),
    @Telefono NVARCHAR(15),
    @Correo_Electronico NVARCHAR(100),
    @RowVersion ROWVERSION
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE dbo.Empleado
    SET
        Nombre = @Nombre,
        ApellidoP = @ApellidoP,
        ApellidoS = @ApellidoS,
        Nacionalidad = @Nacionalidad,
        Fecha_Nacimiento = @Fecha_Nacimiento,
        Provincia = @Provincia,
        Canton = @Canton,
        Distrito = @Distrito,
        Barrio = @Barrio,
        Direccion_Ubicacion = @Direccion_Ubicacion,
        Telefono = @Telefono,
        Correo_Electronico = @Correo_Electronico
    WHERE
        ID = @ID AND
        RowVersion = @RowVersion;

    IF @@ROWCOUNT = 0
    BEGIN
        -- No se realizó ninguna actualización; esto puede ser debido a un conflicto de versión
        RAISERROR ('Los datos del empleado han cambiado desde que se cargaron. Intente de nuevo.', 16, 1);
    END
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarEstadoEmpleado]    Script Date: 15/8/2024 09:10:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_ActualizarEstadoEmpleado]
    @ID_Empleado INT,
    @NuevoEstado NVARCHAR(50)
AS
BEGIN
    BEGIN TRY
        -- Validar que el estado proporcionado sea válido
        IF NOT (@NuevoEstado IN ('aprobado', 'en proceso', 'pendiente'))
        BEGIN
            RAISERROR('El nuevo estado debe ser "aprobado", "en proceso" o "pendiente".', 16, 1);
            RETURN;
        END

        -- Actualizar el estado del empleado
        UPDATE Empleado
        SET Estado_Proceso = @NuevoEstado
        WHERE ID = @ID_Empleado;

        PRINT 'Estado actualizado correctamente para el empleado con ID: ' + CAST(@ID_Empleado AS NVARCHAR(10));
    END TRY
    BEGIN CATCH
        PRINT 'Error en usp_ActualizarEstadoEmpleado: ' + ERROR_MESSAGE();
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AutenticarUsuario]    Script Date: 15/8/2024 09:10:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_AutenticarUsuario]
    @Nombre_Usuario NVARCHAR(50),
    @Contrasena NVARCHAR(50)
AS
BEGIN
    SELECT  ID_Empleado, Tipo_Usuario, Estado
    FROM Usuario
    WHERE Nombre_Usuario = @Nombre_Usuario AND Contrasena = @Contrasena
END

GO
/****** Object:  StoredProcedure [dbo].[usp_CalcularCargasSociales]    Script Date: 15/8/2024 09:10:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_CalcularCargasSociales]
    @ID_Empleado INT,
    @SalarioBase DECIMAL(10, 2),
    @SalarioHorasExtras DECIMAL(10, 2),
    @SalarioHorasExtrasDobles DECIMAL(10, 2)
AS
BEGIN
    BEGIN TRY
        DECLARE @SalarioBruto DECIMAL(10, 2);
        DECLARE @SEM DECIMAL(10, 2);
        DECLARE @IVM DECIMAL(10, 2);
        DECLARE @Popular DECIMAL(10, 2);
    
        -- Cálculo del salario bruto
        SET @SalarioBruto = @SalarioBase + @SalarioHorasExtras + @SalarioHorasExtrasDobles;

        -- Cálculo de cargas sociales
        SET @SEM = @SalarioBruto * 0.055;   -- 5.5%
        SET @IVM = @SalarioBruto * 0.0417;  -- 4.17%
        SET @Popular = @SalarioBruto * 0.01; -- 1%

        -- Impresiones para verificar valores
        PRINT 'Salario Bruto: ' + CAST(@SalarioBruto AS NVARCHAR(50));
        PRINT 'SEM: ' + CAST(@SEM AS NVARCHAR(50));
        PRINT 'IVM: ' + CAST(@IVM AS NVARCHAR(50));
        PRINT 'Aporte Popular: ' + CAST(@Popular AS NVARCHAR(50));

        -- Verificar que el empleado existe antes de actualizar
        IF EXISTS (SELECT 1 FROM Empleado WHERE ID = @ID_Empleado)
        BEGIN
            -- Actualización de cargas sociales en la tabla Empleado
            UPDATE Empleado
            SET SEM = @SEM,
                IVM = @IVM,
                Aporte_Popular = @Popular
            WHERE ID = @ID_Empleado;
        END
        ELSE
        BEGIN
            PRINT 'Empleado no encontrado con ID: ' + CAST(@ID_Empleado AS NVARCHAR(50));
        END
    END TRY
    BEGIN CATCH
        PRINT 'Error en usp_CalcularCargasSociales: ' + ERROR_MESSAGE();
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_CalcularDeducciones]    Script Date: 15/8/2024 09:10:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_CalcularDeducciones]
    @ID_Empleado INT,
    @SalarioBruto DECIMAL(10, 2),
    @DeduccionFija DECIMAL(10, 2),
    @PorcentajeDeduccion DECIMAL(10, 2)
AS
BEGIN
    BEGIN TRY
        DECLARE @TotalDeducciones DECIMAL(10, 2);
        DECLARE @DeduccionPorcentaje DECIMAL(10, 2);
        DECLARE @SalarioNeto DECIMAL(10, 2);

        -- Cálculo de la deducción porcentual
        SET @DeduccionPorcentaje = @SalarioBruto * (@PorcentajeDeduccion / 100);

        -- Total de deducciones
        SET @TotalDeducciones = @DeduccionFija + @DeduccionPorcentaje;

        -- Cálculo del salario neto
        SET @SalarioNeto = @SalarioBruto - @TotalDeducciones;

        -- Impresiones para verificar valores
        PRINT 'Salario Bruto: ' + CAST(@SalarioBruto AS NVARCHAR(50));
        PRINT 'Deducción Fija: ' + CAST(@DeduccionFija AS NVARCHAR(50));
        PRINT 'Deducción Porcentaje: ' + CAST(@DeduccionPorcentaje AS NVARCHAR(50));
        PRINT 'Total Deducciones: ' + CAST(@TotalDeducciones AS NVARCHAR(50));
        PRINT 'Salario Neto: ' + CAST(@SalarioNeto AS NVARCHAR(50));

        -- Verificar que el empleado existe antes de actualizar
        IF EXISTS (SELECT 1 FROM Empleado WHERE ID = @ID_Empleado)
        BEGIN
            -- Actualización de deducciones y salario neto en la tabla Empleado
            UPDATE Empleado
            SET Deduccion_Fija = @DeduccionFija,
                Deduccion_Porcentaje = @DeduccionPorcentaje,
                Salario_Neto = @SalarioNeto
            WHERE ID = @ID_Empleado;
        END
        ELSE
        BEGIN
            PRINT 'Empleado no encontrado con ID: ' + CAST(@ID_Empleado AS NVARCHAR(50));
        END
    END TRY
    BEGIN CATCH
        PRINT 'Error en usp_CalcularDeducciones: ' + ERROR_MESSAGE();
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_CalcularSalario]    Script Date: 15/8/2024 09:10:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_CalcularSalario]
    @ID_Empleado INT,
    @Horas_Trabajadas DECIMAL(10, 2),
    @Precio_Hora DECIMAL(10, 2),
    @Horas_Extras DECIMAL(10, 2),
    @Horas_Extras_Dobles DECIMAL(10, 2)
AS
BEGIN
    DECLARE @SalarioBase DECIMAL(10, 2);
    DECLARE @SalarioExtra DECIMAL(10, 2);
    DECLARE @SalarioExtraDoble DECIMAL(10, 2);
    
    -- Cálculo del salario base
    SET @SalarioBase = @Horas_Trabajadas * @Precio_Hora;

    -- Cálculo de horas extras (1.5 veces el precio por hora)
    SET @SalarioExtra = @Horas_Extras * @Precio_Hora * 1.5;

    -- Cálculo de horas extras dobles (2 veces el precio por hora)
    SET @SalarioExtraDoble = @Horas_Extras_Dobles * @Precio_Hora * 2;

    -- Impresiones para verificar valores
    PRINT 'Salario Base: ' + CAST(@SalarioBase AS NVARCHAR(50));
    PRINT 'Salario Extra: ' + CAST(@SalarioExtra AS NVARCHAR(50));
    PRINT 'Salario Extra Doble: ' + CAST(@SalarioExtraDoble AS NVARCHAR(50));

    -- Verificar que el empleado existe antes de actualizar
    IF EXISTS (SELECT 1 FROM Empleado WHERE ID = @ID_Empleado)
    BEGIN
        -- Actualizar el salario del empleado
        UPDATE Empleado
        SET Salario_Base = @SalarioBase,
            Salario_Horas_Extras = @SalarioExtra,
            Salario_Horas_Extras_Dobles = @SalarioExtraDoble
        WHERE ID = @ID_Empleado;
    END
    ELSE
    BEGIN
        PRINT 'Empleado no encontrado con ID: ' + CAST(@ID_Empleado AS NVARCHAR(50));
    END
END
GO
/****** Object:  StoredProcedure [dbo].[usp_CargarConceptos]    Script Date: 15/8/2024 09:10:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_CargarConceptos]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT [ID_Concepto], [Nombre], [Tipo], [Forma_Calculo]
    FROM [Concepto];
END
GO
/****** Object:  StoredProcedure [dbo].[usp_CargarDetallePlanilla]    Script Date: 15/8/2024 09:10:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_CargarDetallePlanilla]
    @ID_Empleado INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        Salario_Base,
        Salario_Horas_Extras,
        Salario_Horas_Extras_Dobles,
        SEM,
        IVM,
        Aporte_Popular,
        Deduccion_Fija,
        Deduccion_Porcentaje,
        Salario_Neto,
		Mes,           
        Estado_Proceso
    FROM Empleado
    WHERE ID = @ID_Empleado;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarEncargado]    Script Date: 15/8/2024 09:10:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_EliminarEncargado]
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Empleado
    WHERE ID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertarDetallePlanilla]    Script Date: 15/8/2024 09:10:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_InsertarDetallePlanilla]
    @ID_Detalle INT,
    @ID_Planilla INT,
    @ID_Empleado INT,
    @ID_Concepto INT,
    @Valor DECIMAL(10, 2)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Detalle_Planilla] ([ID_Detalle], [ID_Planilla], [ID_Empleado], [ID_Concepto], [Valor])
    VALUES (@ID_Detalle, @ID_Planilla, @ID_Empleado, @ID_Concepto, @Valor);
END
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertarEmpleado]    Script Date: 15/8/2024 09:10:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_InsertarEmpleado]
    @ID INT,
    @Nombre NVARCHAR(50),
    @ApellidoP NVARCHAR(50),
    @ApellidoS NVARCHAR(50),
    @Nacionalidad NVARCHAR(50),
    @Fecha_Nacimiento DATE,
    @Provincia NVARCHAR(50),
    @Canton NVARCHAR(50),
    @Distrito NVARCHAR(50),
    @Barrio NVARCHAR(50),
    @Direccion_Ubicacion NVARCHAR(100),
    @Telefono NVARCHAR(50),
    @Correo_Electronico NVARCHAR(50),
    @Estado NVARCHAR(50),
    @ID_Sucursal INT,
    @Fecha_Ingreso DATE
AS
BEGIN
    -- Validar que el empleado tenga al menos 16 años
    DECLARE @Edad INT;
    DECLARE @Hoy DATE = GETDATE();
    SET @Edad = DATEDIFF(YEAR, @Fecha_Nacimiento, @Hoy);

    IF @Edad < 16
    BEGIN
        THROW 50000, 'El empleado debe tener al menos 16 años.', 1;
        RETURN;
    END

    -- Insertar el empleado
    INSERT INTO Empleado (ID, Nombre, ApellidoP, ApellidoS, Nacionalidad, Fecha_Nacimiento,
                          Provincia, Canton, Distrito, Barrio, Direccion_Ubicacion, Telefono,
                          Correo_Electronico, Estado, ID_Sucursal, Fecha_Ingreso)
    VALUES (@ID, @Nombre, @ApellidoP, @ApellidoS, @Nacionalidad, @Fecha_Nacimiento,
            @Provincia, @Canton, @Distrito, @Barrio, @Direccion_Ubicacion, @Telefono,
            @Correo_Electronico, @Estado, @ID_Sucursal, @Fecha_Ingreso);
END
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertarMensajeContacto]    Script Date: 15/8/2024 09:10:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_InsertarMensajeContacto]
    @Nombre NVARCHAR(50),
    @Correo_Electronico NVARCHAR(100),
    @Mensaje NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Contacto (Nombre, Correo_Electronico, Mensaje)
    VALUES (@Nombre, @Correo_Electronico, @Mensaje);
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarConcepto]    Script Date: 15/8/2024 09:10:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_ModificarConcepto]
    @ID_Concepto INT,
    @Nombre NVARCHAR(100),
    @Tipo NVARCHAR(50),
    @Forma_Calculo NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [Concepto]
    SET [Nombre] = @Nombre,
        [Tipo] = @Tipo,
        [Forma_Calculo] = @Forma_Calculo
    WHERE [ID_Concepto] = @ID_Concepto;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarEncargado]    Script Date: 15/8/2024 09:10:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_ModificarEncargado]
    @ID INT,
    @Nombre NVARCHAR(50),
    @ApellidoP NVARCHAR(50),
    @ApellidoS NVARCHAR(50),
    @Nacionalidad NVARCHAR(50),
    @Fecha_Nacimiento DATE,
    @Provincia NVARCHAR(50),
    @Canton NVARCHAR(50),
    @Distrito NVARCHAR(50),
    @Barrio NVARCHAR(50),
    @Direccion_Ubicacion NVARCHAR(100),
    @Telefono NVARCHAR(20),
    @Correo_Electronico NVARCHAR(100),
    @Estado NVARCHAR(20),
    @ID_Sucursal INT,
    @Fecha_Ingreso DATE
AS
BEGIN
    -- Validar que la fecha de nacimiento asegure que el empleado tenga al menos 16 años
    IF DATEDIFF(YEAR, @Fecha_Nacimiento, GETDATE()) < 16
    BEGIN
        THROW 50000, 'El empleado debe tener 16 años o más.', 1;
        RETURN;
    END

    SET NOCOUNT ON;

    UPDATE Empleado
    SET Nombre = @Nombre,
        ApellidoP = @ApellidoP,
        ApellidoS = @ApellidoS,
        Nacionalidad = @Nacionalidad,
        Fecha_Nacimiento = @Fecha_Nacimiento,
        Provincia = @Provincia,
        Canton = @Canton,
        Distrito = @Distrito,
        Barrio = @Barrio,
        Direccion_Ubicacion = @Direccion_Ubicacion,
        Telefono = @Telefono,
        Correo_Electronico = @Correo_Electronico,
        Estado = @Estado,
        ID_Sucursal = @ID_Sucursal,
        Fecha_Ingreso = @Fecha_Ingreso
    WHERE ID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerEmpleadoPorID]    Script Date: 15/8/2024 09:10:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ObtenerEmpleadoPorID]
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Nombre, ApellidoP, ApellidoS, Nacionalidad, Fecha_Nacimiento,
           Provincia, Canton, Distrito, Barrio, Direccion_Ubicacion,
           Telefono, Correo_Electronico, RowVersion
    FROM Empleado
    WHERE ID = @ID;
END

GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerMensajesContacto]    Script Date: 15/8/2024 09:10:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ObtenerMensajesContacto]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT ID_Sucursal, Nombre, Correo_Electronico, Mensaje
    FROM Contacto;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ValidarIngresoActivo]    Script Date: 15/8/2024 09:10:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ValidarIngresoActivo]
    @Nombre_Usuario NVARCHAR(50),
    @Contrasena NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @estado NVARCHAR(10);
    DECLARE @tipo_usuario NVARCHAR(20);

    SELECT @estado = Estado, @tipo_usuario = Tipo_Usuario
    FROM Usuario
    WHERE Nombre_Usuario = @Nombre_Usuario AND Contrasena = @Contrasena;

    IF @estado <> 'Activo'
    BEGIN
        RAISERROR ('Usuario no se encuentra activo. Por favor contacte al administrador.', 16, 1);
        RETURN;
    END

    SELECT @tipo_usuario AS Tipo_Usuario, @estado AS Estado;
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_ValidarRangoSalario]    Script Date: 15/8/2024 09:10:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_ValidarRangoSalario]
    @ID_Empleado INT,
    @Horas_Trabajadas DECIMAL(10, 2),
    @Mes NVARCHAR(50),
    @Estado NVARCHAR(50)
AS
BEGIN
    BEGIN TRY
        IF @Horas_Trabajadas < 0 OR @Horas_Trabajadas > 160
        BEGIN
            RAISERROR('Las horas trabajadas deben estar en el rango de 0 a 160 horas mensuales.', 16, 1);
            RETURN;
        END
        
        UPDATE Empleado
        SET Mes = @Mes, 
            Estado_Proceso = @Estado
        WHERE ID = @ID_Empleado;
        
    END TRY
    BEGIN CATCH
        PRINT 'Error en usp_ValidarRangoSalario: ' + ERROR_MESSAGE();
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ValidarTotalHoras]    Script Date: 15/8/2024 09:10:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ValidarTotalHoras]
    @ID_Empleado INT,
    @HorasTrabajadas DECIMAL(10, 2),
    @HorasExtras DECIMAL(10, 2),
    @HorasExtrasDobles DECIMAL(10, 2)
AS
BEGIN
    BEGIN TRY
        DECLARE @TotalHoras DECIMAL(10, 2);
    
        SET @TotalHoras = @HorasTrabajadas + @HorasExtras + @HorasExtrasDobles;

        IF @TotalHoras > 260
        BEGIN
            RAISERROR('El total de horas no puede exceder 260 horas mensuales.', 16, 1);
            RETURN;
        END
    END TRY
    BEGIN CATCH
        PRINT 'Error en usp_ValidarTotalHoras: ' + ERROR_MESSAGE();
    END CATCH
END
GO
/****** Object:  Trigger [dbo].[trg_InsertarConcepto]    Script Date: 15/8/2024 09:10:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_InsertarConcepto]
ON [dbo].[Concepto]
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @NombreConcepto VARCHAR(100);
    
    SELECT @NombreConcepto = Nombre
    FROM INSERTED;

    IF NOT EXISTS (SELECT 1 FROM Concepto WHERE Nombre = @NombreConcepto)
    BEGIN
        INSERT INTO Concepto (Nombre, Tipo, Forma_Calculo)
        SELECT Nombre, Tipo, Forma_Calculo
        FROM INSERTED;
    END
    ELSE
    BEGIN
        RAISERROR('El concepto ya existe.', 16, 1);
    END
END;
GO
ALTER TABLE [dbo].[Concepto] ENABLE TRIGGER [trg_InsertarConcepto]
GO
USE [master]
GO
ALTER DATABASE [Sistema_Planilla] SET  READ_WRITE 
GO
