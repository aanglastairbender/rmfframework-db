USE [master]
GO
/****** Object:  Database [RMF_CMT]    Script Date: 8/10/2018 9:17:30 PM ******/
CREATE DATABASE [RMF_CMT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RMF_CMT', FILENAME = N'G:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\RMF_CMT.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RMF_CMT_log', FILENAME = N'G:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\RMF_CMT_log.ldf' , SIZE = 10176KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[Audit_Trail]    Script Date: 8/10/2018 9:17:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Audit_Trail](
	[Id] [bigint] NOT NULL,
	[TableName] [varchar](35) NULL,
	[TableId] [bigint] NULL,
	[Action] [varchar](25) NULL,
	[ActiveDirectoryName] [varchar](100) NULL,
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
/****** Object:  Table [dbo].[Masterfile_AccessRights]    Script Date: 8/10/2018 9:17:33 PM ******/
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
/****** Object:  Table [dbo].[Masterfile_Area]    Script Date: 8/10/2018 9:17:33 PM ******/
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
/****** Object:  Table [dbo].[Masterfile_Branch]    Script Date: 8/10/2018 9:17:33 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Masterfile_Branch] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masterfile_Category]    Script Date: 8/10/2018 9:17:33 PM ******/
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
/****** Object:  Table [dbo].[Masterfile_Channel]    Script Date: 8/10/2018 9:17:34 PM ******/
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
/****** Object:  Table [dbo].[Masterfile_ChartOfAccount]    Script Date: 8/10/2018 9:17:34 PM ******/
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
/****** Object:  Table [dbo].[Masterfile_District]    Script Date: 8/10/2018 9:17:34 PM ******/
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
/****** Object:  Table [dbo].[Masterfile_Employee]    Script Date: 8/10/2018 9:17:34 PM ******/
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
/****** Object:  Table [dbo].[Masterfile_Function]    Script Date: 8/10/2018 9:17:34 PM ******/
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
/****** Object:  Table [dbo].[Masterfile_OtherDisbursementDetail]    Script Date: 8/10/2018 9:17:35 PM ******/
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
/****** Object:  Table [dbo].[Masterfile_OtherReceiptDetail]    Script Date: 8/10/2018 9:17:35 PM ******/
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
/****** Object:  Table [dbo].[Masterfile_PageAction]    Script Date: 8/10/2018 9:17:35 PM ******/
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
/****** Object:  Table [dbo].[Masterfile_Position]    Script Date: 8/10/2018 9:17:35 PM ******/
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
/****** Object:  Table [dbo].[Masterfile_Region]    Script Date: 8/10/2018 9:17:35 PM ******/
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
/****** Object:  Table [dbo].[Masterfile_Role]    Script Date: 8/10/2018 9:17:35 PM ******/
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
/****** Object:  Table [dbo].[Masterfile_SystemRights]    Script Date: 8/10/2018 9:17:36 PM ******/
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
/****** Object:  Table [dbo].[Masterfile_User]    Script Date: 8/10/2018 9:17:36 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Masterfile_User_Username] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction_BudgetPeriod]    Script Date: 8/10/2018 9:17:36 PM ******/
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
/****** Object:  Table [dbo].[Transaction_BudgetPreparation]    Script Date: 8/10/2018 9:17:36 PM ******/
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
/****** Object:  Table [dbo].[Transaction_BudgetPreparationCurrent]    Script Date: 8/10/2018 9:17:36 PM ******/
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
/****** Object:  Table [dbo].[Transaction_BudgetPreparationDetail]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  Table [dbo].[Transaction_BudgetPreparationDetailCurrent]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  Table [dbo].[Transaction_DailyCashFlow]    Script Date: 8/10/2018 9:17:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_DailyCashFlow](
	[Id] [bigint] NOT NULL,
	[Date] [date] NOT NULL,
	[Type] [varchar](10) NOT NULL,
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
/****** Object:  Index [IQ_Masterfile_AccessRights_RoleID]    Script Date: 8/10/2018 9:17:37 PM ******/
CREATE NONCLUSTERED INDEX [IQ_Masterfile_AccessRights_RoleID] ON [dbo].[Masterfile_AccessRights]
(
	[RoleId] ASC,
	[PageActionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IQ_Masterfile_Area]    Script Date: 8/10/2018 9:17:37 PM ******/
CREATE NONCLUSTERED INDEX [IQ_Masterfile_Area] ON [dbo].[Masterfile_Area]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IQ_Masterfile_ChartOfAccount_Code]    Script Date: 8/10/2018 9:17:37 PM ******/
CREATE NONCLUSTERED INDEX [IQ_Masterfile_ChartOfAccount_Code] ON [dbo].[Masterfile_ChartOfAccount]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IQ_Masterfile_District]    Script Date: 8/10/2018 9:17:37 PM ******/
CREATE NONCLUSTERED INDEX [IQ_Masterfile_District] ON [dbo].[Masterfile_District]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IQ_Masterfile_Employee_ContractNumber]    Script Date: 8/10/2018 9:17:37 PM ******/
CREATE NONCLUSTERED INDEX [IQ_Masterfile_Employee_ContractNumber] ON [dbo].[Masterfile_Employee]
(
	[ContactNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IQ_Masterfile_Employee_EmailAddress]    Script Date: 8/10/2018 9:17:37 PM ******/
CREATE NONCLUSTERED INDEX [IQ_Masterfile_Employee_EmailAddress] ON [dbo].[Masterfile_Employee]
(
	[EmailAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IQ_Masterfile_OtherReceiptDetail_Description]    Script Date: 8/10/2018 9:17:37 PM ******/
CREATE NONCLUSTERED INDEX [IQ_Masterfile_OtherReceiptDetail_Description] ON [dbo].[Masterfile_OtherReceiptDetail]
(
	[Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IQ_Masterfile_Position_Code]    Script Date: 8/10/2018 9:17:37 PM ******/
CREATE NONCLUSTERED INDEX [IQ_Masterfile_Position_Code] ON [dbo].[Masterfile_Position]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IQ_Masterfile_Name]    Script Date: 8/10/2018 9:17:37 PM ******/
CREATE NONCLUSTERED INDEX [IQ_Masterfile_Name] ON [dbo].[Masterfile_Region]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IQ_Transaction_BudgetPeriod_Year]    Script Date: 8/10/2018 9:17:37 PM ******/
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
ALTER TABLE [dbo].[Transaction_BudgetPreparationDetail]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_BudgetPreparationDetail_Masterfile_Category_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Masterfile_Category] ([Id])
GO
ALTER TABLE [dbo].[Transaction_BudgetPreparationDetail] CHECK CONSTRAINT [FK_Transaction_BudgetPreparationDetail_Masterfile_Category_CategoryId]
GO
ALTER TABLE [dbo].[Transaction_BudgetPreparationDetail]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_BudgetPreparationDetail_Masterfile_Channel_ChannelId] FOREIGN KEY([ChannelId])
REFERENCES [dbo].[Masterfile_Channel] ([Id])
GO
ALTER TABLE [dbo].[Transaction_BudgetPreparationDetail] CHECK CONSTRAINT [FK_Transaction_BudgetPreparationDetail_Masterfile_Channel_ChannelId]
GO
ALTER TABLE [dbo].[Transaction_BudgetPreparationDetail]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_BudgetPreparationDetail_Transaction_BudgetPeriod_BudgetPrepartionId] FOREIGN KEY([BudgetPreparationId])
REFERENCES [dbo].[Transaction_BudgetPeriod] ([Id])
GO
ALTER TABLE [dbo].[Transaction_BudgetPreparationDetail] CHECK CONSTRAINT [FK_Transaction_BudgetPreparationDetail_Transaction_BudgetPeriod_BudgetPrepartionId]
GO
ALTER TABLE [dbo].[Transaction_DailyCashFlow]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_DailyCashFlow_Masterfile_Category_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Masterfile_Category] ([Id])
GO
ALTER TABLE [dbo].[Transaction_DailyCashFlow] CHECK CONSTRAINT [FK_Transaction_DailyCashFlow_Masterfile_Category_CategoryId]
GO
ALTER TABLE [dbo].[Transaction_DailyCashFlow]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_DailyCashFlow_Transaction_BudgetPreparationDetail_DetailId] FOREIGN KEY([DetailsId])
REFERENCES [dbo].[Transaction_BudgetPreparationDetail] ([DetailId])
GO
ALTER TABLE [dbo].[Transaction_DailyCashFlow] CHECK CONSTRAINT [FK_Transaction_DailyCashFlow_Transaction_BudgetPreparationDetail_DetailId]
GO
/****** Object:  StoredProcedure [dbo].[Gmail_login]    Script Date: 8/10/2018 9:17:37 PM ******/
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
CREATE PROCEDURE [dbo].[Gmail_login]
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
/****** Object:  StoredProcedure [dbo].[spAuditTrail_get]    Script Date: 8/10/2018 9:17:37 PM ******/
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
	@ActiveDirectoryName	VARCHAR(100),
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
     (ActiveDirectoryName      = @ActiveDirectoryName    OR @ActiveDirectoryName = '') AND
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
/****** Object:  StoredProcedure [dbo].[spAuditTrail_insert]    Script Date: 8/10/2018 9:17:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spAudit_Trail_insert 'Masterfile_Area',1,'Update','RMF-Intern1',1,'Kamote'
-- =============================================
CREATE PROCEDURE [dbo].[spAuditTrail_insert]
	-- Add the parameters for the stored procedure here
	@TableName			VARCHAR(35),
	@TableId			BIGINT,
	@Action				VARCHAR(25),
	@ActiveDirectoryName	VARCHAR(100),
	@Contributer			SMALLINT,
	@Description			VARCHAR(MAX)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT;


			SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Audit_Trail];
					INSERT INTO [dbo].[Audit_Trail]
						(Id,TableName,TableId,[Action],ActiveDirectoryName,Contributer,DateExecuted,TimeExecuted,
						[Description])
					VALUES
						(@_Id,@TableName,@TableId,@Action,@ActiveDirectoryName,
						@Contributer,CONVERT(VARCHAR(10),getDate(),110),(Select RIGHT(CONVERT(VARCHAR, GETDATE(), 100),7)),
						@Description);
			
					-- Return of the Data type
					SELECT 	@_Id					AS 'Id', 
							@TableName				AS 'Table Name',
							@TableId				AS 'TableId',
							@Action					AS 'Action',
							@ActiveDirectoryName	AS 'Active Directory Name',
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
/****** Object:  StoredProcedure [dbo].[spMaster_User_GMailLogin]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_AccessRights]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_AccessRights_get]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_AccessRights_getall]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_AccessRights_insert]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_AccessRights_update]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Area_delete]    Script Date: 8/10/2018 9:17:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
--	EXEC spMasterfile_Area_delete 1
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Area_delete]
	@Id					INT
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Area_get]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Area_getall]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Area_insert]    Script Date: 8/10/2018 9:17:37 PM ******/
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
	@Remarks			VARCHAR(150) 
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Area_update]    Script Date: 8/10/2018 9:17:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Area_update]
	-- Add the parameters for the stored procedure here
	@Id					INT,
	@Name				VARCHAR(100),
	@DistrictId			INT,
	@Remarks			VARCHAR(150)
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
						[DistrictId]	= @DistrictId,
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Branch_BIJLISync]    Script Date: 8/10/2018 9:17:37 PM ******/
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
	@Longitude			DECIMAL(9,6)
	
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Branch_delete]    Script Date: 8/10/2018 9:17:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Branch_delete]
	@Id					INT
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Branch_get]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Branch_getall]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Branch_insert]    Script Date: 8/10/2018 9:17:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Branch_insert 'Cebu City 1', 1,12.2121,12.123,'Poblacion,Argao,Cebu','Sample'
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Branch_insert]
	-- Add the parameters for the stored procedure here
	@BranchCode		VARCHAR(4),
	@Name				VARCHAR(100),
	@AreaId			INT,
	@Latitude		DECIMAL(8,6),
	@Longitude		DECIMAL(9,6),
	@Address		Varchar(150),
	@Remarks			VARCHAR(150) 
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
						(Id,BranchCode,Name,AreaId,Latitude,Longitude,[Address],Remarks,[Status])
					VALUES
						(@_Id,@BranchCode, @Name,@AreaId,@Latitude,@Longitude,@Address,@Remarks, @_Status);
			
					-- Return of the Data type
					SELECT 	@_Id					AS 'Id', 
							@BranchCode				AS 'Branch Code',
							@Name					AS 'Name',
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Branch_update]    Script Date: 8/10/2018 9:17:37 PM ******/
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
CREATE PROCEDURE [dbo].[spMasterfile_Branch_update]
	-- Add the parameters for the stored procedure here
	@Id					INT,
	@BranchCode			VARCHAR(4),
	@Name				VARCHAR(100),
	@AreaId				INT,
	@Address			VARCHAR(150),
	@Latitude			DECIMAL(8,6),
	@Longitude			DECIMAL(9,6),
	@Remarks			VARCHAR(150)
	
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
						[BranchCode]	= @BranchCode,
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
					@BranchCode AS 'Branch Code',
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Category_delete]    Script Date: 8/10/2018 9:17:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Category_delete]
	@Id					INT
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Category_get]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Category_getall]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Category_insert]    Script Date: 8/10/2018 9:17:37 PM ******/
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
	@Remarks			VARCHAR(150) 
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
							@Description					AS 'Description',
							@Type					AS 'Type',
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Category_update]    Script Date: 8/10/2018 9:17:37 PM ******/
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
	@Remarks			VARCHAR(150)
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Channel_delete]    Script Date: 8/10/2018 9:17:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Channel_delete]
	@Id					INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0;

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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Channel_get]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Channel_getall]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Channel_insert]    Script Date: 8/10/2018 9:17:37 PM ******/
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
	@Remarks			VARCHAR(150) 
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Channel_update]    Script Date: 8/10/2018 9:17:37 PM ******/
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
	@Remarks			VARCHAR(150)
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
						[Remarks]		= @Remarks
					WHERE 
						[Id]			= @Id;
			
			-- Return Data of the Update
			SELECT	@Id AS 'Id',
					@Description	AS 'Description',
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_ChartOfAccount_delete]    Script Date: 8/10/2018 9:17:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_ChartOfAccount_delete]
	@Id					INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0;
			
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_ChartOfAccount_get]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_ChartOfAccount_getall]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_ChartOfAccount_insert]    Script Date: 8/10/2018 9:17:37 PM ******/
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
	@Remarks			VARCHAR(150) 
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_ChartOfAccount_update]    Script Date: 8/10/2018 9:17:37 PM ******/
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
	@Remarks			VARCHAR(150)
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_District_delete]    Script Date: 8/10/2018 9:17:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_District_delete]
	@Id					INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0;

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
/****** Object:  StoredProcedure [dbo].[spMasterfile_District_get]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_District_getall]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_District_insert]    Script Date: 8/10/2018 9:17:37 PM ******/
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
	@Remarks			VARCHAR(150) 
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_District_update]    Script Date: 8/10/2018 9:17:37 PM ******/
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
	@Remarks			VARCHAR(150)
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Employee_delete]    Script Date: 8/10/2018 9:17:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Employee_delete]
	@Id					INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0;

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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Employee_get]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Employee_getall]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Employee_insert]    Script Date: 8/10/2018 9:17:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Employee_insert "1","aDASD","aDASD","aDASD",1,"aDASD@gmail.com","123123","0922828",1,"Remarks"
--=============================
CREATE PROCEDURE [dbo].[spMasterfile_Employee_insert]
	-- Add the parameters for the stored procedure here
	@EmployeeIdNo		VARCHAR(10),
	@Firstname			VARCHAR(50),
	@Middlename			VARCHAR(50),
	@Lastname			VARCHAR(50),
	@PositionId			INT,
	@EmailAddress		VARCHAR(150),
	@GmailId			VARCHAR(100),
	@ContactNumber		VARCHAR(15),
	@BranchId			INT,
	@Remarks			VARCHAR(150)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT,
					@_Status			TINYINT  = 1;		-- Default as 1 as describe as 'Active'


			SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Masterfile_Employee];

			
					INSERT INTO [dbo].[Masterfile_Employee]
						(Id,[EmployeeIdNo],[Firstname],[Middlename],[Lastname]
						,PositionId,EmailAddress,GmailId,ContactNumber,BranchId
						,Remarks,[Status])
					VALUES
						(@_Id, @EmployeeIdNo,@Firstname,@Middlename,@Lastname
						,@PositionId,@EmailAddress,@GmailId,@ContactNumber,@BranchId,@Remarks, @_Status
					);
			
					-- Return of the Data type
					SELECT 	@_Id					AS 'Id', 
							@EmployeeIdNo			AS 'EmployeeIdNo',
							@Firstname				AS 'Firstname',
							@Middlename				AS 'Middlename',
							@Lastname				AS 'Lastname',
							@PositionId				AS 'PositionId',
							@EmailAddress			AS 'Email Address',
							@GmailId				AS 'GmailId',
							@ContactNumber			AS 'Contact Number',
							@BranchId				AS 'BranchId',
							
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Employee_update]    Script Date: 8/10/2018 9:17:37 PM ******/
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
	@GmailId			VARCHAR(50),
	@ContactNumber		VARCHAR(15),
	@BranchId			INT,
	@Remarks			VARCHAR(150)
	
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
						[PositionId]	= @PositionId,
						[EmailAddress] = @EmailAddress,
						[GmailId]		= @GmailId,
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
					@GmailId	AS 'GmailId',
					@ContactNumber	AS 'Contact Number',
					@BranchId	AS 'Branchid',
				
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Function_delete]    Script Date: 8/10/2018 9:17:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Function_delete]
	@Id					INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0;

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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Function_get]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Function_getall]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Function_insert]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Function_update]    Script Date: 8/10/2018 9:17:37 PM ******/
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
					SELECT	'duplicate_functionnamme'	AS 'return_message';						
				END

			ELSE
				BEGIN
				UPDATE [dbo].[Masterfile_Function]	 
					SET	[Name]		= @Name,
						[Remarks]	= @Remarks
					WHERE 
						[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT	@Id	AS 'FunctionId',
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherDisbursementDetail_delete]    Script Date: 8/10/2018 9:17:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_OtherDisbursementDetail_delete]
	@Id					INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0;

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
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherDisbursementDetail_get]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherDisbursementDetail_getall]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherDisbursementDetail_insert]    Script Date: 8/10/2018 9:17:37 PM ******/
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
	@Remarks			VARCHAR(150) 
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherDisbursementDetail_update]    Script Date: 8/10/2018 9:17:37 PM ******/
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
	@Remarks			VARCHAR(150)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		IF EXISTS(SELECT Id FROM [dbo].[Masterfile_OtherReceiptDetail] WHERE [Description] =  @Description AND [Status] = 1)
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherReceiptDetail_delete]    Script Date: 8/10/2018 9:17:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_OtherReceiptDetail_delete]
	@Id					INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0;

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
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherReceiptDetail_get]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherReceiptDetail_getall]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherReceiptDetail_insert]    Script Date: 8/10/2018 9:17:37 PM ******/
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
	@Remarks			VARCHAR(150) 
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherReceiptDetail_update]    Script Date: 8/10/2018 9:17:37 PM ******/
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
	@Remarks			VARCHAR(150)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		IF EXISTS(SELECT Id FROM [dbo].[Masterfile_OtherReceiptDetail] WHERE [Description] =  @Description AND [Status] = 1)
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_PageAction_delete]    Script Date: 8/10/2018 9:17:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
--	EXEC spMasterfile_PageAction_delete 1
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_PageAction_delete]
	@Id					INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0;

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
/****** Object:  StoredProcedure [dbo].[spMasterfile_PageAction_get]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_PageAction_getall]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_PageAction_insert]    Script Date: 8/10/2018 9:17:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_PageAction_insert 'Poblacion',1,''
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_PageAction_update]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Position_BIJLISync]    Script Date: 8/10/2018 9:17:37 PM ******/
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
	@Description				VARCHAR(100)
	
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Position_delete]    Script Date: 8/10/2018 9:17:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Position_delete]
	@Id					INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0;

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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Position_get]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Position_getall]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Position_insert]    Script Date: 8/10/2018 9:17:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Description>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Position_insert '19233','Exec','EXEC'
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Position_insert]
	-- Add the parameters for the stored procedure here\
	@Code					VARCHAR(10),
	@Description				VARCHAR(100),
	@Remarks			VARCHAR(150) 
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Position_update]    Script Date: 8/10/2018 9:17:37 PM ******/
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
	@Remarks			VARCHAR(150)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Region_delete]    Script Date: 8/10/2018 9:17:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Region_delete]
	@Id					INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0;

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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Region_get]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Region_getall]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Region_insert]    Script Date: 8/10/2018 9:17:37 PM ******/
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
	@Remarks			VARCHAR(150) 
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Region_update]    Script Date: 8/10/2018 9:17:37 PM ******/
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
	@Remarks			VARCHAR(150)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Role_delete]    Script Date: 8/10/2018 9:17:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Role_delete]
	@Id					INT
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Role_get]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Role_getall]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Role_insert]    Script Date: 8/10/2018 9:17:37 PM ******/
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
	@Remarks			VARCHAR(150) 
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Role_update]    Script Date: 8/10/2018 9:17:37 PM ******/
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
	@Remarks			VARCHAR(150)
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
			
			-- Return Data of the Update
			SELECT	@Id	AS 'Id',
					@Description	AS 'Description',
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_SystemRights_get]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_SystemRights_getall]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_SystemRights_insert]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_SystemRights_update]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_User_delete]    Script Date: 8/10/2018 9:17:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_User_delete]
	@Id					INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0;

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
/****** Object:  StoredProcedure [dbo].[spMasterfile_User_get]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_User_getall]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_User_insert]    Script Date: 8/10/2018 9:17:37 PM ******/
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
	@ActiveDirectoryName	varchar(80),
	@Remarks			VARCHAR(150) 
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_User_Login]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_User_update]    Script Date: 8/10/2018 9:17:37 PM ******/
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
	@Remarks			VARCHAR(150)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPeriod_close]    Script Date: 8/10/2018 9:17:37 PM ******/
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
	@Remarks				VARCHAR(150)
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPeriod_CurrentOpen]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPeriod_get]    Script Date: 8/10/2018 9:17:37 PM ******/
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
					ORDER BY TempResult.[Year],TempResult.[Month] desc
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
					ORDER BY TempResult.[Year],TempResult.[Month] desc
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPeriod_getall]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPeriod_open]    Script Date: 8/10/2018 9:17:37 PM ******/
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
	@Remarks				VARCHAR(150)
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparation_delete]    Script Date: 8/10/2018 9:17:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
--	EXEC spTransaction_BudgetPreparation_delete 1
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_BudgetPreparation_delete]
	@Id					INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0;

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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparation_get]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparation_getall]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparation_insert]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparation_update]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationCurrent_delete]    Script Date: 8/10/2018 9:17:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
--	EXEC spTransaction_BudgetPreparationCurrent_delete 1
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_BudgetPreparationCurrent_delete]
	@Id					INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0;

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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationCurrent_get]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationCurrent_getall]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationCurrent_insert]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationCurrent_update]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationDetail_delete]    Script Date: 8/10/2018 9:17:37 PM ******/
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
	@Id					INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0;

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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationDetail_get]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationDetail_getall]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationDetail_insert]    Script Date: 8/10/2018 9:17:37 PM ******/
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
	@Remarks			VARCHAR(150) 
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationDetail_update]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationDetailCurrent_delete]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationDetailCurrent_get]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationDetailCurrent_getall]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationDetailCurrent_insert]    Script Date: 8/10/2018 9:17:37 PM ******/
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
	@Remarks			VARCHAR(150) 
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationDetailCurrent_update]    Script Date: 8/10/2018 9:17:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spTransaction_DailyCashFlow_get]    Script Date: 8/10/2018 9:17:37 PM ******/
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
					[Date],[Type],[CategoryId],[CategoryDescription] AS 'Category Description',DetailsId,Details,Amount
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
					[Date],[Type],[CategoryId],[CategoryDescription] AS 'Category Description',DetailsId,Details,Amount
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
/****** Object:  StoredProcedure [dbo].[spTransaction_DailyCashFlow_getall]    Script Date: 8/10/2018 9:17:37 PM ******/
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
					[Date],[Type],[CategoryId],[CategoryDescription] AS 'Category Description',DetailsId,Details,Amount
					FROM Transaction_DailyCashFlow
					

				END
			ELSE
				BEGIN

					SELECT 
					[Date],[Type],[CategoryId],[CategoryDescription] AS 'Category Description',DetailsId,Details,Amount
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
/****** Object:  StoredProcedure [dbo].[spTransaction_DailyCashFlow_insert]    Script Date: 8/10/2018 9:17:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Description>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_DailyCashFlow_insert]
	-- Add the parameters for the stored procedure here
	@Date				Date,
	@Type				varchar(10),
	@CategoryId			int,
	@CategoryDescription Varchar(150),
	@DetailsId			BIGINT,
	@Details			varchar(150),
	@Amount				decimal(10,2)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT
					


			SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Transaction_DailyCashFlow];
					INSERT INTO [dbo].[Transaction_DailyCashFlow]
						(Id,[Date],[Type],CategoryId,CategoryDescription,DetailsId,Details,Amount)
					VALUES
						(@_Id, @Date,@Type,@CategoryId,@CategoryDescription
						,@DetailsId,@Details, @Amount);
			
					-- Return of the Data type
					SELECT 	@_Id					AS 'Id', 
							@Date					AS 'Date',
							@Type					AS 'Type',
							@CategoryId				AS 'CategoryId',
							@CategoryDescription	AS 'Category Description',
							@DetailsId				AS 'DetailsId',
							@Details				AS 'Details',
							@Amount					AS 'Amount',
							
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
/****** Object:  StoredProcedure [dbo].[spTransaction_DailyCashFlow_update]    Script Date: 8/10/2018 9:17:37 PM ******/
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
	@Type				VARCHAR(10),
	@CategoryId			INT,
	@CategoryDescription	VARCHAR(150),
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
					[Type] =@Type,
					[CategoryId] =@CategoryId,
					[CategoryDescription] =@CategoryDescription,
					[DetailsId] =@DetailsId,
					[Details] =@Details,
					[Amount] = @Amount
					WHERE 
						[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT	
					@Date AS 'Date',
					@Type	 AS 'Type',
					@CategoryId	AS 'CategoryId',
					@CategoryDescription	 AS 'Category Description',
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
