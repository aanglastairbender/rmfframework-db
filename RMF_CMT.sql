USE [master]
GO
/****** Object:  Database [RMF_CMT]    Script Date: 8/25/2018 10:59:13 AM ******/
CREATE DATABASE [RMF_CMT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RMF_CMT', FILENAME = N'G:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\RMF_CMT.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RMF_CMT_log', FILENAME = N'G:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\RMF_CMT_log.ldf' , SIZE = 63424KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[Audit_Trail]    Script Date: 8/25/2018 10:59:15 AM ******/
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
/****** Object:  Table [dbo].[Masterfile_AccessRights]    Script Date: 8/25/2018 10:59:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masterfile_AccessRights](
	[Id] [bigint] NOT NULL,
	[RoleId] [int] NOT NULL,
	[PageActionId] [int] NOT NULL,
	[IsChecked] [tinyint] NULL,
 CONSTRAINT [PK_Masterfile_AccessRights] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masterfile_Area]    Script Date: 8/25/2018 10:59:16 AM ******/
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
/****** Object:  Table [dbo].[Masterfile_Branch]    Script Date: 8/25/2018 10:59:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masterfile_Branch](
	[Id] [int] NOT NULL,
	[Name] [varchar](100) NULL,
	[AreaId] [int] NULL,
	[Address] [varchar](150) NOT NULL,
	[Latitude] [decimal](8, 6) NULL,
	[Longitude] [decimal](9, 6) NULL,
	[Remarks] [varchar](150) NULL,
	[Status] [tinyint] NOT NULL,
	[BranchCode] [varchar](50) NULL,
 CONSTRAINT [PK_Masterfile_Branch] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masterfile_Category]    Script Date: 8/25/2018 10:59:16 AM ******/
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
/****** Object:  Table [dbo].[Masterfile_Channel]    Script Date: 8/25/2018 10:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masterfile_Channel](
	[Id] [int] NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[Remarks] [varchar](150) NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Masterfile_Channel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masterfile_ChartOfAccount]    Script Date: 8/25/2018 10:59:17 AM ******/
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
/****** Object:  Table [dbo].[Masterfile_District]    Script Date: 8/25/2018 10:59:17 AM ******/
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
/****** Object:  Table [dbo].[Masterfile_Employee]    Script Date: 8/25/2018 10:59:17 AM ******/
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
	[PositionId] [int] NOT NULL,
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
/****** Object:  Table [dbo].[Masterfile_Function]    Script Date: 8/25/2018 10:59:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masterfile_Function](
	[Id] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Status] [tinyint] NOT NULL,
	[Remarks] [varchar](150) NULL,
 CONSTRAINT [PK_Masterfile_Function] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masterfile_OtherDisbursementDetail]    Script Date: 8/25/2018 10:59:18 AM ******/
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
	[ChartOfAccountId] [int] NOT NULL,
	[Remarks] [varchar](150) NULL,
	[Status] [tinyint] NOT NULL,
	[ChannelId] [int] NOT NULL,
	[Day] [int] NULL,
 CONSTRAINT [PK_Masterfile_OtherDisbursementDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masterfile_OtherReceiptDetail]    Script Date: 8/25/2018 10:59:18 AM ******/
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
	[ChartOfAccountId] [int] NOT NULL,
	[Remarks] [varchar](150) NULL,
	[Status] [tinyint] NOT NULL,
	[ChannelId] [int] NOT NULL,
	[Day] [int] NULL,
 CONSTRAINT [PK_Masterfile_OtherReceiptDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masterfile_PageAction]    Script Date: 8/25/2018 10:59:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masterfile_PageAction](
	[Id] [int] NOT NULL,
	[SystemRightsId] [int] NOT NULL,
	[FunctionId] [int] NOT NULL,
	[Remarks] [varchar](150) NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Masterfile_PageAction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masterfile_Position]    Script Date: 8/25/2018 10:59:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masterfile_Position](
	[Id] [int] NOT NULL,
	[Code] [varchar](10) NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[Remarks] [varchar](150) NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Masterfile_Position] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masterfile_Region]    Script Date: 8/25/2018 10:59:18 AM ******/
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
/****** Object:  Table [dbo].[Masterfile_Role]    Script Date: 8/25/2018 10:59:19 AM ******/
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
/****** Object:  Table [dbo].[Masterfile_SystemRights]    Script Date: 8/25/2018 10:59:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masterfile_SystemRights](
	[Id] [int] NOT NULL,
	[Module] [varchar](50) NOT NULL,
	[Page] [varchar](100) NOT NULL,
	[PageSeqNo] [int] NOT NULL,
	[RightsSeqNo] [int] NOT NULL,
	[System] [varchar](20) NULL,
 CONSTRAINT [PK_Masterfile_SystemRights] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masterfile_User]    Script Date: 8/25/2018 10:59:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masterfile_User](
	[Id] [bigint] NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[RoleId] [int] NOT NULL,
	[EmployeeId] [bigint] NOT NULL,
	[Remarks] [varchar](150) NULL,
	[Status] [tinyint] NOT NULL,
	[ActiveDirectoryName] [varchar](80) NULL,
 CONSTRAINT [PK_Masterfile_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction_BudgetPeriod]    Script Date: 8/25/2018 10:59:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_BudgetPeriod](
	[Id] [bigint] NOT NULL,
	[Month] [varchar](10) NOT NULL,
	[Year] [int] NOT NULL,
	[DateOpen] [date] NULL,
	[DateClosed] [date] NULL,
	[TotalInflowBudget] [decimal](10, 2) NULL,
	[TotalInflowActual] [decimal](10, 2) NULL,
	[TotalInflowVariance] [decimal](10, 2) NULL,
	[TotalOutflowBudget] [decimal](10, 2) NULL,
	[TotalOutflowActual] [decimal](10, 2) NULL,
	[TotalOutflowVariance] [decimal](10, 2) NULL,
	[OpenBy] [bigint] NULL,
	[ClosedBy] [bigint] NULL,
	[OpenRemarks] [varchar](150) NULL,
	[ClosedRemarks] [varchar](150) NULL,
	[Status] [tinyint] NOT NULL,
	[PeriodStatus] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Transaction_BudgetPeriod] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction_BudgetPreparation]    Script Date: 8/25/2018 10:59:19 AM ******/
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
	[UserId] [bigint] NOT NULL,
	[Remarks] [varchar](150) NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Transaction_BudgetPreparation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction_BudgetPreparationCurrent]    Script Date: 8/25/2018 10:59:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_BudgetPreparationCurrent](
	[Id] [bigint] NOT NULL,
	[BudgetPeriodId] [bigint] NOT NULL,
	[BranchId] [int] NOT NULL,
	[TotalInflowBudget] [decimal](10, 2) NULL,
	[TotalInflowActual] [decimal](10, 2) NULL,
	[TotalInflowVariance] [decimal](10, 2) NULL,
	[TotaloutflowBudget] [decimal](10, 2) NULL,
	[TotaloutflowActual] [decimal](10, 2) NULL,
	[TotaloutflowVariance] [decimal](10, 2) NULL,
	[UserId] [bigint] NOT NULL,
	[Remarks] [varchar](150) NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction_BudgetPreparationDetail]    Script Date: 8/25/2018 10:59:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_BudgetPreparationDetail](
	[DetailId] [bigint] NOT NULL,
	[BudgetPreparationId] [bigint] NOT NULL,
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
	[Total] [decimal](10, 2) NULL,
	[Remarks] [varchar](150) NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Transaction_BudgetPreparationDetail] PRIMARY KEY CLUSTERED 
(
	[DetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction_BudgetPreparationDetailCurrent]    Script Date: 8/25/2018 10:59:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_BudgetPreparationDetailCurrent](
	[DetailId] [bigint] NOT NULL,
	[BudgetPreparationId] [bigint] NOT NULL,
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
	[Total] [decimal](10, 2) NULL,
	[Remarks] [varchar](150) NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Transaction_BudgetPreparationDetailCurrent] PRIMARY KEY CLUSTERED 
