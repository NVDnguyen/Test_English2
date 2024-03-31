USE [master]
GO
/****** Object:  Database [Test_English_DB4]    Script Date: 3/22/2024 1:18:48 PM ******/
CREATE DATABASE [Test_English_DB4]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Test_English_DB4', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Test_English_DB4.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Test_English_DB4_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Test_English_DB4_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Test_English_DB4] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Test_English_DB4].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Test_English_DB4] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Test_English_DB4] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Test_English_DB4] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Test_English_DB4] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Test_English_DB4] SET ARITHABORT OFF 
GO
ALTER DATABASE [Test_English_DB4] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Test_English_DB4] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Test_English_DB4] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Test_English_DB4] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Test_English_DB4] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Test_English_DB4] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Test_English_DB4] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Test_English_DB4] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Test_English_DB4] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Test_English_DB4] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Test_English_DB4] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Test_English_DB4] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Test_English_DB4] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Test_English_DB4] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Test_English_DB4] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Test_English_DB4] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Test_English_DB4] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Test_English_DB4] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Test_English_DB4] SET  MULTI_USER 
GO
ALTER DATABASE [Test_English_DB4] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Test_English_DB4] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Test_English_DB4] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Test_English_DB4] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Test_English_DB4] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Test_English_DB4] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Test_English_DB4] SET QUERY_STORE = ON
GO
ALTER DATABASE [Test_English_DB4] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Test_English_DB4]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/22/2024 1:18:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[userName] [varchar](50) NOT NULL,
	[password] [varchar](50) NULL,
	[isAdmin] [bit] NULL,
	[band] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lessons]    Script Date: 3/22/2024 1:18:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lessons](
	[idLesson] [int] IDENTITY(1,1) NOT NULL,
	[descriptionL] [nvarchar](max) NULL,
	[idTopic] [varchar](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[idLesson] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 3/22/2024 1:18:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[idQ] [int] IDENTITY(1,1) NOT NULL,
	[descriptionQ] [nvarchar](max) NULL,
	[answer1] [nvarchar](max) NULL,
	[answer2] [nvarchar](max) NULL,
	[answer3] [nvarchar](max) NULL,
	[answer4] [nvarchar](max) NULL,
	[CorrectAnswer] [nvarchar](max) NULL,
	[idTest] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reporter]    Script Date: 3/22/2024 1:18:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reporter](
	[idReporter] [int] IDENTITY(1,1) NOT NULL,
	[userName] [varchar](50) NULL,
	[idTest] [int] NULL,
	[Grade] [int] NULL,
	[idRoom] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idReporter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 3/22/2024 1:18:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[idRoom] [int] IDENTITY(1,1) NOT NULL,
	[codeRoom] [varchar](50) NULL,
	[creater] [varchar](50) NULL,
	[idTest] [int] NULL,
	[active] [bit] NULL,
	[nameRoom] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idRoom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test]    Script Date: 3/22/2024 1:18:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test](
	[idTest] [int] IDENTITY(1,1) NOT NULL,
	[descriptionTs] [nvarchar](100) NULL,
	[idLesson] [int] NULL,
	[Time] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idTest] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topic]    Script Date: 3/22/2024 1:18:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic](
	[idTopic] [varchar](3) NOT NULL,
	[nameTopic] [nvarchar](50) NULL,
	[descriptionTp] [nvarchar](max) NULL,
	[imgTopic] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[idTopic] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((0)) FOR [band]
GO
ALTER TABLE [dbo].[Lessons]  WITH CHECK ADD FOREIGN KEY([idTopic])
REFERENCES [dbo].[Topic] ([idTopic])
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD FOREIGN KEY([idTest])
REFERENCES [dbo].[Test] ([idTest])
GO
ALTER TABLE [dbo].[Reporter]  WITH CHECK ADD FOREIGN KEY([idRoom])
REFERENCES [dbo].[Rooms] ([idRoom])
GO
ALTER TABLE [dbo].[Reporter]  WITH CHECK ADD FOREIGN KEY([idTest])
REFERENCES [dbo].[Test] ([idTest])
GO
ALTER TABLE [dbo].[Reporter]  WITH CHECK ADD FOREIGN KEY([userName])
REFERENCES [dbo].[Account] ([userName])
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD FOREIGN KEY([creater])
REFERENCES [dbo].[Account] ([userName])
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD FOREIGN KEY([idTest])
REFERENCES [dbo].[Test] ([idTest])
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD FOREIGN KEY([idLesson])
REFERENCES [dbo].[Lessons] ([idLesson])
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [CK__Account__passwor__gt3] CHECK  ((len([password])>(3)))
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [CK__Account__passwor__gt3]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [CK__Account__userNam__gt3] CHECK  ((len([userName])>(3)))
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [CK__Account__userNam__gt3]
GO
ALTER TABLE [dbo].[Topic]  WITH CHECK ADD CHECK  ((len([nameTopic])>(0)))
GO
USE [master]
GO
ALTER DATABASE [Test_English_DB4] SET  READ_WRITE 
GO
