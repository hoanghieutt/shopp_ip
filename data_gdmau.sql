USE [master]
GO
/****** Object:  Database [J5Shop]    Script Date: 6/9/2023 01:02:54 ******/
CREATE DATABASE [J5Shop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'J5Shop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\J5Shop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'J5Shop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\J5Shop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [J5Shop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [J5Shop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [J5Shop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [J5Shop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [J5Shop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [J5Shop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [J5Shop] SET ARITHABORT OFF 
GO
ALTER DATABASE [J5Shop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [J5Shop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [J5Shop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [J5Shop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [J5Shop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [J5Shop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [J5Shop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [J5Shop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [J5Shop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [J5Shop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [J5Shop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [J5Shop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [J5Shop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [J5Shop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [J5Shop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [J5Shop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [J5Shop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [J5Shop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [J5Shop] SET  MULTI_USER 
GO
ALTER DATABASE [J5Shop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [J5Shop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [J5Shop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [J5Shop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [J5Shop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [J5Shop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [J5Shop] SET QUERY_STORE = OFF
GO
USE [J5Shop]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 6/9/2023 01:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Photo] [nvarchar](50) NULL,
	[Activated] [bit] NULL,
	[Admin] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/9/2023 01:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OderDetails]    Script Date: 6/9/2023 01:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OderDetails](
	[Id] [uniqueidentifier] NOT NULL,
	[OrderId] [uniqueidentifier] NOT NULL,
	[ProductId] [uniqueidentifier] NOT NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/9/2023 01:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[Address] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/9/2023 01:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Image] [nvarchar](50) NULL,
	[Price] [float] NULL,
	[CreateDate] [date] NULL,
	[Available] [bit] NULL,
	[CategoryId] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([UserName], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'admin', N'admin123', N'tran the quan', N'tranthequan22051997@gmail.com', N'sdfsdfsdfsdfsd.jpg', 0, 0)
INSERT [dbo].[Accounts] ([UserName], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'quan11', N'123', N'quan tran', N'tranthequan22051997@gmail.com', N'2.jpg', 1, 0)
INSERT [dbo].[Accounts] ([UserName], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'quan22', N'123', N'quan tran', N'tranthequan22051997@gmail.com', N'mmnzfnzcn.jpg', 0, 0)
INSERT [dbo].[Accounts] ([UserName], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'van22', N'123', N'van le thao', N'vanle@sadas', N'sfsdsd.jpg', 0, 0)
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'fe928e6e-2095-42dd-95d4-47c9536a2ae8', N'loavitinhpromax')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'0fe6e844-5148-43fd-8916-55e2623f5121', N'Iphone')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'23531ef4-7f72-466a-982f-76724d2751fb', N'otopro')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'e1bc7072-ee05-4e54-bdd3-8613c61cb665', N'macbooksieuvip')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'8e81c49b-d853-42f0-825a-9fff51bea869', N'Galaxy')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'332e6909-5505-4b6e-803f-d4dd01905895', N'Ipad')
GO
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (N'e39c3fdd-eb45-4991-8468-0b9a34021969', N'iphone14', N'tamdao.jpg', 9000000, CAST(N'2023-06-08' AS Date), NULL, N'0fe6e844-5148-43fd-8916-55e2623f5121')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (N'7df820a0-97a9-4f50-b560-1cbdd688072d', N'iphone15promax', N'5.jpg', 50000000, CAST(N'2023-06-08' AS Date), NULL, N'0fe6e844-5148-43fd-8916-55e2623f5121')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (N'c3134047-3f91-41a2-b69c-34f3983384a4', N'iphone20', N'3105135.jpg', 2323, CAST(N'2023-06-09' AS Date), NULL, N'0fe6e844-5148-43fd-8916-55e2623f5121')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (N'c6e4fe0b-5ac5-4387-852b-49854940c2fd', N'galaxyS3', N'tamdao.jpg', 7000000, CAST(N'2023-06-08' AS Date), NULL, N'8e81c49b-d853-42f0-825a-9fff51bea869')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (N'4bcf33b2-896f-4e69-863e-5c94509c2ddc', N'iphone11', N'iphone-11.jpg', 1000000, CAST(N'2023-05-25' AS Date), 1, N'0fe6e844-5148-43fd-8916-55e2623f5121')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (N'96abb5a9-4770-4ac3-90b0-6002e241ba2a', N'iphone12', N'iphone-12.jpg', 6000000, CAST(N'2022-06-29' AS Date), 1, N'0fe6e844-5148-43fd-8916-55e2623f5121')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (N'e158a029-1c0f-4efd-9054-6a090ac2a223', N'galaxys4', N'S4.webp', 8000000, CAST(N'2020-09-21' AS Date), 1, N'8e81c49b-d853-42f0-825a-9fff51bea869')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (N'04498a72-16cb-4307-a164-8144d3bf32e6', N'iphon17', N'v.jpg', 10000000, CAST(N'2023-06-08' AS Date), NULL, N'0fe6e844-5148-43fd-8916-55e2623f5121')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (N'93b18302-1be6-43f8-b416-c885619a6d4b', N'iphone16promaxgold', N'Hinh-nen-may-tinh-hoat-hinh-cute.jpg', 90000000, CAST(N'2023-06-08' AS Date), NULL, N'0fe6e844-5148-43fd-8916-55e2623f5121')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (N'70c746e2-569d-46c9-aaca-ff7ec0680bc1', N'iphone13', N'iphone-13.webp', 10000000, CAST(N'2020-09-21' AS Date), 1, N'0fe6e844-5148-43fd-8916-55e2623f5121')
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[OderDetails] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[OderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OderDetails] CHECK CONSTRAINT [FK_OderDetails_Orders]
GO
ALTER TABLE [dbo].[OderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OderDetails] CHECK CONSTRAINT [FK_OderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Accounts] FOREIGN KEY([UserName])
REFERENCES [dbo].[Accounts] ([UserName])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Accounts]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Category]
GO
USE [master]
GO
ALTER DATABASE [J5Shop] SET  READ_WRITE 
GO