(
	[DetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction_DailyCashFlow]    Script Date: 8/25/2018 10:59:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_DailyCashFlow](
	[Id] [bigint] NOT NULL,
	[Date] [date] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CategoryDescription] [varchar](150) NULL,
	[DetailsId] [bigint] NOT NULL,
	[Details] [varchar](150) NULL,
	[Amount] [decimal](10, 2) NULL,
 CONSTRAINT [PK_Transaction_DailyCashFlow] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
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
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (1, 1, 1, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (2, 1, 2, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (3, 1, 3, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (4, 1, 4, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (5, 1, 5, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (6, 1, 6, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (7, 1, 7, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (8, 1, 8, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (9, 1, 9, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (10, 1, 10, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (11, 1, 11, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (12, 1, 12, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (13, 1, 13, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (14, 1, 14, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (15, 1, 15, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (16, 1, 16, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (17, 1, 17, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (18, 1, 18, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (19, 1, 19, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (20, 1, 20, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (21, 1, 21, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (22, 1, 22, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (23, 1, 23, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (24, 1, 24, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (25, 1, 25, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (26, 1, 26, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (27, 1, 27, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (28, 1, 28, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (29, 1, 29, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (30, 1, 30, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (31, 1, 31, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (32, 1, 32, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (33, 1, 33, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (34, 1, 34, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (35, 1, 35, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (36, 1, 36, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (37, 1, 37, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (38, 1, 38, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (39, 1, 39, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (40, 1, 40, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (41, 1, 41, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (42, 1, 42, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (43, 1, 43, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (44, 1, 44, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (45, 1, 45, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (46, 1, 46, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (47, 1, 47, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (48, 1, 48, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (49, 1, 49, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (50, 1, 50, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (51, 1, 51, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (52, 1, 52, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (53, 1, 53, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (54, 1, 54, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (55, 1, 55, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (56, 1, 56, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (57, 1, 57, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (58, 1, 58, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (59, 1, 59, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (60, 1, 60, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (61, 1, 61, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (62, 1, 62, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (63, 1, 63, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (64, 1, 64, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (65, 1, 65, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (66, 1, 66, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (67, 1, 67, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (68, 2, 1, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (69, 2, 2, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (70, 2, 3, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (71, 2, 4, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (72, 2, 5, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (73, 2, 6, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (74, 2, 7, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (75, 2, 8, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (76, 2, 9, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (77, 2, 10, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (78, 2, 11, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (79, 2, 12, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (80, 2, 13, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (81, 2, 14, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (82, 2, 15, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (83, 2, 16, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (84, 2, 17, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (85, 2, 18, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (86, 2, 19, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (87, 2, 20, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (88, 2, 21, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (89, 2, 22, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (90, 2, 23, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (91, 2, 24, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (92, 2, 25, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (93, 2, 26, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (94, 2, 27, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (95, 2, 28, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (96, 2, 29, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (97, 2, 30, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (98, 2, 31, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (99, 2, 32, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (100, 2, 33, 1)
GO
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (101, 2, 34, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (102, 2, 35, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (103, 2, 36, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (104, 2, 37, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (105, 2, 38, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (106, 2, 39, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (107, 2, 40, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (108, 2, 41, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (109, 2, 42, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (110, 2, 43, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (111, 2, 44, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (112, 2, 45, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (113, 2, 46, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (114, 2, 47, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (115, 2, 48, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (116, 2, 49, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (117, 2, 50, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (118, 2, 51, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (119, 2, 52, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (120, 2, 53, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (121, 2, 54, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (122, 2, 55, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (123, 2, 56, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (124, 2, 57, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (125, 2, 58, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (126, 2, 59, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (127, 2, 60, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (128, 2, 61, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (129, 2, 62, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (130, 2, 63, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (131, 2, 64, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (132, 2, 65, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (133, 2, 66, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (134, 2, 67, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (135, 3, 1, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (136, 3, 2, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (137, 3, 3, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (138, 3, 4, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (139, 3, 5, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (140, 3, 5, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (141, 3, 6, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (142, 3, 7, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (143, 3, 8, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (144, 3, 9, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (145, 3, 10, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (146, 3, 11, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (147, 3, 12, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (148, 3, 13, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (149, 3, 14, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (150, 3, 15, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (151, 3, 16, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (152, 3, 17, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (153, 3, 18, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (154, 3, 19, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (155, 3, 20, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (156, 3, 21, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (157, 3, 22, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (158, 3, 23, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (159, 3, 24, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (160, 3, 25, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (161, 3, 26, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (162, 3, 27, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (163, 3, 28, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (164, 3, 29, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (165, 3, 30, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (166, 3, 31, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (167, 3, 32, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (168, 3, 33, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (169, 3, 34, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (170, 3, 35, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (171, 3, 36, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (172, 3, 37, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (173, 3, 38, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (174, 3, 39, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (175, 3, 40, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (176, 3, 41, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (177, 3, 42, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (178, 3, 43, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (179, 3, 44, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (180, 3, 45, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (181, 3, 46, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (182, 3, 47, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (183, 3, 48, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (184, 3, 49, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (185, 3, 50, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (186, 3, 51, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (187, 3, 52, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (188, 3, 53, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (189, 3, 54, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (190, 3, 55, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (191, 3, 56, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (192, 3, 57, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (193, 3, 58, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (194, 3, 59, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (195, 3, 60, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (196, 3, 61, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (197, 3, 62, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (198, 3, 63, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (199, 3, 64, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (200, 3, 65, 1)
GO
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (201, 3, 66, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (202, 3, 67, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (203, 4, 1, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (204, 4, 2, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (205, 4, 3, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (206, 4, 4, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (207, 4, 5, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (208, 4, 6, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (209, 4, 7, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (210, 4, 8, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (211, 4, 9, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (212, 4, 10, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (213, 4, 11, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (214, 4, 12, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (215, 4, 13, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (216, 4, 14, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (217, 4, 15, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (218, 4, 16, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (219, 4, 17, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (220, 4, 18, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (221, 4, 19, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (222, 4, 20, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (223, 4, 21, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (224, 4, 22, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (225, 4, 23, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (226, 4, 24, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (227, 4, 25, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (228, 4, 26, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (229, 4, 27, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (230, 4, 28, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (231, 4, 29, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (232, 4, 30, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (233, 4, 31, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (234, 4, 32, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (235, 4, 33, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (236, 4, 34, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (237, 4, 35, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (238, 4, 36, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (239, 4, 37, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (240, 4, 38, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (241, 4, 39, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (242, 4, 40, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (243, 4, 41, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (244, 4, 42, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (245, 4, 43, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (246, 4, 44, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (247, 4, 45, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (248, 4, 46, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (249, 4, 47, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (250, 4, 48, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (251, 4, 49, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (252, 4, 50, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (253, 4, 51, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (254, 4, 52, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (255, 4, 53, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (256, 4, 54, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (257, 4, 55, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (258, 4, 56, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (259, 4, 57, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (260, 4, 58, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (261, 4, 59, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (262, 4, 60, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (263, 4, 61, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (264, 4, 62, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (265, 4, 63, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (266, 4, 64, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (267, 4, 65, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (268, 4, 66, 1)
INSERT [dbo].[Masterfile_AccessRights] ([Id], [RoleId], [PageActionId], [IsChecked]) VALUES (269, 4, 67, 1)
INSERT [dbo].[Masterfile_Area] ([Id], [Name], [DistrictId], [Remarks], [Status]) VALUES (1, N'England', 2, N'', 1)
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
INSERT [dbo].[Masterfile_Area] ([Id], [Name], [DistrictId], [Remarks], [Status]) VALUES (18, N'Poblacion3', 1, N'', 1)
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (1, N'Kamote', 2, N'Que', CAST(12.123000 AS Decimal(8, 6)), CAST(12.123123 AS Decimal(9, 6)), N'asdasd', 1, N'003')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (2, N'PALOMPON', 1, N'Taft Street, Central 1, Palompon, Leyte', CAST(11.051504 AS Decimal(8, 6)), CAST(124.387619 AS Decimal(9, 6)), N'', 1, N'004')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (3, N'mary', 1, N'sample', CAST(12.112100 AS Decimal(8, 6)), CAST(12.123000 AS Decimal(9, 6)), N'sample', 1, N'001')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (4, N'Sibonga', 4, N'addsdasd', CAST(12.100000 AS Decimal(8, 6)), CAST(12.100000 AS Decimal(9, 6)), N'assd', 1, N'003')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (5, N'sadasdasdasdasdasdasd', 1, N'sad', CAST(10.100000 AS Decimal(8, 6)), CAST(10.100000 AS Decimal(9, 6)), N'', 0, N'1234')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (6, N'sadasd', 1, N'sadasd', CAST(10.100000 AS Decimal(8, 6)), CAST(10.100000 AS Decimal(9, 6)), N'', 0, N'1231')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (7, N'ABUYOG', 1, N'Abuyog Leyte', CAST(10.746761 AS Decimal(8, 6)), CAST(125.010797 AS Decimal(9, 6)), N'', 1, N'036')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (8, N'ALANG-ALANG', 1, N'Alang-alang Leyte', CAST(11.206273 AS Decimal(8, 6)), CAST(124.848479 AS Decimal(9, 6)), N'', 1, N'061')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (9, N'ALICIA', 1, N'Alicia Bohol', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'087')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (10, N'ARGAO', 1, N'Baha-baha Tulic, National Highway, Argao, Cebu', CAST(9.872480 AS Decimal(8, 6)), CAST(123.596208 AS Decimal(9, 6)), N'', 1, N'002')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (11, N'ASTURIAS', 1, N'E Alonzo St., Poblacion Asturias', CAST(10.568154 AS Decimal(8, 6)), CAST(123.716951 AS Decimal(9, 6)), N'', 1, N'026')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (12, N'BACOLOD', 1, N'Bacolod, Negros Occidental', CAST(10.668371 AS Decimal(8, 6)), CAST(122.958310 AS Decimal(9, 6)), N'', 1, N'059')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (13, N'BAGO', 1, N'Bago City, Negros Occidental', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'075')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (14, N'BAIS', 1, N'Bais dumaguete', CAST(9.591839 AS Decimal(8, 6)), CAST(123.120945 AS Decimal(9, 6)), N'', 1, N'033')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (15, N'BALAMBAN', 1, N'E Alonzo St., Poblacion Asturias, Cebu', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'081')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (16, N'BANTAYAN', 1, N'Binaobao Bantayan Island, Cebu', CAST(11.169278 AS Decimal(8, 6)), CAST(123.717545 AS Decimal(9, 6)), N'', 0, N'008')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (17, N'BARILI', 1, N'Barili, Cebu', CAST(10.115793 AS Decimal(8, 6)), CAST(123.507895 AS Decimal(9, 6)), N'', 1, N'057')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (18, N'BAROTAC NUEVO', 1, N'Barotac Nuevo Ilo-Ilo', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'113')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (19, N'BAROTAC VIEJO', 1, N'Barotac Viejo Ilo-Ilo', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'114')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (20, N'bARUGO', 1, N'San Miguel, Leyte', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'067')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (21, N'BASEY', 1, N'Basey Samar', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'103')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (22, N'BATO', 1, N'Lopez Jaena St., Tinago, Bato, Leyte', CAST(10.324720 AS Decimal(8, 6)), CAST(124.790719 AS Decimal(9, 6)), N'', 1, N'019')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (23, N'BAYAWAN', 1, N'Bayawan Negros', CAST(9.364387 AS Decimal(8, 6)), CAST(122.806549 AS Decimal(9, 6)), N'', 1, N'045')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (24, N'BAYBAY', 1, N'30 de Diciembre St., Baybay City, Leyte', CAST(10.671137 AS Decimal(8, 6)), CAST(124.805706 AS Decimal(9, 6)), N'', 1, N'022')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (25, N'BAYBAY 2', 1, N'Baybay city, Leyte', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'107')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (26, N'BINALBAGAN', 1, N'Binalbagan Negros', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'090')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (27, N'BOGO', 1, N'Door 1 North Homes Pensione House, Pelaez Street, Bogo City, Cebu', CAST(11.051645 AS Decimal(8, 6)), CAST(124.007815 AS Decimal(9, 6)), N'', 1, N'006')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (28, N'BORBON', 1, N'Borbon Cebu', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'082')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (29, N'BUFFER BRANCH', 1, N'asdqwe', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'888')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (30, N'BURAUEN-LEYTE', 1, N'Dagami, Leyte', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'071')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (31, N'CADIZ', 1, N'Cadiz, Negros Occidental', CAST(10.955448 AS Decimal(8, 6)), CAST(123.303625 AS Decimal(9, 6)), N'', 1, N'054')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (32, N'CADIZ 2', 1, N'juan luna st., querosan, brgy. zone 4, cadiz city', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'079')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (33, N'CALAPE', 1, N'Calape Bohol', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'089')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (34, N'CALBAYOG', 1, N'Calbayog Samar', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'101')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (35, N'CAMOTES', 1, N'Eastern Poblacion, Poro Camotes, Cebu', CAST(10.702887 AS Decimal(8, 6)), CAST(124.412323 AS Decimal(9, 6)), N'', 1, N'009')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (36, N'CANLAON', 1, N'Canlaon Negros', CAST(10.379782 AS Decimal(8, 6)), CAST(123.234716 AS Decimal(9, 6)), N'', 1, N'051')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (37, N'CAPOOCAN ', 1, N'Capoocan  Leyte', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'085')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (38, N'CARIGARA', 1, N'Corner Real & Esperanza St. Brgy. Baybay, Carigara, Leyte', CAST(11.300674 AS Decimal(8, 6)), CAST(124.690376 AS Decimal(9, 6)), N'', 1, N'015')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (39, N'CARMEN', 1, N'Old Municipal Building Poblacion Sur, Carmen, Bohol', CAST(9.822743 AS Decimal(8, 6)), CAST(124.196567 AS Decimal(9, 6)), N'', 1, N'012')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (40, N'Catarman', 1, N'Catarman Samar', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'100')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (41, N'CATBALOGAN', 1, N'Catbalogan Samar', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'102')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (42, N'CATIGBIAN', 1, N'Catigbian, Bohol', CAST(9.850096 AS Decimal(8, 6)), CAST(123.998986 AS Decimal(9, 6)), N'', 1, N'074')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (43, N'CAUAYAN', 1, N'Cauayan Negros', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'095')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (44, N'CEBU CITY', 1, N'Bonifacio St., Cebu City', CAST(10.300401 AS Decimal(8, 6)), CAST(123.904044 AS Decimal(9, 6)), N'', 1, N'005')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (45, N'CEBU CITY 2', 1, N'bonifacio St., ', CAST(10.300401 AS Decimal(8, 6)), CAST(123.904044 AS Decimal(9, 6)), N'', 1, N'068')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (46, N'CEBU CITY 3', 1, N'Bonifacio St., ', CAST(10.300358 AS Decimal(8, 6)), CAST(123.904076 AS Decimal(9, 6)), N'', 1, N'069')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (47, N'CLARIN', 1, N'Clarin Bohol', CAST(9.960274 AS Decimal(8, 6)), CAST(124.023689 AS Decimal(9, 6)), N'', 1, N'041')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (48, N'COMPOSTELA', 1, N'compostela, Cebu', CAST(10.454644 AS Decimal(8, 6)), CAST(124.013302 AS Decimal(9, 6)), N'', 1, N'056')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (49, N'CONSOLACION', 1, N'Consolacion, Cebu', CAST(10.380398 AS Decimal(8, 6)), CAST(123.967489 AS Decimal(9, 6)), N'', 1, N'055')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (50, N'DAAN BANTAYAN', 1, N'Daan Bantayan cebu', CAST(11.248216 AS Decimal(8, 6)), CAST(124.005354 AS Decimal(9, 6)), N'', 1, N'039')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (51, N'DALAGUETE', 1, N'dalaguete, cebu', CAST(9.760017 AS Decimal(8, 6)), CAST(123.533401 AS Decimal(9, 6)), N'', 1, N'065')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (52, N'DANAO', 1, N'Poblacion, Danao, Cebu', CAST(10.522425 AS Decimal(8, 6)), CAST(124.028055 AS Decimal(9, 6)), N'', 1, N'020')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (53, N'Dimiao', 1, N'Dimiao Bohol', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'097')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (54, N'DULAG', 1, N'Dulag, Leyte', CAST(10.959203 AS Decimal(8, 6)), CAST(125.006313 AS Decimal(9, 6)), N'', 1, N'013')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (55, N'DULAG 2', 1, N'Dulag, Leyte', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'084')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (56, N'DUMAGUETE', 1, N'Dumaguete Negros Oriental', CAST(9.276987 AS Decimal(8, 6)), CAST(123.293113 AS Decimal(9, 6)), N'', 1, N'048')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (57, N'DUMANJUG', 1, N' Zelliot Bldg., Poblacion, Dumanjug, Cebu', CAST(10.056791 AS Decimal(8, 6)), CAST(123.437385 AS Decimal(9, 6)), N'', 1, N'007')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (58, N'ESCALANTE', 1, N'Escalante, Negros Occidental', CAST(10.838532 AS Decimal(8, 6)), CAST(123.503842 AS Decimal(9, 6)), N'', 1, N'053')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (59, N'GETAFE', 1, N'Getafe Bohol', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'088')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (60, N'GUIHULNGAN', 1, N'Guihulngan Negros Oriental ', CAST(10.115931 AS Decimal(8, 6)), CAST(123.269668 AS Decimal(9, 6)), N'', 1, N'050')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (61, N'GUINDULMAN', 1, N'Guindulman Bohol', CAST(9.765547 AS Decimal(8, 6)), CAST(124.492817 AS Decimal(9, 6)), N'', 1, N'035')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (62, N'HEAD OFFICE', 1, N'35 Lopez Jaena Street, CEBU City', CAST(10.299698 AS Decimal(8, 6)), CAST(123.904779 AS Decimal(9, 6)), N'', 1, N'000')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (63, N'HILONGOS', 1, N'Corner CV Alcuino St and Flores St., Central Poblacion, Hilongos, Leyte', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'118')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (64, N'HIMAMAYLAN ', 1, N'Himamaylan Negros', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'092')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (65, N'HINIGARAN', 1, N'Hinigaran Negros', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'091')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (66, N'HINUNANGAN', 1, N'Brgy. Poblacion, Hinunangan, Southern Leyte', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'120')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (67, N'INABANGA', 1, N'Inabanga bohol', CAST(10.032018 AS Decimal(8, 6)), CAST(124.067207 AS Decimal(9, 6)), N'', 1, N'034')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (68, N'JAGNA', 1, N'103 Captain Goyo Casenas St. Poblacion Jagna, Bohol', CAST(9.651227 AS Decimal(8, 6)), CAST(124.367862 AS Decimal(9, 6)), N'', 1, N'025')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (69, N'JIMALALUD', 1, N'Jimalalud Negros Oriental', CAST(9.980195 AS Decimal(8, 6)), CAST(123.201310 AS Decimal(9, 6)), N'', 1, N'049')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (70, N'KABANKALAN', 1, N'Kabankalan Negros', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'093')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (71, N'LA CARLOTA', 1, N'La Carlota City, Negros Occidental, Western Visayas', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'076')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (72, N'LAPU-LAPU', 1, N'Lapu-lapu', CAST(10.292440 AS Decimal(8, 6)), CAST(123.966311 AS Decimal(9, 6)), N'', 1, N'037')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (73, N'LEGANES', 1, N'Leganes Ilo-Ilo', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'115')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (74, N'LILOAN-LEYTE', 1, N'liloan, so. leyte', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'063')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (75, N'LOAY', 1, N'Loay Bohol', CAST(9.614648 AS Decimal(8, 6)), CAST(124.022916 AS Decimal(9, 6)), N'', 1, N'044')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (76, N'LOON', 1, N'Loon BOHOL', CAST(9.795920 AS Decimal(8, 6)), CAST(123.791820 AS Decimal(9, 6)), N'', 1, N'043')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (77, N'MAASIN-LEYTE', 1, N'Maasin City, Leyte', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'072')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (78, N'MABINAY', 1, N'Mabinay Negros', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'094')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (79, N'MANDAUE', 1, N'Square One Commercial Complex, Second Floor, Tipolo, Mandaue City. ', CAST(10.325615 AS Decimal(8, 6)), CAST(123.926519 AS Decimal(9, 6)), N'', 1, N'029')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (80, N'McArthur', 1, N'McArthurLeyte', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'077')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (81, N'MIAG-AO', 1, N'Miag-Ao ilo-ilo', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'108')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (82, N'MINGLANILLA', 1, N'Minglanilla Cebu', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'080')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (83, N'MOALBOAL', 1, N'Moalboal', CAST(9.935662 AS Decimal(8, 6)), CAST(123.393915 AS Decimal(9, 6)), N'', 1, N'032')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (84, N'NAGA', 1, N'Magtalisay Tuyan, City of Naga, Cebu', CAST(10.227283 AS Decimal(8, 6)), CAST(123.766537 AS Decimal(9, 6)), N'', 1, N'021')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (85, N'NAVAL', 1, N'Brgy. Padre Inocentes Garcia, Naval, Biliran', CAST(11.564619 AS Decimal(8, 6)), CAST(124.402090 AS Decimal(9, 6)), N'', 1, N'014')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (86, N'NAVAL 2', 1, N'Brgy. Padre Inocentes Garcia, Naval, Biliran', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'105')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (87, N'Ormoc 1', 1, N'Brgy. Don Felipe Larrazabal, Ormoc City', CAST(11.011136 AS Decimal(8, 6)), CAST(124.606397 AS Decimal(9, 6)), N'', 1, N'024')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (88, N'ORMOC 2', 1, N'Hermosilla Drive,  Zone 2   Brgy. District 18, Ormoc City, Leyte', CAST(11.010446 AS Decimal(8, 6)), CAST(124.611187 AS Decimal(9, 6)), N'', 1, N'017')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (89, N'ORMOC 3', 1, N'Ormoc City, Leyte', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'106')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (90, N'OSLOB', 1, N'oslob, cebu', CAST(9.522310 AS Decimal(8, 6)), CAST(123.432847 AS Decimal(9, 6)), N'', 1, N'066')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (91, N'OTON', 1, N'Otton Ilo-Ilo', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'109')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (92, N'PADRE BURGOS', 1, N'Sta. Sofia, Padre Burgos, Southern Leyte', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'119')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (93, N'PALO', 1, N'Palo, Leyte', CAST(11.160324 AS Decimal(8, 6)), CAST(124.990651 AS Decimal(9, 6)), N'', 1, N'016')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (94, N'PANGLAO', 1, N'Casa De Maria Bldg., Danao, Panglao, Bohol', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'117')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (95, N'PASSI ', 1, N'Passi Ilo-Ilo', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'110')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (96, N'PINAMUNGAJAN', 1, N'pinamungajan, Cebu', CAST(10.270407 AS Decimal(8, 6)), CAST(123.583749 AS Decimal(9, 6)), N'', 1, N'062')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (97, N'POTOTAN', 1, N'Pototan Ilo-Ilo', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'116')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (98, N'SAGAY', 1, N'Sagay City', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'078')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (99, N'SAMBOAN', 1, N'Colase, Samboan, Cebu', CAST(9.469878 AS Decimal(8, 6)), CAST(123.298041 AS Decimal(9, 6)), N'', 1, N'028')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (100, N'SAMPLE', 1, N'Sample', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 0, N'999')
GO
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (101, N'SAN CARLOS', 1, N'San Carlos Negros Occidental', CAST(10.485178 AS Decimal(8, 6)), CAST(123.413744 AS Decimal(9, 6)), N'', 1, N'052')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (102, N'SAN FERNANDO', 1, N'San fernando, Cebu', CAST(10.161986 AS Decimal(8, 6)), CAST(123.706260 AS Decimal(9, 6)), N'', 1, N'058')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (103, N'sAN JUAN', 1, N'San Juan, Southern Leyte', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'064')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (104, N'SAN REMIGIO', 1, N'San Remigio Cebu', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'083')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (105, N'SARA', 1, N'Sara Ilo-Ilo', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'111')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (106, N'SIATON', 1, N'Siaton Negros Oriental', CAST(9.062981 AS Decimal(8, 6)), CAST(123.031590 AS Decimal(9, 6)), N'', 1, N'047')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (107, N'SIBULAN', 1, N'Sibulan dumaguete negros oriental', CAST(9.350084 AS Decimal(8, 6)), CAST(123.284947 AS Decimal(9, 6)), N'', 1, N'031')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (108, N'SIERRA BULLONES', 1, N'Sierra Bullones Bohol', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'086')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (109, N'SILAY', 1, N'Silay Negros', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'098')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (110, N'SIPALAY', 1, N'Sipalay Negros', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'096')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (111, N'SIQUIJOR', 1, N'Siquijor', CAST(9.214433 AS Decimal(8, 6)), CAST(123.517939 AS Decimal(9, 6)), N'', 1, N'040')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (112, N'SOGOD', 1, N'Proper Damolog Sogod, Cebu', CAST(10.772818 AS Decimal(8, 6)), CAST(124.006183 AS Decimal(9, 6)), N'', 1, N'030')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (113, N'SOGOD-LEYTE', 1, N'Sogod, Leyte', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'073')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (114, N'STA. BARBARA', 1, N'Sta. Barbara Ilo-Ilo', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'112')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (115, N'STA. CATALINA', 1, N'Sta. Catalina Negros Oriental', CAST(9.333921 AS Decimal(8, 6)), CAST(122.862630 AS Decimal(9, 6)), N'', 1, N'046')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (116, N'TACLOBAN', 1, N'tacloban, Leyte', CAST(11.206140 AS Decimal(8, 6)), CAST(124.996839 AS Decimal(9, 6)), N'', 1, N'060')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (117, N'TACLOBAN 2', 1, N'Tacloban 2 Leyte', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'104')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (118, N'TAGBILARAN', 1, N'Rizal Street, Brgy Cogon Tagbilaran City Bohol', CAST(9.653467 AS Decimal(8, 6)), CAST(123.858888 AS Decimal(9, 6)), N'', 1, N'027')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (119, N'TAGBILARAN 2', 1, N'Door 2 Seaview Apartment, CPG East, Bool District, Tagbilaran City, Bohol. ', CAST(9.628951 AS Decimal(8, 6)), CAST(123.879579 AS Decimal(9, 6)), N'', 1, N'001')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (120, N'TALIBON', 1, N'San Pedro St. Poblacion,Talibon, Bohol', CAST(10.148896 AS Decimal(8, 6)), CAST(124.325468 AS Decimal(9, 6)), N'', 1, N'023')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (121, N'TALIBON 2', 1, N'Trinidad Bohol', CAST(10.148896 AS Decimal(8, 6)), CAST(124.325468 AS Decimal(9, 6)), N'', 1, N'042')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (122, N'TALISAY', 1, N'Talisay cebu', CAST(10.263013 AS Decimal(8, 6)), CAST(123.840303 AS Decimal(9, 6)), N'', 1, N'038')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (123, N'TOLEDO', 1, N'2nd Floor Chona Basadre Bldg. Luray I, Toledo City, Cebu', CAST(10.379850 AS Decimal(8, 6)), CAST(123.640621 AS Decimal(9, 6)), N'', 1, N'018')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (124, N'TUBIGON', 1, N'Pinayagan, Tubigon, Bohol', CAST(9.938192 AS Decimal(8, 6)), CAST(123.950276 AS Decimal(9, 6)), N'', 1, N'010')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (125, N'UBAY', 1, N'2nd Floor Lorenzo Bldg. Corner National Highway and Tan Pentong Street Poblacion Ubay, Bohol', CAST(10.057187 AS Decimal(8, 6)), CAST(124.473239 AS Decimal(9, 6)), N'', 1, N'011')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (126, N'VICTORIAS', 1, N'Victorias Negors', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 1, N'099')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (127, N'', 1, N'', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 0, N'')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (128, N'CARCAR', 1, N'2/F CARCAR TRAVELLER''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''S INN, VALLADOLID,Cebu', CAST(10.108671 AS Decimal(8, 6)), CAST(123.654814 AS Decimal(9, 6)), N'', 1, N'003')
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (129, N'test', 5, N'test', CAST(1.000000 AS Decimal(8, 6)), CAST(1.000000 AS Decimal(9, 6)), N'', 1, NULL)
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (130, N'Antier', 3, N'Sabang Sibonga Cebu', CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'Added Remarks', 0, NULL)
INSERT [dbo].[Masterfile_Branch] ([Id], [Name], [AreaId], [Address], [Latitude], [Longitude], [Remarks], [Status], [BranchCode]) VALUES (131, N'Cebu City 5', 1, N'Poblacion,Argao,Cebu', CAST(12.212100 AS Decimal(8, 6)), CAST(12.123000 AS Decimal(9, 6)), N'Sample', 1, NULL)
INSERT [dbo].[Masterfile_Category] ([Id], [Description], [Type], [Remarks], [Status]) VALUES (1, N'Other Disbursement', N'Outflow', N'', 1)
INSERT [dbo].[Masterfile_Category] ([Id], [Description], [Type], [Remarks], [Status]) VALUES (2, N'Other Collection', N'Inflow', N'', 1)
INSERT [dbo].[Masterfile_Category] ([Id], [Description], [Type], [Remarks], [Status]) VALUES (3, N'category sample', N'Outflow', N'', 1)
INSERT [dbo].[Masterfile_Category] ([Id], [Description], [Type], [Remarks], [Status]) VALUES (4, N'category again', N'Inflow', N'Added Remarks', 1)
INSERT [dbo].[Masterfile_Category] ([Id], [Description], [Type], [Remarks], [Status]) VALUES (5, N'Cat 2', N'Inflow', N'', 0)
INSERT [dbo].[Masterfile_Category] ([Id], [Description], [Type], [Remarks], [Status]) VALUES (6, N'Operating Expense', N'Outflow', N'', 1)
INSERT [dbo].[Masterfile_Channel] ([Id], [Description], [Remarks], [Status]) VALUES (1, N'Cash', N'C', 1)
INSERT [dbo].[Masterfile_Channel] ([Id], [Description], [Remarks], [Status]) VALUES (2, N'Bank', N'B', 1)
INSERT [dbo].[Masterfile_Channel] ([Id], [Description], [Remarks], [Status]) VALUES (3, N'Journal', N'J', 1)
INSERT [dbo].[Masterfile_Channel] ([Id], [Description], [Remarks], [Status]) VALUES (4, N'Remco', N'R', 1)
INSERT [dbo].[Masterfile_Channel] ([Id], [Description], [Remarks], [Status]) VALUES (5, N'DebitAdvice', N'D', 1)
INSERT [dbo].[Masterfile_Channel] ([Id], [Description], [Remarks], [Status]) VALUES (6, N'Other', N'O', 1)
INSERT [dbo].[Masterfile_Channel] ([Id], [Description], [Remarks], [Status]) VALUES (7, N'Ali', N'asdasd', 0)
INSERT [dbo].[Masterfile_Channel] ([Id], [Description], [Remarks], [Status]) VALUES (8, N'test', N'', 0)
INSERT [dbo].[Masterfile_Channel] ([Id], [Description], [Remarks], [Status]) VALUES (9, N'Test', N'T', 0)
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
INSERT [dbo].[Masterfile_District] ([Id], [Name], [RegionId], [Remarks], [Status]) VALUES (3, N'Iloilo', 10, N'Remarks here', 1)
INSERT [dbo].[Masterfile_District] ([Id], [Name], [RegionId], [Remarks], [Status]) VALUES (4, N'Leyte', 10, N'', 1)
INSERT [dbo].[Masterfile_District] ([Id], [Name], [RegionId], [Remarks], [Status]) VALUES (5, N'Samar', 10, N'', 1)
INSERT [dbo].[Masterfile_District] ([Id], [Name], [RegionId], [Remarks], [Status]) VALUES (6, N'Negros', 10, N'', 1)
INSERT [dbo].[Masterfile_District] ([Id], [Name], [RegionId], [Remarks], [Status]) VALUES (7, N'sample', 17, N'', 1)
INSERT [dbo].[Masterfile_District] ([Id], [Name], [RegionId], [Remarks], [Status]) VALUES (8, N'Test', 17, N'Edited', 0)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (1, N'990741', N'marlon', N'lantajo', N'bayon-on', 3, N'nelson@gmail.com', N'1239', N'123', 10, N'Sibonga', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (2, N'123', N'gaga', N'del', N'Antierss', 1, N'sample@gmail.com', N'1239', N'906', 2, N'resample', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (3, N'123', N'gaga', N'del', N'Antierss', 1, N'sample@gmail.com', N'123', N'0906', 1, N'sample', 0)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (4, N'123', N'Gary', N'asd', N'Antier', 1, N'asd@gmail.com', N'', N'123', 2, N'asd', 0)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (5, N'112', N'aaa adasd', N'aaa', N'aaa', 1, N'fasf@gmail.com', N'', N'123', 2, N'asdsad asds ', 0)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (6, N'2', N'Gilberto', N'Garbo', N'Banlasan', 1, N'email@email.com', N'1239', N'12345678421', 44, N's', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (7, N'60606', N'MONETTE', N'SOLIANO', N'MASPARA', 43, N'monette.maspara@rafi.org.ph', NULL, N'', 124, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (8, N'60608', N'MA. THERESA', N'GREFALDE', N'CATIPAY', 7, N'ma.theresa.catipay@rafi.org.ph', NULL, N'', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (9, N'60609', N'ROSLYN', N'CATACUTAN', N'CANAVERAL', 42, N'roslyn.canaveral@rafi.org.ph', NULL, N'09184134353', 44, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (10, N'60618', N'AVIGAYL', N'RAYCO', N'BERTOLANO', 41, N'avigayl.bertolano@gmail.com', NULL, N'4605641', 124, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (11, N'60701', N'JEANIEDEL', N'ESCUADRO', N'TAPIA', 42, N'jeaniedel.tapia@rafi.org.ph', NULL, N'09169292517', 77, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (12, N'60819', N'OLIVER', N'ALFEREZ', N'SAYAGO', 42, N'oliver.sayago@rafi.org.ph', NULL, N'', 72, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (13, N'61004', N'NINEVEH', N'LAPE', N'MASCARINAS', 87, N'nineveh.mascarinas@rafi.org.ph', NULL, N'09274358618', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (14, N'70105', N'GINA', N'SENCERO', N'GIMPAYAN', 42, N'gina.gimpayan@rafi.org.ph', NULL, N'4215872', 7, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (15, N'70201', N'BOCHIE', N'PAJAGANAS', N'MUNDO', 109, N'bochiemundo1970@gmail.com', NULL, N'09214878854', 84, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (16, N'70203', N'RONALD', N'VILLACERAN', N'SEVILLA', 43, N'ronald.sevilla@rafi.org.ph', NULL, N'', 124, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (17, N'70208', N'TEOTIMO', N'PACINO', N'BAYON-ON', 42, N'teotimobayonon@gmail.com', NULL, N'09104584059', 99, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (18, N'70301', N'JUDITH', N'PIEZAS', N'LOPEZ', 42, N'judith.lopez@rafi.org.ph', NULL, N'', 49, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (19, N'70302', N'LEIZEL', N'BANGE', N'DANO', 42, N'leizel.dano@rafi.org.ph', NULL, N'09283992142', 73, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (20, N'70314', N'RANMER', N'ABONG', N'SALARITAN', 42, N'ranmer.salaritan@rafi.org.ph', NULL, N'09102962828', 18, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (21, N'90102', N'MARIA DELIA', N'LABISTE', N'ALFARERO', 88, N'maria.delia.labiste@rafi.org.ph', NULL, N'', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (22, N'90104', N'SERGIO', N'BASLAN', N'FRONTERAS', 42, N'sergio.fronteras.jr@rafi.org.ph', NULL, N'', 91, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (23, N'90205', N'MELODY', N'DICHOSA', N'VIARINO', 84, N'melody.viarino@rafi.org.ph', NULL, N'', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (24, N'90303', N'VINCENT', N'PARPAN', N'CUAJAO', 18, N'vincent.cuajao@rafi.org.ph', NULL, N'', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (25, N'90305', N'JOSEPH', N'VASAYLAJE', N'RONDERO', 24, N'joseph.rondero05@gmail.com', NULL, N'09058408535', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (26, N'90403', N'JERWIN', N'DAUG', N'BAOY', 42, N'jerwin.baoy@rafi.org.ph', NULL, N'', 37, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (27, N'90500', N'ARIEL', N'OUANO', N'MASONG', 43, N'ariel.masong@rafi.org.ph', NULL, N'', 116, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (28, N'90804', N'ADELINA', N'NEIR', N'AGRAVANTE', 43, N'adelinaagravante123@gmail.com', NULL, N'09293624387', 106, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (29, N'91200', N'MELODY', N'GALLEGO', N'DE LA TORRE', 41, N'melodydelatorre6@gmail.com', NULL, N'', 116, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (30, N'91201', N'LEONORA', N'HERBITO', N'GELLANG', 41, N'leonor.gellang@gmail.com', NULL, N'', 44, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (31, N'100100', N'CHRISTOPHER', N'BERAYE', N'MANDAUE', 131, N'christopher.mandaue@rafi.org.ph', NULL, N'09395083497', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (32, N'100104', N'ABSALONA', N'SUAREZ', N'BETINOL', 43, N'absalona.betinol@gmail.com', NULL, N'', 68, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (33, N'100605', N'RAFFY', N'MORALES', N'BALADJAY', 92, N'raffy.baladjay@rafi.org.ph', NULL, N'09225747816', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (34, N'111105', N'DOMINIC', N'PERALTA', N'SENCIO', 99, N'dominic.sencio@rafi.org.ph', NULL, N'09268380469', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (35, N'111107', N'ROBERTO', N'NUEZ', N'BONCALES', 109, N'boncales.roberto73@gmail.com', NULL, N'', 73, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (36, N'111109', N'MADEO', N'SUELLO', N'CAMACHO', 42, N'madeo.camacho@rafi.org.ph', NULL, N'09334412893', 91, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (37, N'120301', N'REYNARD', N'ALPAS', N'BRIONES', 42, N'reynard.briones@rafi.org.ph', NULL, N'', 125, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (38, N'120302', N'MITCHEL', N'BATILLER', N'BOLACITO', 42, N'mitchel.bolacito@rafi.org.ph', NULL, N'', 49, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (39, N'120501', N'REYNAN', N'DELA PENA', N'LOCAYLOCAY', 42, N'reynan.locaylocay@rafi.org.ph', NULL, N'', 121, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (40, N'120602', N'ELLEONOR', N'DALAPO', N'DALAPO', 40, N'elleonor.dalapo123@gmail.com', NULL, N'09309280242', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (41, N'120603', N'NEIL ANTHONY', N'REQUISO', N'PACQUIAO', 42, N'neil.pacquiao@rafi.org.ph', NULL, N'09231432125', 112, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (42, N'120701', N'ALFEO', N'MUANA', N'ZURITA', 109, N'alfeo.zurita.88@gmail.com', NULL, N'', 118, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (43, N'120703', N'JONALD', N'TAMARION', N'SOTTO', 42, N'jonald.sotto@rafi.org.ph', NULL, N'', 28, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (44, N'120801', N'MARIBEL', N'ANGCAHAN', N'PEJANO', 19, N'mpejano@gmail.com', NULL, N'09128960344', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (45, N'120803', N'HILARIO', N'BERNALDO', N'ZURITA', 109, N'hilariobernaldozurita@gmail.com', NULL, N'', 28, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (46, N'120901', N'JESS', N'VALDEZ', N'AGAN', 42, N'jess.agan@rafi.org.ph', NULL, N'', 80, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (47, N'121004', N'FRANCES', N'DASIGAN', N'BANDALAN', 109, N'kishanbandalan@gmail.com', NULL, N'', 107, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (48, N'121107', N'JOENARD', N'PITOGO', N'NUNEZ', 101, N'jnunez.rmf@gmail.com', NULL, N'', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (49, N'131101', N'MYRA', N'BALUCAN', N'TAPINIT', 28, N'myra.tapinit@rafi.org.ph', NULL, N'09173115888', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (50, N'140102', N'ARCHEL', N'NASARA', N'AREJA', 109, N'archelyahoo@gmail.com', NULL, N'', 46, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (51, N'140200', N'MA. CHARITO', N'GURREA', N'BAAY', 41, N'ma.charito.baay@gmail.com', NULL, N'09266029912', 49, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (52, N'140301', N'JUNREY', N'RECAPLAZA', N'BUGSOCAN', 94, N'junrey.bugsocan@rafi.org.ph', NULL, N'', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (53, N'140302', N'JOPHERT SON', N'CORTES', N'GARCIA', 42, N'jhopert.garcia@rafi.org.ph', NULL, N'09173093996', 95, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (54, N'140303', N'VELLE EDDIESON', N'TORREJOS', N'GURREA', 109, N'MCairbenz@gmail.com', NULL, N'', 116, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (55, N'140307', N'REINA', N'ESTOY', N'BALILI', 109, N'reina.balili@gmail.com', NULL, N'', 49, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (56, N'140500', N'MICEL', N'CAMIGUING', N'MONDIDO', 109, N'micel.mondido@gmail.com', NULL, N'09358047938', 77, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (57, N'140501', N'GEOMARIE', N'BALASOTE', N'DIAPANA', 109, N'j0ngzky91@gmail.com', NULL, N'', 44, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (58, N'140505', N'PRINCESS KEITH DALE', N'CANO', N'ABALDE', 109, N'princessabalde@yahoo.com', NULL, N'', 112, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (59, N'140601', N'NIGIL', N'GORES', N'BORONG', 42, N'nigil.borong@rafi.org.ph', NULL, N'', 38, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (60, N'140604', N'FLOR', N'MACARON', N'RABADON', 109, N'flor.rabadon.rafi2014@gmail.com', NULL, N'', 71, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (61, N'140605', N'JONALYN', N'PANCITO', N'MATIGAS', 109, N'amatigas@gmail.com', NULL, N'09262922150', 51, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (62, N'140606', N'CHARLIE MAE', N'EGOT', N'BANGCA', 109, N'charliemaebangca123@gmail.com', NULL, N'', 81, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (63, N'140908', N'JESRYL', N'ABELLANA', N'PLARISAN', 80, N'jesryl.plarisan@rafi.org.ph', NULL, N'', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (64, N'140910', N'DAISY', N'CONING', N'GABULE', 20, N'daisy.gabule@rafi.org.ph', NULL, N'', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (65, N'140911', N'APPLE', N'CASTINO', N'GARCIA', 41, N'garciaapple09@gmail.com', NULL, N'09095286249', 73, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (66, N'141000', N'ROLANDO', N'MACABUDBUD', N'CAMET', 43, N'rolandocamet@gmail.com', NULL, N'', 109, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (67, N'141001', N'MART VINCENT', N'TUQUIB', N'OTOM', 109, N'vinmart542@gmail.com', NULL, N'09462192875', 83, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (68, N'141004', N'JONAR', N'BERNARDINO', N'DORADO', 66, N'jonar.dorado@rafi.org.ph', NULL, N'', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (69, N'141005', N'GRETCHEN', N'SALOMA', N'ABEQUIBEL', 109, N'gabequibel@gmail.com', NULL, N'', 46, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (70, N'141008', N'MICHAEL', N'HERNANI', N'COMPUESTO', 42, N'michael.compuesto@rafi.org.ph', NULL, N'09106227446', 80, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (71, N'141103', N'ROMEO', N'BESAS', N'CUTAMORA', 109, N'romeocutamorajr@gmail.com', NULL, N'', 48, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (72, N'141104', N'MARLOU', N'INGUITO', N'GOMEZ', 43, N'marlougomez20@gmail.com', NULL, N'09161339226', 38, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (73, N'141105', N'CHARLES', N'MANGAO', N'MILLAN', 43, N'charles.millan35@gmail.com', NULL, N'', 36, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (74, N'141107', N'PEDRO', N'JORGE', N'RUALES', 42, N'pedro.rualesjr@gmail.com', NULL, N'09307912714', 51, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (75, N'141108', N'RODGIE', N'MARQUEZ', N'SURALTA', 109, N'rodgie.suralta08@gmail.com', NULL, N'', 118, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (76, N'141112', N'ALVIN', N'COLINA', N'MIBATO', 43, N'vinoxguapo9410@gmail.com', NULL, N'09234123237', 70, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (77, N'141200', N'LUZVIMINDA', N'CAPAROS', N'GONZAGA', 109, N'mgonzaga.rmf@gmail.com', NULL, N'', 80, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (78, N'150222', N'DARYL JAMES', N'ESTENZO', N'GOLIS', 109, N'darylgolis@gmail.com', NULL, N'', 7, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (79, N'150225', N'JONATHAN', N'BASBAS', N'SORONO', 109, N'Jonathan.Soronio2015@gmail.com', NULL, N'', 112, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (80, N'150226', N'JOEMEL', N'ENAYO', N'NELLAS', 109, N'nellasjoemel@gmail.com', NULL, N'', 26, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (81, N'150227', N'ALLAN', N'RUTA', N'VILLARIN', 109, N'villarinallan@gmail.com', NULL, N'', 113, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (82, N'150300', N'JUVELYN', N'ROMERO', N'ALMERIDA', 109, N'juvelyn.almerida@gmail.com', NULL, N'', 74, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (83, N'150301', N'ELVIN MORRIS', N'SALANG', N'ANTONIO', 109, N'morriz19antonio@gmail.com', NULL, N'', 95, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (84, N'150302', N'JOMAR', N'SANTOS', N'BACOLOD', 109, N'jomar.bacolod27@gmail.com', NULL, N'09094383945', 61, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (85, N'150303', N'CYRUS', N'ROSALDO', N'BERNIL', 109, N'cybernilmarch@gmail.com', NULL, N'09098166791', 73, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (86, N'150304', N'QUERUBIN', N'CLAPANO', N'BONGCAC', 109, N'querubin.bongcac@gmail.com', NULL, N'', 19, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (87, N'150305', N'ADAN', N'NAPIÃ‘AS', N'COQUILLA', 109, N'adan.coquilla198@gmail.com', NULL, N'', 50, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (88, N'150306', N'JULIUS', N'GONZAGA', N'CORAGE', 38, N'jholiuscourage@gmail.com', NULL, N'09077193900', 81, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (89, N'150307', N'MARICRIS', N'BAAY', N'HOYLE', 109, N'aleahgrace14@gmail.com', NULL, N'', 71, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (90, N'150308', N'GARY', N'NESPEROS', N'MALIG-ON', 109, N'gary.maligon@gmail.com', NULL, N'', 91, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (91, N'150311', N'RONEL', N'FUENTES', N'VALMORIA', 109, N'ronel.valmoria@gmail.com', NULL, N'', 95, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (92, N'150313', N'RAY ANTHONY', N'BELONGILOT', N'ALMADEN', 42, N'rayanthony.almaden@rafi.org.ph', NULL, N'09222139660', 32, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (93, N'150401', N'ARNOLD', N'ALBARICO', N'BARCOS', 109, N'arnold67.barcos@gmail.com', NULL, N'', 28, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (94, N'150402', N'ROGELIO', N'ESMANI', N'BOHOL', 109, N'rogeliobohol0509@gmail.com', NULL, N'', 38, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (95, N'150403', N'MACGYVER', N'BALEJON', N'ONG', 109, N'omgmack.mo@gmail.com', NULL, N'', 98, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (96, N'150405', N'APPLE MAY', N'CERNIAS', N'ISRAEL', 109, N'apple.may.israel@gmail.com', NULL, N'', 88, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (97, N'150406', N'RACHAEL', N'BALESTEROS', N'GARQUE', 71, N'rachael.garque@rafi.org.ph', NULL, N'', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (98, N'150407', N'JOHNBURNHAM', N'DEIPARINE', N'ABELLANA', 109, N'johnburnham.abellana620@gmail.com', NULL, N'', 46, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (99, N'150408', N'NENEN', N'PONO', N'CAPUYAN', 14, N'capuyannenen@gmail.com', NULL, N'', 75, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (100, N'150409', N'SANTIJUN', N'GAID', N'CIMENI', 43, N'santijun.cimeni@gmail.com', NULL, N'09207831669', 83, N'', 1)
GO
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (101, N'150410', N'RICKY', N'VIBAR', N'CLAMONTE', 109, N'rickyclamonte@gmail.com', NULL, N'09068963007', 77, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (102, N'150411', N'TERESA', N'GADOR', N'DAGATAN', 109, N'dagatanteresa@gmail.com', NULL, N'09476298176', 111, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (103, N'150412', N'MARK JENAZ', N'NEGRE', N'FORROSUELO', 109, N'markjenazforrosuelo@gmail.com', NULL, N'', 114, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (104, N'150413', N'RICHARD', N'OFIANGA', N'GUALVEZ', 109, N'richardgualvez1981@gmail.com', NULL, N'09104041003', 47, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (105, N'150414', N'RYAN CARLO', N'BESABELLA', N'LEPON', 109, N'ryancarlo1982@gmail.com', NULL, N'09079930558', 52, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (106, N'150415', N'REY JAY', N'COMPENDIO', N'PADEN', 109, N'reyjaypaden@gmail.com', NULL, N'', 95, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (107, N'150416', N'JUNNAR', N'ABATAYO', N'PILAPIL', 109, N'junnarpilapil8@gmail.com', NULL, N'', 113, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (108, N'150621', N'JUNMAR VINCENT', N'ROLLAN', N'TIBAY', 109, N'tibayjunmarvincent@gmail.com', NULL, N'09428117213', 72, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (109, N'150622', N'MARY ANN', N'MONTEMAYOR', N'UNDANG', 41, N'undangmaryann@gmail.com', NULL, N'09073413738', 125, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (110, N'150700', N'JENIZA', N'GERBOLINGO', N'BATOHINOG', 41, N'jenizabatohinogg@gmail.com', NULL, N'09306733226', 88, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (111, N'150701', N'MARJURIE', N'BARONTOY', N'ENAD', 15, N'emarjurie@gmail.com', NULL, N'', 71, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (112, N'150707', N'LYEL ADAMS', N'NAVARRO', N'CAVALIDA', 109, N'adamzcavalida@gmail.com', NULL, N'09222861025', 59, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (113, N'150708', N'RONEL', N'TUBO', N'JAGUS', 109, N'roneljagus@gmail.com', NULL, N'', 81, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (114, N'150709', N'JESSIE PAUL', N'DUGADUGA', N'LUPAS', 109, N'jessielupas23@gmail.com', NULL, N'', 81, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (115, N'150710', N'NIKKO', N'BRASALUTE', N'MARCHADESCH', 109, N'nikkomarchadesch19@gmail.com', NULL, N'09351195923', 52, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (116, N'150711', N'CLIFFORD', N'VEQUIZO', N'MAQUIPOTEN', 109, N'ford.maquipoten@gmail.com', NULL, N'', 69, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (117, N'150712', N'NELSON', N'N/A', N'TERO', 109, N'nelson.tero33@gmail.com', NULL, N'', 19, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (118, N'150800', N'DIOCLES', N'CAINGIN', N'ROSALEJOS', 89, N'diocles.rosalejos@rafi.org.ph', NULL, N'', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (119, N'150803', N'WENDELL', N'ACEBES', N'CAGATIN', 109, N'wendell.cagatin@gmail.com', NULL, N'', 7, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (120, N'150804', N'CHETO', N'ENSO', N'DAWATON', 109, N'chetodawaton@gmail.com', NULL, N'', 71, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (121, N'150805', N'DINDO', N'JANDOG', N'EGE', 42, N'dindo.ege@rafi.org.ph', NULL, N'09068074204', 43, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (122, N'150807', N'JOVANNIE', N'GERALDEZ', N'RECARTE', 44, N'jrecarte@gmail.com', NULL, N'', 113, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (123, N'150923', N'JULIET', N'BERSANO', N'BETONIO', 41, N'betoniojuliet@gmail.com', NULL, N'', 58, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (124, N'150924', N'EDUARD', N'COSMOD', N'CUTAMORA', 109, N'cutamoraeduard.rafi@gmail.com', NULL, N'', 88, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (125, N'150925', N'LARRY', N'BAGOL', N'EMBALZADO', 109, N'axle.embalzado@gmail.com', NULL, N'', 75, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (126, N'150926', N'JOHN', N'DULANA', N'JAPITAN', 109, N'Jhonjapitan@gmail.com', NULL, N'', 121, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (127, N'150927', N'BERNIE', N'AUTOR', N'PAMPELON', 109, N'berniepampelon@gmail.com', NULL, N'', 48, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (128, N'150928', N'JONATHAN', N'BOAQUIN', N'TIBAY', 109, N'jonthan.tibay0403@gmail.com', NULL, N'', 91, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (129, N'150929', N'JOEMAR', N'ANANA', N'TORREJOS', 109, N'joemartorrejos26@gmail.com', NULL, N'', 73, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (130, N'150930', N'GERY', N'MACABUDBUD', N'TORRENTIRA', 43, N'gery.torrentira@gmail.com', NULL, N'09101795017', 4, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (131, N'151000', N'DIANNE', N'FLORES', N'BATE', 72, N'dianne.bate@rafi.org.ph', NULL, N'09158923492', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (132, N'151001', N'EMMALYN', N'N/A', N'ABUNDA', 56, N'emmalyn.abunda@gmail.com', NULL, N'', 75, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (133, N'151002', N'ELLIE REY', N'ESTREMOS', N'DAYANGCO', 109, N'edayangco@gmail.com', NULL, N'', 46, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (134, N'151003', N'GERUEL', N'DEMETRIAL', N'MARCOJOS', 109, N'geruel.marcojos@gmail.com', NULL, N'', 61, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (135, N'151006', N'DARYL LOU', N'ZAPANTA', N'SAJULGA', 109, N'sajulgadaryl@gmail.com', NULL, N'', 95, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (136, N'151010', N'ELMER', N'BUSTALINIO', N'MIRADORES', 109, N'elmer.miradores@gmail.com', NULL, N'', 50, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (137, N'151011', N'JANINE ROSE', N'ALFARERO', N'ABAPO', 14, N'janine.rose.abapo@rafi.org.ph', NULL, N'', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (138, N'151108', N'JOHN PHILIP', N'BULABOS', N'RAMOS', 109, N'ramosjohnphilip6@gmail.com', NULL, N'', 48, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (139, N'151109', N'ANTHONY FLORENCE', N'SANICO', N'ROSAL', 43, N'anthonyflorence.rosal@gmail.com', NULL, N'', 98, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (140, N'151110', N'MANOVE', N'GALLARDO', N'ZAMORA', 104, N'manove.zamora@rafi.org.ph', NULL, N'', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (141, N'151113', N'MARY LOVE MELODY', N'TOBIAS', N'CABANAG', 61, N'mary.love.melody.cabanag@rafi.org.ph', NULL, N'', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (142, N'151114', N'MELGER', N'MISTOLA', N'JORDAN', 105, N'stcmmjordan@gmail.com', NULL, N'', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (143, N'151115', N'JESRYN', N'TORMIS', N'LEONARDO', 104, N'jesryn.leonardo@rafi.org.ph', NULL, N'09187742869', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (144, N'151116', N'JUSHUA', N'N/A', N'TADEO', 109, N'santosjushua@gmail.com', NULL, N'', 111, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (145, N'151117', N'VICTOR', N'ABA-A', N'TESIO', 109, N'vtesio56@gmail.com', NULL, N'', 83, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (146, N'151200', N'RAIHNARD', N'BUGHAO', N'CANETE', 109, N'arthazane@gmail.com', NULL, N'', 42, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (147, N'151201', N'JAIME JR.', N'CANETE', N'RICAPLAZA', 56, N'jaime.ricaplaza@rafi.org.ph', NULL, N'', 2, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (148, N'151202', N'MAE', N'OLAER', N'JUTARA', 41, N'mae.jutara@gmail.com', NULL, N'', 13, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (149, N'151203', N'FRANCELYN JOY', N'SOLAYAO', N'MASONG', 109, N'celynmasong1812@gmail.com', NULL, N'', 42, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (150, N'151204', N'ORIEL', N'BREGILDO', N'SUMILAC', 109, N'orielbsumilac0428@gmail.com', NULL, N'', 114, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (151, N'151205', N'ISABEL', N'JADULCO', N'CASTIGON', 109, N'isabelcastigon@gmail.com', NULL, N'09309300483', 42, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (152, N'151206', N'JOCELYN', N'MONDERONDO', N'CORALDE', 47, N'jcoralde@gmail.com', NULL, N'', 88, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (153, N'990322', N'AMELITO', N'ROSARIO', N'DEGUMA', 109, N'amelito.deguma@gmail.com', NULL, N'', 113, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (154, N'990323', N'MARLON', N'DOLORICAN', N'GALLER', 109, N'marlon.galler27@gmail.com', NULL, N'', 58, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (155, N'990324', N'JERSON', N'MAUREAL', N'LUENGO', 82, N'jerson.luengo@rafi.org.ph', NULL, N'', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (156, N'990325', N'ALBERTO', N'BAGUINANG', N'MATURA', 109, N'alberto.matura@gmail.com', NULL, N'', 81, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (157, N'990326', N'ANDREA', N'ROMERO', N'PAILAGO', 58, N'andrea.pailago@rafi.org.ph', NULL, N'', 62, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (158, N'990327', N'JAMES', N'VICS', N'CASERES', 109, N'jamescaseres.143@gmail.com', NULL, N'09096648390', 46, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (159, N'990328', N'REYMART', N'N/A', N'ARROJO', 42, N'reymary025@gmail.com', NULL, N'', 24, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (160, N'990329', N'REYMAR', N'BOISER', N'BORAL', 109, N'rosemarzion@gmail.com', NULL, N'', 4, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (161, N'990330', N'LARRY', N'ESTOMO', N'CERVANTES', 109, N'larrycervantes0220@gmail.com', NULL, N'09103332292', 91, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (162, N'990331', N'WELBERT', N'ARIATA', N'DAPAR', 109, N'welbertdapar214@gmail.com', NULL, N'', 81, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (163, N'990332', N'MA. LANESA', N'INSIGNE', N'GERALDE', 41, N'malanesa.geralde@gmail.com', NULL, N'', 107, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (164, N'990333', N'RHEA ROXANNE', N'CELIS', N'GOMEZ', 109, N'Rheagomez90@gmail.com', NULL, N'', 19, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (165, N'990334', N'ARIEL', N'SABILLO', N'JAVINES', 109, N'arielsabillojavines@gmail.com', NULL, N'', 107, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (166, N'990335', N'MICHAEL SHANE', N'CARILLO', N'KONG', 109, N'michaelshanek@gmail.com', NULL, N'', 113, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (167, N'990336', N'JOBHART', N'TUGONON', N'OMEGA', 109, N'jobhart.omega@gmail.com', NULL, N'', 80, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (168, N'990353', N'ANGELICA', N'VILLENA', N'ARANZADO', 41, N'aranzadoangelica629@gmail.com', NULL, N'', 15, N'', 1)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (169, N'124', N'Tested', N'Tested', N'Tested', 2, N'test@test.com', NULL, N'1', 25, N'', 0)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (170, N'123', N'Test', N'Test', N'Test', 2, N'test@test.com', NULL, N'1', 25, N'', 0)
INSERT [dbo].[Masterfile_Employee] ([Id], [EmployeeIdNo], [Firstname], [Middlename], [LastName], [PositionId], [EmailAddress], [GmailId], [ContactNumber], [BranchId], [Remarks], [Status]) VALUES (171, N'121', N'Test', N'Test', N'Test', 14, N'test@test.com', NULL, N'1', 25, N'', 0)
INSERT [dbo].[Masterfile_Function] ([Id], [Name], [Status], [Remarks]) VALUES (1, N'View', 1, N'Can view the page')
INSERT [dbo].[Masterfile_Function] ([Id], [Name], [Status], [Remarks]) VALUES (2, N'Add', 1, N'Generic Add button')
INSERT [dbo].[Masterfile_Function] ([Id], [Name], [Status], [Remarks]) VALUES (3, N'Edit', 1, N'Generic Edit button')
INSERT [dbo].[Masterfile_Function] ([Id], [Name], [Status], [Remarks]) VALUES (4, N'Delete', 1, N'Generic Delete Button')
INSERT [dbo].[Masterfile_Function] ([Id], [Name], [Status], [Remarks]) VALUES (5, N'Search', 1, N'Generic Search')
INSERT [dbo].[Masterfile_Function] ([Id], [Name], [Status], [Remarks]) VALUES (6, N'Print', 1, N'Generic Print Button')
INSERT [dbo].[Masterfile_Function] ([Id], [Name], [Status], [Remarks]) VALUES (7, N'Sync Employee', 1, N'Get Employee Details to HRIS')
INSERT [dbo].[Masterfile_Function] ([Id], [Name], [Status], [Remarks]) VALUES (8, N'Sync Designation', 1, N'Get Designation from HRIS')
INSERT [dbo].[Masterfile_Function] ([Id], [Name], [Status], [Remarks]) VALUES (9, N'Sync Branch', 1, N'Get Branch from HRIS')
INSERT [dbo].[Masterfile_Function] ([Id], [Name], [Status], [Remarks]) VALUES (10, N'Sync Budgeting', 1, N'Get Budget Preparation per Branch in BIJLI')
INSERT [dbo].[Masterfile_Function] ([Id], [Name], [Status], [Remarks]) VALUES (11, N'Open Budget', 1, N'Open Budget Period Per Branch')
INSERT [dbo].[Masterfile_Function] ([Id], [Name], [Status], [Remarks]) VALUES (12, N'Close Budget', 1, N'Close Budget Period Per Branch')
INSERT [dbo].[Masterfile_OtherDisbursementDetail] ([Id], [Description], [CategoryId], [BranchId], [SetUpAmount], [ChartOfAccountId], [Remarks], [Status], [ChannelId], [Day]) VALUES (1, N'Loan', 1, 1, CAST(1500.00 AS Decimal(10, 2)), 1, N'', 1, 1, 5)
INSERT [dbo].[Masterfile_OtherDisbursementDetail] ([Id], [Description], [CategoryId], [BranchId], [SetUpAmount], [ChartOfAccountId], [Remarks], [Status], [ChannelId], [Day]) VALUES (2, N'Insurance', 2, 2, CAST(100.00 AS Decimal(10, 2)), 2, N'', 1, 2, 10)
INSERT [dbo].[Masterfile_OtherDisbursementDetail] ([Id], [Description], [CategoryId], [BranchId], [SetUpAmount], [ChartOfAccountId], [Remarks], [Status], [ChannelId], [Day]) VALUES (3, N'Collection', 3, 2, CAST(12.00 AS Decimal(10, 2)), 3, N'', 1, 2, 20)
INSERT [dbo].[Masterfile_OtherDisbursementDetail] ([Id], [Description], [CategoryId], [BranchId], [SetUpAmount], [ChartOfAccountId], [Remarks], [Status], [ChannelId], [Day]) VALUES (4, N'Description of Disbursement', 1, 1, CAST(2001.00 AS Decimal(10, 2)), 4, N'', 1, 1, 1)
INSERT [dbo].[Masterfile_OtherDisbursementDetail] ([Id], [Description], [CategoryId], [BranchId], [SetUpAmount], [ChartOfAccountId], [Remarks], [Status], [ChannelId], [Day]) VALUES (5, N'Test', 4, 7, CAST(100.00 AS Decimal(10, 2)), 33, N'', 0, 2, 5)
INSERT [dbo].[Masterfile_OtherDisbursementDetail] ([Id], [Description], [CategoryId], [BranchId], [SetUpAmount], [ChartOfAccountId], [Remarks], [Status], [ChannelId], [Day]) VALUES (6, N'Tester', 4, 7, CAST(1.00 AS Decimal(10, 2)), 431, N'Cash', 0, 2, 2)
INSERT [dbo].[Masterfile_OtherDisbursementDetail] ([Id], [Description], [CategoryId], [BranchId], [SetUpAmount], [ChartOfAccountId], [Remarks], [Status], [ChannelId], [Day]) VALUES (7, N'Office Rental', 6, 10, CAST(10000.00 AS Decimal(10, 2)), 29, N'', 1, 2, 15)
INSERT [dbo].[Masterfile_OtherReceiptDetail] ([Id], [Description], [CategoryId], [BranchId], [SetUpAmount], [ChartOfAccountId], [Remarks], [Status], [ChannelId], [Day]) VALUES (1, N'Sample', 2, 2, CAST(11111.00 AS Decimal(10, 2)), 7, N'', 1, 4, 5)
INSERT [dbo].[Masterfile_OtherReceiptDetail] ([Id], [Description], [CategoryId], [BranchId], [SetUpAmount], [ChartOfAccountId], [Remarks], [Status], [ChannelId], [Day]) VALUES (2, N'Print', 1, 1, CAST(1000.00 AS Decimal(10, 2)), 1, N'', 1, 1, 10)
INSERT [dbo].[Masterfile_OtherReceiptDetail] ([Id], [Description], [CategoryId], [BranchId], [SetUpAmount], [ChartOfAccountId], [Remarks], [Status], [ChannelId], [Day]) VALUES (3, N'edited', 1, 8, CAST(12.00 AS Decimal(10, 2)), 2, N'', 1, 1, 15)
INSERT [dbo].[Masterfile_OtherReceiptDetail] ([Id], [Description], [CategoryId], [BranchId], [SetUpAmount], [ChartOfAccountId], [Remarks], [Status], [ChannelId], [Day]) VALUES (4, N'Receipt Detail', 2, 2, CAST(1.00 AS Decimal(10, 2)), 5, N'', 1, 2, 20)
INSERT [dbo].[Masterfile_OtherReceiptDetail] ([Id], [Description], [CategoryId], [BranchId], [SetUpAmount], [ChartOfAccountId], [Remarks], [Status], [ChannelId], [Day]) VALUES (5, N'Another', 2, 4, CAST(2.00 AS Decimal(10, 2)), 2, N'', 1, 2, 28)
INSERT [dbo].[Masterfile_OtherReceiptDetail] ([Id], [Description], [CategoryId], [BranchId], [SetUpAmount], [ChartOfAccountId], [Remarks], [Status], [ChannelId], [Day]) VALUES (6, N'Tests', 3, 7, CAST(1.00 AS Decimal(10, 2)), 46, N'Banks', 0, 2, 2)
INSERT [dbo].[Masterfile_OtherReceiptDetail] ([Id], [Description], [CategoryId], [BranchId], [SetUpAmount], [ChartOfAccountId], [Remarks], [Status], [ChannelId], [Day]) VALUES (7, N'Income-NonTrade', 2, 10, CAST(5000.00 AS Decimal(10, 2)), 45, N'', 1, 1, 28)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (1, 1, 1, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (2, 1, 2, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (3, 1, 3, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (4, 1, 4, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (5, 2, 1, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (6, 2, 2, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (7, 2, 3, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (8, 2, 4, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (9, 3, 1, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (10, 3, 2, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (11, 3, 3, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (12, 3, 4, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (13, 4, 1, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (14, 4, 2, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (15, 4, 3, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (16, 4, 4, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (17, 5, 1, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (18, 5, 2, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (19, 5, 3, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (20, 5, 4, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (21, 6, 1, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (22, 6, 2, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (23, 6, 3, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (24, 6, 4, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (25, 7, 1, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (26, 7, 2, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (27, 7, 3, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (28, 7, 4, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (29, 8, 1, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (30, 8, 2, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (31, 8, 3, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (32, 8, 4, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (33, 9, 1, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (34, 9, 2, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (35, 9, 3, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (36, 9, 4, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (37, 10, 1, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (38, 10, 2, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (39, 10, 3, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (40, 10, 4, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (41, 11, 1, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (42, 11, 2, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (43, 11, 3, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (44, 11, 4, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (45, 12, 1, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (46, 12, 2, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (47, 12, 3, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (48, 12, 4, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (49, 13, 1, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (50, 13, 2, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (51, 13, 3, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (52, 13, 4, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (53, 14, 1, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (54, 14, 2, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (55, 14, 3, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (56, 14, 4, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (57, 15, 11, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (58, 15, 12, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (59, 15, 1, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (60, 16, 1, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (61, 16, 2, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (62, 16, 3, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (63, 17, 1, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (64, 17, 1, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (65, 18, 1, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (66, 19, 1, N'', 1)
INSERT [dbo].[Masterfile_PageAction] ([Id], [SystemRightsId], [FunctionId], [Remarks], [Status]) VALUES (67, 20, 1, N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (1, N'1', N'ASD', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (2, N'2', N'2', N'sample', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (3, N'RMFTS', N'Trust Staff', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (4, N'asd', N'asd', N'asd', 0)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (5, N'RMFBM', N'Branch Manager', N's', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (6, N'ascas ascs', N'asasc ascsa', N'assa ascsc', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (7, N'ED', N'Executive Director', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (8, N'ED', N'Executive Director', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (9, N'ED', N'Executive Director', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (10, N'ED', N'Executive Director', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (11, N'ED', N'Executive Director', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (12, N'ED', N'Executive Director', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (13, N'ED', N'Executive Director', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (14, N'AR', N'Account Reconciler', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (15, N'AC', N'Accounting Clerk', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (16, N'AOA', N'Admin Assistant', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (17, N'AA1', N'Area Accountant - Bohol 1', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (18, N'AA4', N'Area Accountant - Cebu 1', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (19, N'AA5', N'Area Accountant - Cebu 2', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (20, N'AA6', N'Area Accountant - Cebu 3', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (21, N'AA9', N'Area Accountant - Leyte 1', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (22, N'AA10', N'Area Accountant - Leyte 2', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (23, N'AA11', N'Area Accountant - Leyte 3', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (24, N'AA13', N'Area Accountant - Negros 1', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (25, N'AA14', N'Area Accountant - Negros 2', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (26, N'AM1', N'AREA MANAGER - BOHOL 1', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (27, N'AM2', N'AREA MANAGER - BOHOL 2', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (28, N'AM4', N'AREA MANAGER - CEBU 1', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (29, N'AM5', N'AREA MANAGER - CEBU 2', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (30, N'AM6', N'AREA MANAGER - CEBU 3', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (31, N'AM9', N'AREA MANAGER - LEYTE 1', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (32, N'AM10', N'AREA MANAGER - LEYTE 2', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (33, N'AM11', N'AREA MANAGER - LEYTE 3', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (34, N'AM12', N'AREA MANAGER - LEYTE 4', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (35, N'AM13', N'AREA MANAGER - NEGROS 1', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (36, N'AM14', N'AREA MANAGER - NEGROS 2', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (37, N'AM15', N'AREA MANAGER - NEGROS 3', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (38, N'ABM', N'Assistant Branch Manager', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (39, N'A', N'Audit Staff', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (40, N'BA', N'BRANCH AUDITOR', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (41, N'BB', N'BRANCH BOOKKEEPER', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (42, N'BM', N'Branch Manager', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (43, N'BO', N'Branch OIC', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (44, N'BASS', N'Brand Associate', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (45, N'BB1', N'Buffer Bookkeeper - Bohol 1', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (46, N'BB3', N'Buffer Bookkeeper - Bohol 3', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (47, N'BB4', N'Buffer Bookkeeper - Cebu 1', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (48, N'BB5', N'Buffer Bookkeeper - Cebu 2', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (49, N'BB6', N'Buffer Bookkeeper - Cebu 3', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (50, N'BB9', N'Buffer Bookkeeper - Leyte 1', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (51, N'BB11', N'Buffer Bookkeeper - Leyte 3', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (52, N'BB13', N'Buffer Bookkeeper - Negros 1', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (53, N'BB14', N'Buffer Bookkeeper - Negros 2', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (54, N'BB15', N'Buffer Bookkeeper - Negros 3', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (55, N'BB16', N'Buffer Bookkeeper - Samar', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (56, N'AO1', N'Buffer Trust Staff', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (57, N'BDS1', N'Business Development Services', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (58, N'BDST', N'Business Development Specialist', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (59, N'BPA', N'Business Process Analyst', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (60, N'BPM', N'Business Process Manager', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (61, N'CS', N'Communication Specialist', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (62, N'CO', N'Communications Officer', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (63, N'CSP', N'Communications Specialist', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (64, N'CES', N'Customer Experience Specialist', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (65, N'DA', N'Data Analyst', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (66, N'DDF', N'Deputy Director for FAD', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (67, N'DDO', N'Deputy Director for Operations', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (68, N'EA', N'Executive Assistant', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (69, N'FAM', N'Finance and Admin. Manager', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (70, N'HRH', N'HR Head', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (71, N'HRS', N'HR Recruitment Specialist', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (72, N'HSS', N'HR Services Specialist', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (73, N'HRSS', N'HR Sourcing Specialist', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (74, N'HTS', N'HR Training Specialist', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (75, N'HRO', N'Human Resources Officer', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (76, N'IA', N'Insurance Administrator', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (77, N'ISP', N'INSURANCE SPECIALIST', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (78, N'IAA', N'Internal Audit Associate', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (79, N'ITH', N'IT Head', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (80, N'ITM', N'IT Manager', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (81, N'JA', N'JUNIOR AUDITOR', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (82, N'JP', N'Junior Programmer', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (83, N'MOA', N'Main Office Accountant', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (84, N'MOB', N'Main Office Bookkeeper', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (85, N'MOB', N'Main Office Bookkeeper 2', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (86, N'MISA', N'MIS Analyst', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (87, N'ORF', N'OIC-RMF FAD', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (88, N'PRI', N'Payroll In-charge', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (89, N'PS', N'Procurement Staff', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (90, N'PDS', N'Product Development Specialist', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (91, N'RAM', N'REGIONAL AUDIT MANAGER', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (92, N'RM1', N'Regional Manager - Bohol', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (93, N'RM2', N'Regional Manager - Cebu', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (94, N'RM4', N'Regional Manager - Leyte', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (95, N'RM5', N'Regional Manager - Negros', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (96, N'RDO', N'Research and Development Officer', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (97, N'RDS', N'Research and Development Specialist', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (98, N'RPDS', N'Research and Product Development Specialist', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (99, N'REH', N'RMF Expansion Head', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (100, N'SNA', N'Senior Auditor', N'', 1)
GO
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (101, N'AO2', N'Senior Trust Staff', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (102, N'SDA', N'Service Desk Analyst', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (103, N'SDS', N'Service Desk Specialist', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (104, N'STM', N'Set-up Manager', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (105, N'AO3', N'Set-up Trust Staff', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (106, N'SPMS', N'Social Performance Management Specialist', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (107, N'TA', N'TREASURY ASSISTANT', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (108, N'TRO', N'Treasury Officer', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (109, N'AO', N'TRUST STAFF', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (110, N'WC1', N'WASH Coordinator', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (111, N'AA8', N'AREA ACCOUNTANT - ILOILO', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (112, N'BB8', N'BUFFER BOOKKEEPER - ILOILO', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (113, N'AA2', N'AREA ACCOUNTANT - BOHOL 2', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (114, N'AA3', N'AREA ACCOUNTANT - BOHOL 3', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (115, N'BDS2', N'BUSINESS DEVELOPMENT SERVICES OFFICER', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (116, N'RM3', N'REGIONAL MANAGER - ILOILO', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (117, N'AA12', N'AREA ACCOUNTANT - LEYTE 4', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (118, N'AA7', N'AREA ACCOUNTANT - CEBU 4', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (119, N'AA15', N'AREA ACCOUNTANT - NEGROS 3', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (120, N'AM3', N'AREA MANAGER - BOHOL 3', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (121, N'AM7', N'AREA MANAGER - CEBU 4', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (122, N'BB2', N'BUFFER BOOKKEEPER - BOHOL 2', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (123, N'BB7', N'BUFFER BOOKKEEPER - CEBU 4', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (124, N'BB10', N'BUFFER BOOKKEEPER - LEYTE 2', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (125, N'BB12', N'BUFFER BOOKKEEPER - LEYTE 4', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (126, N'WC2', N'WASH SPECIALIST', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (127, N'PCOO', N'PRESIDENT AND COO', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (128, N'AVPH', N'AVP- HUMAN RESOURCES', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (129, N'AVCA', N'AVP - CORPORATE ASSURANCE AND ADVISORY', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (130, N'CFO', N'VP, CHIEF FINANCIAL OFFICER & COMPTROLLER', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (131, N'FA', N'FIELD ACCOUNTANT', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (132, N'DOR', N'DEPUTY OFFICER/RECRUITMENT IN-CHARGE', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (133, N'SD', N'SOFTWARE DEVELOPER', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (134, N'RSM', N'RISK MANAGER', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (135, N'AM8', N'AREA MANAGER - ILOILO', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (136, N'AM16', N'AREA MANAGER - NEGROS 4', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (137, N'AM17', N'AREA MANAGER - SAMAR', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (138, N'125', N'DATA AND APPLICATIONS DEVELOPMENT HEAD', N'', 1)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (139, N'asa', N'test', N'edited', 0)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (140, N'AAA', N'Battery', N'Edited', 0)
INSERT [dbo].[Masterfile_Position] ([Id], [Code], [Description], [Remarks], [Status]) VALUES (141, N'192332', N'Exec', N'EXEC', 1)
INSERT [dbo].[Masterfile_Region] ([Id], [Name], [Remarks], [Status]) VALUES (1, N'National Capital Region (NCR)', N'Luzon', 1)
INSERT [dbo].[Masterfile_Region] ([Id], [Name], [Remarks], [Status]) VALUES (2, N'Ilocos Region (Region I)', N'Luzon', 1)
INSERT [dbo].[Masterfile_Region] ([Id], [Name], [Remarks], [Status]) VALUES (3, N'Cordillera Administrative Region (CAR)', N'Luzon', 1)
INSERT [dbo].[Masterfile_Region] ([Id], [Name], [Remarks], [Status]) VALUES (4, N'Cagayan Valley (Region II)', N'Luzon', 1)
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
INSERT [dbo].[Masterfile_Region] ([Id], [Name], [Remarks], [Status]) VALUES (18, N'test', N'edited', 0)
INSERT [dbo].[Masterfile_Role] ([Id], [Description], [Remarks], [Status]) VALUES (1, N'Admin', N'sss', 1)
INSERT [dbo].[Masterfile_Role] ([Id], [Description], [Remarks], [Status]) VALUES (2, N'Admin', N'', 1)
INSERT [dbo].[Masterfile_Role] ([Id], [Description], [Remarks], [Status]) VALUES (3, N'Super Admin', N'', 1)
INSERT [dbo].[Masterfile_Role] ([Id], [Description], [Remarks], [Status]) VALUES (4, N'User', N'remarked', 1)
INSERT [dbo].[Masterfile_Role] ([Id], [Description], [Remarks], [Status]) VALUES (5, N'Tester', N'Testing account', 1)
INSERT [dbo].[Masterfile_Role] ([Id], [Description], [Remarks], [Status]) VALUES (6, N'test', N'edited', 0)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [RightsSeqNo], [System]) VALUES (1, N'Master Files', N'Region', 1, 1, NULL)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [RightsSeqNo], [System]) VALUES (2, N'Master Files', N'District', 1, 1, NULL)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [RightsSeqNo], [System]) VALUES (3, N'Master Files', N'Area', 1, 1, NULL)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [RightsSeqNo], [System]) VALUES (4, N'Master Files', N'Branch', 112, 12, NULL)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [RightsSeqNo], [System]) VALUES (5, N'Master Files', N'Employee', 1231, 12, NULL)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [RightsSeqNo], [System]) VALUES (6, N'Master Files', N'Channel', 1, 1, NULL)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [RightsSeqNo], [System]) VALUES (7, N'Master Files', N'Category', 1, 1, NULL)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [RightsSeqNo], [System]) VALUES (8, N'Master Files', N'Other Receipt Details', 1, 1, NULL)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [RightsSeqNo], [System]) VALUES (9, N'Master Files', N'Other Disbursement Detail', 1, 1, NULL)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [RightsSeqNo], [System]) VALUES (10, N'Master Files', N'Role', 1, 1, NULL)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [RightsSeqNo], [System]) VALUES (11, N'Master Files', N'Access Rights', 1, 1, NULL)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [RightsSeqNo], [System]) VALUES (12, N'Master Files', N'User', 1, 1, NULL)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [RightsSeqNo], [System]) VALUES (13, N'Master Files', N'Position', 1, 1, NULL)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [RightsSeqNo], [System]) VALUES (14, N'Master Files', N'Chart Of Accounts', 1, 1, NULL)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [RightsSeqNo], [System]) VALUES (15, N'Transactions', N'Budget Period', 1, 1, NULL)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [RightsSeqNo], [System]) VALUES (16, N'Transactions', N'Budget Preparation', 1, 1, NULL)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [RightsSeqNo], [System]) VALUES (17, N'Transactions', N'Daily Cash Flow', 1, 1, NULL)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [RightsSeqNo], [System]) VALUES (18, N'Transactions', N'REMCO Request', 1, 1, NULL)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [RightsSeqNo], [System]) VALUES (19, N'Transactions', N'Fund Transfer', 1, 1, NULL)
INSERT [dbo].[Masterfile_SystemRights] ([Id], [Module], [Page], [PageSeqNo], [RightsSeqNo], [System]) VALUES (20, N'Reports', N'Field Premium', 1, 1, NULL)
INSERT [dbo].[Masterfile_User] ([Id], [Username], [Password], [RoleId], [EmployeeId], [Remarks], [Status], [ActiveDirectoryName]) VALUES (1, N'ec', N'HV5Jd7RIpdo6IZZTBQy6ah2mkZ1H3Lka/o60Txgd4bM=', 1, 1, N'sample', 1, NULL)
INSERT [dbo].[Masterfile_User] ([Id], [Username], [Password], [RoleId], [EmployeeId], [Remarks], [Status], [ActiveDirectoryName]) VALUES (2, N'sad', N'HV5Jd7RIpdo6IZZTBQy6ah2mkZ1H3Lka/o60Txgd4bM=', 2, 31, N'lantajo', 1, NULL)
INSERT [dbo].[Masterfile_User] ([Id], [Username], [Password], [RoleId], [EmployeeId], [Remarks], [Status], [ActiveDirectoryName]) VALUES (3, N'esci', N'HV5Jd7RIpdo6IZZTBQy6ah2mkZ1H3Lka/o60Txgd4bM=', 1, 1, N'sample', 1, NULL)
INSERT [dbo].[Masterfile_User] ([Id], [Username], [Password], [RoleId], [EmployeeId], [Remarks], [Status], [ActiveDirectoryName]) VALUES (4, N'gary', N'YKb4g2AmdWwNURcnY3+C1rNgI+balY7y/u/gM+IiQxI=', 2, 2, N'sad', 1, NULL)
INSERT [dbo].[Masterfile_User] ([Id], [Username], [Password], [RoleId], [EmployeeId], [Remarks], [Status], [ActiveDirectoryName]) VALUES (5, N'lord', N'VGMfqW0hZlGF7dgiz7T4B3XvwDrUUclYp7NEmUhm21o=', 3, 2, N'sad', 1, NULL)
INSERT [dbo].[Masterfile_User] ([Id], [Username], [Password], [RoleId], [EmployeeId], [Remarks], [Status], [ActiveDirectoryName]) VALUES (6, N'test', N'HV5Jd7RIpdo6IZZTBQy6ah2mkZ1H3Lka/o60Txgd4bM=', 2, 31, N'edited', 0, N'')
INSERT [dbo].[Masterfile_User] ([Id], [Username], [Password], [RoleId], [EmployeeId], [Remarks], [Status], [ActiveDirectoryName]) VALUES (7, N'retest', N'HV5Jd7RIpdo6IZZTBQy6ah2mkZ1H3Lka/o60Txgd4bM=', 2, 31, N'', 0, N'')
INSERT [dbo].[Transaction_BudgetPeriod] ([Id], [Month], [Year], [DateOpen], [DateClosed], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [OpenBy], [ClosedBy], [OpenRemarks], [ClosedRemarks], [Status], [PeriodStatus]) VALUES (1, N'7', 2018, CAST(N'2018-06-25' AS Date), CAST(N'2018-08-02' AS Date), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 1, 1, N'', N'deasadasdasd', 1, N'Closed')
INSERT [dbo].[Transaction_BudgetPeriod] ([Id], [Month], [Year], [DateOpen], [DateClosed], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [OpenBy], [ClosedBy], [OpenRemarks], [ClosedRemarks], [Status], [PeriodStatus]) VALUES (2, N'8', 2018, CAST(N'2018-08-01' AS Date), CAST(N'2018-08-02' AS Date), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 1, 1, N'remarks', N'', 1, N'Closed')
INSERT [dbo].[Transaction_BudgetPeriod] ([Id], [Month], [Year], [DateOpen], [DateClosed], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [OpenBy], [ClosedBy], [OpenRemarks], [ClosedRemarks], [Status], [PeriodStatus]) VALUES (3, N'1', 2018, CAST(N'2018-08-01' AS Date), CAST(N'2018-08-02' AS Date), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 1, 1, N'asdasd', N'', 1, N'Closed')
INSERT [dbo].[Transaction_BudgetPeriod] ([Id], [Month], [Year], [DateOpen], [DateClosed], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [OpenBy], [ClosedBy], [OpenRemarks], [ClosedRemarks], [Status], [PeriodStatus]) VALUES (4, N'2', 2018, CAST(N'2018-08-01' AS Date), CAST(N'2018-08-02' AS Date), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 1, 1, N'', N'', 1, N'Closed')
INSERT [dbo].[Transaction_BudgetPeriod] ([Id], [Month], [Year], [DateOpen], [DateClosed], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [OpenBy], [ClosedBy], [OpenRemarks], [ClosedRemarks], [Status], [PeriodStatus]) VALUES (5, N'3', 2018, CAST(N'2018-08-01' AS Date), CAST(N'2018-08-02' AS Date), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 1, 1, N'', N'deasadasdasd', 1, N'Closed')
INSERT [dbo].[Transaction_BudgetPeriod] ([Id], [Month], [Year], [DateOpen], [DateClosed], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [OpenBy], [ClosedBy], [OpenRemarks], [ClosedRemarks], [Status], [PeriodStatus]) VALUES (6, N'6', 2018, CAST(N'2018-08-02' AS Date), CAST(N'2018-08-02' AS Date), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 1, 1, N'', N'', 1, N'Closed')
INSERT [dbo].[Transaction_BudgetPeriod] ([Id], [Month], [Year], [DateOpen], [DateClosed], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [OpenBy], [ClosedBy], [OpenRemarks], [ClosedRemarks], [Status], [PeriodStatus]) VALUES (7, N'5', 2018, CAST(N'2018-08-02' AS Date), CAST(N'2018-08-02' AS Date), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 1, 1, N'', N'', 1, N'Closed')
INSERT [dbo].[Transaction_BudgetPeriod] ([Id], [Month], [Year], [DateOpen], [DateClosed], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [OpenBy], [ClosedBy], [OpenRemarks], [ClosedRemarks], [Status], [PeriodStatus]) VALUES (8, N'12', 2018, CAST(N'2018-08-08' AS Date), CAST(N'2018-08-08' AS Date), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 3, 3, N'', N'', 1, N'Closed')
INSERT [dbo].[Transaction_BudgetPeriod] ([Id], [Month], [Year], [DateOpen], [DateClosed], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [OpenBy], [ClosedBy], [OpenRemarks], [ClosedRemarks], [Status], [PeriodStatus]) VALUES (9, N'9', 2018, CAST(N'2018-08-14' AS Date), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 3, NULL, N'', NULL, 1, N'Open')
INSERT [dbo].[Transaction_BudgetPeriod] ([Id], [Month], [Year], [DateOpen], [DateClosed], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [OpenBy], [ClosedBy], [OpenRemarks], [ClosedRemarks], [Status], [PeriodStatus]) VALUES (10, N'4', 2018, CAST(N'2018-08-16' AS Date), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 3, NULL, N'', NULL, 1, N'Open')
INSERT [dbo].[Transaction_BudgetPeriod] ([Id], [Month], [Year], [DateOpen], [DateClosed], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [OpenBy], [ClosedBy], [OpenRemarks], [ClosedRemarks], [Status], [PeriodStatus]) VALUES (11, N'10', 2018, CAST(N'2018-08-16' AS Date), CAST(N'2018-08-16' AS Date), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 3, 3, N'', N'', 1, N'Closed')
INSERT [dbo].[Transaction_BudgetPeriod] ([Id], [Month], [Year], [DateOpen], [DateClosed], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [OpenBy], [ClosedBy], [OpenRemarks], [ClosedRemarks], [Status], [PeriodStatus]) VALUES (12, N'11', 2018, CAST(N'2018-08-16' AS Date), CAST(N'2018-08-16' AS Date), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 3, 3, N'', N'', 1, N'Closed')
INSERT [dbo].[Transaction_BudgetPeriod] ([Id], [Month], [Year], [DateOpen], [DateClosed], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [OpenBy], [ClosedBy], [OpenRemarks], [ClosedRemarks], [Status], [PeriodStatus]) VALUES (13, N'1', 2019, CAST(N'2018-08-16' AS Date), CAST(N'2018-08-16' AS Date), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 3, 1, N'', N'test', 1, N'Closed')
INSERT [dbo].[Transaction_BudgetPeriod] ([Id], [Month], [Year], [DateOpen], [DateClosed], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [OpenBy], [ClosedBy], [OpenRemarks], [ClosedRemarks], [Status], [PeriodStatus]) VALUES (14, N'2', 2019, CAST(N'2018-08-16' AS Date), CAST(N'2018-08-16' AS Date), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 3, 3, N'', N'', 1, N'Closed')
INSERT [dbo].[Transaction_BudgetPeriod] ([Id], [Month], [Year], [DateOpen], [DateClosed], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [OpenBy], [ClosedBy], [OpenRemarks], [ClosedRemarks], [Status], [PeriodStatus]) VALUES (15, N'3', 2019, CAST(N'2018-08-16' AS Date), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 3, NULL, N'', NULL, 1, N'Open')
INSERT [dbo].[Transaction_BudgetPeriod] ([Id], [Month], [Year], [DateOpen], [DateClosed], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [OpenBy], [ClosedBy], [OpenRemarks], [ClosedRemarks], [Status], [PeriodStatus]) VALUES (16, N'4', 2019, CAST(N'2018-08-16' AS Date), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 3, NULL, N'', NULL, 1, N'Open')
INSERT [dbo].[Transaction_BudgetPeriod] ([Id], [Month], [Year], [DateOpen], [DateClosed], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [OpenBy], [ClosedBy], [OpenRemarks], [ClosedRemarks], [Status], [PeriodStatus]) VALUES (17, N'5', 2019, CAST(N'2018-08-16' AS Date), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 3, NULL, N'', NULL, 1, N'Open')
INSERT [dbo].[Transaction_BudgetPeriod] ([Id], [Month], [Year], [DateOpen], [DateClosed], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [OpenBy], [ClosedBy], [OpenRemarks], [ClosedRemarks], [Status], [PeriodStatus]) VALUES (18, N'6', 2019, CAST(N'2018-08-22' AS Date), CAST(N'2018-08-22' AS Date), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 3, 3, N'', N'', 1, N'Closed')
INSERT [dbo].[Transaction_BudgetPreparation] ([Id], [BudgetPeriodId], [BranchId], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [UserId], [Remarks], [Status]) VALUES (1, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'1', 1)
INSERT [dbo].[Transaction_BudgetPreparation] ([Id], [BudgetPeriodId], [BranchId], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [UserId], [Remarks], [Status]) VALUES (2, 7, 7, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'sadasd', 1)
INSERT [dbo].[Transaction_BudgetPreparation] ([Id], [BudgetPeriodId], [BranchId], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [UserId], [Remarks], [Status]) VALUES (3, 7, 10, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'sadasd', 1)
INSERT [dbo].[Transaction_BudgetPreparation] ([Id], [BudgetPeriodId], [BranchId], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [UserId], [Remarks], [Status]) VALUES (4, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'sadasd', 1)
INSERT [dbo].[Transaction_BudgetPreparation] ([Id], [BudgetPeriodId], [BranchId], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [UserId], [Remarks], [Status]) VALUES (5, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'Generated using API', 1)
INSERT [dbo].[Transaction_BudgetPreparation] ([Id], [BudgetPeriodId], [BranchId], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [UserId], [Remarks], [Status]) VALUES (6, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'asd', 1)
INSERT [dbo].[Transaction_BudgetPreparation] ([Id], [BudgetPeriodId], [BranchId], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [UserId], [Remarks], [Status]) VALUES (7, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'asd', 1)
INSERT [dbo].[Transaction_BudgetPreparation] ([Id], [BudgetPeriodId], [BranchId], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [UserId], [Remarks], [Status]) VALUES (8, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'sadasd', 1)
INSERT [dbo].[Transaction_BudgetPreparation] ([Id], [BudgetPeriodId], [BranchId], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [UserId], [Remarks], [Status]) VALUES (9, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparation] ([Id], [BudgetPeriodId], [BranchId], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [UserId], [Remarks], [Status]) VALUES (10, 7, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparation] ([Id], [BudgetPeriodId], [BranchId], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [UserId], [Remarks], [Status]) VALUES (11, 7, 3, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'sadasd', 1)
INSERT [dbo].[Transaction_BudgetPreparation] ([Id], [BudgetPeriodId], [BranchId], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [UserId], [Remarks], [Status]) VALUES (12, 7, 4, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparation] ([Id], [BudgetPeriodId], [BranchId], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [UserId], [Remarks], [Status]) VALUES (13, 7, 5, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparation] ([Id], [BudgetPeriodId], [BranchId], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [UserId], [Remarks], [Status]) VALUES (14, 7, 3, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'sadasd', 1)
INSERT [dbo].[Transaction_BudgetPreparation] ([Id], [BudgetPeriodId], [BranchId], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [UserId], [Remarks], [Status]) VALUES (15, 7, 6, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparation] ([Id], [BudgetPeriodId], [BranchId], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [UserId], [Remarks], [Status]) VALUES (16, 7, 8, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparation] ([Id], [BudgetPeriodId], [BranchId], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [UserId], [Remarks], [Status]) VALUES (17, 7, 9, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparation] ([Id], [BudgetPeriodId], [BranchId], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [UserId], [Remarks], [Status]) VALUES (18, 7, 11, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparation] ([Id], [BudgetPeriodId], [BranchId], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [UserId], [Remarks], [Status]) VALUES (19, 7, 12, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparation] ([Id], [BudgetPeriodId], [BranchId], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [UserId], [Remarks], [Status]) VALUES (20, 7, 44, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparation] ([Id], [BudgetPeriodId], [BranchId], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [UserId], [Remarks], [Status]) VALUES (21, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, 3, N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparation] ([Id], [BudgetPeriodId], [BranchId], [TotalInflowBudget], [TotalInflowActual], [TotalInflowVariance], [TotalOutflowBudget], [TotalOutflowActual], [TotalOutflowVariance], [UserId], [Remarks], [Status]) VALUES (22, 1, 11, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (1, 1, 1, N'123', 1, N'detail', N'sa', 1, CAST(1000.00 AS Decimal(10, 2)), 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(1000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1000.00 AS Decimal(10, 2)), N'sample', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (2, 1, 1, N'123', 1, N'detail', N'sa', 1, CAST(1000.00 AS Decimal(10, 2)), 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(1000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1000.00 AS Decimal(10, 2)), N'sample', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (3, 1, 0, N'123', 1, N'detail', N'sa', 1, CAST(1000.00 AS Decimal(10, 2)), 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(1000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1000.00 AS Decimal(10, 2)), N'sample', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (4, 3, 0, N'reloans', 1, N'ABALA MERSON ENJAMBRE', N'', 1, CAST(10000.00 AS Decimal(10, 2)), 1, 0, CAST(10000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(10000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (5, 3, 0, N'reloans', 1, N'ALDUIZA ELIZABETH BASANAL', N'', 1, CAST(10000.00 AS Decimal(10, 2)), 3, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(10000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(10000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (6, 3, 0, N'reloans', 1, N'LIBONGCOGON LUZVIMINDA DAYAGDAL', N'', 1, CAST(10000.00 AS Decimal(10, 2)), 2, 0, CAST(0.00 AS Decimal(10, 2)), CAST(10000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(10000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (7, 3, 0, N'reloans', 1, N'TORREFIEL YOLANDA ALOLOR', N'', 1, CAST(15000.00 AS Decimal(10, 2)), 1, 0, CAST(15000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(15000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (8, 3, 0, N'reloans', 1, N'PADIN MARIA VICTORIA PAIMALAN', N'', 1, CAST(8000.00 AS Decimal(10, 2)), 2, 0, CAST(0.00 AS Decimal(10, 2)), CAST(8000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(8000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (9, 3, 0, N'reloans', 1, N'DULLA RUTH DIAPERA', N'', 1, CAST(7000.00 AS Decimal(10, 2)), 5, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(7000.00 AS Decimal(10, 2)), CAST(7000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (10, 3, 0, N'reloans', 1, N'ALOLOR ROSANA BAYLON', N'', 1, CAST(17000.00 AS Decimal(10, 2)), 5, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(17000.00 AS Decimal(10, 2)), CAST(17000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (11, 3, 0, N'reloans', 1, N'BINGCULA CHERYL URSAL', N'', 1, CAST(19000.00 AS Decimal(10, 2)), 5, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(19000.00 AS Decimal(10, 2)), CAST(19000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (12, 3, 0, N'reloans', 1, N'DEGRACIA MARESSA PATERIA.', N'', 1, CAST(15000.00 AS Decimal(10, 2)), 2, 0, CAST(0.00 AS Decimal(10, 2)), CAST(15000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(15000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (13, 3, 0, N'reloans', 1, N'BASANAL RENALYN TANECA', N'', 1, CAST(8000.00 AS Decimal(10, 2)), 1, 0, CAST(8000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(8000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (14, 3, 0, N'reloans', 1, N'QUINAL MAXIMINO BARDA', N'', 1, CAST(20000.00 AS Decimal(10, 2)), 4, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(20000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(20000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (15, 3, 0, N'reloans', 1, N'LAPINID ARLENE MERCADER', N'', 1, CAST(25000.00 AS Decimal(10, 2)), 1, 0, CAST(25000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(25000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (16, 3, 0, N'reloans', 1, N'TELEBRICO MARIFEL SECRETARIA', N'', 1, CAST(15000.00 AS Decimal(10, 2)), 4, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(15000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(15000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (17, 3, 0, N'reloans', 1, N'LANA FELICISIMO MANAYAGA', N'', 1, CAST(10000.00 AS Decimal(10, 2)), 3, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(10000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(10000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (18, 3, 0, N'reloans', 1, N'RECTO FELISA BACUS', N'', 1, CAST(11000.00 AS Decimal(10, 2)), 1, 0, CAST(11000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(11000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (19, 3, 0, N'reloans', 1, N'BARAQUIA ANALYN NADUNZA', N'', 1, CAST(10000.00 AS Decimal(10, 2)), 2, 0, CAST(0.00 AS Decimal(10, 2)), CAST(10000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(10000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (20, 3, 0, N'reloans', 1, N'REMOCALDO JONA DAYANGCO', N'', 1, CAST(9000.00 AS Decimal(10, 2)), 2, 0, CAST(0.00 AS Decimal(10, 2)), CAST(9000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(9000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (21, 3, 0, N'reloans', 1, N'QUISMUNDO LIGAYA S.', N'', 1, CAST(15000.00 AS Decimal(10, 2)), 1, 0, CAST(15000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(15000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (22, 3, 0, N'reloans', 1, N'DAYAGAN MARIAFIL TARAY', N'', 1, CAST(4000.00 AS Decimal(10, 2)), 3, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(4000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(4000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (23, 3, 0, N'reloans', 1, N'PADIN PRISCA S.', N'', 1, CAST(3000.00 AS Decimal(10, 2)), 1, 0, CAST(3000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(3000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (24, 3, 0, N'reloans', 1, N'IJARA MERLINDA M.', N'', 1, CAST(5000.00 AS Decimal(10, 2)), 1, 0, CAST(5000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(5000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (25, 3, 0, N'reloans', 1, N'REMOLADO EVE MICHELLE VARGA', N'', 1, CAST(5000.00 AS Decimal(10, 2)), 3, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(5000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(5000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (26, 3, 0, N'reloans', 1, N'GONZALES ANGELA BARIOGA', N'', 1, CAST(15000.00 AS Decimal(10, 2)), 2, 0, CAST(0.00 AS Decimal(10, 2)), CAST(15000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(15000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (27, 3, 0, N'reloans', 1, N'DE GRACIA CLAIRE CATHLYN ENAD', N'', 1, CAST(15000.00 AS Decimal(10, 2)), 2, 0, CAST(0.00 AS Decimal(10, 2)), CAST(15000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(15000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (28, 3, 0, N'reloans', 1, N'TANGI AN RAZEL MADAYA', N'', 1, CAST(15000.00 AS Decimal(10, 2)), 5, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(15000.00 AS Decimal(10, 2)), CAST(15000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (29, 3, 0, N'reloans', 1, N'ALEDO ROSALYN BARGAMENTO', N'', 1, CAST(10000.00 AS Decimal(10, 2)), 2, 0, CAST(0.00 AS Decimal(10, 2)), CAST(10000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(10000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (30, 3, 0, N'reloans', 1, N'MANCERA ELIZABETH AISON', N'', 1, CAST(10000.00 AS Decimal(10, 2)), 3, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(10000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(10000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (31, 3, 0, N'reloans', 1, N'REPOLIDON MARY CHRIS AVILA', N'', 1, CAST(10000.00 AS Decimal(10, 2)), 4, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(10000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(10000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (32, 3, 0, N'reloans', 1, N'FLORES SAMUEL LAPAS', N'', 1, CAST(5000.00 AS Decimal(10, 2)), 4, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(5000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(5000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (33, 3, 0, N'reloans', 1, N'NADONZA GENEVIEVE TRAZONA', N'', 1, CAST(12000.00 AS Decimal(10, 2)), 2, 0, CAST(0.00 AS Decimal(10, 2)), CAST(12000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(12000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (34, 3, 0, N'reloans', 1, N'FLORES RENITA DIABELOS', N'', 1, CAST(20000.00 AS Decimal(10, 2)), 3, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(20000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(20000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (35, 3, 0, N'reloans', 1, N'LUMAPGUID MA.JERALIN EMFINADO', N'', 1, CAST(10000.00 AS Decimal(10, 2)), 2, 0, CAST(0.00 AS Decimal(10, 2)), CAST(10000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(10000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (36, 3, 0, N'reloans', 1, N'EMPINADO JINA LAURE', N'', 1, CAST(10000.00 AS Decimal(10, 2)), 2, 0, CAST(0.00 AS Decimal(10, 2)), CAST(10000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(10000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (37, 3, 0, N'reloans', 1, N'MEDIANA CHEYZIEL MARIE CELIS', N'', 1, CAST(7000.00 AS Decimal(10, 2)), 1, 0, CAST(7000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(7000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (38, 3, 0, N'reloans', 1, N'PENAFLOR JENELYN VIOSANO', N'', 1, CAST(15000.00 AS Decimal(10, 2)), 4, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(15000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(15000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (39, 3, 0, N'reloans', 1, N'LAPINA GENALIN BARBADILLO', N'', 1, CAST(5000.00 AS Decimal(10, 2)), 2, 0, CAST(0.00 AS Decimal(10, 2)), CAST(5000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(5000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (40, 3, 0, N'reloans', 1, N'DAYOTA JENALYN CAMINGAO', N'', 1, CAST(10000.00 AS Decimal(10, 2)), 5, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(10000.00 AS Decimal(10, 2)), CAST(10000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (41, 3, 0, N'reloans', 1, N'GIOUGIOU FLORENCIA HILUDO', N'', 1, CAST(4000.00 AS Decimal(10, 2)), 2, 0, CAST(0.00 AS Decimal(10, 2)), CAST(4000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(4000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (42, 3, 0, N'reloans', 1, N'CARTIN ALICIA TA-ER', N'', 1, CAST(7000.00 AS Decimal(10, 2)), 2, 0, CAST(0.00 AS Decimal(10, 2)), CAST(7000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(7000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (43, 3, 0, N'reloans', 1, N'ALEGARBES MIRASOL ALCOVER', N'', 1, CAST(5000.00 AS Decimal(10, 2)), 1, 0, CAST(5000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(5000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (44, 3, 0, N'reloans', 1, N'MANCERA ALVIN PAMISA', N'', 1, CAST(4000.00 AS Decimal(10, 2)), 1, 0, CAST(4000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(4000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (45, 3, 0, N'reloans', 1, N'DAYONDON IMELDA ABABA', N'', 1, CAST(5000.00 AS Decimal(10, 2)), 4, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(5000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(5000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (46, 3, 0, N'reloans', 1, N'MATAGANAS MARIVIC  DIAPERA', N'', 1, CAST(5000.00 AS Decimal(10, 2)), 4, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(5000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(5000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (47, 3, 0, N'reloans', 1, N'CALINDAO ROCHELLE ENJAMBRE', N'', 1, CAST(5000.00 AS Decimal(10, 2)), 2, 0, CAST(0.00 AS Decimal(10, 2)), CAST(5000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(5000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (48, 3, 0, N'reloans', 1, N'TUBON ALTHIE BOLINAWAN', N'', 1, CAST(5000.00 AS Decimal(10, 2)), 5, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(5000.00 AS Decimal(10, 2)), CAST(5000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (49, 3, 0, N'reloans', 1, N'LABIS CONCEPCION GEMAL', N'', 1, CAST(30000.00 AS Decimal(10, 2)), 4, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(30000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(30000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (50, 3, 0, N'reloans', 1, N'QUILO ELMA RODILA', N'', 1, CAST(15000.00 AS Decimal(10, 2)), 4, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(15000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(15000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (51, 3, 0, N'reloans', 1, N'BASANAL NORMA MANISCAN', N'', 1, CAST(11000.00 AS Decimal(10, 2)), 2, 0, CAST(0.00 AS Decimal(10, 2)), CAST(11000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(11000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (52, 3, 0, N'reloans', 1, N'ALVARADO MARITES LABIS', N'', 1, CAST(15000.00 AS Decimal(10, 2)), 4, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(15000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(15000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (53, 3, 0, N'reloans', 1, N'CAMPANA FE MAGIE PARAZ', N'', 1, CAST(20000.00 AS Decimal(10, 2)), 5, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(20000.00 AS Decimal(10, 2)), CAST(20000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (54, 3, 0, N'reloans', 1, N'ALEGADO DELIA BARCENILLA', N'', 1, CAST(20000.00 AS Decimal(10, 2)), 3, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(20000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(20000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (55, 3, 0, N'reloans', 1, N'NAVARES MARY JANE CAPARIDA', N'', 1, CAST(40000.00 AS Decimal(10, 2)), 2, 0, CAST(0.00 AS Decimal(10, 2)), CAST(40000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(40000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (56, 3, 0, N'reloans', 1, N'REPOLIDON TERESITA  NAVASQUEZ', N'', 1, CAST(30000.00 AS Decimal(10, 2)), 2, 0, CAST(0.00 AS Decimal(10, 2)), CAST(30000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(30000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (57, 3, 0, N'reloans', 1, N'CADAY MARIBEL PARAZ', N'', 1, CAST(20000.00 AS Decimal(10, 2)), 5, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(20000.00 AS Decimal(10, 2)), CAST(20000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (58, 3, 0, N'reloans', 0, N'Loan', N'', 1, CAST(6238054.00 AS Decimal(10, 2)), 0, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(6238054.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (59, 3, 0, N'reloans', 0, N'CBU/Savings', N'', 1, CAST(620950.00 AS Decimal(10, 2)), 0, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(620950.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (60, 3, 2, N'Other Collection', 0, N'123', N'', 1, CAST(1.00 AS Decimal(10, 2)), 1, 2, CAST(1.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (61, 3, 2, N'Other Collection', 0, N'aaa', N'', 1, CAST(2.00 AS Decimal(10, 2)), 1, 2, CAST(2.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (62, 21, 0, N'Other Disbursement', 0, N'edited', N'', 1, CAST(12.00 AS Decimal(10, 2)), 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (63, 3, 1, N'Other Disbursement', 0, N'sa', N'', 1, CAST(1.00 AS Decimal(10, 2)), 1, 1, CAST(1.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (64, 21, 0, N'collections', 0, N'loan', N'', 1, CAST(6619273.00 AS Decimal(10, 2)), 0, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(6619273.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (65, 21, 0, N'collections', 0, N'cbu/savings', N'', 1, CAST(598900.00 AS Decimal(10, 2)), 0, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(598900.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (66, 21, 0, N'Other Collection', 0, N'Sample', N'', 1, CAST(11111.00 AS Decimal(10, 2)), 2, 4, CAST(0.00 AS Decimal(10, 2)), CAST(11111.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(11111.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (67, 21, 0, N'Other Collection', 0, N'Receipt Detail', N'', 1, CAST(1.00 AS Decimal(10, 2)), 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (68, 21, 0, N'Other Collection', 0, N'Another', N'', 1, CAST(2.00 AS Decimal(10, 2)), 5, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (69, 21, 0, N'Other Collection', 0, N'Insurance', N'', 1, CAST(100.00 AS Decimal(10, 2)), 2, 2, CAST(0.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (70, 21, 0, N'category sample', 0, N'Collection', N'', 1, CAST(12.00 AS Decimal(10, 2)), 4, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (71, 21, 0, N'Other Disbursement', 0, N'Print', N'', 1, CAST(1000.00 AS Decimal(10, 2)), 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(1000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (72, 21, 0, N'Other Disbursement', 0, N'Loan', N'', 1, CAST(1500.00 AS Decimal(10, 2)), 2, 1, CAST(0.00 AS Decimal(10, 2)), CAST(1500.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1500.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (73, 21, 0, N'Other Disbursement', 0, N'Description of Disbursement', N'', 1, CAST(2001.00 AS Decimal(10, 2)), 1, 1, CAST(2001.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(2001.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (74, 3, 0, N'reloans', 1, N'EMBUDO MARILYN  MANILA', N'', 1, CAST(5000.00 AS Decimal(10, 2)), 4, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(5000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(5000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (75, 3, 0, N'reloans', 1, N'OBLIANDA BRANDO GELLA', N'', 1, CAST(8000.00 AS Decimal(10, 2)), 3, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(8000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(8000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (76, 3, 0, N'reloans', 1, N'ALBORES GEMMA BANDOLA', N'', 1, CAST(20000.00 AS Decimal(10, 2)), 2, 0, CAST(0.00 AS Decimal(10, 2)), CAST(20000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(20000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (77, 3, 0, N'reloans', 1, N'MAMALIAS ROSELYN DAUB', N'', 1, CAST(20000.00 AS Decimal(10, 2)), 4, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(20000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(20000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (78, 3, 0, N'new_loans', 1, N'Vea', N'', 1, CAST(100.00 AS Decimal(10, 2)), 2, 5, CAST(0.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (79, 3, 0, N'new_loans', 1, N'Gary', N'', 1, CAST(200.00 AS Decimal(10, 2)), 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(200.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(200.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (80, 3, 0, N'new_loans', 1, N'Gary', N'', 1, CAST(200.00 AS Decimal(10, 2)), 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(200.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(200.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (81, 3, 0, N'new_loans', 1, N'Gary', N'', 1, CAST(200.00 AS Decimal(10, 2)), 3, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(200.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(200.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (82, 3, 0, N'new_loans', 1, N'', N'', 1, CAST(0.00 AS Decimal(10, 2)), 0, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (83, 21, 0, N'reloans', 1, N'SARTE LUZVISMINDA PANERIO', N'', 1, CAST(20000.00 AS Decimal(10, 2)), 1, 0, CAST(20000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(20000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (84, 21, 0, N'reloans', 1, N'CONCOLES JOVELISA LAMBAYAN', N'', 1, CAST(8000.00 AS Decimal(10, 2)), 2, 0, CAST(0.00 AS Decimal(10, 2)), CAST(8000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(8000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (85, 21, 0, N'new_loans', 1, N'Test', N'', 2, CAST(1000.00 AS Decimal(10, 2)), 1, 1, CAST(1000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (86, 21, 0, N'reloans', 1, N'SERENO SHERLY CENSORO', N'', 1, CAST(9000.00 AS Decimal(10, 2)), 3, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(9000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(9000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (87, 21, 0, N'reloans', 1, N'PARAME MYRA', N'', 1, CAST(17000.00 AS Decimal(10, 2)), 1, 0, CAST(17000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(17000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (88, 21, 0, N'reloans', 1, N'BACUS ANALEN ALBERCA', N'', 1, CAST(15000.00 AS Decimal(10, 2)), 2, 0, CAST(0.00 AS Decimal(10, 2)), CAST(15000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(15000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (89, 21, 0, N'reloans', 1, N'ALBERCA ALEJANDRA BARTIDO', N'', 1, CAST(20000.00 AS Decimal(10, 2)), 4, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(20000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(20000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (90, 21, 0, N'reloans', 1, N'ALCANO FELISA TEMPLA', N'', 1, CAST(10000.00 AS Decimal(10, 2)), 5, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(10000.00 AS Decimal(10, 2)), CAST(10000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (91, 21, 0, N'reloans', 1, N'ALBACITE JOAN GEALON', N'', 1, CAST(11000.00 AS Decimal(10, 2)), 3, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(11000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(11000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (92, 21, 0, N'reloans', 1, N'ALBURO JENEVEB ALBERCA', N'', 1, CAST(20000.00 AS Decimal(10, 2)), 3, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(20000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(20000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_BudgetPreparationDetail] ([DetailId], [BudgetPreparationId], [CategoryId], [CategoryDescription], [TSEmployeeId], [Detail], [Reference], [Qty], [Amount], [WeekNo], [ChannelId], [Week1], [Week2], [Week3], [Week4], [Week5], [Total], [Remarks], [Status]) VALUES (93, 21, 0, N'reloans', 1, N'MAMAC MARIA JOY PUERTO', N'', 1, CAST(19000.00 AS Decimal(10, 2)), 2, 0, CAST(0.00 AS Decimal(10, 2)), CAST(19000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(19000.00 AS Decimal(10, 2)), N'Generated via API', 1)
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (1, CAST(N'2018-06-03' AS Date), 1, NULL, 1, N'', CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (2, CAST(N'2018-06-03' AS Date), 1, NULL, 1, N'', CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (3, CAST(N'2018-06-03' AS Date), 2, NULL, 2, N'', CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (4, CAST(N'2018-06-03' AS Date), 2, NULL, 2, N'', CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (5, CAST(N'2018-06-04' AS Date), 1, NULL, 1, N'', CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (6, CAST(N'2018-06-04' AS Date), 1, NULL, 1, N'', CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (7, CAST(N'2018-06-04' AS Date), 2, NULL, 2, N'', CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (8, CAST(N'2018-06-04' AS Date), 2, NULL, 2, N'', CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (9, CAST(N'2018-06-05' AS Date), 1, NULL, 1, N'', CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (10, CAST(N'2018-06-05' AS Date), 1, NULL, 1, N'', CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (11, CAST(N'2018-06-05' AS Date), 2, NULL, 2, N'', CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (12, CAST(N'2018-06-05' AS Date), 2, NULL, 2, N'', CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (13, CAST(N'2018-06-06' AS Date), 1, NULL, 1, N'', CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (14, CAST(N'2018-06-06' AS Date), 1, NULL, 1, N'', CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (15, CAST(N'2018-06-06' AS Date), 2, NULL, 2, N'', CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (16, CAST(N'2018-06-06' AS Date), 2, NULL, 2, N'', CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (17, CAST(N'2018-06-07' AS Date), 1, NULL, 1, N'', CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (18, CAST(N'2018-06-07' AS Date), 1, NULL, 1, N'', CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (19, CAST(N'2018-06-07' AS Date), 2, NULL, 2, N'', CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (20, CAST(N'2018-06-07' AS Date), 2, NULL, 2, N'', CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (21, CAST(N'2018-06-08' AS Date), 1, NULL, 1, N'', CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (22, CAST(N'2018-06-08' AS Date), 1, NULL, 1, N'', CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (23, CAST(N'2018-06-08' AS Date), 2, NULL, 2, N'', CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (24, CAST(N'2018-06-08' AS Date), 2, NULL, 2, N'', CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (25, CAST(N'2018-06-09' AS Date), 1, NULL, 1, N'', CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (26, CAST(N'2018-06-09' AS Date), 1, NULL, 1, N'', CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (27, CAST(N'2018-06-09' AS Date), 2, NULL, 2, N'', CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (28, CAST(N'2018-06-09' AS Date), 2, NULL, 2, N'', CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (29, CAST(N'2018-06-10' AS Date), 1, NULL, 1, N'', CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (30, CAST(N'2018-06-10' AS Date), 1, NULL, 1, N'', CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (31, CAST(N'2018-06-10' AS Date), 2, NULL, 2, N'', CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (32, CAST(N'2018-06-10' AS Date), 2, NULL, 2, N'', CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (33, CAST(N'2018-06-11' AS Date), 1, NULL, 1, N'', CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (34, CAST(N'2018-06-11' AS Date), 1, NULL, 1, N'', CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (35, CAST(N'2018-06-11' AS Date), 2, NULL, 2, N'', CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (36, CAST(N'2018-06-11' AS Date), 2, NULL, 2, N'', CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (37, CAST(N'2018-06-12' AS Date), 1, NULL, 1, N'', CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (38, CAST(N'2018-06-12' AS Date), 1, NULL, 1, N'', CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (39, CAST(N'2018-06-12' AS Date), 2, NULL, 2, N'', CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (40, CAST(N'2018-06-12' AS Date), 2, NULL, 2, N'', CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (41, CAST(N'2018-07-03' AS Date), 1, NULL, 1, N'', CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (42, CAST(N'2018-07-03' AS Date), 1, NULL, 1, N'', CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (43, CAST(N'2018-07-03' AS Date), 2, NULL, 2, N'', CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (44, CAST(N'2018-07-03' AS Date), 2, NULL, 2, N'', CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (45, CAST(N'2018-07-04' AS Date), 1, NULL, 1, N'', CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (46, CAST(N'2018-07-04' AS Date), 1, NULL, 1, N'', CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (47, CAST(N'2018-07-04' AS Date), 2, NULL, 2, N'', CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (48, CAST(N'2018-07-04' AS Date), 2, NULL, 2, N'', CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (49, CAST(N'2018-07-05' AS Date), 1, NULL, 1, N'', CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (50, CAST(N'2018-07-05' AS Date), 1, NULL, 1, N'', CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (51, CAST(N'2018-07-05' AS Date), 2, NULL, 2, N'', CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (52, CAST(N'2018-07-05' AS Date), 2, NULL, 2, N'', CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (53, CAST(N'2018-07-06' AS Date), 1, NULL, 1, N'', CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (54, CAST(N'2018-07-06' AS Date), 1, NULL, 1, N'', CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (55, CAST(N'2018-07-06' AS Date), 2, NULL, 2, N'', CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (56, CAST(N'2018-07-06' AS Date), 2, NULL, 2, N'', CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (57, CAST(N'2018-07-07' AS Date), 1, NULL, 1, N'', CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (58, CAST(N'2018-07-07' AS Date), 1, NULL, 1, N'', CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (59, CAST(N'2018-07-07' AS Date), 2, NULL, 2, N'', CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (60, CAST(N'2018-07-07' AS Date), 2, NULL, 2, N'', CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (61, CAST(N'2018-07-08' AS Date), 1, NULL, 1, N'', CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (62, CAST(N'2018-07-08' AS Date), 1, NULL, 1, N'', CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (63, CAST(N'2018-07-08' AS Date), 2, NULL, 2, N'', CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (64, CAST(N'2018-07-08' AS Date), 2, NULL, 2, N'', CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (65, CAST(N'2018-07-09' AS Date), 1, NULL, 1, N'', CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (66, CAST(N'2018-07-09' AS Date), 1, NULL, 1, N'', CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (67, CAST(N'2018-07-09' AS Date), 2, NULL, 2, N'', CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (68, CAST(N'2018-07-09' AS Date), 2, NULL, 2, N'', CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (69, CAST(N'2018-07-10' AS Date), 1, NULL, 1, N'', CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (70, CAST(N'2018-07-10' AS Date), 1, NULL, 1, N'', CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (71, CAST(N'2018-07-10' AS Date), 2, NULL, 2, N'', CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (72, CAST(N'2018-07-10' AS Date), 2, NULL, 2, N'', CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (73, CAST(N'2018-07-11' AS Date), 1, NULL, 1, N'', CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (74, CAST(N'2018-07-11' AS Date), 1, NULL, 1, N'', CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (75, CAST(N'2018-07-11' AS Date), 2, NULL, 2, N'', CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (76, CAST(N'2018-07-11' AS Date), 2, NULL, 2, N'', CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (77, CAST(N'2018-07-12' AS Date), 1, NULL, 1, N'', CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (78, CAST(N'2018-07-12' AS Date), 1, NULL, 1, N'', CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (79, CAST(N'2018-07-12' AS Date), 2, NULL, 2, N'', CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Transaction_DailyCashFlow] ([Id], [Date], [CategoryId], [CategoryDescription], [DetailsId], [Details], [Amount]) VALUES (80, CAST(N'2018-07-12' AS Date), 2, NULL, 2, N'', CAST(20000.00 AS Decimal(10, 2)))
/****** Object:  Index [IQ_Masterfile_AccessRights_RoleID]    Script Date: 8/25/2018 10:59:25 AM ******/
CREATE NONCLUSTERED INDEX [IQ_Masterfile_AccessRights_RoleID] ON [dbo].[Masterfile_AccessRights]
(
	[RoleId] ASC,
	[PageActionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IQ_Masterfile_Area]    Script Date: 8/25/2018 10:59:25 AM ******/
CREATE NONCLUSTERED INDEX [IQ_Masterfile_Area] ON [dbo].[Masterfile_Area]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Masterfile_Branch]    Script Date: 8/25/2018 10:59:25 AM ******/
ALTER TABLE [dbo].[Masterfile_Branch] ADD  CONSTRAINT [UQ_Masterfile_Branch] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IQ_Masterfile_ChartOfAccount_Code]    Script Date: 8/25/2018 10:59:25 AM ******/
CREATE NONCLUSTERED INDEX [IQ_Masterfile_ChartOfAccount_Code] ON [dbo].[Masterfile_ChartOfAccount]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IQ_Masterfile_District]    Script Date: 8/25/2018 10:59:25 AM ******/
CREATE NONCLUSTERED INDEX [IQ_Masterfile_District] ON [dbo].[Masterfile_District]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IQ_Masterfile_Employee_ContractNumber]    Script Date: 8/25/2018 10:59:25 AM ******/
CREATE NONCLUSTERED INDEX [IQ_Masterfile_Employee_ContractNumber] ON [dbo].[Masterfile_Employee]
(
	[ContactNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IQ_Masterfile_Employee_EmailAddress]    Script Date: 8/25/2018 10:59:25 AM ******/
CREATE NONCLUSTERED INDEX [IQ_Masterfile_Employee_EmailAddress] ON [dbo].[Masterfile_Employee]
(
	[EmailAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IQ_Masterfile_OtherReceiptDetail_Description]    Script Date: 8/25/2018 10:59:25 AM ******/
CREATE NONCLUSTERED INDEX [IQ_Masterfile_OtherReceiptDetail_Description] ON [dbo].[Masterfile_OtherReceiptDetail]
(
	[Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IQ_Masterfile_Position_Code]    Script Date: 8/25/2018 10:59:25 AM ******/
CREATE NONCLUSTERED INDEX [IQ_Masterfile_Position_Code] ON [dbo].[Masterfile_Position]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IQ_Masterfile_Name]    Script Date: 8/25/2018 10:59:25 AM ******/
CREATE NONCLUSTERED INDEX [IQ_Masterfile_Name] ON [dbo].[Masterfile_Region]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Masterfile_User_Username]    Script Date: 8/25/2018 10:59:25 AM ******/
ALTER TABLE [dbo].[Masterfile_User] ADD  CONSTRAINT [UQ_Masterfile_User_Username] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IQ_Transaction_BudgetPeriod_Year]    Script Date: 8/25/2018 10:59:25 AM ******/
CREATE NONCLUSTERED INDEX [IQ_Transaction_BudgetPeriod_Year] ON [dbo].[Transaction_BudgetPeriod]
(
	[Year] ASC,
	[Month] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Masterfile_OtherDisbursementDetail] ADD  DEFAULT ((0)) FOR [ChannelId]
GO
ALTER TABLE [dbo].[Masterfile_OtherDisbursementDetail] ADD  DEFAULT ((0)) FOR [Day]
GO
ALTER TABLE [dbo].[Masterfile_OtherReceiptDetail] ADD  DEFAULT ((0)) FOR [ChannelId]
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
ALTER TABLE [dbo].[Masterfile_AccessRights]  WITH CHECK ADD  CONSTRAINT [FK_Masterfile_AccessRights_Masterfile_PageAction_PageActionId] FOREIGN KEY([PageActionId])
REFERENCES [dbo].[Masterfile_PageAction] ([Id])
GO
ALTER TABLE [dbo].[Masterfile_AccessRights] CHECK CONSTRAINT [FK_Masterfile_AccessRights_Masterfile_PageAction_PageActionId]
GO
ALTER TABLE [dbo].[Masterfile_AccessRights]  WITH CHECK ADD  CONSTRAINT [FK_Masterfile_AccessRights_Masterfile_Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Masterfile_Role] ([Id])
GO
ALTER TABLE [dbo].[Masterfile_AccessRights] CHECK CONSTRAINT [FK_Masterfile_AccessRights_Masterfile_Role_RoleId]
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
ALTER TABLE [dbo].[Masterfile_Employee]  WITH CHECK ADD  CONSTRAINT [FK_Masterfile_Employee_Masterfile_Position_PositionId] FOREIGN KEY([PositionId])
REFERENCES [dbo].[Masterfile_Position] ([Id])
GO
ALTER TABLE [dbo].[Masterfile_Employee] CHECK CONSTRAINT [FK_Masterfile_Employee_Masterfile_Position_PositionId]
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
ALTER TABLE [dbo].[Masterfile_PageAction]  WITH CHECK ADD  CONSTRAINT [FK_Masterfile_PageAction_Masterfile_Function_FunctionId] FOREIGN KEY([FunctionId])
REFERENCES [dbo].[Masterfile_Function] ([Id])
GO
ALTER TABLE [dbo].[Masterfile_PageAction] CHECK CONSTRAINT [FK_Masterfile_PageAction_Masterfile_Function_FunctionId]
GO
ALTER TABLE [dbo].[Masterfile_PageAction]  WITH CHECK ADD  CONSTRAINT [FK_Masterfile_PageAction_Masterfile_SystemRights_SystemRightsId] FOREIGN KEY([SystemRightsId])
REFERENCES [dbo].[Masterfile_SystemRights] ([Id])
GO
ALTER TABLE [dbo].[Masterfile_PageAction] CHECK CONSTRAINT [FK_Masterfile_PageAction_Masterfile_SystemRights_SystemRightsId]
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
ALTER TABLE [dbo].[Transaction_BudgetPreparation]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_BudgetPreparation_Masterfile_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Masterfile_User] ([Id])
GO
ALTER TABLE [dbo].[Transaction_BudgetPreparation] CHECK CONSTRAINT [FK_Transaction_BudgetPreparation_Masterfile_User_UserId]
GO
ALTER TABLE [dbo].[Transaction_BudgetPreparation]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_BudgetPreparation_Transaction_BudgetPeriod_BudgetPeriodId] FOREIGN KEY([BudgetPeriodId])
REFERENCES [dbo].[Transaction_BudgetPeriod] ([Id])
GO
ALTER TABLE [dbo].[Transaction_BudgetPreparation] CHECK CONSTRAINT [FK_Transaction_BudgetPreparation_Transaction_BudgetPeriod_BudgetPeriodId]
GO
ALTER TABLE [dbo].[Transaction_BudgetPreparationDetail]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_BudgetPreparationDetail_Transaction_BudgetPreparation_BudgetPreparationId] FOREIGN KEY([BudgetPreparationId])
REFERENCES [dbo].[Transaction_BudgetPreparation] ([Id])
GO
ALTER TABLE [dbo].[Transaction_BudgetPreparationDetail] CHECK CONSTRAINT [FK_Transaction_BudgetPreparationDetail_Transaction_BudgetPreparation_BudgetPreparationId]
GO
ALTER TABLE [dbo].[Transaction_DailyCashFlow]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_DailyCashFlow_Masterfile_Category_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Masterfile_Category] ([Id])
GO
ALTER TABLE [dbo].[Transaction_DailyCashFlow] CHECK CONSTRAINT [FK_Transaction_DailyCashFlow_Masterfile_Category_CategoryId]
GO
/****** Object:  StoredProcedure [dbo].[spAuditTrail_get]    Script Date: 8/25/2018 10:59:25 AM ******/
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
/****** Object:  StoredProcedure [dbo].[spAuditTrail_getByDate]    Script Date: 8/25/2018 10:59:25 AM ******/
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
							DateExecuted >= @FromDate AND DateExecuted <= @FromDate
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
							DateExecuted >= @FromDate AND DateExecuted <= @FromDate AND ADT.Id = @AuditID

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
/****** Object:  StoredProcedure [dbo].[spAuditTrail_insert]    Script Date: 8/25/2018 10:59:25 AM ******/
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
/****** Object:  StoredProcedure [dbo].[spMaster_User_GMailLogin]    Script Date: 8/25/2018 10:59:25 AM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_AccessRights]    Script Date: 8/25/2018 10:59:25 AM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_AccessRights_get]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_AccessRights_get
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_AccessRights_get]
	-- Add the parameters for the stored procedure here
	@RoleId				INT = 0,
	@AccessRightsId		INT	= 0,
	@PageNumber		INT = 1,
	@RowsPage 		INT = 10
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active AccessRightss and its details
			IF  (@AccessRightsId = 0 AND @RoleId = 0)
				BEGIN

					WITH TempResult AS(
						SELECT  ma.Id AS 'AccessRightsId',
								IsChecked,
								[Module],
								[Page],
								[PageSeqNo],
								[RightsSeqNo],
								mf.[Name] AS 'FunctionName',
								mf.[Remarks],
								'success'			AS 'return_message'
						FROM 
							[dbo].[Masterfile_AccessRights] AS ma
								INNER JOIN [dbo].[Masterfile_SystemRights] AS ms
							ON  ma.PageActionId = ms.id
								INNER JOIN [dbo].[Masterfile_PageAction] AS mp
							ON  mp.SystemRightsId = ms.id AND mp.[Status] = 1
								INNER JOIN [dbo].[Masterfile_Function] AS mf
							ON  mp.FunctionId = mf.id AND mf.[Status] = 1
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[AccessRightsId]
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;
				END

			ELSE IF (@AccessRightsId = 0 AND @RoleId <> 0)
				BEGIN

					WITH TempResult AS(
						SELECT  ma.Id AS 'AccessRightsId',
								IsChecked,
								[Module],
								[Page],
								[PageSeqNo],
								[RightsSeqNo],
								mf.[Name] AS 'FunctionName',
								mf.[Remarks],
								'success'			AS 'return_message'
						FROM 
							[dbo].[Masterfile_AccessRights] AS ma
								INNER JOIN [dbo].[Masterfile_SystemRights] AS ms
							ON  ma.PageActionId = ms.id
								INNER JOIN [dbo].[Masterfile_PageAction] AS mp
							ON  mp.SystemRightsId = ms.id AND mp.[Status] = 1
								INNER JOIN [dbo].[Masterfile_Function] AS mf
							ON  mp.FunctionId = mf.id AND mf.[Status] = 1
						WHERE 
							ma.RoleId = @RoleId
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[AccessRightsId]
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;
				END

			ELSE IF (@AccessRightsId <> 0 AND @RoleId = 0)
				BEGIN
					WITH TempResult AS(
						SELECT  ma.Id AS 'AccessRightsId',
								IsChecked,
								[Module],
								[Page],
								[PageSeqNo],
								[RightsSeqNo],
								mf.[Name] AS 'FunctionName',
								mf.[Remarks],
								'success'			AS 'return_message'
						FROM 
							[dbo].[Masterfile_AccessRights] AS ma
								INNER JOIN [dbo].[Masterfile_SystemRights] AS ms
							ON  ma.PageActionId = ms.id
								INNER JOIN [dbo].[Masterfile_PageAction] AS mp
							ON  mp.SystemRightsId = ms.id AND mp.[Status] = 1
								INNER JOIN [dbo].[Masterfile_Function] AS mf
							ON  mp.FunctionId = mf.id AND mf.[Status] = 1
						WHERE 
							ma.id = @AccessRightsId
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[AccessRightsId]
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;
				END

			ELSE
				BEGIN
					WITH TempResult AS(
						SELECT  ma.Id AS 'AccessRightsId',
								IsChecked,
								[Module],
								[Page],
								[PageSeqNo],
								[RightsSeqNo],
								mf.[Name] AS 'FunctionName',
								mf.[Remarks],
								'success'			AS 'return_message'
						FROM 
							[dbo].[Masterfile_AccessRights] AS ma
								INNER JOIN [dbo].[Masterfile_SystemRights] AS ms
							ON  ma.PageActionId = ms.id
								INNER JOIN [dbo].[Masterfile_PageAction] AS mp
							ON  mp.SystemRightsId = ms.id AND mp.[Status] = 1
								INNER JOIN [dbo].[Masterfile_Function] AS mf
							ON  mp.FunctionId = mf.id AND mf.[Status] = 1
						WHERE 
							ma.id = @AccessRightsId AND ma.RoleId = @RoleId
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[AccessRightsId]
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_AccessRights_getall]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_AccessRights_getall 1
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_AccessRights_getall]
	-- Add the parameters for the stored procedure here
	@RoleId				INT = 0,
	@AccessRightsId		INT	= 0
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active AccessRightss and its details
			IF  (@AccessRightsId = 0 AND @RoleId = 0)
				BEGIN
						SELECT  ma.Id			AS 'AccessRightsId',
								IsChecked,
								ma.PageActionId,
								mp.FunctionId,
								mp.SystemRightsId,
								mp.[Remarks]	AS 'Page Action Remarks',
								ms.[Page],
								ms.Module, 
								PageSeqNo		AS 'Page Sequence No.',
								RightsSeqNo		AS 'Rights Sequence No.',
								mf.[Name]		AS 'Function',						
								mf.Remarks		AS 'Function Remarks'
						FROM 
							[dbo].[Masterfile_AccessRights] AS ma
								INNER JOIN [dbo].[Masterfile_PageAction] AS mp
							ON  mp.id = ma.PageActionId AND mp.[Status] = 1
								INNER JOIN Masterfile_SystemRights ms
							ON ms.Id = mp.SystemRightsId  	
								INNER JOIN Masterfile_Function mf
							ON mf.Id = mp.FunctionId  AND mf.[Status] = 1				
												
				END

			ELSE IF (@AccessRightsId = 0 AND @RoleId <> 0)
				BEGIN
						SELECT  ma.Id			AS 'AccessRightsId',
								IsChecked,
								ma.PageActionId,
								mp.FunctionId,
								mp.SystemRightsId,
								mp.[Remarks]	AS 'Page Action Remarks',
								ms.[Page],
								ms.Module, 
								PageSeqNo		AS 'Page Sequence No.',
								RightsSeqNo		AS 'Rights Sequence No.',
								mf.[Name]		AS 'Function',						
								mf.Remarks		AS 'Function Remarks'
						FROM 
							[dbo].[Masterfile_AccessRights] AS ma
								INNER JOIN [dbo].[Masterfile_PageAction] AS mp
							ON  mp.id = ma.PageActionId AND mp.[Status] = 1
								INNER JOIN Masterfile_SystemRights ms
							ON ms.Id = mp.SystemRightsId  	
								INNER JOIN Masterfile_Function mf
							ON mf.Id = mp.FunctionId  AND mf.[Status] = 1		
						WHERE 
							ma.RoleId = @RoleId
					
				END

			ELSE IF (@AccessRightsId <> 0 AND @RoleId = 0)
				BEGIN
						SELECT  ma.Id			AS 'AccessRightsId',
								IsChecked,
								ma.PageActionId,
								mp.FunctionId,
								mp.SystemRightsId,
								mp.[Remarks]	AS 'Page Action Remarks',
								ms.[Page],
								ms.Module, 
								PageSeqNo		AS 'Page Sequence No.',
								RightsSeqNo		AS 'Rights Sequence No.',
								mf.[Name]		AS 'Function',						
								mf.Remarks		AS 'Function Remarks'
						FROM 
							[dbo].[Masterfile_AccessRights] AS ma
								INNER JOIN [dbo].[Masterfile_PageAction] AS mp
							ON  mp.id = ma.PageActionId AND mp.[Status] = 1
								INNER JOIN Masterfile_SystemRights ms
							ON ms.Id = mp.SystemRightsId  	
								INNER JOIN Masterfile_Function mf
							ON mf.Id = mp.FunctionId  AND mf.[Status] = 1		
						WHERE 
							ma.id = @AccessRightsId
					
				END

			ELSE
				BEGIN
					SELECT  ma.Id			AS 'AccessRightsId',
								IsChecked,
								ma.PageActionId,
								mp.FunctionId,
								mp.[Remarks]	AS 'Page Action Remarks',
								ms.[Page],
								ms.Module, 
								PageSeqNo		AS 'Page Sequence No.',
								RightsSeqNo		AS 'Rights Sequence No.',
								mf.[Name]		AS 'Function',						
								mf.Remarks		AS 'Function Remarks'
						FROM 
							[dbo].[Masterfile_AccessRights] AS ma
								INNER JOIN [dbo].[Masterfile_PageAction] AS mp
							ON  mp.id = ma.PageActionId AND mp.[Status] = 1
								INNER JOIN Masterfile_SystemRights ms
							ON ms.Id = mp.SystemRightsId  	
								INNER JOIN Masterfile_Function mf
							ON mf.Id = mp.FunctionId  AND mf.[Status] = 1	
						WHERE 
							ma.id = @AccessRightsId AND ma.RoleId = @RoleId
				
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_AccessRights_insert]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Description>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
/***
 
 EXEC spMasterfile_AccessRights_insert 2,41
 EXEC spMasterfile_AccessRights_insert 2,42
 EXEC spMasterfile_AccessRights_insert 2,43
 EXEC spMasterfile_AccessRights_insert 2,44
 EXEC spMasterfile_AccessRights_insert 2,45
 EXEC spMasterfile_AccessRights_insert 2,46
 EXEC spMasterfile_AccessRights_insert 2,47
 EXEC spMasterfile_AccessRights_insert 2,48
 EXEC spMasterfile_AccessRights_insert 2,49
 EXEC spMasterfile_AccessRights_insert 2,50
 EXEC spMasterfile_AccessRights_insert 2,51
 EXEC spMasterfile_AccessRights_insert 2,52
 EXEC spMasterfile_AccessRights_insert 2,53
 EXEC spMasterfile_AccessRights_insert 2,54
 EXEC spMasterfile_AccessRights_insert 2,55
 EXEC spMasterfile_AccessRights_insert 2,56
 EXEC spMasterfile_AccessRights_insert 2,57
 EXEC spMasterfile_AccessRights_insert 2,58
 EXEC spMasterfile_AccessRights_insert 2,59
 EXEC spMasterfile_AccessRights_insert 2,60
 EXEC spMasterfile_AccessRights_insert 2,61
 EXEC spMasterfile_AccessRights_insert 2,62
 EXEC spMasterfile_AccessRights_insert 2,63
 EXEC spMasterfile_AccessRights_insert 2,64
 EXEC spMasterfile_AccessRights_insert 2,65
 EXEC spMasterfile_AccessRights_insert 2,66
 EXEC spMasterfile_AccessRights_insert 2,67
***/
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_AccessRights_insert]
	-- Add the parameters for the stored procedure here
	@RoleId		INT,
	@PageActionId	INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT,
					@_IsCheck		INT = 1
				


			SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Masterfile_AccessRights];

					INSERT INTO [dbo].[Masterfile_AccessRights]
						(Id,RoleId, PageActionId, IsChecked)
					VALUES
						(@_Id,@RoleId, @PageActionId, @_IsCheck);
			
					-- Return of the Data type
					SELECT 	@_Id					AS 'Id', 
							@RoleId				AS 'RoleId',
							@PageActionId		AS 'PageActionId', 
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_AccessRights_update]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Description>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_AccessRights_update]
	-- Add the parameters for the stored procedure here
	@Id					INT,
	@IsChecked			INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
				UPDATE [dbo].[Masterfile_AccessRights]	 
					SET	IsChecked = @IsChecked
					WHERE 
						[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT	@Id AS 'Id',
					@IsChecked AS 'IsChecked',
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Area_delete]    Script Date: 8/25/2018 10:59:25 AM ******/
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

			DECLARE @_Deleted INT = 0,
			@Delete VARCHAR(50)= 'Deleted: ',
			@Delete1 VARCHAR(100) = (SELECT Name from Masterfile_Area Where Id= @Id),
			@Delete2 VARCHAR(50)= ' Area by ',
			@Delete3 Varchar(50) = (SELECT Username from Masterfile_User Where Id = @UserId);
			SET @Delete = @Delete+@Delete1+@Delete2+@Delete3;		
			EXEC spAuditTrail_insert 'Masterfile_Area',@Id,'Delete',@UserID,@Delete;
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Area_get]    Script Date: 8/25/2018 10:59:25 AM ******/
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
CREATE PROCEDURE [dbo].[spMasterfile_Area_get]
	-- Add the parameters for the stored procedure here
	@AreaId			INT	= 0,
	@PageNumber		INT = 1,
	@RowsPage 		INT = 10
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Regions and its details
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
					ORDER BY TempResult.[Name]
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
					ORDER BY TempResult.[Name]
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Area_getall]    Script Date: 8/25/2018 10:59:25 AM ******/
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
CREATE PROCEDURE [dbo].[spMasterfile_Area_getall]
	-- Add the parameters for the stored procedure here
	@AreaId			INT	= 0
	
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Regions and its details
			IF  (@AreaId = 0)
				BEGIN
					SELECT ma.Id,ma.Name,ma.DistrictId,md.Name AS'District' ,ma.Remarks 
					from Masterfile_Area ma
					left join Masterfile_District md
					on ma.DistrictId = md.Id and md.[Status] = 1 
					where
					ma.[Status] = 1
					
				END
			ELSE
				BEGIN

				
						SELECT ma.Id,ma.Name,ma.DistrictId,md.Name AS'District' ,ma.Remarks  from Masterfile_Area ma
					left join Masterfile_District md
					on ma.DistrictId = md.Id and md.[Status] = 1 
					where
					ma.[Status] = 1 AND ma.Id = @AreaId
					
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Area_insert]    Script Date: 8/25/2018 10:59:25 AM ******/
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
					@_Status			TINYINT  = 1;		-- Default as 1 as describe as 'Active'


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
					Declare @Insert	VARCHAR(150) = 'Inserted ',
							@Insert1 VARCHAR(20)= ' Area by ',
							@Insert2 VARCHAR (50) = (SELECT Username From Masterfile_User where Id =  @UserId);
						SET @Insert = @Insert + @Name + @Insert1 + @Insert2;
					EXEC spAuditTrail_insert 'Masterfile_Area',@_Id,'Insert',@UserId,@Insert;
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Area_update]    Script Date: 8/25/2018 10:59:25 AM ******/
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
			DECLARE @Old VARCHAR(50),
			@Old1 VARCHAR(50),
			@Old2 VARCHAR(50);
			SET @Old = (SELECT Name From Masterfile_Area Where Id = @Id);
			SET @Old1 = (SELECT DistrictId From Masterfile_Area Where Id = @Id);
			SET @Old2 = (SELECT Remarks From Masterfile_Area Where Id = @Id); 
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
	
					Declare @Update	VARCHAR(max),	
						@Update1 VARCHAR (50) = (SELECT Username From Masterfile_User where Id =  @UserId),
						@District VARCHAR(20) = (SELECT DistrictId from Masterfile_Area where Id = @Id);
						SET @Update = 'Updated: Area Name From['+@Old+'] To['+@Name+'], District Id From['+@Old1+'] To['+@District+'] and Remarks From['+@Old2+'] To['+@Remarks+'] on Area by '+@Update1;
					EXEC spAuditTrail_insert 'Masterfile_Area',@Id,'Update',@UserId,@Update;
				
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Branch_BIJLISync]    Script Date: 8/25/2018 10:59:25 AM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Branch_delete]    Script Date: 8/25/2018 10:59:25 AM ******/
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

			DECLARE @_Deleted INT = 0,
			@Delete VARCHAR(50)= 'Deleted: ',
			@Delete1 VARCHAR(100) = (SELECT Name from Masterfile_Branch Where Id= @Id),
			@Delete2 VARCHAR(50)= ' Branch by ',
			@Delete3 Varchar(50) = (SELECT Username from Masterfile_User Where Id = @UserId);
			SET @Delete = @Delete+@Delete1 +@Delete2+@Delete3;		
			EXEC spAuditTrail_insert 'Masterfile_Branch',@Id,'Delete',@UserID,@Delete;
			
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Branch_get]    Script Date: 8/25/2018 10:59:25 AM ******/
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
CREATE PROCEDURE [dbo].[spMasterfile_Branch_get]
	-- Add the parameters for the stored procedure here
	@BranchId		INT	= 0,
	@PageNumber		INT = 1,
	@RowsPage 		INT = 10
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Branchs and its details
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
					ORDER BY TempResult.Name
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
					ORDER BY TempResult.Name
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Branch_getall]    Script Date: 8/25/2018 10:59:25 AM ******/
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
CREATE PROCEDURE [dbo].[spMasterfile_Branch_getall]
	-- Add the parameters for the stored procedure here
	@BranchId		INT	= 0
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Branchs and its details
			IF  (@BranchId = 0)
				BEGIN

				
					SELECT 
					mb.Id,mb.BranchCode,mb.[Name],mb.AreaId,ma.[Name] AS 'Area',mb.[Address],
					mb.Latitude,mb.Longitude,mb.Remarks 
					from Masterfile_Branch mb
					left join Masterfile_Area ma 
					on mb.AreaId =ma.Id  and ma.[Status] = 1
					where
					mb.[Status] = 1
					

					

				END
			ELSE
				BEGIN

					
					SELECT 
					mb.Id,mb.BranchCode,mb.Name,mb.AreaId,ma.Name AS 'Area',mb.[Address],
					mb.Latitude,mb.Longitude,mb.Remarks 
					from Masterfile_Branch mb
					left join Masterfile_Area ma 
					on mb.AreaId =ma.Id  and ma.[Status] = 1
					where
					mb.[Status] = 1 AND mb.Id = @BranchId
					
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Branch_insert]    Script Date: 8/25/2018 10:59:25 AM ******/
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
					@_Status			TINYINT  = 1;		-- Default as 1 as describe as 'Active'


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
					Declare @Insert	VARCHAR(150),
							
							@Insert1 VARCHAR (50) = (SELECT Username From Masterfile_User where Id =  @UserId);
						SET @Insert = 'Inserted: '+@Name+' Branch by '+@Insert1;
					EXEC spAuditTrail_insert 'Masterfile_Branch',@_Id,'Insert',@UserId,@Insert;
							
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Branch_update]    Script Date: 8/25/2018 10:59:25 AM ******/
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
			DECLARE @Old VARCHAR(50),
			@Old1 VARCHAR(50),
			@Old2 VARCHAR(50),
			@Old3 VARCHAR(50),
			@Old4 VARCHAR(50),
			@Old5 VARCHAR(50);
			SET @Old = (SELECT Name From Masterfile_Branch Where Id = @Id);
			SET @Old1 = (SELECT AreaId From Masterfile_Branch Where Id = @Id);
			SET @Old2 = (SELECT [Address] From Masterfile_Branch Where Id = @Id); 
			SET @Old3 = (SELECT Latitude From Masterfile_Branch Where Id = @Id);
			SET @Old4 = (SELECT Longitude From Masterfile_Branch Where Id = @Id);
			SET @Old5 = (SELECT Remarks From Masterfile_Branch Where Id = @Id); 
			
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
			Declare @Update	VARCHAR(max),	
						@Update1 VARCHAR (50) = (SELECT Username From Masterfile_User where Id =  @UserId),
						@Area VARCHAR(20) = (SELECT AreaId from Masterfile_Branch where Id = @Id),
						@Latitudes VARCHAR(20) = (SELECT Latitude from Masterfile_Branch where Id = @Id),
						@Longitudes VARCHAR(20) = (SELECT Longitude from Masterfile_Branch where Id = @Id);
						SET @Update = 'Updated: Branch Name From['+@Old+'] To['+@Name+'], Area Id From['+@Old1+'] To['+@Area+'], Address From['+@Old2+' To['+@Address+'], Latitude From['+@Old3+'] To['+@Latitudes+'], Longitude From['+@Old4+'] To['+@Longitudes+'], and Remarks From['+@Old5+'] To['+@Remarks+'] on Branch by '+@Update1;
			EXEC spAuditTrail_insert 'Masterfile_Branch',@Id,'Update',@UserId,@Update;
				
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Category_delete]    Script Date: 8/25/2018 10:59:25 AM ******/
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

			DECLARE @_Deleted INT = 0,
			@Delete VARCHAR(50)= 'Deleted: ',
			@Delete1 VARCHAR(100) = (SELECT [Description] from Masterfile_Category Where Id= @Id),
			@Delete2 VARCHAR(50)= ' Category by ',
			@Delete3 Varchar(50) = (SELECT Username from Masterfile_User Where Id = @UserId);
			SET @Delete = @Delete+@Delete1 +@Delete2+@Delete3;		
			EXEC spAuditTrail_insert 'Masterfile_Category',@Id,'Delete',@UserID,@Delete;
			
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Category_get]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Category_get
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Category_get]
	-- Add the parameters for the stored procedure here
	@CategoryId		INT	= 0,
	@PageNumber		INT = 1,
	@RowsPage 		INT = 10
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Categorys and its details
				IF  (@CategoryId = 0)
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
					ORDER BY TempResult.[Description]
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

				END
			ELSE
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
					ORDER BY TempResult.[Description]
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Category_getall]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Category_get
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Category_getall]
	-- Add the parameters for the stored procedure here
	@CategoryId		INT	= 0	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Categorys and its details
				IF  (@CategoryId = 0)
				BEGIN

					
						SELECT Id,[Description],[Type],Remarks from Masterfile_Category
					where
					[Status] = 1
					
				END
			ELSE
				BEGIN

					
						SELECT Id,[Description],[Type],Remarks from Masterfile_Category
					where
					[Status] = 1 AND Id = @CategoryId
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Category_insert]    Script Date: 8/25/2018 10:59:25 AM ******/
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
					@_Status			TINYINT  = 1;		-- Default as 1 as describe as 'Active'


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
			
					-- Return of the Data type
					SELECT 	@_Id					AS 'Id', 
							@Description			AS 'Description',
							@Type					AS 'Type',
							@Remarks				AS 'Remarks',
							'success'					AS 'return_message';		
				Declare @Insert	VARCHAR(150),
							
							@Insert1 VARCHAR (50) = (SELECT Username From Masterfile_User where Id =  @UserId);
						SET @Insert = 'Inserted: '+@Description+' Category by '+@Insert1;
					EXEC spAuditTrail_insert 'Masterfile_Category',@_Id,'Insert',@UserId,@Insert;
					
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Category_update]    Script Date: 8/25/2018 10:59:25 AM ******/
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
			DECLARE @Old VARCHAR(50),
					@Old2 VARCHAR(50),
					@Old3 VARCHAR(50);
					SET @Old = (SELECT [Description] From Masterfile_Category WHERE Id=@Id);
					SET @Old2 = (SELECT [Type] From Masterfile_Category WHERE Id=@Id);
					SET @Old3 = (SELECT [Remarks] From Masterfile_Category WHERE Id=@Id);
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
			Declare @Update	VARCHAR(max),
							
					@Update1 VARCHAR (50) = (SELECT Username From Masterfile_User where Id =  @UserId);
					SET @Update = 'Updated: Description From['+@Old+'] To['+@Description+'], Type From['+@Old2+'] To['+@Type+'] and Remarks From['+@Old3+'] To['+@Remarks+'] on Category by '+@Update1;
					EXEC spAuditTrail_insert 'Masterfile_Category',@Id,'Update',@UserId,@Update;
					
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Channel_delete]    Script Date: 8/25/2018 10:59:25 AM ******/
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

			DECLARE @_Deleted INT = 0,
			@Delete VARCHAR(50)= 'Deleted: ',
			@Delete1 VARCHAR(100) = (SELECT [Description] from Masterfile_Channel Where Id= @Id),
			@Delete2 VARCHAR(50)= ' Channel by ',
			@Delete3 Varchar(50) = (SELECT Username from Masterfile_User Where Id = @UserId);
			SET @Delete = @Delete+@Delete1+@Delete2+@Delete3;		
			EXEC spAuditTrail_insert 'Masterfile_Channel',@Id,'Delete',@UserID,@Delete;
			
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Channel_get]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Channel_get
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Channel_get]
	-- Add the parameters for the stored procedure here
	@ChannelId		INT	= 0,
	@PageNumber		INT = 1,
	@RowsPage 		INT = 10
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Channels and its details
			IF  (@ChannelId = 0)
				BEGIN

					WITH TempResult AS(
						SELECT Id,[Description],Remarks from Masterfile_Channel
					where
					[Status] = 1
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[Description]
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

				END
			ELSE
				BEGIN

					WITH TempResult AS(
						SELECT Id,[Description],Remarks from Masterfile_Channel
					where
					[Status] = 1 AND Id = @ChannelId
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[Description]
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Channel_getall]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Channel_get
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Channel_getall]
	-- Add the parameters for the stored procedure here
	@ChannelId		INT	= 0	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Channels and its details
			IF  (@ChannelId = 0)
				BEGIN

					
						SELECT Id,[Description],Remarks from Masterfile_Channel
					where
					[Status] = 1
					
				END
			ELSE
				BEGIN

					
						SELECT Id,[Description],Remarks from Masterfile_Channel
					where
					[Status] = 1 AND Id = @ChannelId
					
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Channel_insert]    Script Date: 8/25/2018 10:59:25 AM ******/
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
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT,
					@_Status			TINYINT  = 1;		-- Default as 1 as describe as 'Active'


			SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Masterfile_Channel];

			IF EXISTS(SELECT Id FROM [dbo].[Masterfile_Channel] WHERE Description =  @Description AND [Status] = 1)
				BEGIN  							
					SELECT	'duplicate_description'	AS 'return_message';						
				END

			ELSE
				BEGIN
					INSERT INTO [dbo].[Masterfile_Channel]
						(Id,[Description],Remarks,[Status])
					VALUES
						(@_Id, @Description,@Remarks, @_Status);
			
					-- Return of the Data type
					SELECT 	@_Id					AS 'Id', 
							@Description					AS 'Description',
							@Remarks				AS 'Remarks',
							'success'					AS 'return_message';		
				Declare @Insert	VARCHAR(150),
							
							@Insert1 VARCHAR (50) = (SELECT Username From Masterfile_User where Id =  @UserId);
						SET @Insert = 'Inserted: '+@Description+' Channel by '+@Insert1;
					EXEC spAuditTrail_insert 'Masterfile_Channel',@_Id,'Insert',@UserId,@Insert;
					
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Channel_update]    Script Date: 8/25/2018 10:59:25 AM ******/
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
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @Old VARCHAR(50),
					@Old2 VARCHAR(50);
				
					SET @Old = (SELECT [Description] From Masterfile_Channel WHERE Id=@Id);
					SET @Old2 = (SELECT [Remarks] From Masterfile_Channel WHERE Id=@Id);
			IF (EXISTS(SELECT Id FROM [dbo].[Masterfile_Channel] WHERE [Description] =  @Description AND [Status] = 1 and Id <> @Id))
				BEGIN  							
					SELECT	'duplicate_description'	AS 'return_message';						
				END

			ELSE
				BEGIN
				UPDATE [dbo].[Masterfile_Channel]	 
					SET	[Description]	= @Description,
						[Remarks]		= @Remarks
					WHERE 
						[Id]			= @Id;
			
			-- Return Data of the Update
			SELECT	@Id AS 'Id',
					@Description	AS 'Description',
					@Remarks	AS 'Remarks',
					'success'	AS 'return_message';
				Declare @Update	VARCHAR(max),
							
					@Update1 VARCHAR (50) = (SELECT Username From Masterfile_User where Id =  @UserId);
					SET @Update = 'Updated: Description From['+@Old+'] To['+@Description+'] and Remarks From['+@Old2+'] To['+@Remarks+'] on Category by '+@Update1;
					EXEC spAuditTrail_insert 'Masterfile_Channel',@Id,'Update',@UserId,@Update;
				
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_ChartOfAccount_BIJLISync]    Script Date: 8/25/2018 10:59:25 AM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_ChartOfAccount_delete]    Script Date: 8/25/2018 10:59:25 AM ******/
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

			DECLARE @_Deleted INT = 0,
			@Delete VARCHAR(50)= 'Deleted: ',
			@Delete1 VARCHAR(100) = (SELECT [Description] from Masterfile_ChartOfAccount Where Id= @Id),
			@Delete2 VARCHAR(50)= ' Chart Of Account by ',
			@Delete3 Varchar(50) = (SELECT Username from Masterfile_User Where Id = @UserId);
			SET @Delete = @Delete+@Delete1+@Delete2+@Delete3;		
			EXEC spAuditTrail_insert 'Masterfile_ChartOfAccount',@Id,'Delete',@UserID,@Delete;
			
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_ChartOfAccount_get]    Script Date: 8/25/2018 10:59:25 AM ******/
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
	@ChartOfAccountId		INT	= 0,
	@PageNumber		INT = 1,
	@RowsPage 		INT = 10
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active ChartOfAccounts and its details
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
					ORDER BY TempResult.[Description]
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
					ORDER BY TempResult.[Description]
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_ChartOfAccount_getall]    Script Date: 8/25/2018 10:59:25 AM ******/
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
CREATE PROCEDURE [dbo].[spMasterfile_ChartOfAccount_getall]
	-- Add the parameters for the stored procedure here
	@ChartOfAccountId		INT	= 0

AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active ChartOfAccounts and its details
			IF  (@ChartOfAccountId = 0)
				BEGIN
					SELECT Id,Code,[Description],Remarks from Masterfile_ChartOfAccount
					where 
					[Status] = 1 
				END
			ELSE
				BEGIN
					SELECT Id,Code,[Description],Remarks from Masterfile_ChartOfAccount
					where 
					[Status] = 1 AND Id = @ChartOfAccountId
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_ChartOfAccount_insert]    Script Date: 8/25/2018 10:59:25 AM ******/
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
					@_Status			TINYINT  = 1;		-- Default as 1 as describe as 'Active'


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
				Declare @Insert	VARCHAR(150),
							
							@Insert1 VARCHAR (50) = (SELECT Username From Masterfile_User where Id =  @UserId);
						SET @Insert = 'Inserted: '+@Description+' Chart Of Account by '+@Insert1;
					EXEC spAuditTrail_insert 'Masterfile_ChartOfAccount',@_Id,'Insert',@UserId,@Insert;
					
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_ChartOfAccount_update]    Script Date: 8/25/2018 10:59:25 AM ******/
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
			DECLARE @Old VARCHAR(50),
					@Old2 VARCHAR(50),
					@Old3	VARCHAR(50);
					SET @Old = (SELECT [Code] From Masterfile_ChartOfAccount WHERE Id=@Id);
					SET @Old2 = (SELECT [Description] From Masterfile_ChartOfAccount WHERE Id=@Id);
					SET @Old3 = (SELECT [Remarks] From Masterfile_ChartOfAccount WHERE Id=@Id);
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
			Declare @Update	VARCHAR(max),
							
					@Update1 VARCHAR (50) = (SELECT Username From Masterfile_User where Id =  @UserId);
					SET @Update = 'Updated: Code From['+@Old+'] To['+@Code+'], Description From['+@Old2+'] To['+@Description+'] and Remarks From['+@Old3+'] To['+@Remarks+'] on Chart Of Account by '+@Update1;
					EXEC spAuditTrail_insert 'Masterfile_ChartOfAccount',@Id,'Update',@UserId,@Update;
				
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_District_delete]    Script Date: 8/25/2018 10:59:25 AM ******/
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

			DECLARE @_Deleted INT = 0,
			@Delete VARCHAR(50)= 'Deleted: ',
			@Delete1 VARCHAR(100) = (SELECT Name from Masterfile_District Where Id= @Id),
			@Delete2 VARCHAR(50)= ' District by ',
			@Delete3 Varchar(50) = (SELECT Username from Masterfile_User Where Id = @UserId);
			SET @Delete = @Delete+@Delete1+@Delete2+@Delete3;		
			EXEC spAuditTrail_insert 'Masterfile_District',@Id,'Delete',@UserID,@Delete;
			
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_District_get]    Script Date: 8/25/2018 10:59:25 AM ******/
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
	@DistrictId		INT	= 0,
	@PageNumber		INT = 1,
	@RowsPage 		INT = 10
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Districts and its details
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
					ORDER BY TempResult.Name
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
					ORDER BY TempResult.Name
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_District_getall]    Script Date: 8/25/2018 10:59:25 AM ******/
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
CREATE PROCEDURE [dbo].[spMasterfile_District_getall]
	-- Add the parameters for the stored procedure here
	@DistrictId		INT	= 0
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Districts and its details
			IF  (@DistrictId = 0)
				BEGIN
						SELECT md.Id,md.Name,md.RegionId,mr.Name AS 'Region',md.Remarks from Masterfile_District md
						left join Masterfile_Region mr 
						on md.RegionId =mr.Id and mr.[Status] = 1
						where
						md.[Status] = 1
					
				END
			ELSE
				BEGIN
						SELECT md.Id,md.Name,md.RegionId,mr.Name  AS 'Region',md.Remarks from Masterfile_District md
						left join Masterfile_Region mr 
						on md.RegionId =mr.Id and mr.[Status] = 1
						where
						md.[Status] = 1 AND md.Id = @DistrictId
					
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_District_insert]    Script Date: 8/25/2018 10:59:25 AM ******/
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
					@_Status			TINYINT  = 1;		-- Default as 1 as describe as 'Active'


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
				Declare @Insert	VARCHAR(150),
							
							@Insert1 VARCHAR (50) = (SELECT Username From Masterfile_User where Id =  @UserId);
						SET @Insert = 'Inserted: '+@Name+' District by '+@Insert1;
					EXEC spAuditTrail_insert 'Masterfile_District',@_Id,'Insert',@UserId,@Insert;
					
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_District_update]    Script Date: 8/25/2018 10:59:25 AM ******/
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
			DECLARE @Old VARCHAR(50),
					@Old2 VARCHAR(50),
					@Old3	VARCHAR(50);
					SET @Old = (SELECT [Name] From Masterfile_District WHERE Id=@Id);
					SET @Old2 = (SELECT [RegionId] From Masterfile_District WHERE Id=@Id);
					SET @Old3 = (SELECT [Remarks] From Masterfile_District WHERE Id=@Id);
			
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
				Declare @Update	VARCHAR(max),
							
					@Update1 VARCHAR (50) = (SELECT Username From Masterfile_User where Id =  @UserId),
					@Region VARCHAR(50) = (SELECT RegionId From Masterfile_District Where Id= @Id);
					SET @Update = 'Updated: Name From['+@Old+'] To['+@Name+'], RegionId From['+@Old2+'] To['+@Region+'] and Remarks From['+@Old3+'] To['+@Remarks+'] on District by '+@Update1;
					EXEC spAuditTrail_insert 'Masterfile_District',@Id,'Update',@UserId,@Update;
			
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Employee_BIJLISync]    Script Date: 8/25/2018 10:59:25 AM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Employee_delete]    Script Date: 8/25/2018 10:59:25 AM ******/
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

			DECLARE @_Deleted INT = 0,
			@Delete VARCHAR(50)= 'Deleted: ',
			@Delete1 VARCHAR(100) = (SELECT Firstname from Masterfile_Employee Where Id= @Id),
			@Delete4 VARCHAR(100) = (SELECT Middlename from Masterfile_Employee Where Id= @Id),
			@Delete5 VARCHAR(100) = (SELECT Lastname from Masterfile_Employee Where Id= @Id),
			@Delete2 VARCHAR(50)= ' Employee by ',
			@Delete3 Varchar(50) = (SELECT Username from Masterfile_User Where Id = @UserId);
			SET @Delete1 = @Delete1 +' '+@Delete4+' '+@Delete5;
			SET @Delete = @Delete+@Delete1+@Delete2+@Delete3;		
			EXEC spAuditTrail_insert 'Masterfile_Employee',@Id,'Delete',@UserID,@Delete;
			
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Employee_get]    Script Date: 8/25/2018 10:59:25 AM ******/
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
	@EmployeeId		INT	= 0,
	@PageNumber		INT = 1,
	@RowsPage 		INT = 10
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Employees and its details
			IF  (@EmployeeId = 0)
				BEGIN

					WITH TempResult AS(
					SELECT me.Id,me.EmployeeIdNo as [Employee Id No.],me.Firstname,me.Middlename,
					me.Lastname,me.PositionId,mp.[Description] AS Position,me.EmailAddress,
					me.ContactNumber,me.BranchId,mb.Name AS Branch,me.Remarks
					from Masterfile_Employee me
					inner join Masterfile_Branch mb
					on me.BranchId =mb.Id  AND mb.[Status] = 1
					inner join Masterfile_Position mp
					on me.PositionId = mp.Id and mp.[Status] = 1
					where
					me.[Status] = 1
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[Employee Id No.]
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

				END
			ELSE
				BEGIN

					WITH TempResult AS(
					SELECT me.Id,me.EmployeeIdNo as [Employee Id No.],me.Firstname,me.Middlename,
					me.Lastname,me.PositionId,mp.[Description] AS Position,me.EmailAddress,
					me.ContactNumber,me.BranchId,mb.Name AS Branch,me.Remarks
					from Masterfile_Employee me
					left join Masterfile_Branch mb
					on me.BranchId =mb.Id AND mb.[Status] = 1
					left join Masterfile_Position mp
					on me.PositionId = mp.Id  and mp.[Status] = 1
					where
					me.[Status] = 1	AND me.Id= @EmployeeId 
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[Employee Id No.]
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Employee_getall]    Script Date: 8/25/2018 10:59:25 AM ******/
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
CREATE PROCEDURE [dbo].[spMasterfile_Employee_getall]
	-- Add the parameters for the stored procedure here
	@EmployeeId		INT	= 0
		
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Employees and its details
			IF  (@EmployeeId = 0)
				BEGIN

					
					SELECT me.Id,me.EmployeeIdNo as [Employee Id No.],me.Firstname,me.Middlename,
					me.Lastname,me.PositionId,mp.[Description] AS Position,me.EmailAddress,
					me.ContactNumber,me.BranchId,mb.Name AS Branch,me.Remarks
					from Masterfile_Employee me
					inner join Masterfile_Branch mb
					on me.BranchId =mb.Id  AND mb.[Status] = 1
					inner join Masterfile_Position mp
					on me.PositionId = mp.Id and mp.[Status] = 1
					where
					me.[Status] = 1
				END
			ELSE
				BEGIN
					SELECT me.Id,me.EmployeeIdNo as [Employee Id No.],me.Firstname,me.Middlename,
					me.Lastname,me.PositionId,mp.[Description] AS Position,me.EmailAddress,
					me.ContactNumber,me.BranchId,mb.Name AS Branch,me.Remarks
					from Masterfile_Employee me
					left join Masterfile_Branch mb
					on me.BranchId =mb.Id AND mb.[Status] = 1
					left join Masterfile_Position mp
					on me.PositionId = mp.Id  and mp.[Status] = 1
					where
					me.[Status] = 1	AND me.Id= @EmployeeId 
				
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Employee_getForNotifications]    Script Date: 8/25/2018 10:59:25 AM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Employee_insert]    Script Date: 8/25/2018 10:59:25 AM ******/
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
	@PositionId			INT,
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
					@_Status			TINYINT  = 1;		-- Default as 1 as describe as 'Active'


			SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Masterfile_Employee];

			IF (EXISTS(SELECT Id FROM [dbo].[Masterfile_Employee] WHERE [EmployeeIdNo] =  @EmployeeIdNo AND [Status] = 1 ))
				BEGIN  							
					SELECT	'duplicate_employeeid'	AS 'return_message';						
				END

			ELSE
				BEGIN
			
					INSERT INTO [dbo].[Masterfile_Employee]
						(Id,[EmployeeIdNo],[Firstname],[Middlename],[Lastname]
						,PositionId,EmailAddress,ContactNumber,BranchId
						,Remarks,[Status])
					VALUES
						(@_Id, @EmployeeIdNo,@Firstname,@Middlename,@Lastname
						,@PositionId,@EmailAddress,@ContactNumber,@BranchId,@Remarks, @_Status
					);
			
					-- Return of the Data type
					SELECT 	@_Id					AS 'Id', 
							@EmployeeIdNo			AS 'EmployeeIdNo',
							@Firstname				AS 'Firstname',
							@Middlename				AS 'Middlename',
							@Lastname				AS 'Lastname',
							@PositionId				AS 'PositionId',
							@EmailAddress			AS 'Email Address',
							@ContactNumber			AS 'Contact Number',
							@BranchId				AS 'BranchId',
							
							@Remarks				AS 'Remarks',
							'success'					AS 'return_message';		
					Declare @Insert	VARCHAR(max),
							
							@Insert1 VARCHAR (50) = (SELECT Username From Masterfile_User where Id =  @UserId);
						SET @Insert = 'Inserted New Employee: '+@Firstname+' '+@Middlename+' '+@Lastname++' by '+@Insert1;
					EXEC spAuditTrail_insert 'Masterfile_Employee',@_Id,'Insert',@UserId,@Insert;
					
	
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Employee_update]    Script Date: 8/25/2018 10:59:25 AM ******/
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
	@PositionId			INT,
	@EmailAddress		VARCHAR(150),
	@ContactNumber		VARCHAR(15),
	@BranchId			INT,
	@Remarks			VARCHAR(150),
	@UserId				BIGINT
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @Old VARCHAR(50),
					@Old2 VARCHAR(50),
					@Old3	VARCHAR(50),
					@Old4 VARCHAR(50),
					@Old5	VARCHAR(50),
					@Old6 VARCHAR(50),
					@Old7	VARCHAR(50),
					@Old8 VARCHAR(50),
					@Old9	VARCHAR(50);
				
					SET @Old = (SELECT [EmployeeIdNo] From Masterfile_Employee WHERE Id=@Id);
					SET @Old2 = (SELECT [Firstname] From Masterfile_Employee WHERE Id=@Id);
					SET @Old3 = (SELECT [Middlename] From Masterfile_Employee WHERE Id=@Id);
					SET @Old4 = (SELECT [Lastname] From Masterfile_Employee WHERE Id=@Id);
					SET @Old5 = (SELECT [PositionId] From Masterfile_Employee WHERE Id=@Id);
					SET @Old6 = (SELECT [EmailAddress] From Masterfile_Employee WHERE Id=@Id);
					SET @Old7 = (SELECT [ContactNumber] From Masterfile_Employee WHERE Id=@Id);
					SET @Old8 = (SELECT [BranchId] From Masterfile_Employee WHERE Id=@Id);
					SET @Old9 = (SELECT [Remarks] From Masterfile_Employee WHERE Id=@Id);	
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
						[PositionId]	= @PositionId,
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
					@PositionId	AS 'PositionId',
					@EmailAddress	AS 'Email Address',
					@ContactNumber	AS 'Contact Number',
					@BranchId	AS 'BranchId',
					@Remarks	AS 'Remarks',
					'success'	AS 'return_message';
			Declare @Update	VARCHAR(max),
							
					@Update1 VARCHAR (50) = (SELECT Username From Masterfile_User where Id =  @UserId),
					@Branch VARCHAR(50) = (SELECT BranchId From Masterfile_Employee Where Id= @Id),
					@Position VARCHAR(50) = (SELECT PositionId From Masterfile_Employee Where Id= @Id);
					SET @Update = 'Updated: EmployeeIdNo From['+@Old+'] To['+@EmployeeIdNo+'], Firstname From['+@Old2+'] To['+@Firstname+'], Middlename From['+@Old3+'] To['+@Middlename+'], Lastname From['+@Old4+'] To['+@Lastname+'], PositionId From['+@Old5+'] To['+@Position+'], Email Address From['+@Old6+'] To['+@EmailAddress+'], Contact Number From['+@Old7+'] To['+@ContactNumber+'], BranchId From['+@Old8+'] To['+@Branch+'] and Remarks From['+@Old9+'] To['+@Remarks+'] on Employee by '+@Update1;
					EXEC spAuditTrail_insert 'Masterfile_Employee',@Id,'Update',@UserId,@Update;
			
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Function_delete]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Function_delete 1,2
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Function_delete]
	@Id					INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0
			UPDATE [dbo].[Masterfile_Function]	 
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Function_get]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Function_get
/*
exec spMasterfile_Function_get 0,1,10
*/
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Function_get]
	-- Add the parameters for the stored procedure here
	@FunctionId		INT	= 0,
	@PageNumber		INT = 1,
	@RowsPage 		INT = 10
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Functions and its details
			IF  (@FunctionId = 0)
				BEGIN

					WITH TempResult AS(
						SELECT 
							Id,[Name],Remarks
						FROM 
							Masterfile_Function
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
							Masterfile_Function
						WHERE 
							[Status] = 1 AND Id = @FunctionId
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.Name
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Function_getall]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Function_get
/*
exec spMasterfile_Function_get 0,1,10
*/
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Function_getall]
	-- Add the parameters for the stored procedure here
	@FunctionId		INT	= 0
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Functions and its details
			IF  (@FunctionId = 0)
				BEGIN

					
						SELECT 
							Id,[Name],Remarks
						FROM 
							Masterfile_Function
						WHERE 
							[Status] = 1 
				
				END
			ELSE
				BEGIN
						SELECT 
							Id,[Name],Remarks
						FROM 
							Masterfile_Function
						WHERE 
							[Status] = 1 AND Id = @FunctionId
				
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Function_insert]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Function_insert]
	-- Add the parameters for the stored procedure here
	@Name				VARCHAR(100),
	@Remarks			VARCHAR(150)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT,
					@_Status			TINYINT  = 1;		-- Default as 1 as describe as 'Active'


			SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Masterfile_Region];

			IF EXISTS(SELECT Id FROM [dbo].[Masterfile_Function] WHERE Name =  @Name AND [Status] = 1)
				BEGIN  							
					SELECT	'duplicate_functionname'	AS 'return_message';						
				END

			ELSE
				BEGIN
					INSERT INTO [dbo].[Masterfile_Function]
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Function_update]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Function_update]
	-- Add the parameters for the stored procedure here
	@Id					INT,
	@Name				VARCHAR(100),
	@Remarks			VARCHAR(150)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			IF (EXISTS(SELECT Id FROM [dbo].[Masterfile_Function] WHERE [Name] =  @Name AND [Status] = 1 and Id <> @Id))
				BEGIN  							
					SELECT	'duplicate_functionname'	AS 'return_message';						
				END

			ELSE
				BEGIN
				UPDATE [dbo].[Masterfile_Function]	 
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherDisbursementDetail_delete]    Script Date: 8/25/2018 10:59:25 AM ******/
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

			DECLARE @_Deleted INT = 0,
			@Delete VARCHAR(50)= 'Deleted: ',
			@Delete1 VARCHAR(100) = (SELECT [Description] from Masterfile_OtherDisbursementDetail Where Id= @Id),
			@Delete2 VARCHAR(50)= ' Other Disbursement Detail by ',
			@Delete3 Varchar(50) = (SELECT Username from Masterfile_User Where Id = @UserId);
			SET @Delete = @Delete+@Delete1+@Delete2+@Delete3;		
			EXEC spAuditTrail_insert 'Masterfile_OtherDisbursementDetail',@Id,'Delete',@UserID,@Delete;
			
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherDisbursementDetail_get]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_OtherDisbursementDetail_get
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_OtherDisbursementDetail_get]
	-- Add the parameters for the stored procedure here
	@OtherDisbursementDetailId		INT	= 0,
	@PageNumber		INT = 1,
	@RowsPage 		INT = 10
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active OtherDisbursementDetails and its details
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
					ORDER BY TempResult.[Description]
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
					ORDER BY TempResult.[Description]
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherDisbursementDetail_getall]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_OtherDisbursementDetail_get
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_OtherDisbursementDetail_getall]
	-- Add the parameters for the stored procedure here
	@OtherDisbursementDetailId		INT	= 0
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active OtherDisbursementDetails and its details
			IF  (@OtherDisbursementDetailId = 0)
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
					
				END
			ELSE
				BEGIN
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherDisbursementDetail_insert]    Script Date: 8/25/2018 10:59:25 AM ******/
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
						(Id,[Description],[CategoryId],[BranchId],[SetUpAmount],[ChartOfAccountId]
						,Remarks,[Status],ChannelId,[Day])
					VALUES
						(@_Id, @Description,@CategoryId,@BranchId,@SetUpAmount,@ChartOfAccountId,@Remarks, @_Status,@ChannelId,@Day);
			
					-- Return of the Data type
					SELECT 	@_Id					AS 'Id', 
							@Description			AS 'Description',
							@CategoryId				AS 'CategoryId',
							@BranchId				AS 'BranchId',
							@ChannelId				AS 'ChannelId',
							@Day					AS 'Day',
							@SetUpAmount			AS 'SetUpAmount',
							@ChartOfAccountId		AS 'ChartOfAccountId',
							@Remarks				AS 'Remarks',
							'success'				AS 'return_message';		
				Declare @Insert	VARCHAR(max),
							
							@Insert1 VARCHAR (50) = (SELECT Username From Masterfile_User where Id =  @UserId);
						SET @Insert = 'Inserted: '+@Description+' Other Disbursement Detail by '+@Insert1;
					EXEC spAuditTrail_insert 'Masterfile_OtherDisbursementDetail',@_Id,'Insert',@UserId,@Insert;
					
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherDisbursementDetail_update]    Script Date: 8/25/2018 10:59:25 AM ******/
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
		DECLARE @Old VARCHAR(50),
		@Old2 VARCHAR(50),
		@Old3 VARCHAR(50),
		@Old4 VARCHAR(50),
		@Old5 VARCHAR(50),
		@Old6 VARCHAR(50),
		@Old7 VARCHAR(50),
		@Old8 VARCHAR(50)
		SET @Old=(SELECT [Description] FROM Masterfile_OtherDisbursementDetail WHERE Id= @Id)
		SET @Old2=(SELECT CategoryId FROM Masterfile_OtherDisbursementDetail WHERE Id= @Id)
		SET @Old3=(SELECT BranchId FROM Masterfile_OtherDisbursementDetail WHERE Id= @Id)
		SET @Old4=(SELECT SetUpAmount FROM Masterfile_OtherDisbursementDetail WHERE Id= @Id)
		SET @Old5=(SELECT ChartOfAccountId FROM Masterfile_OtherDisbursementDetail WHERE Id= @Id)
		SET @Old6=(SELECT [Day] FROM Masterfile_OtherDisbursementDetail WHERE Id= @Id)
		SET @Old7=(SELECT ChannelId FROM Masterfile_OtherDisbursementDetail WHERE Id= @Id)
		SET @Old8=(SELECT Remarks FROM Masterfile_OtherDisbursementDetail WHERE Id= @Id)
		IF EXISTS(SELECT Id FROM [dbo].[Masterfile_OtherDisbursementDetail] WHERE [Description] =  @Description AND [Status] = 1 AND Id <> @Id)
				BEGIN  							
					SELECT	'duplicate_description'	AS 'return_message';						
				END

		ELSE		
				BEGIN
					UPDATE [dbo].[Masterfile_OtherDisbursementDetail]	 
					SET	[Description]		= @Description,
						[CategoryId]		= @CategoryId, 
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
					@BranchId			AS 'BranchId',
					@SetUpAmount		AS 'Set Up Amount',
					@Day				AS 'Day',
					@ChannelId			AS 'ChannelId',
					@ChartOfAccountId	AS 'ChartOfAccountId',
					@Remarks			AS 'Remarks',
					'success'			AS 'return_message';
				Declare @Update	VARCHAR(max),
							
					@Update1 VARCHAR (50) = (SELECT Username From Masterfile_User where Id =  @UserId),
					@Category VARCHAR(50) = (SELECT CategoryId From Masterfile_OtherDisbursementDetail Where Id= @Id), 
					@Branch VARCHAR(50) = (SELECT BranchId From Masterfile_OtherDisbursementDetail Where Id= @Id),
					@SetupAmounts VARCHAR(50) = (SELECT SetUpAmount From Masterfile_OtherDisbursementDetail Where Id= @Id),
					@Days	VARCHAR(50) = (SELECT [Day] From Masterfile_OtherDisbursementDetail Where Id= @Id),
					@Channel VARCHAR(50) = (SELECT ChannelId From Masterfile_OtherDisbursementDetail Where Id= @Id),
					@ChartOfAccountIds	VARCHAR(50) = (SELECT ChartOfAccountId From Masterfile_OtherDisbursementDetail Where Id= @Id);
					SET @Update = 'Updated: Description From['+@Old+'] To['+@Description+'], CategoryId From['+@Old2+'] To['+@Category+'], BranchId From['+@Old3+'] To['+@Branch+'], Setup Amount From['+@Old4+'] To['+@SetupAmounts+'], Day From['+@Old5+'] To['+@Days+'], ChannelId From['+@Old6+'] To['+@Channel+'], ChartOfAccountId From['+@Old7+'] To['+@ChartOfAccountIds+'] and Remarks From['+@Old8+'] To['+@Remarks+'] on Other Disbursement Details by '+@Update1;
					EXEC spAuditTrail_insert 'Masterfile_OtherDisbursementDetail',@Id,'Update',@UserId,@Update;
			
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherReceiptDetail_delete]    Script Date: 8/25/2018 10:59:25 AM ******/
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

			DECLARE @_Deleted INT = 0,
			@Delete VARCHAR(50)= 'Deleted: ',
			@Delete1 VARCHAR(100) = (SELECT [Description] from Masterfile_OtherReceiptDetail Where Id= @Id),
			@Delete2 VARCHAR(50)= ' Other Receipt Detail by ',
			@Delete3 Varchar(50) = (SELECT Username from Masterfile_User Where Id = @UserId);
			SET @Delete = @Delete+@Delete1+@Delete2+@Delete3;		
			EXEC spAuditTrail_insert 'Masterfile_OtherReceiptDetail',@Id,'Delete',@UserID,@Delete;
			
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherReceiptDetail_get]    Script Date: 8/25/2018 10:59:25 AM ******/
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
	@OtherReceiptDetailId		INT	= 0,
	@PageNumber		INT = 1,
	@RowsPage 		INT = 10
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active OtherReceiptDetails and its details
			IF  (@OtherReceiptDetailId = 0)
				BEGIN

					WITH TempResult AS(
					SELECT mo.[Id],mo.[Description],mo.CategoryId,mc.[Description] AS 'Category',
					mo.BranchId,mb.Name AS  'Branch',mo.SetUpAmount AS 'Setup Amount',mo.[Day],mo.ChannelId,mcc.[Description] AS 'Channel',
					mo.ChartOfAccountId AS 'Chart Of Accounts ID',mca.[Description] AS 'Chart Of Accounts',
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
					ORDER BY TempResult.[Description]
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

				END
			ELSE
				BEGIN

					WITH TempResult AS(
					SELECT mo.[Id],mo.[Description],mo.CategoryId,mc.[Description] AS 'Category',
					mo.BranchId,mb.Name AS  'Branch',mo.SetUpAmount AS 'Setup Amount',mo.[Day],mo.ChannelId,mcc.[Description] AS 'Channel',
					mo.ChartOfAccountId AS 'Chart Of Accounts ID',mca.[Description] AS 'Chart Of Accounts',
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
					ORDER BY TempResult.[Description]
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherReceiptDetail_getall]    Script Date: 8/25/2018 10:59:25 AM ******/
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
CREATE PROCEDURE [dbo].[spMasterfile_OtherReceiptDetail_getall]
	-- Add the parameters for the stored procedure here
	@OtherReceiptDetailId		INT	= 0
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active OtherReceiptDetails and its details
			IF  (@OtherReceiptDetailId = 0)
				BEGIN
					SELECT mo.[Id],mo.[Description],mo.CategoryId,mc.[Description] AS 'Category',
					mo.BranchId,mb.Name AS  'Branch',mo.SetUpAmount AS 'Setup Amount',mo.[Day],mo.ChannelId,mcc.[Description] AS 'Channel',
					mo.ChartOfAccountId,mca.[Description] AS 'Chart Of Accounts',
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
					
				END
			ELSE
				BEGIN
					SELECT mo.[Id],mo.[Description],mo.CategoryId,mc.[Description] AS 'Category',
					mo.BranchId,mb.Name AS  'Branch',mo.SetUpAmount AS 'Setup Amount',mo.[Day],mo.ChannelId,mcc.[Description] AS 'Channel',
					mo.ChartOfAccountId,mca.[Description] AS 'Chart Of Accounts',
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherReceiptDetail_insert]    Script Date: 8/25/2018 10:59:25 AM ******/
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


			SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Masterfile_OtherReceiptDetail];
			IF EXISTS(SELECT Id FROM [dbo].[Masterfile_OtherReceiptDetail] WHERE [Description] =  @Description AND [Status] = 1)
				BEGIN  							
					SELECT	'duplicate_description'	AS 'return_message';						
				END


			ELSE
				BEGIN
					INSERT INTO [dbo].[Masterfile_OtherReceiptDetail]
						(Id,[Description],[CategoryId],[BranchId],[SetUpAmount],[ChartOfAccountId]
						,Remarks,[Status],ChannelId,[Day])
					VALUES
						(@_Id, @Description,@CategoryId,@BranchId,@SetUpAmount,@ChartOfAccountId,@Remarks, @_Status,@ChannelId,@Day);
			
					-- Return of the Data type
					SELECT 	@_Id					AS 'Id', 
							@Description			AS 'Description',
							@CategoryId				AS 'CategoryId',
							@BranchId				AS 'BranchId',
							@ChannelId				AS 'ChannelId',
							@Day					AS 'Day',
							@SetUpAmount			AS 'SetUpAmount',
							@ChartOfAccountId		AS 'ChartOfAccountId',
							@Remarks				AS 'Remarks',
							'success'				AS 'return_message';		
				Declare @Insert	VARCHAR(max),
							
							@Insert1 VARCHAR (50) = (SELECT Username From Masterfile_User where Id =  @UserId);
						SET @Insert = 'Inserted: '+@Description+' Other Receipt Detail by '+@Insert1;
					EXEC spAuditTrail_insert 'Masterfile_OtherReceiptDetail',@_Id,'Insert',@UserId,@Insert;
					
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherReceiptDetail_update]    Script Date: 8/25/2018 10:59:25 AM ******/
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
		DECLARE @Old VARCHAR(50),
		@Old2 VARCHAR(50),
		@Old3 VARCHAR(50),
		@Old4 VARCHAR(50),
		@Old5 VARCHAR(50),
		@Old6 VARCHAR(50),
		@Old7 VARCHAR(50),
		@Old8 VARCHAR(50)
		SET @Old=(SELECT [Description] FROM Masterfile_OtherReceiptDetail WHERE Id= @Id)
		SET @Old2=(SELECT CategoryId FROM Masterfile_OtherReceiptDetail WHERE Id= @Id)
		SET @Old3=(SELECT BranchId FROM Masterfile_OtherReceiptDetail WHERE Id= @Id)
		SET @Old4=(SELECT SetUpAmount FROM Masterfile_OtherReceiptDetail WHERE Id= @Id)
		SET @Old5=(SELECT ChartOfAccountId FROM Masterfile_OtherReceiptDetail WHERE Id= @Id)
		SET @Old6=(SELECT [Day] FROM Masterfile_OtherReceiptDetail WHERE Id= @Id)
		SET @Old7=(SELECT ChannelId FROM Masterfile_OtherReceiptDetail WHERE Id= @Id)
		SET @Old8=(SELECT Remarks FROM Masterfile_OtherReceiptDetail WHERE Id= @Id)
		IF EXISTS(SELECT Id FROM [dbo].[Masterfile_OtherReceiptDetail] WHERE [Description] =  @Description AND [Status] = 1 AND Id <> @Id)
				BEGIN  							
					SELECT	'duplicate_description'	AS 'return_message';						
				END

		ELSE		
				BEGIN
					UPDATE [dbo].[Masterfile_OtherReceiptDetail]	 
					SET	[Description]		= @Description,
						[CategoryId]		= @CategoryId, 
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
					@BranchId			AS 'BranchId',
					@SetUpAmount		AS 'Set Up Amount',
					@Day				AS 'Day',
					@ChannelId			AS 'ChannelId',
					@ChartOfAccountId	AS 'ChartOfAccountId',
					@Remarks			AS 'Remarks',
					'success'			AS 'return_message';
				Declare @Update	VARCHAR(max),
							
					@Update1 VARCHAR (50) = (SELECT Username From Masterfile_User where Id =  @UserId),
					@Category VARCHAR(50) = (SELECT CategoryId From Masterfile_OtherReceiptDetail Where Id= @Id), 
					@Branch VARCHAR(50) = (SELECT BranchId From Masterfile_OtherReceiptDetail Where Id= @Id),
					@SetupAmounts VARCHAR(50) = (SELECT SetUpAmount From Masterfile_OtherReceiptDetail Where Id= @Id),
					@Days	VARCHAR(50) = (SELECT [Day] From Masterfile_OtherReceiptDetail Where Id= @Id),
					@Channel VARCHAR(50) = (SELECT ChannelId From Masterfile_OtherReceiptDetail Where Id= @Id),
					@ChartOfAccountIds	VARCHAR(50) = (SELECT ChartOfAccountId From Masterfile_OtherReceiptDetail Where Id= @Id);
					SET @Update = 'Updated: Description From['+@Old+'] To['+@Description+'], CategoryId From['+@Old2+'] To['+@Category+'], BranchId From['+@Old3+'] To['+@Branch+'], Setup Amount From['+@Old4+'] To['+@SetupAmounts+'], Day From['+@Old5+'] To['+@Days+'], ChannelId From['+@Old6+'] To['+@Channel+'], ChartOfAccountId From['+@Old7+'] To['+@ChartOfAccountIds+'] and Remarks From['+@Old8+'] To['+@Remarks+'] on Other Disbursement Details by '+@Update1;
					EXEC spAuditTrail_insert 'Masterfile_OtherReceiptDetail',@Id,'Update',@UserId,@Update;
			
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_PageAction_delete]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
--EXEC spMasterfile_PageAction_delete 1,2
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_PageAction_delete]
	@Id					INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0
			UPDATE [dbo].[Masterfile_PageAction]	 
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_PageAction_get]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_PageAction_get
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_PageAction_get]
	-- Add the parameters for the stored procedure here
	@PageActionId			INT	= 0,
	@PageNumber		INT = 1,
	@RowsPage 		INT = 100
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Regions and its details
			IF  (@PageActionId = 0)
				BEGIN

					WITH TempResult AS(
					SELECT mp.Id,mp.SystemRightsId ,mp.FunctionId,ms.[Page],
					ms.Module, PageSeqNo AS 'Page Sequence No.',RightsSeqNo AS 'Rights Sequence No.', mf.[Name] as 'Function',
					mp.[Remarks] AS 'Page Action Remarks', mf.Remarks AS 'Function Remarks'
					from Masterfile_PageAction mp 
					left join Masterfile_SystemRights ms
					on mp.SystemRightsId = ms.Id  
					left join Masterfile_Function mf
					on mp.FunctionId =  mf.Id and mf.[Status] = 1
					where
					mp.[Status] = 1
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[Module], TempResult.[Page],TempResult.[Function]
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

				END
			ELSE
				BEGIN

					WITH TempResult AS(
					SELECT mp.Id,mp.SystemRightsId ,ms.[Page],mp.FunctionId,
					ms.Module, PageSeqNo AS 'Page Sequence No.',RightsSeqNo AS 'Rights Sequence No.', mf.[Name] as 'Function',
					mp.[Remarks] AS 'Page Action Remarks', mf.Remarks AS 'Function Remarks'
					from Masterfile_PageAction mp
					left join Masterfile_SystemRights ms
					on mp.SystemRightsId = ms.Id  
					left join Masterfile_Function mf
					on mp.FunctionId =  mf.Id and mf.[Status] = 1
					where
					mp.[Status] = 1 AND mp.Id = @PageActionId
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[Function]
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_PageAction_getall]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_PageAction_get
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_PageAction_getall]
	-- Add the parameters for the stored procedure here
	@PageActionId			INT	= 0
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Regions and its details
			IF  (@PageActionId = 0)
				BEGIN
					SELECT mp.Id,mp.SystemRightsId ,mp.FunctionId,ms.[Page],
					ms.Module, PageSeqNo AS 'Page Sequence No.',RightsSeqNo AS 'Rights Sequence No.', mf.[Name] as 'Function',
					mp.[Remarks] AS 'Page Action Remarks', mf.Remarks AS 'Function Remarks'
					from Masterfile_PageAction mp 
					left join Masterfile_SystemRights ms
					on mp.SystemRightsId = ms.Id  
					left join Masterfile_Function mf
					on mp.FunctionId =  mf.Id and mf.[Status] = 1
					where
					mp.[Status] = 1
					
				END
			ELSE
				BEGIN
					
					SELECT mp.Id,mp.SystemRightsId ,ms.[Page],mp.FunctionId,
					ms.Module, PageSeqNo AS 'Page Sequence No.',RightsSeqNo AS 'Rights Sequence No.', mf.[Name] as 'Function',
					mp.[Remarks] AS 'Page Action Remarks', mf.Remarks AS 'Function Remarks'
					from Masterfile_PageAction mp
					left join Masterfile_SystemRights ms
					on mp.SystemRightsId = ms.Id  
					left join Masterfile_Function mf
					on mp.FunctionId =  mf.Id and mf.[Status] = 1
					where
					mp.[Status] = 1 AND mp.Id = @PageActionId
				
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_PageAction_insert]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_PageAction_insert '1',1,'',2
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_PageAction_insert]
	-- Add the parameters for the stored procedure here
	@SystemRightsId				int,
	@FunctionId					int,
	@Remarks			VARCHAR(150)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT,
					@_Status			TINYINT  = 1;		-- Default as 1 as describe as 'Active'


			SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Masterfile_PageAction];
			
					INSERT INTO [dbo].[Masterfile_PageAction]
						(Id,SystemRightsId,FunctionId,Remarks,[Status])
					VALUES
						(@_Id, @SystemRightsId,@FunctionId,@Remarks, @_Status);
			
					-- Return of the Data type
					SELECT 	@_Id					AS 'Id', 
							@SystemRightsId					AS 'SystemRightsId',
							@FunctionId			AS 'FunctionId',
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_PageAction_update]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_PageAction_update]
	-- Add the parameters for the stored procedure here
	@Id					INT,
	@SystemRightsId		INT,
	@FunctionId			INT,
	@Remarks			VARCHAR(150)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

				UPDATE [dbo].[Masterfile_PageAction]	 
					SET	[SystemRightsId]		= @SystemRightsId,
						[FunctionId]	= @FunctionId,
						[Remarks]	= @Remarks
					WHERE 
						[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT	@Id		AS 'Id',
					@SystemRightsId	AS 'SystemRightsId',
					@FunctionId	AS 'FunctionId',
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Position_BIJLISync]    Script Date: 8/25/2018 10:59:25 AM ******/
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
CREATE PROCEDURE [dbo].[spMasterfile_Position_BIJLISync]
	-- Add the parameters for the stored procedure here
	@Code					VARCHAR(10),
	@Description				VARCHAR(100),
	@UserId				BIGINT
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			IF EXISTS(SELECT Id FROM [dbo].[Masterfile_Position] WHERE [Code] =  @Code AND [Status] = 1)
				BEGIN  							
				UPDATE [dbo].[Masterfile_Position]	 
					SET	
						[Description]		= @Description
					WHERE 
						[Code]			= @Code;				
				END

			ELSE
				BEGIN
					EXEC spMasterfile_Position_insert @Code,@Description,'';
					SELECT  @Code				AS 'Code',
							@Description		AS 'Description',
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Position_delete]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Position_delete 1,2
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Position_delete]
	@Id					INT,
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0,
			@Delete VARCHAR(50)= 'Deleted: ',
			@Delete1 VARCHAR(100) = (SELECT [Description] from Masterfile_Position Where Id= @Id),
			@Delete2 VARCHAR(50)= ' Position by ',
			@Delete3 Varchar(50) = (SELECT Username from Masterfile_User Where Id = @UserId);
			SET @Delete = @Delete+@Delete1+@Delete2+@Delete3;		
			EXEC spAuditTrail_insert 'Masterfile_Position',@Id,'Delete',@UserID,@Delete;
			
			UPDATE [dbo].[Masterfile_Position]	 
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Position_get]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Position_get
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Position_get]
	-- Add the parameters for the stored procedure here
	@PositionId		INT	= 0,
	@PageNumber		INT = 1,
	@RowsPage 		INT = 10
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Positions and its details
			IF  (@PositionId = 0)
				BEGIN

					WITH TempResult AS(
					SELECT Id,Code,[Description],Remarks from Masterfile_Position
					where 
					[Status] = 1
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[Description]
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

				END
			ELSE
				BEGIN

					WITH TempResult AS(
					SELECT Id,Code,[Description],Remarks from Masterfile_Position
					where 
					[Status] = 1	AND Id= @PositionId 
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[Description]
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Position_getall]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Position_get
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Position_getall]
	-- Add the parameters for the stored procedure here
	@PositionId		INT	= 0
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Positions and its details
			IF  (@PositionId = 0)
				BEGIN

					SELECT Id,Code,[Description],Remarks from Masterfile_Position
					where 
					[Status] = 1
					
				END
			ELSE
				BEGIN
					SELECT Id,Code,[Description],Remarks from Masterfile_Position
					where 
					[Status] = 1	AND Id= @PositionId 
				
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Position_insert]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Description>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Position_insert '192332','Exec','EXEC',2
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Position_insert]
	-- Add the parameters for the stored procedure here\
	@Code					VARCHAR(10),
	@Description				VARCHAR(100),
	@Remarks			VARCHAR(150) ,
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT,
					@_Status			TINYINT  = 1;		-- Default as 1 as describe as 'Active'


			SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Masterfile_Position];

			IF EXISTS(SELECT Id FROM [dbo].[Masterfile_Position] WHERE [Code] =  @Description AND [Status] = 1)
				BEGIN  							
					SELECT	'duplicate_Code'	AS 'return_message';						
				END

			ELSE
				BEGIN
					INSERT INTO [dbo].[Masterfile_Position]
						(Id,Code,[Description],Remarks,[Status])
					VALUES
						(@_Id, @Code,@Description,@Remarks, @_Status);
			
					-- Return of the Data type
					SELECT 	@_Id					AS 'Id',
							@Code					AS 'Code', 
							@Description			AS 'Description',
							@Remarks				AS 'Remarks',
				
							'success'				AS 'return_message';	
					Declare @Insert	VARCHAR(max),
							
							@Insert1 VARCHAR (50) = (SELECT Username From Masterfile_User where Id =  @UserId);
						SET @Insert = 'Inserted: '+@Description+' Position by '+@Insert1;
					EXEC spAuditTrail_insert 'Masterfile_Position',@_Id,'Insert',@UserId,@Insert;
						
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Position_update]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Position_update]
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
			DECLARE @Old VARCHAR(50),
			@Old2 VARCHAR(50),
			@Old3 VARCHAR(50)
			SET @Old = (SELECT Code From Masterfile_Position WHERE Id =  @Id);
			SET @Old2 = (SELECT [Description] From Masterfile_Position WHERE Id =  @Id);
			SET @Old3 = (SELECT Remarks From Masterfile_Position WHERE Id =  @Id);

			IF (EXISTS(SELECT Id FROM [dbo].[Masterfile_Position] WHERE [Code] =  @Code AND [Status] = 1 and Id <> @Id))
				BEGIN  							
					SELECT	'duplicate_position'	AS 'return_message';						
				END

			ELSE
				BEGIN
				UPDATE [dbo].[Masterfile_Position]	 
					SET	[Code]		= @Code,
						[Description]	= @Description,
						[Remarks]	= @Remarks
					WHERE 
						[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT	@Id	AS 'Id',
					@Code	AS 'Code',
					@Description	AS 'Description',
					@Remarks	AS 'Remarks',
					'success'	AS 'return_message';
				Declare @Update	VARCHAR(max),	
						@Update1 VARCHAR (50) = (SELECT Username From Masterfile_User where Id =  @UserId)
						SET @Update = 'Updated: Code From['+@Old+'] To['+@Code+'], Description From['+@Old2+'] To['+@Description+'] and Remarks From['+@Old3+'] To['+@Remarks+'] on Position by '+@Update1;
					EXEC spAuditTrail_insert 'Masterfile_Position',@Id,'Update',@UserId,@Update;
				
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Region_delete]    Script Date: 8/25/2018 10:59:25 AM ******/
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

			DECLARE @_Deleted INT = 0,
			@Delete VARCHAR(50)= 'Deleted: ',
			@Delete1 VARCHAR(100) = (SELECT Name from Masterfile_Region Where Id= @Id),
			@Delete2 VARCHAR(50)= ' by ',
			@Delete3 Varchar(50) = (SELECT Username from Masterfile_User Where Id = @UserId);
			SET @Delete = @Delete+@Delete1+@Delete2+@Delete3;		
			EXEC spAuditTrail_insert 'Masterfile_Region',@Id,'Delete',@UserID,@Delete;
			
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Region_get]    Script Date: 8/25/2018 10:59:25 AM ******/
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
exec spMasterfile_Region_get 0,1,10
*/
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Region_get]
	-- Add the parameters for the stored procedure here
	@RegionId		INT	= 0,
	@PageNumber		INT = 1,
	@RowsPage 		INT = 10
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Regions and its details
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Region_getall]    Script Date: 8/25/2018 10:59:25 AM ******/
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
exec spMasterfile_Region_get 0,1,10
*/
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Region_getall]
	-- Add the parameters for the stored procedure here
	@RegionId		INT	= 0
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Regions and its details
			IF  (@RegionId = 0)
				BEGIN

						SELECT 
							Id,[Name],Remarks
						FROM 
							Masterfile_Region
						WHERE 
							[Status] = 1 
				
				END
			ELSE
				BEGIN

						SELECT 
							Id,[Name],Remarks
						FROM 
							Masterfile_Region
						WHERE 
							[Status] = 1 AND Id = @RegionId
				
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Region_insert]    Script Date: 8/25/2018 10:59:25 AM ******/
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
					@_Status			TINYINT  = 1;		-- Default as 1 as describe as 'Active'


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
					Declare @Insert	VARCHAR(max),
							
							@Insert1 VARCHAR (50) = (SELECT Username From Masterfile_User where Id =  @UserId);
						SET @Insert = 'Inserted: '+@Name+' by '+@Insert1;
					EXEC spAuditTrail_insert 'Masterfile_Region',@_Id,'Insert',@UserId,@Insert;
								
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Region_update]    Script Date: 8/25/2018 10:59:25 AM ******/
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
		DECLARE @Old VARCHAR(50),
			@Old1 VARCHAR(50)
			
			SET @Old = (SELECT Name From Masterfile_Region Where Id = @Id);
			SET @Old1 = (SELECT Remarks From Masterfile_Region Where Id = @Id);
			
			IF (EXISTS(SELECT Id FROM [dbo].[Masterfile_Region] WHERE [Name] =  @Name AND [Status] = 1 and Id <> @Id))
				BEGIN  							
					SELECT	'duplicate_regionnamme'	AS 'return_message';						
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
				Declare @Update	VARCHAR(max),	
						@Update1 VARCHAR (50) = (SELECT Username From Masterfile_User where Id =  @UserId)
						SET @Update = 'Updated: Region Name From['+@Old+'] To['+@Name+'], and Remarks From['+@Old1+'] To['+@Remarks+'] on Region by '+@Update1;
					EXEC spAuditTrail_insert 'Masterfile_Region',@Id,'Update',@UserId,@Update;
				
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Role_delete]    Script Date: 8/25/2018 10:59:25 AM ******/
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

			DECLARE @_Deleted INT = 0,
			@Delete VARCHAR(50)= 'Deleted: ',
			@Delete1 VARCHAR(100) = (SELECT [Description] from Masterfile_Role Where Id= @Id),
			@Delete2 VARCHAR(50)= ' Role by ',
			@Delete3 Varchar(50) = (SELECT Username from Masterfile_User Where Id = @UserId);
			SET @Delete = @Delete+@Delete1+@Delete2+@Delete3;		
			EXEC spAuditTrail_insert 'Masterfile_Role',@Id,'Delete',@UserID,@Delete;
			
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Role_get]    Script Date: 8/25/2018 10:59:25 AM ******/
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
	@RoleId		INT	= 0,
	@PageNumber		INT = 1,
	@RowsPage 		INT = 10
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Roles and its details
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
					ORDER BY TempResult.[Description]
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
					ORDER BY TempResult.[Description]
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Role_getall]    Script Date: 8/25/2018 10:59:25 AM ******/
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
CREATE PROCEDURE [dbo].[spMasterfile_Role_getall]
	-- Add the parameters for the stored procedure here
	@RoleId		INT	= 0
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Roles and its details
			IF  (@RoleId = 0)
				BEGIN
					SELECT Id,[Description],Remarks from Masterfile_Role
					where
					[Status] = 1
				
				END
			ELSE
				BEGIN
					SELECT Id,[Description],Remarks from Masterfile_Role
					where
					[Status] = 1 AND Id = @RoleId
					
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Role_insert]    Script Date: 8/25/2018 10:59:25 AM ******/
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
	@Description				VARCHAR(100),
	@Remarks			VARCHAR(150) ,
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT,
					@_Status			TINYINT  = 1;		-- Default as 1 as describe as 'Active'


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
			
					-- Return of the Data type
					SELECT 	@_Id					AS 'Id', 
							@Description			AS 'Description',
							@Remarks				AS 'Remarks',
							'success'					AS 'return_message';		
				Declare @Insert	VARCHAR(max),
							
							@Insert1 VARCHAR (50) = (SELECT Username From Masterfile_User where Id =  @UserId);
						SET @Insert = 'Inserted: '+@Description+' Role by '+@Insert1;
					EXEC spAuditTrail_insert 'Masterfile_Role',@_Id,'Insert',@UserId,@Insert;
						
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Role_update]    Script Date: 8/25/2018 10:59:25 AM ******/
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
		DECLARE @Old VARCHAR(50),
			@Old1 VARCHAR(50)
			
			SET @Old = (SELECT [Description] From Masterfile_Role Where Id = @Id);
			SET @Old1 = (SELECT Remarks From Masterfile_Role Where Id = @Id);
			
		
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
			
			-- Return Data of the Update
			SELECT	@Id	AS 'Id',
					@Description	AS 'Description',
					@Remarks	AS 'Remarks',
					'success'	AS 'return_message';
				Declare @Update	VARCHAR(max),	
						@Update1 VARCHAR (50) = (SELECT Username From Masterfile_User where Id =  @UserId)
						SET @Update = 'Updated: Role Name From['+@Old+'] To['+@Description+'], and Remarks From['+@Old1+'] To['+@Remarks+'] on Role by '+@Update1;
					EXEC spAuditTrail_insert 'Masterfile_Role',@Id,'Update',@UserId,@Update;
				
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_SystemRights_get]    Script Date: 8/25/2018 10:59:25 AM ******/
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
	@SystemRightsId		INT	= 0,
	@PageNumber		INT = 1,
	@RowsPage 		INT = 10
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active SystemRightss and its details
				IF  (@SystemRightsId = 0)
				BEGIN

					WITH TempResult AS(
					SELECT Id,[Module],[Page],PageSeqNo AS 'Page Sequence No.',RightsSeqNo AS 'Rights Sequence No.'
					from Masterfile_SystemRights
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[Module]
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

				END
			ELSE
				BEGIN

					WITH TempResult AS(
					SELECT Id,[Module],[Page],PageSeqNo AS 'Page Sequence No.',RightsSeqNo AS 'Rights Sequence No.'
					from Masterfile_SystemRights
					WHERE
					 Id = @SystemRightsId
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[Module]
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_SystemRights_getall]    Script Date: 8/25/2018 10:59:25 AM ******/
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
CREATE PROCEDURE [dbo].[spMasterfile_SystemRights_getall]
	-- Add the parameters for the stored procedure here
	@SystemRightsId		INT	= 0
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active SystemRightss and its details
				IF  (@SystemRightsId = 0)
				BEGIN

					SELECT Id,[Module],[Page],PageSeqNo AS 'Page Sequence No.',RightsSeqNo AS 'Rights Sequence No.'
					from Masterfile_SystemRights

				END
			ELSE
				BEGIN
					SELECT Id,[Module],[Page],PageSeqNo AS 'Page Sequence No.',RightsSeqNo AS 'Rights Sequence No.'
					from Masterfile_SystemRights
					WHERE
					 Id = @SystemRightsId
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_SystemRights_insert]    Script Date: 8/25/2018 10:59:25 AM ******/
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
	@System			varchar(20),
	@RightsSeqNo		INT 
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT
				


			SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Masterfile_SystemRights];

					INSERT INTO [dbo].[Masterfile_SystemRights]
						(Id,[Module],[Page],[PageSeqNo],[System],[RightsSeqNo])
					VALUES
						(@_Id,@Module,@Page,@PageSeqNo,@System,@RightsSeqNo);
			
					-- Return of the Data type
					SELECT 	@_Id					AS 'Id', 
							@Module			AS 'Module',
							@Page			AS 'Page',
							@PageSeqNo		AS 'PageSeqNo',
							
							@RightsSeqNo	AS 'RightsSeqNo',
							@System			AS 'System',
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_SystemRights_update]    Script Date: 8/25/2018 10:59:25 AM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_User_delete]    Script Date: 8/25/2018 10:59:25 AM ******/
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

			DECLARE @_Deleted INT = 0,
			@Delete VARCHAR(50)= 'Deleted: ',
			@Delete1 VARCHAR(100) = (SELECT [Username] from Masterfile_User Where Id= @Id),
			@Delete2 VARCHAR(50)= ' User by ',
			@Delete3 Varchar(50) = (SELECT Username from Masterfile_User Where Id = @UserId);
			SET @Delete = @Delete+@Delete1+@Delete2+@Delete3;		
			EXEC spAuditTrail_insert 'Masterfile_User',@Id,'Delete',@UserID,@Delete;
			
			UPDATE [dbo].[Masterfile_User]	 
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_User_get]    Script Date: 8/25/2018 10:59:25 AM ******/
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
	@UserId		INT	= 0,
	@PageNumber		INT = 1,
	@RowsPage 		INT = 10
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Users and its details
			IF  (@UserId = 0)
				BEGIN

					WITH TempResult AS(
					SELECT mu.Id,mu.[Password],mu.Username,
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
					ORDER BY TempResult.[Username]
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

				END
			ELSE
				BEGIN

					WITH TempResult AS(
					SELECT mu.Id,mu.[Password],mu.Username,
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
					ORDER BY TempResult.[Username]
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

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
/****** Object:  StoredProcedure [dbo].[spMasterfile_User_getall]    Script Date: 8/25/2018 10:59:25 AM ******/
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
CREATE PROCEDURE [dbo].[spMasterfile_User_getall]
	-- Add the parameters for the stored procedure here
	@UserId		INT	= 0
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Users and its details
			IF  (@UserId = 0)
				BEGIN

					SELECT mu.Id,mu.[Password],mu.Username,
					mu.EmployeeId,me.Firstname AS Firstname,me.Middlename AS Middlename,
					me.Lastname AS Lastname,mu.RoleId,mr.[Description] AS [Role],mu.Remarks 
					from Masterfile_User mu
					left join Masterfile_Role mr 
					on mu.RoleId =mr.Id  and mr.[Status] = 1
					left join Masterfile_Employee me
					on mu.EmployeeId = me.Id and me.[Status] = 1
					where
					mu.[Status] = 1
					
				END
			ELSE
				BEGIN

					SELECT mu.Id,mu.[Password],mu.Username,
					mu.EmployeeId,me.Firstname AS Firstname,me.Middlename AS Middlename,
					me.Lastname AS Lastname,mu.RoleId,mr.[Description] AS [Role],mu.Remarks 
					from Masterfile_User mu
					left join Masterfile_Role mr 
					on mu.RoleId =mr.Id and mr.[Status] = 1
					left join Masterfile_Employee me
					on mu.EmployeeId = me.Id and me.[Status] = 1
					where
					mu.[Status] = 1		AND mu.Id= @UserId 
				
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_User_insert]    Script Date: 8/25/2018 10:59:25 AM ******/
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
	@Password				VARCHAR(50),
	@RoleId					INT,
	@EmployeeId				INT,
	@ActiveDirectoryName	varchar(80) = '',
	@Remarks			VARCHAR(150) ,
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT,
					@_Status			TINYINT  = 1;		-- Default as 1 as describe as 'Active'


			SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Masterfile_User];

			IF EXISTS(SELECT Id FROM [dbo].[Masterfile_User] WHERE Username =  @Username AND [Status] = 1)
				BEGIN  							
					SELECT	'duplicate_username'	AS 'return_message';						
				END

			ELSE
				BEGIN
					INSERT INTO [dbo].[Masterfile_User]
						(Id,Username,[Password],RoleId,EmployeeId,Remarks,[Status],[ActiveDirectoryName])
					VALUES
						(@_Id, @Username,@Password,@RoleId,@EmployeeId,@Remarks, @_Status,@ActiveDirectoryName);
			
					-- Return of the Data type
					SELECT 	@_Id					AS 'Id', 
							@Username				AS 'Username',
							@Password				AS 'Password',
							@RoleId					AS 'RoleId',
							@EmployeeId				AS 'EmployeeId',
							@ActiveDirectoryName	AS 'Active Directory Name',
							@Remarks				AS 'Remarks',
							'success'					AS 'return_message';		
				Declare @Insert	VARCHAR(max),
							
							@Insert1 VARCHAR (50) = (SELECT Username From Masterfile_User where Id =  @UserId);
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_User_Login]    Script Date: 8/25/2018 10:59:25 AM ******/
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
	@UserName		VARCHAR(50),
	@Password		VARCHAR(50)
AS 

BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			

			SET NOCOUNT ON;	

			-- Validation if the data is match and exist	
			IF EXISTS(SELECT [Id] FROM [Masterfile_User] WHERE [UserName] = @UserName AND 
					[Password] = @Password AND [Status] =  1)
				BEGIN
					SELECT 
						mu.Id,
						[UserName],	
						[Password],		
						me.Id AS 'EmployeeId',
						RoleId,
						me.Branchid,
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
						[Password] = @Password					AND		
						me.[Status] = 1;								
				END

			-- Else Statement if no data found on the query
			ELSE
				BEGIN

					-- Disable User account
					IF EXISTS(SELECT [Id] FROM [Masterfile_User]WHERE [UserName] = @UserName
					 AND [Password] =  @Password  AND [Status] = 2)
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_User_LoginByAD]    Script Date: 8/25/2018 10:59:25 AM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_User_LoginByGmail]    Script Date: 8/25/2018 10:59:25 AM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_User_update]    Script Date: 8/25/2018 10:59:25 AM ******/
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
	@Password			VARCHAR(50),
	@RoleId				INT,
	@EmployeeId			INT,
	@Remarks			VARCHAR(150),
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		DECLARE @Old  VARCHAR(50),
				@Old2 VARCHAR(50),
				@Old3 VARCHAR(50),
				@Old4 VARCHAR(50),
				@Old5 VARCHAR(50)
				SET @Old  = (SELECT Username FROM Masterfile_User WHERE Id = @Id);
				SET @Old2 = (SELECT [Password] FROM Masterfile_User WHERE Id = @Id);
				SET @Old3 = (SELECT  RoleId FROM Masterfile_User WHERE Id = @Id);
				SET @Old4 = (SELECT EmployeeId FROM Masterfile_User WHERE Id = @Id);
				SET @Old5 = (SELECT Remarks FROM Masterfile_User WHERE Id = @Id);

				UPDATE [dbo].[Masterfile_User]	 
					SET	[Username]		= @Username,
						[Password]	 =@Password,
						[RoleId] = @RoleId,
						[EmployeeId] = @EmployeeId,
						[Remarks] = @Remarks
					WHERE 
						[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT	@Id	AS 'Id',
					@Username	AS 'Username',
					@Password	AS 'Password',
					@RoleId	AS 'RoleId',
					@EmployeeId	AS 'EmployeeId',
					@Remarks	AS 'Remarks',
					'success'	AS 'return_message';
			Declare @Update	VARCHAR(max),	
						@Update1 VARCHAR (50) = (SELECT Username From Masterfile_User where Id =  @UserId),
						@Role VARCHAR(50) = (SELECT RoleId FROM Masterfile_User WHERE Id =  @Id),
						@Employee VARCHAR(50) = (SELECT EmployeeId FROM Masterfile_User WHERE Id =  @Id)
						SET @Update = 'Updated: Username From['+@Old+'] To['+@Username+'], Password From['+@Old2+'] To['+@Password+'], RoleId From['+@Old3+'] To['+@Role+'], EmployeeId From['+@Old4+'] To['+@Employee+'] and Remarks From['+@Old5+'] To['+@Remarks+'] on User by '+@Update1;
					EXEC spAuditTrail_insert 'Masterfile_User',@Id,'Update',@UserId,@Update;
				
		
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPeriod_close]    Script Date: 8/25/2018 10:59:25 AM ******/
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
	@ClosedBy				int,
	@Remarks				VARCHAR(150),
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
					@_ErrorLine			INT	


			IF EXISTS(SELECT Id FROM [Transaction_BudgetPeriod] WHERE Id = @Id  AND [PeriodStatus] = 'Open')
				BEGIN
					update [dbo].[Transaction_BudgetPeriod] set
					PeriodStatus = 'Closed',
					DateClosed = GETDATE(),
					ClosedBy = @ClosedBy,
					ClosedRemarks = @Remarks
					where
					Id = @Id;

					-- Return of the Data type
					SELECT
					@Id	AS 'Id', 
					'Closed'	AS 'Period Status',
					GETDATE()	AS 'Date Closed',
					@ClosedBy	AS 'Closed By',
					@Remarks	AS 'Remarks',
					'success'	AS 'return_message'; 
					Declare @Close	VARCHAR(max)	
						SET @Close = 'Budget Period was Closed by'+@ClosedBy;
					EXEC spAuditTrail_insert 'Transaction_BudgetPeriod',@Id,'Close',@UserId,@Close;
				
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPeriod_CurrentOpen]    Script Date: 8/25/2018 10:59:25 AM ******/
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
	-- Add the parameters for the stored procedure here
	@Month  INT = 0,
	@Year INT =0
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Users and its details
			DECLARE @_BudgetPerioId  BIGINT;

			IF (@Month = 0 AND @Year = 0)
				BEGIN
					SELECT TOP 1 @_BudgetPerioId = Id FROM [dbo].[Transaction_BudgetPeriod] 
					WHERE ClosedBy = NULL;
					EXEC spTransaction_BudgetPeriod_getall @_BudgetPerioId;
				END
			ELSE
				BEGIN
				SELECT TOP 1 @_BudgetPerioId = Id FROM [dbo].[Transaction_BudgetPeriod] 
					WHERE [Month] = @Month AND [Year] = @Year ;
					EXEC spTransaction_BudgetPeriod_getall @_BudgetPerioId;
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPeriod_get]    Script Date: 8/25/2018 10:59:25 AM ******/
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
CREATE PROCEDURE [dbo].[spTransaction_BudgetPeriod_get]
	-- Add the parameters for the stored procedure here
	@Id		INT	= 0,
	@PageNumber		INT = 1,
	@RowsPage 		INT = 10
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Users and its details
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPeriod_getall]    Script Date: 8/25/2018 10:59:25 AM ******/
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
CREATE PROCEDURE [dbo].[spTransaction_BudgetPeriod_getall]
	-- Add the parameters for the stored procedure here
	@Id		INT	= 0
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Users and its details
			IF  (@Id = 0)
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
						ORDER BY [Period Status] DESC, [Year] DESC, [Month] DESC
				END
			ELSE
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
					tbp.[Status] = 1 AND tbp.Id= @Id 
						ORDER BY [Period Status] DESC, [Year] DESC, [Month] DESC
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPeriod_open]    Script Date: 8/25/2018 10:59:25 AM ******/
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
	@OpenBy					int,
	@Remarks				VARCHAR(150),
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
					@_Status			TINYINT  = 1 		-- Default as 1 as describe in tbl_Status as 'Active'


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
					@OpenBy,@Remarks, @_Status);

					-- Return of the Data type
					SELECT @_Id	AS 'Id', 
					@Month	AS 'Month',
					@Year	AS 'Year',
					'Open'	AS 'Period Status',
					GETDATE()	AS 'Date Open',
					@OpenBy	AS 'Open By',
					@Remarks	AS 'Remarks',
					'success'	AS 'return_message';
					Declare @Close	VARCHAR(max)	
						SET @Close = 'Budget Period was Opened by'+@OpenBy;

					EXEC spAuditTrail_insert 'Transaction_BudgetPeriod',@_Id,'Open',@UserId,@Close;
				 

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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparation_delete]    Script Date: 8/25/2018 10:59:25 AM ******/
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

			DECLARE @_Deleted INT = 0,
			@Delete VARCHAR(50)= 'Deleted: BudgetPreparationId [',
			@Id1 VARCHAR(30)= (SELECT Id  from Transaction_BudgetPreparation Where Id = @Id),
			@Delete2 VARCHAR(50)= '] by ',
			@Delete1 Varchar(50) = (SELECT Username from Masterfile_User Where Id = @UserId);
			SET @Delete = @Delete+@Id1+@Delete2+@Delete1;		
			EXEC spAuditTrail_insert 'Transaction_BudgetPreparation',@Id,'Delete',@UserID,@Delete;
			
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparation_get]    Script Date: 8/25/2018 10:59:25 AM ******/
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
	@Id		INT	= 0,
	@PageNumber		INT = 1,
	@RowsPage 		INT = 10
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Users and its details
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
					tb.UserId,mu.Username,tb.Remarks
					from Transaction_BudgetPreparation tb
					left join Transaction_BudgetPeriod tp
					on tb.BudgetPeriodId =tp.Id and tp.[Status] = 1
					left join Masterfile_Branch mb
					on tb.BranchId =mb.Id and mb.[Status] = 1
					left join Masterfile_User mu
					on tb.UserId =mu.Id and mu.[Status] = 1 
					where
					tb.[Status] = 1
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[BudgetPeriodId]
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
					tb.UserId,mu.Username,tb.Remarks
					from Transaction_BudgetPreparation tb
					left join Transaction_BudgetPeriod tp
					on tb.BudgetPeriodId =tp.Id and tp.[Status] = 1
					left join Masterfile_Branch mb
					on tb.BranchId =mb.Id and mb.[Status] = 1
					left join Masterfile_User mu
					on tb.UserId =mu.Id  and mu.[Status] = 1
					where
					tb.[Status] = 1 AND tb.Id= @Id 
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[BudgetPeriodId]
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparation_getall]    Script Date: 8/25/2018 10:59:25 AM ******/
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
CREATE PROCEDURE [dbo].[spTransaction_BudgetPreparation_getall]
	-- Add the parameters for the stored procedure here
	@Id		INT	= 0
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Users and its details
			IF  (@Id = 0)
				BEGIN

					
					SELECT tb.Id,tb.BudgetPeriodId,tb.BranchId,mb.Name AS 'Branch Name ',
					tb.TotalInflowBudget AS 'Total Inflow Budget',
					tb.TotalInflowActual AS 'Total Inflow Actual',
					tb.TotalInflowVariance AS 'Total Inflow Variance',
					tb.TotalOutflowBudget AS 'Total Outflow Budget',
					tb.TotalOutflowActual AS 'Total Outflow Actual',
					tb.TotalOutflowVariance AS 'Total Outflow Variance',
					tb.UserId,mu.Username,tb.Remarks
					from Transaction_BudgetPreparation tb
					left join Transaction_BudgetPeriod tp
					on tb.BudgetPeriodId =tp.Id and tp.[Status] = 1
					left join Masterfile_Branch mb
					on tb.BranchId =mb.Id and mb.[Status] = 1
					left join Masterfile_User mu
					on tb.UserId =mu.Id and mu.[Status] = 1 
					where
					tb.[Status] = 1
					
				END
			ELSE
				BEGIN
					SELECT tb.Id,tb.BudgetPeriodId,tb.BranchId,mb.Name AS 'Branch Name ',
					tb.TotalInflowBudget AS 'Total Inflow Budget',
					tb.TotalInflowActual AS 'Total Inflow Actual',
					tb.TotalInflowVariance AS 'Total Inflow Variance',
					tb.TotalOutflowBudget AS 'Total Outflow Budget',
					tb.TotalOutflowActual AS 'Total Outflow Actual',
					tb.TotalOutflowVariance AS 'Total Outflow Variance',
					tb.UserId,mu.Username,tb.Remarks
					from Transaction_BudgetPreparation tb
					left join Transaction_BudgetPeriod tp
					on tb.BudgetPeriodId =tp.Id and tp.[Status] = 1
					left join Masterfile_Branch mb
					on tb.BranchId =mb.Id and mb.[Status] = 1
					left join Masterfile_User mu
					on tb.UserId =mu.Id  and mu.[Status] = 1
					where
					tb.[Status] = 1 AND tb.Id= @Id 
					
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparation_insert]    Script Date: 8/25/2018 10:59:25 AM ******/
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
	@UserId				INT,
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
						UserId,Remarks,[Status])
					VALUES
						(@_Id,@BudgetPeriodId,@BranchId,
						@UserId,@Remarks, @_Status);
			
					-- Return of the Data type
					SELECT 	@_Id					AS 'Id', 
							@BudgetPeriodId			AS 'BudgetPeriodId',
							@BranchId				AS 'BranchId',
							@UserId					AS 'UserId',
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparation_update]    Script Date: 8/25/2018 10:59:25 AM ******/
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
	@UserId				int,	
	@Remarks			VARCHAR(150)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

				UPDATE [dbo].[Transaction_BudgetPreparation]	 
					SET	
					
						[BudgetPeriodId] =@BudgetPeriodId,
						[BranchId]		=@BranchId,
						[UserId]	=@UserId,
						
						[Remarks]=@Remarks

					WHERE 
						[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT	@BudgetPeriodId  AS 'BudgetPeriodId',
					@BranchId		AS 'BranchId',
					@UserId			AS 'UserId',
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationCollections_get]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spTransaction_BudgetPreparationCollections_get 3,'cbu/savings'
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_BudgetPreparationCollections_get]
	-- Add the parameters for the stored procedure here
	@Id		BIGINT,
	@Detail VARCHAR(150)
		
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
					tbd.Week5 AS 'Week 5',tbd.Total,
					tbd.Remarks
					from Transaction_BudgetPreparationDetail tbd
					left join Transaction_BudgetPreparation tb
					on tbd.BudgetPreparationId =tb.Id and tb.[Status] = 1
					left join Masterfile_Channel mh
					on tbd.ChannelId =mh.Id and mh.[Status] = 1
					where
					tbd.BudgetPreparationId = @Id AND
					tbd.Detail = @Detail AND
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationCurrent_delete]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
--	EXEC spTransaction_BudgetPreparationCurrent_delete 1,2
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_BudgetPreparationCurrent_delete]
	@Id					INT,
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0,
			@Delete VARCHAR(50)= 'Deleted: BudgetPreparationCurrentId [',
			@Id1 VARCHAR(30)= (SELECT Id  from Transaction_BudgetPreparationCurrent Where Id = @Id),
			@Delete2 VARCHAR(50)= '] by ',
			@Delete1 Varchar(50) = (SELECT Username from Masterfile_User Where Id = @UserId);
			SET @Delete = @Delete+@Id1+@Delete2+@Delete1;		
			EXEC spAuditTrail_insert 'Transaction_BudgetPreparationCurrent',@Id,'Delete',@UserID,@Delete;
			
			UPDATE [dbo].[Transaction_BudgetPreparationCurrent]	 
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationCurrent_get]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spTransaction_BudgetPreparationCurrent_get
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_BudgetPreparationCurrent_get]
	-- Add the parameters for the stored procedure here
	@Id		INT	= 0,
	@PageNumber		INT = 1,
	@RowsPage 		INT = 10
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Users and its details
			IF  (@Id = 0)
				BEGIN

					WITH TempResult AS(
					SELECT tb.BudgetPeriodId,mb.Name AS 'Branch Name ',
					tb.TotalInflowBudget AS 'Total Inflow Budget',
					tb.TotalInflowActual AS 'Total Inflow Actual',
					tb.TotalInflowVariance AS 'Total Inflow Variance',
					tb.TotalOutflowBudget AS 'Total Outflow Budget',
					tb.TotalOutflowActual AS 'Total Outflow Actual',
					tb.TotalOutflowVariance AS 'Total Outflow Variance',
					mu.Username,tb.Remarks
					from Transaction_BudgetPreparationCurrent tb
					left join Transaction_BudgetPeriod tp
					on tb.BudgetPeriodId =tp.Id and tp.[Status] = 1
					left join Masterfile_Branch mb
					on tb.BranchId =mb.Id and mb.[Status] = 1
					left join Masterfile_User mu
					on tb.UserId =mu.Id and mu.[Status] = 1
					where
					tb.[Status] = 1
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[BudgetPeriodId]
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

				END
			ELSE
				BEGIN

					WITH TempResult AS(
					SELECT tb.BudgetPeriodId,mb.Name AS 'Branch Name ',
					tb.TotalInflowBudget AS 'Total Inflow Budget',
					tb.TotalInflowActual AS 'Total Inflow Actual',
					tb.TotalInflowVariance AS 'Total Inflow Variance',
					tb.TotalOutflowBudget AS 'Total Outflow Budget',
					tb.TotalOutflowActual AS 'Total Outflow Actual',
					tb.TotalOutflowVariance AS 'Total Outflow Variance',
					mu.Username,tb.Remarks
					from Transaction_BudgetPreparationCurrent tb
					left join Transaction_BudgetPeriod tp
					on tb.BudgetPeriodId =tp.Id and tp.[Status] = 1
					left join Masterfile_Branch mb
					on tb.BranchId =mb.Id and mb.[Status] = 1
					left join Masterfile_User mu
					on tb.UserId =mu.Id and mu.[Status] = 1
					where
					tb.[Status] = 1 AND tb.Id= @Id 
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[BudgetPeriodId]
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationCurrent_getall]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spTransaction_BudgetPreparationCurrent_get
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_BudgetPreparationCurrent_getall]
	-- Add the parameters for the stored procedure here
	@Id		INT	= 0
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Users and its details
			IF  (@Id = 0)
				BEGIN

					SELECT tb.BudgetPeriodId,mb.Name AS 'Branch Name ',
					tb.TotalInflowBudget AS 'Total Inflow Budget',
					tb.TotalInflowActual AS 'Total Inflow Actual',
					tb.TotalInflowVariance AS 'Total Inflow Variance',
					tb.TotalOutflowBudget AS 'Total Outflow Budget',
					tb.TotalOutflowActual AS 'Total Outflow Actual',
					tb.TotalOutflowVariance AS 'Total Outflow Variance',
					mu.Username,tb.Remarks
					from Transaction_BudgetPreparationCurrent tb
					left join Transaction_BudgetPeriod tp
					on tb.BudgetPeriodId =tp.Id and tp.[Status] = 1
					left join Masterfile_Branch mb
					on tb.BranchId =mb.Id and mb.[Status] = 1
					left join Masterfile_User mu
					on tb.UserId =mu.Id and mu.[Status] = 1
					where
					tb.[Status] = 1
					
				END
			ELSE
				BEGIN

					SELECT tb.BudgetPeriodId,mb.Name AS 'Branch Name ',
					tb.TotalInflowBudget AS 'Total Inflow Budget',
					tb.TotalInflowActual AS 'Total Inflow Actual',
					tb.TotalInflowVariance AS 'Total Inflow Variance',
					tb.TotalOutflowBudget AS 'Total Outflow Budget',
					tb.TotalOutflowActual AS 'Total Outflow Actual',
					tb.TotalOutflowVariance AS 'Total Outflow Variance',
					mu.Username,tb.Remarks
					from Transaction_BudgetPreparationCurrent tb
					left join Transaction_BudgetPeriod tp
					on tb.BudgetPeriodId =tp.Id and tp.[Status] = 1
					left join Masterfile_Branch mb
					on tb.BranchId =mb.Id and mb.[Status] = 1
					left join Masterfile_User mu
					on tb.UserId =mu.Id and mu.[Status] = 1
					where
					tb.[Status] = 1 AND tb.Id= @Id 
				
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationCurrent_insert]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spTransaction_BudgetPreparationCurrent_insert 'Poblacion',1,''
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_BudgetPreparationCurrent_insert]
	-- Add the parameters for the stored procedure here
	@BudgetPeriodId	BIGINT,
	@BranchId		INT,
	@UserId				INT,
	@Remarks			VARCHAR(150) 
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT,
					@_Status			TINYINT  = 1;		-- Default as 1 as describe as 'Active'


			SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Transaction_BudgetPreparationCurrent];
					INSERT INTO [dbo].[Transaction_BudgetPreparationCurrent]
						(Id,BudgetPeriodId,BranchId,
						UserId,Remarks,[Status])
					VALUES
						(@_Id,@BudgetPeriodId,@BranchId,
						@UserId,@Remarks, @_Status);
			
					-- Return of the Data type
					SELECT 	@_Id					AS 'Id', 
							@BudgetPeriodId			AS 'BudgetPeriodId',
							@BranchId				AS 'BranchId',
							@UserId					AS 'UserId',
							@Remarks				AS 'Remarks',
							'success'					AS 'return_message';
							Declare @Insert	VARCHAR(max),
							
							@Insert1 VARCHAR (50) = (SELECT Username From Masterfile_User where Id =  @UserId);
						SET @Insert = 'Inserted: '+@Remarks+' Budget Preparation Current by '+@Insert1;
					EXEC spAuditTrail_insert 'Transaction_BudgetPreparationCurrent',@_Id,'Insert',@UserId,@Insert;
							
			
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationCurrent_update]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_BudgetPreparationCurrent_update]
	-- Add the parameters for the stored procedure here
	@Id					BIGINT,
	@BudgetPeriodId	    BIGINT,
	@BranchId			int,
	@UserId				int,	
	@Remarks			VARCHAR(150)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

				UPDATE [dbo].[Transaction_BudgetPreparationCurrent]	 
					SET	
					
						[BudgetPeriodId] =@BudgetPeriodId,
						[BranchId]		=@BranchId,
						[UserId]	=@UserId,
						
						[Remarks]=@Remarks

					WHERE 
						[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT	@BudgetPeriodId  AS 'BudgetPeriodId',
					@BranchId		AS 'BranchId',
					@UserId			AS 'UserId',
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationDetail_delete]    Script Date: 8/25/2018 10:59:25 AM ******/
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

			DECLARE @_Deleted INT = 0,
			@Delete VARCHAR(50)= 'Deleted: BudgetPreparationdetailId [',
			@Id1 VARCHAR(30)= (SELECT DetailId  from Transaction_BudgetPreparationDetail Where DetailId = @Id),
			@Delete2 VARCHAR(50)= '] by ',
			@Delete1 Varchar(50) = (SELECT Username from Masterfile_User Where Id = @UserId);
			SET @Delete = @Delete+@Id1+@Delete2+@Delete1;		
			EXEC spAuditTrail_insert 'Transaction_BudgetPreparationDetail',@Id,'Delete',@UserID,@Delete;
			
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationDetail_get]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spTransaction_BudgetPreparationDetail_get
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_BudgetPreparationDetail_get]
	-- Add the parameters for the stored procedure here
	@Id		INT	= 0,
	@PageNumber		INT = 1,
	@RowsPage 		INT = 10
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Users and its details
			IF  (@Id = 0)
				BEGIN

					WITH TempResult AS(
					SELECT 
					tbd.BudgetPreparationId,tbd.CategoryId,tbd.CategoryDescription AS 'Category Description'
					,tbd.TSEmployeeId,tbd.Detail,tbd.Reference,tbd.Qty AS 'Quantity'
					,tbd.WeekNo AS 'Week No',tbd.ChannelId,mh.[Description]
					AS 'Channel Description', tbd.Week1 AS 'Week 1' ,
					 tbd.Week2 AS 'Week 2',
					 tbd.Week3 AS 'Week 3',
					 tbd.Week4 AS 'Week 4',
					 tbd.Week5 AS 'Week 5',tbd.Total,
					tbd.Remarks
					from Transaction_BudgetPreparationDetail tbd
					left join Transaction_BudgetPreparation tb
					on tbd.BudgetPreparationId =tb.Id and tb.[Status] = 1
					left join Masterfile_Channel mh
					on tbd.ChannelId =mh.Id and mh.[Status] = 1
					where
					tbd.[Status] = 1
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[BudgetPreparationId]
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

				END
			ELSE
				BEGIN

					WITH TempResult AS(
					SELECT 
					tbd.BudgetPreparationId,tbd.CategoryId,tbd.CategoryDescription AS 'Category Description'
					,tbd.TSEmployeeId,tbd.Detail,tbd.Reference,tbd.Qty AS 'Quantity'
					,tbd.WeekNo AS 'Week No',tbd.ChannelId,mh.[Description]
					AS 'Channel Description', tbd.Week1 AS 'Week 1' ,
					 tbd.Week2 AS 'Week 2',
					 tbd.Week3 AS 'Week 3',
					 tbd.Week4 AS 'Week 4',
					 tbd.Week5 AS 'Week 5',
					 tbd.Total,
					tbd.Remarks
					from Transaction_BudgetPreparationDetail tbd
					left join Transaction_BudgetPreparation tb
					on tbd.BudgetPreparationId =tb.Id and tb.[Status] = 1
					left join Masterfile_Channel mh
					on tbd.ChannelId =mh.Id and mh.[Status] = 1
					where
					tbd.[Status] = 1 AND tbd.DetailId= @Id 
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[BudgetPreparationId]
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationDetail_getall]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spTransaction_BudgetPreparationDetail_getall
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_BudgetPreparationDetail_getall]
	-- Add the parameters for the stored procedure here
	@Id		INT	= 0
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Users and its details
			IF  (@Id = 0)
				BEGIN
					SELECT 
					tbd.DetailId as 'Id',tbd.BudgetPreparationId,tbd.CategoryId,tbd.CategoryDescription AS 'Category Description'
					,tbd.TSEmployeeId,tbd.Detail,tbd.Reference,tbd.Qty AS 'Quantity'
					,tbd.WeekNo AS 'Week No',tbd.ChannelId,mh.[Description]
					AS 'Channel Description', tbd.Week1 AS 'Week 1' ,
					 tbd.Week2 AS 'Week 2',
					 tbd.Week3 AS 'Week 3',
					 tbd.Week4 AS 'Week 4',
					 tbd.Week5 AS 'Week 5',tbd.Total,
					tbd.Remarks
					from Transaction_BudgetPreparationDetail tbd
					left join Transaction_BudgetPreparation tb
					on tbd.BudgetPreparationId =tb.Id and tb.[Status] = 1
					left join Masterfile_Channel mh
					on tbd.ChannelId =mh.Id and mh.[Status] = 1
					where
					tbd.[Status] = 1
				
				END
			ELSE
				BEGIN
					SELECT 
					tbd.DetailId as 'Id',tbd.BudgetPreparationId,tbd.CategoryId,tbd.CategoryDescription AS 'Category Description'
					,tbd.TSEmployeeId,tbd.Detail,tbd.Reference,tbd.Qty AS 'Quantity'
					,tbd.WeekNo AS 'Week No',tbd.ChannelId,mh.[Description]
					AS 'Channel Description', tbd.Week1 AS 'Week 1' ,
					 tbd.Week2 AS 'Week 2',
					 tbd.Week3 AS 'Week 3',
					 tbd.Week4 AS 'Week 4',
					 tbd.Week5 AS 'Week 5',
					 tbd.Total,
					tbd.Remarks
					from Transaction_BudgetPreparationDetail tbd
					left join Transaction_BudgetPreparation tb
					on tbd.BudgetPreparationId =tb.Id and tb.[Status] = 1
					left join Masterfile_Channel mh
					on tbd.ChannelId =mh.Id and mh.[Status] = 1
					where
					tbd.[Status] = 1 AND tbd.DetailId= @Id 
					
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationDetail_insert]    Script Date: 8/25/2018 10:59:25 AM ******/
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
	@Total				decimal(10,2),
	@Remarks			VARCHAR(150),
	@UserId				BIGINT 
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT,
					@_Status			TINYINT  = 1;		-- Default as 1 as describe as 'Active'


			SELECT @_Id = Isnull(max(DetailId),0) + 1 FROM [dbo].[Transaction_BudgetPreparationDetail];
					INSERT INTO [dbo].[Transaction_BudgetPreparationDetail]
						(DetailId,BudgetPreparationId,CategoryId,CategoryDescription,
						TSEmployeeId,Detail,Reference,Qty,Amount,WeekNo,ChannelId,Week1,Week2,Week3
						,Week4,Week5,Total,Remarks,[Status])
					VALUES
						(@_Id,@BudgetPreparationId,@CategoryId,@CategoryDescription,@TSEmployeeId
						,@Detail,@Reference,@Qty,@Amount,@WeekNo,@ChannelId,@Week1,@Week2,@Week3,@Week4
						,@Week5,@Total,@Remarks, @_Status);
			
					-- Return of the Data type
					SELECT 	@_Id					AS 'DetailId', 
							@BudgetPreparationId	AS 'BudgetPreparationId',
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
							@Remarks				AS 'Remarks',
							'success'					AS 'return_message';
					Declare @Insert	VARCHAR(max),
							
							@Insert1 VARCHAR (50) = (SELECT Username From Masterfile_User where Id =  @UserId);
						SET @Insert = 'Inserted: '+@Remarks+' Budget Preparation Detail by '+@Insert1;
					EXEC spAuditTrail_insert 'Transaction_BudgetPreparationDetail',@_Id,'Insert',@UserId,@Insert;
							
			
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationDetail_update]    Script Date: 8/25/2018 10:59:25 AM ******/
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
	@Total			DECIMAL(10,2),
	@Remarks			VARCHAR(150)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

				UPDATE [dbo].[Transaction_BudgetPreparationDetail]	 
					SET	
					
						[BudgetPreparationId] =@BudgetPreparationId,
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
						[Total] = @Total,
						[Remarks]=@Remarks

					WHERE 
						[DetailId]		= @Id;
			
			-- Return Data of the Update
			SELECT	
						@BudgetPreparationId AS  'BudgetPreparationId',
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationDetailCurrent_delete]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
--	EXEC spTransaction_BudgetPreparationDetailCurrent_delete 1
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_BudgetPreparationDetailCurrent_delete]
	@Id					INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0;

			UPDATE [dbo].[Transaction_BudgetPreparationDetailCurrent]	 
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationDetailCurrent_get]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spTransaction_BudgetPreparationDetailCurrent_get
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_BudgetPreparationDetailCurrent_get]
	-- Add the parameters for the stored procedure here
	@Id		INT	= 0,
	@PageNumber		INT = 1,
	@RowsPage 		INT = 10
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Users and its details
			IF  (@Id = 0)
				BEGIN

					WITH TempResult AS(
					SELECT 
					tbd.BudgetPreparationId,tbd.CategoryId,tbd.CategoryDescription AS 'Category Description'
					,tbd.TSEmployeeId,tbd.Detail,tbd.Reference,tbd.Qty AS 'Quantity'
					,tbd.WeekNo AS 'Week No',tbd.ChannelId,mh.[Description]
					AS 'Channel Description', tbd.Week1 AS 'Week 1' ,
					 tbd.Week2 AS 'Week 2',
					 tbd.Week3 AS 'Week 3',
					 tbd.Week4 AS 'Week 4',
					 tbd.Week5 AS 'Week 5',tbd.Total,
					tbd.Remarks
					from Transaction_BudgetPreparationDetailCurrent tbd
					left join Transaction_BudgetPreparation tb
					on tbd.BudgetPreparationId =tb.Id and tb.[Status] = 1
					left join Masterfile_Channel mh
					on tbd.ChannelId =mh.Id and mh.[Status] = 1
					where
					tbd.[Status] = 1
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[BudgetPreparationId]
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

				END
			ELSE
				BEGIN

					WITH TempResult AS(
					SELECT 
					tbd.BudgetPreparationId,tbd.CategoryId,tbd.CategoryDescription AS 'Category Description'
					,tbd.TSEmployeeId,tbd.Detail,tbd.Reference,tbd.Qty AS 'Quantity'
					,tbd.WeekNo AS 'Week No',tbd.ChannelId,mh.[Description]
					AS 'Channel Description', tbd.Week1 AS 'Week 1' ,
					 tbd.Week2 AS 'Week 2',
					 tbd.Week3 AS 'Week 3',
					 tbd.Week4 AS 'Week 4',
					 tbd.Week5 AS 'Week 5',
					 tbd.Total,
					tbd.Remarks
					from Transaction_BudgetPreparationDetailCurrent tbd
					left join Transaction_BudgetPreparation tb
					on tbd.BudgetPreparationId =tb.Id and tb.[Status] = 1
					left join Masterfile_Channel mh
					on tbd.ChannelId =mh.Id and mh.[Status] = 1
					where
					tbd.[Status] = 1 AND tbd.DetailId= @Id 
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[BudgetPreparationId]
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationDetailCurrent_getall]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spTransaction_BudgetPreparationDetailCurrent_get
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_BudgetPreparationDetailCurrent_getall]
	-- Add the parameters for the stored procedure here
	@Id		INT	= 0
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Users and its details
			IF  (@Id = 0)
				BEGIN
					SELECT 
					tbd.BudgetPreparationId,tbd.CategoryId,tbd.CategoryDescription AS 'Category Description'
					,tbd.TSEmployeeId,tbd.Detail,tbd.Reference,tbd.Qty AS 'Quantity'
					,tbd.WeekNo AS 'Week No',tbd.ChannelId,mh.[Description]
					AS 'Channel Description', tbd.Week1 AS 'Week 1' ,
					 tbd.Week2 AS 'Week 2',
					 tbd.Week3 AS 'Week 3',
					 tbd.Week4 AS 'Week 4',
					 tbd.Week5 AS 'Week 5',tbd.Total,
					tbd.Remarks
					from Transaction_BudgetPreparationDetailCurrent tbd
					left join Transaction_BudgetPreparation tb
					on tbd.BudgetPreparationId =tb.Id and tb.[Status] = 1
					left join Masterfile_Channel mh
					on tbd.ChannelId =mh.Id and mh.[Status] = 1
					where
					tbd.[Status] = 1
				
				END
			ELSE
				BEGIN

					SELECT 
					tbd.BudgetPreparationId,tbd.CategoryId,tbd.CategoryDescription AS 'Category Description'
					,tbd.TSEmployeeId,tbd.Detail,tbd.Reference,tbd.Qty AS 'Quantity'
					,tbd.WeekNo AS 'Week No',tbd.ChannelId,mh.[Description]
					AS 'Channel Description', tbd.Week1 AS 'Week 1' ,
					 tbd.Week2 AS 'Week 2',
					 tbd.Week3 AS 'Week 3',
					 tbd.Week4 AS 'Week 4',
					 tbd.Week5 AS 'Week 5',
					 tbd.Total,
					tbd.Remarks
					from Transaction_BudgetPreparationDetailCurrent tbd
					left join Transaction_BudgetPreparation tb
					on tbd.BudgetPreparationId =tb.Id and tb.[Status] = 1
					left join Masterfile_Channel mh
					on tbd.ChannelId =mh.Id and mh.[Status] = 1
					where
					tbd.[Status] = 1 AND tbd.DetailId= @Id 
				
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationDetailCurrent_insert]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
--
-- Description:	<Description,,>
-- EXEC spTransaction_BudgetPreparationDetailCurrent_insert 1,1,'sad',1,'sad','sad',1,1.1,1,1,1.1,1.1,1.1,1.1,1.1,1.1,'sad'
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_BudgetPreparationDetailCurrent_insert]
	-- Add the parameters for the stored procedure here
	@BudgetPreparationId	Bigint,
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
	@Total				decimal(10,2),
	@Remarks			VARCHAR(150),
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT,
					@_Status			TINYINT  = 1;		-- Default as 1 as describe as 'Active'


			SELECT @_Id = Isnull(max(DetailId),0) + 1 FROM [dbo].[Transaction_BudgetPreparationDetailCurrent];
					INSERT INTO [dbo].[Transaction_BudgetPreparationDetailCurrent]
						(DetailId,BudgetPreparationId,CategoryId,CategoryDescription,
						TSEmployeeId,Detail,Reference,Qty,Amount,WeekNo,ChannelId,Week1,Week2,Week3
						,Week4,Week5,Total,Remarks,[Status])
					VALUES
						(@_Id,@BudgetPreparationId,@CategoryId,@CategoryDescription,@TSEmployeeId
						,@Detail,@Reference,@Qty,@Amount,@WeekNo,@ChannelId,@Week1,@Week2,@Week3,@Week4
						,@Week5,@Total,@Remarks, @_Status);
			
					-- Return of the Data type
					SELECT 	@_Id					AS 'DetailId', 
							@BudgetPreparationId	AS 'BudgetPreparationId',
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
							@Remarks				AS 'Remarks',
							'success'					AS 'return_message';
				Declare @Insert	VARCHAR(max),
							
							@Insert1 VARCHAR (50) = (SELECT Username From Masterfile_User where Id =  @UserId);
						SET @Insert = 'Inserted: '+@Remarks+' Budget Preparation Detail Current by '+@Insert1;
					EXEC spAuditTrail_insert 'Transaction_BudgetPreparationDetailCurrent',@_Id,'Insert',@UserId,@Insert;
										
			
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationDetailCurrent_update]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_BudgetPreparationDetailCurrent_update]
	-- Add the parameters for the stored procedure here
	@Id					BIGINT,
	@BudgetPreparationId	    BIGINT,
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
	@Total			DECIMAL(10,2),
	@Remarks			VARCHAR(150)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

				UPDATE [dbo].[Transaction_BudgetPreparationDetailCurrent]	 
					SET	
					
						[BudgetPreparationId] =@BudgetPreparationId,
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
						[Total] = @Total,
						[Remarks]=@Remarks

					WHERE 
						[DetailId]		= @Id;
			
			-- Return Data of the Update
			SELECT	
						@BudgetPreparationId AS  'BudgetPreparationId',
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationLoans_get]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spTransaction_BudgetPreparationLoans_get 3
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_BudgetPreparationLoans_get]
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
					tbd.Week5 AS 'Week 5',tbd.Total,
					tbd.Remarks
					from Transaction_BudgetPreparationDetail tbd
					left join Transaction_BudgetPreparation tb
					on tbd.BudgetPreparationId =tb.Id and tb.[Status] = 1
					left join Masterfile_Channel mh
					on tbd.ChannelId =mh.Id and mh.[Status] = 1
					where
					tbd.BudgetPreparationId =@Id AND
					tbd.CategoryDescription IN ('reloans','new_loans')  
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
/****** Object:  StoredProcedure [dbo].[spTransaction_DailyCashFlow_get]    Script Date: 8/25/2018 10:59:25 AM ******/
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
CREATE PROCEDURE [dbo].[spTransaction_DailyCashFlow_get]
	-- Add the parameters for the stored procedure here
	@Id		INT	= 0,
	@PageNumber		INT = 1,
	@RowsPage 		INT = 10
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Users and its details
			IF  (@Id = 0)
				BEGIN

					WITH TempResult AS(
					SELECT 
					[Date],[CategoryId] AS 'Category Description',DetailsId,Details,Amount
					FROM Transaction_DailyCashFlow
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[Date]
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

				END
			ELSE
				BEGIN

					WITH TempResult AS(
					SELECT 
					[Date],[CategoryId] AS 'Category Description',DetailsId,Details,Amount
					FROM Transaction_DailyCashFlow

					where
					Id= @Id 
					), TempCount AS (
						SELECT COUNT(*) AS MaxRows FROM TempResult
					)

					SELECT *
					FROM TempResult, TempCount
					ORDER BY TempResult.[Date]
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

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
/****** Object:  StoredProcedure [dbo].[spTransaction_DailyCashFlow_getall]    Script Date: 8/25/2018 10:59:25 AM ******/
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
CREATE PROCEDURE [dbo].[spTransaction_DailyCashFlow_getall]
	-- Add the parameters for the stored procedure here
	@Id		INT	= 0
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Users and its details
			IF  (@Id = 0)
				BEGIN

					SELECT 
					[Date],[CategoryId] AS 'Category Description',DetailsId,Details,Amount
					FROM Transaction_DailyCashFlow
					

				END
			ELSE
				BEGIN

					SELECT 
					[Date],[CategoryId] AS 'Category Description',DetailsId,Details,Amount
					FROM Transaction_DailyCashFlow

					where
					Id= @Id 
					
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
/****** Object:  StoredProcedure [dbo].[spTransaction_DailyCashFlow_insert]    Script Date: 8/25/2018 10:59:25 AM ******/
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
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT
					


			SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Transaction_DailyCashFlow];
					INSERT INTO [dbo].[Transaction_DailyCashFlow]
						(Id,[Date],CategoryId,DetailsId,Details,Amount)
					VALUES
						(@_Id, @Date,@CategoryId
						,@DetailsId,@Details, @Amount);
			
					-- Return of the Data type
					SELECT 	@_Id					AS 'Id', 
							@Date					AS 'Date',
			
							@CategoryId				AS 'CategoryId',
					
							@DetailsId				AS 'DetailsId',
							@Details				AS 'Details',
							@Amount					AS 'Amount',
							
							'success'					AS 'return_message';
							
					Declare @Insert	VARCHAR(max),
							
							@Insert1 VARCHAR (50) = (SELECT Username From Masterfile_User where Id =  @UserId);
						SET @Insert = 'Inserted: '+@Details+' Daily Cashflow by '+@Insert1;
					EXEC spAuditTrail_insert 'Transaction_DailyCashFlow',@_Id,'Insert',@UserId,@Insert;
									
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
/****** Object:  StoredProcedure [dbo].[spTransaction_DailyCashFlow_Open]    Script Date: 8/25/2018 10:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Description>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_DailyCashFlow_Open]
	-- Add the parameters for the stored procedure here
	@FromDate DATE,
	@ToDate DATE,
	@BranchId INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			
				SELECT
					tdf.Id,
					CategoryId,
					CategoryDescription,
					[Type],
					[Date],
					Amount
				FROM
					Transaction_DailyCashFlow tdf
					INNER JOIN Masterfile_Category mc
					on mc.Id =tdf.CategoryId
				WHERE 					
					 tdf.[Date] >=  @FromDate 
						AND  tdf.[Date] <=  @ToDate 
		
	
									
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
/****** Object:  StoredProcedure [dbo].[spTransaction_DailyCashFlow_update]    Script Date: 8/25/2018 10:59:25 AM ******/
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
	@Amount			DECIMAL(10,2)
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
					[Amount] = @Amount
					WHERE 
						[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT	
					@Date AS 'Date',
					@CategoryId	AS 'CategoryId',
					@DetailsId	 AS 'DetailsId',
					@Details		AS 'Details',
					@Amount		AS 'Amount',
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
