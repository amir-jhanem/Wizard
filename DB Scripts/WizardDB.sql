USE [master]
GO
/****** Object:  Database [Wizard]    Script Date: 23-Aug-20 1:43:51 AM ******/
CREATE DATABASE [Wizard]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Wizard', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Wizard.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Wizard_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Wizard_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Wizard] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Wizard].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Wizard] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Wizard] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Wizard] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Wizard] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Wizard] SET ARITHABORT OFF 
GO
ALTER DATABASE [Wizard] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Wizard] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Wizard] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Wizard] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Wizard] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Wizard] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Wizard] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Wizard] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Wizard] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Wizard] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Wizard] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Wizard] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Wizard] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Wizard] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Wizard] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Wizard] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Wizard] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Wizard] SET RECOVERY FULL 
GO
ALTER DATABASE [Wizard] SET  MULTI_USER 
GO
ALTER DATABASE [Wizard] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Wizard] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Wizard] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Wizard] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Wizard] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Wizard', N'ON'
GO
ALTER DATABASE [Wizard] SET QUERY_STORE = OFF
GO
USE [Wizard]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 23-Aug-20 1:43:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[StepId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Step]    Script Date: 23-Aug-20 1:43:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Step](
	[Id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Step] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Item] ([Id], [Title], [Description], [StepId]) VALUES (N'8535f8f0-6442-4d73-8c15-4b035e234f3a', N'KSA', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', N'f913deb3-d3ef-4637-a19c-7da56c4377d4')
INSERT [dbo].[Item] ([Id], [Title], [Description], [StepId]) VALUES (N'832e410b-b403-466c-ad2f-522ec04f7183', N'Javascript', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', N'0fedfe7e-e471-4d41-b8f3-26c61e0d87b0')
INSERT [dbo].[Item] ([Id], [Title], [Description], [StepId]) VALUES (N'1286722c-bb81-4e89-92ea-8024a2586132', N'Egypt', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', N'f913deb3-d3ef-4637-a19c-7da56c4377d4')
INSERT [dbo].[Item] ([Id], [Title], [Description], [StepId]) VALUES (N'7c6bc891-c707-48c2-a39f-f0b1ee625a9a', N'C#', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', N'0fedfe7e-e471-4d41-b8f3-26c61e0d87b0')
INSERT [dbo].[Item] ([Id], [Title], [Description], [StepId]) VALUES (N'dc2794d3-1787-4fb6-a7a6-fdf74a5c8cfc', N'Red', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', N'39ec7ccc-bc56-4cfb-a93e-cdb8552804fe')
GO
INSERT [dbo].[Step] ([Id]) VALUES (N'0fedfe7e-e471-4d41-b8f3-26c61e0d87b0')
INSERT [dbo].[Step] ([Id]) VALUES (N'f913deb3-d3ef-4637-a19c-7da56c4377d4')
INSERT [dbo].[Step] ([Id]) VALUES (N'39ec7ccc-bc56-4cfb-a93e-cdb8552804fe')
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Step] FOREIGN KEY([StepId])
REFERENCES [dbo].[Step] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Step]
GO
USE [master]
GO
ALTER DATABASE [Wizard] SET  READ_WRITE 
GO
