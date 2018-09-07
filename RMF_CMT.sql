USE [master]
GO
/****** Object:  Database [RMF_CMT]    Script Date: 9/7/2018 10:06:09 AM ******/
CREATE DATABASE [RMF_CMT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RMF_CMT', FILENAME = N'G:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\RMF_CMT.mdf' , SIZE = 6144KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RMF_CMT_log', FILENAME = N'G:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\RMF_CMT_log.ldf' , SIZE = 84416KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [RMF_CMT] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RMF_CMT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RMF_CMT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RMF_CMT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RMF_CMT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RMF_CMT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RMF_CMT] SET ARITHABORT OFF 
GO
ALTER DATABASE [RMF_CMT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RMF_CMT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RMF_CMT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RMF_CMT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RMF_CMT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RMF_CMT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RMF_CMT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RMF_CMT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RMF_CMT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RMF_CMT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RMF_CMT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RMF_CMT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RMF_CMT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RMF_CMT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RMF_CMT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RMF_CMT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RMF_CMT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RMF_CMT] SET RECOVERY FULL 
GO
ALTER DATABASE [RMF_CMT] SET  MULTI_USER 
GO
ALTER DATABASE [RMF_CMT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RMF_CMT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RMF_CMT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RMF_CMT] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [RMF_CMT]
GO
/****** Object:  Table [dbo].[Audit_Trail]    Script Date: 9/7/2018 10:06:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Audit_Trail](
	[Id] [bigint] NOT NULL,
	[TableName] [varchar](35) NULL,
	[TableId] [bigint] NULL,
	[Action] [varchar](25) NULL,
	[ComputerName] [nvarchar](150) NULL,
	[Contributer] [bigint] NULL,
	[DateExecuted] [date] NULL,
	[TimeExecuted] [time](7) NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [PK_Audit_Trail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dummytable]    Script Date: 9/7/2018 10:06:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dummytable](
	[APIName] [varchar](100) NULL,
	[Date] [date] NULL,
	[Type] [nchar](15) NULL,
	[Amount] [decimal](10, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masterfile_AccessRights]    Script Date: 9/7/2018 10:06:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masterfile_AccessRights](
	[Id] [bigint] NOT NULL,
	[RoleId] [int] NOT NULL,
	[SystemRightsId] [int] NOT NULL,
	[IsChecked] [tinyint] NULL,
 CONSTRAINT [PK_Masterfile_AccessRights] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masterfile_Area]    Script Date: 9/7/2018 10:06:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masterfile_Area](
	[Id] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[DistrictId] [int] NOT NULL,
	[Remarks] [varchar](150) NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Masterfile_Area] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masterfile_Branch]    Script Date: 9/7/2018 10:06:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masterfile_Branch](
	[Id] [int] NOT NULL,
	[BranchCode] [varchar](50) NULL,
	[Name] [varchar](100) NULL,
	[AreaId] [int] NULL,
	[Address] [varchar](150) NOT NULL,
	[Latitude] [decimal](8, 6) NULL,
	[Longitude] [decimal](9, 6) NULL,
	[Remarks] [varchar](150) NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Masterfile_Branch] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masterfile_Category]    Script Date: 9/7/2018 10:06:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masterfile_Category](
	[Id] [int] NOT NULL,
	[Description] [varchar](100) NULL,
	[Type] [varchar](10) NULL,
	[Remarks] [varchar](150) NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_Masterfile_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masterfile_Channel]    Script Date: 9/7/2018 10:06:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masterfile_Channel](
	[Id] [int] NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[ChartOfAccountId] [int] NULL,
	[BranchId] [int] NULL,
	[Remarks] [varchar](150) NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Masterfile_Channel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masterfile_ChartOfAccount]    Script Date: 9/7/2018 10:06:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masterfile_ChartOfAccount](
	[Id] [int] NOT NULL,
	[Code] [varchar](30) NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[Remarks] [varchar](150) NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Masterfile_ChartOfAccount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masterfile_District]    Script Date: 9/7/2018 10:06:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masterfile_District](
	[Id] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[RegionId] [int] NOT NULL,
	[Remarks] [varchar](150) NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Masterfile_District] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masterfile_Employee]    Script Date: 9/7/2018 10:06:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masterfile_Employee](
	[Id] [bigint] NOT NULL,
	[EmployeeIdNo] [varchar](10) NOT NULL,
	[Firstname] [varchar](50) NOT NULL,
	[Middlename] [varchar](50) NULL,
	[LastName] [varchar](50) NOT NULL,
	[EmailAddress] [varchar](150) NULL,
	[GmailId] [varchar](100) NULL,
	[ContactNumber] [varchar](15) NULL,
	[BranchId] [int] NOT NULL,
	[Remarks] [varchar](150) NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Masterfile_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masterfile_OtherDisbursementDetail]    Script Date: 9/7/2018 10:06:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masterfile_OtherDisbursementDetail](
	[Id] [int] NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[BranchId] [int] NOT NULL,
	[SetUpAmount] [decimal](10, 2) NOT NULL,
	[Day] [int] NULL,
	[ChannelId] [int] NOT NULL,
	[ChartOfAccountId] [int] NOT NULL,
	[Remarks] [varchar](150) NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Masterfile_OtherDisbursementDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masterfile_OtherReceiptDetail]    Script Date: 9/7/2018 10:06:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masterfile_OtherReceiptDetail](
	[Id] [int] NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[BranchId] [int] NOT NULL,
	[SetUpAmount] [decimal](10, 2) NOT NULL,
	[Day] [int] NULL,
	[ChannelId] [int] NOT NULL,
	[ChartOfAccountId] [int] NOT NULL,
	[Remarks] [varchar](150) NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Masterfile_OtherReceiptDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masterfile_Region]    Script Date: 9/7/2018 10:06:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masterfile_Region](
	[Id] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Remarks] [varchar](150) NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Masterfile_Region] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masterfile_Role]    Script Date: 9/7/2018 10:06:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masterfile_Role](
	[Id] [int] NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[Remarks] [varchar](150) NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Masterfile_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masterfile_SystemRights]    Script Date: 9/7/2018 10:06:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masterfile_SystemRights](
	[Id] [int] NOT NULL,
	[Module] [varchar](50) NOT NULL,
	[Page] [varchar](100) NOT NULL,
	[PageSeqNo] [int] NOT NULL,
	[Rights] [varchar](50) NOT NULL,
	[RightsSeqNo] [int] NOT NULL,
 CONSTRAINT [PK_Masterfile_SystemRights] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masterfile_User]    Script Date: 9/7/2018 10:06:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masterfile_User](
	[Id] [int] NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[EmployeeId] [bigint] NOT NULL,
	[RoleId] [int] NOT NULL,
	[Remarks] [varchar](150) NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Masterfile_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction_BudgetPeriod]    Script Date: 9/7/2018 10:06:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_BudgetPeriod](
	[Id] [bigint] NOT NULL,
	[Month] [varchar](10) NOT NULL,
	[Year] [int] NOT NULL,
	[PeriodStatus] [varchar](10) NOT NULL,
	[DateOpen] [date] NULL,
	[DateClosed] [date] NULL,
	[TotalInflowBudget] [decimal](10, 2) NULL,
	[TotalInflowActual] [decimal](10, 2) NULL,
	[TotalInflowVariance] [decimal](10, 2) NULL,
	[TotalOutflowBudget] [decimal](10, 2) NULL,
	[TotalOutflowActual] [decimal](10, 2) NULL,
	[TotalOutflowVariance] [decimal](10, 2) NULL,
	[OpenBy] [int] NULL,
	[ClosedBy] [int] NULL,
	[OpenRemarks] [varchar](150) NULL,
	[ClosedRemarks] [varchar](150) NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Transaction_BudgetPeriod] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction_BudgetPreparation]    Script Date: 9/7/2018 10:06:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_BudgetPreparation](
	[Id] [bigint] NOT NULL,
	[BudgetPeriodId] [bigint] NOT NULL,
	[BranchId] [int] NOT NULL,
	[TotalInflowBudget] [decimal](10, 2) NULL,
	[TotalInflowActual] [decimal](10, 2) NULL,
	[TotalInflowVariance] [decimal](10, 2) NULL,
	[TotalOutflowBudget] [decimal](10, 2) NULL,
	[TotalOutflowActual] [decimal](10, 2) NULL,
	[TotalOutflowVariance] [decimal](10, 2) NULL,
	[PreparedBy] [int] NOT NULL,
	[Remarks] [varchar](150) NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Transaction_BudgetPreparation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction_BudgetPreparationDetail]    Script Date: 9/7/2018 10:06:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_BudgetPreparationDetail](
	[DetailId] [bigint] NOT NULL,
	[BudgetPreparationId] [bigint] NOT NULL,
	[Type] [int] NULL,
	[CategoryId] [int] NOT NULL,
	[CategoryDescription] [varchar](100) NULL,
	[TSEmployeeId] [int] NOT NULL,
	[Detail] [varchar](150) NULL,
	[Reference] [varchar](50) NULL,
	[Qty] [int] NULL,
	[Amount] [decimal](10, 2) NULL,
	[WeekNo] [int] NULL,
	[ChannelId] [int] NOT NULL,
	[Week1] [decimal](10, 2) NULL,
	[Week2] [decimal](10, 2) NULL,
	[Week3] [decimal](10, 2) NULL,
	[Week4] [decimal](10, 2) NULL,
	[Week5] [decimal](10, 2) NULL,
	[Week6] [decimal](10, 2) NULL,
	[Total] [decimal](10, 2) NULL,
	[Remarks] [varchar](150) NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Transaction_BudgetPreparationDetail] PRIMARY KEY CLUSTERED 
(
	[DetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction_DailyCashFlow]    Script Date: 9/7/2018 10:06:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_DailyCashFlow](
	[Id] [bigint] NOT NULL,
	[Date] [date] NOT NULL,
	[DetailId] [bigint] NOT NULL,
	[Amount] [decimal](10, 2) NULL,
 CONSTRAINT [PK_Transaction_DailyCashFlow] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vgetAll_Other_Master]    Script Date: 9/7/2018 10:06:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vgetAll_Other_Master]  -- A table name of "items" is pretty bad in my opinion
AS
			SELECT [Id]
				  ,[Description]
				  ,[CategoryId]
				  ,[BranchId]
				  ,[SetUpAmount]
				  ,[ChartOfAccountId]
				  ,[Remarks]
				  ,[ChannelId]
				  ,[Day]
				  ,'OtherReceipt' AS 'TableName'
			  FROM [RMF_CMT].[dbo].[Masterfile_OtherReceiptDetail] 


			  UNION
			  SELECT [Id]
				  ,[Description]
				  ,[CategoryId]
				  ,[BranchId]
				  ,[SetUpAmount]
				  ,[ChartOfAccountId]
				  ,[Remarks]
				  ,[ChannelId]
				  ,[Day]
				  ,'OtherDisbursement' AS 'TableName'
					FROM [RMF_CMT].[dbo].[Masterfile_OtherDisbursementDetail] 
GO
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (1, N'Masterfile_Area', 1, N'Update', N'RMF-Intern1', 1, CAST(N'2018-08-08' AS Date), CAST(N'11:35:00' AS Time), N'Kamote')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (2, N'Masterfile_Branch', 1, N'Insert', N'RMF-Intern1', 1, CAST(N'2018-08-08' AS Date), CAST(N'11:35:00' AS Time), N'Kamote')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (3, N'Masterfile_Area', 1, N'Update', N'Pasyo', 1, CAST(N'2018-08-08' AS Date), CAST(N'11:36:00' AS Time), N'Kamote')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (4, N'sad', 1, N'sad', N'sad', 1, CAST(N'2018-08-09' AS Date), CAST(N'15:14:00' AS Time), N'1/1/0001 12:00:00 AM')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (5, N'sad', 1, N'sad', N'sad', 1, CAST(N'2018-08-09' AS Date), CAST(N'15:14:00' AS Time), N'1/1/0001 12:00:00 AM')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (6, N'', 19, N'U', N'jplarisan', 2, CAST(N'2018-08-09' AS Date), CAST(N'16:42:00' AS Time), N'sad')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (7, N'', 19, N'U', N'jplarisan', 2, CAST(N'2018-08-09' AS Date), CAST(N'16:42:00' AS Time), N'sad')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (8, N'', 19, N'U', N'jplarisan', 2, CAST(N'2018-08-09' AS Date), CAST(N'16:42:00' AS Time), N'sad')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (9, N'', 19, N'U', N'jplarisan', 2, CAST(N'2018-08-09' AS Date), CAST(N'17:03:00' AS Time), N'sad')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (10, N'', 22, N'U', N'jplarisan', 2, CAST(N'2018-08-09' AS Date), CAST(N'17:04:00' AS Time), N'sad')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (11, N'', 10, N'U', N'jplarisan', 2, CAST(N'2018-08-09' AS Date), CAST(N'17:06:00' AS Time), N'sad')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (12, N'sadsad', 1, N'u', N'jplasd', 1, CAST(N'2018-08-09' AS Date), CAST(N'17:07:00' AS Time), N'sad')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (13, N'Masterfile_Region', 1, N'U', N'jplarisan', 2, CAST(N'2018-08-10' AS Date), CAST(N'13:21:00' AS Time), N'sad')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (14, N'Masterfile_Region', 1, N'U', N'jplarisan', 2, CAST(N'2018-08-10' AS Date), CAST(N'13:30:00' AS Time), N'sad')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (15, N'Masterfile_Region', 1, N'U', N'jplarisan', 2, CAST(N'2018-08-10' AS Date), CAST(N'13:42:00' AS Time), N'sad')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (16, N'Masterfile_Region', 1, N'U', N'jplarisan', 2, CAST(N'2018-08-10' AS Date), CAST(N'13:42:00' AS Time), N'sad')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (17, N'Masterfile_Region', 1, N'Updated', N'jplarisan', 2, CAST(N'2018-08-10' AS Date), CAST(N'13:44:00' AS Time), N'sad')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (18, N'Masterfile_Region', 1, N'Updated', N'jplarisan', 2, CAST(N'2018-08-10' AS Date), CAST(N'13:47:00' AS Time), N'Updated:Camotes,ss')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (19, N'Masterfile_Region', 0, N'Deleted', N'jplarisan', 2, CAST(N'2018-08-10' AS Date), CAST(N'13:51:00' AS Time), N'Deleted :')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (20, N'Masterfile_Region', 0, N'Deleted', N'jplarisan', 2, CAST(N'2018-08-10' AS Date), CAST(N'13:54:00' AS Time), N'Deleted :')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (21, N'Masterfile_Region', 0, N'Deleted', N'jplarisan', 2, CAST(N'2018-08-10' AS Date), CAST(N'13:54:00' AS Time), N'Deleted :')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (22, N'Masterfile_Region', 0, N'Deleted', N'jplarisan', 2, CAST(N'2018-08-10' AS Date), CAST(N'13:55:00' AS Time), N'Deleted :')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (23, N'Masterfile_Region', 1, N'Deleted', N'jplarisan', 2, CAST(N'2018-08-10' AS Date), CAST(N'14:02:00' AS Time), N'Deleted :')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (24, N'Masterfile_Region', 1, N'Deleted', N'jplarisan', 2, CAST(N'2018-08-10' AS Date), CAST(N'14:05:00' AS Time), N'Deleted : 1')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (25, N'Masterfile_Region', 0, N'Added', N'jplarisan', 2, CAST(N'2018-08-10' AS Date), CAST(N'14:13:00' AS Time), N'Inserted: Region 10,asd')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (26, N'Masterfile_Region', 0, N'Added', N'jplarisan', 2, CAST(N'2018-08-10' AS Date), CAST(N'14:14:00' AS Time), N'Inserted: Region%,asd')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (27, N'Masterfile_Region', 25, N'Deleted', N'jplarisan', 2, CAST(N'2018-08-10' AS Date), CAST(N'14:18:00' AS Time), N'Deleted : ')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (28, N'Masterfile_Channel', 1, N'Inserted', N'jplarisan', 1, CAST(N'2018-08-13' AS Date), CAST(N'11:34:00' AS Time), N'Inserted: Squishu,Bijjli')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (29, N'Masterfile_Channel', 1, N'Inserted', N'jplarisan', 1, CAST(N'2018-08-13' AS Date), CAST(N'11:34:00' AS Time), N'Inserted: Artwork,asd')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (30, N'Masterfile_Channel', 1, N'Inserted', N'jplarisan', 1, CAST(N'2018-08-13' AS Date), CAST(N'11:41:00' AS Time), N'Inserted: Squishus,Bijjli')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (31, N'Masterfile_Channel', 1, N'Inserted', N'jplarisan', 1, CAST(N'2018-08-13' AS Date), CAST(N'11:43:00' AS Time), N'Inserted: Squishuss,Bijjli')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (32, N'Masterfile_Channel', 1, N'Inserted', N'jplarisan', 1, CAST(N'2018-08-13' AS Date), CAST(N'11:46:00' AS Time), N'Inserted: Squishusss,Bijjli')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (33, N'Masterfile_Channel', 1, N'Inserted', N'jplarisan', 1, CAST(N'2018-08-13' AS Date), CAST(N'11:48:00' AS Time), N'Inserted: Squishussss,Bijjli')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (34, N'Masterfile_Channel', 13, N'Inserted', N'jplarisan', 1, CAST(N'2018-08-13' AS Date), CAST(N'12:14:00' AS Time), N'Inserted: Squishuz,Bijjli')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (35, N'Masterfile_Channel', 14, N'Inserted', N'jplarisan', 1, CAST(N'2018-08-13' AS Date), CAST(N'12:14:00' AS Time), N'Inserted: Squishuzz,Bijjli')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (36, N'Masterfile_AccessRights', 1, N'Inserted', N'jplarisan', 2, CAST(N'2018-08-13' AS Date), CAST(N'15:44:00' AS Time), N'Inserted: 3,1')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (37, N'Masterfile_AccessRights', 1, N'Inserted', N'jplarisan', 2, CAST(N'2018-08-13' AS Date), CAST(N'15:48:00' AS Time), N'Inserted: 3,2')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (38, N'Masterfile_AccessRights', 1, N'Inserted', N'jplarisan', 2, CAST(N'2018-08-13' AS Date), CAST(N'15:59:00' AS Time), N'Inserted: 3,3')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (39, N'Masterfile_AccessRights', 139, N'Inserted', N'jplarisan', 2, CAST(N'2018-08-13' AS Date), CAST(N'16:29:00' AS Time), N'Inserted: 3,4')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (40, N'Masterfile_Channel', 16, N'Inserted', N'ya', 1, CAST(N'2018-08-13' AS Date), CAST(N'17:06:00' AS Time), N'Inserted: SuperTwins,as')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (41, N'Masterfile_Region', 22, N'Updated', N'jplarisan', 2, CAST(N'2018-08-13' AS Date), CAST(N'17:50:00' AS Time), N'Updated: Gwapo,nice')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (42, N'Masterfile_Channel', 19, N'Inserted', N'jplarisan', 1, CAST(N'2018-08-14' AS Date), CAST(N'08:56:00' AS Time), N'Inserted: SuperPowers,Power')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (43, N'Masterfile_Area', 1, N'Update', N'PATO', 1, CAST(N'2018-08-14' AS Date), CAST(N'09:43:00' AS Time), N'Kamote')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (44, N'Masterfile_Area', 1, N'Update', N'PATO', 1, CAST(N'2018-08-14' AS Date), CAST(N'09:43:00' AS Time), N'Kamote')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (45, N'Masterfile_Channel', 22, N'Inserted', N'RMF-IT', 1, CAST(N'2018-08-14' AS Date), CAST(N'10:00:00' AS Time), N'Inserted: SuperDsuperPowerss,Power')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (46, N'Masterfile_Channel', 9, N'Inserted', N'FABAYON', 2, CAST(N'2018-08-15' AS Date), CAST(N'10:21:00' AS Time), N'Inserted: Gma7,kamoteq')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (47, N'Masterfile_Channel', 10, N'Inserted', N'FABAYON', 2, CAST(N'2018-08-15' AS Date), CAST(N'10:21:00' AS Time), N'Inserted: Gma74,kamoteq')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (48, N'Masterfile_Channel', 13, N'Inserted', N'FABAYON', 1, CAST(N'2018-08-15' AS Date), CAST(N'10:27:00' AS Time), N'Inserted: Gma743,kamoteq')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (49, N'Masterfile_Channel', 14, N'Inserted', N'FABAYON', 1, CAST(N'2018-08-15' AS Date), CAST(N'10:34:00' AS Time), N'Inserted: Gma74333,kamoteq')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (50, N'Masterfile_Channel', 15, N'Inserted', N'FABAYON', 1, CAST(N'2018-08-15' AS Date), CAST(N'10:37:00' AS Time), N'Inserted: chanenen,')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (51, N'Masterfile_Channel', 18, N'Inserted', N'FABAYON', 1, CAST(N'2018-08-15' AS Date), CAST(N'10:41:00' AS Time), N'Inserted: ThisIsAmericas,')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (52, N'Masterfile_Channel', 19, N'Inserted', N'FABAYON', 1, CAST(N'2018-08-15' AS Date), CAST(N'11:06:00' AS Time), N'Inserted: 1,')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (53, N'Masterfile_Channel', 20, N'Inserted', N'FABAYON', 100, CAST(N'2018-08-15' AS Date), CAST(N'11:07:00' AS Time), N'Inserted: test2,')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (54, N'Masterfile_Channel', 21, N'Inserted', N'FABAYON', 0, CAST(N'2018-08-15' AS Date), CAST(N'11:28:00' AS Time), N'Inserted: asdasdccc,vasdasd')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (55, N'Masterfile_Channel', 22, N'Inserted', N'FABAYON', 100, CAST(N'2018-08-15' AS Date), CAST(N'11:29:00' AS Time), N'Inserted: aaa,aaa')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (56, N'Masterfile_Channel', 23, N'Inserted', N'FABAYON', 0, CAST(N'2018-08-15' AS Date), CAST(N'11:32:00' AS Time), N'Inserted: ccc,')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (57, N'Masterfile_Channel', 24, N'Inserted', N'FABAYON', 3, CAST(N'2018-08-15' AS Date), CAST(N'11:40:00' AS Time), N'Inserted: wq,wq')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (58, N'Masterfile_Channel', 7, N'Inserted', N'FABAYON', 3, CAST(N'2018-08-15' AS Date), CAST(N'11:53:00' AS Time), N'Inserted: Ali,asdasd')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (59, N'Masterfile_Channel', 8, N'Inserted', N'FABAYON', 3, CAST(N'2018-08-15' AS Date), CAST(N'11:56:00' AS Time), N'Inserted: test,')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (60, N'Masterfile_Channel', 7, N'Deleted', N'RMF-INTERN3', 1, CAST(N'2018-08-15' AS Date), CAST(N'14:04:00' AS Time), N'Deleted Id No: 7')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (61, N'Masterfile_Channel', 8, N'Deleted', N'RMF-INTERN3', 1, CAST(N'2018-08-15' AS Date), CAST(N'14:04:00' AS Time), N'Deleted Id No: 8')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (62, N'Masterfile_District', 3, N'Updated', N'FABAYON', 3, CAST(N'2018-08-16' AS Date), CAST(N'09:05:00' AS Time), N'Updated: Iloilo,10,Remarks here')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (63, N'Masterfile_Region', 8, N'Updated', N'FABAYON', 8, CAST(N'2018-08-16' AS Date), CAST(N'09:06:00' AS Time), N'Updated: Bicol Region Region V,Luzon')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (64, N'Masterfile_Branch', 129, N'Inserted', N'FABAYON', 3, CAST(N'2018-08-16' AS Date), CAST(N'09:42:00' AS Time), N'Inserted: test,5,1,1,test,')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (65, N'Masterfile_District', 6, N'Inserted', N'RMF-INTERN3', 3, CAST(N'2018-08-17' AS Date), CAST(N'09:54:00' AS Time), N'Inserted: Camote,0,')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (66, N'Masterfile_District', 6, N'Inserted', N'RMF-INTERN3', 3, CAST(N'2018-08-17' AS Date), CAST(N'09:58:00' AS Time), N'Inserted: Camote,0,')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (67, N'Masterfile_District', 7, N'Inserted', N'RMF-INTERN3', 3, CAST(N'2018-08-17' AS Date), CAST(N'10:02:00' AS Time), N'Inserted: sample,17,')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (68, N'Masterfile_District', 7, N'Updated', N'RMF-INTERN3', 7, CAST(N'2018-08-17' AS Date), CAST(N'10:02:00' AS Time), N'Updated: sample,17,')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (69, N'Masterfile_Area', 1, N'Delete', N'PATO', 2, CAST(N'2018-08-22' AS Date), CAST(N'10:20:00' AS Time), N'chuchu')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (70, N'Masterfile_Area', 1, N'Delete', N'PATO', 2, CAST(N'2018-08-22' AS Date), CAST(N'10:23:00' AS Time), N'Deleted @Delete Area')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (71, N'Masterfile_Area', 1, N'Delete', N'PATO', 2, CAST(N'2018-08-22' AS Date), CAST(N'10:28:00' AS Time), N'Cebu 1')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (72, N'Masterfile_Area', 1, N'Delete', N'PATO', 2, CAST(N'2018-08-22' AS Date), CAST(N'10:34:00' AS Time), N'Deleted: Cebu 1 Area')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (73, N'Masterfile_Area', 1, N'Delete', N'PATO', 2, CAST(N'2018-08-22' AS Date), CAST(N'10:40:00' AS Time), N'Deleted: Cebu 1 Area by sadasd')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (74, N'Masterfile_Area', 1, N'Delete', N'PATO', 2, CAST(N'2018-08-22' AS Date), CAST(N'10:42:00' AS Time), N'Deleted: Cebu 1 Area by sadasd')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (75, N'Masterfile_Branch', 1, N'Delete', N'PATO', 1, CAST(N'2018-08-22' AS Date), CAST(N'10:49:00' AS Time), N'Deleted: resample Branch by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (76, N'Masterfile_Category', 1, N'Delete', N'PATO', 2, CAST(N'2018-08-22' AS Date), CAST(N'10:54:00' AS Time), N'Deleted: Other Disbursement Category by sadasd')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (77, N'Masterfile_Channel', 1, N'Delete', N'PATO', 2, CAST(N'2018-08-22' AS Date), CAST(N'10:58:00' AS Time), N'Deleted: Cash Channel by sadasd')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (78, N'Masterfile_ChartOfAccount', 1, N'Delete', N'PATO', 2, CAST(N'2018-08-22' AS Date), CAST(N'11:01:00' AS Time), N'Deleted: Sample Chart Of Account by sadasd')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (79, N'Masterfile_District', 1, N'Delete', N'PATO', 2, CAST(N'2018-08-22' AS Date), CAST(N'11:04:00' AS Time), N'Deleted: Cebu District by sadasd')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (80, N'Masterfile_District', 1, N'Delete', N'PATO', 2, CAST(N'2018-08-22' AS Date), CAST(N'11:14:00' AS Time), N'Deleted: marlon lantajo bayon-on Employee by sadas')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (81, N'Masterfile_Employee', 1, N'Delete', N'PATO', 2, CAST(N'2018-08-22' AS Date), CAST(N'11:19:00' AS Time), N'Deleted: View Function by sadasd')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (82, N'Masterfile_OtherReceiptDetail', 1, N'Delete', N'PATO', 2, CAST(N'2018-08-22' AS Date), CAST(N'11:26:00' AS Time), N'Deleted: Sample Other Receipt Detail by sadasd')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (83, N'Masterfile_OtherDisbursementDetail', 1, N'Delete', N'PATO', 2, CAST(N'2018-08-22' AS Date), CAST(N'11:27:00' AS Time), N'Deleted: Loan Other Disbursement Detail by sadasd')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (84, N'Masterfile_PageAction', 1, N'Delete', N'PATO', 2, CAST(N'2018-08-22' AS Date), CAST(N'11:35:00' AS Time), N'Deleted: Page Action by sadasd')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (85, N'Masterfile_Position', 1, N'Delete', N'PATO', 2, CAST(N'2018-08-22' AS Date), CAST(N'11:46:00' AS Time), N'Deleted: ASDPosition by sadasd')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (86, N'Masterfile_Region', 1, N'Delete', N'PATO', 2, CAST(N'2018-08-22' AS Date), CAST(N'11:51:00' AS Time), N'Deleted: National Capital Region (NCR) Region by s')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (87, N'Masterfile_Region', 1, N'Delete', N'PATO', 2, CAST(N'2018-08-22' AS Date), CAST(N'11:52:00' AS Time), N'Deleted: National Capital Region (NCR) by sadasd')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (88, N'Masterfile_Role', 1, N'Delete', N'PATO', 2, CAST(N'2018-08-22' AS Date), CAST(N'11:56:00' AS Time), N'Deleted: Admin Role by sad')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (89, N'Masterfile_User', 1, N'Delete', N'PATO', 2, CAST(N'2018-08-22' AS Date), CAST(N'12:02:00' AS Time), N'Deleted: ec User by sad')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (90, N'Transaction_BudgetPreparation', 1, N'Delete', N'PATO', 2, CAST(N'2018-08-22' AS Date), CAST(N'13:14:00' AS Time), N'Deleted: BudgetPreparationId [1] by sad')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (91, N'Transaction_BudgetPreparationDetail', 1, N'Delete', N'PATO', 2, CAST(N'2018-08-22' AS Date), CAST(N'13:19:00' AS Time), N'Deleted: BudgetPreparationdetailId [1] by sad')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (92, N'Transaction_BudgetPreparationCurren', 1, N'Delete', N'PATO', 2, CAST(N'2018-08-22' AS Date), CAST(N'13:55:00' AS Time), NULL)
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (93, N'Masterfile_Area', 18, N'Insert', N'PATO', 2, CAST(N'2018-08-22' AS Date), CAST(N'14:26:00' AS Time), N'Inserted Poblacion3 Area by sad')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (94, N'Masterfile_Area', 131, N'Insert', N'PATO', 1, CAST(N'2018-08-22' AS Date), CAST(N'14:43:00' AS Time), N'Inserted: Cebu City 5 Branch byec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (95, N'Masterfile_Employee', 172, N'Insert', N'PATO', 2, CAST(N'2018-08-22' AS Date), CAST(N'15:04:00' AS Time), N'Inserted New Employee: SophieaDASDaDASD by sad')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (96, N'Masterfile_Employee', 173, N'Insert', N'PATO', 2, CAST(N'2018-08-22' AS Date), CAST(N'15:08:00' AS Time), N'Inserted New Employee: Sophies aDASD aDASD by sad')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (97, N'Masterfile_Function', 68, N'Insert', N'PATO', 2, CAST(N'2018-08-22' AS Date), CAST(N'16:05:00' AS Time), N'Inserted: 1 and 1 Page Action by sad')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (98, N'Masterfile_Position', 141, N'Insert', N'PATO', 2, CAST(N'2018-08-22' AS Date), CAST(N'16:16:00' AS Time), N'Inserted: Exec Position by sad')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (99, N'Masterfile_Area', 1, N'Update', N'PATO', 2, CAST(N'2018-08-23' AS Date), CAST(N'10:22:00' AS Time), N'Updated: Area Name From[Cebu 1] To [Liverpool],
						 District Id From[1] To [2] and Remarks From[] To 
						 [] on Area by sad')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (100, N'Masterfile_Area', 1, N'Update', N'PATO', 2, CAST(N'2018-08-23' AS Date), CAST(N'10:24:00' AS Time), N'Updated: Area Name From[Liverpool] To[Liverpool], District Id From[2] To[2] and Remarks From[] To[] on Area by sad')
GO
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (101, N'Masterfile_Area', 1, N'Update', N'PATO', 2, CAST(N'2018-08-23' AS Date), CAST(N'10:24:00' AS Time), N'Updated: Area Name From[Liverpool] To[England], District Id From[2] To[2] and Remarks From[] To[] on Area by sad')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (102, N'Masterfile_Branch', 1, N'Update', N'PATO', 2, CAST(N'2018-08-23' AS Date), CAST(N'13:17:00' AS Time), N'Updated: Branch Name From[resample] To[Kamote], Area Id From[1] To[2], Address From[sample To[Que], Latitude From[12.123000] To[12.123000], Longitude From[12.123000] To[12.123123], and Remarks From[sample] To[asdasd] on Branch by sad')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (103, N'Masterfile_Branch', 1, N'Update', N'PATO', 2, CAST(N'2018-08-23' AS Date), CAST(N'13:18:00' AS Time), N'Updated: Branch Name From[Kamote] To[Kamote], Area Id From[2] To[2], Address From[Que To[Que], Latitude From[12.123000] To[12.123000], Longitude From[12.123123] To[12.123123], and Remarks From[asdasd] To[asdasd] on Branch by sad')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (104, N'Masterfile_Category', 6, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-24' AS Date), CAST(N'14:47:00' AS Time), N'Inserted: Operating Expense Category by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (105, N'Masterfile_OtherDisbursementDetail', 7, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-24' AS Date), CAST(N'14:50:00' AS Time), N'Inserted: Office Rental Other Disbursement Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (106, N'Masterfile_OtherReceiptDetail', 7, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-24' AS Date), CAST(N'14:55:00' AS Time), N'Inserted: Income-NonTrade Other Receipt Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (107, N'Transaction_DailyCashFlow', 1, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:07:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (108, N'Transaction_DailyCashFlow', 2, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:07:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (109, N'Transaction_DailyCashFlow', 3, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:07:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (110, N'Transaction_DailyCashFlow', 4, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:07:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (111, N'Transaction_DailyCashFlow', 5, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:08:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (112, N'Transaction_DailyCashFlow', 5, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:09:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (113, N'Transaction_DailyCashFlow', 6, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:09:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (114, N'Transaction_DailyCashFlow', 7, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:09:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (115, N'Transaction_DailyCashFlow', 8, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:09:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (116, N'Transaction_DailyCashFlow', 9, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:09:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (117, N'Transaction_DailyCashFlow', 10, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:09:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (118, N'Transaction_DailyCashFlow', 11, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:09:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (119, N'Transaction_DailyCashFlow', 12, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:09:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (120, N'Transaction_DailyCashFlow', 13, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:09:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (121, N'Transaction_DailyCashFlow', 14, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:09:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (122, N'Transaction_DailyCashFlow', 15, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:09:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (123, N'Transaction_DailyCashFlow', 16, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:09:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (124, N'Transaction_DailyCashFlow', 17, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:11:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (125, N'Transaction_DailyCashFlow', 18, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:11:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (126, N'Transaction_DailyCashFlow', 19, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:11:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (127, N'Transaction_DailyCashFlow', 20, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:11:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (128, N'Transaction_DailyCashFlow', 21, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:12:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (129, N'Transaction_DailyCashFlow', 22, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:12:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (130, N'Transaction_DailyCashFlow', 23, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:12:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (131, N'Transaction_DailyCashFlow', 24, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:12:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (132, N'Transaction_DailyCashFlow', 25, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:12:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (133, N'Transaction_DailyCashFlow', 26, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:12:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (134, N'Transaction_DailyCashFlow', 27, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:12:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (135, N'Transaction_DailyCashFlow', 28, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:12:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (136, N'Transaction_DailyCashFlow', 29, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:13:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (137, N'Transaction_DailyCashFlow', 30, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:13:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (138, N'Transaction_DailyCashFlow', 31, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:13:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (139, N'Transaction_DailyCashFlow', 32, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:13:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (140, N'Transaction_DailyCashFlow', 33, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:13:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (141, N'Transaction_DailyCashFlow', 34, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:13:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (142, N'Transaction_DailyCashFlow', 35, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:13:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (143, N'Transaction_DailyCashFlow', 36, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:13:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (144, N'Transaction_DailyCashFlow', 37, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:13:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (145, N'Transaction_DailyCashFlow', 38, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:13:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (146, N'Transaction_DailyCashFlow', 39, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:13:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (147, N'Transaction_DailyCashFlow', 40, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:13:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (148, N'Transaction_DailyCashFlow', 41, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:14:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (149, N'Transaction_DailyCashFlow', 42, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:14:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (150, N'Transaction_DailyCashFlow', 43, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:14:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (151, N'Transaction_DailyCashFlow', 44, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:14:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (152, N'Transaction_DailyCashFlow', 45, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:16:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (153, N'Transaction_DailyCashFlow', 46, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:16:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (154, N'Transaction_DailyCashFlow', 47, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:16:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (155, N'Transaction_DailyCashFlow', 48, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:16:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (156, N'Transaction_DailyCashFlow', 49, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:16:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (157, N'Transaction_DailyCashFlow', 50, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:16:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (158, N'Transaction_DailyCashFlow', 51, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:16:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (159, N'Transaction_DailyCashFlow', 52, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:16:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (160, N'Transaction_DailyCashFlow', 53, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:16:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (161, N'Transaction_DailyCashFlow', 54, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:16:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (162, N'Transaction_DailyCashFlow', 55, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:16:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (163, N'Transaction_DailyCashFlow', 56, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:16:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (164, N'Transaction_DailyCashFlow', 41, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:17:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (165, N'Transaction_DailyCashFlow', 42, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:17:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (166, N'Transaction_DailyCashFlow', 43, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:17:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (167, N'Transaction_DailyCashFlow', 44, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:17:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (168, N'Transaction_DailyCashFlow', 45, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:17:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (169, N'Transaction_DailyCashFlow', 46, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:17:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (170, N'Transaction_DailyCashFlow', 47, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:17:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (171, N'Transaction_DailyCashFlow', 48, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:17:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (172, N'Transaction_DailyCashFlow', 49, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:17:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (173, N'Transaction_DailyCashFlow', 50, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:17:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (174, N'Transaction_DailyCashFlow', 51, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:17:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (175, N'Transaction_DailyCashFlow', 52, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:17:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (176, N'Transaction_DailyCashFlow', 53, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:17:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (177, N'Transaction_DailyCashFlow', 54, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:17:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (178, N'Transaction_DailyCashFlow', 55, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:17:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (179, N'Transaction_DailyCashFlow', 56, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:17:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (180, N'Transaction_DailyCashFlow', 57, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:18:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (181, N'Transaction_DailyCashFlow', 58, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:18:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (182, N'Transaction_DailyCashFlow', 59, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:18:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (183, N'Transaction_DailyCashFlow', 60, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:18:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (184, N'Transaction_DailyCashFlow', 61, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:18:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (185, N'Transaction_DailyCashFlow', 62, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:18:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (186, N'Transaction_DailyCashFlow', 63, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:18:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (187, N'Transaction_DailyCashFlow', 64, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:18:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (188, N'Transaction_DailyCashFlow', 65, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:18:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (189, N'Transaction_DailyCashFlow', 66, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:18:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (190, N'Transaction_DailyCashFlow', 67, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:18:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (191, N'Transaction_DailyCashFlow', 68, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:18:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (192, N'Transaction_DailyCashFlow', 69, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:18:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (193, N'Transaction_DailyCashFlow', 70, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:18:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (194, N'Transaction_DailyCashFlow', 71, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:18:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (195, N'Transaction_DailyCashFlow', 72, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:18:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (196, N'Transaction_DailyCashFlow', 73, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:18:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (197, N'Transaction_DailyCashFlow', 74, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:18:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (198, N'Transaction_DailyCashFlow', 75, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:18:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (199, N'Transaction_DailyCashFlow', 76, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:18:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (200, N'Transaction_DailyCashFlow', 77, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:18:00' AS Time), N'Inserted:  Daily Cashflow by esci')
GO
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (201, N'Transaction_DailyCashFlow', 78, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:18:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (202, N'Transaction_DailyCashFlow', 79, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:18:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (203, N'Transaction_DailyCashFlow', 80, N'Insert', N'PATO', 3, CAST(N'2018-08-24' AS Date), CAST(N'16:18:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (204, N'Masterfile_Area', 1, N'Update', N'FABAYON', 1, CAST(N'2018-08-27' AS Date), CAST(N'15:25:00' AS Time), N'Updated: Area Name From[England] To[Cebu 1], District Id From[2] To[2] and Remarks From[] To[] on Area by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (205, N'Masterfile_Area', 18, N'Delete', N'FABAYON', 3, CAST(N'2018-08-27' AS Date), CAST(N'15:26:00' AS Time), N'Deleted: Poblacion3 Area by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (206, N'Transaction_BudgetPreparationDetail', 94, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'09:36:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (207, N'Transaction_BudgetPreparationDetail', 95, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'09:36:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (208, N'Transaction_BudgetPreparationDetail', 96, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:24:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (209, N'Transaction_BudgetPreparationDetail', 97, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:24:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (210, N'Transaction_BudgetPreparationDetail', 98, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:24:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (211, N'Transaction_BudgetPreparationDetail', 99, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:24:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (212, N'Transaction_BudgetPreparationDetail', 100, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:24:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (213, N'Transaction_BudgetPreparationDetail', 101, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:24:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (214, N'Transaction_BudgetPreparationDetail', 102, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:24:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (215, N'Transaction_BudgetPreparationDetail', 103, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:24:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (216, N'Transaction_BudgetPreparationDetail', 104, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:24:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (217, N'Transaction_BudgetPreparationDetail', 105, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:24:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (218, N'Transaction_BudgetPreparationDetail', 106, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:24:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (219, N'Transaction_BudgetPreparationDetail', 107, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:24:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (220, N'Transaction_BudgetPreparationDetail', 108, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:24:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (221, N'Transaction_BudgetPreparationDetail', 109, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:24:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (222, N'Transaction_BudgetPreparationDetail', 110, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:24:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (223, N'Transaction_BudgetPreparationDetail', 111, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:24:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (224, N'Transaction_BudgetPreparationDetail', 112, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:24:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (225, N'Transaction_BudgetPreparationDetail', 113, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:24:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (226, N'Transaction_BudgetPreparationDetail', 114, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:24:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (227, N'Transaction_BudgetPreparationDetail', 115, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:24:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (228, N'Transaction_BudgetPreparationDetail', 116, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:24:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (229, N'Transaction_BudgetPreparationDetail', 117, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:24:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (230, N'Transaction_BudgetPreparationDetail', 118, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:24:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (231, N'Transaction_BudgetPreparationDetail', 119, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:24:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (232, N'Transaction_BudgetPreparationDetail', 120, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:24:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (233, N'Transaction_BudgetPreparationDetail', 121, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:24:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (234, N'Transaction_BudgetPreparationDetail', 122, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:24:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (235, N'Transaction_BudgetPreparationDetail', 123, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:24:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (236, N'Transaction_BudgetPreparationDetail', 124, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:24:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (237, N'Transaction_BudgetPreparationDetail', 125, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:24:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (238, N'Transaction_BudgetPreparationDetail', 126, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:24:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (239, N'Transaction_BudgetPreparationDetail', 127, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:24:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (240, N'Transaction_BudgetPreparationDetail', 128, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:24:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (241, N'Transaction_BudgetPreparationDetail', 129, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:24:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (242, N'Transaction_BudgetPreparationDetail', 130, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:24:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (243, N'Transaction_BudgetPreparationDetail', 131, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:25:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (244, N'Transaction_BudgetPreparationDetail', 132, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:25:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (245, N'Transaction_BudgetPreparationDetail', 133, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:25:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (246, N'Transaction_BudgetPreparationDetail', 134, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:25:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (247, N'Transaction_BudgetPreparationDetail', 135, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:25:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (248, N'Transaction_BudgetPreparationDetail', 136, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:25:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (249, N'Transaction_BudgetPreparationDetail', 137, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:25:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (250, N'Transaction_BudgetPreparationDetail', 138, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:25:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (251, N'Transaction_BudgetPreparationDetail', 139, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:25:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (252, N'Transaction_BudgetPreparationDetail', 140, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:25:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (253, N'Transaction_BudgetPreparationDetail', 141, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:25:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (254, N'Transaction_BudgetPreparationDetail', 142, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:25:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (255, N'Transaction_BudgetPreparationDetail', 143, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:25:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (256, N'Transaction_BudgetPreparationDetail', 144, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:25:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (257, N'Transaction_BudgetPreparationDetail', 145, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:25:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (258, N'Transaction_BudgetPreparationDetail', 146, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:25:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (259, N'Transaction_BudgetPreparationDetail', 147, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:25:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (260, N'Transaction_BudgetPreparationDetail', 148, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:25:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (261, N'Transaction_BudgetPreparationDetail', 149, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'10:25:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (262, N'Transaction_BudgetPreparationDetail', 150, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (263, N'Transaction_BudgetPreparationDetail', 151, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (264, N'Transaction_BudgetPreparationDetail', 152, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (265, N'Transaction_BudgetPreparationDetail', 153, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (266, N'Transaction_BudgetPreparationDetail', 154, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (267, N'Transaction_BudgetPreparationDetail', 155, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (268, N'Transaction_BudgetPreparationDetail', 156, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (269, N'Transaction_BudgetPreparationDetail', 157, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (270, N'Transaction_BudgetPreparationDetail', 158, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (271, N'Transaction_BudgetPreparationDetail', 159, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (272, N'Transaction_BudgetPreparationDetail', 160, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (273, N'Transaction_BudgetPreparationDetail', 161, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (274, N'Transaction_BudgetPreparationDetail', 162, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (275, N'Transaction_BudgetPreparationDetail', 163, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (276, N'Transaction_BudgetPreparationDetail', 164, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (277, N'Transaction_BudgetPreparationDetail', 165, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (278, N'Transaction_BudgetPreparationDetail', 166, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (279, N'Transaction_BudgetPreparationDetail', 167, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (280, N'Transaction_BudgetPreparationDetail', 168, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (281, N'Transaction_BudgetPreparationDetail', 169, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (282, N'Transaction_BudgetPreparationDetail', 170, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (283, N'Transaction_BudgetPreparationDetail', 171, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (284, N'Transaction_BudgetPreparationDetail', 172, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (285, N'Transaction_BudgetPreparationDetail', 173, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (286, N'Transaction_BudgetPreparationDetail', 174, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (287, N'Transaction_BudgetPreparationDetail', 175, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (288, N'Transaction_BudgetPreparationDetail', 176, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (289, N'Transaction_BudgetPreparationDetail', 177, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (290, N'Transaction_BudgetPreparationDetail', 178, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (291, N'Transaction_BudgetPreparationDetail', 179, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (292, N'Transaction_BudgetPreparationDetail', 180, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (293, N'Transaction_BudgetPreparationDetail', 181, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (294, N'Transaction_BudgetPreparationDetail', 182, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (295, N'Transaction_BudgetPreparationDetail', 183, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (296, N'Transaction_BudgetPreparationDetail', 184, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (297, N'Transaction_BudgetPreparationDetail', 185, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (298, N'Transaction_BudgetPreparationDetail', 186, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (299, N'Transaction_BudgetPreparationDetail', 187, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (300, N'Transaction_BudgetPreparationDetail', 188, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
GO
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (301, N'Transaction_BudgetPreparationDetail', 189, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (302, N'Transaction_BudgetPreparationDetail', 190, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (303, N'Transaction_BudgetPreparationDetail', 191, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (304, N'Transaction_BudgetPreparationDetail', 192, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (305, N'Transaction_BudgetPreparationDetail', 193, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (306, N'Transaction_BudgetPreparationDetail', 194, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (307, N'Transaction_BudgetPreparationDetail', 195, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (308, N'Transaction_BudgetPreparationDetail', 196, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (309, N'Transaction_BudgetPreparationDetail', 197, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (310, N'Transaction_BudgetPreparationDetail', 198, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (311, N'Transaction_BudgetPreparationDetail', 199, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (312, N'Transaction_BudgetPreparationDetail', 200, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (313, N'Transaction_BudgetPreparationDetail', 201, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (314, N'Transaction_BudgetPreparationDetail', 202, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (315, N'Transaction_BudgetPreparationDetail', 203, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (316, N'Transaction_BudgetPreparationDetail', 204, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (317, N'Transaction_BudgetPreparationDetail', 205, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (318, N'Transaction_BudgetPreparationDetail', 206, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:35:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (319, N'Transaction_BudgetPreparationDetail', 207, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:36:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (320, N'Transaction_BudgetPreparationDetail', 208, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:36:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (321, N'Transaction_BudgetPreparationDetail', 209, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:36:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (322, N'Transaction_BudgetPreparationDetail', 210, N'Insert', N'RMF-INTERN3', 1, CAST(N'2018-08-28' AS Date), CAST(N'14:36:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (323, N'Transaction_BudgetPreparationDetail', 211, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'15:25:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (324, N'Transaction_BudgetPreparationDetail', 212, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'15:25:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (325, N'Transaction_BudgetPreparationDetail', 213, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-28' AS Date), CAST(N'15:25:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (326, N'Transaction_BudgetPreparationDetail', 214, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'10:31:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (327, N'Transaction_BudgetPreparationDetail', 215, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'10:31:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (328, N'Transaction_BudgetPreparationDetail', 216, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'10:31:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (329, N'Transaction_BudgetPreparationDetail', 85, N'Delete', N'RMF-INTERN3', 1, CAST(N'2018-08-29' AS Date), CAST(N'10:37:00' AS Time), N'Deleted: BudgetPreparationdetailId [85] by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (330, N'Transaction_BudgetPreparationDetail', 85, N'Delete', N'RMF-INTERN3', 1, CAST(N'2018-08-29' AS Date), CAST(N'10:41:00' AS Time), N'Deleted: BudgetPreparationdetailId [85] by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (331, N'Transaction_BudgetPreparationDetail', 85, N'Delete', N'RMF-INTERN3', 1, CAST(N'2018-08-29' AS Date), CAST(N'10:41:00' AS Time), N'Deleted: BudgetPreparationdetailId [85] by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (332, N'Transaction_BudgetPreparationDetail', 211, N'Delete', N'RMF-INTERN3', 1, CAST(N'2018-08-29' AS Date), CAST(N'10:41:00' AS Time), N'Deleted: BudgetPreparationdetailId [211] by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (333, N'Transaction_BudgetPreparationDetail', 212, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'10:49:00' AS Time), N'Deleted: BudgetPreparationdetailId [212] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (334, N'Transaction_BudgetPreparationDetail', 213, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'10:49:00' AS Time), N'Deleted: BudgetPreparationdetailId [213] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (335, N'Transaction_BudgetPreparationDetail', 214, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'10:49:00' AS Time), N'Deleted: BudgetPreparationdetailId [214] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (336, N'Transaction_BudgetPreparationDetail', 215, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'10:49:00' AS Time), N'Deleted: BudgetPreparationdetailId [215] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (337, N'Transaction_BudgetPreparationDetail', 216, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'10:49:00' AS Time), N'Deleted: BudgetPreparationdetailId [216] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (338, N'Transaction_BudgetPreparationDetail', 217, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'10:49:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (339, N'Transaction_BudgetPreparationDetail', 217, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'10:49:00' AS Time), N'Deleted: BudgetPreparationdetailId [217] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (340, N'Transaction_BudgetPreparationDetail', 218, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'10:49:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (341, N'Transaction_BudgetPreparationDetail', 218, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'10:49:00' AS Time), N'Deleted: BudgetPreparationdetailId [218] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (342, N'Transaction_BudgetPreparationDetail', 219, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'10:49:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (343, N'Transaction_BudgetPreparationDetail', 219, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'10:49:00' AS Time), N'Deleted: BudgetPreparationdetailId [219] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (344, N'Transaction_BudgetPreparationDetail', 220, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'10:49:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (345, N'Transaction_BudgetPreparationDetail', 220, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'10:49:00' AS Time), N'Deleted: BudgetPreparationdetailId [220] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (346, N'Transaction_BudgetPreparationDetail', 221, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'10:49:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (347, N'Transaction_BudgetPreparationDetail', 221, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'10:49:00' AS Time), N'Deleted: BudgetPreparationdetailId [221] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (348, N'Transaction_BudgetPreparationDetail', 222, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'10:49:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (349, N'Transaction_BudgetPreparationDetail', 222, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'10:49:00' AS Time), N'Deleted: BudgetPreparationdetailId [222] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (350, N'Transaction_BudgetPreparationDetail', 223, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'10:49:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (351, N'Transaction_BudgetPreparationDetail', 223, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'10:50:00' AS Time), N'Deleted: BudgetPreparationdetailId [223] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (352, N'Transaction_BudgetPreparationDetail', 224, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'10:50:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (353, N'Transaction_BudgetPreparationDetail', 224, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'10:50:00' AS Time), N'Deleted: BudgetPreparationdetailId [224] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (354, N'Transaction_BudgetPreparationDetail', 225, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'10:50:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (355, N'Transaction_BudgetPreparationDetail', 225, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'10:56:00' AS Time), N'Deleted: BudgetPreparationdetailId [225] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (356, N'Transaction_BudgetPreparationDetail', 226, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'10:56:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (357, N'Transaction_BudgetPreparationDetail', 226, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'10:56:00' AS Time), N'Deleted: BudgetPreparationdetailId [226] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (358, N'Transaction_BudgetPreparationDetail', 227, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'10:56:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (359, N'Transaction_BudgetPreparationDetail', 227, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:04:00' AS Time), N'Deleted: BudgetPreparationdetailId [227] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (360, N'Transaction_BudgetPreparationDetail', 228, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:05:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (361, N'Transaction_BudgetPreparationDetail', 228, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:05:00' AS Time), N'Deleted: BudgetPreparationdetailId [228] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (362, N'Transaction_BudgetPreparationDetail', 229, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:05:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (363, N'Transaction_BudgetPreparationDetail', 229, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:09:00' AS Time), N'Deleted: BudgetPreparationdetailId [229] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (364, N'Transaction_BudgetPreparationDetail', 230, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:09:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (365, N'Transaction_BudgetPreparationDetail', 231, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:09:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (366, N'Transaction_BudgetPreparationDetail', 230, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:10:00' AS Time), N'Deleted: BudgetPreparationdetailId [230] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (367, N'Transaction_BudgetPreparationDetail', 232, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:10:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (368, N'Transaction_BudgetPreparationDetail', 231, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:10:00' AS Time), N'Deleted: BudgetPreparationdetailId [231] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (369, N'Transaction_BudgetPreparationDetail', 233, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:10:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (370, N'Transaction_BudgetPreparationDetail', 232, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:11:00' AS Time), N'Deleted: BudgetPreparationdetailId [232] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (371, N'Transaction_BudgetPreparationDetail', 234, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:11:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (372, N'Transaction_BudgetPreparationDetail', 233, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:11:00' AS Time), N'Deleted: BudgetPreparationdetailId [233] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (373, N'Transaction_BudgetPreparationDetail', 235, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:11:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (374, N'Transaction_BudgetPreparationDetail', 234, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:12:00' AS Time), N'Deleted: BudgetPreparationdetailId [234] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (375, N'Transaction_BudgetPreparationDetail', 236, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:12:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (376, N'Transaction_BudgetPreparationDetail', 235, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:12:00' AS Time), N'Deleted: BudgetPreparationdetailId [235] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (377, N'Transaction_BudgetPreparationDetail', 237, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:12:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (378, N'Transaction_BudgetPreparationDetail', 236, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:20:00' AS Time), N'Deleted: BudgetPreparationdetailId [236] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (379, N'Transaction_BudgetPreparationDetail', 238, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:20:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (380, N'Transaction_BudgetPreparationDetail', 237, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:20:00' AS Time), N'Deleted: BudgetPreparationdetailId [237] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (381, N'Transaction_BudgetPreparationDetail', 239, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:20:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (382, N'Transaction_BudgetPreparationDetail', 238, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:34:00' AS Time), N'Deleted: BudgetPreparationdetailId [238] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (383, N'Transaction_BudgetPreparationDetail', 240, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:34:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (384, N'Transaction_BudgetPreparationDetail', 239, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:34:00' AS Time), N'Deleted: BudgetPreparationdetailId [239] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (385, N'Transaction_BudgetPreparationDetail', 241, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:34:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (386, N'Transaction_BudgetPreparationDetail', 242, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:34:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (387, N'Transaction_BudgetPreparationDetail', 240, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:41:00' AS Time), N'Deleted: BudgetPreparationdetailId [240] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (388, N'Transaction_BudgetPreparationDetail', 243, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:41:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (389, N'Transaction_BudgetPreparationDetail', 241, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:41:00' AS Time), N'Deleted: BudgetPreparationdetailId [241] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (390, N'Transaction_BudgetPreparationDetail', 244, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:41:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (391, N'Transaction_BudgetPreparationDetail', 242, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:41:00' AS Time), N'Deleted: BudgetPreparationdetailId [242] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (392, N'Transaction_BudgetPreparationDetail', 245, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:41:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (393, N'Transaction_BudgetPreparationDetail', 243, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:56:00' AS Time), N'Deleted: BudgetPreparationdetailId [243] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (394, N'Transaction_BudgetPreparationDetail', 246, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:56:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (395, N'Transaction_BudgetPreparationDetail', 244, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:56:00' AS Time), N'Deleted: BudgetPreparationdetailId [244] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (396, N'Transaction_BudgetPreparationDetail', 247, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:56:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (397, N'Transaction_BudgetPreparationDetail', 245, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:56:00' AS Time), N'Deleted: BudgetPreparationdetailId [245] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (398, N'Transaction_BudgetPreparationDetail', 248, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:56:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (399, N'Transaction_BudgetPreparationDetail', 249, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'11:56:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (400, N'Transaction_BudgetPreparationDetail', 247, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:33:00' AS Time), N'Deleted: BudgetPreparationdetailId [247] by esci')
GO
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (401, N'Transaction_BudgetPreparationDetail', 250, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:33:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (402, N'Transaction_BudgetPreparationDetail', 248, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:33:00' AS Time), N'Deleted: BudgetPreparationdetailId [248] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (403, N'Transaction_BudgetPreparationDetail', 251, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:33:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (404, N'Transaction_BudgetPreparationDetail', 249, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:33:00' AS Time), N'Deleted: BudgetPreparationdetailId [249] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (405, N'Transaction_BudgetPreparationDetail', 252, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:33:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (406, N'Transaction_BudgetPreparationDetail', 250, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:37:00' AS Time), N'Deleted: BudgetPreparationdetailId [250] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (407, N'Transaction_BudgetPreparationDetail', 253, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:37:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (408, N'Transaction_BudgetPreparationDetail', 251, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:37:00' AS Time), N'Deleted: BudgetPreparationdetailId [251] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (409, N'Transaction_BudgetPreparationDetail', 254, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:37:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (410, N'Transaction_BudgetPreparationDetail', 252, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:37:00' AS Time), N'Deleted: BudgetPreparationdetailId [252] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (411, N'Transaction_BudgetPreparationDetail', 255, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:37:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (412, N'Transaction_BudgetPreparationDetail', 246, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:38:00' AS Time), N'Deleted: BudgetPreparationdetailId [246] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (413, N'Transaction_BudgetPreparationDetail', 256, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:38:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (414, N'Transaction_BudgetPreparationDetail', 250, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:38:00' AS Time), N'Deleted: BudgetPreparationdetailId [250] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (415, N'Transaction_BudgetPreparationDetail', 257, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:38:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (416, N'Transaction_BudgetPreparationDetail', 251, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:38:00' AS Time), N'Deleted: BudgetPreparationdetailId [251] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (417, N'Transaction_BudgetPreparationDetail', 258, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:38:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (418, N'Transaction_BudgetPreparationDetail', 252, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:38:00' AS Time), N'Deleted: BudgetPreparationdetailId [252] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (419, N'Transaction_BudgetPreparationDetail', 259, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:38:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (420, N'Transaction_BudgetPreparationDetail', 253, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:43:00' AS Time), N'Deleted: BudgetPreparationdetailId [253] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (421, N'Transaction_BudgetPreparationDetail', 260, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:43:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (422, N'Transaction_BudgetPreparationDetail', 254, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:43:00' AS Time), N'Deleted: BudgetPreparationdetailId [254] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (423, N'Transaction_BudgetPreparationDetail', 261, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:43:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (424, N'Transaction_BudgetPreparationDetail', 255, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:43:00' AS Time), N'Deleted: BudgetPreparationdetailId [255] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (425, N'Transaction_BudgetPreparationDetail', 262, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:43:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (426, N'Transaction_BudgetPreparationDetail', 257, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:43:00' AS Time), N'Deleted: BudgetPreparationdetailId [257] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (427, N'Transaction_BudgetPreparationDetail', 263, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:43:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (428, N'Transaction_BudgetPreparationDetail', 258, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:43:00' AS Time), N'Deleted: BudgetPreparationdetailId [258] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (429, N'Transaction_BudgetPreparationDetail', 264, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:43:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (430, N'Transaction_BudgetPreparationDetail', 259, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:43:00' AS Time), N'Deleted: BudgetPreparationdetailId [259] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (431, N'Transaction_BudgetPreparationDetail', 265, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:43:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (432, N'Transaction_BudgetPreparationDetail', 266, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:43:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (433, N'Transaction_BudgetPreparationDetail', 256, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:45:00' AS Time), N'Deleted: BudgetPreparationdetailId [256] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (434, N'Transaction_BudgetPreparationDetail', 260, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:45:00' AS Time), N'Deleted: BudgetPreparationdetailId [260] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (435, N'Transaction_BudgetPreparationDetail', 261, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:45:00' AS Time), N'Deleted: BudgetPreparationdetailId [261] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (436, N'Transaction_BudgetPreparationDetail', 262, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:45:00' AS Time), N'Deleted: BudgetPreparationdetailId [262] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (437, N'Transaction_BudgetPreparationDetail', 263, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:46:00' AS Time), N'Deleted: BudgetPreparationdetailId [263] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (438, N'Transaction_BudgetPreparationDetail', 264, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:46:00' AS Time), N'Deleted: BudgetPreparationdetailId [264] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (439, N'Transaction_BudgetPreparationDetail', 265, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:46:00' AS Time), N'Deleted: BudgetPreparationdetailId [265] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (440, N'Transaction_BudgetPreparationDetail', 266, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:46:00' AS Time), N'Deleted: BudgetPreparationdetailId [266] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (441, N'Transaction_BudgetPreparationDetail', 256, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:46:00' AS Time), N'Deleted: BudgetPreparationdetailId [256] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (442, N'Transaction_BudgetPreparationDetail', 256, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:49:00' AS Time), N'Deleted: BudgetPreparationdetailId [256] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (443, N'Transaction_BudgetPreparationDetail', 267, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:49:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (444, N'Transaction_BudgetPreparationDetail', 267, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:50:00' AS Time), N'Deleted: BudgetPreparationdetailId [267] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (445, N'Transaction_BudgetPreparationDetail', 268, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:50:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (446, N'Transaction_BudgetPreparationDetail', 269, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:50:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (447, N'Transaction_BudgetPreparationDetail', 270, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:50:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (448, N'Transaction_BudgetPreparationDetail', 268, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:54:00' AS Time), N'Deleted: BudgetPreparationdetailId [268] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (449, N'Transaction_BudgetPreparationDetail', 271, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:54:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (450, N'Transaction_BudgetPreparationDetail', 269, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:54:00' AS Time), N'Deleted: BudgetPreparationdetailId [269] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (451, N'Transaction_BudgetPreparationDetail', 272, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:54:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (452, N'Transaction_BudgetPreparationDetail', 270, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:54:00' AS Time), N'Deleted: BudgetPreparationdetailId [270] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (453, N'Transaction_BudgetPreparationDetail', 273, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:54:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (454, N'Transaction_BudgetPreparationDetail', 274, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:54:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (455, N'Transaction_BudgetPreparationDetail', 271, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:55:00' AS Time), N'Deleted: BudgetPreparationdetailId [271] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (456, N'Transaction_BudgetPreparationDetail', 275, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:55:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (457, N'Transaction_BudgetPreparationDetail', 272, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:55:00' AS Time), N'Deleted: BudgetPreparationdetailId [272] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (458, N'Transaction_BudgetPreparationDetail', 276, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:55:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (459, N'Transaction_BudgetPreparationDetail', 273, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:55:00' AS Time), N'Deleted: BudgetPreparationdetailId [273] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (460, N'Transaction_BudgetPreparationDetail', 277, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:55:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (461, N'Transaction_BudgetPreparationDetail', 274, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:55:00' AS Time), N'Deleted: BudgetPreparationdetailId [274] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (462, N'Transaction_BudgetPreparationDetail', 278, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:55:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (463, N'Transaction_BudgetPreparationDetail', 279, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-29' AS Date), CAST(N'13:55:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (464, N'Transaction_DailyCashFlow', 81, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:42:00' AS Time), N'Inserted: loans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (465, N'Transaction_DailyCashFlow', 82, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:42:00' AS Time), N'Inserted: cbu/savings Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (466, N'Transaction_DailyCashFlow', 83, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:42:00' AS Time), N'Inserted: reloans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (467, N'Transaction_DailyCashFlow', 84, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:42:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (468, N'Transaction_DailyCashFlow', 85, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:42:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (469, N'Transaction_DailyCashFlow', 86, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:42:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (470, N'Transaction_DailyCashFlow', 87, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:42:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (471, N'Transaction_DailyCashFlow', 88, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:42:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (472, N'Transaction_DailyCashFlow', 89, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:42:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (473, N'Transaction_DailyCashFlow', 90, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:42:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (474, N'Transaction_DailyCashFlow', 91, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:42:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (475, N'Transaction_DailyCashFlow', 92, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:42:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (476, N'Transaction_DailyCashFlow', 93, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:42:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (477, N'Transaction_DailyCashFlow', 94, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:42:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (478, N'Transaction_DailyCashFlow', 95, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted: loans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (479, N'Transaction_DailyCashFlow', 96, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted: cbu/savings Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (480, N'Transaction_DailyCashFlow', 97, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted: reloans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (481, N'Transaction_DailyCashFlow', 98, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (482, N'Transaction_DailyCashFlow', 99, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (483, N'Transaction_DailyCashFlow', 100, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (484, N'Transaction_DailyCashFlow', 101, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (485, N'Transaction_DailyCashFlow', 102, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (486, N'Transaction_DailyCashFlow', 103, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (487, N'Transaction_DailyCashFlow', 104, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (488, N'Transaction_DailyCashFlow', 105, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (489, N'Transaction_DailyCashFlow', 106, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (490, N'Transaction_DailyCashFlow', 107, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (491, N'Transaction_DailyCashFlow', 108, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (492, N'Transaction_DailyCashFlow', 109, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (493, N'Transaction_DailyCashFlow', 110, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (494, N'Transaction_DailyCashFlow', 111, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (495, N'Transaction_DailyCashFlow', 112, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (496, N'Transaction_DailyCashFlow', 113, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (497, N'Transaction_DailyCashFlow', 114, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted: loans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (498, N'Transaction_DailyCashFlow', 115, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted: cbu/savings Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (499, N'Transaction_DailyCashFlow', 116, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted: reloans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (500, N'Transaction_DailyCashFlow', 117, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted:  Daily Cashflow by esci')
GO
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (501, N'Transaction_DailyCashFlow', 118, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (502, N'Transaction_DailyCashFlow', 119, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (503, N'Transaction_DailyCashFlow', 120, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (504, N'Transaction_DailyCashFlow', 121, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (505, N'Transaction_DailyCashFlow', 122, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (506, N'Transaction_DailyCashFlow', 123, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (507, N'Transaction_DailyCashFlow', 124, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (508, N'Transaction_DailyCashFlow', 125, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (509, N'Transaction_DailyCashFlow', 126, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (510, N'Transaction_DailyCashFlow', 127, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (511, N'Transaction_DailyCashFlow', 128, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted: loans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (512, N'Transaction_DailyCashFlow', 129, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted: cbu/savings Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (513, N'Transaction_DailyCashFlow', 130, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted: reloans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (514, N'Transaction_DailyCashFlow', 131, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (515, N'Transaction_DailyCashFlow', 132, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (516, N'Transaction_DailyCashFlow', 133, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (517, N'Transaction_DailyCashFlow', 134, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (518, N'Transaction_DailyCashFlow', 135, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (519, N'Transaction_DailyCashFlow', 136, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (520, N'Transaction_DailyCashFlow', 137, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (521, N'Transaction_DailyCashFlow', 138, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (522, N'Transaction_DailyCashFlow', 139, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (523, N'Transaction_DailyCashFlow', 140, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (524, N'Transaction_DailyCashFlow', 141, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:43:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (525, N'Transaction_DailyCashFlow', 142, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted: loans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (526, N'Transaction_DailyCashFlow', 143, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted: cbu/savings Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (527, N'Transaction_DailyCashFlow', 144, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted: reloans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (528, N'Transaction_DailyCashFlow', 145, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (529, N'Transaction_DailyCashFlow', 146, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (530, N'Transaction_DailyCashFlow', 147, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (531, N'Transaction_DailyCashFlow', 148, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (532, N'Transaction_DailyCashFlow', 149, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (533, N'Transaction_DailyCashFlow', 150, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (534, N'Transaction_DailyCashFlow', 151, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (535, N'Transaction_DailyCashFlow', 152, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (536, N'Transaction_DailyCashFlow', 153, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (537, N'Transaction_DailyCashFlow', 154, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (538, N'Transaction_DailyCashFlow', 155, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (539, N'Transaction_DailyCashFlow', 156, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted: loans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (540, N'Transaction_DailyCashFlow', 157, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted: cbu/savings Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (541, N'Transaction_DailyCashFlow', 158, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted: reloans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (542, N'Transaction_DailyCashFlow', 159, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (543, N'Transaction_DailyCashFlow', 160, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (544, N'Transaction_DailyCashFlow', 161, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (545, N'Transaction_DailyCashFlow', 162, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (546, N'Transaction_DailyCashFlow', 163, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (547, N'Transaction_DailyCashFlow', 164, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (548, N'Transaction_DailyCashFlow', 165, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (549, N'Transaction_DailyCashFlow', 166, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (550, N'Transaction_DailyCashFlow', 167, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (551, N'Transaction_DailyCashFlow', 168, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (552, N'Transaction_DailyCashFlow', 169, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (553, N'Transaction_DailyCashFlow', 170, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted: loans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (554, N'Transaction_DailyCashFlow', 171, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted: cbu/savings Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (555, N'Transaction_DailyCashFlow', 172, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted: reloans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (556, N'Transaction_DailyCashFlow', 173, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (557, N'Transaction_DailyCashFlow', 174, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (558, N'Transaction_DailyCashFlow', 175, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (559, N'Transaction_DailyCashFlow', 176, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (560, N'Transaction_DailyCashFlow', 177, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (561, N'Transaction_DailyCashFlow', 178, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (562, N'Transaction_DailyCashFlow', 179, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (563, N'Transaction_DailyCashFlow', 180, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (564, N'Transaction_DailyCashFlow', 181, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (565, N'Transaction_DailyCashFlow', 182, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (566, N'Transaction_DailyCashFlow', 183, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'18:44:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (567, N'Transaction_DailyCashFlow', 184, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:16:00' AS Time), N'Inserted: loans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (568, N'Transaction_DailyCashFlow', 185, N'Insert', N'FABAYON', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:17:00' AS Time), N'Inserted: loans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (569, N'Transaction_DailyCashFlow', 186, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted: loans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (570, N'Transaction_DailyCashFlow', 187, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted: cbu/savings Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (571, N'Transaction_DailyCashFlow', 188, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted: reloans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (572, N'Transaction_DailyCashFlow', 189, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (573, N'Transaction_DailyCashFlow', 190, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (574, N'Transaction_DailyCashFlow', 191, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (575, N'Transaction_DailyCashFlow', 192, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (576, N'Transaction_DailyCashFlow', 193, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (577, N'Transaction_DailyCashFlow', 194, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (578, N'Transaction_DailyCashFlow', 195, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (579, N'Transaction_DailyCashFlow', 196, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (580, N'Transaction_DailyCashFlow', 197, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (581, N'Transaction_DailyCashFlow', 198, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (582, N'Transaction_DailyCashFlow', 199, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (583, N'Transaction_DailyCashFlow', 200, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted: loans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (584, N'Transaction_DailyCashFlow', 201, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted: cbu/savings Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (585, N'Transaction_DailyCashFlow', 202, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted: reloans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (586, N'Transaction_DailyCashFlow', 203, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (587, N'Transaction_DailyCashFlow', 204, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (588, N'Transaction_DailyCashFlow', 205, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (589, N'Transaction_DailyCashFlow', 206, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (590, N'Transaction_DailyCashFlow', 207, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (591, N'Transaction_DailyCashFlow', 208, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (592, N'Transaction_DailyCashFlow', 209, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (593, N'Transaction_DailyCashFlow', 210, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (594, N'Transaction_DailyCashFlow', 211, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (595, N'Transaction_DailyCashFlow', 212, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (596, N'Transaction_DailyCashFlow', 213, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (597, N'Transaction_DailyCashFlow', 214, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted: loans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (598, N'Transaction_DailyCashFlow', 215, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted: cbu/savings Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (599, N'Transaction_DailyCashFlow', 216, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted: reloans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (600, N'Transaction_DailyCashFlow', 217, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
GO
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (601, N'Transaction_DailyCashFlow', 218, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (602, N'Transaction_DailyCashFlow', 219, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (603, N'Transaction_DailyCashFlow', 220, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (604, N'Transaction_DailyCashFlow', 221, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (605, N'Transaction_DailyCashFlow', 222, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (606, N'Transaction_DailyCashFlow', 223, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (607, N'Transaction_DailyCashFlow', 224, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (608, N'Transaction_DailyCashFlow', 225, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (609, N'Transaction_DailyCashFlow', 226, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (610, N'Transaction_DailyCashFlow', 227, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (611, N'Transaction_DailyCashFlow', 228, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted: loans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (612, N'Transaction_DailyCashFlow', 229, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted: cbu/savings Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (613, N'Transaction_DailyCashFlow', 230, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted: reloans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (614, N'Transaction_DailyCashFlow', 231, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (615, N'Transaction_DailyCashFlow', 232, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (616, N'Transaction_DailyCashFlow', 233, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (617, N'Transaction_DailyCashFlow', 234, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (618, N'Transaction_DailyCashFlow', 235, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (619, N'Transaction_DailyCashFlow', 236, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (620, N'Transaction_DailyCashFlow', 237, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (621, N'Transaction_DailyCashFlow', 238, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (622, N'Transaction_DailyCashFlow', 239, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (623, N'Transaction_DailyCashFlow', 240, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (624, N'Transaction_DailyCashFlow', 241, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (625, N'Transaction_DailyCashFlow', 242, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted: loans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (626, N'Transaction_DailyCashFlow', 243, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted: cbu/savings Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (627, N'Transaction_DailyCashFlow', 244, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted: reloans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (628, N'Transaction_DailyCashFlow', 245, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (629, N'Transaction_DailyCashFlow', 246, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (630, N'Transaction_DailyCashFlow', 247, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (631, N'Transaction_DailyCashFlow', 248, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (632, N'Transaction_DailyCashFlow', 249, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (633, N'Transaction_DailyCashFlow', 250, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (634, N'Transaction_DailyCashFlow', 251, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (635, N'Transaction_DailyCashFlow', 252, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (636, N'Transaction_DailyCashFlow', 253, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (637, N'Transaction_DailyCashFlow', 254, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (638, N'Transaction_DailyCashFlow', 255, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (639, N'Transaction_DailyCashFlow', 256, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted: loans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (640, N'Transaction_DailyCashFlow', 257, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted: cbu/savings Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (641, N'Transaction_DailyCashFlow', 258, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted: reloans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (642, N'Transaction_DailyCashFlow', 259, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (643, N'Transaction_DailyCashFlow', 260, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (644, N'Transaction_DailyCashFlow', 261, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (645, N'Transaction_DailyCashFlow', 262, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (646, N'Transaction_DailyCashFlow', 263, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (647, N'Transaction_DailyCashFlow', 264, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (648, N'Transaction_DailyCashFlow', 265, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (649, N'Transaction_DailyCashFlow', 266, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (650, N'Transaction_DailyCashFlow', 267, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (651, N'Transaction_DailyCashFlow', 268, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (652, N'Transaction_DailyCashFlow', 269, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (653, N'Transaction_DailyCashFlow', 270, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted: loans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (654, N'Transaction_DailyCashFlow', 271, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted: cbu/savings Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (655, N'Transaction_DailyCashFlow', 272, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted: reloans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (656, N'Transaction_DailyCashFlow', 273, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (657, N'Transaction_DailyCashFlow', 274, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (658, N'Transaction_DailyCashFlow', 275, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (659, N'Transaction_DailyCashFlow', 276, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (660, N'Transaction_DailyCashFlow', 277, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (661, N'Transaction_DailyCashFlow', 278, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (662, N'Transaction_DailyCashFlow', 279, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (663, N'Transaction_DailyCashFlow', 280, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (664, N'Transaction_DailyCashFlow', 281, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (665, N'Transaction_DailyCashFlow', 282, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (666, N'Transaction_DailyCashFlow', 283, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (667, N'Transaction_DailyCashFlow', 284, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted: loans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (668, N'Transaction_DailyCashFlow', 285, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted: cbu/savings Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (669, N'Transaction_DailyCashFlow', 286, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted: reloans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (670, N'Transaction_DailyCashFlow', 287, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (671, N'Transaction_DailyCashFlow', 288, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (672, N'Transaction_DailyCashFlow', 289, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (673, N'Transaction_DailyCashFlow', 290, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (674, N'Transaction_DailyCashFlow', 291, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (675, N'Transaction_DailyCashFlow', 292, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (676, N'Transaction_DailyCashFlow', 293, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (677, N'Transaction_DailyCashFlow', 294, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (678, N'Transaction_DailyCashFlow', 295, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (679, N'Transaction_DailyCashFlow', 296, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (680, N'Transaction_DailyCashFlow', 297, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (681, N'Transaction_DailyCashFlow', 298, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted: loans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (682, N'Transaction_DailyCashFlow', 299, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted: cbu/savings Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (683, N'Transaction_DailyCashFlow', 300, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted: reloans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (684, N'Transaction_DailyCashFlow', 301, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (685, N'Transaction_DailyCashFlow', 302, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (686, N'Transaction_DailyCashFlow', 303, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (687, N'Transaction_DailyCashFlow', 304, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (688, N'Transaction_DailyCashFlow', 305, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (689, N'Transaction_DailyCashFlow', 306, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (690, N'Transaction_DailyCashFlow', 307, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (691, N'Transaction_DailyCashFlow', 308, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (692, N'Transaction_DailyCashFlow', 309, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (693, N'Transaction_DailyCashFlow', 310, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (694, N'Transaction_DailyCashFlow', 311, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (695, N'Transaction_DailyCashFlow', 312, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted: loans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (696, N'Transaction_DailyCashFlow', 313, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted: cbu/savings Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (697, N'Transaction_DailyCashFlow', 314, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted: reloans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (698, N'Transaction_DailyCashFlow', 315, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (699, N'Transaction_DailyCashFlow', 316, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (700, N'Transaction_DailyCashFlow', 317, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
GO
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (701, N'Transaction_DailyCashFlow', 318, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (702, N'Transaction_DailyCashFlow', 319, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (703, N'Transaction_DailyCashFlow', 320, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (704, N'Transaction_DailyCashFlow', 321, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (705, N'Transaction_DailyCashFlow', 322, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (706, N'Transaction_DailyCashFlow', 323, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (707, N'Transaction_DailyCashFlow', 324, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (708, N'Transaction_DailyCashFlow', 325, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (709, N'Transaction_DailyCashFlow', 326, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted: loans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (710, N'Transaction_DailyCashFlow', 327, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted: cbu/savings Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (711, N'Transaction_DailyCashFlow', 328, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted: reloans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (712, N'Transaction_DailyCashFlow', 329, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (713, N'Transaction_DailyCashFlow', 330, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (714, N'Transaction_DailyCashFlow', 331, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (715, N'Transaction_DailyCashFlow', 332, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (716, N'Transaction_DailyCashFlow', 333, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (717, N'Transaction_DailyCashFlow', 334, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (718, N'Transaction_DailyCashFlow', 335, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (719, N'Transaction_DailyCashFlow', 336, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (720, N'Transaction_DailyCashFlow', 337, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (721, N'Transaction_DailyCashFlow', 338, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (722, N'Transaction_DailyCashFlow', 339, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (723, N'Transaction_DailyCashFlow', 340, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted: loans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (724, N'Transaction_DailyCashFlow', 341, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted: cbu/savings Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (725, N'Transaction_DailyCashFlow', 342, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted: reloans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (726, N'Transaction_DailyCashFlow', 343, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (727, N'Transaction_DailyCashFlow', 344, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (728, N'Transaction_DailyCashFlow', 345, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (729, N'Transaction_DailyCashFlow', 346, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (730, N'Transaction_DailyCashFlow', 347, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (731, N'Transaction_DailyCashFlow', 348, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (732, N'Transaction_DailyCashFlow', 349, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (733, N'Transaction_DailyCashFlow', 350, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (734, N'Transaction_DailyCashFlow', 351, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (735, N'Transaction_DailyCashFlow', 352, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (736, N'Transaction_DailyCashFlow', 353, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:32:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (737, N'Transaction_DailyCashFlow', 354, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:33:00' AS Time), N'Inserted: loans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (738, N'Transaction_DailyCashFlow', 355, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:33:00' AS Time), N'Inserted: cbu/savings Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (739, N'Transaction_DailyCashFlow', 356, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:33:00' AS Time), N'Inserted: reloans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (740, N'Transaction_DailyCashFlow', 357, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:33:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (741, N'Transaction_DailyCashFlow', 358, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:33:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (742, N'Transaction_DailyCashFlow', 359, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:33:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (743, N'Transaction_DailyCashFlow', 360, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:33:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (744, N'Transaction_DailyCashFlow', 361, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:33:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (745, N'Transaction_DailyCashFlow', 362, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:33:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (746, N'Transaction_DailyCashFlow', 363, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:33:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (747, N'Transaction_DailyCashFlow', 364, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:33:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (748, N'Transaction_DailyCashFlow', 365, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:33:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (749, N'Transaction_DailyCashFlow', 366, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:33:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (750, N'Transaction_DailyCashFlow', 367, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:33:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (751, N'Transaction_DailyCashFlow', 368, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:33:00' AS Time), N'Inserted: loans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (752, N'Transaction_DailyCashFlow', 369, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:33:00' AS Time), N'Inserted: cbu/savings Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (753, N'Transaction_DailyCashFlow', 370, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:33:00' AS Time), N'Inserted: reloans Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (754, N'Transaction_DailyCashFlow', 371, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:33:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (755, N'Transaction_DailyCashFlow', 372, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:33:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (756, N'Transaction_DailyCashFlow', 373, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:33:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (757, N'Transaction_DailyCashFlow', 374, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:33:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (758, N'Transaction_DailyCashFlow', 375, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:33:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (759, N'Transaction_DailyCashFlow', 376, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:33:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (760, N'Transaction_DailyCashFlow', 377, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:33:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (761, N'Transaction_DailyCashFlow', 378, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:33:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (762, N'Transaction_DailyCashFlow', 379, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:33:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (763, N'Transaction_DailyCashFlow', 380, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:33:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (764, N'Transaction_DailyCashFlow', 381, N'Insert', N'PATO', 3, CAST(N'2018-08-29' AS Date), CAST(N'20:33:00' AS Time), N'Inserted:  Daily Cashflow by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (765, N'Masterfile_Branch', 132, N'Insert', N'PATO', 1, CAST(N'2018-08-30' AS Date), CAST(N'09:36:00' AS Time), N'Inserted: Cebu City 6 Branch by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (766, N'Masterfile_Branch', 1, N'Update', N'PATO', 2, CAST(N'2018-08-30' AS Date), CAST(N'09:43:00' AS Time), N'Updated: Branch Name From[Kamote] To[Kamote], Area Id From[2] To[2], Address From[Que To[Que], Latitude From[12.123000] To[12.123000], Longitude From[12.123123] To[12.123123], and Remarks From[asdasd] To[asdasd] on Branch by sad')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (767, N'Transaction_BudgetPreparation', 23, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-30' AS Date), CAST(N'15:19:00' AS Time), N'Inserted: Generated via API Budget Preparation by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (768, N'Transaction_BudgetPreparationDetail', 275, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-30' AS Date), CAST(N'16:15:00' AS Time), N'Deleted: BudgetPreparationdetailId [275] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (769, N'Transaction_BudgetPreparationDetail', 280, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-30' AS Date), CAST(N'16:15:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (770, N'Transaction_BudgetPreparationDetail', 276, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-30' AS Date), CAST(N'16:15:00' AS Time), N'Deleted: BudgetPreparationdetailId [276] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (771, N'Transaction_BudgetPreparationDetail', 281, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-30' AS Date), CAST(N'16:15:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (772, N'Transaction_BudgetPreparationDetail', 277, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-30' AS Date), CAST(N'16:15:00' AS Time), N'Deleted: BudgetPreparationdetailId [277] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (773, N'Transaction_BudgetPreparationDetail', 282, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-30' AS Date), CAST(N'16:15:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (774, N'Transaction_BudgetPreparationDetail', 278, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-30' AS Date), CAST(N'16:15:00' AS Time), N'Deleted: BudgetPreparationdetailId [278] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (775, N'Transaction_BudgetPreparationDetail', 283, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-30' AS Date), CAST(N'16:15:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (776, N'Transaction_BudgetPreparationDetail', 279, N'Delete', N'RMF-INTERN3', 3, CAST(N'2018-08-30' AS Date), CAST(N'16:15:00' AS Time), N'Deleted: BudgetPreparationdetailId [279] by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (777, N'Transaction_BudgetPreparationDetail', 284, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-30' AS Date), CAST(N'16:15:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (778, N'Transaction_BudgetPreparationDetail', 285, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-30' AS Date), CAST(N'16:15:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (779, N'Transaction_BudgetPreparationDetail', 286, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-30' AS Date), CAST(N'16:15:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (780, N'Transaction_BudgetPreparationDetail', 287, N'Insert', N'RMF-INTERN3', 3, CAST(N'2018-08-30' AS Date), CAST(N'16:15:00' AS Time), N'Inserted: Generated via API Budget Preparation Detail by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (781, N'Transaction_BudgetPreparation', 24, N'Insert', N'JPLARISAN2', 2, CAST(N'2018-08-31' AS Date), CAST(N'11:48:00' AS Time), N'Inserted: Generated via API Budget Preparation by sad')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (782, N'Masterfile_Region', 18, N'Insert', N'FABAYON', 3, CAST(N'2018-08-31' AS Date), CAST(N'15:12:00' AS Time), N'Inserted: 1 by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (783, N'Masterfile_Region', 18, N'Delete', N'FABAYON', 3, CAST(N'2018-08-31' AS Date), CAST(N'15:13:00' AS Time), N'Deleted: 1 by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (784, N'Masterfile_Channel', 6, N'Update', N'FABAYON', 6, CAST(N'2018-08-31' AS Date), CAST(N'15:37:00' AS Time), NULL)
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (785, N'Masterfile_Area', 19, N'Insert', N'JPLARISAN2', 1, CAST(N'2018-09-04' AS Date), CAST(N'11:19:00' AS Time), N'Inserted Tagbilaran 1 Area by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (786, N'Masterfile_Area', 20, N'Insert', N'FABAYON', 3, CAST(N'2018-09-04' AS Date), CAST(N'11:21:00' AS Time), N'Inserted Poblacion Area by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (787, N'Masterfile_Area', 21, N'Insert', N'FABAYON', 3, CAST(N'2018-09-04' AS Date), CAST(N'11:22:00' AS Time), N'Inserted test Area by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (788, N'Masterfile_Area', 22, N'Insert', N'JPLARISAN2', 1, CAST(N'2018-09-04' AS Date), CAST(N'11:26:00' AS Time), N'Inserted AREA 1 CO Area by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (789, N'Masterfile_Area', 23, N'Insert', N'JPLARISAN2', 1, CAST(N'2018-09-04' AS Date), CAST(N'11:28:00' AS Time), N'Inserted BOHOL Area by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (790, N'Masterfile_Area', 24, N'Insert', N'JPLARISAN2', 1, CAST(N'2018-09-04' AS Date), CAST(N'11:29:00' AS Time), N'Inserted CEBU NORTH Area by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (791, N'Masterfile_Area', 25, N'Insert', N'JPLARISAN2', 1, CAST(N'2018-09-04' AS Date), CAST(N'11:29:00' AS Time), N'Inserted CEBU SOUTH Area by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (792, N'Masterfile_Area', 26, N'Insert', N'JPLARISAN2', 1, CAST(N'2018-09-04' AS Date), CAST(N'11:29:00' AS Time), N'Inserted Ilo-ilo Area by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (793, N'Masterfile_Area', 27, N'Insert', N'JPLARISAN2', 1, CAST(N'2018-09-04' AS Date), CAST(N'11:29:00' AS Time), N'Inserted LEYTE 1 & cAMOTES AREA Area by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (794, N'Masterfile_Area', 28, N'Insert', N'JPLARISAN2', 1, CAST(N'2018-09-04' AS Date), CAST(N'11:29:00' AS Time), N'Inserted lEYTE 2 Area by ec')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (795, N'Masterfile_Region', 4, N'Update', N'FABAYON', 3, CAST(N'2018-09-04' AS Date), CAST(N'13:12:00' AS Time), N'Updated: Region Name From[Cagayan Valley (Region II)] To[], and Remarks From[Luzon] To[Luzon] on Region by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (796, N'Masterfile_Region', 4, N'Update', N'FABAYON', 3, CAST(N'2018-09-04' AS Date), CAST(N'13:46:00' AS Time), N'Updated: Region Name From[] To[], and Remarks From[Luzon] To[Luzon] on Region by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (797, N'Masterfile_Region', 4, N'Update', N'FABAYON', 3, CAST(N'2018-09-04' AS Date), CAST(N'13:50:00' AS Time), N'Updated: Region Name From[] To[], and Remarks From[Luzon] To[Luzon] on Region by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (798, N'Masterfile_Region', 4, N'Update', N'FABAYON', 3, CAST(N'2018-09-04' AS Date), CAST(N'13:50:00' AS Time), N'Updated: Region Name From[] To[], and Remarks From[Luzon] To[Luzon] on Region by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (799, N'Masterfile_Region', 19, N'Insert', N'FABAYON', 3, CAST(N'2018-09-04' AS Date), CAST(N'13:55:00' AS Time), N'Inserted: test by esci')
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (800, N'Masterfile_Region', 19, N'Update', N'FABAYON', 3, CAST(N'2018-09-04' AS Date), CAST(N'14:03:00' AS Time), N'Updated: Region Name From[test] To[tested], and Remarks From[none] To[asd] on Region by esci')
GO
INSERT [dbo].[Audit_Trail] ([Id], [TableName], [TableId], [Action], [ComputerName], [Contributer], [DateExecuted], [TimeExecuted], [Description]) VALUES (801, N'Masterfile_Region', 19, N'Update', N'FABAYON', 3, CAST(N'2018-09-04' AS Date), CAST(N'14:05:00' AS Time), N'Updated: Region Name From[tested] To[test], and Remarks From[asd] To[tempo] on Region by esci')
INSERT [dbo].[dummytable] ([APIName], [Date], [Type], [Amount]) VALUES (N'getBudgetPreparationInflowCollections', CAST(N'2018-09-01' AS Date), N'Loan           ', CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[dummytable] ([APIName], [Date], [Type], [Amount]) VALUES (N'getBudgetPreparationInflowCollections', CAST(N'2018-09-01' AS Date), N'CBU/Savings    ', CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (1, 1, 1, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (2, 1, 2, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (3, 1, 3, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (4, 1, 4, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (5, 1, 5, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (6, 1, 6, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (7, 1, 7, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (8, 1, 8, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (9, 1, 9, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (10, 1, 10, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (11, 1, 11, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (12, 1, 12, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (13, 1, 13, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (14, 1, 14, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (15, 1, 15, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (16, 1, 16, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (17, 1, 17, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (18, 1, 18, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (19, 1, 19, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (20, 1, 20, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (21, 1, 21, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (22, 1, 22, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (23, 1, 23, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (24, 1, 24, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (25, 1, 25, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (26, 1, 26, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (27, 1, 27, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (28, 1, 28, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (29, 1, 29, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (30, 1, 30, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (31, 1, 31, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (32, 1, 32, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (33, 1, 33, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (34, 1, 34, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (35, 1, 35, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (36, 1, 36, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (37, 1, 37, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (38, 1, 38, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (39, 1, 39, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (40, 1, 40, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (41, 1, 41, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (42, 1, 42, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (43, 1, 43, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (44, 1, 44, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (45, 1, 45, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (46, 1, 46, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (47, 1, 47, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (48, 1, 48, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (49, 1, 49, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (50, 1, 50, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (51, 1, 51, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (52, 1, 52, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (53, 1, 53, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (54, 1, 54, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (55, 1, 55, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (56, 1, 56, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (57, 1, 57, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (58, 1, 58, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (59, 1, 59, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (60, 1, 60, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (61, 1, 61, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (62, 1, 62, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (63, 1, 63, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (64, 1, 64, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (65, 1, 65, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (66, 1, 66, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (67, 1, 67, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (68, 2, 1, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (69, 2, 2, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (70, 2, 3, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (71, 2, 4, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (72, 2, 5, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (73, 2, 6, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (74, 2, 7, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (75, 2, 8, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (76, 2, 9, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (77, 2, 10, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (78, 2, 11, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (79, 2, 12, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (80, 2, 13, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (81, 2, 14, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (82, 2, 15, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (83, 2, 16, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (84, 2, 17, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (85, 2, 18, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (86, 2, 19, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (87, 2, 20, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (88, 2, 21, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (89, 2, 22, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (90, 2, 23, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (91, 2, 24, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (92, 2, 25, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (93, 2, 26, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (94, 2, 27, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (95, 2, 28, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (96, 2, 29, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (97, 2, 30, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (98, 2, 31, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (99, 2, 32, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (100, 2, 33, 1)
GO
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (101, 2, 34, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (102, 2, 35, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (103, 2, 36, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (104, 2, 37, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (105, 2, 38, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (106, 2, 39, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (107, 2, 40, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (108, 2, 41, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (109, 2, 42, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (110, 2, 43, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (111, 2, 44, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (112, 2, 45, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (113, 2, 46, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (114, 2, 47, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (115, 2, 48, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (116, 2, 49, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (117, 2, 50, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (118, 2, 51, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (119, 2, 52, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (120, 2, 53, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (121, 2, 54, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (122, 2, 55, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (123, 2, 56, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (124, 2, 57, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (125, 2, 58, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (126, 2, 59, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (127, 2, 60, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (128, 2, 61, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (129, 2, 62, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (130, 2, 63, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (131, 2, 64, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (132, 2, 65, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (133, 2, 66, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (134, 2, 67, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (135, 3, 1, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (136, 3, 2, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (137, 3, 3, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (138, 3, 4, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (139, 3, 5, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (140, 3, 5, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (141, 3, 6, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (142, 3, 7, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (143, 3, 8, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (144, 3, 9, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (145, 3, 10, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (146, 3, 11, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (147, 3, 12, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (148, 3, 13, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (149, 3, 14, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (150, 3, 15, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (151, 3, 16, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (152, 3, 17, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (153, 3, 18, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (154, 3, 19, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (155, 3, 20, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (156, 3, 21, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (157, 3, 22, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (158, 3, 23, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (159, 3, 24, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (160, 3, 25, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (161, 3, 26, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (162, 3, 27, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (163, 3, 28, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (164, 3, 29, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (165, 3, 30, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (166, 3, 31, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (167, 3, 32, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (168, 3, 33, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (169, 3, 34, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (170, 3, 35, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (171, 3, 36, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (172, 3, 37, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (173, 3, 38, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (174, 3, 39, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (175, 3, 40, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (176, 3, 41, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (177, 3, 42, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (178, 3, 43, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (179, 3, 44, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (180, 3, 45, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (181, 3, 46, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (182, 3, 47, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (183, 3, 48, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (184, 3, 49, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (185, 3, 50, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (186, 3, 51, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (187, 3, 52, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (188, 3, 53, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (189, 3, 54, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (190, 3, 55, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (191, 3, 56, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (192, 3, 57, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (193, 3, 58, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (194, 3, 59, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (195, 3, 60, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (196, 3, 61, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (197, 3, 62, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (198, 3, 63, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (199, 3, 64, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (200, 3, 65, 0)
GO
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (201, 3, 66, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (202, 3, 67, 0)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (203, 4, 1, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (204, 4, 2, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (205, 4, 3, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (206, 4, 4, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (207, 4, 5, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (208, 4, 6, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (209, 4, 7, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (210, 4, 8, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (211, 4, 9, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (212, 4, 10, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (213, 4, 11, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (214, 4, 12, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (215, 4, 13, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (216, 4, 14, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (217, 4, 15, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (218, 4, 16, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (219, 4, 17, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (220, 4, 18, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (221, 4, 19, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (222, 4, 20, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (223, 4, 21, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (224, 4, 22, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (225, 4, 23, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (226, 4, 24, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (227, 4, 25, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (228, 4, 26, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (229, 4, 27, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (230, 4, 28, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (231, 4, 29, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (232, 4, 30, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (233, 4, 31, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (234, 4, 32, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (235, 4, 33, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (236, 4, 34, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (237, 4, 35, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (238, 4, 36, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (239, 4, 37, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (240, 4, 38, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (241, 4, 39, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (242, 4, 40, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (243, 4, 41, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (244, 4, 42, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (245, 4, 43, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (246, 4, 44, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (247, 4, 45, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (248, 4, 46, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (249, 4, 47, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (250, 4, 48, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (251, 4, 49, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (252, 4, 50, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (253, 4, 51, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (254, 4, 52, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (255, 4, 53, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (256, 4, 54, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (257, 4, 55, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (258, 4, 56, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (259, 4, 57, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (260, 4, 58, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (261, 4, 59, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (262, 4, 60, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (263, 4, 61, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (264, 4, 62, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (265, 4, 63, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (266, 4, 64, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (267, 4, 65, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (268, 4, 66, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (269, 4, 67, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (270, 6, 1, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (271, 6, 2, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (272, 6, 3, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (273, 6, 4, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (274, 6, 5, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (275, 6, 6, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (276, 6, 8, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (277, 6, 10, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (278, 6, 16, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (279, 6, 76, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (280, 6, 74, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (281, 6, 75, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (282, 6, 68, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (283, 6, 62, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (284, 2, 77, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (285, 2, 78, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (286, 2, 79, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (287, 2, 80, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (288, 2, 68, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (289, 2, 69, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (290, 2, 70, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (291, 2, 71, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (292, 2, 72, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (293, 2, 73, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (294, 2, 74, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (295, 2, 75, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [SystemRightsId], [IsChecked]) VALUES (296, 2, 76, 1)
INSERT [dbo].[Masterfile_Area] ([Id], [Name], [DistrictId], [Remarks], [Status]) VALUES (1, N'Cebu 1', 1, N'', 1)
INSERT [dbo].[Masterfile_Area] ([Id], [Name], [DistrictId], [Remarks], [Status]) VALUES (2, N'Cebu 2', 1, N'', 1)
INSERT [dbo].[Masterfile_Area] ([Id], [Name], [DistrictId], [Remarks], [Status]) VALUES (3, N'Cebu 3', 1, N'', 1)
INSERT [dbo].[Masterfile_Area] ([Id], [Name], [DistrictId], [Remarks], [Status]) VALUES (4, N'Cebu 4', 1, N'', 1)
INSERT [dbo].[Masterfile_Area] ([Id], [Name], [DistrictId], [Remarks], [Status]) VALUES (5, N'Bohol 1', 2, N'', 1)
INSERT [dbo].[Masterfile_Area] ([Id], [Name], [DistrictId], [Remarks], [Status]) VALUES (6, N'Bohol 2', 2, N'', 1)
INSERT [dbo].[Masterfile_Area] ([Id], [Name], [DistrictId], [Remarks], [Status]) VALUES (7, N'Bohol 3', 2, N'', 1)
INSERT [dbo].[Masterfile_Area] ([Id], [Name], [DistrictId], [Remarks], [Status]) VALUES (8, N'Iloilo', 3, N' ', 1)
INSERT [dbo].[Masterfile_Area] ([Id], [Name], [DistrictId], [Remarks], [Status]) VALUES (9, N'Leyte 1', 4, N' ', 1)
INSERT [dbo].[Masterfile_Area] ([Id], [Name], [DistrictId], [Remarks], [Status]) VALUES (10, N'Leyte 2', 4, N' ', 0)
INSERT [dbo].[Masterfile_Area] ([Id], [Name], [DistrictId], [Remarks], [Status]) VALUES (11, N'Leyte 3', 4, N' ', 0)
INSERT [dbo].[Masterfile_Area] ([Id], [Name], [DistrictId], [Remarks], [Status]) VALUES (12, N'Leyte 4', 4, N' ', 1)
INSERT [dbo].[Masterfile_Area] ([Id], [Name], [DistrictId], [Remarks], [Status]) VALUES (13, N'Samar 1', 5, N' ', 1)
INSERT [dbo].[Masterfile_Area] ([Id], [Name], [DistrictId], [Remarks], [Status]) VALUES (14, N'Negros 1', 6, N' ', 1)
INSERT [dbo].[Masterfile_Area] ([Id], [Name], [DistrictId], [Remarks], [Status]) VALUES (15, N'Negros 2', 6, N' ', 1)
INSERT [dbo].[Masterfile_Area] ([Id], [Name], [DistrictId], [Remarks], [Status]) VALUES (16, N'Negros 3', 6, N' ', 1)
INSERT [dbo].[Masterfile_Area] ([Id], [Name], [DistrictId], [Remarks], [Status]) VALUES (17, N'Bohol 4', 2, N'Added remaks', 1)
INSERT [dbo].[Masterfile_Area] ([Id], [Name], [DistrictId], [Remarks], [Status]) VALUES (18, N'Poblacion3', 1, N'', 0)
INSERT [dbo].[Masterfile_Area] ([Id], [Name], [DistrictId], [Remarks], [Status]) VALUES (19, N'Tagbilaran 1', 1, N'', 1)
INSERT [dbo].[Masterfile_Area] ([Id], [Name], [DistrictId], [Remarks], [Status]) VALUES (20, N'Poblacion', 1, N'', 1)
INSERT [dbo].[Masterfile_Area] ([Id], [Name], [DistrictId], [Remarks], [Status]) VALUES (21, N'test', 3, N'', 1)
INSERT [dbo].[Masterfile_Area] ([Id], [Name], [DistrictId], [Remarks], [Status]) VALUES (22, N'AREA 1 CO', 1, N'', 1)
INSERT [dbo].[Masterfile_Area] ([Id], [Name], [DistrictId], [Remarks], [Status]) VALUES (23, N'BOHOL', 1, N'', 1)
INSERT [dbo].[Masterfile_Area] ([Id], [Name], [DistrictId], [Remarks], [Status]) VALUES (24, N'CEBU NORTH', 1, N'', 1)
INSERT [dbo].[Masterfile_Area] ([Id], [Name], [DistrictId], [Remarks], [Status]) VALUES (25, N'CEBU SOUTH', 1, N'', 1)
INSERT [dbo].[Masterfile_Area] ([Id], [Name], [DistrictId], [Remarks], [Status]) VALUES (26, N'Ilo-ilo', 1, N'', 1)
INSERT [dbo].[Masterfile_Area] ([Id], [Name], [DistrictId], [Remarks], [Status]) VALUES (27, N'LEYTE 1 & cAMOTES AREA', 1, N'', 1)
INSERT [dbo].[Masterfile_Area] ([Id], [Name], [DistrictId], [Remarks], [Status]) VALUES (28, N'lEYTE 2', 1, N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (1, N'003', N'resample', 1, N'sample', CAST(12.123000 AS Decimal(8, 6)), CAST(12.123123 AS Decimal(9, 6)), N'sample', 0)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (2, N'004', N'PALOMPON', 1, N'Taft Street, Central 1, Palompon, Leyte', CAST(11.051504 AS Decimal(8, 6)), CAST(124.387619 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (3, N'001', N'mary', 1, N'sample', CAST(12.112100 AS Decimal(8, 6)), CAST(12.123000 AS Decimal(9, 6)), N'sample', 0)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (4, N'003', N'SIBONGA', 4, N'addsdasd', CAST(12.100000 AS Decimal(8, 6)), CAST(12.100000 AS Decimal(9, 6)), N'assd', 0)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (5, N'1234', N'sadasdasdasdasdasdasd', 1, N'sad', CAST(10.100000 AS Decimal(8, 6)), CAST(10.100000 AS Decimal(9, 6)), N'', 0)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (6, N'1231', N'sadasd', 1, N'sadasd', CAST(10.100000 AS Decimal(8, 6)), CAST(10.100000 AS Decimal(9, 6)), N'', 0)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (7, N'036', N'ABUYOG', 1, N'Abuyog Leyte', CAST(10.746761 AS Decimal(8, 6)), CAST(125.010797 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (8, N'061', N'ALANG-ALANG', 1, N'Alang-alang Leyte', CAST(11.206273 AS Decimal(8, 6)), CAST(124.848479 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (9, N'087', N'ALICIA', 1, N'Alicia Bohol', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (10, N'002', N'ARGAO', 1, N'Baha-baha Tulic, National Highway, Argao, Cebu', CAST(9.872480 AS Decimal(8, 6)), CAST(123.596208 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (11, N'026', N'ASTURIAS', 1, N'E Alonzo St., Poblacion Asturias', CAST(10.568154 AS Decimal(8, 6)), CAST(123.716951 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (12, N'059', N'BACOLOD', 1, N'Bacolod, Negros Occidental', CAST(10.668371 AS Decimal(8, 6)), CAST(122.958310 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (13, N'075', N'BAGO', 1, N'Bago City, Negros Occidental', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (14, N'033', N'BAIS', 1, N'Bais dumaguete', CAST(9.591839 AS Decimal(8, 6)), CAST(123.120945 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (15, N'081', N'BALAMBAN', 1, N'E Alonzo St., Poblacion Asturias, Cebu', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (16, N'008', N'BANTAYAN', 1, N'Binaobao Bantayan Island, Cebu', CAST(11.169278 AS Decimal(8, 6)), CAST(123.717545 AS Decimal(9, 6)), N'', 0)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (17, N'057', N'BARILI', 1, N'Barili, Cebu', CAST(10.115793 AS Decimal(8, 6)), CAST(123.507895 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (18, N'113', N'BAROTAC NUEVO', 1, N'Barotac Nuevo Ilo-Ilo', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (19, N'114', N'BAROTAC VIEJO', 1, N'Barotac Viejo Ilo-Ilo', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (20, N'067', N'BARUGO', 1, N'San Miguel, Leyte', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (21, N'103', N'BASEY', 1, N'Basey Samar', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (22, N'019', N'BATO', 1, N'Lopez Jaena St., Tinago, Bato, Leyte', CAST(10.324720 AS Decimal(8, 6)), CAST(124.790719 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (23, N'045', N'BAYAWAN', 1, N'Bayawan Negros', CAST(9.364387 AS Decimal(8, 6)), CAST(122.806549 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (24, N'022', N'BAYBAY', 1, N'30 de Diciembre St., Baybay City, Leyte', CAST(10.671137 AS Decimal(8, 6)), CAST(124.805706 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (25, N'107', N'BAYBAY 2', 1, N'Baybay city, Leyte', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (26, N'090', N'BINALBAGAN', 1, N'Binalbagan Negros', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (27, N'006', N'BOGO', 1, N'Door 1 North Homes Pensione House, Pelaez Street, Bogo City, Cebu', CAST(11.051645 AS Decimal(8, 6)), CAST(124.007815 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (28, N'082', N'BORBON', 1, N'Borbon Cebu', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (29, N'888', N'BUFFER BRANCH', 1, N'Spratley Island', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (30, N'071', N'BURAUEN-LEYTE', 1, N'Dagami, Leyte', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (31, N'054', N'CADIZ', 1, N'Cadiz, Negros Occidental', CAST(10.955448 AS Decimal(8, 6)), CAST(123.303625 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (32, N'079', N'CADIZ 2', 1, N'juan luna st., querosan, brgy. zone 4, cadiz city', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (33, N'089', N'CALAPE', 1, N'Calape Bohol', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (34, N'101', N'CALBAYOG', 1, N'Calbayog Samar', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (35, N'009', N'CAMOTES', 1, N'Eastern Poblacion, Poro Camotes, Cebu', CAST(10.702887 AS Decimal(8, 6)), CAST(124.412323 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (36, N'051', N'CANLAON', 1, N'Canlaon Negros', CAST(10.379782 AS Decimal(8, 6)), CAST(123.234716 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (37, N'085', N'CAPOOCAN ', 1, N'Capoocan  Leyte', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (38, N'015', N'CARIGARA', 1, N'Corner Real & Esperanza St. Brgy. Baybay, Carigara, Leyte', CAST(11.300674 AS Decimal(8, 6)), CAST(124.690376 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (39, N'012', N'CARMEN', 1, N'Old Municipal Building Poblacion Sur, Carmen, Bohol', CAST(9.822743 AS Decimal(8, 6)), CAST(124.196567 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (40, N'100', N'Catarman', 1, N'Catarman Samar', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (41, N'102', N'CATBALOGAN', 1, N'Catbalogan Samar', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (42, N'074', N'CATIGBIAN', 1, N'Catigbian, Bohol', CAST(9.850096 AS Decimal(8, 6)), CAST(123.998986 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (43, N'095', N'CAUAYAN', 1, N'Cauayan Negros', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (44, N'005', N'CEBU CITY', 1, N'Bonifacio St., Cebu City', CAST(10.300401 AS Decimal(8, 6)), CAST(123.904044 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (45, N'068', N'CEBU CITY 2', 1, N'bonifacio St., ', CAST(10.300401 AS Decimal(8, 6)), CAST(123.904044 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (46, N'069', N'CEBU CITY 3', 1, N'Bonifacio St., ', CAST(10.300358 AS Decimal(8, 6)), CAST(123.904076 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (47, N'041', N'CLARIN', 1, N'Clarin Bohol', CAST(9.960274 AS Decimal(8, 6)), CAST(124.023689 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (48, N'056', N'COMPOSTELA', 1, N'compostela, Cebu', CAST(10.454644 AS Decimal(8, 6)), CAST(124.013302 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (49, N'055', N'CONSOLACION', 1, N'Consolacion, Cebu', CAST(10.380398 AS Decimal(8, 6)), CAST(123.967489 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (50, N'039', N'DAAN BANTAYAN', 1, N'Daan Bantayan cebu', CAST(11.248216 AS Decimal(8, 6)), CAST(124.005354 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (51, N'065', N'DALAGUETE', 1, N'dalaguete, cebu', CAST(9.760017 AS Decimal(8, 6)), CAST(123.533401 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (52, N'020', N'DANAO', 1, N'Poblacion, Danao, Cebu', CAST(10.522425 AS Decimal(8, 6)), CAST(124.028055 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (53, N'097', N'DIMIAO', 1, N'Dimiao Bohol', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (54, N'013', N'DULAG', 1, N'Dulag, Leyte', CAST(10.959203 AS Decimal(8, 6)), CAST(125.006313 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (55, N'084', N'DULAG 2', 1, N'Dulag, Leyte', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (56, N'048', N'DUMAGUETE', 1, N'Dumaguete Negros Oriental', CAST(9.276987 AS Decimal(8, 6)), CAST(123.293113 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (57, N'007', N'DUMANJUG', 1, N' Zelliot Bldg., Poblacion, Dumanjug, Cebu', CAST(10.056791 AS Decimal(8, 6)), CAST(123.437385 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (58, N'053', N'ESCALANTE', 1, N'Escalante, Negros Occidental', CAST(10.838532 AS Decimal(8, 6)), CAST(123.503842 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (59, N'088', N'GETAFE', 1, N'Getafe Bohol', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (60, N'050', N'GUIHULNGAN', 1, N'Guihulngan Negros Oriental ', CAST(10.115931 AS Decimal(8, 6)), CAST(123.269668 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (61, N'035', N'GUINDULMAN', 1, N'Guindulman Bohol', CAST(9.765547 AS Decimal(8, 6)), CAST(124.492817 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (62, N'000', N'HEAD OFFICE', 1, N'35 Lopez Jaena Street, CEBU City', CAST(10.299698 AS Decimal(8, 6)), CAST(123.904779 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (63, N'118', N'HILONGOS', 1, N'Corner CV Alcuino St and Flores St., Central Poblacion, Hilongos, Leyte', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (64, N'092', N'HIMAMAYLAN ', 1, N'Himamaylan Negros', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (65, N'091', N'HINIGARAN', 1, N'Hinigaran Negros', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (66, N'120', N'HINUNANGAN', 1, N'Brgy. Poblacion, Hinunangan, Southern Leyte', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (67, N'034', N'INABANGA', 1, N'Inabanga bohol', CAST(10.032018 AS Decimal(8, 6)), CAST(124.067207 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (68, N'025', N'JAGNA', 1, N'103 Captain Goyo Casenas St. Poblacion Jagna, Bohol', CAST(9.651227 AS Decimal(8, 6)), CAST(124.367862 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (69, N'049', N'JIMALALUD', 1, N'Jimalalud Negros Oriental', CAST(9.980195 AS Decimal(8, 6)), CAST(123.201310 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (70, N'093', N'KABANKALAN', 1, N'Kabankalan Negros', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (71, N'076', N'LA CARLOTA', 1, N'La Carlota City, Negros Occidental, Western Visayas', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (72, N'037', N'LAPU-LAPU', 1, N'Lapu-lapu', CAST(10.292440 AS Decimal(8, 6)), CAST(123.966311 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (73, N'115', N'LEGANES', 1, N'Leganes Ilo-Ilo', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (74, N'063', N'LILOAN-LEYTE', 1, N'liloan, so. leyte', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (75, N'044', N'LOAY', 1, N'Loay Bohol', CAST(9.614648 AS Decimal(8, 6)), CAST(124.022916 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (76, N'043', N'LOON', 1, N'Loon BOHOL', CAST(9.795920 AS Decimal(8, 6)), CAST(123.791820 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (77, N'072', N'MAASIN-LEYTE', 1, N'Maasin City, Leyte', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (78, N'094', N'MABINAY', 1, N'Mabinay Negros', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (79, N'029', N'MANDAUE', 1, N'Square One Commercial Complex, Second Floor, Tipolo, Mandaue City. ', CAST(10.325615 AS Decimal(8, 6)), CAST(123.926519 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (80, N'077', N'McArthur', 1, N'McArthurLeyte', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (81, N'108', N'MIAG-AO', 1, N'Miag-Ao ilo-ilo', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (82, N'080', N'MINGLANILLA', 1, N'Minglanilla Cebu', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (83, N'032', N'MOALBOAL', 1, N'Moalboal', CAST(9.935662 AS Decimal(8, 6)), CAST(123.393915 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (84, N'021', N'NAGA', 1, N'Magtalisay Tuyan, City of Naga, Cebu', CAST(10.227283 AS Decimal(8, 6)), CAST(123.766537 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (85, N'014', N'NAVAL', 1, N'Brgy. Padre Inocentes Garcia, Naval, Biliran', CAST(11.564619 AS Decimal(8, 6)), CAST(124.402090 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (86, N'105', N'NAVAL 2', 1, N'Brgy. Padre Inocentes Garcia, Naval, Biliran', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (87, N'024', N'Ormoc 1', 1, N'Brgy. Don Felipe Larrazabal, Ormoc City', CAST(11.011136 AS Decimal(8, 6)), CAST(124.606397 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (88, N'017', N'ORMOC 2', 1, N'Hermosilla Drive,  Zone 2   Brgy. District 18, Ormoc City, Leyte', CAST(11.010446 AS Decimal(8, 6)), CAST(124.611187 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (89, N'106', N'ORMOC 3', 1, N'Ormoc City, Leyte', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (90, N'066', N'OSLOB', 1, N'Oslob, Cebu', CAST(9.522310 AS Decimal(8, 6)), CAST(123.432847 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (91, N'109', N'OTON', 1, N'Otton Ilo-Ilo', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (92, N'119', N'PADRE BURGOS', 1, N'Sta. Sofia, Padre Burgos, Southern Leyte', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (93, N'016', N'PALO', 1, N'Palo, Leyte', CAST(11.160324 AS Decimal(8, 6)), CAST(124.990651 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (94, N'117', N'PANGLAO', 1, N'Casa De Maria Bldg., Danao, Panglao, Bohol', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (95, N'110', N'PASSI ', 1, N'Passi Ilo-Ilo', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (96, N'062', N'PINAMUNGAJAN', 1, N'Pinamungajan, Cebu', CAST(10.270407 AS Decimal(8, 6)), CAST(123.583749 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (97, N'116', N'POTOTAN', 1, N'Pototan Ilo-Ilo', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (98, N'078', N'SAGAY', 1, N'Sagay City', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (99, N'028', N'SAMBOAN', 1, N'Colase, Samboan, Cebu', CAST(9.469878 AS Decimal(8, 6)), CAST(123.298041 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (100, N'999', N'SAMPLE', 1, N'Sample', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 0)
GO
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (101, N'052', N'SAN CARLOS', 1, N'San Carlos Negros Occidental', CAST(10.485178 AS Decimal(8, 6)), CAST(123.413744 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (102, N'058', N'SAN FERNANDO', 1, N'San fernando, Cebu', CAST(10.161986 AS Decimal(8, 6)), CAST(123.706260 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (103, N'064', N'SAN JUAN', 1, N'San Juan, Southern Leyte', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (104, N'083', N'SAN REMIGIO', 1, N'San Remigio Cebu', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (105, N'111', N'SARA', 1, N'Sara Ilo-Ilo', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (106, N'047', N'SIATON', 1, N'Siaton Negros Oriental', CAST(9.062981 AS Decimal(8, 6)), CAST(123.031590 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (107, N'031', N'SIBULAN', 1, N'Sibulan dumaguete negros oriental', CAST(9.350084 AS Decimal(8, 6)), CAST(123.284947 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (108, N'086', N'SIERRA BULLONES', 1, N'Sierra Bullones Bohol', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (109, N'098', N'SILAY', 1, N'Silay Negros', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (110, N'096', N'SIPALAY', 1, N'Sipalay Negros', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (111, N'040', N'SIQUIJOR', 1, N'Siquijor', CAST(9.214433 AS Decimal(8, 6)), CAST(123.517939 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (112, N'030', N'SOGOD', 1, N'Proper Damolog Sogod, Cebu', CAST(10.772818 AS Decimal(8, 6)), CAST(124.006183 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (113, N'073', N'SOGOD LEYTE', 1, N'Sogod, Leyte', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (114, N'112', N'STA. BARBARA', 1, N'Sta. Barbara Ilo-Ilo', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (115, N'046', N'STA. CATALINA', 1, N'Sta. Catalina Negros Oriental', CAST(9.333921 AS Decimal(8, 6)), CAST(122.862630 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (116, N'060', N'TACLOBAN', 1, N'tacloban, Leyte', CAST(11.206140 AS Decimal(8, 6)), CAST(124.996839 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (117, N'104', N'TACLOBAN 2', 1, N'Tacloban 2 Leyte', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (118, N'027', N'TAGBILARAN', 1, N'Rizal Street, Brgy Cogon Tagbilaran City Bohol', CAST(9.653467 AS Decimal(8, 6)), CAST(123.858888 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (119, N'001', N'TAGBILARAN 2', 1, N'Door 2 Seaview Apartment, CPG East, Bool District, Tagbilaran City, Bohol. ', CAST(9.628951 AS Decimal(8, 6)), CAST(123.879579 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (120, N'023', N'TALIBON', 1, N'San Pedro St. Poblacion,Talibon, Bohol', CAST(10.148896 AS Decimal(8, 6)), CAST(124.325468 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (121, N'042', N'TALIBON 2', 1, N'Trinidad Bohol', CAST(10.148896 AS Decimal(8, 6)), CAST(124.325468 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (122, N'038', N'TALISAY', 1, N'Talisay cebu', CAST(10.263013 AS Decimal(8, 6)), CAST(123.840303 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (123, N'018', N'TOLEDO', 1, N'2nd Floor Chona Basadre Bldg. Luray I, Toledo City, Cebu', CAST(10.379850 AS Decimal(8, 6)), CAST(123.640621 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (124, N'010', N'TUBIGON', 1, N'Pinayagan, Tubigon, Bohol', CAST(9.938192 AS Decimal(8, 6)), CAST(123.950276 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (125, N'011', N'UBAY', 1, N'2nd Floor Lorenzo Bldg. Corner National Highway and Tan Pentong Street Poblacion Ubay, Bohol', CAST(10.057187 AS Decimal(8, 6)), CAST(124.473239 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (126, N'099', N'VICTORIAS', 1, N'Victorias Negors', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [BranchCode], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status]) VALUES (127, N'003', N'CARCAR', 1, N'2/F Carcar Traveller''s Inn Valladolid,Cebu', CAST(10.108671 AS Decimal(8, 6)), CAST(123.654814 AS Decimal(9, 6)), N'', 1)
INSERT [dbo].[Masterfile_Category] ([Id], [Description], [Type], [Remarks], [Status]) VALUES (1, N'Collections', N'Inflow', N'', 1)
INSERT [dbo].[Masterfile_Category] ([Id], [Description], [Type], [Remarks], [Status]) VALUES (2, N'New Loans', N'Outflow', N'', 1)
INSERT [dbo].[Masterfile_Category] ([Id], [Description], [Type], [Remarks], [Status]) VALUES (3, N'Reloans', N'Outflow', N'', 1)
INSERT [dbo].[Masterfile_Category] ([Id], [Description], [Type], [Remarks], [Status]) VALUES (4, N'Excess FA/Cash Release', N'Inflow', N'', 1)
INSERT [dbo].[Masterfile_Category] ([Id], [Description], [Type], [Remarks], [Status]) VALUES (5, N'Other Collections', N'Inflow', N'', 1)
INSERT [dbo].[Masterfile_Category] ([Id], [Description], [Type], [Remarks], [Status]) VALUES (6, N'Operating Expenses', N'Outflow', N'', 1)
INSERT [dbo].[Masterfile_Category] ([Id], [Description], [Type], [Remarks], [Status]) VALUES (7, N'Other Disbursements', N'Outflow', NULL, 1)
INSERT [dbo].[Masterfile_Channel] ([Id], [Description], [ChartOfAccountId], [BranchId], [Remarks], [Status]) VALUES (1, N'Cash', 1, 62, N'C', 1)
INSERT [dbo].[Masterfile_Channel] ([Id], [Description], [ChartOfAccountId], [BranchId], [Remarks], [Status]) VALUES (2, N'Bank', 1, 62, N'B', 1)
INSERT [dbo].[Masterfile_Channel] ([Id], [Description], [ChartOfAccountId], [BranchId], [Remarks], [Status]) VALUES (3, N'Journal', 1, 62, N'J', 1)
INSERT [dbo].[Masterfile_Channel] ([Id], [Description], [ChartOfAccountId], [BranchId], [Remarks], [Status]) VALUES (4, N'Remco', 1, 62, N'R', 1)
INSERT [dbo].[Masterfile_Channel] ([Id], [Description], [ChartOfAccountId], [BranchId], [Remarks], [Status]) VALUES (5, N'DebitAdvice', 1, 62, N'D', 1)
INSERT [dbo].[Masterfile_Channel] ([Id], [Description], [ChartOfAccountId], [BranchId], [Remarks], [Status]) VALUES (6, N'Other', 1, 62, N'O', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1, N'CU18', N'Sample', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (2, N'AB80', N'Description based on bijli', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (3, N'EEB', N'EE Bond', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (4, N'GGF', N'Voucher', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (5, N'FFE', N'Furniture, Fixtures And Equipments', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (6, N'CU90', N'CU', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (7, N'asdsad ads', N'asdsd asdsd', N'asdasd aaaaaaa', 0)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (8, N' EEVA01', N'Ee Bond Payable-Villarin, Allan R.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (9, N'30739', N'Advances To O&E - Alvarado, Randy', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (10, N'A1MP1', N'Accrued 13Th Month Pay', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (11, N'ADCS1', N'Accumulated Depreciation-Computer Software', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (12, N'ADFFE', N'Accumulated Depreciation', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (13, N'ADOF21', N'Accumulated Depreciation - Office Furniture', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (14, N'ADT18', N'Accumulated Depreciation - Transportation', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (15, N'AE', N'Administrative Expense', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (16, N'AE1', N'Amortization Expense', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (17, N'AEL1', N'Amortization Expense-Li', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (18, N'AEO2', N'Accrued Expense Others', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (19, N'AF1', N'Audit Fee', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (20, N'AFL1', N'Admission Fees Loans', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (21, N'AFP1', N'Advances For Purchases', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (22, N'AIP', N'Accrued Payables', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (23, N'AIP1', N'Accrued Interest Payable', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (24, N'AKM1', N'Accounts Receivable - Kf Members', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (25, N'AL1', N'Accounts Receivable - Lrf', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (26, N'AP', N'Accounts Payable - Others', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (27, N'AP1', N'Advertising & Promotions', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (28, N'APM1', N'Accounts Payable-Mo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (29, N'APO1', N'Accounts Payable-Others', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (30, N'APPC', N'Accounts Payable - Philinsure Calamity', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (31, N'APPGA', N'Accounts Payable - Philinsure Gpa', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (32, N'APPGCLI', N'Accounts Payable - Philinsure Gcli', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (33, N'APPH', N'Accounts Payable - Philhealth', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (34, N'APRAFI', N'Accounts Payable - Rafi', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (35, N'APWCL2', N'Accounts Payable - Withheld Csb Loan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (36, N'APWHC2', N'Accounts Payable - Withheld Hdmf Contribution', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (37, N'APWHL2', N'Accounts Payable - Withheld Hdmf Loan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (38, N'APWI2', N'Accounts Payable - Withheld Insurance', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (39, N'APWPC2', N'Accounts Payable - Withheld Phic Contribution', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (40, N'APWS1', N'Accounts Payable - Withheld Sceaga', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (41, N'APWSEC1', N'Accounts Payable - Withheld Ss &  Ec Con', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (42, N'APWSSL2', N'Accounts Payable - Withheld Sss Salary L', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (43, N'APWTAS2', N'Accounts Payable - Withheld Tax At Sourc', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (44, N'APWTOW2', N'Accounts Payable - Withheld Tax On Wages', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (45, N'AR31', N'Accounts Receivable - Others', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (46, N'ARA', N'A/R - Advances', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (47, N'ARE', N'Accounts Receivable - Employees', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (48, N'AREI', N'Accounts Receivable - Employees Insurance', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (49, N'ARO1', N'Accounts Receivable - Various', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (50, N'ARP', N'Accrued Rent Payable', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (51, N'ARP1', N'Accrued Retirement Payable', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (52, N'ARPC', N'Accounts Receivable - Philinsuref Calamity', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (53, N'ARPGCLI', N'Accounts Receivable - Philinsure Gcli', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (54, N'ARPGPA', N'Accounts Receivable - Philinsure Gpa', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (55, N'ARRI1', N'Accounts Receivable - Rafi Investment', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (56, N'ASET', N'Asset', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (57, N'ASP', N'Accrued Salaries Payable', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (58, N'ATI01', N'Advances To O&E - Inactive', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (59, N'ATOA1', N'Advances To O&E- Autida,Jerson', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (60, N'ATOA2', N'Advances To O&E-Alimpolos,Chona', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (61, N'ATOA3', N'Advances To O&E- Amadar,Ryan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (62, N'ATOAA01', N'Advances To O&E - Abella, Aileen', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (63, N'ATOAA1', N'Advances To O&E- Agravante, Adelina', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (64, N'ATOAA2', N'Advances To O&E- Caseres, James', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (65, N'ATOAAN1', N'Advances To O&E- Areja, Archel N.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (66, N'ATOAC01', N'Advances To O&E- Antigo, Catherine', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (67, N'ATOAC1', N'Advances To O&E-Renoblas, Maria Hian', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (68, N'ATOAD1', N'Advances To O&E-Minoza, Jenavie', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (69, N'ATOAD2', N'Advances To O&E- Navarro, Tatum', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (70, N'ATOAE01', N'Advances To O&E - Reyes, Dane', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (71, N'ATOAE1', N'Advances To O&E- Dorado, Jonar', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (72, N'ATOAES', N'Advances To Officers And Emloyees', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (73, N'ATOAESAOE1', N'Advances To O&E- Loterte,Jovelyn', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (74, N'ATOAESAOE2', N'Advances To O&E- Pepito, Melanie G.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (75, N'ATOAESAOE3', N'Advances To O&E-Anunciado, Alona', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (76, N'ATOAESAOE4', N'Advances To O&E-Elatico, Arvin', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (77, N'ATOAESAOE5', N'Advances To O&E-Puno, Petches', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (78, N'ATOAESAOE6', N'Advances To O&E-Vinatero,Jean', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (79, N'ATOAESAOE7', N'Advances To O&E- Caliñada, Jeolita', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (80, N'ATOAESAOE8', N'Advances To O&E- Campos, Kenneth', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (81, N'ATOAESAOE9', N'Advances To O&E- Cantero, Nina', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (82, N'ATOAF1', N'Advances To O&E- Cajes, Mark Kevin', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (83, N'ATOAG01', N'Advances To O&E - Abequibel, Gretchen', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (84, N'ATOAH01', N'Advances To O&E - Ares, Hannah Mae', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (85, N'ATOAI1', N'Advances To O&E- Dumasig, Joni', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (86, N'ATOAJ01', N'Advances To O&E- Anabieza, Jeffrey', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (87, N'ATOAJ02', N'Advances To O&E - Egloria, Luz', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (88, N'ATOAJ03', N'Advances To O&E - Almerida, Juvelyn', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (89, N'ATOAJ04', N'Advances To O&E - Arcete, Joseph Henry', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (90, N'ATOAJ1', N'Advances To O&E-Agan, Jess', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (91, N'ATOAJ2', N'Advances To O&E- Gabor, Catherine', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (92, N'ATOAM1', N'Advances To O&E- Sorela, Wendel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (93, N'ATOAM2', N'Advances To O&E- Andrino, Marlon', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (94, N'ATOAMAT1', N'Advances To O&E-Aneslagon, Alcidjan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (95, N'ATOAMQ1', N'Advances To O&E- Abalde, Marlon Q.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (96, N'ATOANHA1', N'Advances To O&E-Mondaga, Gilbert', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (97, N'ATOAPKD1', N'Advances To O&E-Cabanag, Mary Love', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (98, N'ATOAR01', N'Advances To O&E- Almaden, Ray Anthony', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (99, N'ATOAR02', N'Advances To O&E - Aninon, Neil', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (100, N'ATOAR03', N'Advances To O&E - Autida, Ricardo', N'', 1)
GO
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (101, N'ATOAV01', N'Advances To O&E - Alendao, Virgilio', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (102, N'ATOAW1', N'Advances To O&E-Cutamora,Eduard', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (103, N'ATOB1', N'Advances To O&E-Gentallan,Telesforo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (104, N'ATOB2', N'Advances To O&E- Cataluna, Grace', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (105, N'ATOBA01', N'Advances To O&E - Barcos, Arnold', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (106, N'ATOBA1', N'Advances To O&E-Bertolano, Avigayl', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (107, N'ATOBA2', N'Advances To O&E- Zata, Nilo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (108, N'ATOBA3', N'Advances To O&E- Bantawig, Adolfo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (109, N'ATOBA4', N'Advances To O&E- Betinol, Absalona', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (110, N'ATOBC1', N'Advances To O&E-Baroman, Carlito', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (111, N'ATOBD01', N'Advances To O&E - Bate, Diane', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (112, N'ATOBE1', N'Advances To O&E- Luega, Bernardo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (113, N'ATOBE2', N'Advances To O&E-Butal, Edward', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (114, N'ATOBE3', N'Advances To O&E- Bongcaras, Emmanuel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (115, N'ATOBF1', N'Advances To O&E- Bandalan, Francis', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (116, N'ATOBF2', N'Advances To O&E- Fano, Jimboy', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (117, N'ATOBG01', N'Advances To O&E - Baraga, Gracyl', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (118, N'ATOBI01', N'Advances To O&E - Banados, Iris Mae', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (119, N'ATOBJ01', N'Advances To O&E- Batohinog, Jeniza', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (120, N'ATOBJ02', N'Advances To O&E - Bacolod, Jomar', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (121, N'ATOBJ03', N'Advances To O&E - Balahay, Joeshel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (122, N'ATOBJ1', N'Advances To O&E- Baoy, Jerwin', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (123, N'ATOBJ2', N'Advances To O&E- Orbiso, May', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (124, N'ATOBJ3', N'Advances To O&E-Bugsocan, Junrey', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (125, N'ATOBJ4', N'Advances To O&E- Budiongan, Alma', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (126, N'ATOBL1', N'Advances To O&E- Dano, Liezel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (127, N'ATOBL2', N'Advances To O&E- Cubio, Ramil', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (128, N'ATOBLA1', N'Advances To O&E- Bentoso, Lysander A.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (129, N'ATOBLP1', N'Advances To O&E- Montajes, Reah', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (130, N'ATOBM1', N'Advances To O&E-Baa, Marlon', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (131, N'ATOBM2', N'Advances To O&E- Bolacito, Mitchel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (132, N'ATOBMCG1', N'Advances To O&E- Baay, Ma. Charito G.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (133, N'ATOBML1', N'Advances To O&E-Batucan, Maria Li', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (134, N'ATOBNG1', N'Advances To O&E- Borong, Nigil G.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (135, N'ATOBO1', N'Advances To O&E- Chatto, Agustin', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (136, N'ATOBO2', N'Advances To O&E- Bacus, Orlane', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (137, N'ATOBOTJ1', N'Advances To O&E-Bayon-On, Teotimo Jr.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (138, N'ATOBR01', N'Advances To O&E - Bohol, Rogelio', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (139, N'ATOBR1', N'Advances To O&E-Briones, Reynard', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (140, N'ATOBR2', N'Advances To O&E-Boncales, Roberto', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (141, N'ATOBR3', N'Advances To O&E-Baladjay, Raffy', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (142, N'ATOBRE1', N'Advances To O&E- Balili, Reina E.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (143, N'ATOBSJ1', N'Advances To O&E- Clenuar, Vincent Ray', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (144, N'ATOBV1', N'Advances To O&E-Biscayda, Vemanda', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (145, N'ATOBW01', N'Advances To O&E - Burlado, William', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (146, N'ATOC1', N'Advances To O&E- Banoc, Romel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (147, N'ATOCA01', N'Advances To O&E - Cabatingan, Adelbert Jarvis', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (148, N'ATOCA02', N'Advances To O&E - Coquilla, Adan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (149, N'ATOCA03', N'Advances To O&E - Capio, April Ann', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (150, N'ATOCA05', N'Advances To O&E - Cajigal, Aiza', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (151, N'ATOCAJ1', N'Advances To O&E- Gomez, Rhea Roxanne', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (152, N'ATOCB01', N'Advances To O&E - Castolo, Baby', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (153, N'ATOCC01', N'Advances To O&E - Comendador, Ciff Jason', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (154, N'ATOCG01', N'Advances To O&E - Catipay, Gomersendo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (155, N'ATOCG02', N'Advances To O&E - Cimeni, Santijun', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (156, N'ATOCG1', N'Advances To O&E-Camaso, Gualberto', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (157, N'ATOCGM1', N'Advances To O&E-Chavez, Gracela Mae', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (158, N'ATOCI1', N'Advances To O&E- Abanes, Arville', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (159, N'ATOCJ01', N'Advances To O&E- Cutora, Joemarie', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (160, N'ATOCJ02', N'Advances To O&E - Corage, Julius', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (161, N'ATOCJ03', N'Advances To O&E - Cuesta, Julius', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (162, N'ATOCJ04', N'Advances To O&E - Curaraton, Jeremias', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (163, N'ATOCJ1', N'Advances To O&E- Ceno, Jarmine', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (164, N'ATOCJ2', N'Advances To O&E-Cutanda, Jaime', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (165, N'ATOCJ3', N'Advances To O&E- Omega, Jobhart', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (166, N'ATOCJ4', N'Advances To O&E- Arrojo, Reymart', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (167, N'ATOCJ5', N'Advances To O&E- Cadalso, Juvanny', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (168, N'ATOCK1', N'Advances To O&E- Nalda, Jean Paul', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (169, N'ATOCL01', N'Advances To O&E - Cavalida, Lyel Adams', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (170, N'ATOCL1', N'Advances To O&E-Cano, Lafe', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (171, N'ATOCM01', N'Advances To O&E - Casas, Michiel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (172, N'ATOCM1', N'Advances To O&E- Briones, Harvy', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (173, N'ATOCM2', N'Advances To O&E- Camacho, Madeo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (174, N'ATOCM3', N'Advances To O&E- Catingan, Maritiss', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (175, N'ATOCMH1', N'Advances To O&E- Compuesto, Michael H.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (176, N'ATOCML1', N'Advances To O&E-Abing, Juliet', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (177, N'ATOCMT1', N'Advances To O&E-Catipay, Ma. Theresa', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (178, N'ATOCN01', N'Advances To O&E - Estrellado, Felix', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (179, N'ATOCN1', N'Advances To O&E- Danez, Jayson', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (180, N'ATOCR01', N'Advances To O&E- Gualvez, Richard', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (181, N'ATOCR02', N'Advances To O&E- Clamonte , Ricky', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (182, N'ATOCR03', N'Advances To O&E - Camet, Rolando', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (183, N'ATOCR04', N'Advances To O&E - Gomez, Christian', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (184, N'ATOCR1', N'Advances To O&E- Edullantes, Chinee', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (185, N'ATOCR2', N'Advances To O&E- Segarra, Tranquilino', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (186, N'ATOCR3', N'Advances To O&E- Torrentia, Gery', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (187, N'ATOCR4', N'Advances To O&E-Cañaveral, Roslyn', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (188, N'ATOCR5', N'Advances To O&E- Lopez, Mark Anthony', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (189, N'ATOCSR1', N'Advances To O&E- Diwa, Gieron', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (190, N'ATOCV1', N'Advances To O&E- Cuajao, Vincent', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (191, N'ATOCW01', N'Advances To O&E - Cagatin, Wendell', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (192, N'ATOCW02', N'Advances To O&E - Cubian, Webster', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (193, N'ATODA01', N'Advances To O&E - Dela Cruz, Archie', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (194, N'ATODC01', N'Advances To O&E - Dawaton, Cheto', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (195, N'ATODG01', N'Advances To O&E - Sinsano, Iryn', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (196, N'ATODG1', N'Advances To O&E- Marcojos, Geruel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (197, N'ATODJ1', N'Advances To O&E- Quijano, Mary Anjelie', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (198, N'ATODJCG1', N'Advances To O&E- Del Rosario, Cesar Ryan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (199, N'ATODL1', N'Advances To O&E-Dalapo, Lelaine', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (200, N'ATODM01', N'Advances To O&E - Descartin, Ma. Daryl', N'', 1)
GO
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (201, N'ATODM02', N'Advances To O&E - Donaire, Mark', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (202, N'ATODR1', N'Advances To O&E- Cutamora, Romeo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (203, N'ATODR2', N'Advances To O&E-Seguros, Rolando', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (204, N'ATODR3', N'Advances To O&E- Bernil, Cyrus', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (205, N'ATODT01', N'Advances To O&E - Dagatan, Teresa G.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (206, N'ATODV01', N'Advances To O&E - Del Carmen, Victor', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (207, N'ATOE1', N'Advances To O&E- Estrada,Marcelo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (208, N'ATOEA01', N'Advances To O&E- Antonio, Elvin Morris', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (209, N'ATOEA1', N'Advances To O&E-  Lorican, Ronnie', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (210, N'ATOEA2', N'Advances To O&E- Cadao, Artemio', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (211, N'ATOEA3', N'Advances To O&E-Tesio, Victor', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (212, N'ATOEA4', N'Advances To O&E- Rosal, Anthony Florence', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (213, N'ATOED01', N'Advances To O&E - Ege, Dindo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (214, N'ATOEJ01', N'Advances To O&E - Encarguez, Jerome', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (215, N'ATOEJ02', N'Advances To O&E - Estimada, Jupiter', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (216, N'ATOEJ1', N'Advances To O&E- Sabroso, Marrian Therese', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (217, N'ATOEL01', N'Advances To O&E - Embalzado, Larry', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (218, N'ATOEM01', N'Advances To O&E - Enad, Marjurie', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (219, N'ATOEM1', N'Advances To O&E-Estorba, Marcelino', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (220, N'ATOENZ1', N'Advances To Off. & Emp. - New (Zoho)', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (221, N'ATOER1', N'Advances To O&E- Panit. Reslie', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (222, N'ATOEW1', N'Advances To O&E- Algones, Jessa', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (223, N'ATOFM01', N'Advances To O&E- Forrosuelo, Mark Jenaz', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (224, N'ATOFS1', N'Advances To O&E-Frontreras, Sergio', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (225, N'ATOG1', N'Advances To O&E- Garcia,Aga', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (226, N'ATOGA01', N'Advances To O&E - Garcia, Apple', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (227, N'ATOGAB1', N'Advances To O&E- Sarsona, Cristela', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (228, N'ATOGD01', N'Advances To O&E - Gabule, Daisy', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (229, N'ATOGD02', N'Advances To O&E - Golis, Daryl James', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (230, N'ATOGF1', N'Advances To O&E- Balbuena, Jonard', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (231, N'ATOGG01', N'Advances To O&E - Geagonia, Gary', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (232, N'ATOGG1', N'Advances To O&E-Gimpayan, Gina', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (233, N'ATOGJS1', N'Advances To O&E-Garcia, Jophet Son', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (234, N'ATOGL01', N'Advances To O&E - Gonzaga, Luzviminda', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (235, N'ATOGM01', N'Advances To O&E - Gomez, Marlou', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (236, N'ATOGM1', N'Advances To O&E-Gallego, Melody', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (237, N'ATOGNJ1', N'Advances To O&E-Gonzales, Nenito Jr.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (238, N'ATOGR01', N'Advances To O&E - Garque, Rachael', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (239, N'ATOGR1', N'Advances To O&E-Garcia, Ronnie', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (240, N'ATOGR2', N'Advances To O&E-Dela Pena, Globen', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (241, N'ATOGV1', N'Advances To O&E-Gatchalian, Val', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (242, N'ATOGV2', N'Advances To O&E-Gimarino, Villasis', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (243, N'ATOGVE1', N'Advances To O&E- Gurrea, Velle Eddieson', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (244, N'ATOHL1', N'Advances To O&E- Padrique, Rogelio', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (245, N'ATOHL2', N'Advances To O&E- Gellang, Leonor', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (246, N'ATOHM01', N'Advances To O&E - Hibaya, Mil Rey', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (247, N'ATOHM02', N'Advances To O&E - Tupas, Ricky', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (248, N'ATOI1', N'Advances To O&E- Cobel, Elyzar', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (249, N'ATOIA01', N'Advances To O&E - Israel, Apple May', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (250, N'ATOIIA1', N'Advances To O&E-Ib-Ib, Arnold', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (251, N'ATOJ1', N'Advances To O&E- Jamora,Nube', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (252, N'ATOJA1', N'Advances To O&E- Jumao-As,Edisa', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (253, N'ATOJHC1', N'Advances To O&E- Quiapo, Demetrio', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (254, N'ATOJJ01', N'Advances To O&E - Jalover, Jermain Neil', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (255, N'ATOJJ02', N'Advances To O&E - Jagus, Jermain Neil', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (256, N'ATOJJ03', N'Advances To O&E - Japitan, John', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (257, N'ATOJM01', N'Advances To O&E - Jutara, Mae', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (258, N'ATOJR01', N'Advances To O&E - Jagus, Ronel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (259, N'ATOKC1', N'Advances To O&E- Narisma, Antoneth', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (260, N'ATOKV01', N'Advances To O&E - Kiawan, Vilma', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (261, N'ATOL1', N'Advances To O&E-Lumyag,Jessimen', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (262, N'ATOL2', N'Advances To O&E- Ducanes, Jetka', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (263, N'ATOLA1', N'Advances To O&E- Lim, Ailyne', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (264, N'ATOLA2', N'Advances To O&E- Alota, John Henry', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (265, N'ATOLD1', N'Advances To O&E-Labiste,Maria Delia', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (266, N'ATOLD2', N'Advances To O&E- Peligro, Rey', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (267, N'ATOLE01', N'Advances To O&E - Lebarnes, Emmanuel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (268, N'ATOLF01', N'Advances To O&E - Minoza, Mark', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (269, N'ATOLG01', N'Advances To O&E - Laurente, Gemson', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (270, N'ATOLJ01', N'Advances To O&E - Lepiten, Jose', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (271, N'ATOLJ02', N'Advances To O&E - Lupas, Jessie Paul', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (272, N'ATOLJ1', N'Advances To O&E-Lopez. Judith', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (273, N'ATOLJ2', N'Advances To O&E-Lauglaug, Juhnrey', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (274, N'ATOLJN1', N'Advances To O&E- Alabata, Aldrey', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (275, N'ATOLJP01', N'Advances To O&E -Lupas, Jessie Paul', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (276, N'ATOLL1', N'Advances To O&E- Boral, Reymar', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (277, N'ATOLM01', N'Advances To O&E - Lapiz, Melissa', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (278, N'ATOLR01', N'Advances To O&E - Lepon, Ryan Carlo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (279, N'ATOLR1', N'Advances To O&E- Locaylocay, Reynan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (280, N'ATOM1', N'Advances To O&E-Mariscal,Ricardo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (281, N'ATOM2', N'Advances To O&E- Miral,Reymond', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (282, N'ATOM3', N'Advances To O&E- Monteron,Pedro', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (283, N'ATOM4', N'Advances To O&E- Mandaue,Christopher', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (284, N'ATOMA01', N'Advances To O&E - Mibato, Alvin', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (285, N'ATOMA02', N'Advances To O&E - Morados, Al Jesko', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (286, N'ATOMA1', N'Advances To O&E- Masong, Ariel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (287, N'ATOMA2', N'Advances To O&E-Malabon, Arnel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (288, N'ATOMB1', N'Advances To O&E-Mundo, Bochie', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (289, N'ATOMC01', N'Advances To O&E - Maquipoten, Clifford', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (290, N'ATOMC1', N'Advances To O&E-Millan, Charles', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (291, N'ATOMCDB1', N'Advances To O&E- Meca, Christian Dev B.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (292, N'ATOMD1', N'Advances To O&E-Marquez, Dee', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (293, N'ATOMDC1', N'Advances To O&E- Canete, Raihnard', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (294, N'ATOME01', N'Advances To O&E - Miradores, Elmer', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (295, N'ATOMG01', N'Advances To O&E - Malig-On, Gary', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (296, N'ATOMJ01', N'Advances To O&E- Meca, Jufil', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (297, N'ATOMJ02', N'Advances To O&E - Matigas, Jonalyn', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (298, N'ATOMJ03', N'Advances To O&E - Montecalvo, John Sanrio', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (299, N'ATOMJ04', N'Advances To O&E - Montes, Jessa', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (300, N'ATOMJ1', N'Advances To O&E- Escuadra, Aurine', N'', 1)
GO
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (301, N'ATOMJ2', N'Advances To O&E- Castigon, Isabel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (302, N'ATOMJP1', N'Advances To O&E- Maylon, Jessie P.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (303, N'ATOMLA1', N'Advances To O&E- Macaldo, Lowelito A.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (304, N'ATOMM01', N'Advances To O&E - Morales, Mark Aldrin', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (305, N'ATOMM02', N'Advances To O&E - Moreno, Moquin Marie', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (306, N'ATOMM1', N'Advances To O&E-Maspara, Monette', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (307, N'ATOMMC1', N'Advances To O&E- Mondido, Micel C.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (308, N'ATOMN01', N'Advances To O&E - Marchadesch, Nikko', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (309, N'ATOMN02', N'Advances To O&E - Mulit, Noel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (310, N'ATOMN1', N'Advances To O&E-Mascariñas, Nineveh', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (311, N'ATOMRB1', N'Advances To O&E- Gerez, Gilbert', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (312, N'ATOMS1', N'Advances To O&E- Lenejan, Radie', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (313, N'ATONAC1', N'Advances To O&E- Sicop, Nilmar', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (314, N'ATONE01', N'Advances To O&E - Avergonzado, Anabel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (315, N'ATONJ01', N'Advances To O&E - Nellas, Joemel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (316, N'ATONJ1', N'Advances To O&E- Nunez, Joenard', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (317, N'ATONJG1', N'Advances To O&E- Sumayang, Joselito', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (318, N'ATONMT1', N'Advances To O&E-Dosdos, Ma. Thelma', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (319, N'ATONN1', N'Advances To O&E-Navacilla, Naomi', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (320, N'ATONRE1', N'Advances To O&E- Mandawe, Jomar', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (321, N'ATOOF01', N'Advances To O&E - Opsima, Franquile', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (322, N'ATOOJ1', N'Advances To O&E- Otadoy, Joebert', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (323, N'ATOOM01', N'Advances To O&E - Ong, Macgyver', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (324, N'ATOOMV1', N'Advances To O&E- Otom, Mart Vincent', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (325, N'ATOOPJ01', N'Advances To O&E - Panugaling, Johnrelie', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (326, N'ATOOW1', N'Advances To O&E- Malibago, Joaquin Salvador', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (327, N'ATOP1', N'Advances To O&E-Ceniza, Greg', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (328, N'ATOP2', N'Advances To O&E-Pareja,Elesito', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (329, N'ATOP3', N'Advances To O&E- Calderon, Aiza', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (330, N'ATOPA1', N'Advances To O&E-Polestico, Alvin', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (331, N'ATOPB01', N'Advances To O&E - Pampelon, Bernie', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (332, N'ATOPCM1', N'Advances To O&E-  Bangca, Charlie Mae', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (333, N'ATOPE01', N'Advances To O&E - Pelias, Ernesto Pet', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (334, N'ATOPE1', N'Advances To O&E-  Sala, Calvin Brent', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (335, N'ATOPI011', N'Advances To O&E - Poquita, Ivy Lou', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (336, N'ATOPJ01', N'Advances To O&E - Padin, Jufran', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (337, N'ATOPJ02', N'Advances To O&E - Patolilic, John Louie', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (338, N'ATOPJ03', N'Advances To O&E - Pilapil, Junnar', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (339, N'ATOPJ1', N'Advances To O&E- Ilaida, Conevie', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (340, N'ATOPJ2', N'Advances To O&E- Giapana, Geomarie', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (341, N'ATOPM1', N'Advances To O&E- Pejano, Maribel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (342, N'ATOPMB1', N'Advances To O&E- Merida, Bernie', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (343, N'ATOPMG1', N'Advances To O&E- Masong, Francelyn Joy', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (344, N'ATOPN1', N'Advances To O&E-Pacquiao, Neil', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (345, N'ATOPP01', N'Advances To O&E - Padayogdog, Pinky', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (346, N'ATOPP1', N'Advances To O&E-Mendez, Carlson', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (347, N'ATOPR01', N'Advances To O&E - Paden, Rey Jay', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (348, N'ATOPR02', N'Advances To O&E - Cenia,  Elisheva', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (349, N'ATOPY01', N'Advances To O&E - Poliquit, Yul Brian', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (350, N'ATOQN1', N'Advances To O&E-Quinal, Noly', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (351, N'ATOR1', N'Advances To O&E-Remorosa,Charito', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (352, N'ATORA1', N'Advances To O&E- Marikit, Jerson', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (353, N'ATORC1', N'Advances To O&E - Pique, Virgilio', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (354, N'ATORC2', N'Advances To O&E-Rabasano, Charen', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (355, N'ATORCD1', N'Advances To O&E- Sarmiento, Mork Ian', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (356, N'ATORD01', N'Advances To O&E - Rosalejos, Diocles', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (357, N'ATORE1', N'Advances To O&E-Rollon, Evelyn', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (358, N'ATORE2', N'Advances To O&E-Caray, Nisandro', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (359, N'ATORF01', N'Advances To O&E - Rabadon, Flor', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (360, N'ATORH01', N'Advances To O&E - Revilles, Hyacinth', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (361, N'ATORH1', N'Advances To O&E - Rafi Hr', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (362, N'ATORI1', N'Advances To O&E - Rafi It', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (363, N'ATORJ01', N'Advances To O&E - Ragonton, Joe Mavrick', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (364, N'ATORJ02', N'Advances To O&E - Abrenica, Martchan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (365, N'ATORJ1', N'Advances To O&E- Rondero, Joseph', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (366, N'ATORPJJ1', N'Advances To O&E- Ruales, Pedro Jr. J.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (367, N'ATORR1', N'Advances To O&E-Romano, Ronnel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (368, N'ATORR2', N'Advances To O&E- Roslin, Reynaldo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (369, N'ATORR3', N'Advances To O&E- Garcia, Mario', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (370, N'ATORR4', N'Advances To O&E- Roamar, Rudy', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (371, N'ATOS1', N'Advances To O&E-Salutan,Anthony', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (372, N'ATOS2', N'Advances To O&E- Sarco,Reo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (373, N'ATOSA1', N'Advances To O&E-Bentulan, Rotchman', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (374, N'ATOSC01', N'Advances To O&E - Salazar, Chester', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (375, N'ATOSC02', N'Advances To O&E - Simogan, Christopher', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (376, N'ATOSC1', N'Advances To O&E-Suquib, Cresilda', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (377, N'ATOSD01', N'Advances To O&E - Serban, Dennis', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (378, N'ATOSD02', N'Advances To O&E - Sajulga, Daryl Lou', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (379, N'ATOSD1', N'Advances To O&E-Cabahug, Arnel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (380, N'ATOSD2', N'Advances To O&E- Sencio, Dominic', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (381, N'ATOSDM1', N'Advances To O&E- Lapinig, Rochell', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (382, N'ATOSJ01', N'Advances To O&E - Secretaria, Jasil', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (383, N'ATOSJ02', N'Advances To O&E - Sorono, Jonathan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (384, N'ATOSJ1', N'Advances To O&E- Valmoria, Ronel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (385, N'ATOSJ2', N'Advances To O&E- Salili, Julieto', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (386, N'ATOSJ3', N'Advances To O&E- Sotto, Jonald', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (387, N'ATOSJB1', N'Advances To O&E-Quezon, Ian', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (388, N'ATOSL01', N'Advances To O&E- Sotto, Laurince', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (389, N'ATOSL02', N'Advances To O&E - Sagayan, Lolito', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (390, N'ATOSO1', N'Advances To O&E-Sayago, Olivar', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (391, N'ATOSR01', N'Advances To O&E - Suralta, Rodgie', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (392, N'ATOSR1', N'Advances To O&E-Bongcac, Querubin', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (393, N'ATOSR2', N'Advances To O&E-Sevilla, Ronald', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (394, N'ATOSR3', N'Advances To O&E-Salaritan, Ranmar', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (395, N'ATOSV01', N'Advances To O&E - Saballa, Vincent', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (396, N'ATOT1', N'Advances To O&E- Tante,Christian', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (397, N'ATOTC01', N'Advances To O&E - Tapilot, Charlene', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (398, N'ATOTJ01', N'Advances To O&E - Tibay, Junmar', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (399, N'ATOTJ02', N'Advances To O&E - Tadeo, Jushua', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (400, N'ATOTJ03', N'Advances To O&E - Tibay, Jonathan', N'', 1)
GO
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (401, N'ATOTJ04', N'Advances To O&E - Torrejos, Joemar', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (402, N'ATOTJ1', N'Advances To O&E-Tanza, Jacob', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (403, N'ATOTJ2', N'Advances To O&E-Tapia, Jeaniedel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (404, N'ATOTJ3', N'Advances To O&E-Gomez, Keith Mark', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (405, N'ATOTJ4', N'Advances To O&E-Tan, Jerica', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (406, N'ATOTM1', N'Advances To O&E-Tapinit, Myra', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (407, N'ATOTMJ1', N'Advances To O&E- Gallego, Ranilo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (408, N'ATOTN01', N'Advances To O&E - Tero, Nelson', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (409, N'ATOTR01', N'Advances To O&E - Toledo, Reil Vincent', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (410, N'ATOTVC1', N'Advances To O&E- Rulida, Rufo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (411, N'ATOUM01', N'Advances To O&E - Undang, Mary Ann', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (412, N'ATOV1', N'Advances To O&E-Bais, Jorvin', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (413, N'ATOVA01', N'Advances To O&E- Villarin, Allan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (414, N'ATOVA1', N'Advances To O&E-Vanzuela, Arman', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (415, N'ATOVE1', N'Advances To O&E-Various Ee', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (416, N'ATOVG01', N'Advances To O&E - Villahermosa, Gerlie', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (417, N'ATOVJ01', N'Advances To O&E - Valmoria, Jean Paul', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (418, N'ATOVJ1', N'Advances To O&E-Kadusale, Teovasco Jones', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (419, N'ATOVJ2', N'Advances To O&E-Virtucio, Joecylito', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (420, N'ATOVJT1', N'Advances To O&E- Epan,  Neil Christian', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (421, N'ATOVM1', N'Advances To O&E-Viarino, Melody', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (422, N'ATOVR01', N'Advances To O&E - Valencia, Rhyder', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (423, N'ATOYL01', N'Advances To O&E - Yamomo, Lino', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (424, N'ATOYSL1', N'Advances To O&E-Ycong, Sherwin Leo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (425, N'ATOZ1', N'Advances To O&E-Zaraga,Ariane', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (426, N'ATOZA1', N'Advances To O&E- Zurita, Alfeo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (427, N'ATOZH1', N'Advances To O&E- Zurita, Hilario', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (428, N'ATOZM01', N'Advances To O&E -Zamora, Manove', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (429, N'ATOZR1', N'Advances To O&E-Zamora, Richard', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (430, N'ATPPT1', N'Accrued Taxes Payable-Percentage Tax', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (431, N'AWGKF1', N'A/P Withheld-Gawad Kalingga Fdtn.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (432, N'BA1', N'Branch Office Account - Alicia', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (433, N'BA1MP1', N'Bonuses And 13Th Month Pay', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (434, N'BAC01', N'Branch Office Account - Carmen', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (435, N'BB10', N'Bereavement Benefit - Employee', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (436, N'BBT2', N'Bereavement Benefit - Staff', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (437, N'BC1', N'Bank Charges', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (438, N'BCAL1', N'Branch Office Account - Calape', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (439, N'BOA1', N'Branch Office Account', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (440, N'BOAA1', N'Branch Office Account - Argao', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (441, N'BOAAB2', N'Branch Office Account - Mcarthur', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (442, N'BOAABU', N'Branch Office Account - Abuyog', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (443, N'BOAB02', N'Branch Office Account - Baybay 2', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (444, N'BOAB1', N'Branch Office Account - Baybay', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (445, N'BOAB2', N'Branch Office Account - Bantayan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (446, N'BOAB3', N'Branch Office Account - Dumanjug', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (447, N'BOAB4', N'Branch Office Account - Bogo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (448, N'BOAB5', N'Branch Office Account - Tagbilaran2', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (449, N'BOABA01', N'Branch Office Account - Bais', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (450, N'BOABAL1', N'Branch Office Account - Balamban', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (451, N'BOABB1', N'Branch Office Account - Binalbagan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (452, N'BOABN1', N'Branch Office Account - Barotac Nuevo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (453, N'BOABOR1', N'Branch Office Account - Borbon', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (454, N'BOABS1', N'Branch Office Account - Basey', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (455, N'BOABV1', N'Branch Office Account - Barotac Viejo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (456, N'BOAC01', N'Branch Office Account - Carigara', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (457, N'BOAC1', N'Branch Office Account - Camotes', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (458, N'BOAC2', N'Branch Office Account - Carcar', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (459, N'BOACA1', N'Branch Office Account - Cauayan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (460, N'BOACAD2', N'Branch Office Account - Cadiz City 2', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (461, N'BOACAP1', N'Branch Office Account - Capoocan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (462, N'BOACAT', N'Branch Office Account - Catarman', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (463, N'BOACATB', N'Branch Office Account - Catbalogan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (464, N'BOACC1', N'Branch Office Account - Cebu City', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (465, N'BOACC2', N'Branch Office Account - Calbayog City', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (466, N'BOAD01', N'Branch Office Account - Dulag', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (467, N'BOAD02', N'Branch Office Account - Sibulan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (468, N'BOAD1', N'Branch Office Account - Tagbilaran', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (469, N'BOADB01', N'Branch Office Account - Daanbantayan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (470, N'BOADB1', N'Branch Office Account - Dimiao', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (471, N'BOADU2', N'Branch Office Account - Dulag 2', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (472, N'BOAG01', N'Branch Office Account - Guindulman', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (473, N'BOAG1', N'Branch Office Account - Getafe', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (474, N'BOAH1', N'Branch Office Account - Himamaylan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (475, N'BOAHI01', N'Branch Office Account - Hinunangan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (476, N'BOAHI1', N'Branch Office Account - Hinigaran', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (477, N'BOAHIL01', N'Branch Office Account - Hilongos', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (478, N'BOAIN01', N'Branch Office Account - Inabanga', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (479, N'BOAJ1', N'Branch Office Account - Jagna', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (480, N'BOAK1', N'Branch Office Account - Kabankalan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (481, N'BOAL1', N'Branch Office Account - Danao', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (482, N'BOALAPU01', N'Branch Office Account - Lapu-Lapu', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (483, N'BOALIC1', N'Branch Office Account - Leganes', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (484, N'BOAM', N'Branch Office Account - Moalboal', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (485, N'BOAM01', N'Branch Office Account - Ormoc 2', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (486, N'BOAM1', N'Branch Office Account - Mo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (487, N'BOAM2', N'Branch Office Account - Mandaue', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (488, N'BOAMA1', N'Branch Office Account - Mabinay', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (489, N'BOAMIC1', N'Branch Office Account - Miagao', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (490, N'BOAMING1', N'Branch Office Account - Minglanilla', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (491, N'BOAN01', N'Branch Office Account - Naval', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (492, N'BOAN02', N'Branch Office Account - Naval 2', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (493, N'BOAN1', N'Branch Office Account - Naga', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (494, N'BOAO1', N'Branch Office Account - Ormoc', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (495, N'BOAOC3', N'Branch Office Account - Ormoc 3', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (496, N'BOAOIC1', N'Branch Office Account - Oton', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (497, N'BOAP02', N'Branch Office Account - Passi', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (498, N'BOAP1', N'Branch Office Account - Palompon', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (499, N'BOAPA01', N'Branch Office Account - Palo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (500, N'BOAPB01', N'Branch Office Account - Padre Burgos', N'', 1)
GO
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (501, N'BOAPB02', N'Branch Office Account - Panglao', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (502, N'BOAPIC1', N'Branch Office Account - Pototan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (503, N'BOAS1', N'Branch Office Account - Bato', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (504, N'BOAS2', N'Branch Office Account - Sogod (Cebu)', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (505, N'BOASA1', N'Branch Office Account - Sagay', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (506, N'BOASARA', N'Branch Office Account - Sara', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (507, N'BOASB01', N'Branch Office Account - Sta. Barbara', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (508, N'BOASB1', N'Branch Office Account - Sierra Bullones', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (509, N'BOASC1', N'Branch Office Account - Silay', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (510, N'BOASI01', N'Branch Office Account - Siquijor', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (511, N'BOASI1', N'Branch Office Account - Sipalay', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (512, N'BOASR1', N'Branch Office Account - San Remigio', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (513, N'BOAST1', N'Branch Office Account - Samboan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (514, N'BOAT01', N'Branch Office Account - Toledo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (515, N'BOAT1', N'Branch Office Account - Tubigon', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (516, N'BOAT2', N'Branch Office Account - Asturias', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (517, N'BOATA01', N'Branch Office Account - Talisay', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (518, N'BOATAC2', N'Branch Office Account - Tacloban 2', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (519, N'BOATN1', N'Branch Office Account - Talibon', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (520, N'BOAU1', N'Branch Office Account - Ubay', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (521, N'BOAV1', N'Branch Office Account - Victorias', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (522, N'BOE01', N'Branch Pre-Operating Expenses', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (523, N'CA', N'Current Assets', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (524, N'CAB1', N'Cib-Aspac Bantayan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (525, N'CAB2', N'Cib-Aspac Bogo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (526, N'CABB1', N'Cib-Allied Bank-Baybay', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (527, N'CABC1', N'Cib-Aspac Bank Consolacion', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (528, N'CABO1', N'Cib-Allied Bank-Ormoc', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (529, N'CAC1', N'Cib-Aspac Consolacion', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (530, N'CACE', N'Cash And Equivalents', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (531, N'CAD1', N'Cib-Aspac Danao', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (532, N'CAI', N'Investment', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (533, N'CALOARP', N'Cumulative Actuarial Loss On Acc. Retirement Pay', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (534, N'CALR', N'Loans Receivable', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (535, N'CAMS1', N'Cleaning And Maintenance Supplies', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (536, N'CAOR', N'Accounts Receivable', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (537, N'CAP', N'Prepayments', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (538, N'CAPBC2', N'Cib-Aspac Bank (Consolacion)', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (539, N'CARBT', N'Cib-Aspac Rural Bank Toledo City', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (540, N'CAS', N'Supplies', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (541, N'CAS1', N'Cib-Aspac Sogod', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (542, N'CASB1', N'Cib-Aspac Sogod (Borbon)', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (543, N'CASPACT', N'Cib-Aspac Talisay', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (544, N'CASTA', N'Short Term Investment - Aco', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (545, N'CAT1', N'Cib-Aspac Tabogon', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (546, N'CAT2', N'Cib-Aspac Toledo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (547, N'CC1', N'Postage, Freight And Delivery', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (548, N'CCB01', N'Cib-Csb Bank-023086', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (549, N'CCB02', N'Cib-Csb Bank-022719', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (550, N'CCBC2', N'Cib-Coastal Bank (Rng) Clarin', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (551, N'CCBSF1', N'Cib-Coastal Bank-San Fernando', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (552, N'CCO1', N'Cib-Csb Ormoc', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (553, N'CCO2', N'Cib-Csb Ormoc2', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (554, N'CCOB2', N'Cib - Csb Ormoc (Baybay2)', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (555, N'CCP1', N'Cmedfi Client Products', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (556, N'CCRBOC1', N'Cib-Community Rural Bank Of Catmon(Cebu)', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (557, N'CCS', N'Cash Collection Suspense', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (558, N'CCSO2', N'Cib-Csb Sa Ormoc2', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (559, N'CCT1', N'Cib-Csb (Tagbilaran)', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (560, N'CCT2', N'Cib-Csb Tagbilaran 1', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (561, N'CCT3', N'Cib-Csb Tagbilaran 2', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (562, N'CDBPC1', N'Cib-Dbp Carcar', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (563, N'CDBPM1', N'Cib-Dbp Main', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (564, N'CDBPT', N'Cib-Dbp Tubigon', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (565, N'CDBPU', N'Cib-Dbp Ubay', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (566, N'CDS1', N'Cib-Dbp - Siquijor', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (567, N'CF2', N'Professional And Consultancy Fees', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (568, N'CFB1', N'Cib-Fib Baybay', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (569, N'CFC1', N'Cib-Fcb Catigbian', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (570, N'CFC2', N'Cib-Fib Carigara', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (571, N'CFCB2', N'Cib-First Cb Catigbian', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (572, N'CFCBC1', N'Cib-Fcb Carmen', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (573, N'CFCBG1', N'Cib-Fcb Getafe', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (574, N'CFCBSB1', N'Cib-Fcb S. Bullones', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (575, N'CFCD1', N'Cib-Fcb Valencia (Dimiao)', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (576, N'CFG', N'Cib-Fcb Guindulman', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (577, N'CFG1', N'Cib-Fcb Getafe (Talibon 1)', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (578, N'CFH1', N'Cib-Fib Hilongos', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (579, N'CFI1', N'Cib-Fcb Inabanga', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (580, N'CFJ1', N'Cib-Fcb Jagna', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (581, N'CFL1', N'Cib-Fcb Loay', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (582, N'CFP1', N'Cab Funds Payable', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (583, N'CFT1', N'Cib-Fcb Talibon', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (584, N'CFU1', N'Cib-Fcb Ubay', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (585, N'CFV1', N'Cib-Fcb Valencia', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (586, N'CGBH1', N'Cib-Green Bank-Hilongos', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (587, N'CGBU1', N'Cib-Green Bank Ubay', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (588, N'CI1', N'Commission Income', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (589, N'CIB', N'Cash In Bank', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (590, N'CIBLC01', N'Cib-Lbp Carigara', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (591, N'CIBM1', N'Cib-Mandaue', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (592, N'CIBPN', N'Cib-Pnb Naval', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (593, N'CIBPNB', N'Cib-Pnb Main', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (594, N'CIBPNBSC', N'Cib-Pnb San Carlos', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (595, N'CIBUDD', N'Cib-Ubp Dumaguete (Dumaguete)', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (596, N'CINPC1', N'Cib-Pnb Liloan (Compostela)', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (597, N'CKBU1', N'Cib-Kauswagan Bank-Ubay', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (598, N'CL', N'Current Liabilities', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (599, N'CLCSF', N'Clients Savings Fund', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (600, N'CLOP', N'Other Current Payables', N'', 1)
GO
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (601, N'CLS1', N'Cib-Lbp Sogod', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (602, N'CLTN1', N'Cib-Lbp Talibon New', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (603, N'CLU1', N'Cib-Lbp Ubay', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (604, N'CMBJ', N'Cib-Metrobank Jagna', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (605, N'CMBM', N'Cib-Metrobank Main', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (606, N'CMBP1', N'Cib-Metrobank Palo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (607, N'CMBT', N'Cib-Metrobank Talibon2', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (608, N'CMS', N'Cib-Metrobank Siquijor', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (609, N'CMT', N'Cib-Mbtc Talibon', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (610, N'COH', N'Cash On Hand', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (611, N'CP2', N'Computerization Project', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (612, N'CP3', N'Contractual Pay', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (613, N'CPB', N'Cib-Pnb Bais', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (614, N'CPB1', N'Cib-Pnb Bayawan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (615, N'CPBBC1', N'Cib-Producers Bank Bago', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (616, N'CPC1', N'Cib-Pnb Sta. Catalina', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (617, N'CPD1', N'Cib-Pnb Dumanjug', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (618, N'CPE1', N'Computerization Project  Expense', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (619, N'CPL1', N'Cib-Pcrb Liloan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (620, N'CPLC1', N'Cib-Pnb La Carlota', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (621, N'CPM', N'Cib-Pnb Moalboal', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (622, N'CPNBB', N'Cib-Pnb (Barili)', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (623, N'CPNBC1', N'Cib-Pnb Cadiz', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (624, N'CPNBCH', N'Cib-Pnb City Hall', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (625, N'CPNBG1', N'Cib-Pnb Guihulngan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (626, N'CPNBUC1', N'Cib-Pnb Ubay (Alicia)', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (627, N'CPP1', N'Cib-Pnb Palompon', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (628, N'CPT1', N'Cib-Pnb Tubigon', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (629, N'CPU1', N'Cib-Pnb Ubay', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (630, N'CRA1', N'Cib-Rbcs Argao', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (631, N'CRB', N'Cib-Rbbi Boljoon', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (632, N'CRB1', N'Cib-Rbcs Bato', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (633, N'CRB2', N'Cib-Rbbi Barili', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (634, N'CRBBDB', N'Cib-Rbb Daan Bantayan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (635, N'CRBBSR1', N'Cib-Rb Of Bogo - San Remigio Br.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (636, N'CRBD', N'Cib-Rural Bank Of Dulag (Abuyog)', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (637, N'CRBOB1', N'Cib-Rural Bank Of Bato', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (638, N'CRBOBDBB1', N'Cib-Rural Bank Of Bogo-Daan Bantayan Bra', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (639, N'CRBS1', N'Cib-Rboi Boljoon(Oslob)', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (640, N'CRBSJ1', N'Cib-Rural Bank Of San Juan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (641, N'CRC1', N'Cib-Rbcs Carcar', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (642, N'CRCBA', N'Cib-Rng Coastal Bank Asturias', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (643, N'CRCBC', N'Cib-Rng Coastal Bank Calape (Tubigon)', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (644, N'CRCBC1', N'Cib-Rng Coastal Bank Clarin (Inabanga)', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (645, N'CRCBC2', N'Cib-Rng Coastal Bank Carmen', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (646, N'CRCBL', N'Cib-Rural Bank Of  Loon', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (647, N'CRCBP', N'Cib-Rng Coastal Bank Panglao', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (648, N'CRD1', N'Cib-Rbbi Dumanjug', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (649, N'CRD2', N'Cib-Rbcs Dalaguete', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (650, N'CRE', N'Client Retention Expenses', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (651, N'CREMCO', N'Cash In Remco', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (652, N'CRH1', N'Cib-Rbh Hindang', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (653, N'CRM1', N'Cib-Rbbi Moalboal', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (654, N'CRM2', N'Cib-Rcbc-Maasin', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (655, N'CRNGCBB', N'Cib-Rng Coastal Bank Borbon', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (656, N'CRNGCBPN', N'Cib - Rng Coastal Bank Panglao - New', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (657, N'CRNGCC1', N'Cib-Rng Coastal Calape', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (658, N'CRO1', N'Cib-Rboi Oslob', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (659, N'CRP1', N'Cip-Renoir Project', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (660, N'CRP2', N'Cib-Rbc Poro', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (661, N'CRS1', N'Cib-Rbcs Sibonga', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (662, N'CRS2', N'Cib-Rbbi Santander', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (663, N'CRSF1', N'Cib-Rbc San Francisco', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (664, N'CRSO2', N'Cib-Rbbi Santander (Oslob)', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (665, N'CRSS1', N'Cib-Rboi Samboan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (666, N'CRT1', N'Cib-Rcbc Toledo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (667, N'CS1', N'Computer Software', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (668, N'CSB1', N'Cib-Srb Bantayan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (669, N'CSB2', N'Cib-Srb Balamban', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (670, N'CSF1', N'Client Saving Fund', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (671, N'CSFSA1', N'Client Savings Fund Suspense Acct', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (672, N'CSM1', N'Cib-Srb Mandaue (New)', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (673, N'CSM2', N'Cib-Ubp Mandaue', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (674, N'CSM3', N'Cib-Srb Minglanilla', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (675, N'CSO1', N'Cib-Srb Osmena', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (676, N'CSON1', N'Cib-Srb Osmena New', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (677, N'CSP1', N'Cib-Srb Pinamungajan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (678, N'CSRBBC1', N'Cib-Srb Balamban Cebu', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (679, N'CSRBM1', N'Cib-Srb Mingla.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (680, N'CTAI1', N'Client Trainings And Interventions', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (681, N'CU203101', N'Cib-Ubp-278-000-33-1-0', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (682, N'CU81', N'Cib-Ubp Main', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (683, N'CUB1', N'Cib-Ubp Borromeo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (684, N'CUBC1', N'Cib-Ubp Bacolod City', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (685, N'CUBPT1', N'Cib-Ubp Tacloban', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (686, N'CUCC1', N'Cib-Ubp Cebu City 1', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (687, N'CUCC2', N'Cib-Ubp Cebu City 2', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (688, N'CUCC3', N'Cib-Ubp Cebu City 3', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (689, N'CUCPBN', N'Cib-Ucpb Naga', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (690, N'CUCPBS', N'Cib-Ucpb Sogod', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (691, N'CUCPBT1', N'Cib-Ucpb Tuburan (Bogo)', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (692, N'CUD', N'Cib-Ubp Dumaguete (Sibulan)', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (693, N'CUDS1', N'Cib-Ubp Dumaguete (Siaton)', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (694, N'CUH1', N'Cib-Ucpb Hindang', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (695, N'CUL4', N'Cib-Ubp Lapulapu', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (696, N'CUSE1', N'Cib-Ucpb Savings (Escalante)', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (697, N'CUT1', N'Cib-Ucpb Tuburan (Asturias)', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (698, N'CYP1', N'Current Year Profit/Loss', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (699, N'DAC1', N'Donations And Contributions', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (700, N'DC', N'Deferred Credits', N'', 1)
GO
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (701, N'DE1', N'Depreciation Expenses', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (702, N'DEPYC17', N'Donated Equity -Prior Years, Cumulative', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (703, N'DEPYCY1', N'Donated Equity -Prior Years, Current Year', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (704, N'DFIP', N'Discount From Insurance Payment', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (705, N'DFIP1', N'Discount From Insurance - Philinsure', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (706, N'DII1', N'Deffered Interest Income', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (707, N'DOE', N'Direct Operating Expense', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (708, N'DOEMFI', N'Bereavement Benefit', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (709, N'DS1', N'Dues & Subscriptions', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (710, N'DTFACRM1', N'Due To/ From Affiliate Company - Rafi Mo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (711, N'DTFBAA', N'Branch Office Account - Alangalang', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (712, N'DTFBB', N'Branch Office Account - Bayawan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (713, N'DTFBB1', N'Branch Office Account - Barili', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (714, N'DTFBB2', N'Branch Office Account - Bago', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (715, N'DTFBBC1', N'Branch Office Account - Bacolod City', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (716, N'DTFBC', N'Branch Office Account - Clarin', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (717, N'DTFBC2', N'Branch Office Account - Canlaon City', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (718, N'DTFBCB', N'Branch Office Account - Consolacion', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (719, N'DTFBCB1', N'Branch Office Account - Catigbian', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (720, N'DTFBCC', N'Branch Office Account - Cadiz City', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (721, N'DTFBCC2', N'Branch Office Account - Cebu City 2', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (722, N'DTFBCC3', N'Branch Office Account - Cebu City 3', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (723, N'DTFBCL2', N'Branch Office Account - Compostela', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (724, N'DTFBD', N'Branch Office Account - Dumaguete', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (725, N'DTFBD1', N'Branch Office Account - Burauen', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (726, N'DTFBDB', N'Branch Office Account - Dalaguete', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (727, N'DTFBDC', N'Branch Office Account - Dumaguete City', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (728, N'DTFBE', N'Branch Office Account - Escalante', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (729, N'DTFBG', N'Branch Office Account - Guihulngan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (730, N'DTFBJ', N'Branch Office Account - Jimalalud', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (731, N'DTFBL', N'Branch Office Account - Loay', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (732, N'DTFBL1', N'Branch Office Account - Loon', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (733, N'DTFBL2', N'Branch Office Account - Liloan (Leyte)', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (734, N'DTFBLC1', N'Branch Office Account - La Carlota', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (735, N'DTFBMC', N'Branch Office Account - Maasin City', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (736, N'DTFBO1', N'Branch Office Account - Oslob', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (737, N'DTFBP1', N'Branch Office Account - Pinamungajan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (738, N'DTFBS', N'Branch Office Account - Siaton', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (739, N'DTFBS1', N'Branch Office Account - Sibonga', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (740, N'DTFBSB1', N'Branch Office Account - San Juan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (741, N'DTFBSC', N'Branch Office Account - Sta. Catalina', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (742, N'DTFBSCC', N'Branch Office Account - San Carlos City', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (743, N'DTFBSF1', N'Branch Office Account - San Fernando', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (744, N'DTFBSL', N'Branch Office Account - Sogod (Leyte)', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (745, N'DTFBSM', N'Branch Office Account - Barugo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (746, N'DTFBT2', N'Branch Office Account - Talibon2', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (747, N'DTFBTC1', N'Branch Office Account - Tacloban 1', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (748, N'DTHOA1', N'Due To Home Office - Argao', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (749, N'DTHOA25', N'Due To Home Office - Asturias', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (750, N'DTHOA35', N'Due To Home Office - Abuyog', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (751, N'DTHOA60', N'Due To Home Office - Alang-Alang', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (752, N'DTHOAB2', N'Due To Home Office - Mcarthur', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (753, N'DTHOAL1', N'Due To Home Office - Alicia', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (754, N'DTHOB02', N'Due To Home Office - Baybay 2', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (755, N'DTHOB18', N'Due To Home Office - Bato', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (756, N'DTHOB21', N'Due To Home Office - Baybay', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (757, N'DTHOB32', N'Due To Home Office - Bais', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (758, N'DTHOB44', N'Due To Home Office - Bayawan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (759, N'DTHOB5', N'Due To Home Office - Bogo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (760, N'DTHOB56', N'Due To Home Office - Barili', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (761, N'DTHOB58', N'Due To Home Office - Bacolod', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (762, N'DTHOb66', N'Due To Home Office - Barugo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (763, N'DTHOB7', N'Due To Home Office - Bantayan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (764, N'DTHOB70', N'Due To Home Office - Burauen-Leyte', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (765, N'DTHOB74', N'Due To Home Office - Bago', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (766, N'DTHOBAL1', N'Due To Home Office - Balamban', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (767, N'DTHOBB1', N'Due To Home Office - Binalbagan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (768, N'DTHOBN01', N'Due To Home Office - Barotac Nuevo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (769, N'DTHOBOR1', N'Due To Home Office - Borbon', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (770, N'DTHOBS1', N'Due To Home Office - Basey', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (771, N'DTHOBV01', N'Due To Home Office - Barotac Viejo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (772, N'DTHOC11', N'Due To Home Office - Carmen', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (773, N'DTHOC14', N'Due To Home Office - Carigara', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (774, N'DTHOC2', N'Due To Home Office - Carcar', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (775, N'DTHOC4', N'Due To Home Office - Cebu City', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (776, N'DTHOC40', N'Due To Home Office - Clarin', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (777, N'DTHOC50', N'Due To Home Office - Canlaon', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (778, N'DTHOC53', N'Due To Home Office - Cadiz', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (779, N'DTHOC54', N'Due To Home Office - Consolacion', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (780, N'DTHOC55', N'Due To Home Office - Compostela', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (781, N'DTHOC67', N'Due To Home Office - Cebu City 2', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (782, N'DTHOC68', N'Due To Home Office - Cebu City 3', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (783, N'DTHOC73', N'Due To Home Office - Catigbian', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (784, N'DTHOC8', N'Due To Home Office - Camotes', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (785, N'DTHOCA1', N'Due To Home Office - Cauayan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (786, N'DTHOCADC2', N'Due To Home Office - Cadiz City 2', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (787, N'DTHOCAL1', N'Due To Home Office - Calape', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (788, N'DTHOCALC1', N'Due To Home Office - Calbayog City', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (789, N'DTHOCAP1', N'Due To Home Office - Capoocan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (790, N'DTHOCAT1', N'Due To Home Office - Catarman', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (791, N'DTHOCATS', N'Due To Home Office - Catbalogan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (792, N'DTHOD12', N'Due To Home Office - Dulag', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (793, N'DTHOD19', N'Due To Home Office - Danao', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (794, N'DTHOD38', N'Due To Home Office - Daan Bantayan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (795, N'DTHOD47', N'Due To Home Office - Dumaguete', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (796, N'DTHOD6', N'Due To Home Office - Dumanjug', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (797, N'DTHOD64', N'Due To Home Office - Dalaguete', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (798, N'DTHODB1', N'Due To Home Office - Dimiao', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (799, N'DTHODU2', N'Due To Home Office - Dulag 2', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (800, N'DTHOE52', N'Due To Home Office - Escalante', N'', 1)
GO
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (801, N'DTHOG1', N'Due To Home Office - Getafe', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (802, N'DTHOG34', N'Due To Home Office - Guindulman', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (803, N'DTHOG49', N'Due To Home Office - Guihulngan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (804, N'DTHOH1', N'Due To Home Office - Himamaylan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (805, N'DTHOHI01', N'Due To Home Office - Hinunangan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (806, N'DTHOHI02', N'Due To Home Office - Hilongos', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (807, N'DTHOHI1', N'Due To Home Office - Hinigaran', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (808, N'DTHOI33', N'Due To Home Office - Inabanga', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (809, N'DTHOJ24', N'Due To Home Office - Jagna', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (810, N'DTHOJ48', N'Due To Home Office - Jimalalud', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (811, N'DTHOK1', N'Due To Home Office - Kabankalan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (812, N'DTHOL36', N'Due To Home Office - Lapu-Lapu', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (813, N'DTHOL42', N'Due To Home Office - Loon', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (814, N'DTHOL43', N'Due To Home Office - Loay', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (815, N'DTHOL62', N'Due To Home Office - Liloan-Leyte', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (816, N'DTHOL75', N'Due To Home Office - La Carlota', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (817, N'DTHOLIC1', N'Due To Home Office - Leganes', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (818, N'DTHOM28', N'Due To Home Office - Mandaue', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (819, N'DTHOM31', N'Due To Home Office - Moalboal', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (820, N'DTHOM71', N'Due To Home Office - Maasin-Leyte', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (821, N'DTHOMA1', N'Due To Home Office - Mabinay', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (822, N'DTHOMIC1', N'Due To Home Office - Miagao', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (823, N'DTHOMIN1', N'Due To Home Office - Minglanilla', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (824, N'DTHON02', N'Due To Home Office - Naval 2', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (825, N'DTHON13', N'Due To Home Office - Naval', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (826, N'DTHON20', N'Due To Home Office - Naga', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (827, N'DTHOO16', N'Due To Home Office - Ormoc 2', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (828, N'DTHOO23', N'Due To Home Office - Ormoc 1', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (829, N'DTHOO65', N'Due To Home Office - Oslob', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (830, N'DTHOOC3', N'Due To Home Office - Ormoc 3', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (831, N'DTHOOIC1', N'Due To Home Office - Oton', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (832, N'DTHOP15', N'Due To Home Office - Palo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (833, N'DTHOP3', N'Due To Home Office - Palompon', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (834, N'DTHOP61', N'Due To Home Office - Pinamungajan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (835, N'DTHOPB02', N'Due To Home Office - Panglao', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (836, N'DTHOPD01', N'Due To Home Office - Padre Burgos', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (837, N'DTHOPIC01', N'Due To Home Office - Passi', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (838, N'DTHOPIC1', N'Due To Home Office - Pototan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (839, N'DTHOS27', N'Due To Home Office - Samboan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (840, N'DTHOS29', N'Due To Home Office - Sogod', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (841, N'DTHOS30', N'Due To Home Office - Sibulan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (842, N'DTHOS39', N'Due To Home Office - Siquijor', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (843, N'DTHOS45', N'Due To Home Office - Sta. Catalina', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (844, N'DTHOS46', N'Due To Home Office - Siaton', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (845, N'DTHOS51', N'Due To Home Office - San Carlos', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (846, N'DTHOS57', N'Due To Home Office - San Fernando', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (847, N'DTHOs63', N'Due To Home Office - San Juan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (848, N'DTHOS69', N'Due To Home Office - Sibonga', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (849, N'DTHOS72', N'Due To Home Office - Sogod-Leyte', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (850, N'DTHOSA1', N'Due To Home Office - Sagay', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (851, N'DTHOSB01', N'Due To Home Office - Sta. Barbara', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (852, N'DTHOSB1', N'Due To Home Office - Sierra Bullones', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (853, N'DTHOSC1', N'Due To Home Office - Silay', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (854, N'DTHOSI1', N'Due To Home Office - Sipalay', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (855, N'DTHOSIC', N'Due To Home Office - Sara', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (856, N'DTHOSR1', N'Due To Home Office - San Remigio', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (857, N'DTHOT17', N'Due To Home Office - Toledo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (858, N'DTHOT2', N'Due To Home Office - Tagbilaran 2', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (859, N'DTHOT22', N'Due To Home Office - Talibon', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (860, N'DTHOT26', N'Due To Home Office - Tagbilaran', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (861, N'DTHOT37', N'Due To Home Office - Talisay', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (862, N'DTHOT41', N'Due To Home Office - Talibon 2', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (863, N'DTHOT59', N'Due To Home Office - Tacloban 1', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (864, N'DTHOT9', N'Due To Home Office - Tubigon', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (865, N'DTHOTAC2', N'Due To Home Office - Tacloban 2', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (866, N'DTHOU10', N'Due To Home Office - Ubay', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (867, N'DTHOV1', N'Due To Home Office - Victorias', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (868, N'EAPS18', N'Christmas And Other Employee Activities', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (869, N'EBP', N'Ee Bond Payable', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (870, N'EBPA1', N'Ee Bond Payable- Autida,Jerson', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (871, N'EBPA2', N'Ee Bond Payable-Lim,Ailyne', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (872, N'EBPA3', N'Ee Bond Payable- Corage, Julius G.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (873, N'EBPAA1', N'Ee Bond Payable- Abella, Aileen', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (874, N'EBPAFJ1', N'Ee Bond Payable-Cubian, Webster G.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (875, N'EBPAI1', N'Ee Bond Payable-Cubio, Ramil T.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (876, N'EBPAJ1', N'Ee Bond Payable-Agan, Jess', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (877, N'EBPAJ2', N'Ee Bond Payable- Bugsocan, Junrey', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (878, N'EBPAJJ1', N'Ee Bond Payable- Ariate. Juanito Jr.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (879, N'EBPAM1', N'Ee Bond Payable-Asmad, Mirasol', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (880, N'EBPAM2', N'Ee Bond Payable- Abalde, Marlon', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (881, N'EBPAMG1', N'Ee Bond Payable-Ampong, Mary Grace', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (882, N'EBPAPK1', N'Ee Bond Payable- Abalde, Princess Keith', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (883, N'EBPAR1', N'Ee Bond Payable- Amadar, Ryan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (884, N'EBPAR2', N'Ee Bond Payable- Alvarado, Randy', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (885, N'EBPAZ1', N'Ee Bond Payable-Amamangpang, Zaida', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (886, N'EBPB1', N'Ee Bond Payable- Bignotea,Jeffrey', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (887, N'EBPB2', N'Ee Bond Payable-Bacus,Orlane', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (888, N'EBPB3', N'Ee Bond Payable- Boncales,Roberto', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (889, N'EBPBA1', N'Ee Bond Payable- Bantawig, Adolfo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (890, N'EBPBA2', N'Ee Bond Payable-Bertolano, Avigayl', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (891, N'EBPBA3', N'Ee Bond Payable-Betinol, Absalona', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (892, N'EBPBBA1', N'Ee Bond Payable- Bordadora, Bryan A.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (893, N'EBPBC1', N'Ee Bond Payable- Cuesta, Julius C.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (894, N'EBPBC2', N'Ee Bond Payable- Baroman, Carlito', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (895, N'EBPBCM1', N'Ee Bond Payable-Bangca, Charlie Mae', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (896, N'EBPBE1', N'Ee Bond Payable-Tapinit, Myra', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (897, N'EBPBE2', N'Ee Bond Payable-Bongcards, Emmanuel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (898, N'EBPBE3', N'Ee Bond Payable-Butal, Edward', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (899, N'EBPBF1', N'Ee Bond Payable- Bandalan, Frances', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (900, N'EBPBJJS1', N'Ee Bond Payable-Baccay, Jossel Jay S.', N'', 1)
GO
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (901, N'EBPBL1', N'Ee Bond Payable-Bange, Leizel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (902, N'EBPBM1', N'Ee Bond Payable-Bolacito, Mitchel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (903, N'EBPBM2', N'Ee Bond Payable-Baa, Marlon', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (904, N'EBPBM3', N'Ee Bond Payable- Batiller, Mitchel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (905, N'EBPBM4', N'Ee Bond Payable-Curaraton, Jeremias B.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (906, N'EBPBML1', N'Ee Bond Payable-Batucan, Maria Li', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (907, N'EBPBN1', N'Ee Bond Payable- Borong, Nigil', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (908, N'EBPBN2', N'Ee Bond Payable- Balaquia, Nelson', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (909, N'EBPBOTJ1', N'Ee Bond Payable-Bayon-On, Teotimo Jr.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (910, N'EBPBR1', N'Ee Bond Payable- Boholst, Rey', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (911, N'EBPBR2', N'Ee Bond Payable- Briones, Reynard', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (912, N'EBPBR3', N'Ee Bond Payable-Bayotas, Ruvie', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (913, N'EBPBR4', N'Ee Bond Payable- Baladjay, Raffy', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (914, N'EBPBSJ1', N'Ee Bond Payable- Baraquil, Saule Jr.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (915, N'EBPBV1', N'Ee Bond Payable-Biscayda, Vemanda', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (916, N'EBPC1', N'Ee Bond Payable- Cequiña,Roberto', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (917, N'EBPC2', N'Ee Bond Payable- Casquijo,Lilibeth', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (918, N'EBPC3', N'Ee Bond Payable-Cutanda,Jaime', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (919, N'EBPC4', N'Ee Bond Payable- Camacho,Madeo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (920, N'EBPC5', N'Ee Bond Payable-Camaso,Gualberto', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (921, N'EBPC6', N'Ee Bond Payable-Cutora, Joemarie M.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (922, N'EBPCG01', N'Ee Bond Payable  - Catipay,Gomersendo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (923, N'EBPCJ1', N'Ee Bond Payable- Cadalso, Juvanny', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (924, N'EBPCJ2', N'Ee Bond Payable-Ceno, Jarmine', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (925, N'EBPCJM1', N'Ee Bond Payable- Ceniza, Jesus M.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (926, N'EBPCK1', N'Ee Bond Payable-Dagatan, Teresa G.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (927, N'EBPCL1', N'Ee Bond Payable-Cano, Lafe', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (928, N'EBPCM1', N'Ee Bond Payable-Catingan, Maritiss', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (929, N'EBPCML1', N'Ee Bond Payable-Cosenas, Mark Louie', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (930, N'EBPCMT1', N'Ee Bond Payable-Catipay, Ma. Theresa', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (931, N'EBPCR1', N'Ee Bond Payable- Calaycay, Raniel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (932, N'EBPCR2', N'Ee Bond Payable-Dalapo, Lelanie B.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (933, N'EBPCR3', N'Ee Bond Payable-Candilada, Richard', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (934, N'EBPCR4', N'Ee Bond Payable-Cañaveral, Roslyn', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (935, N'EBPCRF1', N'Ee Bond Payable-Dawaton, Cheto E.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (936, N'EBPCRJB1', N'Ee Bond Payable- Cutamora, Romeo Jr. B.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (937, N'EBPDA1', N'Ee Bond Payable- Del Carmen, Victor L.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (938, N'EBPDKP1', N'Ee Bond Payable-Diocampo, Keith Pj', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (939, N'EBPDL1', N'Ee Bond Payable- Dela Cruz, Archie H.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (940, N'EBPDR1', N'Ee Bond Payable-Donayre, Ronald', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (941, N'EBPDR2', N'Ee Bond Payable-Destacamento, Radclief', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (942, N'EBPE1', N'Ee Bond Payable- Estrada,Marcelo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (943, N'EBPE3', N'Ee Bond Payable- Donaire, Mark G.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (944, N'EBPEA1', N'Ee Bond Payable-Empinado, Arnel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (945, N'EBPEE1', N'Ee Bond Payable - Amodia, April', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (946, N'EBPEE10', N'Ee Bond Payable-	De La Cruz, Ciryl', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (947, N'EBPEE11', N'Ee Bond Payable-	Habasa, Ralph Rejie', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (948, N'EBPEE12', N'Ee Bond Payable-	Laurete, Kirk Joseph', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (949, N'EBPEE13', N'Ee Bond Payable-	Lavandero,Dale', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (950, N'EBPEE14', N'Ee Bond Payable-	Lopez, Michael', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (951, N'EBPEE15', N'Ee Bond Payable-	Lumayag,Jessimen', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (952, N'EBPEE16', N'Ee Bond Payable-	Manondo, Yealie', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (953, N'EBPEE17', N'Ee Bond Payable-	Maraguinot, Pedro Jr.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (954, N'EBPEE18', N'Ee Bond Payable-	Maturan, Samuel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (955, N'EBPEE19', N'Ee Bond Payable-	Plantado, Kemco', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (956, N'EBPEE2', N'Ee Bond Payable-	Abasolo, Irmina', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (957, N'EBPEE20', N'Ee Bond Payable-	Rita, Florabel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (958, N'EBPEE21', N'Ee Bond Payable-	Taneo,Rizalde', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (959, N'EBPEE22', N'Ee Bond Payable- 	Aranzado,Marcelina', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (960, N'EBPEE23', N'Ee Bond Payable- 	Bitagan, Christopher', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (961, N'EBPEE24', N'Ee Bond Payable- 	Bolotaolo,Anaree', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (962, N'EBPEE25', N'Ee Bond Payable- 	Calaycay, Raniel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (963, N'EBPEE26', N'Ee Bond Payable- 	Calderon,Isabelo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (964, N'EBPEE27', N'Ee Bond Payable- 	Desamparado, Alona', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (965, N'EBPEE28', N'Ee Bond Payable- 	Dupal,Jeus Lloyd', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (966, N'EBPEE29', N'Ee Bond Payable- 	Garcia,Aga', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (967, N'EBPEE3', N'Ee Bond Payable-	Alcoseba, Felicisimo Jr', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (968, N'EBPEE30', N'Ee Bond Payable- 	Gonzales, Rhea', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (969, N'EBPEE31', N'Ee Bond Payable- 	Landero,Gwendolyn', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (970, N'EBPEE32', N'Ee Bond Payable- 	Lendio,Carl Anthoy', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (971, N'EBPEE33', N'Ee Bond Payable- 	Loterte,Jovelyn', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (972, N'EBPEE34', N'Ee Bond Payable- 	Marfa,Jemar', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (973, N'EBPEE35', N'Ee Bond Payable- 	Monteron,Pedro', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (974, N'EBPEE36', N'Ee Bond Payable- 	Ortiz,Martilino', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (975, N'EBPEE37', N'Ee Bond Payable- 	Pareja,Elesito', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (976, N'EBPEE38', N'Ee Bond Payable- 	Quiton,Carmilyn', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (977, N'EBPEE39', N'Ee Bond Payable- 	Sarco,Reo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (978, N'EBPEE4', N'Ee Bond Payable-	Anunciado, Jundy', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (979, N'EBPEE40', N'Ee Bond Payable- 	Suan, Jolly Bien', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (980, N'EBPEE41', N'Ee Bond Payable- 	Tabat, Felix  Jr.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (981, N'EBPEE42', N'Ee Bond Payable- 	Timtim, Milogin', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (982, N'EBPEE43', N'Ee Bond Payable- 	Vitorioso, Jake', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (983, N'EBPEE5', N'Ee Bond Payable-	Arradaza,Chrisofel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (984, N'EBPEE6', N'Ee Bond Payable-	Belga, Ernest', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (985, N'EBPEE7', N'Ee Bond Payable-	Bravo, Mirasol', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (986, N'EBPEE8', N'Ee Bond Payable-	Cordova, Rosmar F.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (987, N'EBPEE9', N'Ee Bond Payable-	Cuizon, Rolex', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (988, N'EBPEIR1', N'Ee Bond Payable-Estremos, Imee Rose', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (989, N'EBPEMJ1', N'Ee Bond Payable-Estorba, Marcelino Jr.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (990, N'EBPFSJ1', N'Ee Bond Payable-Fronteras, Sergio Jr', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (991, N'EBPG1', N'Ee Bond Payable- Ege, Dindo J.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (992, N'EBPGA1', N'Ee Bond Payable- Galon, Arniel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (993, N'EBPGG1', N'Ee Bond Payable-Gimpayan, Gina', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (994, N'EBPGJ1', N'Ee Bond Payable-Gonzales,Nenito Jr.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (995, N'EBPGLC1', N'Ee Bond Payable- Gonzaga, Luzviminda C.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (996, N'EBPGM1', N'Ee Bond Payable-Gallego, Melody', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (997, N'EBPGMI1', N'Ee Bond Payable- Gomez, Marlou I.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (998, N'EBPGR1', N'Ee Bond Payable-Geyrozaga, Roel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (999, N'EBPGR2', N'Ee Bond Payable-Garcia, Ronnie', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1000, N'EBPGR3', N'Ee Bond Payable- Enad, Marjurie B.', N'', 1)
GO
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1001, N'EBPH1', N'Ee Bond Payable- Hontanosas,Leo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1002, N'EBPHL1', N'Ee Bond Payable-Herbito, Leonora', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1003, N'EBPHRR1', N'Ee Bond Payable-Estimada, Jupiter R.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1004, N'EBPI1', N'Ee Bond Payable- Isoto,Susan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1005, N'EBPIIA1', N'Ee Bond Payable-Ib-Ib, Arnold', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1006, N'EBPJ1', N'Ee Bond Payable- Jamora,Nube', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1007, N'EBPJA1', N'Ee Bond Payable- Jumao-As,Edisa', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1008, N'EBPJB1', N'Ee Bond Payable-Jerwin Baoy', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1009, N'EBPJJN1', N'Ee Bond Payable- Jalover, Jermain Neil', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1010, N'EBPJM1', N'Ee Bond Payable-Juliet Mendoza', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1011, N'EBPKC1', N'Ee Bond Payable - Various Inactive', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1012, N'EBPL1', N'Ee Bond Payable- Fano, Jimboy G.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1013, N'EBPL2', N'Ee Bond Payable-Gentallan, Telesforo N.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1014, N'EBPL3', N'Ee Bond Payable- Labajo,Louie', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1015, N'EBPLA1', N'Ee Bond Payable- Forrosuelo, Mark Jenaz N.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1016, N'EBPLF1', N'Ee Bond Payable-Lerasan, Fe', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1017, N'EBPLJ1', N'Ee Bond Payable-Lopez, Judith', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1018, N'EBPLJ2', N'Ee Bond Payable-Lauglaug, Juhnrey', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1019, N'EBPLM1', N'Ee Bond Payable-Golis, Daryl James E.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1020, N'EBPLR1', N'Ee Bond Payable- Locaylocay, Reynan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1021, N'EBPM1', N'Ee Bond Payable- Miral,Reymond', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1022, N'EBPM2', N'Ee Bond Payable-Marquez,Dee', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1023, N'EBPMA1', N'Ee Bond Payable- Malabon, Arnel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1024, N'EBPMA2', N'Ee Bond Payable-Masong, Ariel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1025, N'EBPMAC1', N'Ee Bond Payable- Mibato, Alvin C.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1026, N'EBPMAJR1', N'Ee Bond Payable- Morados, Al Jesko R.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1027, N'EBPMB1', N'Ee Bond Payable-Mundo, Bochie', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1028, N'EBPMC1', N'Ee Bond Payable-Mondin, Cheryl', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1029, N'EBPMCD1', N'Ee Bond Payable- Meca, Christian Dev', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1030, N'EBPMCM1', N'Ee Bond Payable- Millan, Charles M.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1031, N'EBPMJ01', N'Ee Bond Payable-Montecalvo, John Sanrio R.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1032, N'EBPMJ1', N'Ee Bond Payable- Matigas, Jonalyn', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1033, N'EBPMJ2', N'Ee Bond Payable-Gualvez, Richard O.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1034, N'EBPMJD1', N'Ee Bond Payable- Montes, Jessa D.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1035, N'EBPMM01', N'Ee Bond Payable-Mondido, Micel C.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1036, N'EBPMM02', N'Ee Bond Payable-Morales, Mark Aldrin T.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1037, N'EBPMM1', N'Ee Bond Payable-Maspara, Monette', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1038, N'EBPMN01', N'Ee Bond Payable-Mulit, Noel S.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1039, N'EBPMPJ1', N'Ee Bond Payable-Gurrea, Velle Eddieson T.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1040, N'EBPMS1', N'Ee Bond Payable-Hibaya, Mil Rey T.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1041, N'EBPNA1', N'Ee Bond Payable-Hoyle, Maricris B.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1042, N'EBPNE1', N'Ee Bond Payable- Nunez, Edelyn', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1043, N'EBPNJ01', N'Ee Bond Payable-Nellas, Joemel E.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1044, N'EBPNJ1', N'Ee Bond Payable-Nudalo, Jeal', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1045, N'EBPNJ2', N'Ee Bond Payable-Nunez, Joenard', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1046, N'EBPNMT1', N'Ee Bond Payable-Navacilla, Ma. Thelma', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1047, N'EBPNN1', N'Ee Bond Payable-Navacilla, Naomi', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1048, N'EBPNR1', N'Ee Bond Payable- Nalo, Rolino', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1049, N'EBPO1', N'Ee Bond Payable- Orbiso,May', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1050, N'EBPO2', N'Ee Bond Payable- Oroyan,Jonathan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1051, N'EBPOAG1', N'Ee Bond Payable- Oliverio, Analyn G.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1052, N'EBPOJ1', N'Ee Bond Payable- Otadoy. Joebert', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1053, N'EBPOMJ1', N'Ee Bond Payable- Ocarol, Mark Jacky', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1054, N'EBPP1', N'Ee Bond Payable- Polestico,Alvin', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1055, N'EBPP2', N'Ee Bond Payable- Polestico,Aiza', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1056, N'EBPP3', N'Ee Bond Payable- Jagus, Ronel T.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1057, N'EBPPA1', N'Ee Bond Payable-Paquibot, Alexandro', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1058, N'EBPPEJA1', N'Ee Bond Payable- Padillos, Eufemio Jr. A', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1059, N'EBPPJ01', N'Ee Bond Payable-Patolilic, John Louie B.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1060, N'EBPPK1', N'Ee Bond Payable- Lapiz, Melissa L.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1061, N'EBPPM1', N'Ee Bond Payable- Pepito, Melanie', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1062, N'EBPPM2', N'Ee Bond Payable-Pejano, Maribel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1063, N'EBPPM3', N'Ee Bond Payable- Panagas, Michel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1064, N'EBPPNA1', N'Ee Bond Payable- Pacquiao, Niel Anthony', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1065, N'EBPPR01', N'Ee Bond Payable-Paden, Rey Jay C.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1066, N'EBPQ1', N'Ee Bond Payable- Laurente, Gemson C.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1067, N'EBPR1', N'Ee Bond Payable- Roslin,Reynaldo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1068, N'EBPRA1', N'Ee Bond Payable-Recosana, Arron', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1069, N'EBPRC1', N'Ee Bond Payable-Remorosa, Charito', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1070, N'EBPRC2', N'Ee Bond Payable-Rabasano, Charen', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1071, N'EBPRE1', N'Ee Bond Payable- Remoreras, Eleumore', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1072, N'EBPRE2', N'Ee Bond Payable-Rollon, Evelyn', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1073, N'EBPRF1', N'Ee Bond Payable- Rabadon, Flor', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1074, N'EBPRJ1', N'Ee Bond Payable-Rondero, Joseph', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1075, N'EBPRM1', N'Ee Bond Payable-Rabor, Marne', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1076, N'EBPRMH1', N'Ee Bond Payable- Renoblas, Maria Hian', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1077, N'EBPRPJJ1', N'Ee Bond Payable- Ruales, Pedro Jr. J.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1078, N'EBPRR1', N'Ee Bond Payable-Romano, Ronnel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1079, N'EBPRS1', N'Ee Bond Payable- Rodriguez, Stephanie', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1080, N'EBPRV01', N'Ee Bond Payable- Verallo, Rocky', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1081, N'EBPRV1', N'Ee Bond Payable- Resuelo, Victor', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1082, N'EBPS1', N'Ee Bond Payable- Lebarnes, Emmanuel A.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1083, N'EBPS2', N'Ee Bond Payable- Salutan,Anthony', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1084, N'EBPS3', N'Ee Bond Payable- Sencio,Dominic', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1085, N'EBPSA1', N'Ee Bond Payable-Salvador, Antonio', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1086, N'EBPSC1', N'Ee Bond Payable-Suquib, Cresilda', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1087, N'EBPSD1', N'Ee Bond Payable-Salvo, Dennis', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1088, N'EBPSE1', N'Ee Bond Payable- Sanchez, Edgar', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1089, N'EBPSJ1', N'Ee Bond Payable- Salili, Julieto', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1090, N'EBPSJ2', N'Ee Bond Payable- Sotto, Jonald', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1091, N'EBPSJ3', N'Ee Bond Payable-Seguros, Jason', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1092, N'EBPSJB1', N'Ee Bond Payable- Lepon, Ryan Carlo B.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1093, N'EBPSO1', N'Ee Bond Payable-Sayago, Oliver', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1094, N'EBPSR1', N'Ee Bond Payable-Sevilla, Ronald', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1095, N'EBPSR2', N'Ee Bond Payable-Salaritan, Ranmar', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1096, N'EBPSRM1', N'Ee Bond Payable- Suralta, Rodgie M.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1097, N'EBPSSR1', N'Ee Bond Payable- Simporios, Seth R.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1098, N'EBPT1', N'Ee Bond Payable-Luega, Bernardo T.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1099, N'EBPT2', N'Ee Bond Payable- Tante,Christian', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1100, N'EBPTFJ1', N'Ee Bond Payable- Lupas, Jessie Paul D.', N'', 1)
GO
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1101, N'EBPTJ1', N'Ee Bond Payable-Tanza, Jacob', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1102, N'EBPTJ2', N'Ee Bond Payable-Tan, Jerica', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1103, N'EBPTJ3', N'Ee Bond Payable-Tapia, Jeaniedel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1104, N'EBPTJ4', N'Ee Bond Payable-Tuñacao, Jay', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1105, N'EBPTM1', N'Ee Bond Payable- Maquipoten, Clifford V.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1106, N'EBPTM2', N'Ee Bond Payable- Tapinit, Marjun', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1107, N'EBPTM3', N'Ee Bond Payabe-Tapinit, Margarito', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1108, N'EBPTRVG1', N'Ee Bond Payable- Toledo, Reil Vincent G.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1109, N'EBPV1', N'Ee Bond Payable- Villordon,Lenson', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1110, N'EBPVA1', N'Ee Bond Payable-Vanzuela, Arman', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1111, N'EBPVEA1', N'Ee Bond Payable-Various Ee(In Active)', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1112, N'EBPVJ1', N'Ee Bond Payable-Villarin, Jomarie', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1113, N'EBPVJ2', N'Ee Bond Payable-Virtucio, Joecylito', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1114, N'EBPVJ3', N'Ee Bond Payable- Marchadesch, Nikko B.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1115, N'EBPYSL1', N'Ee Bond Payable-Ycong, Sherwin Leo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1116, N'EBPZ1', N'Ee Bond Payable- Zurita,Alfeo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1117, N'EBPZA1', N'Ee Bond Payable-Zarriaga, Arriane', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1118, N'EBPZA2', N'Ee Bond Payable-Meca, Jufil M.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1119, N'EBPZHB1', N'Ee Bond Payable-Zurita, Hilario B.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1120, N'EBPZR1', N'Ee Bond Payable-Zamora, Richard', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1121, N'EEAC01', N'Ee Bond Payable-Antigo, Catherine B.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1122, N'EEAH01', N'Ee Bond Payable-Ares, Hannah Marie C.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1123, N'EEAJ01', N'Ee Bond Payable-Abellana, Johnburnham D.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1124, N'EEAJ02', N'Ee Bond Payable-Almerida, Juvelyn R.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1125, N'EEAJ03', N'Ee Bond Payable-Anabieza, Jeffrey M.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1126, N'EEAR01', N'Ee Bond Payable-Almaden, Ray Anthony B.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1127, N'EEBC01', N'Ee Bond Payable-Baroman, Carlito I.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1128, N'EEBG01', N'Ee Bond Payable-Baraga, Gracyl B.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1129, N'EEBJ01', N'Ee Bond Payable-Bacolod, Jomar S.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1130, N'EEBJ02', N'Ee Bond Payable-Batohinog, Jeniza G.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1131, N'EEBJ03', N'Ee Bond Payable-Balahay, Joeshel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1132, N'EEBJ04', N'Ee Bond Payable-Betonio, Juliet', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1133, N'EECA01', N'Ee Bond Payable-Cabatingan, Adelbert Jarvis J.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1134, N'EECA02', N'Ee Bond Payable-Coquilla, Adan N.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1135, N'EECA03', N'Ee Bond Payable-Capio, April Ann', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1136, N'EECB01', N'Ee Bond Payable-Castolo, Baby', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1137, N'EECC01', N'Ee Bond Payable-Comendador, Ciff Jason S.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1138, N'EECG01', N'Ee Bond Payable-Catipay, Gomersendo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1139, N'EECJ01', N'Ee Bond Payable-Coralde, Jocelyn', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1140, N'EECL01', N'Ee Bond Payable-Cavalida, Lyel Adams N.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1141, N'EECM01', N'Ee Bond Payable-Casas, Michel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1142, N'EECN01', N'Ee Bond Payable-Capuyan, Nenen P.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1143, N'EECR01', N'Ee Bond Payable-Clamonte, Ricky V.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1144, N'EECR02', N'Ee Bond Payable-Clarinan, Ridel F.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1145, N'EECS01', N'Ee Bond Payable-Cimeni, Santijun G.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1146, N'EECW01', N'Ee Bond Payable-Cagatin, Wendell A.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1147, N'EEDE01', N'Ee Bond Payable-Dalapo, Elleonor', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1148, N'EEEL01', N'Ee Bond Payable-Embalzado, Larry', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1149, N'EEJJ01', N'Ee Bond Payable-Japitan, John', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1150, N'EEJM01', N'Ee Bond Payable-Maylon, Jessie', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1151, N'EEJM02', N'Ee Bond Payable-Jordan, Melger', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1152, N'EELJ01', N'Ee Bond Payable-Leonardo, Jesryn', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1153, N'EEPE01', N'Ee Bond Payable-Pampelon, Bernie', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1154, N'EEPJ01', N'Ee Bond Payable-Pilapil, Junnar A.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1155, N'EEPY01', N'Ee Bond Payable-Poliquit, Yul Brian D.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1156, N'EEPZR01', N'Ee Bond Payable-Abequibel, Gretchen', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1157, N'EERCF02', N'Ee Bond Payable- Clarinan, Ridel F.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1158, N'EERF01', N'Ee Bond Payable-Recarte, Jovannie G.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1159, N'EESC01', N'Ee Bond Payable-Salazar, Chester C.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1160, N'EESC02', N'Ee Bond Payable-Simogan, Christopher M.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1161, N'EESD01', N'Ee Bond Payable-Serban, Dennis R.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1162, N'EESJ01', N'Ee Bond Payable-Secretaria, Jasil S.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1163, N'EESJ02', N'Ee Bond Payable-Soroño, Jonathan B.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1164, N'EESJ03', N'Ee Bond Payable-Sorono, Jonathan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1165, N'EESL01', N'Ee Bond Payable-Sotto, Laurince C.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1166, N'EESV01', N'Ee Bond Payable-Saballa, Vincent N.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1167, N'EETC01', N'Ee Bond Payable-Tapilot, Charlene P.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1168, N'EETG01', N'Ee Bond Payable-Torrentira, Gery', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1169, N'EETJ01', N'Ee Bond Payable-Tibay, Junmar Vincent R.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1170, N'EETJ02', N'Ee Bond Payable-Tibay, Jonathan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1171, N'EETJ03', N'Ee Bond Payable-Torrejos, Joemar', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1172, N'EETN01', N'Ee Bond Payable-Tero, Nelson N.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1173, N'EEUM01', N'Ee Bond Payable-Undang, Mary Ann M.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1174, N'EEVG01', N'Ee Bond Payable-Villahermosa, Gerlie B.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1175, N'EEVJ01', N'Ee Bond Payable-Valmoria, Jean Paul M.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1176, N'EEVR01', N'Ee Bond Payable-Valencia, Rhyder Silvestre D.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1177, N'EEVR02', N'Ee Bond Payable-Valmoria, Ronel F.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1178, N'EEVR03', N'Ee Bond Payable-Verallo, Rocky', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1179, N'EIB1', N'Employee Insurance Bond', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1180, N'EQUI', N'Equity', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1181, N'ER1', N'Rent Expense - Equipment', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1182, N'EXPE', N'Expense', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1183, N'FC', N'Financial Cost', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1184, N'FF1', N'Filing Fee', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1185, N'FP1', N'Field Premium', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1186, N'FPL1', N'Fund Payable-Lrf', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1187, N'FR', N'Financial Revenue', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1188, N'FRMFI', N'Micro Finance Income', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1189, N'FROFI', N'Other Financial Income', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1190, N'FTF1', N'Fare & Toll Fee', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1191, N'GAE1', N'General Assembly Expenses', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1192, N'GAO1', N'Gasoline And Oil', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1193, N'GAT1', N'Gifts And Tokens', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1194, N'HOA1', N'Home Office Account', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1195, N'HPHA1', N'Hotel/ Pension House Accomodation', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1196, N'IAFIFL1', N'Interest And Fee Income From Loans', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1197, N'IBA1', N'Inter-Branch Account', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1198, N'IBPOCS20', N'Interest /Bonus Paid On Client Savings', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1199, N'IBPOLTD18', N'Interest /Bonus Paid On Long-Term Debt-', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1200, N'ICR1', N'Insurance Claims Receivable', N'', 1)
GO
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1201, N'IEB1', N'Insurance Expense-Bldg', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1202, N'IETE19', N'Insurance Expense-Transportation Equipt', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1203, N'IFI1', N'Income From Investments', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1204, N'IFOFRS20', N'Income From Other Finance-Related Sevice', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1205, N'INCO', N'Revenue', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1206, N'INTEROFF', N'Inter Office', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1207, N'IONCL', N'Noncurrent Liabilities', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1208, N'IPIFP', N'Insurance Fund Payable', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1209, N'IPKFP', N'Kaagabay Fund Payables', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1210, N'IPOSTB18', N'Interest Paid On Short-Term Borrowings', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1211, N'IR1', N'Insurance Receivable', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1212, N'JSS4', N'Janitorial,Messengerial & Security Services', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1213, N'KFP1', N'Kf Funds Payable', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1214, N'LA1', N'Load Allowance', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1215, N'LBJ1', N'Loan Receivable Employees- Bugsocan, Junrey', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1216, N'LF1', N'Legal Fees', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1217, N'LFCL1', N'Loan Fees/Service Charges Loans', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1218, N'LI1', N'Leashold Improvements', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1219, N'LIAB', N'Liability', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1220, N'LLPC1', N'Loan Loss Provision  -Clients', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1221, N'LLPE1', N'Loan Loss Provision - Employees', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1222, N'LP', N'Loans Payable', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1223, N'LP1', N'Lrf Payable', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1224, N'LPPI1', N'Loans Payable-Plan Intl', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1225, N'LPSBC', N'Loans Payable - Sbc', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1226, N'LR3MJ01', N'Loan Receivable Employees- Matigas, Jonalyn', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1227, N'LRC2', N'Loan  Receivable - Clients', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1228, N'LRE1', N'Loan Receivable Employees', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1229, N'LRE1LRE1', N'Loan Receivable Employees- Cadalso, Juva', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1230, N'LRE1LRE10', N'Loan Receivable Employees-Estender, Wils', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1231, N'LRE1LRE11', N'Loan Receivable Employees-Etcobanez, Rol', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1232, N'LRE1LRE12', N'Loan Receivable Employees-Mark Louie', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1233, N'LRE1LRE13', N'Loan Receivable Employees-Marquez, Dee', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1234, N'LRE1LRE14', N'Loan Receivable Employees-Navacilla, Ma.', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1235, N'LRE1LRE15', N'Loan Receivable Employees-Orongan, Wenal', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1236, N'LRE1LRE16', N'Loan Receivable Employees-Parba, Marichu', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1237, N'LRE1LRE2', N'Loan Receivable Employees- Derder, Jeori', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1238, N'LRE1LRE3', N'Loan Receivable Employees- Geyrozaga, Ro', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1239, N'LRE1LRE4', N'Loan Receivable Employees- Unabia, Jean', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1240, N'LRE1LRE5', N'Loan Receivable Employees-Aliporo, Wilma', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1241, N'LRE1LRE6', N'Loan Receivable Employees-Asmad, Marisol', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1242, N'LRE1LRE7', N'Loan Receivable Employees-Bargayo, Armes', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1243, N'LRE1LRE8', N'Loan Receivable Employees-Cañaveral, Ros', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1244, N'LRE1LRE9', N'Loan Receivable Employees-Cosenas,Mark Louie', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1245, N'LREA1', N'Loan Receivable Employees-Amadar,Ryan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1246, N'LREAA1', N'Loan Receivable Employees- Agravante, Ad', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1247, N'LREAC1', N'Loan Receivable Employees - Alimpolos, C', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1248, N'LREAD1', N'Loan Receivable Employees-Ares, Ditas', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1249, N'LREAJ1', N'Loan Receivable Employees- Agan, Jess', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1250, N'LREAM1', N'Loan Receivable Employees-Borong, Nigil', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1251, N'LREAW1', N'Loan Receivable Employees- Rabadon, Flor', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1252, N'LREBA1', N'Loan Receivable Employees-Betinol, Absal', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1253, N'LREBA2', N'Loan Receivable Employees-Bertolano, Avi', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1254, N'LREBA3', N'Loan Receivable Employees- Renoblas, Maria Hian', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1255, N'LREBC01', N'Loan Receivable Employees- Baroman, Carlito', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1256, N'LREBE1', N'Loan Receivable Employees-Butal, Edward', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1257, N'LREBE2', N'Loan Receivable Employees-Bongcaras, Emm', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1258, N'LREBF', N'Loan Receivable Employee - Bandalan, Frances', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1259, N'LREBJ1', N'Loan Receivable Employees- Baoy, Jerwin', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1260, N'LREBM1', N'Loan Receivable Employees-Baa, Marlon', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1261, N'LREBM2', N'Loan Receivable Employees-Batucan, Maria', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1262, N'LREBO1', N'Loan Receivable Employee-Bacus, Orlane', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1263, N'LREBOT1', N'Loan Receivable Employees-Bayon-On, Teot', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1264, N'LREBR1', N'Loan Receivable Employees - Baladjay, Ra', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1265, N'LREBR2', N'Loan Receivable Employees- Briones, Reyn', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1266, N'LREBV1', N'Loan Receivable Employees-Biscayda, Vema', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1267, N'LREC1', N'Loan Receivable Employee-Casas,Marlon', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1268, N'LREC2', N'Loan Receivable Employees-Camacho,Madeo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1269, N'LRECG1', N'Loan Receivable Employees-Camaso, Gualbe', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1270, N'LRECJ1', N'Loan Receivable Employees-Ceno, Jarmine', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1271, N'LRECJ2', N'Loan Receivable Employees- Cutanda, Jaim', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1272, N'LRECL1', N'Loan Receivable Employees- Chavez, Gracela Mae', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1273, N'LRECL2', N'Loan Receivable Employees- Cano, Lafe', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1274, N'LRECMT1', N'Loan Receivable Employees-Catipay, Ma. T', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1275, N'LRECR1', N'Loan Receivable Employees-Cenia, Rolando', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1276, N'LRECR2', N'Loan Receivable Employees-Candilada, Ric', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1277, N'LRECV1', N'Loan Receivable Employees- Cuajao, Vince', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1278, N'LRED1', N'Loan Receivable Employees-Destacamento,R', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1279, N'LREDJ1', N'Loan Receivable Employees- Camet, Ronaldo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1280, N'LREDLB1', N'Loan Receivable Employees-Dano, Leizel B', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1281, N'LREDR1', N'Loan Receivable Employees-Donayre, Ronal', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1282, N'LREE1', N'Loan Receivable Employees- Estrada,Marce', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1283, N'LREEA1', N'Loan Receivable Employees-Elatico, Arvin', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1284, N'LREEM1', N'Loan Receivable Employees-Estorba, Marce', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1285, N'LREEM2', N'Loan Receivable Employees- Estorba, Marc', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1286, N'LREER1', N'Loan Receivable Employees- Suralta, Rodgie', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1287, N'LREEW1', N'Loan Receivable Employees- Gabule, Daisy', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1288, N'LREFS1', N'Loan Receivable Employees-Fronteras, Ser', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1289, N'LREG1', N'Loan Receivable Employees-Gallego,Mellod', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1290, N'LREGA01', N'Loan Receivable Employees- Galon, Arniel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1291, N'LREGG1', N'Loan Receivable Employees-Gimpayan, Gina', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1292, N'LREGN1', N'Loan Receivable Employees-Gonzales, Neni', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1293, N'LREGR1', N'Loan Receivable Employees - Garcia, Ronn', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1294, N'LREGR2', N'Loan Receivable Employees- Opsima, Franquile', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1295, N'LREGV1', N'Loan Receivable Employees-Gimarino, Vill', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1296, N'LREH1', N'Loan Receivable Employees-Gellang,Leonor', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1297, N'LREI01', N'Loan Receivable Employees- Inactive', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1298, N'LREIIA1', N'Loan Receivable Employees - Ib-Ib, Arnol', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1299, N'LREJA1', N'Loan Receivable Employees-Jumao-As,Edisa', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1300, N'LREKC1', N'Loan Receivable Employees - Kawaling, Cy', N'', 1)
GO
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1301, N'LRELJ1', N'Loan Receivable Employees-Lopez, Judith', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1302, N'LRELJ2', N'Loan Receivable Employees-Lauglaug, Juhn', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1303, N'LRELJ3', N'Loan Receivable Employees- Loterte, Jove', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1304, N'LRELJ4', N'Loan Receivable Employees-Lumayag, Jessi', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1305, N'LRELM1', N'Loan Receivable Employees- Alfarero, Maria Delia', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1306, N'LRELR1', N'Loan Receivable Employees- Locaylocay, R', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1307, N'LREMA1', N'Loan Receivable Employees- Masong, Ariel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1308, N'LREMB1', N'Loan Receivable Employees-Mundo, Bochie', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1309, N'LREMC1', N'Loan Receivable Employees-Mandaue, Chris', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1310, N'LREMD1', N'Loan Receivable Employees-Grey, Dee', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1311, N'LREML1', N'Loan Receivable Employees-Bangca, Charlie Mae', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1312, N'LREMM1', N'Loan Receivable Employees-Maspara, Monet', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1313, N'LREMN1', N'Loan Receivable Employees-Mascarinas, Ni', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1314, N'LREMR1', N'Loan Receivable Employees- Miral, Reymon', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1315, N'LRENJ1', N'Loan Receivable Employees-Nunez, Joenard', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1316, N'LRENM1', N'Loan Receivable Employees-Dosdos, Maria Thelma', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1317, N'LRENN1', N'Loan Receivable Employees-Navacilla, Nao', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1318, N'LREOJ1', N'Loan Receivable Employees- Otadoy, Joebe', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1319, N'LREOM01', N'Loan Receivable Employees- Orbiso, May', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1320, N'LREOW1', N'Loan Receivable Employees- Millan, Charles', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1321, N'LREPA1', N'Loan Receivable Employees-Paquibot, Alex', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1322, N'LREPM1', N'Loan Receivable Employees- Bantawig, Adolfo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1323, N'LREPM2', N'Loan Receivable Employees- Pejano, Marib', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1324, N'LREPN1', N'Loan Receivable-Employees-Pacquiao, Neil', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1325, N'LREPP1', N'Loan Receivable Employees-Puno, Petches', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1326, N'LRER1', N'Loan Receivable Employee-Jayma,Evelyn', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1327, N'LRER2', N'Loan Receivable Employees-Romano,Ronnel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1328, N'LRERC1', N'Loan Receivable Employees-Rabasano, Char', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1329, N'LRERC2', N'Loan Receivable Employees-Remorosa, Char', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1330, N'LRERE1', N'Loan Receivable Employees- Remoreras, El', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1331, N'LRERJ1', N'Loan Receivable Employees-Rondero, Josep', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1332, N'LRERR01', N'Loan Receivable Employee - Roamar, Rudy', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1333, N'LRERR1', N'Loan Receivable Employees-Roslin, Reyna', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1334, N'LRESA01', N'Loan Receivable Employees- Salutan, Anthony', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1335, N'LRESA1', N'Loan Receivable Employees-Salvador, Anto', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1336, N'LRESC1', N'Loan Receivable Employees-Suquib, Cresil', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1337, N'LRESJ1', N'Loan Receivable Employees - Salili, Juli', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1338, N'LRESJ2', N'Loan Receivable Employees-Seguros, Jason', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1339, N'LRESO1', N'Loan Receivable Employees-Sayago, Oliver', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1340, N'LRESR1', N'Loan Receivable Employees-Sevilla, Ronal', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1341, N'LRESR2', N'Loan Receivable Employees-Salaritan, Ran', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1342, N'LRET1', N'Loan Receivable Employees-Tante,Christia', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1343, N'LRETA1', N'Loan Receivable Employees-Torreta, Alona', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1344, N'LRETG1', N'Loan Receivable Employee- Macaldo, Lowelito', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1345, N'LRETG2', N'Loan Receivable Employees-Tutor, Gwen', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1346, N'LRETJ1', N'Loan Receivable Employees-Tanza, Jacob', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1347, N'LRETJ2', N'Loan Receivable Employees-Tapia, Jeanied', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1348, N'LRETJ3', N'Loan Receivable Employees- Custora, Jerica', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1349, N'LRETM1', N'Loan Receivable Employees- Tapinit, Marg', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1350, N'LREUJ1', N'Loan Receivable Employees- Mibato, Alvin', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1351, N'LREV1', N'Loan Receivable Ee-Various', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1352, N'LREVA1', N'Loan Receivable Employees-Vanzuela, Arma', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1353, N'LREVJ1', N'Loan Receivable Employees-Virtucio, Joec', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1354, N'LREVM1', N'Loan Receivable Employees-Viarino, Melod', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1355, N'LREYS1', N'Loan Receivable Employees-Ycong, Sherwin', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1356, N'LREZ1', N'Loan Receivable Employees - Zamora,Richa', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1357, N'LREZA1', N'Loan Receivable Employees-Zarraga, Arian', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1358, N'LREZA2', N'Loan Receivable Employees- Zurita, Alfeo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1359, N'LREZH01', N'Loan Receivable Employees- Zurita, Hilario', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1360, N'LRGV01', N'Loan Receivable Employees- Gurrea, Velle Eddieson', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1361, N'LSA1', N'Loans Receivable - Suspense Account', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1362, N'M1', N'Meetings', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1363, N'MDAIE18', N'Medical, Dental, And Accident Insurance  Expense', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1364, N'ME1', N'Miscellaneous Expense', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1365, N'MF1', N'Membership Fees And Dues', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1366, N'MF2', N'Management Fees', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1367, N'MIPC', N'Micro-Insurance Premium Collection', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1368, N'MOA1', N'Main Office Account', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1369, N'MOAA1', N'Main Office Account - Argao', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1370, N'MOAAB', N'Main Office Account - Abuyog', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1371, N'MOAB1', N'Main Office Account - Baybay', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1372, N'MOAB2', N'Main Office Account - Bantayan', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1373, N'MOAB3', N'Main Office Account - Dumanjug', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1374, N'MOAB4', N'Main Office Account - Bogo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1375, N'MOAC1', N'Main Office Account - Camotes', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1376, N'MOAC2', N'Main Office Account - Carcar', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1377, N'MOACC1', N'Main Office Account - Cebu City', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1378, N'MOAD', N'Main Office Account - Dulag', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1379, N'MOAD1', N'Main Office Account - Tagbilaran', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1380, N'MOAJ1', N'Main Office Account - Jagna', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1381, N'MOAL1', N'Main Office Account - Danao', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1382, N'MOAM1', N'Main Office Account - Mo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1383, N'MOAN1', N'Main Office Account - Naga', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1384, N'MOAO1', N'Main Office Account - Ormoc', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1385, N'MOAS1', N'Main Office Account - Bato', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1386, N'MOAS2', N'Main Office Account - Santander', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1387, N'MOAT1', N'Main Office Account - Tubigon', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1388, N'MOAT2', N'Main Office Account - Toledo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1389, N'MOATN1', N'Main Office Account - Talibon New', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1390, N'MOAU1', N'Main Office Account - Ubay', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1391, N'MR1', N'Meals & Representations', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1392, N'MRD1', N'Market Research & Development', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1393, N'MTR1', N'Motorcycle Registration', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1394, N'NCA', N'Non-Current Assets', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1395, N'NCAFA', N'Fixed Assets', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1396, N'NCAIOA', N'Inter-Office Account', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1397, N'NCAOA', N'Other Assets', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1398, N'NCAOR', N'Other Receivables', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1399, N'NCL', N'Non-Current Liabilities', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1400, N'NCLIP', N'Insurance Payables', N'', 1)
GO
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1401, N'NCLLTP', N'Long Term Payables', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1402, N'NCLOP', N'Other Long Term Payables', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1403, N'OB1', N'Other Benefits', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1404, N'OFFE18', N'Office Furniture, Fixtures & Equipment', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1405, N'OR1', N'Rent Expense - Office', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1406, N'OS1', N'Office Supplies', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1407, N'PC1', N'Printing And Photocopy', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1408, N'PCF', N'Petty Cash Fund', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1409, N'PD1', N'Product Development', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1410, N'PDA1', N'Per Diem Allowance', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1411, N'PE', N'Personnel Expenses', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1412, N'PER01', N'Pre-Employment Requirements', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1413, N'PF1', N'Pension Funds', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1414, N'PFLL1', N'Provision For Loan Losses', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1415, N'PI1', N'Prepaid Insurance', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1416, N'PI2', N'Promotional Inventory', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1417, N'PI3', N'Prepaid Insurance-Gyrt', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1418, N'PIEFS1', N'Paid-In Equity From Shareholders', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1419, N'PL1', N'Partnership & Linkages', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1420, N'PMEF1', N'Program Monitoring & Evaluation-Fare', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1421, N'PMEM1', N'Program Monitoring & Evalaution-Meals', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1422, N'PO1', N'Prepaid Others', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1423, N'POE1', N'Pre Operating Expense', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1424, N'PR1', N'Prepaid Rental', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1425, N'PYP1', N'Prior Years Profit/Loss', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1426, N'R01', N'Recruitment & Talent Attraction Expenses', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1427, N'RAM', N'Repairs And Maintenance', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1428, N'RAM1', N'Repairs And Maintenance - Fixed Assets', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1429, N'RAMB1', N'Repairs And Maintenance - Bldg', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1430, N'RAMTE16', N'Repairs  And Maintenance - Transportation  Equipt', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1431, N'RAO', N'Restricted Assets', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1432, N'RD1', N'Refundable Deposit', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1433, N'RE1', N'Rent  Expense', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1434, N'REFT', N'Revolving Fund For Travel', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1435, N'RFML1', N'Revolving Fund - M. Lhuilier', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1436, N'RFR', N'Revolving Fund - Remco', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1437, N'RI01', N'Referral Incentives', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1438, N'RMA1', N'Repairs And Maintenance - Motorcycle Accessories', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1439, N'RMOF19', N'Repairs And Maintenance - Office Furniture', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1440, N'RSD1', N'Rental Security Deposit', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1441, N'SAM3', N'Suspense Account', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1442, N'SAW1', N'Salaries And Wages', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1443, N'SCR1', N'Sss Claims Receivable', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1444, N'SCRM1', N'Sss Claims Receivable-Mo', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1445, N'SDU1', N'Security Deposits On Utilities', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1446, N'SES1', N'Sss/Phic/Hdmf - Employer', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1447, N'SF01', N'Service Fee', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1448, N'SFP1', N'Sinking Fund Payable', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1449, N'STI1', N'Short Term Investment', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1450, N'TA1', N'Training Allowance', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1451, N'TE', N'Transportation Expenses', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1452, N'TE1', N'Transportation Equipment', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1453, N'TF1', N'Tanod Fee', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1454, N'TIC1', N'Telephone &  Communication', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1455, N'TL1', N'Taxes & Licenses', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1456, N'TSD18', N'Trainings,Seminars & Staff Development', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1457, N'UOS17', N'Unused Office Supplies', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1458, N'UWG1', N'Utilities(Light, Water & Gasul)', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1459, N'API', N'Test', N'', 0)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1460, N'Test 1', N'Edited', N'Edited', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1461, N'API', N'API', N'', 1)
INSERT [dbo].[Masterfile_ChartOfAccount] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1462, N'Test', N'0Test', N'Added Remarks', 0)
INSERT [dbo].[Masterfile_District] ([Id], [Name], [RegionId], [Remarks], [Status]) VALUES (1, N'Cebu', 10, N'', 1)
INSERT [dbo].[Masterfile_District] ([Id], [Name], [RegionId], [Remarks], [Status]) VALUES (2, N'Bohol', 10, N'', 1)
INSERT [dbo].[Masterfile_District] ([Id], [Name], [RegionId], [Remarks], [Status]) VALUES (3, N'Iloilo', 10, N'', 1)
INSERT [dbo].[Masterfile_District] ([Id], [Name], [RegionId], [Remarks], [Status]) VALUES (4, N'Leyte', 10, N'', 1)
INSERT [dbo].[Masterfile_District] ([Id], [Name], [RegionId], [Remarks], [Status]) VALUES (5, N'Samar', 10, N'', 1)
INSERT [dbo].[Masterfile_District] ([Id], [Name], [RegionId], [Remarks], [Status]) VALUES (6, N'Negros', 10, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (1, N'990741', N'MARLON', N'LANTAJO', N'BAYON-ON', N'nelson@gmail.com', N'1239', N'123', 10, N'Sibonga', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (2, N'123', N'gaga', N'', N'Antierss', N'sample@gmail.com', N'1239', N'906', 2, N'resample', 0)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (3, N'123', N'gaga', N'del', N'Antierss', N'sample@gmail.com', N'123', N'0906', 1, N'sample', 0)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (4, N'123', N'Gary', N'asd', N'Antier', N'asd@gmail.com', N'', N'123', 2, N'asd', 0)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (5, N'112', N'aaa adasd', N'aaa', N'aaa', N'fasf@gmail.com', N'', N'123', 2, N'asdsad asds ', 0)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (6, N'2', N'Gilberto', N'Garbo', N'Banlasan', N'email@email.com', N'1239', N'12345678421', 44, N's', 0)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (7, N'60606', N'MONETTE', N'SOLIANO', N'MASPARA', N'monette.maspara@rafi.org.ph', NULL, N'', 10, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (8, N'60608', N'MA. THERESA', N'GREFALDE', N'CATIPAY', N'ma.theresa.catipay@rafi.org.ph', NULL, N'', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (9, N'60609', N'ROSLYN', N'CATACUTAN', N'CANAVERAL', N'roslyn.canaveral@rafi.org.ph', NULL, N'09184134353', 10, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (10, N'60618', N'AVIGAYL', N'RAYCO', N'BERTOLANO', N'avigayl.bertolano@gmail.com', NULL, N'4605641', 124, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (11, N'60701', N'JEANIEDEL', N'ESCUADRO', N'TAPIA', N'jeaniedel.tapia@rafi.org.ph', NULL, N'09169292517', 77, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (12, N'60819', N'OLIVER', N'ALFEREZ', N'SAYAGO', N'oliver.sayago@rafi.org.ph', NULL, N'', 72, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (13, N'61004', N'NINEVEH', N'LAPE', N'MASCARINAS', N'nineveh.mascarinas@rafi.org.ph', NULL, N'09274358618', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (14, N'70105', N'GINA', N'SENCERO', N'GIMPAYAN', N'gina.gimpayan@rafi.org.ph', NULL, N'4215872', 7, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (15, N'70201', N'BOCHIE', N'PAJAGANAS', N'MUNDO', N'bochiemundo1970@gmail.com', NULL, N'09214878854', 84, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (16, N'70203', N'RONALD', N'VILLACERAN', N'SEVILLA', N'ronald.sevilla@rafi.org.ph', NULL, N'', 124, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (17, N'70208', N'TEOTIMO', N'PACINO', N'BAYON-ON', N'teotimobayonon@gmail.com', NULL, N'09104584059', 99, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (18, N'70301', N'JUDITH', N'PIEZAS', N'LOPEZ', N'judith.lopez@rafi.org.ph', NULL, N'', 49, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (19, N'70302', N'LEIZEL', N'BANGE', N'DANO', N'leizel.dano@rafi.org.ph', NULL, N'09283992142', 73, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (20, N'70314', N'RANMER', N'ABONG', N'SALARITAN', N'ranmer.salaritan@rafi.org.ph', NULL, N'09102962828', 18, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (21, N'90102', N'MARIA DELIA', N'LABISTE', N'ALFARERO', N'maria.delia.labiste@rafi.org.ph', NULL, N'', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (22, N'90104', N'SERGIO', N'BASLAN', N'FRONTERAS', N'sergio.fronteras.jr@rafi.org.ph', NULL, N'', 91, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (23, N'90205', N'MELODY', N'DICHOSA', N'VIARINO', N'melody.viarino@rafi.org.ph', NULL, N'', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (24, N'90303', N'VINCENT', N'PARPAN', N'CUAJAO', N'vincent.cuajao@rafi.org.ph', NULL, N'', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (25, N'90305', N'JOSEPH', N'VASAYLAJE', N'RONDERO', N'joseph.rondero05@gmail.com', NULL, N'09058408535', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (26, N'90403', N'JERWIN', N'DAUG', N'BAOY', N'jerwin.baoy@rafi.org.ph', NULL, N'', 37, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (27, N'90500', N'ARIEL', N'OUANO', N'MASONG', N'ariel.masong@rafi.org.ph', NULL, N'', 116, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (28, N'90804', N'ADELINA', N'NEIR', N'AGRAVANTE', N'adelinaagravante123@gmail.com', NULL, N'09293624387', 106, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (29, N'91200', N'MELODY', N'GALLEGO', N'DE LA TORRE', N'melodydelatorre6@gmail.com', NULL, N'', 116, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (30, N'91201', N'LEONORA', N'HERBITO', N'GELLANG', N'leonor.gellang@gmail.com', NULL, N'', 44, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (31, N'100100', N'CHRISTOPHER', N'BERAYE', N'MANDAUE', N'christopher.mandaue@rafi.org.ph', NULL, N'09395083497', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (32, N'100104', N'ABSALONA', N'SUAREZ', N'BETINOL', N'absalona.betinol@gmail.com', NULL, N'', 10, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (33, N'100605', N'RAFFY', N'MORALES', N'BALADJAY', N'raffy.baladjay@rafi.org.ph', NULL, N'09225747816', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (34, N'111105', N'DOMINIC', N'PERALTA', N'SENCIO', N'dominic.sencio@rafi.org.ph', NULL, N'09268380469', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (35, N'111107', N'ROBERTO', N'NUEZ', N'BONCALES', N'boncales.roberto73@gmail.com', NULL, N'', 73, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (36, N'111109', N'MADEO', N'SUELLO', N'CAMACHO', N'madeo.camacho@rafi.org.ph', NULL, N'09334412893', 91, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (37, N'120301', N'REYNARD', N'ALPAS', N'BRIONES', N'reynard.briones@rafi.org.ph', NULL, N'', 125, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (38, N'120302', N'MITCHEL', N'BATILLER', N'BOLACITO', N'mitchel.bolacito@rafi.org.ph', NULL, N'', 49, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (39, N'120501', N'REYNAN', N'DELA PENA', N'LOCAYLOCAY', N'reynan.locaylocay@rafi.org.ph', NULL, N'', 121, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (40, N'120602', N'ELLEONOR', N'DALAPO', N'DALAPO', N'elleonor.dalapo123@gmail.com', NULL, N'09309280242', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (41, N'120603', N'NEIL ANTHONY', N'REQUISO', N'PACQUIAO', N'neil.pacquiao@rafi.org.ph', NULL, N'09231432125', 112, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (42, N'120701', N'ALFEO', N'MUANA', N'ZURITA', N'alfeo.zurita.88@gmail.com', NULL, N'', 118, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (43, N'120703', N'JONALD', N'TAMARION', N'SOTTO', N'jonald.sotto@rafi.org.ph', NULL, N'', 28, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (44, N'120801', N'MARIBEL', N'ANGCAHAN', N'PEJANO', N'mpejano@gmail.com', NULL, N'09128960344', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (45, N'120803', N'HILARIO', N'BERNALDO', N'ZURITA', N'hilariobernaldozurita@gmail.com', NULL, N'', 28, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (46, N'120901', N'JESS', N'VALDEZ', N'AGAN', N'jess.agan@rafi.org.ph', NULL, N'', 80, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (47, N'121004', N'FRANCES', N'DASIGAN', N'BANDALAN', N'kishanbandalan@gmail.com', NULL, N'', 107, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (48, N'121107', N'JOENARD', N'PITOGO', N'NUNEZ', N'jnunez.rmf@gmail.com', NULL, N'', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (49, N'131101', N'MYRA', N'BALUCAN', N'TAPINIT', N'myra.tapinit@rafi.org.ph', NULL, N'09173115888', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (50, N'140102', N'ARCHEL', N'NASARA', N'AREJA', N'archelyahoo@gmail.com', NULL, N'', 46, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (51, N'140200', N'MA. CHARITO', N'GURREA', N'BAAY', N'ma.charito.baay@gmail.com', NULL, N'09266029912', 49, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (52, N'140301', N'JUNREY', N'RECAPLAZA', N'BUGSOCAN', N'junrey.bugsocan@rafi.org.ph', NULL, N'', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (53, N'140302', N'JOPHERT SON', N'CORTES', N'GARCIA', N'jhopert.garcia@rafi.org.ph', NULL, N'09173093996', 95, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (54, N'140303', N'VELLE EDDIESON', N'TORREJOS', N'GURREA', N'MCairbenz@gmail.com', NULL, N'', 116, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (55, N'140307', N'REINA', N'ESTOY', N'BALILI', N'reina.balili@gmail.com', NULL, N'', 49, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (56, N'140500', N'MICEL', N'CAMIGUING', N'MONDIDO', N'micel.mondido@gmail.com', NULL, N'09358047938', 77, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (57, N'140501', N'GEOMARIE', N'BALASOTE', N'DIAPANA', N'j0ngzky91@gmail.com', NULL, N'', 44, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (58, N'140505', N'PRINCESS KEITH DALE', N'CANO', N'ABALDE', N'princessabalde@yahoo.com', NULL, N'', 112, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (59, N'140601', N'NIGIL', N'GORES', N'BORONG', N'nigil.borong@rafi.org.ph', NULL, N'', 38, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (60, N'140604', N'FLOR', N'MACARON', N'RABADON', N'flor.rabadon.rafi2014@gmail.com', NULL, N'', 71, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (61, N'140605', N'JONALYN', N'PANCITO', N'MATIGAS', N'amatigas@gmail.com', NULL, N'09262922150', 51, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (62, N'140606', N'CHARLIE MAE', N'EGOT', N'BANGCA', N'charliemaebangca123@gmail.com', NULL, N'', 81, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (63, N'140908', N'JESRYL', N'ABELLANA', N'PLARISAN', N'jesryl.plarisan@rafi.org.ph', NULL, N'', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (64, N'140910', N'DAISY', N'CONING', N'GABULE', N'daisy.gabule@rafi.org.ph', NULL, N'', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (65, N'140911', N'APPLE', N'CASTINO', N'GARCIA', N'garciaapple09@gmail.com', NULL, N'09095286249', 73, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (66, N'141000', N'ROLANDO', N'MACABUDBUD', N'CAMET', N'rolandocamet@gmail.com', NULL, N'', 109, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (67, N'141001', N'MART VINCENT', N'TUQUIB', N'OTOM', N'vinmart542@gmail.com', NULL, N'09462192875', 83, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (68, N'141004', N'JONAR', N'BERNARDINO', N'DORADO', N'jonar.dorado@rafi.org.ph', NULL, N'', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (69, N'141005', N'GRETCHEN', N'SALOMA', N'ABEQUIBEL', N'gabequibel@gmail.com', NULL, N'', 46, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (70, N'141008', N'MICHAEL', N'HERNANI', N'COMPUESTO', N'michael.compuesto@rafi.org.ph', NULL, N'09106227446', 80, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (71, N'141103', N'ROMEO', N'BESAS', N'CUTAMORA', N'romeocutamorajr@gmail.com', NULL, N'', 48, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (72, N'141104', N'MARLOU', N'INGUITO', N'GOMEZ', N'marlougomez20@gmail.com', NULL, N'09161339226', 38, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (73, N'141105', N'CHARLES', N'MANGAO', N'MILLAN', N'charles.millan35@gmail.com', NULL, N'', 36, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (74, N'141107', N'PEDRO', N'JORGE', N'RUALES', N'pedro.rualesjr@gmail.com', NULL, N'09307912714', 51, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (75, N'141108', N'RODGIE', N'MARQUEZ', N'SURALTA', N'rodgie.suralta08@gmail.com', NULL, N'', 118, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (76, N'141112', N'ALVIN', N'COLINA', N'MIBATO', N'vinoxguapo9410@gmail.com', NULL, N'09234123237', 70, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (77, N'141200', N'LUZVIMINDA', N'CAPAROS', N'GONZAGA', N'mgonzaga.rmf@gmail.com', NULL, N'', 80, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (78, N'150222', N'DARYL JAMES', N'ESTENZO', N'GOLIS', N'darylgolis@gmail.com', NULL, N'', 7, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (79, N'150225', N'JONATHAN', N'BASBAS', N'SORONO', N'Jonathan.Soronio2015@gmail.com', NULL, N'', 112, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (80, N'150226', N'JOEMEL', N'ENAYO', N'NELLAS', N'nellasjoemel@gmail.com', NULL, N'', 26, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (81, N'150227', N'ALLAN', N'RUTA', N'VILLARIN', N'villarinallan@gmail.com', NULL, N'', 113, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (82, N'150300', N'JUVELYN', N'ROMERO', N'ALMERIDA', N'juvelyn.almerida@gmail.com', NULL, N'', 74, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (83, N'150301', N'ELVIN MORRIS', N'SALANG', N'ANTONIO', N'morriz19antonio@gmail.com', NULL, N'', 95, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (84, N'150302', N'JOMAR', N'SANTOS', N'BACOLOD', N'jomar.bacolod27@gmail.com', NULL, N'09094383945', 61, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (85, N'150303', N'CYRUS', N'ROSALDO', N'BERNIL', N'cybernilmarch@gmail.com', NULL, N'09098166791', 73, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (86, N'150304', N'QUERUBIN', N'CLAPANO', N'BONGCAC', N'querubin.bongcac@gmail.com', NULL, N'', 19, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (87, N'150305', N'ADAN', N'NAPIÃ‘AS', N'COQUILLA', N'adan.coquilla198@gmail.com', NULL, N'', 50, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (88, N'150306', N'JULIUS', N'GONZAGA', N'CORAGE', N'jholiuscourage@gmail.com', NULL, N'09077193900', 81, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (89, N'150307', N'MARICRIS', N'BAAY', N'HOYLE', N'aleahgrace14@gmail.com', NULL, N'', 71, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (90, N'150308', N'GARY', N'NESPEROS', N'MALIG-ON', N'gary.maligon@gmail.com', NULL, N'', 91, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (91, N'150311', N'RONEL', N'FUENTES', N'VALMORIA', N'ronel.valmoria@gmail.com', NULL, N'', 95, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (92, N'150313', N'RAY ANTHONY', N'BELONGILOT', N'ALMADEN', N'rayanthony.almaden@rafi.org.ph', NULL, N'09222139660', 32, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (93, N'150401', N'ARNOLD', N'ALBARICO', N'BARCOS', N'arnold67.barcos@gmail.com', NULL, N'', 28, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (94, N'150402', N'ROGELIO', N'ESMANI', N'BOHOL', N'rogeliobohol0509@gmail.com', NULL, N'', 38, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (95, N'150403', N'MACGYVER', N'BALEJON', N'ONG', N'omgmack.mo@gmail.com', NULL, N'', 98, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (96, N'150405', N'APPLE MAY', N'CERNIAS', N'ISRAEL', N'apple.may.israel@gmail.com', NULL, N'', 88, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (97, N'150406', N'RACHAEL', N'BALESTEROS', N'GARQUE', N'rachael.garque@rafi.org.ph', NULL, N'', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (98, N'150407', N'JOHNBURNHAM', N'DEIPARINE', N'ABELLANA', N'johnburnham.abellana620@gmail.com', NULL, N'', 46, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (99, N'150408', N'NENEN', N'PONO', N'CAPUYAN', N'capuyannenen@gmail.com', NULL, N'', 75, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (100, N'150409', N'SANTIJUN', N'GAID', N'CIMENI', N'santijun.cimeni@gmail.com', NULL, N'09207831669', 83, N'', 1)
GO
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (101, N'150410', N'RICKY', N'VIBAR', N'CLAMONTE', N'rickyclamonte@gmail.com', NULL, N'09068963007', 77, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (102, N'150411', N'TERESA', N'GADOR', N'DAGATAN', N'dagatanteresa@gmail.com', NULL, N'09476298176', 111, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (103, N'150412', N'MARK JENAZ', N'NEGRE', N'FORROSUELO', N'markjenazforrosuelo@gmail.com', NULL, N'', 114, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (104, N'150413', N'RICHARD', N'OFIANGA', N'GUALVEZ', N'richardgualvez1981@gmail.com', NULL, N'09104041003', 47, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (105, N'150414', N'RYAN CARLO', N'BESABELLA', N'LEPON', N'ryancarlo1982@gmail.com', NULL, N'09079930558', 52, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (106, N'150415', N'REY JAY', N'COMPENDIO', N'PADEN', N'reyjaypaden@gmail.com', NULL, N'', 95, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (107, N'150416', N'JUNNAR', N'ABATAYO', N'PILAPIL', N'junnarpilapil8@gmail.com', NULL, N'', 113, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (108, N'150621', N'JUNMAR VINCENT', N'ROLLAN', N'TIBAY', N'tibayjunmarvincent@gmail.com', NULL, N'09428117213', 72, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (109, N'150622', N'MARY ANN', N'MONTEMAYOR', N'UNDANG', N'undangmaryann@gmail.com', NULL, N'09073413738', 125, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (110, N'150700', N'JENIZA', N'GERBOLINGO', N'BATOHINOG', N'jenizabatohinogg@gmail.com', NULL, N'09306733226', 88, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (111, N'150701', N'MARJURIE', N'BARONTOY', N'ENAD', N'emarjurie@gmail.com', NULL, N'', 71, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (112, N'150707', N'LYEL ADAMS', N'NAVARRO', N'CAVALIDA', N'adamzcavalida@gmail.com', NULL, N'09222861025', 59, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (113, N'150708', N'RONEL', N'TUBO', N'JAGUS', N'roneljagus@gmail.com', NULL, N'', 81, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (114, N'150709', N'JESSIE PAUL', N'DUGADUGA', N'LUPAS', N'jessielupas23@gmail.com', NULL, N'', 81, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (115, N'150710', N'NIKKO', N'BRASALUTE', N'MARCHADESCH', N'nikkomarchadesch19@gmail.com', NULL, N'09351195923', 52, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (116, N'150711', N'CLIFFORD', N'VEQUIZO', N'MAQUIPOTEN', N'ford.maquipoten@gmail.com', NULL, N'', 69, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (117, N'150712', N'NELSON', N'N/A', N'TERO', N'nelson.tero33@gmail.com', NULL, N'', 19, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (118, N'150800', N'DIOCLES', N'CAINGIN', N'ROSALEJOS', N'diocles.rosalejos@rafi.org.ph', NULL, N'', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (119, N'150803', N'WENDELL', N'ACEBES', N'CAGATIN', N'wendell.cagatin@gmail.com', NULL, N'', 7, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (120, N'150804', N'CHETO', N'ENSO', N'DAWATON', N'chetodawaton@gmail.com', NULL, N'', 71, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (121, N'150805', N'DINDO', N'JANDOG', N'EGE', N'dindo.ege@rafi.org.ph', NULL, N'09068074204', 43, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (122, N'150807', N'JOVANNIE', N'GERALDEZ', N'RECARTE', N'jrecarte@gmail.com', NULL, N'', 113, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (123, N'150923', N'JULIET', N'BERSANO', N'BETONIO', N'betoniojuliet@gmail.com', NULL, N'', 58, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (124, N'150924', N'EDUARD', N'COSMOD', N'CUTAMORA', N'cutamoraeduard.rafi@gmail.com', NULL, N'', 88, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (125, N'150925', N'LARRY', N'BAGOL', N'EMBALZADO', N'axle.embalzado@gmail.com', NULL, N'', 75, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (126, N'150926', N'JOHN', N'DULANA', N'JAPITAN', N'Jhonjapitan@gmail.com', NULL, N'', 121, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (127, N'150927', N'BERNIE', N'AUTOR', N'PAMPELON', N'berniepampelon@gmail.com', NULL, N'', 48, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (128, N'150928', N'JONATHAN', N'BOAQUIN', N'TIBAY', N'jonthan.tibay0403@gmail.com', NULL, N'', 91, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (129, N'150929', N'JOEMAR', N'ANANA', N'TORREJOS', N'joemartorrejos26@gmail.com', NULL, N'', 73, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (130, N'150930', N'GERY', N'MACABUDBUD', N'TORRENTIRA', N'gery.torrentira@gmail.com', NULL, N'09101795017', 4, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (131, N'151000', N'DIANNE', N'FLORES', N'BATE', N'dianne.bate@rafi.org.ph', NULL, N'09158923492', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (132, N'151001', N'EMMALYN', N'N/A', N'ABUNDA', N'emmalyn.abunda@gmail.com', NULL, N'', 75, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (133, N'151002', N'ELLIE REY', N'ESTREMOS', N'DAYANGCO', N'edayangco@gmail.com', NULL, N'', 46, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (134, N'151003', N'GERUEL', N'DEMETRIAL', N'MARCOJOS', N'geruel.marcojos@gmail.com', NULL, N'', 61, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (135, N'151006', N'DARYL LOU', N'ZAPANTA', N'SAJULGA', N'sajulgadaryl@gmail.com', NULL, N'', 95, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (136, N'151010', N'ELMER', N'BUSTALINIO', N'MIRADORES', N'elmer.miradores@gmail.com', NULL, N'', 50, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (137, N'151011', N'JANINE ROSE', N'ALFARERO', N'ABAPO', N'janine.rose.abapo@rafi.org.ph', NULL, N'', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (138, N'151108', N'JOHN PHILIP', N'BULABOS', N'RAMOS', N'ramosjohnphilip6@gmail.com', NULL, N'', 48, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (139, N'151109', N'ANTHONY FLORENCE', N'SANICO', N'ROSAL', N'anthonyflorence.rosal@gmail.com', NULL, N'', 98, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (140, N'151110', N'MANOVE', N'GALLARDO', N'ZAMORA', N'manove.zamora@rafi.org.ph', NULL, N'', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (141, N'151113', N'MARY LOVE MELODY', N'TOBIAS', N'CABANAG', N'mary.love.melody.cabanag@rafi.org.ph', NULL, N'', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (142, N'151114', N'MELGER', N'MISTOLA', N'JORDAN', N'stcmmjordan@gmail.com', NULL, N'', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (143, N'151115', N'JESRYN', N'TORMIS', N'LEONARDO', N'jesryn.leonardo@rafi.org.ph', NULL, N'09187742869', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (144, N'151116', N'JUSHUA', N'N/A', N'TADEO', N'santosjushua@gmail.com', NULL, N'', 111, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (145, N'151117', N'VICTOR', N'ABA-A', N'TESIO', N'vtesio56@gmail.com', NULL, N'', 83, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (146, N'151200', N'RAIHNARD', N'BUGHAO', N'CANETE', N'arthazane@gmail.com', NULL, N'', 42, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (147, N'151201', N'JAIME JR.', N'CANETE', N'RICAPLAZA', N'jaime.ricaplaza@rafi.org.ph', NULL, N'', 2, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (148, N'151202', N'MAE', N'OLAER', N'JUTARA', N'mae.jutara@gmail.com', NULL, N'', 13, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (149, N'151203', N'FRANCELYN JOY', N'SOLAYAO', N'MASONG', N'celynmasong1812@gmail.com', NULL, N'', 42, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (150, N'151204', N'ORIEL', N'BREGILDO', N'SUMILAC', N'orielbsumilac0428@gmail.com', NULL, N'', 114, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (151, N'151205', N'ISABEL', N'JADULCO', N'CASTIGON', N'isabelcastigon@gmail.com', NULL, N'09309300483', 42, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (152, N'151206', N'JOCELYN', N'MONDERONDO', N'CORALDE', N'jcoralde@gmail.com', NULL, N'', 88, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (153, N'990322', N'AMELITO', N'ROSARIO', N'DEGUMA', N'amelito.deguma@gmail.com', NULL, N'', 113, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (154, N'990323', N'MARLON', N'DOLORICAN', N'GALLER', N'marlon.galler27@gmail.com', NULL, N'', 58, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (155, N'990324', N'JERSON', N'MAUREAL', N'LUENGO', N'jerson.luengo@rafi.org.ph', NULL, N'', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (156, N'990325', N'ALBERTO', N'BAGUINANG', N'MATURA', N'alberto.matura@gmail.com', NULL, N'', 81, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (157, N'990326', N'ANDREA', N'ROMERO', N'PAILAGO', N'andrea.pailago@rafi.org.ph', NULL, N'', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (158, N'990327', N'JAMES', N'VICS', N'CASERES', N'jamescaseres.143@gmail.com', NULL, N'09096648390', 46, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (159, N'990328', N'REYMART', N'N/A', N'ARROJO', N'reymary025@gmail.com', NULL, N'', 24, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (160, N'990329', N'REYMAR', N'BOISER', N'BORAL', N'rosemarzion@gmail.com', NULL, N'', 4, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (161, N'990330', N'LARRY', N'ESTOMO', N'CERVANTES', N'larrycervantes0220@gmail.com', NULL, N'09103332292', 91, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (162, N'990331', N'WELBERT', N'ARIATA', N'DAPAR', N'welbertdapar214@gmail.com', NULL, N'', 81, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (163, N'990332', N'MA. LANESA', N'INSIGNE', N'GERALDE', N'malanesa.geralde@gmail.com', NULL, N'', 107, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (164, N'990333', N'RHEA ROXANNE', N'CELIS', N'GOMEZ', N'Rheagomez90@gmail.com', NULL, N'', 19, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (165, N'990334', N'ARIEL', N'SABILLO', N'JAVINES', N'arielsabillojavines@gmail.com', NULL, N'', 107, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (166, N'990335', N'MICHAEL SHANE', N'CARILLO', N'KONG', N'michaelshanek@gmail.com', NULL, N'', 113, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (167, N'990336', N'JOBHART', N'TUGONON', N'OMEGA', N'jobhart.omega@gmail.com', NULL, N'', 80, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (168, N'990353', N'ANGELICA', N'VILLENA', N'ARANZADO', N'aranzadoangelica629@gmail.com', NULL, N'', 15, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (169, N'124', N'Tested', N'Tested', N'Tested', N'test@test.com', NULL, N'1', 25, N'', 0)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (170, N'123', N'Test', N'Test', N'Test', N'test@test.com', NULL, N'1', 25, N'', 0)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (171, N'121', N'Test', N'Test', N'Test', N'test@test.com', NULL, N'1', 25, N'', 0)
INSERT [dbo].[Masterfile_OtherDisbursementDetail] ([Id], [Description], [CategoryId], [BranchId], [SetUpAmount], [Day], [ChannelId], [ChartOfAccountId], [Remarks], [Status]) VALUES (1, N'Loan', 1, 1, CAST(1500.00 AS Decimal(10, 2)), 5, 1, 1, N'', 1)
INSERT [dbo].[Masterfile_OtherDisbursementDetail] ([Id], [Description], [CategoryId], [BranchId], [SetUpAmount], [Day], [ChannelId], [ChartOfAccountId], [Remarks], [Status]) VALUES (2, N'Insurance', 2, 2, CAST(100.00 AS Decimal(10, 2)), 10, 2, 2, N'', 1)
INSERT [dbo].[Masterfile_OtherDisbursementDetail] ([Id], [Description], [CategoryId], [BranchId], [SetUpAmount], [Day], [ChannelId], [ChartOfAccountId], [Remarks], [Status]) VALUES (3, N'Collection', 3, 2, CAST(12.00 AS Decimal(10, 2)), 20, 2, 3, N'', 1)
INSERT [dbo].[Masterfile_OtherDisbursementDetail] ([Id], [Description], [CategoryId], [BranchId], [SetUpAmount], [Day], [ChannelId], [ChartOfAccountId], [Remarks], [Status]) VALUES (4, N'Description of Disbursement', 1, 8, CAST(2001.00 AS Decimal(10, 2)), 1, 1, 4, N'', 1)
INSERT [dbo].[Masterfile_OtherDisbursementDetail] ([Id], [Description], [CategoryId], [BranchId], [SetUpAmount], [Day], [ChannelId], [ChartOfAccountId], [Remarks], [Status]) VALUES (5, N'Test', 4, 7, CAST(100.00 AS Decimal(10, 2)), 5, 2, 33, N'', 0)
INSERT [dbo].[Masterfile_OtherDisbursementDetail] ([Id], [Description], [CategoryId], [BranchId], [SetUpAmount], [Day], [ChannelId], [ChartOfAccountId], [Remarks], [Status]) VALUES (6, N'CBU Withdrawal', 4, 10, CAST(50000.00 AS Decimal(10, 2)), 0, 1, 431, N'Cash', 1)
INSERT [dbo].[Masterfile_OtherDisbursementDetail] ([Id], [Description], [CategoryId], [BranchId], [SetUpAmount], [Day], [ChannelId], [ChartOfAccountId], [Remarks], [Status]) VALUES (7, N'Office Rental', 3, 10, CAST(10000.00 AS Decimal(10, 2)), 15, 1, 29, N'', 1)
INSERT [dbo].[Masterfile_OtherReceiptDetail] ([Id], [Description], [CategoryId], [BranchId], [SetUpAmount], [Day], [ChannelId], [ChartOfAccountId], [Remarks], [Status]) VALUES (1, N'Sample', 2, 2, CAST(11111.00 AS Decimal(10, 2)), 5, 4, 7, N'', 1)
INSERT [dbo].[Masterfile_OtherReceiptDetail] ([Id], [Description], [CategoryId], [BranchId], [SetUpAmount], [Day], [ChannelId], [ChartOfAccountId], [Remarks], [Status]) VALUES (2, N'Print', 1, 1, CAST(1000.00 AS Decimal(10, 2)), 10, 1, 1, N'', 1)
INSERT [dbo].[Masterfile_OtherReceiptDetail] ([Id], [Description], [CategoryId], [BranchId], [SetUpAmount], [Day], [ChannelId], [ChartOfAccountId], [Remarks], [Status]) VALUES (3, N'edited', 1, 8, CAST(12.00 AS Decimal(10, 2)), 15, 1, 2, N'', 1)
INSERT [dbo].[Masterfile_OtherReceiptDetail] ([Id], [Description], [CategoryId], [BranchId], [SetUpAmount], [Day], [ChannelId], [ChartOfAccountId], [Remarks], [Status]) VALUES (4, N'Receipt Detail', 2, 2, CAST(1.00 AS Decimal(10, 2)), 20, 2, 5, N'', 1)
INSERT [dbo].[Masterfile_OtherReceiptDetail] ([Id], [Description], [CategoryId], [BranchId], [SetUpAmount], [Day], [ChannelId], [ChartOfAccountId], [Remarks], [Status]) VALUES (5, N'Another', 2, 4, CAST(2.00 AS Decimal(10, 2)), 28, 2, 2, N'', 1)
INSERT [dbo].[Masterfile_OtherReceiptDetail] ([Id], [Description], [CategoryId], [BranchId], [SetUpAmount], [Day], [ChannelId], [ChartOfAccountId], [Remarks], [Status]) VALUES (6, N'Tests', 3, 7, CAST(1.00 AS Decimal(10, 2)), 2, 2, 46, N'Banks', 0)
INSERT [dbo].[Masterfile_OtherReceiptDetail] ([Id], [Description], [CategoryId], [BranchId], [SetUpAmount], [Day], [ChannelId], [ChartOfAccountId], [Remarks], [Status]) VALUES (7, N'Income-NonTrade', 2, 10, CAST(5000.00 AS Decimal(10, 2)), 28, 1, 45, N'', 1)
INSERT [dbo].[Masterfile_Region] ([Id], [Name], [Remarks], [Status]) VALUES (1, N'National Capital Region (NCR)', N'Luzon', 1)
INSERT [dbo].[Masterfile_Region] ([Id], [Name], [Remarks], [Status]) VALUES (2, N'Ilocos Region (Region I)', N'Luzon', 1)
INSERT [dbo].[Masterfile_Region] ([Id], [Name], [Remarks], [Status]) VALUES (3, N'Cordillera Administrative Region (CAR)', N'Luzon', 1)
INSERT [dbo].[Masterfile_Region] ([Id], [Name], [Remarks], [Status]) VALUES (4, N'testwerwer', N'Luzon', 0)
INSERT [dbo].[Masterfile_Region] ([Id], [Name], [Remarks], [Status]) VALUES (5, N'Central Luzon (Region III)', N'Luzon', 1)
INSERT [dbo].[Masterfile_Region] ([Id], [Name], [Remarks], [Status]) VALUES (6, N'CALABARZON (Region IV-A', N'Luzon', 1)
INSERT [dbo].[Masterfile_Region] ([Id], [Name], [Remarks], [Status]) VALUES (7, N'Southwestern Tagalog Region (MIMAROPA Region', N'Luzon', 1)
INSERT [dbo].[Masterfile_Region] ([Id], [Name], [Remarks], [Status]) VALUES (8, N'Bicol Region Region V', N'Luzon', 1)
INSERT [dbo].[Masterfile_Region] ([Id], [Name], [Remarks], [Status]) VALUES (9, N'Western Visayas (Region VI)', N'Visayas', 1)
INSERT [dbo].[Masterfile_Region] ([Id], [Name], [Remarks], [Status]) VALUES (10, N'Central Visayas (Region VII)', N'Visayas', 1)
INSERT [dbo].[Masterfile_Region] ([Id], [Name], [Remarks], [Status]) VALUES (11, N'Eastern Visayas (Region VIII)', N'Visayas', 1)
INSERT [dbo].[Masterfile_Region] ([Id], [Name], [Remarks], [Status]) VALUES (12, N'Zamboanga Peninsula (Region IX)', N'Mindanao', 1)
INSERT [dbo].[Masterfile_Region] ([Id], [Name], [Remarks], [Status]) VALUES (13, N'Northern Mindanao (Region X)', N'Mindanao', 1)
INSERT [dbo].[Masterfile_Region] ([Id], [Name], [Remarks], [Status]) VALUES (14, N'Davao Region (Region XI)', N'Mindanao', 1)
INSERT [dbo].[Masterfile_Region] ([Id], [Name], [Remarks], [Status]) VALUES (15, N'SOCCSKSARGEN (Region XII)', N'Mindanao', 1)
INSERT [dbo].[Masterfile_Region] ([Id], [Name], [Remarks], [Status]) VALUES (16, N'Caraga Region (Region XIII)', N'Mindanao', 1)
INSERT [dbo].[Masterfile_Region] ([Id], [Name], [Remarks], [Status]) VALUES (17, N'Autonomous Region in Muslim Mindanao (ARMM)', N'Mindanao', 1)
INSERT [dbo].[Masterfile_Region] ([Id], [Name], [Remarks], [Status]) VALUES (18, N'1', N'test', 0)
INSERT [dbo].[Masterfile_Region] ([Id], [Name], [Remarks], [Status]) VALUES (19, N'kk', N'tempo', 0)
INSERT [dbo].[Masterfile_Region] ([Id], [Name], [Remarks], [Status]) VALUES (20, N'test2', N'', 0)
INSERT [dbo].[Masterfile_Role] ([Id], [Description], [Remarks], [Status]) VALUES (1, N'Admin 2', N'2nd Admin', 1)
INSERT [dbo].[Masterfile_Role] ([Id], [Description], [Remarks], [Status]) VALUES (2, N'Admin', N'', 1)
INSERT [dbo].[Masterfile_Role] ([Id], [Description], [Remarks], [Status]) VALUES (3, N'Super Admin', N'', 1)
INSERT [dbo].[Masterfile_Role] ([Id], [Description], [Remarks], [Status]) VALUES (4, N'User', N'', 1)
INSERT [dbo].[Masterfile_Role] ([Id], [Description], [Remarks], [Status]) VALUES (5, N'Tester', N'Testing account', 1)
INSERT [dbo].[Masterfile_Role] ([Id], [Description], [Remarks], [Status]) VALUES (6, N'Berdie', N'Domination', 1)
INSERT [dbo].[Masterfile_Role] ([Id], [Description], [Remarks], [Status]) VALUES (7, N'Test', N'Not like', 1)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (1, N'Master Files', N'Region', 1, N'View', 1)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (2, N'Master Files', N'Region', 1, N'Add', 2)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (3, N'Master Files', N'Region', 1, N'Edit', 3)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (4, N'Master Files', N'Region', 1, N'Delete', 4)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (5, N'Master Files', N'Region', 1, N'Search', 5)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (6, N'Master Files', N'Region', 1, N'Preview', 6)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (7, N'Master Files', N'District', 2, N'View', 1)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (8, N'Master Files', N'District', 2, N'Add', 2)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (9, N'Master Files', N'District', 2, N'Edit', 3)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (10, N'Master Files', N'District', 2, N'Delete', 4)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (11, N'Master Files', N'District', 2, N'Search', 5)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (12, N'Master Files', N'District', 2, N'Preview', 6)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (13, N'Master Files', N'Area', 3, N'View', 1)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (14, N'Master Files', N'Area', 3, N'Sync', 2)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (15, N'Master Files', N'Area', 3, N'Search', 3)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (16, N'Master Files', N'Area', 3, N'Preview', 4)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (17, N'Master Files', N'Branch', 4, N'View', 1)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (18, N'Master Files', N'Branch', 4, N'Sync', 2)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (19, N'Master Files', N'Branch', 4, N'Search', 3)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (20, N'Master Files', N'Branch', 4, N'Preview', 4)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (21, N'Master Files', N'Employee', 5, N'View', 1)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (22, N'Master Files', N'Employee', 5, N'Sync', 2)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (23, N'Master Files', N'Employee', 5, N'Search', 3)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (24, N'Master Files', N'Employee', 5, N'Preview', 4)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (25, N'Master Files', N'Chart of Account', 6, N'View', 1)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (26, N'Master Files', N'Chart of Account', 6, N'Sync', 2)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (27, N'Master Files', N'Chart of Account', 6, N'Search', 3)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (28, N'Master Files', N'Chart of Account', 6, N'Preview', 4)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (29, N'Master Files', N'Channel', 7, N'View', 1)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (30, N'Master Files', N'Channel', 7, N'Sync', 2)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (31, N'Master Files', N'Channel', 7, N'Search', 3)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (32, N'Master Files', N'Channel', 7, N'Preview', 4)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (33, N'Master Files', N'Category', 8, N'View', 1)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (34, N'Master Files', N'Category', 8, N'Add', 2)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (35, N'Master Files', N'Category', 8, N'Edit', 3)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (36, N'Master Files', N'Category', 8, N'Delete', 4)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (37, N'Master Files', N'Category', 8, N'Search', 5)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (38, N'Master Files', N'Category', 8, N'Preview', 6)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (39, N'Master Files', N'Other Receipt Detail', 9, N'View', 1)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (40, N'Master Files', N'Other Receipt Detail', 9, N'Add', 2)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (41, N'Master Files', N'Other Receipt Detail', 9, N'Edit', 3)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (42, N'Master Files', N'Other Receipt Detail', 9, N'Delete', 4)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (43, N'Master Files', N'Other Receipt Detail', 9, N'Search', 5)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (44, N'Master Files', N'Other Receipt Detail', 9, N'Preview', 6)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (45, N'Master Files', N'Other Disbursement Detail', 10, N'View', 1)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (46, N'Master Files', N'Other Disbursement Detail', 10, N'Add', 2)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (47, N'Master Files', N'Other Disbursement Detail', 10, N'Edit', 3)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (48, N'Master Files', N'Other Disbursement Detail', 10, N'Delete', 4)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (49, N'Master Files', N'Other Disbursement Detail', 10, N'Search', 5)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (50, N'Master Files', N'Other Disbursement Detail', 10, N'Preview', 6)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (51, N'Master Files', N'Role', 11, N'View', 1)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (52, N'Master Files', N'Role', 11, N'Add', 2)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (53, N'Master Files', N'Role', 11, N'Edit', 3)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (54, N'Master Files', N'Role', 11, N'Delete', 4)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (55, N'Master Files', N'Role', 11, N'Search', 5)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (56, N'Master Files', N'Role', 11, N'Preview', 6)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (57, N'Master Files', N'User', 12, N'View', 1)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (58, N'Master Files', N'User', 12, N'Add', 2)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (59, N'Master Files', N'User', 12, N'Edit', 3)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (60, N'Master Files', N'User', 12, N'Delete', 4)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (61, N'Master Files', N'User', 12, N'Search', 5)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (62, N'Master Files', N'User', 12, N'Preview', 6)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (63, N'Transactions', N'Budget Period', 13, N'View', 1)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (64, N'Transactions', N'Budget Period', 13, N'Open', 2)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (65, N'Transactions', N'Budget Period', 13, N'Close', 3)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (66, N'Transactions', N'Budget Period', 13, N'Search', 4)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (67, N'Transactions', N'Budget Period', 13, N'Preview', 5)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (68, N'Transactions', N'Budget Preparation', 14, N'View', 1)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (69, N'Transactions', N'Budget Preparation', 14, N'Sync', 2)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (70, N'Transactions', N'Budget Preparation', 14, N'Save', 3)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (71, N'Transactions', N'Budget Preparation', 14, N'Delete', 4)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (72, N'Transactions', N'Budget Preparation', 14, N'Preview', 5)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (73, N'Transactions', N'Daily Actual Cash Flow', 15, N'View', 1)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (74, N'Transactions', N'Daily Actual Cash Flow', 15, N'Sync', 2)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (75, N'Transactions', N'Daily Actual Cash Flow', 15, N'Preview', 3)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (76, N'Transactions', N'Remco Request', 16, N'View', 1)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (77, N'Reports', N'Field Premium', 17, N'View', 1)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (78, N'Reports', N'Field Premium', 17, N'Preview', 2)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (79, N'Reports', N'Audit Trail', 18, N'View', 1)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [Rights], [RightsSeqNo]) VALUES (80, N'Reports', N'Audit Trail', 18, N'View', 2)
INSERT [dbo].[Masterfile_User] ([Id], [Username], [EmployeeId], [RoleId], [Remarks], [Status]) VALUES (1, N'ec', 1, 1, N'LANTAJOs', 1)
INSERT [dbo].[Masterfile_User] ([Id], [Username], [EmployeeId], [RoleId], [Remarks], [Status]) VALUES (2, N'jplarisan', 32, 2, N'lantajo', 1)
INSERT [dbo].[Masterfile_User] ([Id], [Username], [EmployeeId], [RoleId], [Remarks], [Status]) VALUES (3, N'esci', 1, 1, N'LANTAJOs', 1)
INSERT [dbo].[Masterfile_User] ([Id], [Username], [EmployeeId], [RoleId], [Remarks], [Status]) VALUES (4, N'gary', 2, 2, N'sad', 1)
INSERT [dbo].[Masterfile_User] ([Id], [Username], [EmployeeId], [RoleId], [Remarks], [Status]) VALUES (5, N'lord', 2, 3, N'sad', 1)
INSERT [dbo].[Transaction_BudgetPeriod] ([Id], [Month], [Year], [PeriodStatus], [DateOpen], [DateClosed], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [OpenBy], [ClosedBy], [OpenRemarks], [ClosedRemarks], [Status]) VALUES (1, N'8', 2018, N'Closed', CAST(N'2018-07-25' AS Date), CAST(N'2018-07-31' AS Date), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 1, 1, N'', N'', 1)
INSERT [dbo].[Transaction_BudgetPeriod] ([Id], [Month], [Year], [PeriodStatus], [DateOpen], [DateClosed], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [OpenBy], [ClosedBy], [OpenRemarks], [ClosedRemarks], [Status]) VALUES (2, N'9', 2018, N'Open', CAST(N'2018-08-25' AS Date), CAST(N'2018-08-30' AS Date), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 1, 1, N'', N'', 1)
INSERT [dbo].[Transaction_BudgetPreparation] ([Id], [BudgetPeriodId], [BranchId], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [PreparedBy], [Remarks], [Status]) VALUES (1, 2, 10, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 3, NULL, 1)
INSERT [dbo].[Transaction_BudgetPreparation] ([Id], [BudgetPeriodId], [BranchId], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [PreparedBy], [Remarks], [Status]) VALUES (2, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, 3, N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [Type], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Total], [Remarks], [Status]) VALUES (1, 1, 1, 1, N'Collections', 0, N'Loans', NULL, 0, CAST(5000.00 AS Decimal(10, 2)), NULL, 0, CAST(1000.00 AS Decimal(10, 2)), CAST(1000.00 AS Decimal(10, 2)), CAST(1000.00 AS Decimal(10, 2)), CAST(1000.00 AS Decimal(10, 2)), CAST(1000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(5000.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [Type], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Total], [Remarks], [Status]) VALUES (2, 1, 1, 1, N'Collections', 0, N'CBU/Savings', NULL, 0, CAST(1000.00 AS Decimal(10, 2)), NULL, 0, CAST(200.00 AS Decimal(10, 2)), CAST(200.00 AS Decimal(10, 2)), CAST(200.00 AS Decimal(10, 2)), CAST(200.00 AS Decimal(10, 2)), CAST(200.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1000.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [Type], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Total], [Remarks], [Status]) VALUES (3, 1, 1, 1, N'Collections', 0, N'Insurance', NULL, 0, CAST(5.00 AS Decimal(10, 2)), NULL, 0, CAST(100.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(500.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [Type], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Total], [Remarks], [Status]) VALUES (4, 1, 1, 4, N'Excess FA/Cash Release', 0, N'Fund Transfer (IN REMCO)', NULL, 0, CAST(50000.00 AS Decimal(10, 2)), 1, 1, CAST(50000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(50000.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [Type], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Total], [Remarks], [Status]) VALUES (5, 1, 1, 4, N'Excess FA/Cash Release', 0, N'Fund Transfer(IN BANK)', NULL, 0, CAST(20000.00 AS Decimal(10, 2)), 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(20000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(20000.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [Type], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Total], [Remarks], [Status]) VALUES (6, 1, 1, 5, N'Other Collections', 0, N'Other Collections', NULL, 0, CAST(10000.00 AS Decimal(10, 2)), 5, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(10000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(10000.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [Type], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Total], [Remarks], [Status]) VALUES (7, 1, 2, 2, N'New Loans', 990741, N'Client 1', NULL, 0, CAST(1000.00 AS Decimal(10, 2)), 1, 0, CAST(1000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1000.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [Type], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Total], [Remarks], [Status]) VALUES (8, 1, 2, 2, N'New Loans', 60606, N'Client 1', NULL, 0, CAST(2000.00 AS Decimal(10, 2)), 2, 0, CAST(0.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), N'', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [Type], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Total], [Remarks], [Status]) VALUES (9, 1, 2, 2, N'New Loans', 60609, N'Client 1', NULL, 0, CAST(3000.00 AS Decimal(10, 2)), 3, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(3000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(3000.00 AS Decimal(10, 2)), N'', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [Type], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Total], [Remarks], [Status]) VALUES (10, 1, 2, 3, N'Reloans', 990741, N'Jesryl A. Plarisan', N'1001', 1, CAST(3000.00 AS Decimal(10, 2)), 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(3000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(3000.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [Type], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Total], [Remarks], [Status]) VALUES (11, 1, 2, 3, N'Reloans', 990741, N'Gary Antier', N'1002', 1, CAST(5000.00 AS Decimal(10, 2)), 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(5000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(5000.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [Type], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Total], [Remarks], [Status]) VALUES (12, 1, 2, 3, N'Reloans', 60606, N'Francisco Abayon', N'1003', 1, CAST(10000.00 AS Decimal(10, 2)), 4, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1000.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [Type], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Total], [Remarks], [Status]) VALUES (13, 1, 2, 3, N'Reloans', 60609, N'Clint Medalle', N'1004', 1, CAST(15000.00 AS Decimal(10, 2)), 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(15000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(15000.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [Type], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Total], [Remarks], [Status]) VALUES (14, 1, 2, 6, N'Operating Expenses', 0, N'Office Rental', N'29', 1, CAST(10000.00 AS Decimal(10, 2)), 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(10000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(10000.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [Type], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Total], [Remarks], [Status]) VALUES (15, 1, 2, 7, N'Other Disbursements', 0, N'CBU Withdrawal', N'431', 1, CAST(50000.00 AS Decimal(10, 2)), 0, 1, CAST(10000.00 AS Decimal(10, 2)), CAST(10000.00 AS Decimal(10, 2)), CAST(10000.00 AS Decimal(10, 2)), CAST(10000.00 AS Decimal(10, 2)), CAST(10000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(50000.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (1, CAST(N'2018-06-03' AS Date), 1, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (2, CAST(N'2018-06-03' AS Date), 2, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (3, CAST(N'2018-06-03' AS Date), 3, CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (4, CAST(N'2018-06-03' AS Date), 4, CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (5, CAST(N'2018-06-03' AS Date), 5, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (6, CAST(N'2018-06-03' AS Date), 6, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (7, CAST(N'2018-06-03' AS Date), 7, CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (8, CAST(N'2018-06-03' AS Date), 8, CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (9, CAST(N'2018-06-03' AS Date), 9, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (10, CAST(N'2018-06-03' AS Date), 10, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (11, CAST(N'2018-06-03' AS Date), 11, CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (12, CAST(N'2018-06-03' AS Date), 12, CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (13, CAST(N'2018-06-03' AS Date), 13, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (14, CAST(N'2018-06-03' AS Date), 14, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (15, CAST(N'2018-06-06' AS Date), 15, CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (16, CAST(N'2018-06-06' AS Date), 16, CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (17, CAST(N'2018-06-07' AS Date), 17, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (18, CAST(N'2018-06-07' AS Date), 18, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (19, CAST(N'2018-06-07' AS Date), 21, CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (20, CAST(N'2018-06-07' AS Date), 21, CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (21, CAST(N'2018-06-08' AS Date), 21, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (22, CAST(N'2018-06-08' AS Date), 21, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (23, CAST(N'2018-06-08' AS Date), 21, CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (24, CAST(N'2018-06-08' AS Date), 21, CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (25, CAST(N'2018-06-09' AS Date), 21, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (26, CAST(N'2018-06-09' AS Date), 21, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (27, CAST(N'2018-06-09' AS Date), 21, CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (28, CAST(N'2018-06-09' AS Date), 21, CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (29, CAST(N'2018-06-10' AS Date), 21, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (30, CAST(N'2018-06-10' AS Date), 21, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (31, CAST(N'2018-06-10' AS Date), 21, CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (32, CAST(N'2018-06-10' AS Date), 21, CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (33, CAST(N'2018-06-11' AS Date), 21, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (34, CAST(N'2018-06-11' AS Date), 21, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (35, CAST(N'2018-06-11' AS Date), 21, CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (36, CAST(N'2018-06-11' AS Date), 21, CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (37, CAST(N'2018-06-12' AS Date), 21, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (38, CAST(N'2018-06-12' AS Date), 21, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (39, CAST(N'2018-06-12' AS Date), 21, CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (40, CAST(N'2018-06-12' AS Date), 21, CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (41, CAST(N'2018-07-03' AS Date), 21, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (42, CAST(N'2018-07-03' AS Date), 21, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (43, CAST(N'2018-07-03' AS Date), 21, CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (44, CAST(N'2018-07-03' AS Date), 21, CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (45, CAST(N'2018-07-04' AS Date), 21, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (46, CAST(N'2018-07-04' AS Date), 21, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (47, CAST(N'2018-07-04' AS Date), 21, CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (48, CAST(N'2018-07-04' AS Date), 21, CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (49, CAST(N'2018-07-05' AS Date), 21, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (50, CAST(N'2018-07-05' AS Date), 21, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (51, CAST(N'2018-07-05' AS Date), 21, CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (52, CAST(N'2018-07-05' AS Date), 21, CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (53, CAST(N'2018-07-06' AS Date), 21, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (54, CAST(N'2018-07-06' AS Date), 21, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (55, CAST(N'2018-07-06' AS Date), 21, CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (56, CAST(N'2018-07-06' AS Date), 21, CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (57, CAST(N'2018-07-07' AS Date), 21, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (58, CAST(N'2018-07-07' AS Date), 21, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (59, CAST(N'2018-07-07' AS Date), 21, CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (60, CAST(N'2018-07-07' AS Date), 21, CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (61, CAST(N'2018-07-08' AS Date), 21, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (62, CAST(N'2018-07-08' AS Date), 21, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (63, CAST(N'2018-07-08' AS Date), 21, CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (64, CAST(N'2018-07-08' AS Date), 21, CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (65, CAST(N'2018-07-09' AS Date), 21, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (66, CAST(N'2018-07-09' AS Date), 21, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (67, CAST(N'2018-07-09' AS Date), 21, CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (68, CAST(N'2018-07-09' AS Date), 21, CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (69, CAST(N'2018-07-10' AS Date), 21, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (70, CAST(N'2018-07-10' AS Date), 21, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (71, CAST(N'2018-07-10' AS Date), 21, CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (72, CAST(N'2018-07-10' AS Date), 21, CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (73, CAST(N'2018-07-11' AS Date), 21, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (74, CAST(N'2018-07-11' AS Date), 21, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (75, CAST(N'2018-07-11' AS Date), 21, CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (76, CAST(N'2018-07-11' AS Date), 21, CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (77, CAST(N'2018-07-12' AS Date), 21, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (78, CAST(N'2018-07-12' AS Date), 21, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (79, CAST(N'2018-07-12' AS Date), 21, CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (80, CAST(N'2018-07-12' AS Date), 21, CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (81, CAST(N'2018-06-11' AS Date), 21, CAST(125031.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (82, CAST(N'2018-06-11' AS Date), 21, CAST(41032.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (83, CAST(N'2018-06-11' AS Date), 21, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (84, CAST(N'2018-06-11' AS Date), 21, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (85, CAST(N'2018-06-11' AS Date), 21, CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (86, CAST(N'2018-06-11' AS Date), 21, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (87, CAST(N'2018-06-11' AS Date), 21, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (88, CAST(N'2018-06-11' AS Date), 21, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (89, CAST(N'2018-06-11' AS Date), 21, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (90, CAST(N'2018-06-11' AS Date), 21, CAST(12.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (91, CAST(N'2018-06-11' AS Date), 21, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (92, CAST(N'2018-06-11' AS Date), 21, CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (93, CAST(N'2018-06-11' AS Date), 21, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (94, CAST(N'2018-06-11' AS Date), 21, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (95, CAST(N'2018-06-12' AS Date), 64, CAST(125031.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (96, CAST(N'2018-06-12' AS Date), 65, CAST(41032.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (97, CAST(N'2018-06-12' AS Date), 0, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (98, CAST(N'2018-06-12' AS Date), 63, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (99, CAST(N'2018-06-12' AS Date), 62, CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (100, CAST(N'2018-06-12' AS Date), 61, CAST(10000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (101, CAST(N'2018-06-12' AS Date), 66, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (102, CAST(N'2018-06-12' AS Date), 67, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (103, CAST(N'2018-06-12' AS Date), 68, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (104, CAST(N'2018-06-12' AS Date), 70, CAST(12.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (105, CAST(N'2018-06-12' AS Date), 71, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (106, CAST(N'2018-06-12' AS Date), 60, CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (107, CAST(N'2018-06-12' AS Date), 72, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (108, CAST(N'2018-06-12' AS Date), 95, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (109, CAST(N'2018-06-13' AS Date), 70, CAST(12.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (110, CAST(N'2018-06-13' AS Date), 61, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (111, CAST(N'2018-06-13' AS Date), 69, CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (112, CAST(N'2018-06-13' AS Date), 63, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (113, CAST(N'2018-06-13' AS Date), 95, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (114, CAST(N'2018-06-14' AS Date), 64, CAST(125031.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (115, CAST(N'2018-06-14' AS Date), 65, CAST(41032.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (116, CAST(N'2018-06-14' AS Date), 0, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (117, CAST(N'2018-06-14' AS Date), 63, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (118, CAST(N'2018-06-14' AS Date), 62, CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (119, CAST(N'2018-06-14' AS Date), 61, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (120, CAST(N'2018-06-14' AS Date), 66, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (121, CAST(N'2018-06-14' AS Date), 67, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (122, CAST(N'2018-06-14' AS Date), 68, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (123, CAST(N'2018-06-14' AS Date), 70, CAST(12.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (124, CAST(N'2018-06-14' AS Date), 71, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (125, CAST(N'2018-06-14' AS Date), 60, CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (126, CAST(N'2018-06-14' AS Date), 72, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (127, CAST(N'2018-06-14' AS Date), 95, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (128, CAST(N'2018-06-15' AS Date), 64, CAST(125031.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (129, CAST(N'2018-06-15' AS Date), 65, CAST(41032.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (130, CAST(N'2018-06-15' AS Date), 0, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (131, CAST(N'2018-06-15' AS Date), 62, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (132, CAST(N'2018-06-15' AS Date), 63, CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (133, CAST(N'2018-06-15' AS Date), 60, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (134, CAST(N'2018-06-15' AS Date), 61, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (135, CAST(N'2018-06-15' AS Date), 66, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (136, CAST(N'2018-06-15' AS Date), 67, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (137, CAST(N'2018-06-15' AS Date), 70, CAST(12.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (138, CAST(N'2018-06-15' AS Date), 71, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (139, CAST(N'2018-06-15' AS Date), 68, CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (140, CAST(N'2018-06-15' AS Date), 72, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (141, CAST(N'2018-06-15' AS Date), 95, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (142, CAST(N'2018-06-16' AS Date), 64, CAST(125031.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (143, CAST(N'2018-06-16' AS Date), 65, CAST(41032.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (144, CAST(N'2018-06-16' AS Date), 0, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (145, CAST(N'2018-06-16' AS Date), 62, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (146, CAST(N'2018-06-16' AS Date), 63, CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (147, CAST(N'2018-06-16' AS Date), 60, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (148, CAST(N'2018-06-16' AS Date), 61, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (149, CAST(N'2018-06-16' AS Date), 66, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (150, CAST(N'2018-06-16' AS Date), 67, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (151, CAST(N'2018-06-16' AS Date), 70, CAST(12.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (152, CAST(N'2018-06-16' AS Date), 71, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (153, CAST(N'2018-06-16' AS Date), 68, CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (154, CAST(N'2018-06-16' AS Date), 72, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (155, CAST(N'2018-06-16' AS Date), 95, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (156, CAST(N'2018-06-17' AS Date), 64, CAST(125031.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (157, CAST(N'2018-06-17' AS Date), 65, CAST(41032.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (158, CAST(N'2018-06-17' AS Date), 0, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (159, CAST(N'2018-06-17' AS Date), 62, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (160, CAST(N'2018-06-17' AS Date), 63, CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (161, CAST(N'2018-06-17' AS Date), 60, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (162, CAST(N'2018-06-17' AS Date), 61, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (163, CAST(N'2018-06-17' AS Date), 66, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (164, CAST(N'2018-06-17' AS Date), 67, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (165, CAST(N'2018-06-17' AS Date), 70, CAST(12.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (166, CAST(N'2018-06-17' AS Date), 71, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (167, CAST(N'2018-06-17' AS Date), 68, CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (168, CAST(N'2018-06-17' AS Date), 72, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (169, CAST(N'2018-06-17' AS Date), 95, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (170, CAST(N'2018-06-18' AS Date), 64, CAST(125031.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (171, CAST(N'2018-06-18' AS Date), 65, CAST(41032.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (172, CAST(N'2018-06-18' AS Date), 0, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (173, CAST(N'2018-06-18' AS Date), 62, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (174, CAST(N'2018-06-18' AS Date), 63, CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (175, CAST(N'2018-06-18' AS Date), 60, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (176, CAST(N'2018-06-18' AS Date), 61, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (177, CAST(N'2018-06-18' AS Date), 66, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (178, CAST(N'2018-06-18' AS Date), 67, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (179, CAST(N'2018-06-18' AS Date), 70, CAST(12.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (180, CAST(N'2018-06-18' AS Date), 71, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (181, CAST(N'2018-06-18' AS Date), 68, CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (182, CAST(N'2018-06-18' AS Date), 72, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (183, CAST(N'2018-06-18' AS Date), 95, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (200, CAST(N'2018-06-19' AS Date), 64, CAST(125031.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (201, CAST(N'2018-06-19' AS Date), 65, CAST(41032.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (202, CAST(N'2018-06-19' AS Date), 0, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (203, CAST(N'2018-06-19' AS Date), 62, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (204, CAST(N'2018-06-19' AS Date), 63, CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (205, CAST(N'2018-06-19' AS Date), 60, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (206, CAST(N'2018-06-19' AS Date), 61, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (207, CAST(N'2018-06-19' AS Date), 66, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (208, CAST(N'2018-06-19' AS Date), 67, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (209, CAST(N'2018-06-19' AS Date), 70, CAST(12.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (210, CAST(N'2018-06-19' AS Date), 68, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (211, CAST(N'2018-06-19' AS Date), 72, CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (212, CAST(N'2018-06-19' AS Date), 73, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (213, CAST(N'2018-06-19' AS Date), 95, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (214, CAST(N'2018-06-21' AS Date), 64, CAST(125031.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (215, CAST(N'2018-06-21' AS Date), 65, CAST(41032.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (216, CAST(N'2018-06-21' AS Date), 0, CAST(10000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (217, CAST(N'2018-06-21' AS Date), 62, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (218, CAST(N'2018-06-21' AS Date), 63, CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (219, CAST(N'2018-06-21' AS Date), 60, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (220, CAST(N'2018-06-21' AS Date), 61, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (221, CAST(N'2018-06-21' AS Date), 66, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (222, CAST(N'2018-06-21' AS Date), 67, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (223, CAST(N'2018-06-21' AS Date), 70, CAST(12.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (224, CAST(N'2018-06-21' AS Date), 68, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (225, CAST(N'2018-06-21' AS Date), 72, CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (226, CAST(N'2018-06-21' AS Date), 73, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (227, CAST(N'2018-06-21' AS Date), 95, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (228, CAST(N'2018-06-22' AS Date), 64, CAST(125031.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (229, CAST(N'2018-06-22' AS Date), 65, CAST(41032.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (230, CAST(N'2018-06-22' AS Date), 0, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (231, CAST(N'2018-06-22' AS Date), 62, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (232, CAST(N'2018-06-22' AS Date), 63, CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (233, CAST(N'2018-06-22' AS Date), 60, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (234, CAST(N'2018-06-22' AS Date), 61, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (235, CAST(N'2018-06-22' AS Date), 66, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (236, CAST(N'2018-06-22' AS Date), 67, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (237, CAST(N'2018-06-22' AS Date), 70, CAST(12.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (238, CAST(N'2018-06-22' AS Date), 68, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (239, CAST(N'2018-06-22' AS Date), 72, CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (240, CAST(N'2018-06-22' AS Date), 73, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (241, CAST(N'2018-06-22' AS Date), 95, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (242, CAST(N'2018-06-22' AS Date), 64, CAST(125031.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (243, CAST(N'2018-06-22' AS Date), 65, CAST(41032.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (244, CAST(N'2018-06-22' AS Date), 0, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (245, CAST(N'2018-06-22' AS Date), 62, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (246, CAST(N'2018-06-22' AS Date), 63, CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (247, CAST(N'2018-06-22' AS Date), 60, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (248, CAST(N'2018-06-22' AS Date), 61, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (249, CAST(N'2018-06-22' AS Date), 66, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (250, CAST(N'2018-06-22' AS Date), 67, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (251, CAST(N'2018-06-22' AS Date), 70, CAST(12.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (252, CAST(N'2018-06-22' AS Date), 68, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (253, CAST(N'2018-06-22' AS Date), 72, CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (254, CAST(N'2018-06-22' AS Date), 73, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (255, CAST(N'2018-06-22' AS Date), 95, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (256, CAST(N'2018-06-23' AS Date), 64, CAST(125031.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (257, CAST(N'2018-06-23' AS Date), 65, CAST(41032.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (258, CAST(N'2018-06-23' AS Date), 0, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (259, CAST(N'2018-06-23' AS Date), 62, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (260, CAST(N'2018-06-23' AS Date), 63, CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (261, CAST(N'2018-06-23' AS Date), 60, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (262, CAST(N'2018-06-23' AS Date), 61, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (263, CAST(N'2018-06-23' AS Date), 66, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (264, CAST(N'2018-06-23' AS Date), 67, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (265, CAST(N'2018-06-23' AS Date), 70, CAST(12.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (266, CAST(N'2018-06-23' AS Date), 68, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (267, CAST(N'2018-06-23' AS Date), 72, CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (268, CAST(N'2018-06-23' AS Date), 73, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (269, CAST(N'2018-06-23' AS Date), 95, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (270, CAST(N'2018-06-24' AS Date), 64, CAST(125031.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (271, CAST(N'2018-06-24' AS Date), 65, CAST(41032.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (272, CAST(N'2018-06-24' AS Date), 0, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (273, CAST(N'2018-06-24' AS Date), 62, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (274, CAST(N'2018-06-24' AS Date), 63, CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (275, CAST(N'2018-06-24' AS Date), 60, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (276, CAST(N'2018-06-24' AS Date), 61, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (277, CAST(N'2018-06-24' AS Date), 66, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (278, CAST(N'2018-06-24' AS Date), 67, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (279, CAST(N'2018-06-24' AS Date), 70, CAST(12.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (280, CAST(N'2018-06-24' AS Date), 68, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (281, CAST(N'2018-06-24' AS Date), 72, CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (282, CAST(N'2018-06-24' AS Date), 73, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (283, CAST(N'2018-06-24' AS Date), 95, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (284, CAST(N'2018-06-25' AS Date), 64, CAST(125031.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (285, CAST(N'2018-06-25' AS Date), 65, CAST(41032.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (286, CAST(N'2018-06-25' AS Date), 0, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (287, CAST(N'2018-06-25' AS Date), 62, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (288, CAST(N'2018-06-25' AS Date), 63, CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (289, CAST(N'2018-06-25' AS Date), 60, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (290, CAST(N'2018-06-25' AS Date), 61, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (291, CAST(N'2018-06-25' AS Date), 66, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (292, CAST(N'2018-06-25' AS Date), 67, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (293, CAST(N'2018-06-25' AS Date), 70, CAST(12.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (294, CAST(N'2018-06-25' AS Date), 68, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (295, CAST(N'2018-06-25' AS Date), 72, CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (296, CAST(N'2018-06-25' AS Date), 73, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (297, CAST(N'2018-06-25' AS Date), 95, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (298, CAST(N'2018-06-26' AS Date), 64, CAST(125031.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (299, CAST(N'2018-06-26' AS Date), 65, CAST(41032.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (300, CAST(N'2018-06-26' AS Date), 0, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (301, CAST(N'2018-06-26' AS Date), 62, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (302, CAST(N'2018-06-26' AS Date), 63, CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (303, CAST(N'2018-06-26' AS Date), 60, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (304, CAST(N'2018-06-26' AS Date), 61, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (305, CAST(N'2018-06-26' AS Date), 66, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (306, CAST(N'2018-06-26' AS Date), 67, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (307, CAST(N'2018-06-26' AS Date), 70, CAST(12.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (308, CAST(N'2018-06-26' AS Date), 68, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (309, CAST(N'2018-06-26' AS Date), 72, CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (310, CAST(N'2018-06-26' AS Date), 73, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (311, CAST(N'2018-06-26' AS Date), 95, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (312, CAST(N'2018-06-27' AS Date), 64, CAST(125031.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (313, CAST(N'2018-06-27' AS Date), 65, CAST(41032.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (314, CAST(N'2018-06-27' AS Date), 0, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (315, CAST(N'2018-06-27' AS Date), 62, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (316, CAST(N'2018-06-27' AS Date), 63, CAST(15.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (317, CAST(N'2018-06-27' AS Date), 60, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (318, CAST(N'2018-06-27' AS Date), 61, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (319, CAST(N'2018-06-27' AS Date), 66, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (320, CAST(N'2018-06-27' AS Date), 67, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (321, CAST(N'2018-06-27' AS Date), 70, CAST(12.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (322, CAST(N'2018-06-27' AS Date), 68, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (323, CAST(N'2018-06-27' AS Date), 72, CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (324, CAST(N'2018-06-27' AS Date), 73, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (325, CAST(N'2018-06-27' AS Date), 95, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (326, CAST(N'2018-06-28' AS Date), 64, CAST(125031.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (327, CAST(N'2018-06-28' AS Date), 65, CAST(41032.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (328, CAST(N'2018-06-28' AS Date), 0, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (329, CAST(N'2018-06-28' AS Date), 62, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (330, CAST(N'2018-06-28' AS Date), 63, CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (331, CAST(N'2018-06-28' AS Date), 60, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (332, CAST(N'2018-06-28' AS Date), 61, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (333, CAST(N'2018-06-28' AS Date), 66, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (334, CAST(N'2018-06-28' AS Date), 67, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (335, CAST(N'2018-06-28' AS Date), 70, CAST(12.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (336, CAST(N'2018-06-28' AS Date), 68, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (337, CAST(N'2018-06-28' AS Date), 72, CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (338, CAST(N'2018-06-28' AS Date), 73, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (339, CAST(N'2018-06-28' AS Date), 95, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (340, CAST(N'2018-06-29' AS Date), 64, CAST(125031.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (341, CAST(N'2018-06-29' AS Date), 65, CAST(41032.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (342, CAST(N'2018-06-29' AS Date), 0, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (343, CAST(N'2018-06-29' AS Date), 62, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (344, CAST(N'2018-06-29' AS Date), 63, CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (345, CAST(N'2018-06-29' AS Date), 60, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (346, CAST(N'2018-06-29' AS Date), 61, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (347, CAST(N'2018-06-29' AS Date), 66, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (348, CAST(N'2018-06-29' AS Date), 67, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (349, CAST(N'2018-06-29' AS Date), 70, CAST(12.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (350, CAST(N'2018-06-29' AS Date), 68, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (351, CAST(N'2018-06-29' AS Date), 72, CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (352, CAST(N'2018-06-29' AS Date), 73, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (353, CAST(N'2018-06-29' AS Date), 95, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (354, CAST(N'2018-06-30' AS Date), 64, CAST(125031.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (355, CAST(N'2018-06-30' AS Date), 65, CAST(41032.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (356, CAST(N'2018-06-30' AS Date), 0, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (357, CAST(N'2018-06-30' AS Date), 62, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (358, CAST(N'2018-06-30' AS Date), 63, CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (359, CAST(N'2018-06-30' AS Date), 60, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (360, CAST(N'2018-06-30' AS Date), 61, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (361, CAST(N'2018-06-30' AS Date), 66, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (362, CAST(N'2018-06-30' AS Date), 67, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (363, CAST(N'2018-06-30' AS Date), 70, CAST(12.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (364, CAST(N'2018-06-30' AS Date), 68, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (365, CAST(N'2018-06-30' AS Date), 72, CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (366, CAST(N'2018-06-30' AS Date), 73, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (367, CAST(N'2018-06-30' AS Date), 95, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (368, CAST(N'2018-07-01' AS Date), 64, CAST(125031.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (369, CAST(N'2018-07-01' AS Date), 65, CAST(41032.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (370, CAST(N'2018-07-01' AS Date), 0, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (371, CAST(N'2018-07-01' AS Date), 62, CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (372, CAST(N'2018-07-01' AS Date), 63, CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (373, CAST(N'2018-07-01' AS Date), 60, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (374, CAST(N'2018-07-01' AS Date), 61, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (375, CAST(N'2018-07-01' AS Date), 66, CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (376, CAST(N'2018-07-01' AS Date), 67, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (377, CAST(N'2018-07-01' AS Date), 70, CAST(12.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (378, CAST(N'2018-07-01' AS Date), 68, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (379, CAST(N'2018-07-01' AS Date), 72, CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (380, CAST(N'2018-07-01' AS Date), 73, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [DetailId], [Amount]) VALUES (381, CAST(N'2018-07-01' AS Date), 95, CAST(1100.00 AS Decimal(10, 2)))
/****** Object:  Index [IQ_Masterfile_AccessRights_RoleID]    Script Date: 9/7/2018 10:06:20 AM ******/
CREATE NONCLUSTERED INDEX [IQ_Masterfile_AccessRights_RoleID] ON [dbo].[Masterfile_AccessRights]
(
	[RoleId] ASC,
	[SystemRightsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IQ_Masterfile_Area]    Script Date: 9/7/2018 10:06:20 AM ******/
CREATE NONCLUSTERED INDEX [IQ_Masterfile_Area] ON [dbo].[Masterfile_Area]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Masterfile_Branch]    Script Date: 9/7/2018 10:06:20 AM ******/
ALTER TABLE [dbo].[Masterfile_Branch] ADD  CONSTRAINT [UQ_Masterfile_Branch] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IQ_Masterfile_ChartOfAccount_Code]    Script Date: 9/7/2018 10:06:20 AM ******/
CREATE NONCLUSTERED INDEX [IQ_Masterfile_ChartOfAccount_Code] ON [dbo].[Masterfile_ChartOfAccount]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IQ_Masterfile_District]    Script Date: 9/7/2018 10:06:20 AM ******/
CREATE NONCLUSTERED INDEX [IQ_Masterfile_District] ON [dbo].[Masterfile_District]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IQ_Masterfile_Employee_ContractNumber]    Script Date: 9/7/2018 10:06:20 AM ******/
CREATE NONCLUSTERED INDEX [IQ_Masterfile_Employee_ContractNumber] ON [dbo].[Masterfile_Employee]
(
	[ContactNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IQ_Masterfile_Employee_EmailAddress]    Script Date: 9/7/2018 10:06:20 AM ******/
CREATE NONCLUSTERED INDEX [IQ_Masterfile_Employee_EmailAddress] ON [dbo].[Masterfile_Employee]
(
	[EmailAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IQ_Masterfile_OtherReceiptDetail_Description]    Script Date: 9/7/2018 10:06:20 AM ******/
CREATE NONCLUSTERED INDEX [IQ_Masterfile_OtherReceiptDetail_Description] ON [dbo].[Masterfile_OtherReceiptDetail]
(
	[Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IQ_Masterfile_Name]    Script Date: 9/7/2018 10:06:20 AM ******/
CREATE NONCLUSTERED INDEX [IQ_Masterfile_Name] ON [dbo].[Masterfile_Region]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Masterfile_User_Username]    Script Date: 9/7/2018 10:06:20 AM ******/
ALTER TABLE [dbo].[Masterfile_User] ADD  CONSTRAINT [UQ_Masterfile_User_Username] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IQ_Transaction_BudgetPeriod_Year]    Script Date: 9/7/2018 10:06:20 AM ******/
CREATE NONCLUSTERED INDEX [IQ_Transaction_BudgetPeriod_Year] ON [dbo].[Transaction_BudgetPeriod]
(
	[Year] ASC,
	[Month] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Masterfile_OtherDisbursementDetail] ADD  CONSTRAINT [DF__Masterfile___Day__395884C4]  DEFAULT ((0)) FOR [Day]
GO
ALTER TABLE [dbo].[Masterfile_OtherDisbursementDetail] ADD  CONSTRAINT [DF__Masterfil__Chann__3864608B]  DEFAULT ((0)) FOR [ChannelId]
GO
ALTER TABLE [dbo].[Masterfile_OtherReceiptDetail] ADD  CONSTRAINT [DF__Masterfil__Chann__3A4CA8FD]  DEFAULT ((0)) FOR [ChannelId]
GO
ALTER TABLE [dbo].[Transaction_BudgetPeriod] ADD  CONSTRAINT [DF_Transaction_BudgetPeriod_TotalInflowBudget]  DEFAULT ((0)) FOR [TotalInflowBudget]
GO
ALTER TABLE [dbo].[Transaction_BudgetPeriod] ADD  CONSTRAINT [DF_Transaction_BudgetPeriod_TotalInflowActual]  DEFAULT ((0)) FOR [TotalInflowActual]
GO
ALTER TABLE [dbo].[Transaction_BudgetPeriod] ADD  CONSTRAINT [DF_Transaction_BudgetPeriod_TotalInflowVariance]  DEFAULT ((0)) FOR [TotalInflowVariance]
GO
ALTER TABLE [dbo].[Transaction_BudgetPeriod] ADD  CONSTRAINT [DF_Transaction_BudgetPeriod_TotalOutflowBudget]  DEFAULT ((0)) FOR [TotalOutflowBudget]
GO
ALTER TABLE [dbo].[Transaction_BudgetPeriod] ADD  CONSTRAINT [DF_Transaction_BudgetPeriod_TotalOutflowActual]  DEFAULT ((0)) FOR [TotalOutflowActual]
GO
ALTER TABLE [dbo].[Transaction_BudgetPeriod] ADD  CONSTRAINT [DF_Transaction_BudgetPeriod_TotalOutflowVariance]  DEFAULT ((0)) FOR [TotalOutflowVariance]
GO
ALTER TABLE [dbo].[Masterfile_Area]  WITH CHECK ADD  CONSTRAINT [FK_Masterfile_Area_Masterfile_District_AreaId] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[Masterfile_District] ([Id])
GO
ALTER TABLE [dbo].[Masterfile_Area] CHECK CONSTRAINT [FK_Masterfile_Area_Masterfile_District_AreaId]
GO
ALTER TABLE [dbo].[Masterfile_Branch]  WITH CHECK ADD  CONSTRAINT [FK_Masterfile_Branch_Masterfile_Area_AreaId] FOREIGN KEY([AreaId])
REFERENCES [dbo].[Masterfile_Area] ([Id])
GO
ALTER TABLE [dbo].[Masterfile_Branch] CHECK CONSTRAINT [FK_Masterfile_Branch_Masterfile_Area_AreaId]
GO
ALTER TABLE [dbo].[Masterfile_District]  WITH CHECK ADD  CONSTRAINT [FK_Masterfile_District_Masterfile_Region_RegionId] FOREIGN KEY([RegionId])
REFERENCES [dbo].[Masterfile_Region] ([Id])
GO
ALTER TABLE [dbo].[Masterfile_District] CHECK CONSTRAINT [FK_Masterfile_District_Masterfile_Region_RegionId]
GO
ALTER TABLE [dbo].[Masterfile_Employee]  WITH CHECK ADD  CONSTRAINT [FK_Masterfile_Employee_Masterfile_Branch_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Masterfile_Branch] ([Id])
GO
ALTER TABLE [dbo].[Masterfile_Employee] CHECK CONSTRAINT [FK_Masterfile_Employee_Masterfile_Branch_BranchId]
GO
ALTER TABLE [dbo].[Masterfile_OtherDisbursementDetail]  WITH CHECK ADD  CONSTRAINT [FK_Masterfile_OtherDisbursementDetail_Masterfile_Branch_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Masterfile_Branch] ([Id])
GO
ALTER TABLE [dbo].[Masterfile_OtherDisbursementDetail] CHECK CONSTRAINT [FK_Masterfile_OtherDisbursementDetail_Masterfile_Branch_BranchId]
GO
ALTER TABLE [dbo].[Masterfile_OtherDisbursementDetail]  WITH CHECK ADD  CONSTRAINT [FK_Masterfile_OtherDisbursementDetail_Masterfile_Category_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Masterfile_Category] ([Id])
GO
ALTER TABLE [dbo].[Masterfile_OtherDisbursementDetail] CHECK CONSTRAINT [FK_Masterfile_OtherDisbursementDetail_Masterfile_Category_CategoryId]
GO
ALTER TABLE [dbo].[Masterfile_OtherDisbursementDetail]  WITH CHECK ADD  CONSTRAINT [FK_Masterfile_OtherDisbursementDetail_Masterfile_Channel_ChannelId] FOREIGN KEY([ChannelId])
REFERENCES [dbo].[Masterfile_Channel] ([Id])
GO
ALTER TABLE [dbo].[Masterfile_OtherDisbursementDetail] CHECK CONSTRAINT [FK_Masterfile_OtherDisbursementDetail_Masterfile_Channel_ChannelId]
GO
ALTER TABLE [dbo].[Masterfile_OtherDisbursementDetail]  WITH CHECK ADD  CONSTRAINT [FK_Masterfile_OtherDisbursementDetail_Masterfile_ChartOfAccount_ChartOfAccountId] FOREIGN KEY([ChartOfAccountId])
REFERENCES [dbo].[Masterfile_ChartOfAccount] ([Id])
GO
ALTER TABLE [dbo].[Masterfile_OtherDisbursementDetail] CHECK CONSTRAINT [FK_Masterfile_OtherDisbursementDetail_Masterfile_ChartOfAccount_ChartOfAccountId]
GO
ALTER TABLE [dbo].[Masterfile_OtherReceiptDetail]  WITH CHECK ADD  CONSTRAINT [FK_Masterfile_OtherReceiptDetail_Masterfile_Branch_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Masterfile_Branch] ([Id])
GO
ALTER TABLE [dbo].[Masterfile_OtherReceiptDetail] CHECK CONSTRAINT [FK_Masterfile_OtherReceiptDetail_Masterfile_Branch_BranchId]
GO
ALTER TABLE [dbo].[Masterfile_OtherReceiptDetail]  WITH CHECK ADD  CONSTRAINT [FK_Masterfile_OtherReceiptDetail_Masterfile_Category_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Masterfile_Category] ([Id])
GO
ALTER TABLE [dbo].[Masterfile_OtherReceiptDetail] CHECK CONSTRAINT [FK_Masterfile_OtherReceiptDetail_Masterfile_Category_CategoryId]
GO
ALTER TABLE [dbo].[Masterfile_OtherReceiptDetail]  WITH CHECK ADD  CONSTRAINT [FK_Masterfile_OtherReceiptDetail_Masterfile_Channel_ChannelId] FOREIGN KEY([ChannelId])
REFERENCES [dbo].[Masterfile_Channel] ([Id])
GO
ALTER TABLE [dbo].[Masterfile_OtherReceiptDetail] CHECK CONSTRAINT [FK_Masterfile_OtherReceiptDetail_Masterfile_Channel_ChannelId]
GO
ALTER TABLE [dbo].[Masterfile_OtherReceiptDetail]  WITH CHECK ADD  CONSTRAINT [FK_Masterfile_OtherReceiptDetail_Masterfile_ChartOfAccount_ChartOfAccountId] FOREIGN KEY([ChartOfAccountId])
REFERENCES [dbo].[Masterfile_ChartOfAccount] ([Id])
GO
ALTER TABLE [dbo].[Masterfile_OtherReceiptDetail] CHECK CONSTRAINT [FK_Masterfile_OtherReceiptDetail_Masterfile_ChartOfAccount_ChartOfAccountId]
GO
ALTER TABLE [dbo].[Masterfile_User]  WITH CHECK ADD  CONSTRAINT [FK_Masterfile_User_Masterfile_Employee_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Masterfile_Employee] ([Id])
GO
ALTER TABLE [dbo].[Masterfile_User] CHECK CONSTRAINT [FK_Masterfile_User_Masterfile_Employee_EmployeeId]
GO
ALTER TABLE [dbo].[Masterfile_User]  WITH CHECK ADD  CONSTRAINT [FK_Masterfile_User_Masterfile_Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Masterfile_Role] ([Id])
GO
ALTER TABLE [dbo].[Masterfile_User] CHECK CONSTRAINT [FK_Masterfile_User_Masterfile_Role_RoleId]
GO
ALTER TABLE [dbo].[Transaction_BudgetPeriod]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_BudgetPeriod_Masterfile_User_ClosedByUserId] FOREIGN KEY([ClosedBy])
REFERENCES [dbo].[Masterfile_User] ([Id])
GO
ALTER TABLE [dbo].[Transaction_BudgetPeriod] CHECK CONSTRAINT [FK_Transaction_BudgetPeriod_Masterfile_User_ClosedByUserId]
GO
ALTER TABLE [dbo].[Transaction_BudgetPeriod]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_BudgetPeriod_Masterfile_User_OpenByUserId] FOREIGN KEY([OpenBy])
REFERENCES [dbo].[Masterfile_User] ([Id])
GO
ALTER TABLE [dbo].[Transaction_BudgetPeriod] CHECK CONSTRAINT [FK_Transaction_BudgetPeriod_Masterfile_User_OpenByUserId]
GO
ALTER TABLE [dbo].[Transaction_BudgetPreparation]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_BudgetPreparation_Masterfile_Branch_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Masterfile_Branch] ([Id])
GO
ALTER TABLE [dbo].[Transaction_BudgetPreparation] CHECK CONSTRAINT [FK_Transaction_BudgetPreparation_Masterfile_Branch_BranchId]
GO
ALTER TABLE [dbo].[Transaction_BudgetPreparation]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_BudgetPreparation_Masterfile_User_UserId] FOREIGN KEY([PreparedBy])
REFERENCES [dbo].[Masterfile_User] ([Id])
GO
ALTER TABLE [dbo].[Transaction_BudgetPreparation] CHECK CONSTRAINT [FK_Transaction_BudgetPreparation_Masterfile_User_UserId]
GO
/****** Object:  StoredProcedure [dbo].[spAuditTrail_get]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Area_get
-- =============================================
CREATE PROCEDURE [dbo].[spAuditTrail_get]
	-- Add the parameters for the stored procedure here
	@TableName		VARCHAR(35),
	@TableId		BIGINT,
	@Action			VARCHAR(25),
	@ComputerName	VARCHAR(100),
	@Contributer		BIGINT,
	@DateExecuted		DATE,
	@TimeExecuted		TIME(7)	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			SELECT * FROM Audit_Trail WHERE 
	 (TableName = @TableName OR @TableName ='') AND
     (TableId  = @TableId  OR @TableId='') AND
     ([Action]   = @Action    OR @Action  ='') AND
     (ComputerName      = @ComputerName    OR @ComputerName = '') AND
	 ([Contributer]   = @Contributer    OR @Contributer = '') AND
	 ([DateExecuted]   = @DateExecuted    OR @DateExecuted = '' ) AND
	 ([TimeExecuted]   = @TimeExecuted    OR @TimeExecuted = '' )
	
		 
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION
		
		-- Return the generic error type	  
		SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
				ERROR_SEVERITY()	AS 'ErrorSeverity',  
				ERROR_STATE()		AS 'ErrorState',
				ERROR_PROCEDURE()	AS 'ErrorProcedure',  
				ERROR_LINE()		AS 'ErrorLine',
				ERROR_MESSAGE()		AS 'ErrorMessage',
				'failed'			AS 'return_message';
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spAuditTrail_getByDate]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Area_get
-- =============================================
CREATE PROCEDURE [dbo].[spAuditTrail_getByDate]
	-- Add the parameters for the stored procedure here
	@TableName		VARCHAR(35),
	@TableId		BIGINT,
	@Action			VARCHAR(25),
	@ComputerName	VARCHAR(100),
	@Contributer		BIGINT,
	@DateExecuted		DATE,
	@TimeExecuted		TIME(7),	
	@FromDate DATE,
	@ToDate DATE,
	@AuditID			INT	= 0,
	@PageNumber		INT = 1,
	@RowsPage 		INT = 10
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			IF  (@AuditID = 0)
				BEGIN

					WITH TempResult AS( 
						SELECT [Action] AS 'Operation'
							, ComputerName
							,CONCAT(LastName,',',Firstname,' ',Middlename) AS 'EmployeeName'
						 FROM Audit_Trail 
							inner join  Masterfile_User mu
						on Audit_Trail.Contributer = mu.Id 
							inner join  Masterfile_Employee me
						on mu.EmployeeId = me.Id 

						WHERE 
					  DateExecuted >= @FromDate AND DateExecuted <= @FromDate AND
					 (TableName = @TableName OR @TableName ='') AND
					 (TableId  = @TableId  OR @TableId='') AND
					 ([Action]   = @Action    OR @Action  ='') AND
					 (ComputerName      = @ComputerName    OR @ComputerName = '') AND
					 ([Contributer]   = @Contributer    OR @Contributer = '') AND
					 ([DateExecuted]   = @DateExecuted    OR @DateExecuted = '' ) AND
					 ([TimeExecuted]   = @TimeExecuted    OR @TimeExecuted = '' )
					
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.EmployeeName
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

				END
			ELSE
				BEGIN

					WITH TempResult AS(
						SELECT [Action] AS 'Operation'
							, ComputerName
							,CONCAT(LastName,',',Firstname,' ',Middlename) AS 'EmployeeName'
						 FROM Audit_Trail ADT 
							inner join  Masterfile_User mu
						on ADT.Contributer = mu.Id 
							inner join  Masterfile_Employee me
						on mu.EmployeeId = me.Id 
					WHERE 
					  DateExecuted >= @FromDate AND DateExecuted <= @FromDate AND
					 (TableName = @TableName OR @TableName ='') AND
					 (TableId  = @TableId  OR @TableId='') AND
					 ([Action]   = @Action    OR @Action  ='') AND
					 (ComputerName      = @ComputerName    OR @ComputerName = '') AND
					 ([Contributer]   = @Contributer    OR @Contributer = '') AND
					 ([DateExecuted]   = @DateExecuted    OR @DateExecuted = '' ) AND
					 ([TimeExecuted]   = @TimeExecuted    OR @TimeExecuted = '' )
					
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.EmployeeName
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;
				END
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION
		
		-- Return the generic error type	  
		SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
				ERROR_SEVERITY()	AS 'ErrorSeverity',  
				ERROR_STATE()		AS 'ErrorState',
				ERROR_PROCEDURE()	AS 'ErrorProcedure',  
				ERROR_LINE()		AS 'ErrorLine',
				ERROR_MESSAGE()		AS 'ErrorMessage',
				'failed'			AS 'return_message';
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spAuditTrail_insert]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spAuditTrail_insert 'Masterfile_Area',1,'Update',1,'Kamote'
-- =============================================
CREATE PROCEDURE [dbo].[spAuditTrail_insert]
	-- Add the parameters for the stored procedure here
	@TableName			VARCHAR(35),
	@TableId			BIGINT,
	@Action				VARCHAR(25),
	@Contributer			BIGINT,
	@Description			VARCHAR(MAX)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT;


			SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Audit_Trail];
					INSERT INTO [dbo].[Audit_Trail]
						(Id,TableName,TableId,[Action],ComputerName,Contributer,DateExecuted,TimeExecuted,
						[Description])
					VALUES
						(@_Id,@TableName,@TableId,@Action,(SELECT HOST_NAME()),
						@Contributer,CONVERT(VARCHAR(10),getDate(),110),(Select RIGHT(CONVERT(VARCHAR, GETDATE(), 100),7)),
						@Description);
			
					-- Return of the Data type
					SELECT 	@_Id					AS 'Id', 
							@TableName				AS 'Table Name',
							@TableId				AS 'TableId',
							@Action					AS 'Action',
							(SELECT HOST_NAME())	AS 'Computer Name',
							@Contributer			AS 'Contributer',
							CONVERT(VARCHAR(10),getDate(),110)			AS 'Date Executed',
							(Select RIGHT(CONVERT(VARCHAR, GETDATE(), 100),7)) AS 'Time Executed',
							@Description			AS 'Description',
							'success'					AS 'return_message'
							
		

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMaster_User_GMailLogin]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****************************************************************************************
Stored Producedure : spAccess_User_login
   Tables Accessed : Access_Users
           Authors : Aldwin, Francisco
      Date Created : June 05, 2018
	  Date Updated : June 27, 2018
		 Version # : 3.0.0

Overview: 
		User account can login with its corresponding status

Revision:
  Purpose											Date and Time			By              Reference
- Initial Creation of the SP						June 05, 2018			Aldwin			none
- Added Set No Count								June 19, 2018-11:59am	Francisco		None
- Reconstructing return and error Trapping			June 19, 2018-11:59am	Francisco		None
  via Try/Catch Statement 
- Check and ready for deployment					June 27, 2018-02:00pm	Francisco		None

Parameters:
	@EmailAddress	VARCHAR(50),
	@GmailID		VARCHAR(100)

Testing:
	EXEC spMaster_User_GMailLogin 'rmfit.ojt.gary@gmail.com','211'
	select * FROM HRIS_Employees
	select * from ACCESS_Users
*****************************************************************************************/
CREATE PROCEDURE [dbo].[spMaster_User_GMailLogin]
	@EmailAddress	VARCHAR(50),
	@GmailID		VARCHAR(100)
AS 

BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_ErrorNumber		INT,   
					@_ErrorSeverity		INT,  
					@_ErrorState		INT,
					@_ErrorProcedure	VARCHAR(150),
					@_ErrorLine			INT,
					@_EmployeeID		INT;
			     		
			-- SET NOCOUNT ON added to prevent extra result sets from
			-- interfering with SELECT statements. https://www.youtube.com/watch?v=53YxArvLhRA
			SET NOCOUNT ON;	

			-- Validation if the data is match and exist	
			IF EXISTS(SELECT [Id] FROM [Masterfile_Employee] 
						WHERE [EmailAddress] = @EmailAddress AND [Status] =  1 AND [GmailID] ='')
				BEGIN
					
				SELECT @_EmployeeID = [Id] FROM [Masterfile_Employee] 
				WHERE [EmailAddress] = @EmailAddress;

				UPDATE [dbo].[Masterfile_Employee]	 
				SET	[GmailID]		=  @GmailID			
				WHERE 
					[Id]	= @_EmployeeID;

					SELECT 
						me.Id	,
						me.BranchId,
						mu.Id,
						[Description],
						mb.[name],
							CONCAT(me.FirstName,
								' ',me.MiddleName,
								' ',me.LastName)	AS 'Employee Name'	,
						GmailID		AS 'GmailID',
						'success'			AS 'return_message'	
					FROM 
						[dbo].[Masterfile_Employee] AS me
							INNER JOIN [dbo].[Masterfile_Branch] AS mb
						ON me.[BranchID]	= mb.Id
							INNER JOIN [dbo].[Masterfile_User] AS mu
						ON me.Id	= mu.EmployeeId
							INNER JOIN [dbo].[Masterfile_Role] AS mr
						ON mu.RoleId	= mr.Id
					WHERE
					 [EmailAddress] = @EmailAddress		
				END




			-- Else Statement if no data found on the query
			ELSE IF EXISTS(SELECT [Id] FROM [Masterfile_Employee] WHERE [EmailAddress] = @EmailAddress
			 AND [Status] =  1 AND [GmailID] <>'' )
				BEGIN
				
					SELECT 
						me.Id	,
						me.BranchId,
						mu.Id,
						[Description],
						mb.[name],
							CONCAT(me.FirstName,
								' ',me.MiddleName,
								' ',me.LastName)	AS 'Employee Name'	,
						GmailID		AS 'GmailID',
						'success'			AS 'return_message'	
					FROM 
						[dbo].[Masterfile_Employee] AS me
							INNER JOIN [dbo].[Masterfile_Branch] AS mb
						ON me.[BranchID]	= mb.Id
							INNER JOIN [dbo].[Masterfile_User] AS mu
						ON me.Id	= mu.EmployeeId
							INNER JOIN [dbo].[Masterfile_Role] AS mr
						ON mu.RoleId	= mr.Id
					WHERE
					 [EmailAddress] = @EmailAddress	
					
				END
			ELSE IF EXISTS(SELECT [Id] FROM [Masterfile_Employee]  WHERE [EmailAddress] = @EmailAddress
			 AND [Status] =  2 )
				BEGIN
					-- Disable User account
					SELECT 'disabled_employee'					AS 'return_message'
				END


		-- No data found in query of username
			ELSE
				BEGIN

						SELECT 'emailaddress_not_found'		AS 'return_message'
				END		

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

		-- Set the variables with its corresponding Data
		SELECT
			@_ErrorNumber		= ERROR_NUMBER(),
			@_ErrorSeverity		= ERROR_SEVERITY(),
			@_ErrorState		= ERROR_STATE(),
			@_ErrorProcedure	= ERROR_STATE(),
			@_ErrorLine			= ERROR_STATE();

		-- Return the generic error type			
		SELECT  
			@_ErrorNumber		AS 'ErrorNumber',  
			@_ErrorSeverity		AS 'ErrorSeverity',  
			@_ErrorState		AS 'ErrorState',
			@_ErrorProcedure	AS 'ErrorProcedure',  
			@_ErrorLine			AS 'ErrorLine',
			ERROR_MESSAGE()		AS 'ErrorMessage',
			'failed'			AS 'return_message';		
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_AccessRights]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****************************************************************************************
Stored Producedure : spAccess_Rights_get
   Tables Accessed : Access_Rights, Access_Permissions, Access_Roles, Access_Modules
           Authors : Francisco, 
      Date Created : July 05, 2018
	  Date Updated : 
		 Version # : 1.0.0

Overview: 
		Get all values if 0, or else get the specific rights via RoleID


Revision:
  Purpose										Date and Time			Author			Reference
- Initial Creation of the SP					July 05, 2018-02:00pm	Francisco		None
- Check and ready for deployment				July 05, 2018-02:00pm	Francisco		None

Parameters:
	@RoleID			INT				-	If the this is indicated, get the data on this specific role only(optional)

Testing:
	EXEC spAccess_Right_get 1
*****************************************************************************************/
CREATE PROCEDURE [dbo].[spMasterfile_AccessRights]
	@RoleID			INT	 = 0
AS 

BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- SET NOCOUNT ON added to prevent extra result sets from
			-- interfering with SELECT statements. https://www.youtube.com/watch?v=53YxArvLhRA
			SET NOCOUNT ON;	

			-- Get all data of the role rights
			IF  (@RoleID = 0 )
				BEGIN					 
					SELECT  ma.Id,
							IsChecked,
							[Module],
							[Page],
							[PageSeqNo],
							[RightsSeqNo],
							mp.FunctionId,
							mf.[Name],
							mf.[Remarks],
							'success'			AS 'return_message'
					FROM 
						[dbo].[Masterfile_AccessRights] AS ma
							INNER JOIN [dbo].[Masterfile_SystemRights] AS ms
						ON  ma.SystemRightsId = ms.id
							INNER JOIN [dbo].[Masterfile_PageAction] AS mp
						ON  mp.SystemRightsId = ms.id AND mp.[Status] = 1
							INNER JOIN [dbo].[Masterfile_Function] AS mf
						ON  mp.FunctionId = mf.id AND mf.[Status] = 1
				END

			-- Get the specific role rights based on given RoleID
			ELSE 
				BEGIN
					SELECT  ma.Id,
							'success'			AS 'return_message'
					FROM 
						[dbo].[Masterfile_AccessRights] AS ma

				END								


				
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

		SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
				ERROR_SEVERITY()	AS 'ErrorSeverity',  
				ERROR_STATE()		AS 'ErrorState',
				ERROR_PROCEDURE()	AS 'ErrorProcedure',  
				ERROR_LINE()		AS 'ErrorLine',
				ERROR_MESSAGE()		AS 'ErrorMessage',
				'failed'			AS 'return_message';
			
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_AccessRights_delete]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
--	EXEC spMasterfile_Area_delete 1,2
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_AccessRights_delete]
	@RoleId					INT,
	@UserId				BIGINT 
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			Update [dbo].[Masterfile_AccessRights] set
			IsChecked = 0
			where
			RoleId = @RoleId;
			
			SELECT 'success'	AS 'return_message';
	
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_AccessRights_get]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_AccessRights_get 'ViewAll',1,5
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_AccessRights_get]
	-- Add the parameters for the stored procedure here
	@RoleId bigint = 0
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active AccessRightss and its details
			SELECT  msr.Id,msr.Module,msr.[Page],msr.PageSeqNo,msr.Rights,msr.RightsSeqNo
			FROM 
				[dbo].[Masterfile_AccessRights] AS mar
				LEFT JOIN [dbo].[Masterfile_SystemRights] AS msr
				ON  mar.SystemRightsId = msr.id
				WHERE mar.RoleId = @RoleId and mar.IsChecked = 1 
				ORDER BY msr.[Module],msr.PageSeqNo,msr.RightsSeqNo ASC;
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION
		
		-- Return the generic error type	  
		SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
				ERROR_SEVERITY()	AS 'ErrorSeverity',  
				ERROR_STATE()		AS 'ErrorState',
				ERROR_PROCEDURE()	AS 'ErrorProcedure',  
				ERROR_LINE()		AS 'ErrorLine',
				ERROR_MESSAGE()		AS 'ErrorMessage',
				'failed'			AS 'return_message';
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_AccessRights_insert]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spMasterfile_AccessRights_insert]
	-- Add the parameters for the stored procedure here
	@RoleId		INT,
	@SystemRightsId	INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT,
					@_CheckCount	INT = 0;

			SELECT @_CheckCount = COUNT(*) FROM [dbo].[Masterfile_AccessRights] WHERE RoleId = @RoleId AND SystemRightsId = @SystemRightsId;
			IF(@_CheckCount = 0)
			BEGIN
				SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Masterfile_AccessRights];

				INSERT INTO [dbo].[Masterfile_AccessRights]
					(Id,RoleId, SystemRightsId, IsChecked)
				VALUES
					(@_Id,@RoleId, @SystemRightsId, 1);
			END
			ELSE
			BEGIN
				UPDATE [dbo].[Masterfile_AccessRights] SET
				IsChecked = 1
				WHERE
				RoleId = @RoleId AND SystemRightsId = @SystemRightsId;
			END
			-- Return of the Data type
			SELECT 	@_Id					AS 'Id', 
					@RoleId				AS 'RoleId',
					@SystemRightsId		AS 'SystemRightsId', 
					'success'			AS 'return_message';		
					
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Area_delete]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
--	EXEC spMasterfile_Area_delete 1,2
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Area_delete]
	@Id					INT,
	@UserId				BIGINT 
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0;

			UPDATE [dbo].[Masterfile_Area]	 
				SET	
					[Status]	= @_Deleted
				WHERE 
					[Id]		= @Id;
	--		Declare 
			-- Return Data of the Update
			
			SELECT 'success'	AS 'return_message';
	

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Area_get]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Area_get 
-- ============================================
CREATE PROCEDURE [dbo].[spMasterfile_Area_get]
	-- Add the parameters for the stored procedure here
	@DisplayType varchar(10)='',
	@AreaId			INT	= 0,
	@PageNumber		INT = 1,
	@RowsPage 		INT = 10
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Regions and its details
			IF (@DisplayType = 'ViewAll')
			BEGIN
				SELECT ma.Id,ma.Name,ma.DistrictId,md.Name AS'District' ,ma.Remarks 
					from Masterfile_Area ma
					left join Masterfile_District md
					on ma.DistrictId = md.Id and md.[Status] = 1 
					where
					ma.[Status] = 1
					ORDER BY ma.Name ASC
				END

		ELSE
				BEGIN
				IF  (@AreaId = 0)
				BEGIN

					WITH TempResult AS(
						SELECT ma.Id,ma.Name,ma.DistrictId,md.Name AS'District' ,ma.Remarks 
					from Masterfile_Area ma
					left join Masterfile_District md
					on ma.DistrictId = md.Id and md.[Status] = 1 
					where
					ma.[Status] = 1
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[Name] ASC
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

				END
			ELSE
				BEGIN
					WITH TempResult AS(
						SELECT ma.Id,ma.Name,ma.DistrictId,md.Name AS'District' ,ma.Remarks  from Masterfile_Area ma
					left join Masterfile_District md
					on ma.DistrictId = md.Id and md.[Status] = 1 
					where
					ma.[Status] = 1 AND ma.Id = @AreaId
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[Name] ASC
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;
				END
			END
		
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION
		
		-- Return the generic error type	  
		SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
				ERROR_SEVERITY()	AS 'ErrorSeverity',  
				ERROR_STATE()		AS 'ErrorState',
				ERROR_PROCEDURE()	AS 'ErrorProcedure',  
				ERROR_LINE()		AS 'ErrorLine',
				ERROR_MESSAGE()		AS 'ErrorMessage',
				'failed'			AS 'return_message';
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Area_insert]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Area_insert 'Poblacion',1,''
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Area_insert]
	-- Add the parameters for the stored procedure here
	@Name				VARCHAR(100),
	@DistrictId			INT,
	@Remarks			VARCHAR(150) ,
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT,
					@_Status			TINYINT  = 1		-- Default as 1 as describe as 'Active'
						

			SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Masterfile_Area];

			IF EXISTS(SELECT Id FROM [dbo].[Masterfile_Area] WHERE Name =  @Name AND [Status] = 1)
				BEGIN  							
					SELECT	'duplicate_areaname'	AS 'return_message';						
				END

			ELSE
				BEGIN
					INSERT INTO [dbo].[Masterfile_Area]
						(Id,Name,DistrictId,Remarks,[Status])
					VALUES
						(@_Id, @Name,@DistrictId,@Remarks, @_Status);
			
					-- Return of the Data type
					SELECT 	@_Id					AS 'Id', 
							@Name					AS 'Name',
							@DistrictId				AS 'DistrictId',
							@Remarks				AS 'Remarks',
							'success'					AS 'return_message';
					
				END

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Area_update]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC  spMasterfile_Area_update 1,'England',2,'',2
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Area_update]
	-- Add the parameters for the stored procedure here
	@Id					INT,
	@Name				VARCHAR(100),
	@DistrictId			INT,
	@Remarks			VARCHAR(150),
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			IF (EXISTS(SELECT Id FROM [dbo].[Masterfile_Area] WHERE [Name] =  @Name AND [Status] = 1 and Id <> @Id))
				BEGIN  							
					SELECT	'duplicate_areaname'	AS 'return_message';						
				END

			ELSE
				BEGIN
				UPDATE [dbo].[Masterfile_Area]	 
					SET	[Name]		= @Name,
						[DistrictId]= @DistrictId,
						[Remarks]	= @Remarks
					WHERE 
						[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT	@Id		AS 'Id',
					@Name	AS 'Name',
					@DistrictId	AS 'DistrictId',
					@Remarks	AS 'Remarks',
					'success'	AS 'return_message';
					
				END

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Branch_BIJLISync]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Branch_update 1,'Kamote',2,'Que',12.123,12.123123,'asdasd'
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Branch_BIJLISync]
	-- Add the parameters for the stored procedure here
	@BranchCode			VARCHAR(4),
	@Name				VARCHAR(100),
	@Address			VARCHAR(150),
	@Latitude			DECIMAL(8,6),
	@Longitude			DECIMAL(9,6),
	@UserId				BIGINT
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			IF EXISTS(SELECT Id FROM [dbo].[Masterfile_Branch] WHERE [BranchCode] =  @BranchCode AND [Status] = 1)
				BEGIN  							
				UPDATE [dbo].[Masterfile_Branch]	 
					SET	
						[Name]			= @Name,
						[Address]		= @Address,
						[Latitude]		= @Latitude,
						[Longitude]		= @Longitude
					WHERE 
						[BranchCode]			= @BranchCode;				
				END

			ELSE
				BEGIN
					EXEC spMasterfile_Branch_insert @BranchCode,@Name,'1',@Latitude,@Longitude,@Address,''
					SELECT  @BranchCode				AS 'Branch Code',
							@Name					AS 'Name',
							@Latitude			AS 'Latitude',
							@Longitude			AS 'Longitude',
							@Address			AS 'Address',
							'success'					AS 'return_message';
				END

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Branch_delete]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Branch_delete 1,1
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Branch_delete]
	@Id					INT,
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0;
			
			UPDATE [dbo].[Masterfile_Branch]	 
				SET	
					[Status]	= @_Deleted
				WHERE 
					[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT 'success'	AS 'return_message';
	
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Branch_get]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,> 
-- EXEC spMasterfile_Branch_get 'ViewAll'
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Branch_get]
	-- Add the parameters for the stored procedure here
	@DisplayType varchar(10)='',
	@BranchId		INT	= 0,
	@PageNumber		INT = 1,
	@RowsPage 		INT = 10
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Branchs and its details
			IF (@DisplayType = 'ViewAll')
			BEGIN
				SELECT 
					mb.Id,mb.BranchCode,mb.[Name],mb.AreaId,ma.[Name] AS 'Area',mb.[Address],
					mb.Latitude,mb.Longitude,mb.Remarks 
					from Masterfile_Branch mb
					left join Masterfile_Area ma 
					on mb.AreaId =ma.Id  and ma.[Status] = 1
					where
					mb.[Status] = 1
					ORDER BY mb.Name ASC
				END

			ELSE
			BEGIN
				IF  (@BranchId = 0)
				BEGIN

					WITH TempResult AS(
						SELECT 
					mb.Id,mb.BranchCode,mb.[Name],mb.AreaId,ma.[Name] AS 'Area',mb.[Address],
					mb.Latitude,mb.Longitude,mb.Remarks 
					from Masterfile_Branch mb
					left join Masterfile_Area ma 
					on mb.AreaId =ma.Id  and ma.[Status] = 1
					where
					mb.[Status] = 1
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.Name ASC
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

				END
				ELSE
				BEGIN
					WITH TempResult AS(
						SELECT 
							 mb.Id,mb.BranchCode,mb.Name,mb.AreaId,ma.Name AS 'Area',mb.[Address],
					mb.Latitude,mb.Longitude,mb.Remarks 
					from Masterfile_Branch mb
					left join Masterfile_Area ma 
					on mb.AreaId =ma.Id  and ma.[Status] = 1
					where
					mb.[Status] = 1 AND mb.Id = @BranchId
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.Name ASC
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;
				END
			END
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION
		
		-- Return the generic error type	  
		SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
				ERROR_SEVERITY()	AS 'ErrorSeverity',  
				ERROR_STATE()		AS 'ErrorState',
				ERROR_PROCEDURE()	AS 'ErrorProcedure',  
				ERROR_LINE()		AS 'ErrorLine',
				ERROR_MESSAGE()		AS 'ErrorMessage',
				'failed'			AS 'return_message';
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Branch_insert]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Branch_insert 'Cebu City 5', 1,12.2121,12.123,'Poblacion,Argao,Cebu','Sample',1
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Branch_insert]
	-- Add the parameters for the stored procedure here
	@Name				VARCHAR(100),
	@AreaId			INT,
	@Latitude		DECIMAL(8,6),
	@Longitude		DECIMAL(9,6),
	@Address		Varchar(150),
	@Remarks			VARCHAR(150) ,
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT,
					@_Status			TINYINT  = 1		-- Default as 1 as describe as 'Active'
					
			SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Masterfile_Branch];

			IF EXISTS(SELECT Id FROM [dbo].[Masterfile_Branch] WHERE Name =  @Name AND [Status] = 1)
				BEGIN  							
					SELECT	'duplicate_branchname'	AS 'return_message';						
				END

			ELSE
				BEGIN
					INSERT INTO [dbo].[Masterfile_Branch]
						(Id,[Name],AreaId,Latitude,Longitude,[Address],Remarks,[Status])
					VALUES
						(@_Id, @Name,@AreaId,@Latitude,@Longitude,@Address,@Remarks, @_Status);
			
					-- Return of the Data type
					SELECT 	@_Id					AS 'Id', 
	
							@Name				AS 'Name',
							@AreaId				AS 'AreaId',
							@Latitude			AS 'Latitude',
							@Longitude			AS 'Longitude',
							@Address			AS 'Address',
							@Remarks				AS 'Remarks',
							'success'					AS 'return_message';	
							
				END

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Branch_update]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Branch_update 1,'Kamote',2,'Que',12.123,12.123123,'asdasd',2
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Branch_update]
	-- Add the parameters for the stored procedure here
	@Id					INT,
	@Name				VARCHAR(100),
	@AreaId				INT,
	@Address			VARCHAR(150),
	@Latitude			DECIMAL(8,6),
	@Longitude			DECIMAL(9,6),
	@Remarks			VARCHAR(150),
	@UserId				BIGINT
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			IF (EXISTS(SELECT Id FROM [dbo].[Masterfile_Branch] WHERE [Name] =  @Name AND [Status] = 1 and Id <> @Id))
				BEGIN  							
					SELECT	'duplicate_branchname'	AS 'return_message';						
				END

			ELSE
				BEGIN
				UPDATE [dbo].[Masterfile_Branch]	 
					SET	
						[Name]			= @Name,
						[AreaId]		= @AreaId,
						[Address]		= @Address,
						[Latitude]		= @Latitude,
						[Longitude]		= @Longitude,
						[Remarks]		= @Remarks
					WHERE 
						[Id]			= @Id;
			
			-- Return Data of the Update
			SELECT	@Id		AS 'Id',
					@Name	AS 'Name',
					@AreaId	AS	'AreaId',
					@Address	AS 'Address'	,
					@Latitude	AS 'Latitude',
					@Longitude	AS 'Longitude',
					@Remarks	AS 'Remarks',
					'success'	AS 'return_message';
				
				END

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Category_delete]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Category_delete 1,2
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Category_delete]
	@Id					INT,
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0;
			
			UPDATE [dbo].[Masterfile_Category]	 
				SET	
					[Status]	= @_Deleted
				WHERE 
					[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT 'success'	AS 'return_message';
			

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Category_get]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Category_get 'ViewAll'
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Category_get]
	-- Add the parameters for the stored procedure here
	@DisplayType varchar(10)='',
	@CategoryId		INT	= 0,
	@CategoryDetail VARCHAR(10) = '',
	@PageNumber		INT = 1,
	@RowsPage 		INT = 10
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Categorys and its details
				IF (@DisplayType = 'ViewAll')
					BEGIN
						IF(@CategoryId = 0 AND @CategoryDetail IN ('inflow','outflow'))
						BEGIN
						SELECT Id,[Description],[Type],Remarks from Masterfile_Category
						WHERE
						[Status] = 1 AND
						[Type] = @CategoryDetail
						ORDER BY [Type] ,[Description] ASC
						END
						ELSE IF(@CategoryId <> 0 AND @CategoryDetail='')
						BEGIN
						SELECT Id,[Description],[Type],Remarks from Masterfile_Category
						WHERE
						[Status] = 1 AND
						Id = @CategoryId
						END
						ELSE
						BEGIN
						SELECT Id,[Description],[Type],Remarks from Masterfile_Category
						WHERE
						[Status] = 1
						ORDER BY [Type] ,[Description] ASC
						END
						
					
					END

			
			ELSE
			BEGIN
					IF(@CategoryId = 0 AND @CategoryDetail IN ('inflow','outflow'))
					BEGIN
						
					WITH TempResult AS(
						SELECT Id,[Description],[Type],Remarks from Masterfile_Category
					WHERE
					[Status] = 1 AND
					[Type] = @CategoryDetail
						), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[Type] ASC, TempResult.[Description] ASC
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

				END
				ELSE IF(@CategoryId <> 0 AND @CategoryDetail='')
						BEGIN
						WITH TempResult AS(
						SELECT Id,[Description],[Type],Remarks from Masterfile_Category
					where
					[Status] = 1 AND Id = @CategoryId
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[Type] ASC, TempResult.[Description] ASC
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;
						END
				ELSE
				BEGIN
					WITH TempResult AS(
						SELECT Id,[Description],[Type],Remarks from Masterfile_Category
					where
					[Status] = 1 
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[Type] ASC, TempResult.[Description] ASC
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;
				END
			END

			
		COMMIT TRANSACTION
	END TRY


	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION
		
		-- Return the generic error type	  
		SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
				ERROR_SEVERITY()	AS 'ErrorSeverity',  
				ERROR_STATE()		AS 'ErrorState',
				ERROR_PROCEDURE()	AS 'ErrorProcedure',  
				ERROR_LINE()		AS 'ErrorLine',
				ERROR_MESSAGE()		AS 'ErrorMessage',
				'failed'			AS 'return_message';
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Category_insert]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Description>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Category_insert]
	-- Add the parameters for the stored procedure here
	@Description				VARCHAR(100),
	@Type				VARCHAR(10),
	@Remarks			VARCHAR(150) ,
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT,
					@_Status			TINYINT  = 1		-- Default as 1 as describe as 'Active'
						

			SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Masterfile_Category];

			IF EXISTS(SELECT Id FROM [dbo].[Masterfile_Category] WHERE Description =  @Description AND [Status] = 1)
				BEGIN  							
					SELECT	'duplicate_description'	AS 'return_message';						
				END

			ELSE
				BEGIN
					INSERT INTO [dbo].[Masterfile_Category]
						(Id,[Description],[Type],Remarks,[Status])
					VALUES
						(@_Id, @Description,@Type,@Remarks, @_Status);
				END

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Category_update]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Description>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Category_update]
	-- Add the parameters for the stored procedure here
	@Id					INT,
	@Description		VARCHAR(100),
	@Type				VARCHAR(10),	
	@Remarks			VARCHAR(150),
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			IF (EXISTS(SELECT Id FROM [dbo].[Masterfile_Category] WHERE [Description] =  @Description AND [Status] = 1 and Id <> @Id))
				BEGIN  							
					SELECT	'duplicate_description'	AS 'return_message';						
				END

			ELSE
				BEGIN
				UPDATE [dbo].[Masterfile_Category]	 
					SET	[Description]	= @Description,
						[Type]			= @Type,
						[Remarks]		= @Remarks
					WHERE 
						[Id]			= @Id;
			
			-- Return Data of the Update
			SELECT	@Id AS 'Id',
					@Description	AS 'Description',
					@Type	AS 'Type',
					@Remarks	AS 'Remarks',
					'success'	AS 'return_message';
					
				END

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Channel_delete]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Channel_delete 1,2
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Channel_delete]
	@Id					INT,
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0
			UPDATE [dbo].[Masterfile_Channel]	 
				SET	
					[Status]	= @_Deleted
				WHERE 
					[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT 'success'	AS 'return_message';
	

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Channel_get]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Channel_get 'ViewAll'
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Channel_get]
	-- Add the parameters for the stored procedure here
	@DisplayType varchar(10)='',
	@ChannelId		INT	= 0,
	@PageNumber		INT = 1,
	@RowsPage 		INT = 10
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Channels and its details
			IF(@DisplayType = 'ViewAll')
			BEGIN
			SELECT mcc.Id,mcc.[Description],mcc.BranchId,mb.Name AS 'Branch',mcc.ChartOfAccountId,mc.[Description] AS 'Chart Of Account',mcc.Remarks
					from Masterfile_Channel mcc
					LEFT JOIN Masterfile_Branch mb
					ON mcc.BranchId = mb.Id AND mb.[Status] = 1
					LEFT JOIN Masterfile_ChartOfAccount mc
					ON mcc.ChartOfAccountId = mc.Id
					where
					mcc.[Status] = 1
					ORDER BY mcc.[Description]
					
			END
			ELSE 
			BEGIN
			IF  (@ChannelId = 0)
				BEGIN
					WITH TempResult AS(
					SELECT mcc.Id,mcc.[Description],mcc.BranchId,mb.Name AS 'Branch',mcc.ChartOfAccountId,mc.[Description] AS 'Chart Of Account',mcc.Remarks
					from Masterfile_Channel mcc
					LEFT JOIN Masterfile_Branch mb
					ON mcc.BranchId = mb.Id AND mb.[Status] = 1
					LEFT JOIN Masterfile_ChartOfAccount mc
					ON mcc.ChartOfAccountId = mc.Id
					where
					mcc.[Status] = 1
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult. [Description] ASC
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

				END
			ELSE
				BEGIN

					WITH TempResult AS(
					SELECT mcc.Id,mcc.[Description],mcc.BranchId,mb.Name AS 'Branch',mcc.ChartOfAccountId,mc.[Description] AS 'Chart Of Account',mcc.Remarks
					from Masterfile_Channel mcc
					LEFT JOIN Masterfile_Branch mb
					ON mcc.BranchId = mb.Id AND mb.[Status] = 1
					LEFT JOIN Masterfile_ChartOfAccount mc
					ON mcc.ChartOfAccountId = mc.Id
					where
					mcc.[Status] = 1
						 AND mcc.Id = @ChannelId
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[Description] ASC
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;
				END
			END
			

		COMMIT TRANSACTION
	END TRY


	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION
		
		-- Return the generic error type	  
		SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
				ERROR_SEVERITY()	AS 'ErrorSeverity',  
				ERROR_STATE()		AS 'ErrorState',
				ERROR_PROCEDURE()	AS 'ErrorProcedure',  
				ERROR_LINE()		AS 'ErrorLine',
				ERROR_MESSAGE()		AS 'ErrorMessage',
				'failed'			AS 'return_message';
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Channel_insert]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Description>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Channel_insert]
	-- Add the parameters for the stored procedure here
	@Description				VARCHAR(100),
	@Remarks			VARCHAR(150) ,
	@UserId				BIGINT,
	@BranchId			INT,
	@ChartOfAccountId	INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT,
					@_Status			TINYINT  = 1		-- Default as 1 as describe as 'Active'
					
			SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Masterfile_Channel];

			IF EXISTS(SELECT Id FROM [dbo].[Masterfile_Channel] WHERE Description =  @Description AND [Status] = 1)
				BEGIN  							
					SELECT	'duplicate_description'	AS 'return_message';						
				END

			ELSE
				BEGIN
					INSERT INTO [dbo].[Masterfile_Channel]
						(Id,[Description],Remarks,[Status],BranchId,ChartOfAccountId)
					VALUES
						(@_Id, @Description,@Remarks, @_Status,@BranchId,@ChartOfAccountId);
			
					-- Return of the Data type
					SELECT 	@_Id					AS 'Id', 
							@Description					AS 'Description',
							@BranchId				AS 'BranchId',
							@ChartOfAccountId		AS 'ChartOfAccountId',
							@Remarks				AS 'Remarks',
							'success'					AS 'return_message';		
					
				END

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Channel_update]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Description>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Channel_update]
	-- Add the parameters for the stored procedure here
	@Id					INT,
	@Description		VARCHAR(100),	
	@Remarks			VARCHAR(150),
	@UserId				BIGINT,
	@BranchId			INT,
	@ChartOfAccountId	INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			IF (EXISTS(SELECT Id FROM [dbo].[Masterfile_Channel] WHERE [Description] =  @Description AND [Status] = 1 and Id <> @Id))
				BEGIN  							
					SELECT	'duplicate_description'	AS 'return_message';						
				END

			ELSE
				BEGIN
				UPDATE [dbo].[Masterfile_Channel]	 
					SET	[Description]	= @Description,
						[BranchId]		= @BranchId,
						[ChartOfAccountId] = @ChartOfAccountId,
						[Remarks]		= @Remarks
					WHERE 
						[Id]			= @Id;
			
			-- Return Data of the Update
			SELECT	@Id AS 'Id',
					@Description	AS 'Description',
					@BranchId		AS 'BranchId',
					@ChartOfAccountId	AS 'ChartOfAccountId',
					@Remarks	AS 'Remarks',
					'success'	AS 'return_message';
				END
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_ChartOfAccount_BIJLISync]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_ChartOfAccount_BIJLISync]
	-- Add the parameters for the stored procedure here
	@Code				VARCHAR(10),
	@Description		VARCHAR(100),
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
				DECLARE	@_Id				INT;

			SELECT @_Id =Id FROM [dbo].[Masterfile_ChartOfAccount] WHERE Code = @Code ;
			IF EXISTS(SELECT Id FROM [dbo].[Masterfile_ChartOfAccount] WHERE Id = @_Id)
				BEGIN  							
				UPDATE [dbo].[Masterfile_ChartOfAccount]	 
					SET	[Code]	= @Code,
						[Description]	= @Description
		
					
					WHERE 
						Id			= @_Id;		
				END

			ELSE
				BEGIN
					EXEC spMasterfile_ChartOfAccount_insert	@Code,@Description,'';
				END
				

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_ChartOfAccount_delete]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_ChartOfAccount_delete 1,2
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_ChartOfAccount_delete]
	@Id					INT,
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0
			UPDATE [dbo].[Masterfile_ChartOfAccount]	 
				SET	
					[Status]	= @_Deleted
				WHERE 
					[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT 'success'	AS 'return_message';
	
	
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_ChartOfAccount_get]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_ChartOfAccount_get
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_ChartOfAccount_get]
	-- Add the parameters for the stored procedure here
	@DisplayType varchar(10)='',
	@ChartOfAccountId		INT	= 0,
	@PageNumber		INT = 1,
	@RowsPage 		INT = 10
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active ChartOfAccounts and its details
			IF (@DisplayType = 'ViewAll')
					BEGIN
					SELECT Id,Code,[Description],Remarks from Masterfile_ChartOfAccount
					where 
					[Status] = 1 
					ORDER BY [Description] ASC
					END

			ELSE
				BEGIN
				IF  (@ChartOfAccountId = 0)
				BEGIN

					WITH TempResult AS(
					SELECT Id,Code,[Description],Remarks from Masterfile_ChartOfAccount
					where 
					[Status] = 1 
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[Description] ASC
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

				END
				ELSE
				BEGIN
					WITH TempResult AS(
					SELECT Id,Code,[Description],Remarks from Masterfile_ChartOfAccount
					where 
					[Status] = 1 AND Id = @ChartOfAccountId
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[Description] ASC
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;
				END
			END
			
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION
		
		-- Return the generic error type	  
		SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
				ERROR_SEVERITY()	AS 'ErrorSeverity',  
				ERROR_STATE()		AS 'ErrorState',
				ERROR_PROCEDURE()	AS 'ErrorProcedure',  
				ERROR_LINE()		AS 'ErrorLine',
				ERROR_MESSAGE()		AS 'ErrorMessage',
				'failed'			AS 'return_message';
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_ChartOfAccount_insert]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Description>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_ChartOfAccount_insert]
	-- Add the parameters for the stored procedure here\
	@Code					VARCHAR(10),
	@Description				VARCHAR(100),
	@Remarks			VARCHAR(150),
	@UserId				BIGINT 
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT,
					@_Status			TINYINT  = 1	-- Default as 1 as describe as 'Active'
						

			SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Masterfile_ChartOfAccount];

			IF EXISTS(SELECT Id FROM [dbo].[Masterfile_ChartOfAccount] WHERE [Description] =  @Description AND [Status] = 1)
				BEGIN  							
					SELECT	'duplicate_description'	AS 'return_message';						
				END

			ELSE
				BEGIN
					INSERT INTO [dbo].[Masterfile_ChartOfAccount]
						(Id,Code,[Description],Remarks,[Status])
					VALUES
						(@_Id, @Code,@Description,@Remarks, @_Status);
			
					-- Return of the Data type
					SELECT 	@_Id					AS 'Id',
							@Code					AS 'Code', 
							@Description			AS 'Description',
							@Remarks				AS 'Remarks',
							'success'				AS 'return_message';		
					
				END

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_ChartOfAccount_update]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_ChartOfAccount_update]
	-- Add the parameters for the stored procedure here
	@Id					INT,
	@Code				VARCHAR(10),
	@Description		VARCHAR(100),
	@Remarks			VARCHAR(150),
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			IF (EXISTS(SELECT Id FROM [dbo].[Masterfile_ChartOfAccount] WHERE [Code] =  @Code AND [Status] = 1 and Id <> @Id))
				BEGIN  							
					SELECT	'duplicate_chartofaccount'	AS 'return_message';						
				END

			ELSE
				BEGIN
				UPDATE [dbo].[Masterfile_ChartOfAccount]	 
					SET	[Code]		= @Code,
						[Description]	= @Description,
						[Remarks]	= @Remarks
					WHERE 
						[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT	@Id		AS 'Id',
					@Code	AS 'Code',
					@Description AS 'Description',
					@Remarks	AS 'Remarks',
					'success'	AS 'return_message';
				
				END

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_District_delete]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_District_delete 1,2
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_District_delete]
	@Id					INT,
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0
			UPDATE [dbo].[Masterfile_District]	 
				SET	
					[Status]	= @_Deleted
				WHERE 
					[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT 'success'	AS 'return_message';
	

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_District_get]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_District_get
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_District_get]
	-- Add the parameters for the stored procedure here
	@DisplayType VARCHAR(10) = '',
	@DistrictId		INT	= 0,
	@PageNumber		INT = 1,
	@RowsPage 		INT = 10
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Districts and its details
			IF (@DisplayType = 'ViewAll')
			BEGIN
				SELECT md.Id,md.Name,md.RegionId,mr.Name AS 'Region',md.Remarks from Masterfile_District md
						left join Masterfile_Region mr 
						on md.RegionId =mr.Id and mr.[Status] = 1
						where
						md.[Status] = 1
					ORDER BY md.Name ASC
			END
			
			ELSE
				BEGIN
				IF  (@DistrictId = 0)
				BEGIN
					WITH TempResult AS(
					SELECT md.Id,md.Name,md.RegionId,mr.Name AS 'Region',md.Remarks from Masterfile_District md
						left join Masterfile_Region mr 
						on md.RegionId =mr.Id and mr.[Status] = 1
						where
						md.[Status] = 1
					
						), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.Name ASC
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

				END
				ELSE
				BEGIN
					WITH TempResult AS(
						SELECT md.Id,md.Name,md.RegionId,mr.Name  AS 'Region',md.Remarks from Masterfile_District md
						left join Masterfile_Region mr 
						on md.RegionId =mr.Id and mr.[Status] = 1
						where
						md.[Status] = 1 AND md.Id = @DistrictId
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.Name ASC
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;
				END
			END
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION
		
		-- Return the generic error type	  
		SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
				ERROR_SEVERITY()	AS 'ErrorSeverity',  
				ERROR_STATE()		AS 'ErrorState',
				ERROR_PROCEDURE()	AS 'ErrorProcedure',  
				ERROR_LINE()		AS 'ErrorLine',
				ERROR_MESSAGE()		AS 'ErrorMessage',
				'failed'			AS 'return_message';
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_District_insert]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
--EXEC spMasterfile_District_insert 'Iligan',1,'Kamote'
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_District_insert]
	-- Add the parameters for the stored procedure here
	@Name				VARCHAR(100),
	@RegionId			INT,
	@Remarks			VARCHAR(150) ,
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT,
					@_Status			TINYINT  = 1	-- Default as 1 as describe as 'Active'
					
			SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Masterfile_District];

			IF EXISTS(SELECT Id FROM [dbo].[Masterfile_District] WHERE Name =  @Name AND [Status] = 1)
				BEGIN  							
					SELECT	'duplicate_name'	AS 'return_message';						
				END

			ELSE
				BEGIN
					INSERT INTO [dbo].[Masterfile_District]
						(Id,Name,RegionId,Remarks,[Status])
					VALUES
						(@_Id, @Name,@RegionId,@Remarks, @_Status);
			
					-- Return of the Data type
					SELECT 	@_Id					AS 'Id', 
							@Name					AS 'Name',
							@RegionId				AS 'RegionId',
							@Remarks				AS 'Remarks',
							'success'					AS 'return_message';		
					
				END

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_District_update]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
--EXEC spMasterfile_District_update 1,'Cebu',1,'WeeHaa'
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_District_update]
	-- Add the parameters for the stored procedure here
	@Id					INT,
	@Name				VARCHAR(100),
	@RegionId			INT,
	@Remarks			VARCHAR(150),
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			IF (EXISTS(SELECT Id FROM [dbo].[Masterfile_District] WHERE [Name] =  @Name AND [Status] = 1 and Id <> @Id))
				BEGIN  							
					SELECT	'duplicate_districtname'	AS 'return_message';						
				END

			ELSE
				BEGIN
				UPDATE [dbo].[Masterfile_District]	 
					SET	[Name]		= @Name,
						[RegionId]	= @RegionId,
						[Remarks]	= @Remarks
					WHERE 
						[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT	@Id	AS 'Id',
					@Name	AS 'Name',
					@RegionId	AS 'RegionId',
					@Remarks	AS 'Remarks',
					'success'	AS 'return_message';
				END

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Employee_BIJLISync]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
--EXEC [spMasterfile_Employee_BIJLISync] 60606,'MONETTE','SOLIANO',	'MASPARA',	2,'monette.maspara@rafi.org.ph',1,1
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Employee_BIJLISync]
	-- Add the parameters for the stored procedure here
	@EmployeeIdNo		VARCHAR(10),
	@Firstname			VARCHAR(50),
	@Middlename			VARCHAR(50),
	@Lastname			VARCHAR(50),
	@PositionId			INT,
	@EmailAddress		VARCHAR(150),
	@ContactNumber		VARCHAR(15),
	@BranchId			INT,
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE	@_Id				BIGINT;

			SELECT @_Id =Id FROM [dbo].[Masterfile_Employee] WHERE EmployeeIdNo = @EmployeeIdNo ;


			IF EXISTS(SELECT Id FROM [dbo].[Masterfile_Employee] WHERE Id = @_Id)
				BEGIN  							
				UPDATE [dbo].[Masterfile_Employee]	 
					SET	[EmployeeIdNo]	= @EmployeeIdNo,
						[Firstname]	= @Firstname,
						[Middlename]	= @Middlename,
						[Lastname]		= @Lastname,
						[PositionId]	= @PositionId,
						[EmailAddress] = @EmailAddress,
						[ContactNumber] = @ContactNumber,
						[BranchId]		= @BranchId
					
					WHERE 
						[EmployeeIdNo]			= @EmployeeIdNo;		
				END

			ELSE
				BEGIN
					EXEC spMasterfile_Employee_insert	@EmployeeIdNo,@Firstname,@Middlename,
						@Lastname,@PositionId,@EmailAddress,@ContactNumber,@BranchId,'';
				END

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Employee_delete]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Employee_delete 1,2
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Employee_delete]
	@Id					INT,
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0
			UPDATE [dbo].[Masterfile_Employee]	 
				SET	
					[Status]	= @_Deleted
				WHERE 
					[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT 'success'	AS 'return_message';
	

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Employee_get]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Employee_get
-- SELECT * FROM  Masterfile_Employee

-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Employee_get]
	-- Add the parameters for the stored procedure here
	@DisplayType varchar(10)='',
	@EmployeeId		INT	= 0,
	@PageNumber		INT = 1,
	@RowsPage 		INT = 10
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Employees and its details
			IF (@DisplayType = 'ViewAll')
			BEGIN
				SELECT me.Id,me.EmployeeIdNo as [Employee Id No.],me.Firstname,me.Middlename,
					me.Lastname,me.EmailAddress,
					me.ContactNumber,me.BranchId,mb.Name AS Branch,me.Remarks
					from Masterfile_Employee me
					inner join Masterfile_Branch mb
					on me.BranchId =mb.Id  AND mb.[Status] = 1
					where
					me.[Status] = 1
					ORDER BY mb.Name ASC
			END

			ELSE
				BEGIN
				IF  (@EmployeeId = 0)
				BEGIN

					WITH TempResult AS(
					SELECT me.Id,me.EmployeeIdNo as [Employee Id No.],me.Firstname,me.Middlename,
					me.Lastname,me.EmailAddress,
					me.ContactNumber,me.BranchId,mb.Name AS Branch,me.Remarks
					from Masterfile_Employee me
					inner join Masterfile_Branch mb
					on me.BranchId =mb.Id  AND mb.[Status] = 1
					where
					me.[Status] = 1
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.Branch ASC
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

				END
			
				ELSE
				BEGIN
					WITH TempResult AS(
					SELECT me.Id,me.EmployeeIdNo as [Employee Id No.],me.Firstname,me.Middlename,
					me.Lastname,me.EmailAddress,
					me.ContactNumber,me.BranchId,mb.Name AS Branch,me.Remarks
					from Masterfile_Employee me
					left join Masterfile_Branch mb
					on me.BranchId =mb.Id AND mb.[Status] = 1
					where
					me.[Status] = 1	AND me.Id= @EmployeeId 
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[Branch] ASC
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

				END
			END

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION
		
		-- Return the generic error type	  
		SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
				ERROR_SEVERITY()	AS 'ErrorSeverity',  
				ERROR_STATE()		AS 'ErrorState',
				ERROR_PROCEDURE()	AS 'ErrorProcedure',  
				ERROR_LINE()		AS 'ErrorLine',
				ERROR_MESSAGE()		AS 'ErrorMessage',
				'failed'			AS 'return_message';
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Employee_getForNotifications]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Area_get
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Employee_getForNotifications]
	-- Add the parameters for the stored procedure here
	@BranchId			INT	

	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Regions and its details
					SELECT me.Id,me.EmployeeIdNo, EmailAddress, ContactNumber
					from Masterfile_Employee me
					
					WHERE BranchId = @BranchId
		
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION
		
		-- Return the generic error type	  
		SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
				ERROR_SEVERITY()	AS 'ErrorSeverity',  
				ERROR_STATE()		AS 'ErrorState',
				ERROR_PROCEDURE()	AS 'ErrorProcedure',  
				ERROR_LINE()		AS 'ErrorLine',
				ERROR_MESSAGE()		AS 'ErrorMessage',
				'failed'			AS 'return_message';
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Employee_insert]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Employee_insert "12111","Sophies","aDASD","aDASD",1,"aDASD@gmail.com","0922828",1,"Remarks",2
--=============================
CREATE PROCEDURE [dbo].[spMasterfile_Employee_insert]
	-- Add the parameters for the stored procedure here
	@EmployeeIdNo		VARCHAR(10),
	@Firstname			VARCHAR(50),
	@Middlename			VARCHAR(50),
	@Lastname			VARCHAR(50),
	@EmailAddress		VARCHAR(150),
	@ContactNumber		VARCHAR(15),
	@BranchId			INT,
	@Remarks			VARCHAR(150),
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT,
					@_Status			TINYINT  = 1		-- Default as 1 as describe as 'Active'
						

			SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Masterfile_Employee];

			IF (EXISTS(SELECT Id FROM [dbo].[Masterfile_Employee] WHERE [EmployeeIdNo] =  @EmployeeIdNo AND [Status] = 1 ))
				BEGIN  							
					SELECT	'duplicate_employeeid'	AS 'return_message';						
				END

			ELSE
				BEGIN
			
					INSERT INTO [dbo].[Masterfile_Employee]
						(Id,[EmployeeIdNo],[Firstname],[Middlename],[Lastname]
						,EmailAddress,ContactNumber,BranchId
						,Remarks,[Status])
					VALUES
						(@_Id, @EmployeeIdNo,@Firstname,@Middlename,@Lastname
						,@EmailAddress,@ContactNumber,@BranchId,@Remarks, @_Status
					);
			
					-- Return of the Data type
					SELECT 	@_Id					AS 'Id', 
							@EmployeeIdNo			AS 'EmployeeIdNo',
							@Firstname				AS 'Firstname',
							@Middlename				AS 'Middlename',
							@Lastname				AS 'Lastname',
							@EmailAddress			AS 'Email Address',
							@ContactNumber			AS 'Contact Number',
							@BranchId				AS 'BranchId',
							
							@Remarks				AS 'Remarks',
							'success'					AS 'return_message';		
					
	
				END



		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Employee_update]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,@EmployeeIdNo>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Employee_update 1,'1','asdasd','asdasd','asdasd',1,'asdasd','1','1',1,'asdasd'
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Employee_update]
	-- Add the parameters for the stored procedure here
	@Id					INT,
	@EmployeeIdNo		VARCHAR(10),
	@Firstname			VARCHAR(50),
	@Middlename			VARCHAR(50),
	@Lastname			VARCHAR(50),
	@EmailAddress		VARCHAR(150),
	@ContactNumber		VARCHAR(15),
	@BranchId			INT,
	@Remarks			VARCHAR(150),
	@UserId				BIGINT
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		IF (EXISTS(SELECT Id FROM [dbo].[Masterfile_Employee] WHERE [EmployeeIdNo] =  @EmployeeIdNo AND [Status] = 1 and Id <> @Id))
				BEGIN  							
					SELECT	'duplicate_employeeidno'	AS 'return_message';						
				END

			ELSE
				BEGIN
				UPDATE [dbo].[Masterfile_Employee]	 
					SET	[EmployeeIdNo]	= @EmployeeIdNo,
						[Firstname]	= @Firstname,
						[Middlename]	= @Middlename,
						[Lastname]		= @Lastname,
						[EmailAddress] = @EmailAddress,
						[ContactNumber] = @ContactNumber,
						[BranchId]		= @BranchId,
						[Remarks]		= @Remarks
					
					WHERE 
						[Id]			= @Id;
			
			-- Return Data of the Update
			SELECT	@Id		AS 'Id',
					@EmployeeIdNo	AS 'EmployeeIdNo',
					@Firstname		AS 'First Name',
					@Middlename	AS 'Middle Name',
					@Lastname	AS 'Last Name',
					@EmailAddress	AS 'Email Address',
					@ContactNumber	AS 'Contact Number',
					@BranchId	AS 'BranchId',
					@Remarks	AS 'Remarks',
					'success'	AS 'return_message';
					
				END

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherDisbursementDetail_delete]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_OtherDisbursementDetail_delete 1,2
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_OtherDisbursementDetail_delete]
	@Id					INT,
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0
			UPDATE [dbo].[Masterfile_OtherDisbursementDetail]	 
				SET	
					[Status]	= @_Deleted
				WHERE 
					[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT 'success'	AS 'return_message';
	

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherDisbursementDetail_get]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_OtherDisbursementDetail_get 'ViewAll'
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_OtherDisbursementDetail_get]
	-- Add the parameters for the stored procedure here
	@DisplayType VARCHAR(10)='',
	@OtherDisbursementDetailId		INT	= 0,
	@PageNumber		INT = 1,
	@RowsPage 		INT = 10
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active OtherDisbursementDetails and its details
			IF (@DisplayType = 'ViewAll')
			BEGIN
					SELECT mo.[Id],mo.[Description],mo.CategoryId,mc.[Description] AS 'Category', 
					mo.BranchId,mb.Name AS  'Branch',mo.SetUpAmount AS 'Setup Amount',mo.[Day],mo.ChannelId,mcc.[Description] AS 'Channel',
					mo.ChartOfAccountId,mca.[Description] AS 'Chart Of Accounts',
					mo.Remarks					 
					from Masterfile_OtherDisbursementDetail mo
					left join Masterfile_Category mc 
					on mo.CategoryId =mc.Id  AND mc.[Status] = 1
					left join Masterfile_Branch mb
					on mo.BranchId  = mb.Id AND mb.[Status] = 1
					left join Masterfile_Channel mcc
					on mo.ChannelId = mcc.Id AND mcc.[Status] = 1
					left join Masterfile_ChartOfAccount mca
					on mo.ChartOfAccountId = mca.Id  AND mca.[Status] = 1 
					where
					mo.[Status] = 1
					ORDER BY mb.Name ASC
			END
			ELSE
				BEGIN
				IF  (@OtherDisbursementDetailId = 0)
				BEGIN

					WITH TempResult AS(
					SELECT mo.[Id],mo.[Description],mo.CategoryId,mc.[Description] AS 'Category', 
					mo.BranchId,mb.Name AS  'Branch',mo.SetUpAmount AS 'Setup Amount',mo.[Day],mo.ChannelId,mcc.[Description] AS 'Channel',
					mo.ChartOfAccountId,mca.[Description] AS 'Chart Of Accounts',
					mo.Remarks					 
					from Masterfile_OtherDisbursementDetail mo
					left join Masterfile_Category mc 
					on mo.CategoryId =mc.Id  AND mc.[Status] = 1
					left join Masterfile_Branch mb
					on mo.BranchId  = mb.Id AND mb.[Status] = 1
					left join Masterfile_Channel mcc
					on mo.ChannelId = mcc.Id AND mcc.[Status] = 1
					left join Masterfile_ChartOfAccount mca
					on mo.ChartOfAccountId = mca.Id  AND mca.[Status] = 1 
					where
					mo.[Status] = 1
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.Branch ASC
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

				END
				ELSE
				BEGIN		
					WITH TempResult AS(
					SELECT mo.[Id],mo.[Description],mo.CategoryId,mc.[Description] AS 'Category', 
					mo.BranchId,mb.Name AS  'Branch',mo.SetUpAmount AS 'Setup Amount',mo.[Day],mo.ChannelId,mcc.[Description] AS 'Channel',
					mo.ChartOfAccountId,mca.[Description] AS 'Chart Of Accounts',
					mo.Remarks					 
					from Masterfile_OtherDisbursementDetail mo
					left join Masterfile_Category mc 
					on mo.CategoryId =mc.Id AND mc.[Status] = 1
					left join Masterfile_Branch mb
					on mo.BranchId  = mb.Id and mb.[Status] = 1
					left join Masterfile_Channel mcc
					on mo.ChannelId = mcc.Id and mcc.[Status] = 1
					left join Masterfile_ChartOfAccount mca
					on mo.ChartOfAccountId = mca.Id and mca.[Status] = 1
					where
					mo.[Status] = 1 AND mo.Id= @OtherDisbursementDetailId 
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.Branch ASC
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

				END
			END
		


		
		COMMIT TRANSACTION
	END TRY


	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION
		
		-- Return the generic error type	  
		SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
				ERROR_SEVERITY()	AS 'ErrorSeverity',  
				ERROR_STATE()		AS 'ErrorState',
				ERROR_PROCEDURE()	AS 'ErrorProcedure',  
				ERROR_LINE()		AS 'ErrorLine',
				ERROR_MESSAGE()		AS 'ErrorMessage',
				'failed'			AS 'return_message';
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherDisbursementDetail_insert]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Description>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC	spMasterfile_OtherDisbursementDetail_insert 'Loan',1,1,1500.00,1,1,5,''
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_OtherDisbursementDetail_insert]
	-- Add the parameters for the stored procedure here
	@Description		VARCHAR(100),
	@CategoryId			INT,
	@CategoryType		VARCHAR(10),
	@BranchId			INT,
	@SetUpAmount		DECIMAL(10,2),
	@ChartOfAccountId	INT,
	@ChannelId			INT,
	@Day				INT,
	@Remarks			VARCHAR(150) ,
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT,
					@_Status			TINYINT  = 1;		-- Default as 1 as describe as 'Active'


			SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Masterfile_OtherDisbursementDetail];
			IF EXISTS(SELECT Id FROM [dbo].[Masterfile_OtherDisbursementDetail] WHERE [Description] =  @Description AND [Status] = 1)
				BEGIN  							
					SELECT	'duplicate_description'	AS 'return_message';						
				END


			ELSE
				BEGIN
					INSERT INTO [dbo].[Masterfile_OtherDisbursementDetail]
						(Id,[Description],[CategoryId],[CategoryType],[BranchId],[SetUpAmount],[ChartOfAccountId]
						,Remarks,[Status],ChannelId,[Day])
					VALUES
						(@_Id, @Description,@CategoryId,@CategoryType,@BranchId,@SetUpAmount,@ChartOfAccountId,@Remarks, @_Status,@ChannelId,@Day);
			
					-- Return of the Data type
					SELECT 	@_Id					AS 'Id', 
							@Description			AS 'Description',
							@CategoryId				AS 'CategoryId',
							@CategoryType			AS 'Category Type',
							@BranchId				AS 'BranchId',
							@ChannelId				AS 'ChannelId',
							@Day					AS 'Day',
							@SetUpAmount			AS 'SetUpAmount',
							@ChartOfAccountId		AS 'ChartOfAccountId',
							@Remarks				AS 'Remarks',
							'success'				AS 'return_message';		
				END
	
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherDisbursementDetail_update]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Description>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_OtherDisbursementDetail_update
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_OtherDisbursementDetail_update]
	-- Add the parameters for the stored procedure here
	@Id					INT,
	@Description		VARCHAR(100),
	@CategoryId			INT,
	@CategoryType		VARCHAR(10),
	@BranchId			INT,
	@SetUpAmount		DECIMAL(10,2),
	@ChartOfAccountId	INT,
	@Day				INT,
	@ChannelId			Int,	
	@Remarks			VARCHAR(150),
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		IF EXISTS(SELECT Id FROM [dbo].[Masterfile_OtherDisbursementDetail] WHERE [Description] =  @Description AND [Status] = 1 AND Id <> @Id)
				BEGIN  							
					SELECT	'duplicate_description'	AS 'return_message';						
				END

		ELSE		
				BEGIN
					UPDATE [dbo].[Masterfile_OtherDisbursementDetail]	 
					SET	[Description]		= @Description,
						[CategoryId]		= @CategoryId, 
						[CategoryType]		= @CategoryType,
						[BranchId]			= @BranchId,
						[SetUpAmount]		= @SetUpAmount,
						[Day]				= @Day,
						[ChannelId]		= @ChannelId,
						[ChartOfAccountId]  = @ChartOfAccountId,
						[Remarks]			= @Remarks
						WHERE 
						Id = @Id
			-- Return Data of the Update
			SELECT	@Id					AS 'Id',
					@Description		AS 'Description',
					@CategoryId			AS 'CategoryId',
					@CategoryType		AS 'Category Type',
					@BranchId			AS 'BranchId',
					@SetUpAmount		AS 'Set Up Amount',
					@Day				AS 'Day',
					@ChannelId			AS 'ChannelId',
					@ChartOfAccountId	AS 'ChartOfAccountId',
					@Remarks			AS 'Remarks',
					'success'			AS 'return_message';
				END
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherReceiptDetail_delete]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_OtherReceiptDetail_delete 1,2
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_OtherReceiptDetail_delete]
	@Id					INT,
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0
			UPDATE [dbo].[Masterfile_OtherReceiptDetail]	 
				SET	
					[Status]	= @_Deleted
				WHERE 
					[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT 'success'	AS 'return_message';
	

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherReceiptDetail_get]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_OtherReceiptDetail_get
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_OtherReceiptDetail_get]
	-- Add the parameters for the stored procedure here
	@DisplayType VARCHAR(10)='',
	@OtherReceiptDetailId INT= 0,
	@PageNumber		INT = 1,
	@RowsPage 		INT = 10
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active OtherReceiptDetails and its details
			IF (@DisplayType = 'ViewAll')
			BEGIN
					SELECT mo.[Id],mo.[Description],mo.CategoryId,mc.[Description] AS 'Category', 
					mo.BranchId,mb.Name AS  'Branch',mo.SetUpAmount AS 'Setup Amount',mo.[Day],mo.ChannelId,mcc.[Description] AS 'Channel',
					mo.ChartOfAccountId AS 'chartofaccountid',mca.[Description] AS 'Chart Of Accounts',
					mo.Remarks					 
					from Masterfile_OtherReceiptDetail mo
					left join Masterfile_Category mc 
					on mo.CategoryId =mc.Id  AND mc.[Status] = 1
					left join Masterfile_Branch mb
					on mo.BranchId  = mb.Id AND mb.[Status] = 1
					left join Masterfile_Channel mcc
					on mo.ChannelId = mcc.Id AND mcc.[Status] = 1
					left join Masterfile_ChartOfAccount mca
					on mo.ChartOfAccountId = mca.Id  AND mca.[Status] = 1 
					where
					mo.[Status] = 1
					ORDER BY mb.Name ASC
			END
			ELSE
				BEGIN
				IF  (@OtherReceiptDetailId = 0)
				BEGIN

					WITH TempResult AS(
					SELECT mo.[Id],mo.[Description],mo.CategoryId,mc.[Description] AS 'Category', 
					mo.BranchId,mb.Name AS  'Branch',mo.SetUpAmount AS 'Setup Amount',mo.[Day],mo.ChannelId,mcc.[Description] AS 'Channel',
					mo.ChartOfAccountId AS 'chartofaccountid',mca.[Description] AS 'Chart Of Accounts',
					mo.Remarks					 
					from Masterfile_OtherReceiptDetail mo
					left join Masterfile_Category mc 
					on mo.CategoryId =mc.Id  AND mc.[Status] = 1
					left join Masterfile_Branch mb
					on mo.BranchId  = mb.Id AND mb.[Status] = 1
					left join Masterfile_Channel mcc
					on mo.ChannelId = mcc.Id AND mcc.[Status] = 1
					left join Masterfile_ChartOfAccount mca
					on mo.ChartOfAccountId = mca.Id  AND mca.[Status] = 1 
					where
					mo.[Status] = 1
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.Branch ASC
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

				END
			ELSE
			BEGIN
					WITH TempResult AS(
					SELECT mo.[Id],mo.[Description],mo.CategoryId,mc.[Description] AS 'Category',
					mo.BranchId,mb.Name AS  'Branch',mo.SetUpAmount AS 'Setup Amount',mo.[Day],mo.ChannelId,mcc.[Description] AS 'Channel',
					mo.ChartOfAccountId AS 'chartofaccountid',mca.[Description] AS 'Chart Of Accounts',
					mo.Remarks					 
					from Masterfile_OtherReceiptDetail mo
					left join Masterfile_Category mc 
					on mo.CategoryId =mc.Id AND mc.[Status] = 1
					left join Masterfile_Branch mb
					on mo.BranchId  = mb.Id and mb.[Status] = 1
					left join Masterfile_Channel mcc
					on mo.ChannelId = mcc.Id and mcc.[Status] = 1
					left join Masterfile_ChartOfAccount mca
					on mo.ChartOfAccountId = mca.Id and mca.[Status] = 1
					where
					mo.[Status] = 1 AND mo.Id= @OtherReceiptDetailId 
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.Branch ASC
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

				END
			END


		
		COMMIT TRANSACTION
	END TRY


	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION
		
		-- Return the generic error type	  
		SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
				ERROR_SEVERITY()	AS 'ErrorSeverity',  
				ERROR_STATE()		AS 'ErrorState',
				ERROR_PROCEDURE()	AS 'ErrorProcedure',  
				ERROR_LINE()		AS 'ErrorLine',
				ERROR_MESSAGE()		AS 'ErrorMessage',
				'failed'			AS 'return_message';
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherReceiptDetail_insert]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Description>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_OtherReceiptDetail_insert]
	-- Add the parameters for the stored procedure here
	@Description		VARCHAR(100),
	@CategoryId			INT,
	@CategoryType		VARCHAR(10),
	@BranchId			INT,
	@SetUpAmount		DECIMAL(10,2),
	@ChartOfAccountId	INT,
	@ChannelId			INT,
	@Day				INT,
	@Remarks			VARCHAR(150) ,
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT,
					@_Status			TINYINT  = 1		-- Default as 1 as describe as 'Active'
						

			SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Masterfile_OtherReceiptDetail];
			IF EXISTS(SELECT Id FROM [dbo].[Masterfile_OtherReceiptDetail] WHERE [Description] =  @Description AND [Status] = 1)
				BEGIN  							
					SELECT	'duplicate_description'	AS 'return_message';						
				END


			ELSE
				BEGIN
					INSERT INTO [dbo].[Masterfile_OtherReceiptDetail]
						(Id,[Description],[CategoryId],[CategoryType],[BranchId],[SetUpAmount],[ChartOfAccountId]
						,Remarks,[Status],ChannelId,[Day])
					VALUES
						(@_Id, @Description,@CategoryId,@CategoryType,@BranchId,@SetUpAmount,@ChartOfAccountId,@Remarks, @_Status,@ChannelId,@Day);
			
					-- Return of the Data type
					SELECT 	@_Id					AS 'Id', 
							@Description			AS 'Description',
							@CategoryId				AS 'CategoryId',
							@CategoryType			AS 'Category Type',
							@BranchId				AS 'BranchId',
							@ChannelId				AS 'ChannelId',
							@Day					AS 'Day',
							@SetUpAmount			AS 'SetUpAmount',
							@ChartOfAccountId		AS 'ChartOfAccountId',
							@Remarks				AS 'Remarks',
							'success'				AS 'return_message';		
					
				END
	
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherReceiptDetail_update]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Description>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_OtherReceiptDetail_update
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_OtherReceiptDetail_update]
	-- Add the parameters for the stored procedure here
	@Id					INT,
	@Description		VARCHAR(100),
	@CategoryId			INT,
	@CategoryType		VARCHAR(10),
	@BranchId			INT,
	@SetUpAmount		DECIMAL(10,2),
	@ChartOfAccountId	INT,
	@Day				INT,
	@ChannelId			Int,	
	@Remarks			VARCHAR(150),
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		IF EXISTS(SELECT Id FROM [dbo].[Masterfile_OtherReceiptDetail] WHERE [Description] =  @Description AND [Status] = 1 AND Id <> @Id)
				BEGIN  							
					SELECT	'duplicate_description'	AS 'return_message';						
				END

		ELSE		
				BEGIN
					UPDATE [dbo].[Masterfile_OtherReceiptDetail]	 
					SET	[Description]		= @Description,
						[CategoryId]		= @CategoryId, 
						[CategoryType]		= @CategoryType,
						[BranchId]			= @BranchId,
						[SetUpAmount]		= @SetUpAmount,
						[Day]				= @Day,
						[ChannelId]		= @ChannelId,
						[ChartOfAccountId]  = @ChartOfAccountId,
						[Remarks]			= @Remarks
						WHERE 
						Id = @Id
			-- Return Data of the Update
			SELECT	@Id					AS 'Id',
					@Description		AS 'Description',
					@CategoryId			AS 'CategoryId',
					@CategoryType		AS 'Category Type',
					@BranchId			AS 'BranchId',
					@SetUpAmount		AS 'Set Up Amount',
					@Day				AS 'Day',
					@ChannelId			AS 'ChannelId',
					@ChartOfAccountId	AS 'ChartOfAccountId',
					@Remarks			AS 'Remarks',
					'success'			AS 'return_message';
				END
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Region_delete]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Region_delete 1,2
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Region_delete]
	@Id					INT,
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0
			UPDATE [dbo].[Masterfile_Region]	 
				SET	
					[Status]	= @_Deleted
				WHERE 
					[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT 'success'	AS 'return_message';
	

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Region_get]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Region_get
/*
exec spMasterfile_Region_get '', 1
*/
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Region_get]
	-- Add the parameters for the stored procedure here
	@DisplayType varchar(10)='',
	@RegionId		INT	= 0,
	@PageNumber		INT = 1,
	@RowsPage 		INT = 10
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Regions and its details
			IF (@DisplayType = 'ViewAll')
			BEGIN
				SELECT 
					Id,[Name],Remarks
				FROM 
					Masterfile_Region
				WHERE 
					[Status] = 1 ORDER BY [Name] ASC;
			END
			ELSE
			BEGIN
				IF  (@RegionId = 0)
				BEGIN

					WITH TempResult AS(
						SELECT 
							Id,[Name],Remarks
						FROM 
							Masterfile_Region
						WHERE 
							[Status] = 1 
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.Name
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

				END
				ELSE
				BEGIN
					WITH TempResult AS(
						SELECT 
							Id,[Name],Remarks
						FROM 
							Masterfile_Region
						WHERE 
							[Status] = 1 AND Id = @RegionId
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.Name
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

				END
			END

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION
		
		-- Return the generic error type	  
		SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
				ERROR_SEVERITY()	AS 'ErrorSeverity',  
				ERROR_STATE()		AS 'ErrorState',
				ERROR_PROCEDURE()	AS 'ErrorProcedure',  
				ERROR_LINE()		AS 'ErrorLine',
				ERROR_MESSAGE()		AS 'ErrorMessage',
				'failed'			AS 'return_message';
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Region_insert]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Region_insert]
	-- Add the parameters for the stored procedure here
	@Name				VARCHAR(100),
	@Remarks			VARCHAR(150) ,
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT,
					@_Status			TINYINT  = 1		-- Default as 1 as describe as 'Active'	

			SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Masterfile_Region];

			IF EXISTS(SELECT Id FROM [dbo].[Masterfile_Region] WHERE Name =  @Name AND [Status] = 1)
				BEGIN  							
					SELECT	'duplicate_areaname'	AS 'return_message';						
				END

			ELSE
				BEGIN
					INSERT INTO [dbo].[Masterfile_Region]
						(Id,Name,Remarks,[Status])
					VALUES
						(@_Id, @Name,@Remarks, @_Status);
			
					-- Return of the Data type
					SELECT 	@_Id					AS 'Id', 
							@Name					AS 'Name',
							@Remarks				AS 'Remarks',
							'success'					AS 'return_message';
								
				END

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Region_update]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Region_update]
	-- Add the parameters for the stored procedure here
	@Id					INT,
	@Name				VARCHAR(100),
	@Remarks			VARCHAR(150),
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			IF (EXISTS(SELECT Id FROM [dbo].[Masterfile_Region] WHERE [Name] =  @Name AND [Status] = 1 and Id <> @Id))
				BEGIN  							
					SELECT	'duplicate_regionname'	AS 'return_message';						
				END

			ELSE
				BEGIN
				UPDATE [dbo].[Masterfile_Region]	 
					SET	[Name]		= @Name,
						[Remarks]	= @Remarks
					WHERE 
						[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT	@Id	AS 'Id',
					@Name	AS 'Name',
					@Remarks	AS 'Remarks',
					'success'	AS 'return_message';
				END

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Role_delete]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Role_delete 1,2
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Role_delete]
	@Id					INT,
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0;

			UPDATE [dbo].[Masterfile_Role]	 
				SET	
					[Status]	= @_Deleted
				WHERE 
					[Id]		= @Id;
			
			-- Return Data of the Update
				SELECT 'success'	AS 'return_message';
		
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Role_get]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Role_get
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Role_get]
	-- Add the parameters for the stored procedure here
	@DisplayType VARCHAR(10) = '',
	@RoleId		INT	= 0,
	@PageNumber		INT = 1,
	@RowsPage 		INT = 10
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Roles and its details
			IF (@DisplayType = 'ViewAll')
			BEGIN
					SELECT Id,[Description],Remarks from Masterfile_Role
					where
					[Status] = 1
					ORDER BY [Description] ASC
			END
			ELSE
				BEGIN
				IF  (@RoleId = 0)
				BEGIN

					WITH TempResult AS(
					SELECT Id,[Description],Remarks from Masterfile_Role
					where
					[Status] = 1
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[Description] ASC
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

				END
			
					ELSE
					BEGIN
					WITH TempResult AS(
					SELECT Id,[Description],Remarks from Masterfile_Role
					where
					[Status] = 1 AND Id = @RoleId
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[Description] ASC
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

				END
			END

		COMMIT TRANSACTION
	END TRY


	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION
		
		-- Return the generic error type	  
		SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
				ERROR_SEVERITY()	AS 'ErrorSeverity',  
				ERROR_STATE()		AS 'ErrorState',
				ERROR_PROCEDURE()	AS 'ErrorProcedure',  
				ERROR_LINE()		AS 'ErrorLine',
				ERROR_MESSAGE()		AS 'ErrorMessage',
				'failed'			AS 'return_message';
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Role_insert]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Description>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Role_insert 'Snatcher','Kusog mo Dagan'
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Role_insert]
	-- Add the parameters for the stored procedure here
	@Description		VARCHAR(100),
	@Remarks			VARCHAR(150) ,
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT,
					@_Status			TINYINT  = 1		-- Default as 1 as describe as 'Active'
				
			SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Masterfile_Role];

			IF EXISTS(SELECT Id FROM [dbo].[Masterfile_Role] WHERE Description =  @Description AND [Status] = 1)
				BEGIN  							
					SELECT	'duplicate_description'	AS 'return_message';						
				END

			ELSE
				BEGIN
					INSERT INTO [dbo].[Masterfile_Role]
						(Id,[Description],Remarks,[Status])
					VALUES
						(@_Id, @Description,@Remarks, @_Status);
				END

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Role_update]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Description>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Role_update]
	-- Add the parameters for the stored procedure here
	@Id					INT,
	@Description		VARCHAR(100),
	@Remarks			VARCHAR(150),
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			IF (EXISTS(SELECT Id FROM [dbo].[Masterfile_Role] WHERE [Description] =  @Description AND [Status] = 1 and Id <> @Id))
				BEGIN  							
					SELECT	'duplicate_description'	AS 'return_message';						
				END

			ELSE
				BEGIN
				UPDATE [dbo].[Masterfile_Role]	 
					SET	[Description]		= @Description,
						[Remarks]	= @Remarks
					WHERE 
						[Id]		= @Id;				
				END

				-- Return Data of the Update
			SELECT 'success'	AS 'return_message';

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_SystemRights_get]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_SystemRights_get
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_SystemRights_get]
	-- Add the parameters for the stored procedure here
	@Module VARCHAR(30) = ''
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active SystemRightss and its details
			IF(@Module = '')
			BEGIN
				SELECT Id,[Module],[Page],PageSeqNo,Rights,RightsSeqNo
				from Masterfile_SystemRights
				ORDER BY [Module],PageSeqNo,RightsSeqNo ASC
			END
			ELSE
			BEGIN
				SELECT Id,[Module],[Page],PageSeqNo,Rights,RightsSeqNo
				from Masterfile_SystemRights WHERE [Module] = @Module 
				ORDER BY [Module],PageSeqNo,RightsSeqNo ASC
			END
		COMMIT TRANSACTION
	END TRY


	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION
		
		-- Return the generic error type	  
		SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
				ERROR_SEVERITY()	AS 'ErrorSeverity',  
				ERROR_STATE()		AS 'ErrorState',
				ERROR_PROCEDURE()	AS 'ErrorProcedure',  
				ERROR_LINE()		AS 'ErrorLine',
				ERROR_MESSAGE()		AS 'ErrorMessage',
				'failed'			AS 'return_message';
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_SystemRights_insert]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Description>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_SystemRights_insert '123123','13',1,'Ewan',1
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_SystemRights_insert]
	-- Add the parameters for the stored procedure here
	@Module				VARCHAR(50),
	@Page				VARCHAR(100),
	@PageSeqNo			INT,
	@Rights				varchar(50),
	@RightsSeqNo		INT 
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT
			
			SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Masterfile_SystemRights];

					INSERT INTO [dbo].[Masterfile_SystemRights]
						(Id,[Module],[Page],[PageSeqNo],[Rights],[RightsSeqNo])
					VALUES
						(@_Id,@Module,@Page,@PageSeqNo,@Rights,@RightsSeqNo);
			
					-- Return of the Data type
					SELECT 	@_Id					AS 'Id', 
							@Module			AS 'Module',
							@Page			AS 'Page',
							@PageSeqNo		AS 'PageSeqNo',
							@Rights			AS 'Rights',
							@RightsSeqNo	AS 'RightsSeqNo',
							'success'					AS 'return_message';
									

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_SystemRights_update]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Description>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_SystemRights_update 1,99,99,99,99
-- SELECT * FROM Masterfile_SystemRights
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_SystemRights_update]
	-- Add the parameters for the stored procedure here
	@Id					INT,
	@Module		VARCHAR(50),
	@Page		VARCHAR(100),
	@PageSeqNo	INT,
	@RightsSeqNo	INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
				UPDATE [dbo].[Masterfile_SystemRights]	 
					SET	[Module]		= @Module,
						[Page] = @Page,
						[PageSeqNo] = @PageSeqNo,				
						[RightsSeqNo] = @RightsSeqNo
					WHERE 
						[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT	@Id	AS 'Id',
					@Module	AS 'Module',
					@Page	AS 'Page',
					@PageSeqNo	AS 'Page Sequence No.',
					@RightsSeqNo	AS 'Rights Sequence No.',
					'success'	AS 'return_message';
	
		
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_User_delete]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_User_delete 1,2
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_User_delete]
	@Id					INT,
	@UserID	BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE [dbo].[Masterfile_User]	 
				SET	
					[Status]	= 0
				WHERE 
					[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT 'success'	AS 'return_message';
	

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_User_get]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_User_get
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_User_get]
	-- Add the parameters for the stored procedure here
	@DisplayType VARCHAR(10) = '',
	@UserId		INT	= 0,
	@PageNumber		INT = 1,
	@RowsPage 		INT = 10
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Users and its details
			IF (@DisplayType = 'ViewAll')
			BEGIN
					SELECT mu.Id,mu.Username,
					mu.EmployeeId,me.Firstname AS Firstname,me.Middlename AS Middlename,
					me.Lastname AS Lastname,mu.RoleId,mr.[Description] AS [Role],mu.Remarks 
					from Masterfile_User mu
					left join Masterfile_Role mr 
					on mu.RoleId =mr.Id  and mr.[Status] = 1
					left join Masterfile_Employee me
					on mu.EmployeeId = me.Id and me.[Status] = 1
					where
					mu.[Status] = 1
					ORDER BY [Username] ASC
			END
			ELSE
				BEGIN
				IF  (@UserId = 0)
				BEGIN

					WITH TempResult AS(
					SELECT mu.Id,mu.Username,
					mu.EmployeeId,me.Firstname AS Firstname,me.Middlename AS Middlename,
					me.Lastname AS Lastname,mu.RoleId,mr.[Description] AS [Role],mu.Remarks 
					from Masterfile_User mu
					left join Masterfile_Role mr 
					on mu.RoleId =mr.Id  and mr.[Status] = 1
					left join Masterfile_Employee me
					on mu.EmployeeId = me.Id and me.[Status] = 1
					where
					mu.[Status] = 1
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[Username] ASC
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

				END
			ELSE
				BEGIN
					WITH TempResult AS(
					SELECT mu.Id,mu.Username,
					mu.EmployeeId,me.Firstname AS Firstname,me.Middlename AS Middlename,
					me.Lastname AS Lastname,mu.RoleId,mr.[Description] AS [Role],mu.Remarks 
					from Masterfile_User mu
					left join Masterfile_Role mr 
					on mu.RoleId =mr.Id and mr.[Status] = 1
					left join Masterfile_Employee me
					on mu.EmployeeId = me.Id and me.[Status] = 1
					where
					mu.[Status] = 1		AND mu.Id= @UserId 
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[Username] ASC
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

				END
			END
	
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION
		
		-- Return the generic error type	  
		SELECT	ERROR_NUMBER()		AS 'ErrorNumuer',  
				ERROR_SEVERITY()	AS 'ErrorSeverity',  
				ERROR_STATE()		AS 'ErrorState',
				ERROR_PROCEDURE()	AS 'ErrorProcedure',  
				ERROR_LINE()		AS 'ErrorLine',
				ERROR_MESSAGE()		AS 'ErrorMessage',
				'failed'			AS 'return_message';
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_User_insert]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Username>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_User_insert]
	-- Add the parameters for the stored procedure here
	@Username				VARCHAR(50),
	@EmployeeId				INT,
	@RoleId					INT,
	@Remarks			VARCHAR(150) ,
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT,
					@_Status			TINYINT  = 1,		-- Default as 1 as describe as 'Active'
					@Insert	VARCHAR(300),
					@Insert1 VARCHAR (50) = (SELECT Username From Masterfile_User where Id =  @UserId);
						

			SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Masterfile_User];

			IF EXISTS(SELECT Id FROM [dbo].[Masterfile_User] WHERE Username =  @Username AND [Status] = 1)
				BEGIN  							
					SELECT	'duplicate_username'	AS 'return_message';						
				END

			ELSE
				BEGIN
					INSERT INTO [dbo].[Masterfile_User]
						(Id,Username,EmployeeId,RoleId,Remarks,[Status])
					VALUES
						(@_Id, @Username,@EmployeeId, @RoleId,@Remarks, @_Status);
			
					-- Return of the Data type
					SELECT 	@_Id					AS 'Id', 
							@Username				AS 'Username',
							@EmployeeId				AS 'EmployeeId',
							@RoleId					AS 'RoleId',
							@Remarks				AS 'Remarks',
							'success'					AS 'return_message';		
					SET @Insert = 'Inserted: '+@Username+' New User by '+@Insert1;
					EXEC spAuditTrail_insert 'Masterfile_User',@_Id,'Insert',@UserId,@Insert;
						
				END

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_User_Login]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****************************************************************************************
Stored Producedure : spAccess_User_login
   Tables Accessed : Access_Users
           Authors : Aldwin, Francisco
      Date Created : July 31, 2018
	  Date Updated : July 31, 2018
		 Version # : 3.0.0

Overview: 
		User account can login with its corresponding status

Revision:
  Purpose											Date and Time			By              Reference
- Initial Creation of the SP						July 31, 2018			Francisco			none


Parameters:
	@UserName		VARCHAR(50)		-	Username of the account
	@Password		VARCHAR(50)		-	Password of the account

Testing:
	EXEC spMaster_User_Login 'garys' , 'HV5Jd7RIpdo6IZZTBQy6ah2mkZ1H3Lka/o60Txgd4bM='

*****************************************************************************************/
CREATE PROCEDURE [dbo].[spMasterfile_User_Login]
	@UserName		VARCHAR(50)
AS 

BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			

			SET NOCOUNT ON;	

			-- Validation if the data is match and exist	
			IF EXISTS(SELECT [Id] FROM [Masterfile_User] WHERE [UserName] = @UserName AND [Status] =  1)
				BEGIN
					SELECT 
						mu.Id,
						[UserName],
						me.Id AS 'EmployeeId',
						RoleId,
						me.BranchId,
						mb.BranchCode,
						mb.[name] AS 'BranchName',
						'user_found'	AS 'return_message'
					FROM 
						[dbo].[Masterfile_User] AS mu
							INNER JOIN [dbo].[Masterfile_Employee] AS me
						ON mu.EmployeeId	= me.id
							INNER JOIN [dbo].[Masterfile_Branch] AS mb
						ON me.BranchId	= mb.Id

					WHERE 
						[UserName] = @UserName					AND
						me.[Status] = 1;								
				END

			-- Else Statement if no data found on the query
			ELSE
				BEGIN

					-- Disable User account
					IF EXISTS(SELECT [Id] FROM [Masterfile_User]WHERE [UserName] = @UserName
					 AND [Status] = 2)
						BEGIN
							SELECT 'disabled_user'					AS 'return_message';
						END

					-- Wrong password in User account
					ELSE IF EXISTS(SELECT [Id] FROM [Masterfile_User]WHERE [UserName] = @UserName)
						BEGIN
							SELECT 'wrong_password'					AS 'return_message';
						END
					
					-- No data found in query of username
					ELSE
						BEGIN
							SELECT 'user_not_found'					AS 'return_message';
						END				
				END
			
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

		SELECT	
			ERROR_NUMBER()		AS 'ErrorNumber',  
			ERROR_SEVERITY()	AS 'ErrorSeverity',  
			ERROR_STATE()		AS 'ErrorState',
			ERROR_PROCEDURE()	AS 'ErrorProcedure',  
			ERROR_LINE()		AS 'ErrorLine',
			ERROR_MESSAGE()		AS 'ErrorMessage',
			'failed'			AS 'return_message';	
				
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_User_LoginByAD]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****************************************************************************************
Stored Producedure : spAccess_User_login
   Tables Accessed : Access_Users
           Authors : Aldwin, Francisco
      Date Created : June 05, 2018
	  Date Updated : June 27, 2018
		 Version # : 3.0.0

Overview: 
		User account can login with its corresponding status

Revision:
  Purpose											Date and Time			By              Reference
- Initial Creation of the SP						June 05, 2018			Aldwin			none
- Added Set No Count								June 19, 2018-11:59am	Francisco		None
- Reconstructing return and error Trapping			June 19, 2018-11:59am	Francisco		None
  via Try/Catch Statement 
- Check and ready for deployment					June 27, 2018-02:00pm	Francisco		None

Parameters:
	@EmailAddress		VARCHAR(50)

Testing:
	EXEC spAccess_User_check 'garSSy@gmail.com','211'
	select * FROM HRIS_Employees
	select * from ACCESS_Users
*****************************************************************************************/
CREATE PROCEDURE [dbo].[spMasterfile_User_LoginByAD]
	@ActiveDirectory		VARCHAR(50)
AS 

BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_ErrorNumber		INT,   
					@_ErrorSeverity		INT,  
					@_ErrorState		INT,
					@_ErrorProcedure	VARCHAR(150),
					@_ErrorLine			INT,
					@_EmployeeID		INT;
			     		
			-- SET NOCOUNT ON added to prevent extra result sets from
			-- interfering with SELECT statements. https://www.youtube.com/watch?v=53YxArvLhRA
			SET NOCOUNT ON;	

			-- Validation if the data is match and exist	
			IF EXISTS(SELECT me.Id FROM Masterfile_Employee me
						INNER JOIN [dbo].Masterfile_User mu 
						ON me.Id	= mu.EmployeeId
						WHERE [Username] = @ActiveDirectory AND mu.[Status] =  1 )
				BEGIN
					

					SELECT 
						mu.[EmployeeID]	AS 'EmployeeId',
						me.PositionId	AS 'PositionId',
						me.[BranchID]		AS 'BranchId',
						mb.branchcode,
						mb.[Name]		AS 'BranchName',
							CONCAT(me.[FirstName],
								' ',me.[MiddleName],
								' ',me.[LastName])	AS 'EmployeeName'	,
						'success'			AS 'return_message'	
					FROM 
						[dbo].Masterfile_Employee me
							INNER JOIN [dbo].Masterfile_User mu 
						ON me.Id	= mu.EmployeeId
							INNER JOIN [dbo].[Masterfile_Branch] mb
						ON mb.Id	= me.BranchId
					WHERE
					 [Username] = @ActiveDirectory		
				END


			ELSE IF EXISTS(SELECT me.Id FROM Masterfile_Employee me
						INNER JOIN [dbo].Masterfile_User mu 
						ON me.Id	= mu.EmployeeId
						WHERE [Username] = @ActiveDirectory AND mu.[Status] <>  1)
				BEGIN
					-- Disable User account
					SELECT 'disabled_employee'					AS 'return_message'
				END


		-- No data found in query of username
			ELSE
				BEGIN

						SELECT 'emailaddress_not_found'		AS 'return_message'
				END		

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

		-- Set the variables with its corresponding Data
		SELECT
			@_ErrorNumber		= ERROR_NUMBER(),
			@_ErrorSeverity		= ERROR_SEVERITY(),
			@_ErrorState		= ERROR_STATE(),
			@_ErrorProcedure	= ERROR_STATE(),
			@_ErrorLine			= ERROR_STATE();

		-- Return the generic error type			
		SELECT  
			@_ErrorNumber		AS 'ErrorNumber',  
			@_ErrorSeverity		AS 'ErrorSeverity',  
			@_ErrorState		AS 'ErrorState',
			@_ErrorProcedure	AS 'ErrorProcedure',  
			@_ErrorLine			AS 'ErrorLine',
			ERROR_MESSAGE()		AS 'ErrorMessage',
			'failed'			AS 'return_message';		
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_User_LoginByGmail]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****************************************************************************************
Stored Producedure : spAccess_User_login
   Tables Accessed : Access_Users
           Authors : Aldwin, Francisco
      Date Created : June 05, 2018
	  Date Updated : June 27, 2018
		 Version # : 3.0.0

Overview: 
		User account can login with its corresponding status

Revision:
  Purpose											Date and Time			By              Reference
- Initial Creation of the SP						June 05, 2018			Aldwin			none
- Added Set No Count								June 19, 2018-11:59am	Francisco		None
- Reconstructing return and error Trapping			June 19, 2018-11:59am	Francisco		None
  via Try/Catch Statement 
- Check and ready for deployment					June 27, 2018-02:00pm	Francisco		None

Parameters:
	@EmailAddress		VARCHAR(50)

Testing:
	EXEC spAccess_User_check 'rmfit.ojt.gary@gmail.com','211'
	select * FROM Masterfile_Employee
	select * from ACCESS_Users
*****************************************************************************************/
CREATE PROCEDURE [dbo].[spMasterfile_User_LoginByGmail]
	@EmailAddress		VARCHAR(50),
	@GmailID		VARCHAR(100)
AS 

BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_ErrorNumber		INT,   
					@_ErrorSeverity		INT,  
					@_ErrorState		INT,
					@_ErrorProcedure	VARCHAR(150),
					@_ErrorLine			INT,
					@_Id		INT;
			     		
			-- SET NOCOUNT ON added to prevent extra result sets from
			-- interfering with SELECT statements. https://www.youtube.com/watch?v=53YxArvLhRA
			SET NOCOUNT ON;	

			-- Validation if the data is match and exist	
			IF EXISTS(SELECT [Masterfile_Employee].[Id] FROM [Masterfile_Employee] 
						WHERE [EmailAddress] = @EmailAddress AND [Status] =  1 AND [GmailID] ='')
				BEGIN
					
				SELECT @_Id = [Id] FROM [dbo].[Masterfile_Employee] 
				WHERE [EmailAddress] = @EmailAddress;

				UPDATE [dbo].[Masterfile_Employee]	 
				SET	[GmailID]		=  @GmailID			
				WHERE 
					[Id]	= @_Id;

					SELECT 
						[dbo].[Masterfile_Employee].[Id]	AS 'Id',
						[dbo].[Masterfile_Employee].[BranchId]		AS 'BranchID',
						mu.ID	AS 'UserID',
						mr.[Description]						AS 'RoleName',
						mb.Name		AS 'BranchName',
						BranchCode,
							CONCAT([dbo].[Masterfile_Employee].[FirstName],
								' ',[dbo].[Masterfile_Employee].[MiddleName],
								' ',[dbo].[Masterfile_Employee].[LastName])	AS 'Employee Name'	,
						[GmailID]		AS 'GmailID',
						'success'			AS 'return_message'	
					FROM 
						[dbo].[Masterfile_Employee] 
							INNER JOIN [dbo].[Masterfile_Branch] mb
						ON [dbo].[Masterfile_Employee].[BranchId]	= mb.[Id]
							INNER JOIN [dbo].[Masterfile_User] mu 
						ON [dbo].[Masterfile_Employee].[Id]	= mu.[Id]
							INNER JOIN [dbo].[Masterfile_Role] mr 
						ON mu.RoleId	= mr.[Id]
					WHERE
					 [EmailAddress] = @EmailAddress		
				END




			-- Else Statement if no data found on the query
			ELSE IF EXISTS(SELECT [Id] FROM [Masterfile_Employee] WHERE [EmailAddress] = @EmailAddress
			 AND [Status] =  1 AND [GmailID] <>'' )
				BEGIN
				SELECT 
						[dbo].[Masterfile_Employee].[Id]	AS 'Id',
						[dbo].[Masterfile_Employee].[BranchId]		AS 'BranchID',
						mu.ID	AS 'UserID',
						mr.[Description]						AS 'RoleName',
						mb.Name		AS 'BranchName',
						BranchCode,
							CONCAT([dbo].[Masterfile_Employee].[FirstName],
								' ',[dbo].[Masterfile_Employee].[MiddleName],
								' ',[dbo].[Masterfile_Employee].[LastName])	AS 'Employee Name'	,
						[GmailID]		AS 'GmailID',
						'success'			AS 'return_message'	
					FROM 
						[dbo].[Masterfile_Employee] 
							INNER JOIN [dbo].[Masterfile_Branch] mb
						ON [dbo].[Masterfile_Employee].[BranchId]	= mb.[Id]
							INNER JOIN [dbo].[Masterfile_User] mu 
						ON [dbo].[Masterfile_Employee].[Id]	= mu.[Id]
							INNER JOIN [dbo].[Masterfile_Role] mr 
						ON mu.RoleId	= mr.[Id]
					WHERE
					 [EmailAddress] = @EmailAddress	
				END
			ELSE IF EXISTS(SELECT [Id] FROM [Masterfile_Employee] WHERE [EmailAddress] = @EmailAddress
			 AND [Status] =  2 )
				BEGIN
					-- Disable User account
					SELECT 'disabled_employee'					AS 'return_message'
				END


		-- No data found in query of username
			ELSE
				BEGIN

						SELECT 'emailaddress_not_found'		AS 'return_message'
				END		

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

		-- Set the variables with its corresponding Data
		SELECT
			@_ErrorNumber		= ERROR_NUMBER(),
			@_ErrorSeverity		= ERROR_SEVERITY(),
			@_ErrorState		= ERROR_STATE(),
			@_ErrorProcedure	= ERROR_STATE(),
			@_ErrorLine			= ERROR_STATE();

		-- Return the generic error type			
		SELECT  
			@_ErrorNumber		AS 'ErrorNumber',  
			@_ErrorSeverity		AS 'ErrorSeverity',  
			@_ErrorState		AS 'ErrorState',
			@_ErrorProcedure	AS 'ErrorProcedure',  
			@_ErrorLine			AS 'ErrorLine',
			ERROR_MESSAGE()		AS 'ErrorMessage',
			'failed'			AS 'return_message';		
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_User_update]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Description>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_User_update]
	-- Add the parameters for the stored procedure here
	@Id					INT,
	@Username			VARCHAR(50),
	@EmployeeId			INT,
	@RoleId				INT,
	@Remarks			VARCHAR(150),
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
				UPDATE [dbo].[Masterfile_User]	 
					SET	[Username]		= @Username,
						[EmployeeId] = @EmployeeId,
						[RoleId] = @RoleId,
						[Remarks] = @Remarks
					WHERE 
						[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT	@Id	AS 'Id',
					@Username	AS 'Username',
					@EmployeeId	AS 'EmployeeId',
					@RoleId	AS 'RoleId',
					@Remarks	AS 'Remarks',
					'success'	AS 'return_message';
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spReport_Remco_get]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spReport_Remco_get 0,0,0,0
-- =============================================
CREATE PROCEDURE [dbo].[spReport_Remco_get]
	-- Add the parameters for the stored procedure here
	@RegionId		INT	= 0,
	@District		INT = 0,
	@Area			INT = 0,
	@BranchId		INT = 0
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @Test VARCHAR(50),
			@Test2 VARCHAR(50),
			@Test3 VARCHAR(50),
			@Test4 VARCHAR(50),
			@Test5 VARCHAR(100)
			SET @Test = CASE WHEN @RegionId != 0 THEN 'mr.Id = @RegionId ' ELSE ' 'END
			SET @Test2 = CASE WHEN @District != 0 THEN 'md.Id = @District ' ELSE ' 'END
			SET @Test3 = CASE WHEN @RegionId != 0 THEN 'ma.Id = @Area ' ELSE ' 'END
			SET @Test4 = CASE WHEN @RegionId != 0 THEN 'mb.Id = @BranchId ' ELSE ' 'END
			SET @Test5 = CONCAT(@Test,@Test2,@Test3,@Test4);
			IF (@RegionId <>0 OR @BranchId <> 0 OR @Area <> 0 OR @District <> 0)
			BEGIN
			SELECT mr.Id AS 'RegionId',mr.Name AS 'Region',md.Id AS 'DistrictId',md.Name AS 'District',ma.Id AS 'AreaId',ma.Name AS 'Area',mb.Id AS 'BranchId',mb.Name AS 'Branch',tbpd.TSEmployeeId,CONCAT(me.Firstname,' ',me.Middlename,' ',me.LastName) AS 'Employee',tbpd.Detail AS 'Client',tbpd.Qty,tbpd.Week1,tbpd.Week2,tbpd.Week3
			,tbpd.Week4,tbpd.Week5,tbpd.Week6,tbpd.Total
			FROM 
			Transaction_BudgetPreparationDetail tbpd
			INNER JOIN Transaction_BudgetPreparation tbp
			ON  tbpd.BudgetPreparationId = tbp.Id AND tbp.[Status] = 1
			INNER JOIN Transaction_BudgetPeriod tb
			ON tbp.BudgetPeriodId = tb.Id
			INNER JOIN Masterfile_Employee me
			ON tbpd.TSEmployeeId = me.Id
			INNER JOIN Masterfile_Branch mb
			ON tbp.BranchId = mb.Id AND mb.[Status] = 1 AND me.BranchId = mb.Id
			INNER JOIN Masterfile_Area ma
			ON mb.AreaId = ma.Id
			INNER JOIN Masterfile_District md
			ON ma.DistrictId = md.Id
			INNER JOIN Masterfile_Region mr
			ON md.RegionId = mr.Id
			WHERE tbpd.ChannelId = 4 AND tbpd.CategoryId = 0 AND @Test5 = @Test5
			END
			ELSE
			BEGIN
			SELECT mr.Id AS 'RegionId',mr.Name AS 'Region',md.Id AS 'DistrictId',md.Name AS 'District',ma.Id AS 'AreaId',ma.Name AS 'Area',mb.Id AS 'BranchId',mb.Name AS 'Branch',tbpd.TSEmployeeId,CONCAT(me.Firstname,' ',me.Middlename,' ',me.LastName) AS 'Employee',tbpd.Detail AS 'Client',tbpd.Qty,tbpd.Week1,tbpd.Week2,tbpd.Week3
			,tbpd.Week4,tbpd.Week5,tbpd.Week6,tbpd.Total
			FROM 
			Transaction_BudgetPreparationDetail tbpd
			INNER JOIN Transaction_BudgetPreparation tbp
			ON  tbpd.BudgetPreparationId = tbp.Id AND tbp.[Status] = 1
			INNER JOIN Transaction_BudgetPeriod tb
			ON tbp.BudgetPeriodId = tb.Id
			INNER JOIN Masterfile_Employee me
			ON tbpd.TSEmployeeId = me.Id
			INNER JOIN Masterfile_Branch mb
			ON tbp.BranchId = mb.Id AND mb.[Status] = 1 AND me.BranchId = mb.Id
			INNER JOIN Masterfile_Area ma
			ON mb.AreaId = ma.Id
			INNER JOIN Masterfile_District md
			ON ma.DistrictId = md.Id
			INNER JOIN Masterfile_Region mr
			ON md.RegionId = mr.Id
			WHERE tbpd.ChannelId = 4 AND tbpd.CategoryId = 0 
			END
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION
		
		-- Return the generic error type	  
		SELECT	ERROR_NUMBER()		AS 'ErrorNumuer',  
				ERROR_SEVERITY()	AS 'ErrorSeverity',  
				ERROR_STATE()		AS 'ErrorState',
				ERROR_PROCEDURE()	AS 'ErrorProcedure',  
				ERROR_LINE()		AS 'ErrorLine',
				ERROR_MESSAGE()		AS 'ErrorMessage',
				'failed'			AS 'return_message';
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spTransaction]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Category_delete 1,2
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction]
	@BudgetPreparationID	BIGINT,
	@Type				VARCHAR(10)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		SELECT * 
		FROM
			[Transaction_BudgetPreparation] tbp
		WHERE tbp.Id = 1


		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPeriod_close]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spTransaction_BudgetPeriod_close 3,1,''
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_BudgetPeriod_close]
	-- Add the parameters for the stored procedure here
	@Id						bigint,
	@ClosedRemarks			VARCHAR(150),
	@UserId				INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_ErrorNumber		INT,   
					@_ErrorSeverity		INT,  
					@_ErrorState		INT,
					@_ErrorProcedure	VARCHAR(150),
					@_ErrorLine			INT
					
			IF EXISTS(SELECT Id FROM [Transaction_BudgetPeriod] WHERE Id = @Id  AND [PeriodStatus] = 'Open')
				BEGIN
					update [dbo].[Transaction_BudgetPeriod] set
					PeriodStatus = 'Closed',
					DateClosed = GETDATE(),
					ClosedBy = @UserId,
					ClosedRemarks = @ClosedRemarks
					where
					Id = @Id;

					-- Return of the Data type
					SELECT
					@Id	AS 'Id', 
					'Closed'	AS 'Period Status',
					GETDATE()	AS 'Date Closed',
					@UserId	AS 'Closed By',
					@ClosedRemarks	AS 'Closed Remarks',
					'success'	AS 'return_message'; 
				
				END
			ELSE  IF EXISTS(SELECT [Id] FROM [Transaction_BudgetPeriod] WHERE Id = @Id and [PeriodStatus] = 'Closed')
				BEGIN
					SELECT 'budget_period_already_closed' AS 'return_message';
				END
					
			ELSE
				
				BEGIN
					SELECT 'budget_period_not_exist' AS 'return_message';
				END
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			-- Set the variables with its corresponding Data
			SELECT	@_ErrorNumber		= ERROR_NUMBER(),
					@_ErrorSeverity		= ERROR_SEVERITY(),
					@_ErrorState		= ERROR_STATE(),
					@_ErrorProcedure	= ERROR_STATE(),
					@_ErrorLine			= ERROR_STATE();
		
		
				SELECT	@_ErrorNumber		AS 'ErrorNumber',  
						@_ErrorSeverity		AS 'ErrorSeverity',  
						@_ErrorState		AS 'ErrorState',
						@_ErrorProcedure	AS 'ErrorProcedure',  
						@_ErrorLine			AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';

	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPeriod_CurrentOpen]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spTransaction_BudgetPeriod_CurrentOpen 7,2018
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_BudgetPeriod_CurrentOpen]

AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			

			BEGIN
				SELECT TOP 1 tbp.Id,tbp.[Month],tbp.[Year]
				FROM Transaction_BudgetPeriod tbp	
				where
				tbp.[Status] = 1
				ORDER BY tbp.PeriodStatus DESC,tbp.[Year] DESC,tbp.[Month] desc
			END
	
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION
		
		-- Return the generic error type	  
		SELECT	ERROR_NUMBER()		AS 'ErrorNumuer',  
				ERROR_SEVERITY()	AS 'ErrorSeverity',  
				ERROR_STATE()		AS 'ErrorState',
				ERROR_PROCEDURE()	AS 'ErrorProcedure',  
				ERROR_LINE()		AS 'ErrorLine',
				ERROR_MESSAGE()		AS 'ErrorMessage',
				'failed'			AS 'return_message';
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPeriod_get]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spTransaction_BudgetPeriod_get
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_BudgetPeriod_get]
	-- Add the parameters for the stored procedure here
	@DisplayType VARCHAR(10)='',
	@Id		INT	= 0,
	@PageNumber		INT = 1,
	@RowsPage 		INT = 10
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Users and its details
			IF (@DisplayType = 'ViewAll')
			BEGIN
					SELECT tbp.Id,tbp.[Month],tbp.[Year],tbp.PeriodStatus as [Period Status],
					CONVERT(VARCHAR(10),tbp.DateOpen,110) as [Date Open],
					CONVERT(VARCHAR(10),tbp.DateClosed,110) as [Date Closed],
					tbp.TotalInflowBudget as [Total Inflow Budget],TotalInflowActual as [Total Inflow Actual],
					TotalInflowVariance as [Total Inflow Variance],
					TotalOutflowBudget as [Total Outflow Budget],TotalOutflowActual as [Total Outflow Actual],
					TotalOutflowVariance as [Total Outflow Variance],
					uOpen.Username as [Open By],uClosed.Username as [Closed By],
					tbp.OpenRemarks as [Open Remarks],tbp.ClosedRemarks as [Closed Remarks]
					FROM Transaction_BudgetPeriod tbp
					left join Masterfile_User uOpen
					on tbp.OpenBy = uOpen.Id and uOpen.[Status] = 1
					left join Masterfile_User uClosed
					on tbp.ClosedBy = uClosed.Id and uClosed.[Status] = 1
					where
					tbp.[Status] = 1
					ORDER BY tbp.PeriodStatus desc;
			END
			
			ELSE
				BEGIN
				IF  (@Id = 0)
				BEGIN

					WITH TempResult AS(
					SELECT tbp.Id,tbp.[Month],tbp.[Year],tbp.PeriodStatus as [Period Status],
					CONVERT(VARCHAR(10),tbp.DateOpen,110) as [Date Open],
					CONVERT(VARCHAR(10),tbp.DateClosed,110) as [Date Closed],
					tbp.TotalInflowBudget as [Total Inflow Budget],TotalInflowActual as [Total Inflow Actual],
					TotalInflowVariance as [Total Inflow Variance],
					TotalOutflowBudget as [Total Outflow Budget],TotalOutflowActual as [Total Outflow Actual],
					TotalOutflowVariance as [Total Outflow Variance],
					uOpen.Username as [Open By],uClosed.Username as [Closed By],
					tbp.OpenRemarks as [Open Remarks],tbp.ClosedRemarks as [Closed Remarks]
					FROM Transaction_BudgetPeriod tbp
					left join Masterfile_User uOpen
					on tbp.OpenBy = uOpen.Id and uOpen.[Status] = 1
					left join Masterfile_User uClosed
					on tbp.ClosedBy = uClosed.Id and uClosed.[Status] = 1
					where
					tbp.[Status] = 1
				
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[Period Status] DESC,TempResult.[Year] DESC,TempResult.[Month] desc
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

				END
				ELSE
				BEGIN
					WITH TempResult AS(
					SELECT tbp.Id,tbp.[Month],tbp.[Year],tbp.PeriodStatus as [Period Status],
					CONVERT(VARCHAR(10),tbp.DateOpen,110) as [Date Open],
					CONVERT(VARCHAR(10),tbp.DateClosed,110) as [Date Closed],
					tbp.TotalInflowBudget as [Total Inflow Budget],TotalInflowActual as [Total Inflow Actual],
					TotalInflowVariance as [Total Inflow Variance],
					TotalOutflowBudget as [Total Outflow Budget],TotalOutflowActual as [Total Outflow Actual],
					TotalOutflowVariance as [Total Outflow Variance],
					uOpen.Username as [Open By],uClosed.Username as [Closed By],
					tbp.OpenRemarks as [Open Remarks],tbp.ClosedRemarks as [Closed Remarks]
					FROM Transaction_BudgetPeriod tbp
					left join Masterfile_User uOpen
					on tbp.OpenBy = uOpen.Id and uOpen.[Status] = 1
					left join Masterfile_User uClosed
					on tbp.ClosedBy = uClosed.Id and uClosed.[Status] = 1
					where
					tbp.[Status] = 1 AND tbp.Id= @Id 
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[Period Status] DESC,TempResult.[Year] DESC,TempResult.[Month] desc
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

				END
			END
	
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION
		
		-- Return the generic error type	  
		SELECT	ERROR_NUMBER()		AS 'ErrorNumuer',  
				ERROR_SEVERITY()	AS 'ErrorSeverity',  
				ERROR_STATE()		AS 'ErrorState',
				ERROR_PROCEDURE()	AS 'ErrorProcedure',  
				ERROR_LINE()		AS 'ErrorLine',
				ERROR_MESSAGE()		AS 'ErrorMessage',
				'failed'			AS 'return_message';
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPeriod_getcurrentopen]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spTransaction_BudgetPeriod_CurrentOpen 7,2018
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_BudgetPeriod_getcurrentopen]

AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			

			BEGIN
				SELECT * 
				FROM Transaction_BudgetPeriod	
				where
				[Status] = 1 AND PeriodStatus = 'Open';
			END
	
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION
		
		-- Return the generic error type	  
		SELECT	ERROR_NUMBER()		AS 'ErrorNumuer',  
				ERROR_SEVERITY()	AS 'ErrorSeverity',  
				ERROR_STATE()		AS 'ErrorState',
				ERROR_PROCEDURE()	AS 'ErrorProcedure',  
				ERROR_LINE()		AS 'ErrorLine',
				ERROR_MESSAGE()		AS 'ErrorMessage',
				'failed'			AS 'return_message';
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPeriod_open]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spTransaction_BudgetPeriod_insert 'Poblacion',1,''
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_BudgetPeriod_open]
	-- Add the parameters for the stored procedure here
	@Month					INT,
	@Year					INT,
	@OpenRemarks			VARCHAR(150),
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_ErrorNumber		INT,   
					@_ErrorSeverity		INT,  
					@_ErrorState		INT,
					@_ErrorProcedure	VARCHAR(150),
					@_ErrorLine			INT,
					@_Id			INT,
					@_Status			TINYINT  = 1		-- Default as 1 as describe in tbl_Status as 'Active'
		;	
						

			IF EXISTS(SELECT Id FROM [Transaction_BudgetPeriod] WHERE [Year] = @Year AND [Month] = @Month)
				BEGIN
					SELECT 'budget_period_already_open' AS 'return_message';
				END
			ELSE  IF EXISTS(SELECT [Id] FROM [Transaction_BudgetPeriod] WHERE [Year] = @Year AND 
					[Month] = @Month and [PeriodStatus] = 'Closed')
				BEGIN
					SELECT 'budget_period_already_closed' AS 'return_message';
				END
					
			ELSE
				BEGIN
					SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Transaction_BudgetPeriod];
					INSERT INTO [dbo].[Transaction_BudgetPeriod]
					(Id,[Month],[Year],PeriodStatus,DateOpen,
					OpenBy,OpenRemarks,[Status])
					VALUES
					(@_Id, @Month,@Year,'Open',GETDATE(),
					@UserId,@OpenRemarks, @_Status);

					-- Return of the Data type
					SELECT @_Id	AS 'Id', 
					@Month	AS 'Month',
					@Year	AS 'Year',
					'Open'	AS 'Period Status',
					GETDATE()	AS 'Date Open',
					@UserId	AS 'Open By',
					@OpenRemarks	AS 'Open Remarks',
					'success'	AS 'return_message';
				END
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			-- Set the variables with its corresponding Data
			SELECT	@_ErrorNumber		= ERROR_NUMBER(),
					@_ErrorSeverity		= ERROR_SEVERITY(),
					@_ErrorState		= ERROR_STATE(),
					@_ErrorProcedure	= ERROR_STATE(),
					@_ErrorLine			= ERROR_STATE();
		
		
				SELECT	@_ErrorNumber		AS 'ErrorNumber',  
						@_ErrorSeverity		AS 'ErrorSeverity',  
						@_ErrorState		AS 'ErrorState',
						@_ErrorProcedure	AS 'ErrorProcedure',  
						@_ErrorLine			AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';

	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparation_delete]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
--	EXEC spTransaction_BudgetPreparation_delete 1,2
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_BudgetPreparation_delete]
	@Id					INT,
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0
			UPDATE [dbo].[Transaction_BudgetPreparation]	 
				SET	
					[Status]	= @_Deleted
				WHERE 
					[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT 'success'	AS 'return_message';
	

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparation_get]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spTransaction_BudgetPreparation_get
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_BudgetPreparation_get]
	-- Add the parameters for the stored procedure here
	@DisplayType VARCHAR(10)='',
	@Id		INT	= 0,
	@PageNumber		INT = 1,
	@RowsPage 		INT = 10
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Users and its details
			IF (@DisplayType = 'ViewAll')
			BEGIN
					SELECT tb.Id,tb.BudgetPeriodId,tb.BranchId,mb.Name AS 'Branch Name ',
					tb.TotalInflowBudget AS 'Total Inflow Budget',
					tb.TotalInflowActual AS 'Total Inflow Actual',
					tb.TotalInflowVariance AS 'Total Inflow Variance',
					tb.TotalOutflowBudget AS 'Total Outflow Budget',
					tb.TotalOutflowActual AS 'Total Outflow Actual',
					tb.TotalOutflowVariance AS 'Total Outflow Variance',
					tb.Remarks
					from Transaction_BudgetPreparation tb
					left join Transaction_BudgetPeriod tp
					on tb.BudgetPeriodId =tp.Id and tp.[Status] = 1
					left join Masterfile_Branch mb
					on tb.BranchId =mb.Id and mb.[Status] = 1
					where
					tb.[Status] = 1
					ORDER BY mb.Name ASC
			END
			
			ELSE
				BEGIN
				IF  (@Id = 0)
				BEGIN

					WITH TempResult AS(
					SELECT tb.Id,tb.BudgetPeriodId,tb.BranchId,mb.Name AS 'Branch Name ',
					tb.TotalInflowBudget AS 'Total Inflow Budget',
					tb.TotalInflowActual AS 'Total Inflow Actual',
					tb.TotalInflowVariance AS 'Total Inflow Variance',
					tb.TotalOutflowBudget AS 'Total Outflow Budget',
					tb.TotalOutflowActual AS 'Total Outflow Actual',
					tb.TotalOutflowVariance AS 'Total Outflow Variance',
					tb.Remarks
					from Transaction_BudgetPreparation tb
					left join Transaction_BudgetPeriod tp
					on tb.BudgetPeriodId =tp.Id and tp.[Status] = 1
					left join Masterfile_Branch mb
					on tb.BranchId =mb.Id and mb.[Status] = 1
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[Branch Name ] ASC
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

				END
			ELSE
			BEGIN
					WITH TempResult AS(
					SELECT tb.Id,tb.BudgetPeriodId,tb.BranchId,mb.Name AS 'Branch Name ',
					tb.TotalInflowBudget AS 'Total Inflow Budget',
					tb.TotalInflowActual AS 'Total Inflow Actual',
					tb.TotalInflowVariance AS 'Total Inflow Variance',
					tb.TotalOutflowBudget AS 'Total Outflow Budget',
					tb.TotalOutflowActual AS 'Total Outflow Actual',
					tb.TotalOutflowVariance AS 'Total Outflow Variance',
					tb.Remarks
					from Transaction_BudgetPreparation tb
					left join Transaction_BudgetPeriod tp
					on tb.BudgetPeriodId =tp.Id and tp.[Status] = 1
					left join Masterfile_Branch mb
					on tb.BranchId =mb.Id and mb.[Status] = 1
					where
					tb.[Status] = 1 AND tb.Id= @Id 
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[Branch Name ] ASC
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

				END
			END
	
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION
		
		-- Return the generic error type	  
		SELECT	ERROR_NUMBER()		AS 'ErrorNumuer',  
				ERROR_SEVERITY()	AS 'ErrorSeverity',  
				ERROR_STATE()		AS 'ErrorState',
				ERROR_PROCEDURE()	AS 'ErrorProcedure',  
				ERROR_LINE()		AS 'ErrorLine',
				ERROR_MESSAGE()		AS 'ErrorMessage',
				'failed'			AS 'return_message';
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparation_getId]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spTransaction_BudgetPreparation_get
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_BudgetPreparation_getId]
	-- Add the parameters for the stored procedure here
	@BudgetPeriodId bigint = 0,
	@BranchId		INT	= 0
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Users and its details
			SELECT Id
			from Transaction_BudgetPreparation
			where
			BudgetPeriodId = @BudgetPeriodId and BranchId = @BranchId and [Status] = 1;
	
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION
		
		-- Return the generic error type	  
		SELECT	ERROR_NUMBER()		AS 'ErrorNumuer',  
				ERROR_SEVERITY()	AS 'ErrorSeverity',  
				ERROR_STATE()		AS 'ErrorState',
				ERROR_PROCEDURE()	AS 'ErrorProcedure',  
				ERROR_LINE()		AS 'ErrorLine',
				ERROR_MESSAGE()		AS 'ErrorMessage',
				'failed'			AS 'return_message';
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparation_insert]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spTransaction_BudgetPreparation_insert 'Poblacion',1,''
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_BudgetPreparation_insert]
	-- Add the parameters for the stored procedure here
	@BudgetPeriodId	BIGINT,
	@BranchId		INT,
	@PreparedBy				INT,
	@Remarks			VARCHAR(150) 
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT,
					@_Status			TINYINT  = 1;		-- Default as 1 as describe as 'Active'


			SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Transaction_BudgetPreparation];
					INSERT INTO [dbo].[Transaction_BudgetPreparation]
						(Id,BudgetPeriodId,BranchId,
						PreparedBy,Remarks,[Status])
					VALUES
						(@_Id,@BudgetPeriodId,@BranchId,
						@PreparedBy,@Remarks, @_Status);
			
					-- Return of the Data type
					SELECT 	@_Id					AS 'Id', 
							@BudgetPeriodId			AS 'BudgetPeriodId',
							@BranchId				AS 'BranchId',
							@PreparedBy					AS 'PreparedBy',
							@Remarks				AS 'Remarks',
							'success'					AS 'return_message';
												
			
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparation_update]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_BudgetPreparation_update]
	-- Add the parameters for the stored procedure here
	@Id					BIGINT,
	@BudgetPeriodId	    BIGINT,
	@BranchId			int,
	@PreparedBy				int,	
	@Remarks			VARCHAR(150)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

				UPDATE [dbo].[Transaction_BudgetPreparation]	 
					SET	
					
						[BudgetPeriodId] =@BudgetPeriodId,
						[BranchId]		=@BranchId,
						[PreparedBy]	=@PreparedBy,
						
						[Remarks]=@Remarks

					WHERE 
						[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT	@BudgetPeriodId  AS 'BudgetPeriodId',
					@BranchId		AS 'BranchId',
					@PreparedBy			AS 'PreparedBy',
					@Remarks				AS 'Remarks',
					'success'	AS 'return_message';
	
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationCollections_get]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC [spTransaction_BudgetPreparationCollections_get] 21,'loan'
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_BudgetPreparationCollections_get]
	-- Add the parameters for the stored procedure here
	@Id		BIGINT
		
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Users and its details
					SELECT 
					tbd.BudgetPreparationId,tbd.CategoryId,tbd.CategoryDescription AS 'Category Description'
					,tbd.TSEmployeeId,tbd.Detail,tbd.Reference,tbd.Qty AS 'Quantity'
					,tbd.WeekNo AS 'Week No',tbd.ChannelId,mh.[Description]
					AS 'Channel Description', tbd.Week1 AS 'Week 1' ,
					tbd.Week2 AS 'Week 2',
					tbd.Week3 AS 'Week 3',
					tbd.Week4 AS 'Week 4',
					tbd.Week5 AS 'Week 5',
					tbd.Week6 AS 'Week 6',tbd.Total,
					tbd.Remarks
					from Transaction_BudgetPreparationDetail tbd
					left join Transaction_BudgetPreparation tb
					on tbd.BudgetPreparationId =tb.Id and tb.[Status] = 1
					left join Masterfile_Channel mh
					on tbd.ChannelId =mh.Id and mh.[Status] = 1
					where
					tbd.BudgetPreparationId = @Id AND
					tbd.CategoryDescription = 'collections' AND
					tbd.[Status] = 1
			
	
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION
		
		-- Return the generic error type	  
		SELECT	ERROR_NUMBER()		AS 'ErrorNumuer',  
				ERROR_SEVERITY()	AS 'ErrorSeverity',  
				ERROR_STATE()		AS 'ErrorState',
				ERROR_PROCEDURE()	AS 'ErrorProcedure',  
				ERROR_LINE()		AS 'ErrorLine',
				ERROR_MESSAGE()		AS 'ErrorMessage',
				'failed'			AS 'return_message';
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationDetail_delete]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
--	EXEC spTransaction_BudgetPreparationDetail_delete 1
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_BudgetPreparationDetail_delete]
	@Id					INT,
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0
			UPDATE [dbo].[Transaction_BudgetPreparationDetail]	 
				SET	
					[Status]	= @_Deleted
				WHERE 
					[DetailId]		= @Id;
			
			-- Return Data of the Update
			SELECT 'success'	AS 'return_message';
	

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationDetail_get]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- exec spTransaction_BudgetPreparationDetail_get 1,2
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_BudgetPreparationDetail_get]
	-- Add the parameters for the stored procedure here
	@BudgetPreparationId bigint = 0,
	@Type		INT	= 0
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Users and its details
			SELECT 
			tbpd.DetailId,tbpd.BudgetPreparationId,tbpd.[Type],tbpd.CategoryId,tbpd.CategoryDescription AS 'Category Description'
			,tbpd.TSEmployeeId,concat(me.Firstname,' ',SUBSTRING(me.Middlename, 1,1),'. ',me.LastName) as [TS Name],tbpd.Detail,tbpd.Reference,
			tbpd.Qty AS 'Quantity',tbpd.Amount
			,tbpd.WeekNo AS 'Week No',tbpd.ChannelId,mc.[Description] AS 'Channel Description', 
				tbpd.Week1 AS 'Week 1' ,
				tbpd.Week2 AS 'Week 2',
				tbpd.Week3 AS 'Week 3',
				tbpd.Week4 AS 'Week 4',
				tbpd.Week5 AS 'Week 5',
				tbpd.Week6 AS 'Week 6',tbpd.Total,tbpd.Remarks
			from Transaction_BudgetPreparationDetail tbpd
			left join Transaction_BudgetPreparation tbp
			on tbpd.BudgetPreparationId =tbp.Id and tbp.[Status] = 1
			left join Masterfile_Channel mc
			on tbpd.ChannelId =mc.Id and mc.[Status] = 1
			left join Masterfile_Employee me
			on tbpd.TSEmployeeId = me.EmployeeIdNo
			where
			tbpd.[Status] = 1 and tbpd.BudgetPreparationId = @BudgetPreparationId and
			tbpd.[Type] = @Type 
			ORDER BY tbpd.DetailId ASC;
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION
		
		-- Return the generic error type	  
		SELECT	ERROR_NUMBER()		AS 'ErrorNumuer',  
				ERROR_SEVERITY()	AS 'ErrorSeverity',  
				ERROR_STATE()		AS 'ErrorState',
				ERROR_PROCEDURE()	AS 'ErrorProcedure',  
				ERROR_LINE()		AS 'ErrorLine',
				ERROR_MESSAGE()		AS 'ErrorMessage',
				'failed'			AS 'return_message';
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationDetail_insert]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
--
-- Description:	<Description,,>
-- EXEC spTransaction_BudgetPreparationDetail_insert 1,1,'sad',1,'sad','sad',1,1.1,1,1,1.1,1.1,1.1,1.1,1.1,1.1,'sad'
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_BudgetPreparationDetail_insert]
	-- Add the parameters for the stored procedure here
	@BudgetPreparationId	Bigint,
	@Type				INT,
	@CategoryId			BIGINT,
	@CategoryDescription	VARCHAR(150),
	@TSEmployeeId			int,
	@Detail				varchar(150),
	@Reference			varchar(50),
	@Qty				int,
	@Amount				DECIMAL(10,2),
	@WeekNo				int,
	@ChannelId			INT,
	@Week1				decimal(10,2),
	@Week2				decimal(10,2),
	@Week3				decimal(10,2),
	@Week4				decimal(10,2),
	@Week5				decimal(10,2),
	@Week6				decimal(10,2),
	@Total				decimal(10,2),
	@Remarks			VARCHAR(150),
	@UserId				BIGINT 
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT,
					@_Status			TINYINT  = 1,		-- Default as 1 as describe as 'Active'
					@Insert	VARCHAR(300),
					@Insert1 VARCHAR (50) = (SELECT Username From Masterfile_User where Id =  @UserId);
						

			SELECT @_Id = Isnull(max(DetailId),0) + 1 FROM [dbo].[Transaction_BudgetPreparationDetail];
					INSERT INTO [dbo].[Transaction_BudgetPreparationDetail]
						(DetailId,BudgetPreparationId,[Type],CategoryId,CategoryDescription,
						TSEmployeeId,Detail,Reference,Qty,Amount,WeekNo,ChannelId,Week1,Week2,Week3
						,Week4,Week5,Week6,Total,Remarks,[Status])
					VALUES
						(@_Id,@BudgetPreparationId,@Type,@CategoryId,@CategoryDescription,@TSEmployeeId
						,@Detail,@Reference,@Qty,@Amount,@WeekNo,@ChannelId,@Week1,@Week2,@Week3,@Week4
						,@Week5,@Week6,@Total,@Remarks, @_Status);
			
					-- Return of the Data type
					SELECT 	@_Id					AS 'DetailId', 
							@BudgetPreparationId	AS 'BudgetPreparationId',
							@Type					AS 'Type',
							@CategoryId				AS 'CategoryId',
							@CategoryDescription	AS 'Category Description',
							@TSEmployeeId			AS 'TSEmployeeId',
							@Detail					AS 'Detail',
							@Reference				AS 'Reference',
							@Qty					AS 'Quantity',
							@Amount					AS 'Amount',
							@WeekNo					AS 'WeekNo',
							@ChannelId				AS 'ChannelId',
							@Week1					AS 'Week 1',
							@Week2					AS 'Week 2',
							@Week3					AS 'Week 3',
							@Week4					AS 'Week 4',
							@Week5					AS 'Week 5',
							@Week6					AS 'Week 6',
							@Remarks				AS 'Remarks',
							'success'					AS 'return_message';
							
			
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationDetail_update]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_BudgetPreparationDetail_update]
	-- Add the parameters for the stored procedure here
	@Id					BIGINT,
	@BudgetPreparationId	    BIGINT,
	@Type				INT,
	@CategoryId			int,
	@CategoryDescription VARCHAR (150),
	@TSEmployeeId		int,
	@Detail				VARCHAR(150),
	@Reference			VARCHAR(50),
	@Qty				INT,
	@Amount				DECIMAL(10,2),
	@WeekNo			INT,
	@ChannelId		INT,
	@Week1			DECIMAL(10,2),
	@Week2			DECIMAL(10,2),
	@Week3			DECIMAL(10,2),
	@Week4			DECIMAL(10,2),
	@Week5			DECIMAL(10,2),
	@Week6			DECIMAL(10,2),
	@Total			DECIMAL(10,2),
	@Remarks			VARCHAR(150)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

				UPDATE [dbo].[Transaction_BudgetPreparationDetail]	 
					SET	
					
						[BudgetPreparationId] =@BudgetPreparationId,
						[Type]		= @Type,
						[CategoryId] =@CategoryId,
						[CategoryDescription]=@CategoryDescription,
						[TSEmployeeId] = @TSEmployeeId,
						[Detail] =@Detail,
						[Reference] =@Reference,
						[Qty] = @Qty,
						[Amount] = @Amount,
						[WeekNo] = @WeekNo,
						[ChannelId] = @ChannelId,
						[Week1] = @Week1,
						[Week2]= @Week2,
						[Week3]= @Week3,
						[Week4] = @Week4,
						[Week5] =@Week5,
						[Week6] =@Week6,
						[Total] = @Total,
						[Remarks]=@Remarks

					WHERE 
						[DetailId]		= @Id;
			
			-- Return Data of the Update
			SELECT	
						@BudgetPreparationId AS  'BudgetPreparationId',
						@Type				AS 'Type',
						@CategoryId			AS 'CategoryId',
						@CategoryDescription	AS 'Category Description',
						@TSEmployeeId	AS 'TSEmployeeId',
						@Detail			AS 'Detail',
						@Reference		AS  'Reference',
						@Qty		AS 'Quantity',
						@Amount		AS 'Amount',
						@WeekNo		AS 'Week No.',
						@ChannelId	AS 'ChannelId',
						@Week1		AS 'Week 1',
						@Week2	AS 'Week 2',
						@Week3	AS 'Week 3',
						@Week4	AS 'Week 4',
						@Week5	AS 'Week 5',
						@Week6	AS 'Week 6',
						@Total	AS 'Total',
					@Remarks				AS 'Remarks',
					'success'	AS 'return_message';
	
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationDetailByCategory]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spTransaction_BudgetPreparationDetailByCategory 3,'reloans'
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_BudgetPreparationDetailByCategory]
	-- Add the parameters for the stored procedure here
	@Id		BIGINT,
	@Description VARCHAR(50)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Users and its details
					
					SELECT tbd.DetailId AS 'Id',
					tbd.BudgetPreparationId,tbd.[Type] ,tbd.CategoryId,tbd.CategoryDescription AS 'Category Description'
					,tbd.TSEmployeeId,tbd.Detail,tbd.Reference,tbd.Qty AS 'Quantity',tbd.Amount AS 'Amount'
					,tbd.WeekNo AS 'Week No',tbd.ChannelId,mh.[Description]
					AS 'Channel Description', tbd.Week1 AS 'Week 1' ,
					tbd.Week2 AS 'Week 2',
					tbd.Week3 AS 'Week 3',
					tbd.Week4 AS 'Week 4',
					tbd.Week5 AS 'Week 5',
					tbd.Week6 AS 'Week 6',tbd.Total,
					tbd.Remarks
					from Transaction_BudgetPreparationDetail tbd
					left join Transaction_BudgetPreparation tb
					on tbd.BudgetPreparationId =tb.Id and tb.[Status] = 1
					left join Masterfile_Channel mh
					on tbd.ChannelId =mh.Id and mh.[Status] = 1
					where
					tbd.BudgetPreparationId =@Id AND
					tbd.CategoryDescription = @Description
					-- tbd.CategoryDescription IN ('reloans','new_loans')  
					AND
					tbd.[Status] = 1 
					ORDER BY CategoryDescription ASC
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION
		
		-- Return the generic error type	  
		SELECT	ERROR_NUMBER()		AS 'ErrorNumuer',  
				ERROR_SEVERITY()	AS 'ErrorSeverity',  
				ERROR_STATE()		AS 'ErrorState',
				ERROR_PROCEDURE()	AS 'ErrorProcedure',  
				ERROR_LINE()		AS 'ErrorLine',
				ERROR_MESSAGE()		AS 'ErrorMessage',
				'failed'			AS 'return_message';
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spTransaction_DailyCashFlow_get]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spTransaction_DailyCashFlow_get 'Outflow',10,2,'2018-06-03'
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_DailyCashFlow_get]
	-- Add the parameters for the stored procedure here
	@Type				VARCHAR(15) = '',
	@BranchId			INT = 0,
	@BudgetPeriodId		BIGINT	= 0,
	@Date				DATE
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Users and its details
			IF(@Type = 'Inflow')
			BEGIN
				select tdc.[Date],tbpdj.CategoryDescription,tbpdj.Detail,tdc.Amount
				from Transaction_DailyCashFlow tdc
				left join Transaction_BudgetPreparationDetail tbpdj
				on tdc.DetailId = tbpdj.DetailId
				where tbpdj.[Type] = 1 and tdc.[Date] = @Date and tdc.DetailId in 
				(Select tbpd.DetailId from Transaction_BudgetPreparationDetail tbpd where tbpd.BudgetPreparationId in
				(select tbp.Id from Transaction_BudgetPreparation tbp where tbp.BudgetPeriodId = @BudgetPeriodId and tbp.BranchId = @BranchId));
			END
		    IF(@Type = 'Outflow')
			BEGIN
				select tdc.[Date],tbpdj.CategoryDescription,tbpdj.Detail,tdc.Amount
				from Transaction_DailyCashFlow tdc
				left join Transaction_BudgetPreparationDetail tbpdj
				on tdc.DetailId = tbpdj.DetailId
				where tbpdj.[Type] = 2 and tbpdj.CategoryId != 2 and tbpdj.CategoryId != 3 and tdc.[Date] = @Date and tdc.DetailId in 
				(Select tbpd.DetailId from Transaction_BudgetPreparationDetail tbpd where tbpd.BudgetPreparationId in
				(select tbp.Id from Transaction_BudgetPreparation tbp where tbp.BudgetPeriodId = @BudgetPeriodId and tbp.BranchId = @BranchId));
			END
		    IF(@Type = 'OutflowNewLoans')
			BEGIN
				select tdc.[Date],tbpdj.CategoryDescription,concat(me.Firstname,' ',SUBSTRING(me.Middlename, 1,1),'. ',me.LastName) as Detail,sum(tdc.Amount) as Amount
				from Transaction_DailyCashFlow tdc
				left join Transaction_BudgetPreparationDetail tbpdj
				on tdc.DetailId = tbpdj.DetailId
				left join Masterfile_Employee me
				on tbpdj.TSEmployeeId = me.EmployeeIdNo
				where tbpdj.[Type] = 2 and tbpdj.CategoryId = 2 and tdc.[Date] = @Date and tdc.DetailId in 
				(Select tbpd.DetailId from Transaction_BudgetPreparationDetail tbpd where tbpd.BudgetPreparationId in
				(select tbp.Id from Transaction_BudgetPreparation tbp where tbp.BudgetPeriodId = @BudgetPeriodId and tbp.BranchId = @BranchId))
				group by tdc.[Date],tbpdj.CategoryDescription,me.Firstname,me.Middlename,me.LastName
			END
		    IF(@Type = 'OutflowReloans')
			BEGIN
				select tdc.[Date],tbpdj.CategoryDescription,concat(me.Firstname,' ',SUBSTRING(me.Middlename, 1,1),'. ',me.LastName) as Detail,sum(tdc.Amount) as Amount
				from Transaction_DailyCashFlow tdc
				left join Transaction_BudgetPreparationDetail tbpdj
				on tdc.DetailId = tbpdj.DetailId
				left join Masterfile_Employee me
				on tbpdj.TSEmployeeId = me.EmployeeIdNo
				where tbpdj.[Type] = 2 and tbpdj.CategoryId = 3 and tdc.[Date] = @Date and tdc.DetailId in 
				(Select tbpd.DetailId from Transaction_BudgetPreparationDetail tbpd where tbpd.BudgetPreparationId in
				(select tbp.Id from Transaction_BudgetPreparation tbp where tbp.BudgetPeriodId = @BudgetPeriodId and tbp.BranchId = @BranchId))
				group by tdc.[Date],tbpdj.CategoryDescription,me.Firstname,me.Middlename,me.LastName
			END
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION
		
		-- Return the generic error type	  
		SELECT	ERROR_NUMBER()		AS 'ErrorNumuer',  
				ERROR_SEVERITY()	AS 'ErrorSeverity',  
				ERROR_STATE()		AS 'ErrorState',
				ERROR_PROCEDURE()	AS 'ErrorProcedure',  
				ERROR_LINE()		AS 'ErrorLine',
				ERROR_MESSAGE()		AS 'ErrorMessage',
				'failed'			AS 'return_message';
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spTransaction_DailyCashFlow_getBudget]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spTransaction_DailyCashFlow_getBudget 'Inflow',10,2
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_DailyCashFlow_getBudget]
	-- Add the parameters for the stored procedure here
	@Type				VARCHAR(15) = '',
	@BranchId			INT = 0,
	@BudgetPeriodId		BIGINT	= 0
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Users and its details
			IF(@Type = 'Inflow')
			BEGIN
				Select tbpd.CategoryDescription,tbpd.Detail,
				tbpd.Week1,tbpd.Week2,tbpd.Week3,tbpd.Week4,tbpd.Week5,tbpd.Week6
				from [RMF_CMT].[dbo].[Transaction_BudgetPreparationDetail] tbpd
				where tbpd.[Type] = 1 and 
				tbpd.BudgetPreparationId in (select tbp.Id from Transaction_BudgetPreparation tbp where tbp.BudgetPeriodId = @BudgetPeriodId and tbp.BranchId = @BranchId);
			END
		    IF(@Type = 'Outflow')
			BEGIN
				Select tbpd.CategoryDescription,tbpd.Detail,
				tbpd.Week1,tbpd.Week2,tbpd.Week3,tbpd.Week4,tbpd.Week5,tbpd.Week6
				from [RMF_CMT].[dbo].[Transaction_BudgetPreparationDetail] tbpd
				where tbpd.[Type] = 2 and tbpd.CategoryId != 2 and tbpd.CategoryId != 3 and 
				tbpd.BudgetPreparationId in (select tbp.Id from Transaction_BudgetPreparation tbp where tbp.BudgetPeriodId = @BudgetPeriodId and tbp.BranchId = @BranchId)
			END
		    IF(@Type = 'OutflowNewLoans')
			BEGIN
				Select tbpd.CategoryDescription,concat(me.Firstname,' ',SUBSTRING(me.Middlename, 1,1),'. ',me.LastName) as Detail,
				sum(tbpd.Week1) as Week1,sum(tbpd.Week2) as Week2,sum(tbpd.Week3) as Week3,
				sum(tbpd.Week4) as Week4,sum(tbpd.Week5) as Week5,sum(tbpd.Week6) as Week6
				from [RMF_CMT].[dbo].[Transaction_BudgetPreparationDetail] tbpd
				left join Masterfile_Employee me
				on tbpd.TSEmployeeId = me.EmployeeIdNo
				where tbpd.[Type] = 2 and tbpd.CategoryId = 2 and 
				tbpd.BudgetPreparationId in (select tbp.Id from Transaction_BudgetPreparation tbp where tbp.BudgetPeriodId = @BudgetPeriodId and tbp.BranchId = @BranchId)
				group by tbpd.CategoryDescription,me.Firstname,me.Middlename,me.LastName
			END
		    IF(@Type = 'OutflowReloans')
			BEGIN
				Select tbpd.CategoryDescription,concat(me.Firstname,' ',SUBSTRING(me.Middlename, 1,1),'. ',me.LastName) as Detail,
				sum(tbpd.Week1) as Week1,sum(tbpd.Week2) as Week2,sum(tbpd.Week3) as Week3,
				sum(tbpd.Week4) as Week4,sum(tbpd.Week5) as Week5,sum(tbpd.Week6) as Week6
				from [RMF_CMT].[dbo].[Transaction_BudgetPreparationDetail] tbpd
				left join Masterfile_Employee me
				on tbpd.TSEmployeeId = me.EmployeeIdNo
				where tbpd.[Type] = 2 and tbpd.CategoryId = 3 and 
				tbpd.BudgetPreparationId in (select tbp.Id from Transaction_BudgetPreparation tbp where tbp.BudgetPeriodId = @BudgetPeriodId and tbp.BranchId = @BranchId)
				group by tbpd.CategoryDescription,me.Firstname,me.Middlename,me.LastName
			END
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION
		
		-- Return the generic error type	  
		SELECT	ERROR_NUMBER()		AS 'ErrorNumuer',  
				ERROR_SEVERITY()	AS 'ErrorSeverity',  
				ERROR_STATE()		AS 'ErrorState',
				ERROR_PROCEDURE()	AS 'ErrorProcedure',  
				ERROR_LINE()		AS 'ErrorLine',
				ERROR_MESSAGE()		AS 'ErrorMessage',
				'failed'			AS 'return_message';
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spTransaction_DailyCashflow_getSetup]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC [spTransaction_DailyCashflow_getSetup] 21,'Inflow',1
CREATE PROCEDURE [dbo].[spTransaction_DailyCashflow_getSetup]
	@BudgetPreparationID	BIGINT,
	@Type				VARCHAR(10),
	@Static				INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

	--	DECLARE
	IF(@Static = 0)
		BEGIN
			SELECT 
				Detailid AS 'Id',
				CategoryId,

				tbpd.CategoryDescription AS 'Description'
			FROM
				[Transaction_BudgetPreparationDetail] tbpd
				INNER  JOIN Masterfile_Category mc 
			 on mc.Id =tbpd.CategoryId and mc.[Status] = 1

			WHERE tbpd.BudgetPreparationId = @BudgetPreparationID
				AND [Type] = @Type
				AND tbpd.[Status] = 1
					
		END
	ELSE
		BEGIN

			IF(@Type = 'Outflow')
				BEGIN
					SELECT 		
						Detailid AS 'Id',
						CategoryId,
						tbpd.CategoryDescription AS 'Description'
					FROM
						[Transaction_BudgetPreparationDetail] tbpd
					WHERE
						tbpd.[Status] = 1
						AND tbpd.BudgetPreparationId = @BudgetPreparationID
						AND tbpd.CategoryId = 0
						AND tbpd.[CategoryDescription] = 'new_loans' OR tbpd.[CategoryDescription] = 'reloans'
				END
			ELSE
				BEGIN
					SELECT 		
						Detailid AS 'Id',
						CategoryId,
						tbpd.CategoryDescription AS 'Description'
					FROM
						[Transaction_BudgetPreparationDetail] tbpd
					WHERE
						tbpd.[Status] = 1
						AND tbpd.BudgetPreparationId = @BudgetPreparationID
						AND tbpd.CategoryId = 0
						AND tbpd.[CategoryDescription] <> 'new_loans' AND tbpd.[CategoryDescription] <> 'reloans'					
				END

			
		END



		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spTransaction_DailyCashflow_getSetupDetails]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC [spTransaction_DailyCashflow_getSetupDetails] 21,0,'collections',4
CREATE PROCEDURE [dbo].[spTransaction_DailyCashflow_getSetupDetails]
	@BudgetPreparationID	BIGINT,
	@CategoryId				INT,
	@Description			VARCHAR(25),
	@Weekno					INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

		SELECT 
		tbpd.DetailId AS 'ID',
		tbpd.CategoryId,
		tbpd.CategoryDescription AS 'Description',
		Concat(tbem.Firstname, ' ', tbem.Middlename ,' ',tbem.LastName) AS 'Employee',
		tbpd.Detail,
		CASE 
            WHEN @Weekno = 1 THEN tbpd.Week1 
			WHEN @Weekno = 2 THEN tbpd.Week2 
			WHEN @Weekno = 3 THEN tbpd.Week3 
			WHEN @Weekno = 4 THEN tbpd.Week4 
			WHEN @Weekno = 5 THEN tbpd.Week5 
			WHEN @Weekno = 6 THEN tbpd.Week6 
            ELSE '0' 
        END  AS 'Amount'
		
		FROM  Transaction_BudgetPreparationDetail tbpd
		LEFT JOIN dbo.Masterfile_Employee tbem
		ON tbpd.TSEmployeeId = tbem.Id
		WHERE
			tbpd.BudgetPreparationId = @BudgetPreparationID
			AND tbpd.CategoryId = @CategoryId
			AND tbpd.CategoryDescription = @Description
			AND tbpd.[Status] = 1
		ORDER BY tbpd.CategoryDescription


		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spTransaction_DailyCashFlow_insert]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	-- =============================================
	-- Author:		<Author,,Description>
	-- Create date: <Create Date,,>
	-- Description:	<Description,,>
	/*
	exec [spTransaction_DailyCashFlow_insert] '2018-06-01','',1,'de'
	*/
	-- =============================================
	CREATE PROCEDURE [dbo].[spTransaction_DailyCashFlow_insert]
		-- Add the parameters for the stored procedure here
		@Date				Date,
		@CategoryId			int,
		@DetailsId			BIGINT,
		@Details			varchar(150),
		@Amount				decimal(10,2),
		@UserId				BIGINT,
		@SetupCategory		VARCHAR(50)
	AS
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION
				-- Variables starting with _Error is for Try/Catch Statement Set data variables return
				DECLARE	@_Id				INT,
						@Insert	VARCHAR(300),
						@Insert1 VARCHAR (50) = (SELECT Username From Masterfile_User where Id =  @UserId);
						
					


				SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Transaction_DailyCashFlow];
						INSERT INTO [dbo].[Transaction_DailyCashFlow]
							(Id,[Date],CategoryId,DetailsId,Details,Amount,SetupCategory)
						VALUES
							(@_Id, @Date,@CategoryId
							,@DetailsId,@Details, @Amount,@SetupCategory);
			
						-- Return of the Data type
						SELECT 	@_Id					AS 'Id', 
								@Date					AS 'Date',	
								@CategoryId				AS 'CategoryId',					
								@DetailsId				AS 'DetailsId',
								@Details				AS 'Details',
								@Amount					AS 'Amount',
								@SetupCategory			AS 'Setup Category',
								'success'					AS 'return_message';
							
									
			COMMIT TRANSACTION
		END TRY

		BEGIN CATCH
			-- Rollback all transaction happen on this Store Procedure
			ROLLBACK TRANSACTION

				BEGIN		  
					SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
							ERROR_SEVERITY()	AS 'ErrorSeverity',  
							ERROR_STATE()		AS 'ErrorState',
							ERROR_PROCEDURE()	AS 'ErrorProcedure',  
							ERROR_LINE()		AS 'ErrorLine',
							ERROR_MESSAGE()		AS 'ErrorMessage',
							'failed'			AS 'return_message';
				END
		END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spTransaction_DailyCashFlow_Open]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Description>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- exec [spTransaction_DailyCashFlow_Open] '2018-06-04',21
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_DailyCashFlow_Open]
	-- Add the parameters for the stored procedure here
	@Current DATE,
	@BudgetPreparationDetail BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			
				SELECT 
					tdf.Id,
					tdf.CategoryId,
					tdf.CategoryDescription AS 'Description',
					tdf.DetailsId,
					tdf.Details,
					--[Type],
					[Date],
					
					Amount
					 
				FROM
					Transaction_DailyCashFlow tdf
				--	INNER JOIN Masterfile_Category mc
				--	on mc.Id =tdf.CategoryId or tdf.CategoryId = 0
			

				WHERE 					
					 tdf.[Date] =  @Current AND tdf.DetailsId = @BudgetPreparationDetail
				
			ORDER BY  tdf.[Date]
	
									
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spTransaction_DailyCashflow_openbySetup]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,> 
-- EXEC spMasterfile_Branch_get 2
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_DailyCashflow_openbySetup]
	-- Add the parameters for the stored procedure here
	@BranchId		INT	= 0,
	@Day			INT = 0
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
		
		
			SELECT u.[Id] AS 'UId',
					[CategoryId],
					mc.[Description] AS 'CategoryDescription',
					[Type],
					[BranchId],
					[BranchCode],
					[BranchId],
					[SetUpAmount],
					[ChartOfAccountId],
					Code  AS 'COACode',
					mca.[Description] AS 'COADescription',
					u.[Remarks],
					[ChannelId],
					mch.[Description] AS 'ChannelDescription',
					[Day],
					TableName FROM (
			SELECT [Id]
				  ,[Description]
				  ,[CategoryId]
				  ,[BranchId]
				  ,[SetUpAmount]
				  ,[ChartOfAccountId]
				  ,[Remarks]
				  ,[ChannelId]
				  ,[Day]
				  ,'OtherReceipt' AS 'TableName'
			  FROM [RMF_CMT].[dbo].[Masterfile_OtherReceiptDetail] 


			  UNION
			  SELECT [Id]
				  ,[Description]
				  ,[CategoryId]
				  ,[BranchId]
				  ,[SetUpAmount]
				  ,[ChartOfAccountId]
				  ,[Remarks]
				  ,[ChannelId]
				  ,[Day]
				  ,'OtherDisbursement' AS 'TableName'
					FROM [RMF_CMT].[dbo].[Masterfile_OtherDisbursementDetail] 

			) AS u
			INNER JOIN Masterfile_Branch mb 
						on mb.Id =u.[BranchId]  and mb.[Status] = 1
			INNER JOIN Masterfile_Category mc
						on mc.Id =u.CategoryId  and mc.[Status] = 1
			INNER JOIN Masterfile_ChartOfAccount mca
						on mca.Id =u.ChartOfAccountId  and mca.[Status] = 1
			INNER JOIN Masterfile_Channel mch
						on mch.Id =u.ChannelId  and mch.[Status] = 1
			WHERE 
				BranchId = @BranchId AND [Day] = @Day
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION
		
		-- Return the generic error type	  
		SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
				ERROR_SEVERITY()	AS 'ErrorSeverity',  
				ERROR_STATE()		AS 'ErrorState',
				ERROR_PROCEDURE()	AS 'ErrorProcedure',  
				ERROR_LINE()		AS 'ErrorLine',
				ERROR_MESSAGE()		AS 'ErrorMessage',
				'failed'			AS 'return_message';
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spTransaction_DailyCashFlow_update]    Script Date: 9/7/2018 10:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_DailyCashFlow_update]
	-- Add the parameters for the stored procedure here
	@Id					BIGINT,
	@Date				DATE,
	@CategoryId			INT,
	@DetailsId				BIGINT,
	@Details				VARCHAR(150),
	@Amount			DECIMAL(10,2),
	@SetupCategory	VARCHAR(50)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

				UPDATE [dbo].[Transaction_DailyCashFlow]	 
					SET	
					[Date] =@Date,
					[CategoryId] =@CategoryId,
					[DetailsId] =@DetailsId,
					[Details] =@Details,
					[Amount] = @Amount,
					[SetupCategory] =@SetupCategory
					WHERE 
						[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT	
					@Date AS 'Date',
					@CategoryId	AS 'CategoryId',
					@DetailsId	 AS 'DetailsId',
					@Details		AS 'Details',
					@Amount		AS 'Amount',
					@SetupCategory	AS 'Setup Category',
					'success'	AS 'return_message';
	
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION

			BEGIN		  
				SELECT	ERROR_NUMBER()		AS 'ErrorNumber',  
						ERROR_SEVERITY()	AS 'ErrorSeverity',  
						ERROR_STATE()		AS 'ErrorState',
						ERROR_PROCEDURE()	AS 'ErrorProcedure',  
						ERROR_LINE()		AS 'ErrorLine',
						ERROR_MESSAGE()		AS 'ErrorMessage',
						'failed'			AS 'return_message';
			END
	END CATCH
END
GO
USE [master]
GO
ALTER DATABASE [RMF_CMT] SET  READ_WRITE 
GO
