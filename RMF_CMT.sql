USE [master]
GO
/****** Object:  Database [RMF_CMT]    Script Date: 10/10/2018 9:03:10 PM ******/
CREATE DATABASE [RMF_CMT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RMF_CMT', FILENAME = N'G:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\RMF_CMT.mdf' , SIZE = 9216KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RMF_CMT_log', FILENAME = N'G:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\RMF_CMT_log.ldf' , SIZE = 291904KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[Audit_Trail]    Script Date: 10/10/2018 9:03:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Audit_Trail](
	[Id] [bigint] NOT NULL,
	[DateTime] [datetime] NULL,
	[TableName] [varchar](50) NULL,
	[Action] [varchar](25) NULL,
	[Description] [varchar](max) NULL,
	[OldValue] [varchar](max) NULL,
	[NewValue] [varchar](max) NULL,
	[ComputerName] [nvarchar](150) NULL,
	[UserId] [bigint] NULL,
 CONSTRAINT [PK_Audit_Trail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[convert]    Script Date: 10/10/2018 9:03:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[convert](
	[Id] [int] NOT NULL,
	[Choice] [varchar](50) NULL,
 CONSTRAINT [PK_convert] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masterfile_AccessRights]    Script Date: 10/10/2018 9:03:13 PM ******/
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
/****** Object:  Table [dbo].[Masterfile_Area]    Script Date: 10/10/2018 9:03:13 PM ******/
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
/****** Object:  Table [dbo].[Masterfile_Branch]    Script Date: 10/10/2018 9:03:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masterfile_Branch](
	[Id] [int] NOT NULL,
	[Code] [varchar](50) NULL,
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
/****** Object:  Table [dbo].[Masterfile_Category]    Script Date: 10/10/2018 9:03:14 PM ******/
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
/****** Object:  Table [dbo].[Masterfile_Channel]    Script Date: 10/10/2018 9:03:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masterfile_Channel](
	[Id] [int] NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[ChartOfAccountId] [int] NULL,
	[BranchId] [int] NULL,
	[ADB] [decimal](10, 2) NULL,
	[Minimum] [decimal](10, 2) NULL,
	[Maximum] [decimal](10, 2) NULL,
	[Remarks] [varchar](150) NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Masterfile_Channel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masterfile_ChartOfAccount]    Script Date: 10/10/2018 9:03:15 PM ******/
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
/****** Object:  Table [dbo].[Masterfile_District]    Script Date: 10/10/2018 9:03:15 PM ******/
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
/****** Object:  Table [dbo].[Masterfile_Employee]    Script Date: 10/10/2018 9:03:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masterfile_Employee](
	[Id] [bigint] NOT NULL,
	[EmployeeIdNo] [varchar](10) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Firstname] [varchar](50) NOT NULL,
	[Middlename] [varchar](50) NULL,
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
/****** Object:  Table [dbo].[Masterfile_OtherDisbursementDetail]    Script Date: 10/10/2018 9:03:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masterfile_OtherDisbursementDetail](
	[Id] [int] NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[BranchId] [int] NULL,
	[SetUpAmount] [decimal](10, 2) NOT NULL,
	[Day] [int] NULL,
	[ChannelId] [int] NOT NULL,
	[ChartOfAccountId] [int] NOT NULL,
	[Remarks] [varchar](150) NULL,
	[Status] [tinyint] NOT NULL,
	[IsAllBranch] [tinyint] NULL,
	[IsAllWeek] [tinyint] NULL,
 CONSTRAINT [PK_Masterfile_OtherDisbursementDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masterfile_OtherReceiptDetail]    Script Date: 10/10/2018 9:03:17 PM ******/
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
	[IsAllBranch] [tinyint] NULL,
	[IsAllWeek] [tinyint] NULL,
 CONSTRAINT [PK_Masterfile_OtherReceiptDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masterfile_Region]    Script Date: 10/10/2018 9:03:17 PM ******/
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
/****** Object:  Table [dbo].[Masterfile_Role]    Script Date: 10/10/2018 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[Masterfile_SystemRights]    Script Date: 10/10/2018 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[Masterfile_User]    Script Date: 10/10/2018 9:03:19 PM ******/
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
	[Image] [varchar](max) NULL,
	[Password] [varchar](100) NULL,
 CONSTRAINT [PK_Masterfile_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Masterfile_User_Username] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction_BudgetPeriod]    Script Date: 10/10/2018 9:03:20 PM ******/
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
/****** Object:  Table [dbo].[Transaction_BudgetPreparation]    Script Date: 10/10/2018 9:03:21 PM ******/
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
/****** Object:  Table [dbo].[Transaction_BudgetPreparationDetail]    Script Date: 10/10/2018 9:03:21 PM ******/
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
	[TSEmployeeId] [varchar](10) NULL,
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
/****** Object:  Table [dbo].[Transaction_CashCardRequest]    Script Date: 10/10/2018 9:03:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_CashCardRequest](
	[Id] [bigint] NOT NULL,
	[BranchId] [bigint] NULL,
	[ChartOfAccountId] [bigint] NULL,
	[Date] [datetime] NULL,
	[Amount] [decimal](10, 2) NULL,
	[CashCardNumber] [varchar](50) NULL,
	[ClientFirstname] [varchar](50) NULL,
	[ClientMiddlename] [varchar](50) NULL,
	[ClientLastname] [varchar](50) NULL,
	[ContactNumber] [varchar](20) NULL,
	[Address] [varchar](150) NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_Transaction_CashCardRequest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction_DailyCashFlow]    Script Date: 10/10/2018 9:03:23 PM ******/
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
/****** Object:  Table [dbo].[Transaction_DailyCashFlowChannel]    Script Date: 10/10/2018 9:03:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_DailyCashFlowChannel](
	[Id] [bigint] NOT NULL,
	[Date] [date] NULL,
	[BranchId] [bigint] NULL,
	[ChannelId] [bigint] NULL,
	[Details] [varchar](200) NULL,
	[Amount] [decimal](10, 2) NULL,
	[MaintainingBalance] [decimal](10, 2) NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_DailyCashFlowChannel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction_RemcoRequest]    Script Date: 10/10/2018 9:03:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_RemcoRequest](
	[Id] [bigint] NOT NULL,
	[BranchId] [bigint] NULL,
	[ChartOfAccountId] [bigint] NULL,
	[Date] [datetime] NULL,
	[Amount] [decimal](10, 2) NULL,
	[ClientFirstname] [varchar](50) NULL,
	[ClientMiddlename] [varchar](50) NULL,
	[ClientLastname] [varchar](50) NULL,
	[ContactNumber] [varchar](20) NULL,
	[Address] [varchar](150) NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_Transaction_RemcoRequest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vgetAll_Other_Master]    Script Date: 10/10/2018 9:03:24 PM ******/
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
/****** Object:  Index [IQ_Masterfile_AccessRights_RoleID]    Script Date: 10/10/2018 9:03:24 PM ******/
CREATE NONCLUSTERED INDEX [IQ_Masterfile_AccessRights_RoleID] ON [dbo].[Masterfile_AccessRights]
(
	[RoleId] ASC,
	[SystemRightsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IQ_Masterfile_Area]    Script Date: 10/10/2018 9:03:24 PM ******/
CREATE NONCLUSTERED INDEX [IQ_Masterfile_Area] ON [dbo].[Masterfile_Area]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IQ_Masterfile_ChartOfAccount_Code]    Script Date: 10/10/2018 9:03:24 PM ******/
CREATE NONCLUSTERED INDEX [IQ_Masterfile_ChartOfAccount_Code] ON [dbo].[Masterfile_ChartOfAccount]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IQ_Masterfile_District]    Script Date: 10/10/2018 9:03:24 PM ******/
CREATE NONCLUSTERED INDEX [IQ_Masterfile_District] ON [dbo].[Masterfile_District]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IQ_Masterfile_Employee_ContractNumber]    Script Date: 10/10/2018 9:03:24 PM ******/
CREATE NONCLUSTERED INDEX [IQ_Masterfile_Employee_ContractNumber] ON [dbo].[Masterfile_Employee]
(
	[ContactNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IQ_Masterfile_Employee_EmailAddress]    Script Date: 10/10/2018 9:03:24 PM ******/
CREATE NONCLUSTERED INDEX [IQ_Masterfile_Employee_EmailAddress] ON [dbo].[Masterfile_Employee]
(
	[EmailAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IQ_Masterfile_Name]    Script Date: 10/10/2018 9:03:24 PM ******/
CREATE NONCLUSTERED INDEX [IQ_Masterfile_Name] ON [dbo].[Masterfile_Region]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IQ_Transaction_BudgetPeriod_Year]    Script Date: 10/10/2018 9:03:24 PM ******/
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
ALTER TABLE [dbo].[Masterfile_District]  WITH CHECK ADD  CONSTRAINT [FK_Masterfile_District_Masterfile_Region_RegionId] FOREIGN KEY([RegionId])
REFERENCES [dbo].[Masterfile_Region] ([Id])
GO
ALTER TABLE [dbo].[Masterfile_District] CHECK CONSTRAINT [FK_Masterfile_District_Masterfile_Region_RegionId]
GO
ALTER TABLE [dbo].[Masterfile_OtherDisbursementDetail]  WITH CHECK ADD  CONSTRAINT [FK_Masterfile_OtherDisbursementDetail_Masterfile_Category_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Masterfile_Category] ([Id])
GO
ALTER TABLE [dbo].[Masterfile_OtherDisbursementDetail] CHECK CONSTRAINT [FK_Masterfile_OtherDisbursementDetail_Masterfile_Category_CategoryId]
GO
ALTER TABLE [dbo].[Masterfile_OtherReceiptDetail]  WITH CHECK ADD  CONSTRAINT [FK_Masterfile_OtherReceiptDetail_Masterfile_Category_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Masterfile_Category] ([Id])
GO
ALTER TABLE [dbo].[Masterfile_OtherReceiptDetail] CHECK CONSTRAINT [FK_Masterfile_OtherReceiptDetail_Masterfile_Category_CategoryId]
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
ALTER TABLE [dbo].[Transaction_BudgetPreparation]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_BudgetPreparation_Masterfile_User_UserId] FOREIGN KEY([PreparedBy])
REFERENCES [dbo].[Masterfile_User] ([Id])
GO
ALTER TABLE [dbo].[Transaction_BudgetPreparation] CHECK CONSTRAINT [FK_Transaction_BudgetPreparation_Masterfile_User_UserId]
GO
/****** Object:  StoredProcedure [dbo].[spAuditTrail_get]    Script Date: 10/10/2018 9:03:24 PM ******/
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
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			SELECT * FROM Audit_Trail 
		 
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
/****** Object:  StoredProcedure [dbo].[spAuditTrail_getByDate]    Script Date: 10/10/2018 9:03:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spAuditTrail_getByDate '2018-09-19','2018-09-20'
-- =============================================
CREATE PROCEDURE [dbo].[spAuditTrail_getByDate]
	-- Add the parameters for the stored procedure here
	@FromDate DATE,
	@ToDate DATE
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION


						SELECT ADT.Id,TableName, [Action] AS 'Operation'
							, [Description] AS 'Audit Trail Detail',OldValue AS 'Old Data',NewValue AS 'New Data', ComputerName
							,CONCAT(LastName,',',Firstname,' ',Middlename) AS 'EmployeeName'
							,[DateTime] AS 'Date And Time'
						 FROM Audit_Trail ADT 
							inner join  Masterfile_User mu
						on ADT.UserId = mu.Id 
							inner join  Masterfile_Employee me
						on mu.EmployeeId = me.Id 
					WHERE 
					 [DateTime] BETWEEN @FromDate and @ToDate   
				
			
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
/****** Object:  StoredProcedure [dbo].[spAuditTrail_insert]    Script Date: 10/10/2018 9:03:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spAuditTrail_insert 'Masterfile_Area','Insert','Jesryl insert new Branch','1','2',1
-- =============================================
CREATE PROCEDURE [dbo].[spAuditTrail_insert]
	-- Add the parameters for the stored procedure here
	@TableName			VARCHAR(50),
	@Action				VARCHAR(25),
	@Description		VARCHAR(MAX),
	@OldValue			VARCHAR(MAX),
	@NewValue			VARCHAR(MAX),
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT;


			SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Audit_Trail];
					INSERT INTO [dbo].[Audit_Trail]
						(Id,[DateTime],TableName,[Action],[Description],
						OldValue,NewValue,ComputerName,UserId)
					VALUES
						(@_Id,getdate(),@TableName,@Action,@Description,
						@OldValue,@NewValue,(SELECT HOST_NAME()),@UserId);
			
					-- Return of the Data type
					SELECT 	@_Id					AS 'Id', 
							GetDate()				AS 'Date And Time',
							@TableName				AS 'Table Name',
							@Action					AS 'Action',
							@Description			AS 'Description',
							@OldValue				AS 'Old Value',
							@NewValue				AS 'New Value',
							(SELECT HOST_NAME())	AS 'Computer Name',
							@UserId					AS 'UserId',
							'success'				AS 'return_message'
							
		

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
/****** Object:  StoredProcedure [dbo].[spEmailNotif_get]    Script Date: 10/10/2018 9:03:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spEmailNotif_get
-- =============================================
CREATE PROCEDURE [dbo].[spEmailNotif_get]

AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			--SELECT TOP 5 me.EmailAddress FROM  Masterfile_Employee me
			--INNER JOIN Masterfile_Branch mb
			--ON me.BranchId = mb.Id AND mb.[Status] = 1
			--INNER JOIN Transaction_BudgetPreparation tbp
			--ON tbp.BranchId <>  mb.Id
			--Inner Join Transaction_BudgetPeriod tb
			--ON tbp.BudgetPeriodId = tb.Id
			--WHERE  EmailAddress != '' AND tb.PeriodStatus = 'Open'
			Select 'jlord213@gmail.com' as EmailAddress
						UNION 
			Select 'rmfit.ojt.aldwin@gmail.com' as EmailAddress
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
/****** Object:  StoredProcedure [dbo].[spExcessFund_get]    Script Date: 10/10/2018 9:03:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spExcessFund_get
-- =============================================
CREATE PROCEDURE [dbo].[spExcessFund_get]

AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		SELECT mb.Name,mc.Maximum,mc.Minimum,mc.ADB
		FROM Masterfile_Channel mc
		Inner Join Masterfile_Branch mb
		ON mc.BranchId	 =  mb.Id
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
/****** Object:  StoredProcedure [dbo].[spGetBranchLocationDetail]    Script Date: 10/10/2018 9:03:24 PM ******/
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
CREATE PROCEDURE [dbo].[spGetBranchLocationDetail]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Branchs and its details
				SELECT 
					mr.Name AS 'Region',md.Name AS 'District',
					ma.Name AS 'Area',mb.Name AS 'Branch',mb.BranchCode AS 'Branch Code',
					mb.[Address] AS 'Address',mb.Longitude AS 'Longitude',mb.Latitude AS 'Latitude'
					from Masterfile_Branch mb
					LEFT JOIN Masterfile_Area ma 
					on mb.AreaId =ma.Id  and ma.[Status] = 1
					LEFT JOIN Masterfile_District md
					on ma.DistrictId = md.Id and md.[Status] = 1
					LEFT JOIN Masterfile_Region mr
					on md.RegionId = mr.Id AND mr.[Status] = 1
					where
					mb.[Status] = 1
					ORDER BY mb.Name ASC
			
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
/****** Object:  StoredProcedure [dbo].[spMaster_User_GMailLogin]    Script Date: 10/10/2018 9:03:24 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_AccessRights]    Script Date: 10/10/2018 9:03:24 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_AccessRights_delete]    Script Date: 10/10/2018 9:03:24 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_AccessRights_get]    Script Date: 10/10/2018 9:03:24 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_AccessRights_insert]    Script Date: 10/10/2018 9:03:24 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Area_delete]    Script Date: 10/10/2018 9:03:24 PM ******/
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
	@UserId				BIGINT 
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0,
			@User	VARCHAR(250),
			@Delete	VARCHAR(MAX),
			@Area	VARCHAR(250)

			UPDATE [dbo].[Masterfile_Area]	 
				SET	
					[Status]	= @_Deleted
		
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Area_deleteall]    Script Date: 10/10/2018 9:03:24 PM ******/
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
create PROCEDURE [dbo].[spMasterfile_Area_deleteall]
	@UserId				BIGINT 
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0,
			@User	VARCHAR(250),
			@Delete	VARCHAR(MAX),
			@Area	VARCHAR(250)

			UPDATE [dbo].[Masterfile_Area]	 
			SET	
			[Status]	= @_Deleted;

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Area_get]    Script Date: 10/10/2018 9:03:24 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Area_getAll]    Script Date: 10/10/2018 9:03:24 PM ******/
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
CREATE PROCEDURE [dbo].[spMasterfile_Area_getAll]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Regions and its details
			SELECT [Name] FROM Masterfile_Area ORDER BY [NAME] ASC
			
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Area_insert]    Script Date: 10/10/2018 9:03:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Area_insert 'Poblacionsssa',1,'nice',1
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Area_insert]
	-- Add the parameters for the stored procedure here
	@Name				VARCHAR(100),
	@DistrictId			INT,
	@Remarks			VARCHAR(150) ,
	@UserId				BIGINT
AS
BEGIN
	-- Variables starting with _Error is for Try/Catch Statement Set data variables return
	DECLARE	@_Id				INT,
			@_Status			TINYINT  = 1,		-- Default as 1 as describe as 'Active'
			@_User VARCHAR(150),
			@Insert VARCHAR(MAX),
			@New	VARCHAR(MAx),
			@Id		VARCHAR(MAx),
			@District VARCHAR(MAX)
			SET @_User =  (SELECT CONCAT(Firstname,' ',Lastname) 
							from Masterfile_Employee
							Where Id = @UserId)	

	IF EXISTS(SELECT Id FROM [dbo].[Masterfile_Area] WHERE Name =  @Name)
		BEGIN  							
			set @_Id = (SELECT Id FROM [dbo].[Masterfile_Area] WHERE Name =  @Name);

			UPDATE [dbo].[Masterfile_Area]	 
			SET	[Remarks]	= @Remarks,
				[Status]	= @_Status
			WHERE 
				[Id]		= @_Id;					
		END

	ELSE
		BEGIN
			SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Masterfile_Area];

			INSERT INTO [dbo].[Masterfile_Area]
				(Id,[Name],DistrictId,Remarks,[Status])
			VALUES
				(@_Id, @Name,@DistrictId,@Remarks, @_Status);
				    
			/*
			-- Return of the Data type
			SELECT 	@_Id					AS 'Id', 
					@Name					AS 'Name',
					@DistrictId				AS 'DistrictId',
					@Remarks				AS 'Remarks',
					@Code					AS 'Code',
					'success'					AS 'return_message';
			SET @Insert = Concat(@_User,' Inserted New Area ',@Name);
			SET @Id	= (SELECT Id From Masterfile_Area WHERE Id= @_Id);
			SET @District = (SELECT Name From Masterfile_District Where Id = @DistrictId)
			SET @New = CONCAT('Id: ',@Id,', Name: ',@Name,', District: ',@District,', Remarks: ',@Remarks)

			EXEC spAuditTrail_insert 'Masterfile_Area','Insert',@Insert,'',@New,@UserId;
			*/
		END
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Area_update]    Script Date: 10/10/2018 9:03:24 PM ******/
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
		DECLARE
		@OldValue  VARCHAR(MAX),
		@OldValue1 VARCHAR(100) = (SELECT Name from Masterfile_Area Where Id=@Id),
		@OldValue2 VARCHAR(100) = (SELECT md.Name from Masterfile_Area ma
								   INNER JOIN Masterfile_District md
								   ON ma.DistrictId = md.Id AND md.[Status]= 1
								   Where ma.Id=@Id),
		@OldValue3 VARCHAR(100) = (SELECT Remarks from Masterfile_Area Where Id=@Id),

		@_Id	   VARCHAR(100) = (SELECT Id FROM Masterfile_Area WHERE Id=@Id),
		@NewValue  VARCHAR(MAX),
		@Update    VARCHAR(MAX),
		@User	   VARCHAR(100),
		@District		VARCHAR(100)
		
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
				
				SET @User = (SELECT CONCAT(Firstname,' ',Lastname) 
				from Masterfile_Employee
				Where Id = @UserId)
				SET @District = (SELECT Name From Masterfile_District Where Id = @DistrictId)
				SET @NewValue = CONCAT('Id: ',@_Id,', Name: ',@Name,', District: ',@District,', Remarks: ',@Remarks)
				SET @OldValue = CONCAT('Id: ',@_Id,', Name: ',@OldValue1,', District: ',@OldValue2,', Remarks: ',@OldValue3)
				SET @Update = Concat(@User,'Made Some Changes on the Masterfile_Area');
				EXEC spAuditTrail_insert 'Masterfile_Area','Update',@Update,@OldValue,@NewValue,@UserId;			
		
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Branch_BIJLISync]    Script Date: 10/10/2018 9:03:24 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Branch_deleteall]    Script Date: 10/10/2018 9:03:24 PM ******/
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
CREATE PROCEDURE [dbo].[spMasterfile_Branch_deleteall]
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0,
			@User	VARCHAR(250),
			@Delete	VARCHAR(MAX),
			@Category	VARCHAR(250)

			UPDATE [dbo].[Masterfile_Branch]	 
				SET	
					[Status]	= @_Deleted;
			
			-- Return Data of the Update

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Branch_get]    Script Date: 10/10/2018 9:03:24 PM ******/
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
					mb.Id,mb.Code,mb.[Name],mb.AreaId,ma.[Name] AS 'Area',mb.[Address],
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
					mb.Id,mb.Code,mb.[Name],mb.AreaId,ma.[Name] AS 'Area',mb.[Address],
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
							 mb.Id,mb.Code,mb.Name,mb.AreaId,ma.Name AS 'Area',mb.[Address],
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Branch_getAll]    Script Date: 10/10/2018 9:03:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Area_getAll
-- ============================================
CREATE PROCEDURE [dbo].[spMasterfile_Branch_getAll]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Regions and its details
			SELECT mb.Code AS 'Branch Code',mb.Name AS 'Branch Name',
			ma.Name AS 'Area Name',mb.[Address],Latitude ,Longitude
			FROM Masterfile_Branch mb
			INNER JOIN Masterfile_Area ma
			ON mb.AreaId = ma.Id
			ORDER BY mb.Name ASC
			
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Branch_GetByPeriodStatus]    Script Date: 10/10/2018 9:03:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC [spMasterfile_GetBranchByPeriodStatus] 12
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Branch_GetByPeriodStatus]
@isPrepared TINYINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
		
		DECLARE	@_Id				INT;

		SELECT @_Id = ID FROM Transaction_BudgetPeriod	
				where [Status] = 1 AND PeriodStatus = 'Open';
		IF(@isPrepared = 1)
			BEGIN
				SELECT 
					mb.Id,Name 
				FROM Masterfile_Branch mb
					LEFT JOIN Transaction_BudgetPreparation tbp 
					on tbp.BranchId = mb.Id 
				WHERE
					BudgetPeriodId = @_Id
			END
		ELSE
			BEGIN
				SELECT 
					mb.Id,Name 
				FROM Masterfile_Branch mb
					LEFT JOIN Transaction_BudgetPreparation tbp 
					on tbp.BranchId <> mb.Id 
				WHERE
					BudgetPeriodId = @_Id
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Branch_insert]    Script Date: 10/10/2018 9:03:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Branch_insert '003','hah', 1,12.2121,12.123,'Poblacion,Argao,Cebu','Sample',1,'Cebu 2'
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Branch_insert]
	-- Add the parameters for the stored procedure here
	@Code			VARCHAR(50),
	@Name			VARCHAR(100),
	@AreaId			INT,
	@Latitude		DECIMAL(8,6),
	@Longitude		DECIMAL(9,6),
	@Address		VARCHAR(150),
	@Remarks			VARCHAR(150) ,
	@UserId				BIGINT,
	@AreaName     VARCHAR(50)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT,
					@_Status			TINYINT  = 1,		-- Default as 1 as describe as 'Active'
					@_User VARCHAR(150),
					@_AreaId VARCHAR(150),
					@Insert VARCHAR(MAX),
					@New	VARCHAR(MAX),
					@Id		VARCHAR(250),
					@Latitudes	VARCHAR(200),
					@Longitudes	VARCHAR(200),
					@Area   VARCHAR(250)
					SET @_User =  (SELECT CONCAT(Firstname,' ',Lastname) 
								   from Masterfile_Employee
								   Where Id = @UserId)	

			
			

			IF EXISTS(SELECT Id FROM [dbo].[Masterfile_Branch] WHERE Code =  @Code AND [Status] = 0)
				BEGIN  	
				SELECT @_AreaId = Id FROM [dbo].[Masterfile_Area] WHERE [Name] = @AreaName ;						
					UPDATE [dbo].[Masterfile_Branch]	 
					SET	
						[AreaId]			= @_AreaId,
						[Name]			= @Name,
						[Address]		= @Address,
						[Latitude]		= @Latitude,
						[Longitude]		= @Longitude,
						[Status]		= 1
					WHERE 
						[Code]			= @Code;					
				END

			ELSE
				BEGIN
				SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Masterfile_Branch];
					INSERT INTO [dbo].[Masterfile_Branch]
						(Id,[Name],Code,AreaId,Latitude,Longitude,[Address],Remarks,[Status])
					VALUES
						(@_Id, @Name,@Code,@AreaId,@Latitude,@Longitude,@Address,@Remarks, @_Status);
				END

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Category_delete]    Script Date: 10/10/2018 9:03:24 PM ******/
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
			@User	VARCHAR(250),
			@Delete	VARCHAR(MAX),
			@Category	VARCHAR(250)
			UPDATE [dbo].[Masterfile_Category]	 
				SET	
					[Status]	= @_Deleted
				WHERE 
					[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT 'success'	AS 'return_message';
			SET @User = (SELECT CONCAT(Firstname,' ',Lastname) 
			from Masterfile_Employee
			Where Id = @UserId)
			SET @Category = (SELECT [Description] From Masterfile_Category WHERE Id= @Id);	
			SET @Delete = CONCAT(@User,' Deleted ',@Category,' Category')
			EXEC spAuditTrail_insert 'Masterfile_Category','Delete',@Delete,'','',@UserId;				
			

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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Category_get]    Script Date: 10/10/2018 9:03:24 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Category_insert]    Script Date: 10/10/2018 9:03:24 PM ******/
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
					@_Status			TINYINT  = 1,		-- Default as 1 as describe as 'Active'
					@_User VARCHAR(150),
					@Insert VARCHAR(MAX),
					@New	VARCHAR(MAX),
					@Id VARCHAR(250)
					SET @_User =  (SELECT CONCAT(Firstname,' ',Lastname) 
								   from Masterfile_Employee
								   Where Id = @UserId)	

					

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
				SET @Insert = Concat(@_User,' Inserted New Cateogry ',@Description);
				SET @Id	= (SELECT Id From Masterfile_Branch WHERE Id= @_Id);
				
				SET @New = CONCAT('Id: ',@Id,', Category: ',@Description,', Category Type: ',@Type,', Remarks: ',@Remarks)
					EXEC spAuditTrail_insert 'Masterfile_Category','Insert',@Insert,'',@New,@UserId;
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Category_update]    Script Date: 10/10/2018 9:03:24 PM ******/
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
		DECLARE
		@OldValue  VARCHAR(MAX),
		@OldValue1 VARCHAR(100) = (SELECT [Description] from Masterfile_Category Where Id=@Id),
		@OldValue2 VARCHAR(100) = (SELECT [Type] from Masterfile_Category Where Id=@Id),
		@OldValue3 VARCHAR(100) = (SELECT Remarks from Masterfile_Category Where Id=@Id),
		@_Id	   VARCHAR(100) = (SELECT Id FROM Masterfile_Category WHERE Id=@Id),
		@NewValue  VARCHAR(MAX),
		@Update    VARCHAR(MAX),
		@User	   VARCHAR(100)
		
			IF (EXISTS(SELECT Id FROM [dbo].[Masterfile_Category] WHERE [Description] =  @Description AND [Type]=@Type AND[Status] = 1 and Id <> @Id))
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
			SET @User = (SELECT CONCAT(Firstname,' ',Lastname) 
			from Masterfile_Employee
			Where Id = @UserId)
			SET @NewValue = CONCAT('Id: ',@_Id,', Category: ',@Description,', Category Type: ',@Type,', Remarks: ',@Remarks)
			SET @OldValue = CONCAT('Id: ',@_Id,', Category: ',@OldValue1,', Category Type: ',@OldValue2,', Remarks: ',@OldValue3)
			
			SET @Update = Concat(@User,'Made Some Changes on the Mastefile_Category');
			EXEC spAuditTrail_insert 'Masterfile_Category','Update',@Update,@OldValue,@NewValue,@UserId;			
			
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Channel_delete]    Script Date: 10/10/2018 9:03:24 PM ******/
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
			@User	VARCHAR(250),
			@Delete	VARCHAR(MAX),
			@Channel	VARCHAR(250)
			UPDATE [dbo].[Masterfile_Channel]	 
				SET	
					[Status]	= @_Deleted
				WHERE 
					[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT 'success'	AS 'return_message';
			SET @User = (SELECT CONCAT(Firstname,' ',Lastname) 
			from Masterfile_Employee
			Where Id = @UserId)
			SET @Channel = (SELECT [Description] From Masterfile_Channel WHERE Id= @Id);	
			SET @Delete = CONCAT(@User,' Deleted ',@Channel,' Channel');
			EXEC spAuditTrail_insert 'Masterfile_Channel','Delete',@Delete,'','',@UserId;
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Channel_deleteall]    Script Date: 10/10/2018 9:03:24 PM ******/
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
create PROCEDURE [dbo].[spMasterfile_Channel_deleteall]
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0,
			@User	VARCHAR(250),
			@Delete	VARCHAR(MAX),
			@Channel	VARCHAR(250)

			UPDATE [dbo].[Masterfile_Channel]	 
			SET	
			[Status]	= @_Deleted;
			/*
			-- Return Data of the Update
			SELECT 'success'	AS 'return_message';
			SET @User = (SELECT CONCAT(Firstname,' ',Lastname) 
			from Masterfile_Employee
			Where Id = @UserId)
			SET @Channel = (SELECT [Description] From Masterfile_Channel WHERE Id= @Id);	
			SET @Delete = CONCAT(@User,' Deleted ',@Channel,' Channel');
			EXEC spAuditTrail_insert 'Delete',@UserId,'','',@Delete;			
			*/
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Channel_get]    Script Date: 10/10/2018 9:03:24 PM ******/
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
			SELECT mcc.Id,mcc.[Description],mcc.BranchId,mb.Name AS 'Branch'
			,mcc.ChartOfAccountId,mc.[Description] AS 'Chart Of Account',mcc.ADB aS 'Ave. Daily Bal'
			,mcc.Minimum AS 'Minimum',mcc.Maximum AS 'Maximum',mcc.Remarks
					from Masterfile_Channel mcc
					LEFT JOIN Masterfile_Branch mb
					ON mcc.BranchId = mb.Id AND mb.[Status] = 1
					LEFT JOIN Masterfile_ChartOfAccount mc
					ON mcc.ChartOfAccountId = mc.Id
					where
					mcc.[Status] = 1
					ORDER BY mb.Name,mcc.[Description]
					
			END
			ELSE 
			BEGIN
			IF  (@ChannelId = 0)
				BEGIN
					WITH TempResult AS(
					SELECT mcc.Id,mcc.[Description],mcc.BranchId,mb.Name AS 'Branch'
					,mcc.ChartOfAccountId,mc.[Description] AS 'Chart Of Account',
					mcc.ADB aS 'Average Daily Balance'
			,mcc.Minimum AS 'Minimum',mcc.Maximum AS 'Maximum',mcc.Remarks
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
					ORDER BY TempResult. Branch ,TempResult. [Description] ASC
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

				END
			ELSE
				BEGIN

					WITH TempResult AS(
					SELECT mcc.Id,mcc.[Description],mcc.BranchId,mb.Name AS 'Branch',
					mcc.ChartOfAccountId,mc.[Description] AS 'Chart Of Account',
					mcc.ADB aS 'Average Daily Balance'
			,mcc.Minimum AS 'Minimum',mcc.Maximum AS 'Maximum',mcc.Remarks
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
						ORDER BY TempResult. Branch ,TempResult. [Description] ASC
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Channel_getByBranch]    Script Date: 10/10/2018 9:03:24 PM ******/
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
CREATE PROCEDURE [dbo].[spMasterfile_Channel_getByBranch]
	-- Add the parameters for the stored procedure here
	@BranchId INT
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			

				SELECT mcc.Id,mcc.[Description]
					from Masterfile_Channel mcc
					INNER JOIN Masterfile_ChartOfAccount mca
					ON mca.Id = mcc.ChartOfAccountId
					where
					mcc.[Status] = 1
					AND mcc.BranchId = @BranchId OR (mca.Code = 'COH' OR mca.Code = 'CREMCO'  )
					ORDER BY mcc.Id

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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Channel_insert]    Script Date: 10/10/2018 9:03:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Description>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- spMasterfile_Channel_insert  'ABS-CBN','TV PLUS',1,1,1,1,1,1
/**

**/
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Channel_insert]
	-- Add the parameters for the stored procedure here
	@Description		nVARCHAR(250),
	@Remarks			VARCHAR(150) ,
	@UserId				BIGINT,
	@ChartOfAccountCode	varchar(50),
	@BranchCode			varchar(50)	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT,
					@_Status			TINYINT  = 1,		-- Default as 1 as describe as 'Active'
					@_User VARCHAR(150),
					@Insert VARCHAR(MAX),
					@New	VARCHAR(MAX),
					@Id VARCHAR(250)

					SET @_User =  (SELECT CONCAT(Firstname,' ',Lastname) 
								   from Masterfile_Employee
								   Where Id = @UserId)	

			

			IF EXISTS(SELECT Id FROM [dbo].[Masterfile_Channel] WHERE [Description] =  @Description)
				BEGIN  	
					set @_Id = (SELECT Id FROM [dbo].[Masterfile_Channel] WHERE [Description] =  @Description);
											
					UPDATE [dbo].[Masterfile_Channel]	 
					SET	[Description]		= @Description,
						[ChartOfAccountId]	= (Select Id from [dbo].[Masterfile_ChartOfAccount] where [Code] = @ChartOfAccountCode),
						[BranchId]			= (Select Id from [dbo].[Masterfile_Branch] where [Code] = @BranchCode),
						[Remarks]			= @Remarks,
						[Status]			= @_Status
					WHERE 
						[Id]				= @_Id;					
				END

			ELSE
				BEGIN
					SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Masterfile_Channel];

					INSERT INTO [dbo].[Masterfile_Channel]
						(Id,[Description],Remarks,[Status],BranchId,ChartOfAccountId,ADB,Minimum,Maximum)
					VALUES
						(@_Id, @Description,@Remarks, @_Status,0,0,0,0,0);
				/*
					-- Return of the Data type
					SELECT 	@_Id					AS 'Id', 
							@Description			AS 'Description',
							@BranchId				AS 'BranchId',
							@ChartOfAccountId		AS 'ChartOfAccountId',
							@ADB					AS 'Average Daily Balance',
							@Minimum				AS 'Minimum',
							@Maximum				AS 'Maximum',
							@Remarks				AS 'Remarks',
							'success'				AS 'return_message';		
				SET @Insert = Concat(@_User,' Inserted New Channel ',@Description);
				SET @Id	= (SELECT Id From Masterfile_Channel WHERE Id= @_Id);
				SET @Branch = (SELECT Name From Masterfile_Branch Where Id= @BranchId);
				SET @ChartOfAccount = (SELECT [Description] FROM Masterfile_ChartOfAccount WHERe Id=@ChartOfAccountId);
				SET @ADBs	= (SELECT ADB From Masterfile_Channel  WHERE Id= @_Id);
				SET @Minimums = (SELECT Minimum FROM Masterfile_Channel WHERE Id= @_Id);
				SET @Maximums = (SELECT Maximum FROM Masterfile_Channel WHERE Id=  @_Id);
				SET @New = CONCAT('Id: ',@Id,', Channel: ',@Description,',Branch: ',@Branch,', Chart Of Account: ',@ChartOfAccount,', Average Daily Balance: ',@ADBs,', Minimum: ',@Minimums,', Maximum: ',@Maximums,', Remarks: ',@Remarks)
				EXEC spAuditTrail_insert 'Masterfile_Channel','Insert',@Insert,'',@New,@UserId;	
				*/
				END

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Channel_update]    Script Date: 10/10/2018 9:03:24 PM ******/
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
	@BranchId			INT,
	@ChartOfAccountId	INT,
	@ADB				Decimal(10,2),
	@Minimum			DECIMAL(10,2),
	@Maximum			DECIMAL(10,2),
	@Remarks			VARCHAR(150),
	@UserId				BIGINT

AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		DECLARE 
		@OldValue VARCHAR(MAX),
		@OldValue1 VARCHAR(100) = (SELECT [Description] from Masterfile_Channel Where Id=@Id),
		@OldValue2 VARCHAR(100) = (SELECT mb.Name from Masterfile_Channel mc
								  INNER JOIN Masterfile_Branch mb
								  ON mc.BranchId = mb.Id AND mb.[Status] =1
								   Where mc.Id=@Id),
		@OldValue3 VARCHAR(100) = (SELECT mch.[Description] from Masterfile_Channel mc
								   INNER JOIN Masterfile_ChartOfAccount mch
								   ON mc.ChartOfAccountId  = mch.Id AND mch.[Status]=1
								   Where mc.Id=@Id),
		@OldValue4 VARCHAR(100) = (SELECT ADB from Masterfile_Channel Where Id=@Id),
		@OldValue5 VARCHAR(100) = (SELECT Maximum from Masterfile_Channel Where Id=@Id),
		@OldValue6 VARCHAR(100) = (SELECT Minimum from Masterfile_Channel Where Id=@Id),
		@OldValue7 VARCHAR(100) = (SELECT Remarks from Masterfile_Channel Where Id=@Id),
		@_Id	   VARCHAR(100) = (SELECT Id FROM Masterfile_Channel WHERE Id=@Id),
		@NewValue  VARCHAR(MAX),
		@Update    VARCHAR(MAX),
		@User	   VARCHAR(100),
		@Branch		VARCHAR(100),
		@ADBs	VARCHAR(100),
		@ChartOfAccount		VARCHAR(100),
		@Minimums	VARCHAR(100),
		@Maximums		VARCHAR(100)
		
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
						[Remarks]		= @Remarks,
						[ADB]			= @ADB,
						[Minimum]		= @Minimum,
						Maximum			= @Maximum

					WHERE 
						[Id]			= @Id;
			
			-- Return Data of the Update
			SELECT	@Id AS 'Id',
					@Description	AS 'Description',
					@BranchId		AS 'BranchId',
					@ChartOfAccountId	AS 'ChartOfAccountId',
					@ADB		AS 'ADB',
					@Minimum	AS 'Minimum',
					@Maximum	AS 'Maximum',
					@Remarks	AS 'Remarks',
					'success'	AS 'return_message';
			SET @User = (SELECT CONCAT(Firstname,' ',Lastname) 
			from Masterfile_Employee
			Where Id = @UserId)
			SET @Branch = (SELECT Name From Masterfile_Branch Where Id= @BranchId);
			SET @ChartOfAccount = (SELECT [Description] FROM Masterfile_ChartOfAccount WHERe Id=@ChartOfAccountId);
			SET @ADBs	= (SELECT ADB From Masterfile_Channel  WHERE Id= @_Id);
			SET @Minimums = (SELECT Minimum FROM Masterfile_Channel WHERE Id= @_Id);
			SET @Maximums = (SELECT Maximum FROM Masterfile_Channel WHERE Id=  @_Id);
			SET @NewValue = CONCAT('Id: ',@_Id,', Channel: ',@Description,',Branch: ',@Branch,', Chart Of Account: ',@ChartOfAccount,', Average Daily Balance: ',@ADBs,', Minimum: ',@Minimums,', Maximum: ',@Maximums,', Remarks: ',@Remarks)
			SET @OldValue = CONCAT('Id: ',@_Id,', Channel: ',@OldValue1,',Branch: ',@OldValue2,', Chart Of Account: ',@OldValue3,', Average Daily Balance: ',@OldValue4,', Minimum: ',@OldValue5,', Maximum: ',@OldValue6,', Remarks: ',@OldValue7)	
			SET @Update = Concat(@User,'Made Some Changes on the Mastefile_Channel');
			EXEC spAuditTrail_insert 'Masterfile_Channel','Update',@Update,@OldValue,@NewValue,@UserId;			
		
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Channel_updatetmp]    Script Date: 10/10/2018 9:03:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Description>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Channel_updatetmp]
	-- Add the parameters for the stored procedure here
	@Description		VARCHAR(100),	
		@ChartofAccountCode VARCHAR(30),
	@BranchCode			VARCHAR(50),
	@ADB				Decimal(10,2),
	@Minimum			DECIMAL(10,2),
	@Maximum			DECIMAL(10,2),
	@Remarks			VARCHAR(100),
	@UserId				BIGINT

AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		DECLARE @BranchId INT,
				@ChartofAccountID INT;

		 SELECT @BranchId = Id from Masterfile_Branch Where [Code]=@BranchCode;
		SELECT @ChartofAccountID =  Id from Masterfile_ChartOfAccount Where [Code]=@ChartofAccountCode;

				UPDATE  [dbo].[Masterfile_Channel]	 
					SET [BranchId]		= @BranchId,
						[ChartOfAccountId] = @ChartOfAccountId,
						[ADB]			= @ADB,
						[Minimum]		= @Minimum,
						Maximum			= @Maximum,
						Remarks			= @Remarks

					WHERE 
						[Description]			= @Description;
			

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
/****** Object:  StoredProcedure [dbo].[spMasterfile_ChartOfAccount_BIJLISync]    Script Date: 10/10/2018 9:03:24 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_ChartOfAccount_delete]    Script Date: 10/10/2018 9:03:24 PM ******/
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
			@User	VARCHAR(250),
			@Delete	VARCHAR(MAX),
			@ChartOfAccount	VARCHAR(250)
			UPDATE [dbo].[Masterfile_ChartOfAccount]	 
				SET	
					[Status]	= @_Deleted
				WHERE 
					[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT 'success'	AS 'return_message';
			SET @User = (SELECT CONCAT(Firstname,' ',Lastname) 
			from Masterfile_Employee
			Where Id = @UserId)
			SET @ChartOfAccount = (SELECT [Description] From Masterfile_ChartOfAccount WHERE Id= @Id);	
			SET @Delete = CONCAT(@User,' Deleted ',@ChartOfAccount,' Chart Of Account')
			EXEC spAuditTrail_insert 'Masterfile_ChartOfAccount','Delete',@Delete,'','',@UserId;
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_ChartOfAccount_deleteall]    Script Date: 10/10/2018 9:03:24 PM ******/
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
create PROCEDURE [dbo].[spMasterfile_ChartOfAccount_deleteall]
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0,
			@User	VARCHAR(250),
			@Delete	VARCHAR(MAX),
			@ChartOfAccount	VARCHAR(250)

			UPDATE [dbo].[Masterfile_ChartOfAccount]	 
			SET	
			[Status]	= @_Deleted;
			
			-- Return Data of the Update
			/*
			SELECT 'success'	AS 'return_message';
			SET @User = (SELECT CONCAT(Firstname,' ',Lastname) 
			from Masterfile_Employee
			Where Id = @UserId)
			SET @ChartOfAccount = (SELECT [Description] From Masterfile_ChartOfAccount WHERE Id= @Id);	
			SET @Delete = CONCAT(@User,' Deleted ',@ChartOfAccount,' Chart Of Account')
			EXEC spAuditTrail_insert 'Delete',@UserId,'','',@Delete;			
			*/
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_ChartOfAccount_get]    Script Date: 10/10/2018 9:03:24 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_ChartOfAccount_insert]    Script Date: 10/10/2018 9:03:24 PM ******/
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
					@_Status			TINYINT  = 1,	-- Default as 1 as describe as 'Active'
					@_User VARCHAR(150),
					@Insert VARCHAR(MAX),
					@New	VARCHAR(MAX),
					@Id VARCHAR(250)
					SET @_User =  (SELECT CONCAT(Firstname,' ',Lastname) 
								   from Masterfile_Employee
								   Where Id = @UserId)	
	
			IF EXISTS(SELECT Id FROM [dbo].[Masterfile_ChartOfAccount] WHERE [Code] =  @Code )
				BEGIN  							
				UPDATE [dbo].[Masterfile_ChartOfAccount]	 
					SET	[Description]	= @Description,
						[Remarks]	= @Remarks,
						[Status] = @_Status
					WHERE 
						[Code]		= @Code;					
				END
			ELSE
				BEGIN
					SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Masterfile_ChartOfAccount];

					INSERT INTO [dbo].[Masterfile_ChartOfAccount]
						(Id,Code,[Description],Remarks,[Status])
					VALUES
						(@_Id, @Code,@Description,@Remarks, @_Status);
			    /*
					-- Return of the Data type
					SELECT 	@_Id					AS 'Id',
							@Code					AS 'Code', 
							@Description			AS 'Description',
							@Remarks				AS 'Remarks',
							'success'				AS 'return_message';		
				SET @Insert = Concat(@_User,' Inserted New Chart Of Account ',@Description);
				SET @Id	= (SELECT Id From Masterfile_ChartOfAccount WHERE Id= @_Id);
				
				SET @New = CONCAT('Id: ',@Id,', Code: ',@Code,', Chart Of Account: ',@Description,', Remarks: ',@Remarks)
						EXEC spAuditTrail_insert 'Masterfile_ChartOfAccount','Insert',@Insert,'',@New,@UserId;	
			    */
				END

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_ChartOfAccount_update]    Script Date: 10/10/2018 9:03:24 PM ******/
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
		DECLARE
		@OldValue  VARCHAR(MAX),
		@OldValue1 VARCHAR(100) = (SELECT Code from Masterfile_ChartOfAccount Where Id=@Id),
		@OldValue2 VARCHAR(100) = (SELECT [Description] from Masterfile_ChartOfAccount Where Id=@Id),
		@OldValue3 VARCHAR(100) = (SELECT Remarks from Masterfile_ChartOfAccount Where Id=@Id),
		@_Id	   VARCHAR(100) = (SELECT Id FROM Masterfile_ChartOfAccount WHERE Id=@Id),
		@NewValue  VARCHAR(MAX),
		@Update    VARCHAR(MAX),
		@User	   VARCHAR(100)
		
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
				SET @User = (SELECT CONCAT(Firstname,' ',Lastname) 
			from Masterfile_Employee
			Where Id = @UserId)
			SET @NewValue = CONCAT('Id: ',@_Id,', Code: ',@Code,', Chart Of Account: ',@Description,', Remarks: ',@Remarks)
			SET @NewValue = CONCAT('Id: ',@_Id,', Code: ',@OldValue1,', Chart Of Account: ',@OldValue2,', Remarks: ',@OldValue3)	
			SET @Update = Concat(@User,'Made Some Changes on the Mastefile_ChartOfAccount');
			EXEC spAuditTrail_insert 'Masterfile_ChartOfAccount','Update',@Update,@OldValue,@NewValue,@UserId;			
		
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_District_delete]    Script Date: 10/10/2018 9:03:24 PM ******/
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
			@User	VARCHAR(250),
			@Delete	VARCHAR(MAX),
			@District	VARCHAR(250)
			UPDATE [dbo].[Masterfile_District]	 
				SET	
					[Status]	= @_Deleted
				WHERE 
					[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT 'success'	AS 'return_message';
			SET @User = (SELECT CONCAT(Firstname,' ',Lastname) 
			from Masterfile_Employee
			Where Id = @UserId)
			SET @District = (SELECT Name From Masterfile_District WHERE Id= @Id);	
			SET @Delete = CONCAT(@User,' Deleted ',@District,' District')
			EXEC spAuditTrail_insert 'Masterfile_Delete','Delete',@Delete,'','',@UserId;

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
/****** Object:  StoredProcedure [dbo].[spMasterfile_District_get]    Script Date: 10/10/2018 9:03:24 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_District_insert]    Script Date: 10/10/2018 9:03:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
--EXEC spMasterfile_District_insert 'Iligans',1,'Kamote',1
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
					@_Status			TINYINT  = 1,	-- Default as 1 as describe as 'Active'
					@_User VARCHAR(150),
					@Insert VARCHAR(MAX),
					@New	VARCHAR(MAX),
					@Id VARCHAR(250),
					@Region	VARCHAR(250)
					SET @_User =  (SELECT CONCAT(Firstname,' ',Lastname) 
								   from Masterfile_Employee
								   Where Id = @UserId)	
	

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
				SET @Insert = Concat(@_User,' Inserted New District ',@Name);
				SET @Id	= (SELECT Id From Masterfile_District WHERE Id= @_Id);
				SET @Region = (SELECT Name From Masterfile_Region Where Id =  @RegionId);
				SET @New = CONCAT('Id: ',@Id,', District: ',@Name,', Region: ',@Region,', Remarks: ',@Remarks)
				EXEC spAuditTrail_insert 'Masterfile_District','Insert',@Insert,'',@New,@UserId;	
				
				
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_District_update]    Script Date: 10/10/2018 9:03:24 PM ******/
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
		DECLARE 
		@OldValue  VARCHAR(MAX),
		@OldValue1 VARCHAR(100) = (SELECT Name from Masterfile_District Where Id=@Id),
		@OldValue2 VARCHAR(100) = (SELECT mr.Name from Masterfile_District md
								   INNER JOIN Masterfile_Region mr
								   ON md.RegionId = mr.Id AND mr.[Status]= 1
								   Where md.Id=@Id),
		@OldValue3 VARCHAR(100) = (SELECT Remarks from Masterfile_District Where Id=@Id),

		@_Id	   VARCHAR(100) = (SELECT Id FROM Masterfile_District WHERE Id=@Id),
		@NewValue  VARCHAR(MAX),
		@Update    VARCHAR(MAX),
		@User	   VARCHAR(100),
		@Region		VARCHAR(100)
		
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
			SET @User = (SELECT CONCAT(Firstname,' ',Lastname) 
			from Masterfile_Employee
			Where Id = @UserId)
			SET @Region = (SELECT Name From Masterfile_Region Where Id =  @RegionId);
			SET @NewValue = CONCAT('Id: ',@_Id,', District: ',@Name,', Region: ',@Region,', Remarks: ',@Remarks)	
			SET @OldValue = CONCAT('Id: ',@_Id,', District: ',@OldValue1,', Region: ',@OldValue2,', Remarks: ',@OldValue3)	
			SET @Update = Concat(@User,'Made Some Changes on the Masterfile_District');
			EXEC spAuditTrail_insert 'Masterfile_District','Update',@Update,@OldValue,@NewValue,@UserId;			
		
			
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Employee_BIJLISync]    Script Date: 10/10/2018 9:03:24 PM ******/
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
	@Lastname			VARCHAR(50),
	@Firstname			VARCHAR(50),
	@Middlename			VARCHAR(50),
	@PositionId			INT,
	@EmailAddress		VARCHAR(150),
	@ContactNumber		VARCHAR(15),
	@BranchId			INT,
	@BranchCode			VARCHAR(20),
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
						[Lastname]		= @Lastname,
						[Firstname]	= @Firstname,
						[Middlename]	= @Middlename,
						[EmailAddress] = @EmailAddress,
						[ContactNumber] = @ContactNumber,
						[BranchId]		= @BranchId
					
					WHERE 
						[EmployeeIdNo]			= @EmployeeIdNo;		
				END

			ELSE
				BEGIN
					EXEC spMasterfile_Employee_insert	@EmployeeIdNo,
						@Lastname,@Firstname,@Middlename,@EmailAddress,@ContactNumber,@BranchId,'',@UserID,@BranchCode;
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Employee_delete]    Script Date: 10/10/2018 9:03:24 PM ******/
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
			@User	VARCHAR(250),
			@Delete	VARCHAR(MAX),
			@Employee	VARCHAR(250)
			UPDATE [dbo].[Masterfile_Employee]	 
				SET	
					[Status]	= @_Deleted
				WHERE 
					[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT 'success'	AS 'return_message';
			SET @User = (SELECT CONCAT(Firstname,' ',Lastname) 
			from Masterfile_Employee
			Where Id = @UserId)
			SET @Employee = (SELECT Concat(Firstname,' ',Lastname) From Masterfile_Employee WHERE Id= @Id);	
			SET @Delete = CONCAT(@User,' Deleted ',@Employee,' Employee')
			EXEC spAuditTrail_insert 'Masterfile_Employee','Delete',@Delete,'','',@UserId;
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Employee_deleteall]    Script Date: 10/10/2018 9:03:24 PM ******/
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
CREATE PROCEDURE [dbo].[spMasterfile_Employee_deleteall]
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0,
			@User	VARCHAR(250),
			@Delete	VARCHAR(MAX),
			@Employee	VARCHAR(250)

			UPDATE [dbo].[Masterfile_Employee]	 
			SET	
			[Status]	= @_Deleted;
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Employee_get]    Script Date: 10/10/2018 9:03:24 PM ******/
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
				SELECT me.Id,me.EmployeeIdNo as [Employee Id No.],
					me.Lastname,me.Firstname,me.Middlename ,me.EmailAddress,
					me.ContactNumber,me.BranchId,mb.Name AS Branch,me.Remarks
					from Masterfile_Employee me
					inner join Masterfile_Branch mb
					on me.BranchId =mb.Id  AND mb.[Status] = 1
					where
					me.[Status] = 1
					ORDER BY me.Lastname ASC
			END

			ELSE
				BEGIN
				IF  (@EmployeeId = 0)
				BEGIN

					WITH TempResult AS(
					SELECT me.Id,me.EmployeeIdNo as [Employee Id No.],
					me.Lastname,me.Firstname,me.Middlename,me.EmailAddress,
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
					ORDER BY TempResult.LastName ASC
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;

				END
			
				ELSE
				BEGIN
					WITH TempResult AS(
					SELECT me.Id,me.EmployeeIdNo as [Employee Id No.],
					me.Lastname,me.Firstname,me.Middlename,me.EmailAddress,
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
					ORDER BY TempResult.Lastname ASC
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Employee_getByBranch]    Script Date: 10/10/2018 9:03:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Employee_getByBranch]
	-- Add the parameters for the stored procedure here
	@BranchId BIGINT
AS
	BEGIN
		SELECT EmployeeIdNo, CONCAT(Firstname, ' ', Middlename, ' ', LastName) as 'FullName' FROM dbo.Masterfile_Employee WHERE BranchId = @BranchId;
	END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Employee_getForNotifications]    Script Date: 10/10/2018 9:03:24 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Employee_insert]    Script Date: 10/10/2018 9:03:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Employee_insert "12111","Sophises","aDASD","aDASD","aDASD@gmail.com","0922828",1,"Remarks",2
--=============================
CREATE PROCEDURE [dbo].[spMasterfile_Employee_insert]
	-- Add the parameters for the stored procedure here
	@EmployeeIdNo		VARCHAR(10),
	@Lastname			VARCHAR(50),
	@Firstname			VARCHAR(50),
	@Middlename			VARCHAR(50),
	@EmailAddress		VARCHAR(150),
	@ContactNumber		VARCHAR(15),
	@BranchId			INT,
	@Remarks			VARCHAR(150),
	@UserId				BIGINT,
	@BranchCode			VARCHAR(15)
AS
BEGIN
	BEGIN TRY
		--BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT,
					@_Status			TINYINT  = 1,		-- Default as 1 as describe as 'Active'
					@_BranchId		INT,		-- Default as 1 as describe as 'Active'
					@_User VARCHAR(150),
					@Insert VARCHAR(550),
					@New	VARCHAR(550),
					@Id VARCHAR(250),
					@Branch	VARCHAR(250)
	

			

			IF (EXISTS(SELECT Id FROM [dbo].[Masterfile_Employee] WHERE [EmployeeIdNo] =  @EmployeeIdNo  ))
				BEGIN  	
					SELECT @_BranchId = Id FROM [dbo].[Masterfile_Branch] WHERE Code = @BranchCode;						
					UPDATE [dbo].[Masterfile_Employee]	 
					SET	
						[Lastname]		= @Lastname,
						[Firstname]	    = @Firstname,
						[Middlename]	= @Middlename,
						[EmailAddress]  = @EmailAddress,
						[ContactNumber] = @ContactNumber,
						[Remarks]		= @Remarks,
						[BranchId]		= @_BranchId,
						[Status] = @_Status
					WHERE 
						[EmployeeIdNo]	= @EmployeeIdNo;				
				END

			ELSE
				BEGIN
					SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Masterfile_Employee];
					SELECT @_BranchId = Id FROM [dbo].[Masterfile_Branch] WHERE Code = @BranchCode;	
					INSERT INTO [dbo].[Masterfile_Employee]
						(Id,[EmployeeIdNo],[Lastname],[Firstname],[Middlename]
						,EmailAddress,ContactNumber,BranchId
						,Remarks,[Status])
					VALUES
						(@_Id, @EmployeeIdNo,@Lastname,@Firstname,@Middlename
						,@EmailAddress,@ContactNumber,@_BranchId,@Remarks, @_Status);
					/*

					
					SET @_User =  (SELECT CONCAT(Firstname,' ',Lastname) 
								   from Masterfile_Employee
								   Where Id = @UserId)	

					SET @Insert = Concat(@_User,' Inserted New Employee ',@Firstname,' ',@Middlename,' ',@Lastname);
					SET @Id	= (SELECT Id From Masterfile_Employee WHERE Id= @_Id);
					SET @Branch = (SELECT Name From Masterfile_Branch Where Id =  @BranchId);
					SET @New = CONCAT('Id: ',@Id,', EmployeeIdNo: ',@EmployeeIdNo,', Firstname: ',@Firstname,', Middlename: ',@Middlename,', Lastname: ',@Lastname,', Contact Number: ',@ContactNumber,', Branch: ',@Branch,', Email Address: ',@EmailAddress,', Remarks: ',@Remarks)
					
					EXEC spAuditTrail_insert 'Masterfile_Employee','Insert',@Insert,'',@New,@UserId;	
					*/
				END

		--COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		-- Rollback all transaction happen on this Store Procedure
		--ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_Employee_update]    Script Date: 10/10/2018 9:03:24 PM ******/
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
		DECLARE 
		@OldValue  VARCHAR(MAX),
		@OldValue1 VARCHAR(100) = (SELECT EmployeeIdNo from Masterfile_Employee Where Id=@Id),
		@OldValue2 VARCHAR(100) = (SELECT Firstname from Masterfile_Employee Where Id=@Id),
		@OldValue3 VARCHAR(100) = (SELECT Middlename from Masterfile_Employee Where Id=@Id),
		@OldValue4 VARCHAR(100) = (SELECT Lastname from Masterfile_Employee Where Id=@Id),
		@OldValue5 VARCHAR(100) = (SELECT EmailAddress from Masterfile_Employee Where Id=@Id),
		@OldValue6 VARCHAR(100) = (SELECT ContactNumber from Masterfile_Employee Where Id=@Id),
		@OldValue7 VARCHAR(100) = (SELECT mb.Name from Masterfile_Employee me
									INNER JOIN Masterfile_Branch mb
									ON me.BranchId = mb.Id AND mb.[Status] = 1
								    Where me.Id=@Id),
		@OldValue8 VARCHAR(100) = (SELECT Remarks from Masterfile_Employee Where Id=@Id),
		@_Id	   VARCHAR(100) = (SELECT Id FROM Masterfile_User WHERE Id=@Id),
		@NewValue  VARCHAR(MAX),
		@Update    VARCHAR(MAX),
		@User	   VARCHAR(100),
		@Branch	   VARCHAR(100)
		
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
			SET @User = (SELECT CONCAT(Firstname,' ',Lastname) 
			from Masterfile_Employee
			Where Id = @UserId)
			SET @Branch = (SELECT Name From Masterfile_Branch Where Id =  @BranchId AND [Status] =1);
			SET @NewValue = CONCAT('Id: ',@_Id,', EmployeeIdNo: ',@EmployeeIdNo,', Firstname: ',@Firstname,', Middlename: ',@Middlename,', Lastname: ',@Lastname,', Contact Number: ',@ContactNumber,', Branch: ',@Branch,', Email Address: ',@EmailAddress,', Remarks: ',@Remarks)
			SET @OldValue = CONCAT('Id: ',@_Id,', EmployeeIdNo: ',@OldValue1,', Firstname: ',@OldValue2,', Middlename: ',@OldValue3,', Lastname: ',@OldValue4,', Contact Number: ',@OldValue5,', Branch: ',@OldValue6,', Email Address: ',@OldValue7,', Remarks: ',@OldValue8)
			SET @Update = Concat(@User,'Made Some Changes on the Mastefile_Employee');
			EXEC spAuditTrail_insert 'Masterfile_Employee','Update',@Update,@OldValue,@NewValue,@UserId;			
			
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherDisbursementDetail_delete]    Script Date: 10/10/2018 9:03:24 PM ******/
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
			@User	VARCHAR(250),
			@Delete	VARCHAR(MAX),
			@OtherDisbursement	VARCHAR(250)
			UPDATE [dbo].[Masterfile_OtherDisbursementDetail]	 
				SET	
					[Status]	= @_Deleted
				WHERE 
					[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT 'success'	AS 'return_message';
			SET @User = (SELECT CONCAT(Firstname,' ',Lastname) 
			from Masterfile_Employee
			Where Id = @UserId)
			SET @OtherDisbursement = (SELECT [Description] From Masterfile_OtherDisbursementDetail WHERE Id= @Id);	
			SET @Delete = CONCAT(@User,' Deleted ',@OtherDisbursement,' Employee')
			EXEC spAuditTrail_insert 'Masterfile_OtherDisbursement','Delete',@Delete,'','',@UserId;

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
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherDisbursementDetail_get]    Script Date: 10/10/2018 9:03:24 PM ******/
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
					mo.BranchId,mb.Name AS  'Branch',mo.IsAllBranch AS 'isallbranch',mo.SetUpAmount AS 'Setup Amount',mo.[Day],mo.IsAllWeek AS 'isallweek',mo.ChannelId,mcc.[Description] AS 'Channel',
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
					mo.BranchId,mb.Name AS  'Branch',mo.IsAllBranch AS 'isallbranch',mo.SetUpAmount AS 'Setup Amount',mo.[Day],mo.IsAllWeek AS 'isallweek',mo.ChannelId,mcc.[Description] AS 'Channel',
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
					mo.BranchId,mb.Name AS  'Branch',mo.IsAllBranch AS 'isallbranch',mo.SetUpAmount AS 'Setup Amount',mo.[Day],mo.IsAllWeek AS 'isallweek',mo.ChannelId,mcc.[Description] AS 'Channel',
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherDisbursementDetail_getByBranch]    Script Date: 10/10/2018 9:03:24 PM ******/
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
CREATE PROCEDURE [dbo].[spMasterfile_OtherDisbursementDetail_getByBranch]
	-- Add the parameters for the stored procedure here
	@BranchId INT
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
		SELECT	
			mo.[Id],
			mo.[Description],
			mo.CategoryId,
			mc.[Description] AS 'Category', 
			mo.BranchId,
			mb.Name AS  'Branch',
			mo.IsAllBranch AS 'isallbranch',
			mo.SetUpAmount AS 'Setup Amount',
			mo.[Day],
			mo.IsAllWeek AS 'isallweek',
			mo.ChannelId,
			mcc.[Description] AS 'Channel',
			mo.ChartOfAccountId,
			mca.[Description] AS 'Chart Of Accounts',
			mca.[Code] AS 'ChartOfAccountCode',
			mo.Remarks					 
		FROM 
			Masterfile_OtherDisbursementDetail mo
			LEFT JOIN Masterfile_Category mc		ON mo.CategoryId = mc.Id  AND mc.[Status] = 1
			LEFT JOIN Masterfile_Branch mb			ON mo.BranchId  = mb.Id AND mb.[Status] = 1
			LEFT JOIN Masterfile_Channel mcc		ON mo.ChannelId = mcc.Id AND mcc.[Status] = 1
			LEFT JOIN Masterfile_ChartOfAccount mca ON mo.ChartOfAccountId = mca.Id  AND mca.[Status] = 1 
		WHERE
			mo.BranchId		= @BranchId		AND
			mo.[Status]		= 1				OR
			mo.IsAllBranch	= 1
		ORDER BY 
			mb.[Name] ASC

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
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherDisbursementDetail_insert]    Script Date: 10/10/2018 9:03:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Description>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC	spMasterfile_OtherDisbursementDetail_insert 'Loanings',1,1,1500.00,1,1,5,'',1,1,1
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
	@UserId				BIGINT,
	@IsAllWeek			tinyint,
	@IsAllBranch		tinyint
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT,
					@_Status			TINYINT  = 1,		-- Default as 1 as describe as 'Active'
					@_User VARCHAR(150),
					@Insert VARCHAR(MAX),
					@New	VARCHAR(MAX),
					@Id VARCHAR(250),
					@Branch	VARCHAR(250),
					@Category VARCHAR(250),
					@SetupAmounts VARCHAR(250),
					@ChartOfAccount VARCHAR(250),
					@Channel		VARCHAR(250),
					@Days			VARCHAR(250),
					@IsAllWeeks		VARCHAR(250),
					@IsAllBranches	VARCHAR(250)
					SET @_User =  (SELECT CONCAT(Firstname,' ',Lastname) 
								   from Masterfile_Employee
								   Where Id = @UserId)		


			SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Masterfile_OtherDisbursementDetail];
			IF EXISTS(SELECT Id FROM [dbo].[Masterfile_OtherDisbursementDetail] WHERE [Description] =  @Description AND [Status] = 1)
				BEGIN  							
					SELECT	'duplicate_description'	AS 'return_message';						
				END


			ELSE
				BEGIN
					INSERT INTO [dbo].[Masterfile_OtherDisbursementDetail]
						(Id,[Description],[CategoryId],[BranchId],[SetUpAmount],[ChartOfAccountId]
						,Remarks,[Status],ChannelId,[Day],IsAllWeek,IsAllBranch)
					VALUES
						(@_Id, @Description,@CategoryId,@BranchId,@SetUpAmount,@ChartOfAccountId,@Remarks, @_Status,@ChannelId,@Day,@IsAllWeek,@IsAllBranch);
			
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
							@IsAllWeek				AS 'isallweek',
							@IsAllBranch			AS 'isallbranch',
							'success'				AS 'return_message';	
				SET @Insert = Concat(@_User,' Inserted New Other Disbursement Detail ',@Description);
				SET @Id	= (SELECT Id From Masterfile_Employee WHERE Id= @_Id);
				SET @Branch = (SELECT Name From Masterfile_Branch Where Id =  @BranchId);
				SET @Category = (SELECT [Description] From Masterfile_Category Where Id= @CategoryId);
				SET @Channel = (SELECT [Description] FROM Masterfile_Channel WHERE Id= @ChannelId);
				SET @Day = (SELECT [Day] FROM Masterfile_OtherDisbursementDetail WHERE Id= @_Id);
				SET @SetupAmounts = (SELECT SetUpAmount From Masterfile_OtherDisbursementDetail WHERE Id= @_Id);
				SET @ChartOfAccount = (SELECT [Description] FROM Masterfile_ChartOfAccount WHERE Id= @ChartOfAccountId);
				If(@IsAllWeek = 1)
				BEGIN
				SET @IsAllWeeks = 'Yes';
				END
				Else
				BEGIN
				SET @IsallWeeks = 'No';
				END
				If(@IsAllBranch = 1)
				BEGIN
				SET @IsAllBranches = 'Yes';
				END
				ELSE
				BEGIN
				SET @IsAllBranches = 'No';
				END
				SET @New = CONCAT('Id: ',@Id,', Other Disbursement Detail: ',@Description,', Category: ',@Category,', Branch: ',@Branch,', Channel: ',@Channel,', Day: ',@Days,', Setup Amount: ',@SetupAmounts,',Chart Of Account: ',@ChartOfAccount,', Remarks: ',@Remarks,', Apply To All Week: ',@IsAllWeeks,', Apply to All Branch: ',@IsAllBranches);
				EXEC spAuditTrail_insert 'Masterfile_OtherDisbursementDetail','Insert',@Insert,'',@New,@UserId;	
				
					
						
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherDisbursementDetail_update]    Script Date: 10/10/2018 9:03:24 PM ******/
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
	@UserId			BIGINT,
	@IsAllWeek			tinyint,
	@IsAllBranch		tinyint
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		DECLARE
		@OldValue   VARCHAR(MAX),
		@OldValue1  VARCHAR(100) = (SELECT [Description] from Masterfile_OtherDisbursementDetail Where Id=@Id),
		@OldValue2  VARCHAR(100) = (SELECT mc.[Description] from Masterfile_OtherDisbursementDetail mo
									INNER JOIN Masterfile_Category mc
									ON mo.CategoryId = mc.Id AND mc.[Status] = 1
									Where mo.Id=@Id),
		@OldValue3  VARCHAR(100) = (SELECT mb.Name from Masterfile_OtherDisbursementDetail mo
									INNER JOIN Masterfile_Branch mb
									ON mo.BranchId = mb.Id AND mb.[Status] = 1
								    Where mo.Id=@Id),
		@OldValue4  VARCHAR(100) = (SELECT SetupAmount from Masterfile_OtherDisbursementDetail Where Id=@Id),
		@OldValue5  VARCHAR(100) = (SELECT mca.[Description] from Masterfile_OtherDisbursementDetail mo
									INNER JOIN Masterfile_ChartOfAccount mca
									ON mo.ChartOfAccountId = mca.Id AND mca.[Status] = 1
								    Where mo.Id=@Id),
		@OldValue6  VARCHAR(100) = (SELECT [Day] from Masterfile_OtherDisbursementDetail Where Id=@Id),
		@OldValue7  VARCHAR(100) = (SELECT mch.[Description] from Masterfile_OtherDisbursementDetail mo
								    INNER JOIN Masterfile_Channel mch
									ON mo.ChannelId = mch.Id AND mch.[Status] = 1
									Where mo.Id=@Id),
		@OldValue8  VARCHAR(100) = (SELECT [Remarks] from Masterfile_OtherDisbursementDetail Where Id=@Id),
		@OldValue9  VARCHAR(100) = (SELECT IsAllWeek from Masterfile_OtherDisbursementDetail Where Id=@Id),
		@OldValue10 VARCHAR(100) = (SELECT IsAllBranch from Masterfile_OtherDisbursementDetail Where Id=@Id),
		@_Id	   VARCHAR(100) = (SELECT Id FROM Masterfile_User WHERE Id=@Id),
		@NewValue  VARCHAR(MAX),
		@Update    VARCHAR(MAX),
		@User	   VARCHAR(100),
		@IsAllWeeks VARCHAR(20),
		@IsAllBranches VARCHAR(20),
		@Category VARCHAR(100),
		@ChartOfAccount VARCHAR(100),
		@Branch VARCHAR(100),
		@Channel VARCHAR(100),
		@SetupAmounts VARCHAR(100),
		@Days		VARCHAR(100)
		IF(@OldValue9 = '1')
		BEGIN
		SET @OldValue9= 'Yes';
		END
		ELSE
		BEGIN
		SET @OldValue9='No';
		END
		IF(@OldValue10 = '1')
		BEGIN
		SET @OldValue10= 'Yes';
		END
	
		SET @OldValue10='No';
		
					UPDATE [dbo].[Masterfile_OtherDisbursementDetail]	 
					SET	[Description]		= @Description,
						[CategoryId]		= @CategoryId, 
						
						[BranchId]			= @BranchId,
						[SetUpAmount]		= @SetUpAmount,
						[Day]				= @Day,
						[ChannelId]		= @ChannelId,
						[ChartOfAccountId]  = @ChartOfAccountId,
						[Remarks]			= @Remarks,
						[IsAllWeek]			= @IsAllWeek,
						IsAllBranch			= @IsAllBranch
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
					@IsAllWeek			AS 'isallweek',
					@IsAllBranch		AS 'isallbranch',
					'success'			AS 'return_message';
			SET @User = (SELECT CONCAT(Firstname,' ',Lastname) 
			from Masterfile_Employee
			Where Id = @UserId)
			SET @Branch = (SELECT Name From Masterfile_Branch Where Id =  @BranchId);
			SET @Category = (SELECT [Description] From Masterfile_Category Where Id= @CategoryId);
			SET @Channel = (SELECT [Description] FROM Masterfile_Channel WHERE Id= @ChannelId);
			SET @Days = (SELECT [Day] FROM Masterfile_OtherDisbursementDetail WHERE Id= @_Id);
			SET @SetupAmounts = (SELECT SetUpAmount From Masterfile_OtherDisbursementDetail WHERE Id= @_Id);
			SET @ChartOfAccount = (SELECT [Description] FROM Masterfile_ChartOfAccount WHERE Id= @ChartOfAccountId);
				
			If(@IsAllWeek = 1)
				BEGIN
				SET @IsAllWeeks = 'Yes';
				END
				Else
				BEGIN
				SET @IsallWeeks = 'No';
				END
				If(@IsAllBranch = 1)
				BEGIN
				SET @IsAllBranches = 'Yes';
				END
				ELSE
				BEGIN
				SET @IsAllBranches = 'No';
				END
			SET @Category = (SELECT [Description] FROM Masterfile_Category WHERE Id=@CategoryId);
			SET @NewValue = CONCAT('Id: ',@_Id,', Other Receipt Detail: ',@Description,', Category: ',@Category,', Branch: ',@Branch,', Channel: ',@Channel,', Day: ',@Days,', Setup Amount: ',@SetupAmounts,',Chart Of Account: ',@ChartOfAccount,', Remarks: ',@Remarks,', Apply To All Week: ',@IsAllWeeks,', Apply to All Branch: ',@IsAllBranches);
			SET @NewValue = CONCAT('Id: ',@_Id,', Other Receipt Detail: ',@OldValue1,', Category: ',@OldValue2,', Branch: ',@OldValue3,', Channel: ',@OldValue4,', Day: ',@OldValue5,', Setup Amount: ',@OldValue6,',Chart Of Account: ',@OldValue7,', Remarks: ',@OldValue8,', Apply To All Week: ',@OldValue9,', Apply to All Branch: ',@OldValue10)
			SET @Update = Concat(@User,'Made Some Changes on the Mastefile_OtherDisbursementDetails');
			EXEC spAuditTrail_insert 'Masterfile_OtherDisbursementDetails','Update',@Update,@OldValue,@NewValue,@UserId;			

				
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherReceiptDetail_delete]    Script Date: 10/10/2018 9:03:24 PM ******/
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
			@User	VARCHAR(250),
			@Delete	VARCHAR(MAX),
			@OtherReceipt	VARCHAR(250)
			UPDATE [dbo].[Masterfile_OtherReceiptDetail]	 
				SET	
					[Status]	= @_Deleted
				WHERE 
					[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT 'success'	AS 'return_message';
			SET @User = (SELECT CONCAT(Firstname,' ',Lastname) 
			from Masterfile_Employee
			Where Id = @UserId)
			SET @OtherReceipt = (SELECT [Description] From Masterfile_OtherReceiptDetail WHERE Id= @Id);	
			SET @Delete = CONCAT(@User,' Deleted ',@OtherReceipt,' Employee')
			EXEC spAuditTrail_insert 'Masterfile_OtherReceipt','Delete',@Delete,'','',@UserId;

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
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherReceiptDetail_get]    Script Date: 10/10/2018 9:03:24 PM ******/
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
					mo.BranchId,mb.Name AS  'Branch',mo.IsAllBranch AS 'isallbranch',mo.SetUpAmount AS 'Setup Amount',mo.[Day],mo.IsAllWeek AS 'isallweek',mo.ChannelId,mcc.[Description] AS 'Channel',
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
					mo.BranchId,mb.Name AS  'Branch',mo.IsAllBranch AS 'isallbranch',mo.SetUpAmount AS 'Setup Amount',mo.[Day],mo.IsAllWeek AS 'isallweek',mo.ChannelId,mcc.[Description] AS 'Channel',
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
					mo.BranchId,mb.Name AS  'Branch',mo.IsAllBranch AS 'isallbranch',mo.SetUpAmount AS 'Setup Amount',mo.[Day],mo.IsAllWeek AS 'isallweek',mo.ChannelId,mcc.[Description] AS 'Channel',
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherReceiptDetail_getByBranch]    Script Date: 10/10/2018 9:03:24 PM ******/
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
CREATE PROCEDURE [dbo].[spMasterfile_OtherReceiptDetail_getByBranch]
	-- Add the parameters for the stored procedure here
	@BranchId INT
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			SELECT 
				mo.[Id],
				mo.[Description],
				mo.CategoryId,
				mc.[Description] AS 'Category', 
				mo.BranchId,
				mb.Name AS 'Branch',
				mo.IsAllBranch AS 'isallbranch',
				mo.SetUpAmount AS 'Setup Amount',
				mo.[Day],
				mo.IsAllWeek AS 'isallweek',
				mo.ChannelId,
				mcc.[Description] AS 'Channel',
				mo.ChartOfAccountId AS 'chartofaccountid',
				mca.[Description] AS 'Chart Of Accounts',
				mca.[Code] AS 'ChartOfAccountCode',
				mo.Remarks					 
			FROM
				Masterfile_OtherReceiptDetail mo
				LEFT JOIN Masterfile_Category mc ON mo.CategoryId =mc.Id  AND mc.[Status] = 1
				LEFT JOIN Masterfile_Branch mb ON mo.BranchId  = mb.Id AND mb.[Status] = 1
				LEFT JOIN Masterfile_Channel mcc ON mo.ChannelId = mcc.Id AND mcc.[Status] = 1
				LEFT JOIN Masterfile_ChartOfAccount mca ON mo.ChartOfAccountId = mca.Id  AND mca.[Status] = 1 
			WHERE
				mo.[Status]		= 1				AND 
				mo.BranchId		= @BranchId		OR 
				mo.IsAllBranch	= 1
			ORDER BY 
				mb.[Name] ASC

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
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherReceiptDetail_insert]    Script Date: 10/10/2018 9:03:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Description>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
--  EXEC	spMasterfile_OtherReceiptDetail_insert 'atest',1,1,1500.00,1,1,5,'',1,1,1
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
	@Remarks			VARCHAR(150),
	@UserId				BIGINT,
	@IsAllWeek			tinyint,
	@IsAllBranch		tinyint 

AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT,
					@_Status			TINYINT  = 1,		-- Default as 1 as describe as 'Active'
					@_User VARCHAR(150),
					@Insert VARCHAR(MAX),
					@New	VARCHAR(MAX),
					@Id VARCHAR(250),
					@Branch	VARCHAR(250),
					@Category VARCHAR(250),
					@SetupAmounts VARCHAR(250),
					@ChartOfAccount VARCHAR(250),
					@Channel		VARCHAR(250),
					@Days			VARCHAR(250),
					@IsAllWeeks		VARCHAR(250),
					@IsAllBranches	VARCHAR(250);
					SET @_User =  (SELECT CONCAT(Firstname,' ',Lastname) 
								   from Masterfile_Employee
								   Where Id = @UserId)	;	

	SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Masterfile_OtherReceiptDetail];

					INSERT INTO [dbo].[Masterfile_OtherReceiptDetail]
						(Id,[Description],[CategoryId],[BranchId],[SetUpAmount],[ChartOfAccountId]
						,Remarks,[Status],ChannelId,[Day],[IsAllWeek],IsAllBranch)
					VALUES
						(@_Id, @Description,@CategoryId,@BranchId,@SetUpAmount,@ChartOfAccountId,@Remarks, @_Status,@ChannelId,@Day,@IsAllWeek,@IsAllBranch);
			
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
							@IsAllWeek				AS 'isallweek',
							@IsAllBranch			AS 'isallbranch',
							'success'				AS 'return_message';		
				SET @Insert = Concat(@_User,' Inserted New Other Receipt Detail ',@Description);
				SET @Id	= (SELECT Id From Masterfile_Employee WHERE Id= @_Id);
				SET @Branch = (SELECT Name From Masterfile_Branch Where Id =  @BranchId);
				SET @Category = (SELECT [Description] From Masterfile_Category Where Id= @CategoryId);
				SET @Channel = (SELECT [Description] FROM Masterfile_Channel WHERE Id= @ChannelId);
				SET @Days = (SELECT [Day] FROM Masterfile_OtherReceiptDetail WHERE Id= @_Id);
				SET @SetupAmounts = (SELECT SetUpAmount From Masterfile_OtherReceiptDetail WHERE Id= @_Id);
				SET @ChartOfAccount = (SELECT [Description] FROM Masterfile_ChartOfAccount WHERE Id= @ChartOfAccountId);
				If(@IsAllWeek = 1)
				BEGIN
				SET @IsAllWeeks = 'Yes';
				END
				Else
				BEGIN
				SET @IsallWeeks = 'No';
				END
				If(@IsAllBranch = 1)
				BEGIN
				SET @IsAllBranches = 'Yes';
				END
				ELSE
				BEGIN
				SET @IsAllBranches = 'No';
				END
				SET @New = CONCAT('Id: ',@Id,', Other Receipt Detail: ',@Description,', Category: ',@Category,', Branch: ',@Branch,', Channel: ',@Channel,', Day: ',@Days,', Setup Amount: ',@SetupAmounts,',Chart Of Account: ',@ChartOfAccount,', Remarks: ',@Remarks,', Apply To All Week: ',@IsAllWeeks,', Apply to All Branch: ',@IsAllBranches);
				EXEC spAuditTrail_insert 'Masterfile_OtherReceiptDetail','Insert',@Insert,'',@New,@UserId;	
				
				
	
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherReceiptDetail_update]    Script Date: 10/10/2018 9:03:24 PM ******/
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
	@UserId				BIGINT,
	@IsAllWeek			tinyint,
	@IsAllBranch		tinyint

AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		DECLARE 
		@OldValue   VARCHAR(MAX),
		@OldValue1  VARCHAR(100) = (SELECT [Description] from Masterfile_OtherReceiptDetail Where Id=@Id),
		@OldValue2  VARCHAR(100) = (SELECT mc.[Description] from Masterfile_OtherReceiptDetail mo
									INNER JOIN Masterfile_Category mc
									ON mo.CategoryId = mc.Id AND mc.[Status] = 1
									Where mo.Id=@Id),
		@OldValue3  VARCHAR(100) = (SELECT mb.Name from Masterfile_OtherReceiptDetail mo
									INNER JOIN Masterfile_Branch mb
									ON mo.BranchId = mb.Id AND mb.[Status] = 1
								    Where mo.Id=@Id),
		@OldValue4  VARCHAR(100) = (SELECT SetupAmount from Masterfile_OtherReceiptDetail Where Id=@Id),
		@OldValue5  VARCHAR(100) = (SELECT mca.[Description] from Masterfile_OtherReceiptDetail mo
									INNER JOIN Masterfile_ChartOfAccount mca
									ON mo.ChartOfAccountId = mca.Id AND mca.[Status] = 1
								    Where mo.Id=@Id),
		@OldValue6  VARCHAR(100) = (SELECT [Day] from Masterfile_OtherReceiptDetail Where Id=@Id),
		@OldValue7  VARCHAR(100) = (SELECT mch.[Description] from Masterfile_OtherReceiptDetail mo
								    INNER JOIN Masterfile_Channel mch
									ON mo.ChannelId = mch.Id AND mch.[Status] = 1
									Where mo.Id=@Id),
		@OldValue8  VARCHAR(100) = (SELECT [Remarks] from Masterfile_OtherReceiptDetail Where Id=@Id),
		@OldValue9  VARCHAR(100) = (SELECT IsAllWeek from Masterfile_OtherReceiptDetail Where Id=@Id),
		@OldValue10 VARCHAR(100) = (SELECT IsAllBranch from Masterfile_OtherReceiptDetail Where Id=@Id),
		@_Id	   VARCHAR(100) = (SELECT Id FROM Masterfile_User WHERE Id=@Id),
		@NewValue  VARCHAR(MAX),
		@Update    VARCHAR(MAX),
		@User	   VARCHAR(100),
		@IsAllWeeks VARCHAR(20),
		@IsAllBranches VARCHAR(20),
		@Category VARCHAR(100),
		@ChartOfAccount VARCHAR(100),
		@Branch VARCHAR(100),
		@Channel VARCHAR(100),
		@SetupAmounts VARCHAR(100),
		@Days		VARCHAR(100)
		IF(@OldValue9 = '1')
		BEGIN
		SET @OldValue9= 'Yes';
		END
		ELSE
		BEGIN
		SET @OldValue9='No';
		END
		IF(@OldValue10 = '1')
		BEGIN
		SET @OldValue10= 'Yes';
		END
		ELSE
		BEGIN
		SET @OldValue10='No';
		END

		
					UPDATE [dbo].[Masterfile_OtherReceiptDetail]	 
					SET	[Description]		= @Description,
						[CategoryId]		= @CategoryId, 
						[BranchId]			= @BranchId,
						[SetUpAmount]		= @SetUpAmount,
						[Day]				= @Day,
						[ChannelId]			= @ChannelId,
						[ChartOfAccountId]  = @ChartOfAccountId,
						[Remarks]			= @Remarks,
						IsAllWeek			= @IsAllWeek,
						IsAllBranch			= @IsAllBranch
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
					@IsAllWeek				AS 'isallweek',
					@IsAllBranch			AS 'isallbranch',
					'success'			AS 'return_message';
			SET @User = (SELECT CONCAT(Firstname,' ',Lastname) 
			from Masterfile_Employee
			Where Id = @UserId)
			SET @Branch = (SELECT Name From Masterfile_Branch Where Id =  @BranchId);
			SET @Category = (SELECT [Description] From Masterfile_Category Where Id= @CategoryId);
			SET @Channel = (SELECT [Description] FROM Masterfile_Channel WHERE Id= @ChannelId);
			SET @Days = (SELECT [Day] FROM Masterfile_OtherReceiptDetail WHERE Id= @_Id);
			SET @SetupAmounts = (SELECT SetUpAmount From Masterfile_OtherReceiptDetail WHERE Id= @_Id);
			SET @ChartOfAccount = (SELECT [Description] FROM Masterfile_ChartOfAccount WHERE Id= @ChartOfAccountId);
				
			If(@IsAllWeek = 1)
				BEGIN
				SET @IsAllWeeks = 'Yes';
				END
				Else
				BEGIN
				SET @IsallWeeks = 'No';
				END
				If(@IsAllBranch = 1)
				BEGIN
				SET @IsAllBranches = 'Yes';
				END
				ELSE
				BEGIN
				SET @IsAllBranches = 'No';
				END
			SET @Category = (SELECT [Description] FROM Masterfile_Category WHERE Id=@CategoryId);
			SET @NewValue = CONCAT('Id: ',@_Id,', Other Receipt Detail: ',@Description,', Category: ',@Category,', Branch: ',@Branch,', Channel: ',@Channel,', Day: ',@Days,', Setup Amount: ',@SetupAmounts,',Chart Of Account: ',@ChartOfAccount,', Remarks: ',@Remarks,', Apply To All Week: ',@IsAllWeeks,', Apply to All Branch: ',@IsAllBranches);
			SET @NewValue = CONCAT('Id: ',@_Id,', Other Receipt Detail: ',@OldValue1,', Category: ',@OldValue2,', Branch: ',@OldValue3,', Channel: ',@OldValue4,', Day: ',@OldValue5,', Setup Amount: ',@OldValue6,',Chart Of Account: ',@OldValue7,', Remarks: ',@OldValue8,', Apply To All Week: ',@OldValue9,', Apply to All Branch: ',@OldValue10)
			SET @Update = Concat(@User,'Made Some Changes on the Mastefile_OtherReceiptDetails');
			EXEC spAuditTrail_insert 'Masterfile_OtherReceiptDetails','Update',@Update,@OldValue,@NewValue,@UserId;			
		
				
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Region_delete]    Script Date: 10/10/2018 9:03:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Region_delete 33,2
-- SELECT * from [Masterfile_Region]
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_Region_delete]
	@Id					INT,
	@UserId				BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0,
			@User	VARCHAR(250),
			@Delete	VARCHAR(MAX),
			@Region	VARCHAR(250)
			UPDATE [dbo].[Masterfile_Region]	 
				SET	
					[Status]	= @_Deleted
				WHERE 
					[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT 'success'	AS 'return_message';
			SET @User = (SELECT CONCAT(Firstname,' ',Lastname) 
			from Masterfile_Employee
			Where Id = @UserId)
			SET @Region = (SELECT [Name] From Masterfile_Region WHERE Id= @Id);	
			SET @Delete = CONCAT(@User,' Deleted ',@Region,' Employee')
			EXEC spAuditTrail_insert 'Masterfile_Region','Delete',@Delete,'','',@UserId;

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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Region_get]    Script Date: 10/10/2018 9:03:24 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Region_insert]    Script Date: 10/10/2018 9:03:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- spMasterfile_Region_insert 'Region 15', 'Sample',1
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
					@_Status			TINYINT  = 1,		-- Default as 1 as describe as 'Active'	
					@_User VARCHAR(150),
					@Insert VARCHAR(MAX),
					@New	VARCHAR(MAX),
					@Id VARCHAR(250)
					SET @_User =  (SELECT CONCAT(Firstname,' ',Lastname) 
								   from Masterfile_Employee
								   Where Id = @UserId)	
	
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
				SET @Insert = Concat(@_User,' Inserted New Region "',@Name,'"');
				SET @Id	= (SELECT Id From Masterfile_Region WHERE Id= @_Id);
				SET @New = CONCAT('Id: ',@Id,', Region: ',@Name,', Remarks: ',@Remarks)
				EXEC spAuditTrail_insert 'Masterfile_Region','Insert',@Insert,'',@New,@UserId;	
						
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Region_update]    Script Date: 10/10/2018 9:03:24 PM ******/
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
		DECLARE 
		@OldValue  VARCHAR(MAX),
		@OldValue1 VARCHAR(100) = (SELECT Name from Masterfile_Region Where Id=@Id),
		@OldValue2 VARCHAR(100) = (SELECT Remarks from Masterfile_Region Where Id=@Id),
		@_Id	   VARCHAR(100) = (SELECT Id FROM Masterfile_Region WHERE Id=@Id),
		@NewValue  VARCHAR(MAX),
		@Update    VARCHAR(MAX),
		@User	   VARCHAR(100)
		
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
			SET @User = (SELECT CONCAT(Firstname,' ',Lastname) 
			from Masterfile_Employee
			Where Id = @UserId)
			SET @NewValue = CONCAT('Id: ',@_Id,', Region: ',@Name,', Remarks: ',@Remarks)
			SET @OldValue = CONCAT('Id: ',@_Id,', Region: ',@OldValue1,', Remarks: ',@OldValue2);
			SET @Update = Concat(@User,'Made Some Changes on the Mastefile_Region');
			EXEC spAuditTrail_insert 'Masterfile_Region','Update',@Update,@OldValue,@NewValue,@UserId;			
		
				
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Role_delete]    Script Date: 10/10/2018 9:03:24 PM ******/
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
			@User	VARCHAR(250),
			@Delete	VARCHAR(MAX),
			@Role	VARCHAR(250)
			UPDATE [dbo].[Masterfile_Role]	 
				SET	
					[Status]	= @_Deleted
				WHERE 
					[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT 'success'	AS 'return_message';
			SET @User = (SELECT CONCAT(Firstname,' ',Lastname) 
			from Masterfile_Employee
			Where Id = @UserId)
			SET @Role = (SELECT [Description] From Masterfile_Role WHERE Id= @Id);	
			SET @Delete = CONCAT(@User,' Deleted ',@Role,' Employee')
			EXEC spAuditTrail_insert 'Masterfile_Role','Delete',@Delete,'','',@UserId;
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Role_get]    Script Date: 10/10/2018 9:03:24 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Role_insert]    Script Date: 10/10/2018 9:03:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Description>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Role_insert 'Snatcher','Kusog mo Dagan',1
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
					@_Status			TINYINT  = 1,		-- Default as 1 as describe as 'Active'
					@_User VARCHAR(150),
					@Insert VARCHAR(MAX),
					@New	VARCHAR(MAX),
					@Id VARCHAR(250)
					SET @_User =  (SELECT CONCAT(Firstname,' ',Lastname) 
								   from Masterfile_Employee
								   Where Id = @UserId)	
					
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
				SET @Insert = Concat(@_User,' Inserted New Role ',@Description);
				SET @Id	= (SELECT Id From Masterfile_Role WHERE Id= @_Id);
				SET @New = CONCAT('Id: ',@Id,', Role: ',@Description,', Remarks: ',@Remarks)
				EXEC spAuditTrail_insert 'Masterfile_Role','Insert',@Insert,'',@New,@UserId;	
							
				
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Role_update]    Script Date: 10/10/2018 9:03:24 PM ******/
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
		DECLARE 
		@OldValue  VARCHAR(MAX),
		@OldValue1 VARCHAR(100) = (SELECT [Description] from Masterfile_Role Where Id=@Id),
		@OldValue2 VARCHAR(100) = (SELECT Remarks from Masterfile_Role Where Id=@Id),
		@_Id	   VARCHAR(100) = (SELECT Id FROM Masterfile_User WHERE Id=@Id),
		@NewValue  VARCHAR(MAX),
		@Update    VARCHAR(MAX),
		@User	   VARCHAR(100)
		
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
			SELECT 'success'	AS 'return_message';
			SET @User = (SELECT CONCAT(Firstname,' ',Lastname) 
			from Masterfile_Employee
			Where Id = @UserId)
			SET @NewValue = CONCAT('Id: ',@_Id,', Role: ',@Description,', Remarks: ',@Remarks)
			SET @OldValue = CONCAT('Id: ',@_Id,', Role: ',@OldValue1,', Remarks: ',@OldValue2)
			SET @Update = Concat(@User,'Made Some Changes on the Mastefile_Role');
			EXEC spAuditTrail_insert 'Masterfile_Role','Update',@Update,@OldValue,@NewValue,@UserId;			
	
				
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_SystemRights_get]    Script Date: 10/10/2018 9:03:24 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_SystemRights_insert]    Script Date: 10/10/2018 9:03:24 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_SystemRights_update]    Script Date: 10/10/2018 9:03:24 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_User_Changepass]    Script Date: 10/10/2018 9:03:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Description>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_User_update
-- =============================================
Create PROCEDURE [dbo].[spMasterfile_User_Changepass]
	-- Add the parameters for the stored procedure here
	@Username			VARCHAR(50),
	@Password			VARCHAR(100)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
				UPDATE [dbo].[Masterfile_User]	 
					SET	
					[Password] = @Password
					WHERE 
						[Username]		= @Username;
			
			-- Return Data of the Update
			SELECT	'success'	AS 'return_message';
			
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_User_delete]    Script Date: 10/10/2018 9:03:24 PM ******/
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
		Declare 
			@User	VARCHAR(250),
			@Delete	VARCHAR(MAX),
			@Users	VARCHAR(250)
			UPDATE [dbo].[Masterfile_User]	 
				SET	
					[Status]	= 0
				WHERE 
					[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT 'success'	AS 'return_message';
			SET @User = (SELECT CONCAT(Firstname,' ',Lastname) 
			from Masterfile_Employee
			Where Id = @UserId)
			SET @Users = (SELECT Username From Masterfile_User WHERE Id= @Id);	
			SET @Delete = CONCAT(@User,' Deleted ',@Users,' on Users')
			EXEC spAuditTrail_insert'Masterfile_User','Delete',@Delete,'','',@UserId;

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
/****** Object:  StoredProcedure [dbo].[spMasterfile_User_get]    Script Date: 10/10/2018 9:03:24 PM ******/
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
					SELECT mu.Id,mu.Username,mu.[Password],
					mu.EmployeeId,me.Firstname AS Firstname,me.Middlename AS Middlename,
					me.Lastname AS Lastname,mu.RoleId,mr.[Description] AS [Role],mu.Remarks , mu.[Image] AS 'Image'
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
					SELECT mu.Id,mu.Username,mu.[Password],
					mu.EmployeeId,me.Firstname AS Firstname,me.Middlename AS Middlename,
					me.Lastname AS Lastname,mu.RoleId,mr.[Description] AS [Role],mu.Remarks , mu.[Image] AS 'Image'
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
					SELECT mu.Id,mu.Username,mu.[Password],
					mu.EmployeeId,me.Firstname AS Firstname,me.Middlename AS Middlename,
					me.Lastname AS Lastname,mu.RoleId,mr.[Description] AS [Role],mu.Remarks , mu.[Image] AS 'Image'
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_User_insert]    Script Date: 10/10/2018 9:03:24 PM ******/
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
	@UserId				BIGINT,
	@Image				VARCHAR(MAX),
	@Password			VARCHAR(100)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT,
					@_Status			TINYINT  = 1,		-- Default as 1 as describe as 'Active'
					@_User VARCHAR(150),
					@Insert VARCHAR(MAX),
					@New	VARCHAR(MAX),
					@Id VARCHAR(250),
					@Employee VARCHAR(250),
					@Role	VARCHAR(250)
					SET @_User =  (SELECT CONCAT(Firstname,' ',Lastname) 
								   from Masterfile_Employee
								   Where Id = @UserId)		

			SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Masterfile_User];

			IF EXISTS(SELECT Id FROM [dbo].[Masterfile_User] WHERE Username =  @Username AND [Status] = 1)
				BEGIN  							
					SELECT	'duplicate_username'	AS 'return_message';						
				END

			ELSE
				BEGIN
					INSERT INTO [dbo].[Masterfile_User]
						(Id,Username,EmployeeId,RoleId,Remarks,[Status],[Image],[Password])
					VALUES
						(@_Id, @Username,@EmployeeId, @RoleId,@Remarks, @_Status,@Image,@Password);
			
					-- Return of the Data type
					SELECT 	@_Id					AS 'Id', 
							@Username				AS 'Username',
							@EmployeeId				AS 'EmployeeId',
							@RoleId					AS 'RoleId',
							@Remarks				AS 'Remarks',
							@Image					AS 'Image',
							@Password				AS 'Password',
							'success'					AS 'return_message';		
				SET @Insert = Concat(@_User,' Inserted New User ',@Username);
				SET @Id	= (SELECT Id From Masterfile_User WHERE Id= @_Id);
				SET @Employee = (SELECT CONCAT(Firstname,' ',Middlename,' ',Lastname) FROM Masterfile_Employee WHERE Id = @EmployeeId);
				SET @Role	= (SELECT [Description] FROM Masterfile_Role WHERE Id=  @RoleId);
				SET @New = CONCAT('Id: ',@Id,', Username: ',@Username,', Employee: ',@Employee,', Role: ',@Role,', Remarks: ',@Remarks);
				EXEC spAuditTrail_insert 'Masterfile_User','Insert',@Insert,'',@New,@UserId;	
								
				
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_User_Login]    Script Date: 10/10/2018 9:03:24 PM ******/
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
	--@Password		VARCHAR(100)
AS 

BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			

			SET NOCOUNT ON;	

			-- Validation if the data is match and exist	
			IF EXISTS(SELECT [Id] FROM [Masterfile_User] WHERE [UserName] = @UserName  AND [Status] =  1)
				BEGIN
					SELECT 
					mu.ID	AS 'Id',
						me.[Id]	AS 'EmployeeId',
					me.[BranchId]		AS 'BranchId',
						ma.ID AS 'AreaId',
						md.ID AS 'DistrictId',
						mre.ID AS 'RegionId',
						mr.[Description]						AS 'RoleName',
						mb.Name		AS 'BranchName',
						mb.code,
							CONCAT(me.[FirstName],
								' ',me.[MiddleName],
								' ',me.[LastName])	AS 'Employee Name'	,
						[GmailID]		AS 'GmailId',
						[EmailAddress],
						mu.[Image] AS 'Image',
						'success'			AS 'return_message'	
					FROM 
						[dbo].[Masterfile_Employee] me
							INNER JOIN [dbo].[Masterfile_Branch] mb
						ON me.[BranchId]	= mb.[Id]
							INNER JOIN [dbo].[Masterfile_User] mu 
						ON me.[Id]	= mu.[EmployeeId]
							INNER JOIN [dbo].[Masterfile_Role] mr 
						ON mu.RoleId	= mr.[Id]
						LEFT JOIN Masterfile_Area ma 
					on mb.AreaId =ma.Id  and ma.[Status] = 1
					LEFT JOIN Masterfile_District md
					on ma.DistrictId = md.Id and md.[Status] = 1
					LEFT JOIN Masterfile_Region mre
					on md.RegionId = mre.Id AND mre.[Status] = 1
					WHERE
						[UserName] = @UserName	 AND
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_User_LoginByAD]    Script Date: 10/10/2018 9:03:24 PM ******/
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
						me.[BranchID]		AS 'BranchId',
						mb.Code AS 'Branch Code',
						mb.[Name]		AS 'BranchName',
							CONCAT(me.[FirstName],
								' ',me.[MiddleName],
								' ',me.[LastName])	AS 'EmployeeName'	,
						mu.[Image]				AS 'Image',
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_User_LoginByGmail]    Script Date: 10/10/2018 9:03:24 PM ******/
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
	EXEC [spMasterfile_User_LoginByGmail] 'gery.torrentira@gmail.com',''
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
					mu.ID	AS 'Id',
						[dbo].[Masterfile_Employee].[Id]	AS 'EmployeeId',
						[dbo].[Masterfile_Employee].[BranchId]		AS 'BranchId',
						ma.ID AS 'AreaId',
						md.ID AS 'DistrictId',
						mre.ID AS 'RegionId',
						mr.[Description]						AS 'RoleName',
						mb.Name		AS 'BranchName',
						mb.Code AS 'Branch Code',
							CONCAT([dbo].[Masterfile_Employee].[FirstName],
								' ',[dbo].[Masterfile_Employee].[MiddleName],
								' ',[dbo].[Masterfile_Employee].[LastName])	AS 'Employee Name'	,
						[GmailID]		AS 'GmailId',
						[EmailAddress],
						mu.[Image] AS 'Image',
						'success'			AS 'return_message'	
					FROM 
						[dbo].[Masterfile_Employee] 
							INNER JOIN [dbo].[Masterfile_Branch] mb
						ON [dbo].[Masterfile_Employee].[BranchId]	= mb.[Id]
							INNER JOIN [dbo].[Masterfile_User] mu 
						ON [dbo].[Masterfile_Employee].[Id]	= mu.[EmployeeId]
							INNER JOIN [dbo].[Masterfile_Role] mr 
						ON mu.RoleId	= mr.[Id]
						LEFT JOIN Masterfile_Area ma 
					on mb.AreaId =ma.Id  and ma.[Status] = 1
					LEFT JOIN Masterfile_District md
					on ma.DistrictId = md.Id and md.[Status] = 1
					LEFT JOIN Masterfile_Region mre
					on md.RegionId = mre.Id AND mre.[Status] = 1
					WHERE
					 [EmailAddress] = @EmailAddress		
				END




			-- Else Statement if no data found on the query
			ELSE IF EXISTS(SELECT [Id] FROM [Masterfile_Employee] WHERE [EmailAddress] = @EmailAddress
			 AND [Status] =  1 AND [GmailID] <>'' )
				BEGIN
					SELECT 
					mu.ID	AS 'Id',
						[dbo].[Masterfile_Employee].[Id]	AS 'EmployeeId',
						[dbo].[Masterfile_Employee].[BranchId]		AS 'BranchId',
						ma.ID AS 'AreaId',
						md.ID AS 'DistrictId',
						mre.ID AS 'RegionId',
						mr.[Description]						AS 'RoleName',
						mb.Name		AS 'BranchName',
						mb.Code AS 'Branch Code',
							CONCAT([dbo].[Masterfile_Employee].[FirstName],
								' ',[dbo].[Masterfile_Employee].[MiddleName],
								' ',[dbo].[Masterfile_Employee].[LastName])	AS 'Employee Name'	,
						[GmailID]		AS 'GmailId',
						[EmailAddress],
						'success'			AS 'return_message'	
					FROM 
						[dbo].[Masterfile_Employee] 
							INNER JOIN [dbo].[Masterfile_Branch] mb
						ON [dbo].[Masterfile_Employee].[BranchId]	= mb.[Id]
							INNER JOIN [dbo].[Masterfile_User] mu 
						ON [dbo].[Masterfile_Employee].[Id]	= mu.[EmployeeId]
							INNER JOIN [dbo].[Masterfile_Role] mr 
						ON mu.RoleId	= mr.[Id]
						LEFT JOIN Masterfile_Area ma 
					on mb.AreaId =ma.Id  and ma.[Status] = 1
					LEFT JOIN Masterfile_District md
					on ma.DistrictId = md.Id and md.[Status] = 1
					LEFT JOIN Masterfile_Region mre
					on md.RegionId = mre.Id AND mre.[Status] = 1
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_User_update]    Script Date: 10/10/2018 9:03:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Description>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_User_update
-- =============================================
CREATE PROCEDURE [dbo].[spMasterfile_User_update]
	-- Add the parameters for the stored procedure here
	@Id					INT,
	@Username			VARCHAR(50),
	@EmployeeId			INT,
	@RoleId				INT,
	@Remarks			VARCHAR(150),
	@UserId				BIGINT,
	@Image				VARCHAR(MAX)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		DECLARE 
		@OldValue  VARCHAR(MAX),
		@OldValue1 VARCHAR(100) = (SELECT Username from Masterfile_User Where Id=@Id),
		@OldValue2 VARCHAR(100) = (SELECT EmployeeId from Masterfile_User Where Id=@Id),
		@OldValue3 VARCHAR(100) = (SELECT RoleId from Masterfile_User Where Id=@Id),
		@OldValue4 VARCHAR(100) = (SELECT Remarks from Masterfile_User Where Id=@Id),
		@_Id	   VARCHAR(100) = (SELECT Id FROM Masterfile_User WHERE Id=@Id),
		@NewValue  VARCHAR(MAX),
		@Update    VARCHAR(MAX),
		@User	   VARCHAR(100),
		@Employee  VARCHAR(150),
		@Role	   VARCHAR(200)
		
				UPDATE [dbo].[Masterfile_User]	 
					SET	[Username]		= @Username,
						[EmployeeId] = @EmployeeId,
						[RoleId] = @RoleId,
						[Remarks] = @Remarks,
						[Image]	= @Image
					WHERE 
						[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT	@Id	AS 'Id',
					@Username	AS 'Username',
					@EmployeeId	AS 'EmployeeId',
					@RoleId	AS 'RoleId',
					@Remarks	AS 'Remarks',
					@Image	AS 'Image',
					'success'	AS 'return_message';
			SET @User = (SELECT CONCAT(Firstname,' ',Lastname) 
			from Masterfile_Employee
			Where Id = @UserId)
			SET @Employee =(SELECT CONCAT(Firstname,' ',Lastname) FROM Masterfile_Employee Where Id=@EmployeeId);
			SET @Role = (SELECT [Description] FROM Masterfile_Role WHERE Id=@RoleId);
			SET @NewValue = CONCAT('Id: ',@_Id,', Username: ',@Username,', Employee: ',@Employee,', Role: ',@Role,', Remarks: ',@Remarks);
			SET @OldValue = CONCAT('Id: ',@_Id,', Username: ',@OldValue1,', Employee: ',@OldValue2,', Role: ',@OldValue3,', Remarks: ',@OldValue4);
			SET @Update = Concat(@User,'Made Some Changes on the Mastefile_User');
			EXEC spAuditTrail_insert 'Masterfile_User','Update',@Update,@OldValue,@NewValue,@UserId;			
	
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
/****** Object:  StoredProcedure [dbo].[spReport_BudgetPreparationDetail_get]    Script Date: 10/10/2018 9:03:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Francisco Abayon>
-- Create date: <Oct 10,2018>
-- Description:	Get report per branch based on year and month for budget prperation(forecast or projection)
-- EXEC [spReport_BudgetPreparationDetail_get] 79,2018,10
-- =============================================
CREATE PROCEDURE [dbo].[spReport_BudgetPreparationDetail_get]
	-- Add the parameters for the stored procedure here
	@BranchId		INT,
	@Year			INT,
	@Month			INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE	@_ErrorNumber		INT,   
					@_ErrorSeverity		INT,  
					@_ErrorState		INT,
					@_ErrorProcedure	VARCHAR(150),
					@_ErrorLine			INT;
										
			SELECT DetailId AS 'Id',
					mc.Description AS 'CategoryName',
					TSEmployeeId, 
				CONCAT(Firstname,' ',SUBSTRING(Middlename,1,1),'. ',LastName) AS 'EmployeeName',
				Detail, Qty AS 'Quantity',
				Amount,
				WeekNo,
					CASE WHEN ChannelId = 0
						THEN '' 
						ELSE mch.Description
					END AS 'Channel',				
				tbpd.Week1,
				tbpd.Week2,
				tbpd.Week3,
				tbpd.Week4,
				tbpd.Week5,
				tbpd.Week6,
				tbpd.Total

			FROM Transaction_BudgetPreparationDetail tbpd
					INNER JOIN Transaction_BudgetPreparation tbp
			ON tbpd.BudgetPreparationId = tbp.Id  AND tbpd.[Status] = 1
					INNER JOIN Masterfile_Category mc
			ON mc.id = tbpd.categoryid AND mc.[Status] = 1
					LEFT JOIN Masterfile_Employee me
			ON me.EmployeeIdNo = tbpd.TSEmployeeId 
					LEFT JOIN Masterfile_Channel mch
			ON mch.Id = tbpd.ChannelId 
					INNER JOIN Transaction_BudgetPeriod tbper
			ON tbper.Id = tbp.BudgetPeriodId   
			WHERE tbpd.[Status] = 1 
				AND tbp.BranchId = @BranchId
				AND tbper.[Year] = @Year
				AND tbper.[Month] = @Month

			ORDER BY WeekNo


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
/****** Object:  StoredProcedure [dbo].[spReport_Remco_get]    Script Date: 10/10/2018 9:03:24 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spTransaction]    Script Date: 10/10/2018 9:03:24 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPeriod_close]    Script Date: 10/10/2018 9:03:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC [spTransaction_BudgetPeriod_close] 1,'',1
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
					@_ErrorLine			INT,
					@Close				VARCHAR(100),
					@User				VARCHAR(100),
					@Date				VARCHAR(150),
					@_TotalInflowBudget DECIMAL(16,2),
					@_TotalOutflowBudget DECIMAL(16,2)
					
			IF EXISTS(SELECT Id FROM [Transaction_BudgetPeriod] WHERE Id = @Id  AND [PeriodStatus] = 'Open')
				BEGIN


				-- Sum all the TotalInflowBudget and group by branch based on budgetperiodId
					UPDATE [Transaction_BudgetPreparation] 
					SET TotalInflowBudget = ISNULL(i.TotalInflowBudget,0)
					FROM (
						SELECT tbpd.BudgetPreparationId, SUM(tbpd.Total) AS TotalInflowBudget
						FROM Transaction_BudgetPreparationDetail tbpd
							 INNER JOIN Transaction_BudgetPreparation tbp
							 ON tbpd.BudgetPreparationId = tbp.Id AND tbp.BudgetPeriodId = @Id AND tbpd.[Status] = 1
							 INNER JOIN Masterfile_Category mc
							 ON mc.id = tbpd.categoryid AND mc.[Type] = 'Inflow' AND mc.[Status] = 1
						WHERE tbpd.[Status] = 1
						GROUP BY BudgetPreparationId,TotalInflowBudget
					) i
					WHERE 
						i.BudgetPreparationId = [Transaction_BudgetPreparation].Id


				-- Sum all the TotalOutflowBudget and group by branch based on budgetperiodId
					UPDATE [Transaction_BudgetPreparation] 
					SET TotalOutflowBudget = ISNULL(i.TotalOutflowBudget,0)
					FROM (
						SELECT tbpd.BudgetPreparationId, SUM(tbpd.Total) AS TotalOutflowBudget
						FROM Transaction_BudgetPreparationDetail tbpd
							 INNER JOIN Transaction_BudgetPreparation tbp
							 ON tbpd.BudgetPreparationId = tbp.Id AND tbp.BudgetPeriodId = @Id AND tbpd.[Status] = 1
							 INNER JOIN Masterfile_Category mc
							 ON mc.id = tbpd.categoryid AND mc.[Type] = 'Outflow' AND mc.[Status] = 1
						WHERE tbpd.[Status] = 1
						GROUP BY BudgetPreparationId,TotalOutflowBudget
					) i
					WHERE 
						i.BudgetPreparationId = [Transaction_BudgetPreparation].Id

				SELECT @_TotalInflowBudget = SUM(TotalInflowBudget) 
				FROM Transaction_BudgetPreparation WHERE BudgetPeriodId = @Id ;
				SELECT @_TotalOutflowBudget = SUM(TotalOutflowBudget) 
				FROM Transaction_BudgetPreparation  WHERE BudgetPeriodId = @Id ;


					update [dbo].[Transaction_BudgetPeriod] set
					PeriodStatus = 'Closed',
					DateClosed = GETDATE(),
					ClosedBy = @UserId,
					ClosedRemarks = @ClosedRemarks,
					TotalInflowBudget = @_TotalInflowBudget,
					TotalOutflowBudget = @_TotalOutflowBudget
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
					SET @User = (SELECT CONCAT(Firstname,' ',Lastname) 
								   from Masterfile_Employee
								   Where Id = @UserId);
					SET @Date = (SELECT DateClosed From Transaction_BudgetPeriod WHERE Id= @Id);
					SET @Close = Concat(@User,' Closed Budget Period on',@Date) ;
					EXEC spAuditTrail_insert 'Transaction_BudgetPeriod','Close',@Close,'Open','Closed',@UserId;
 
				
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPeriod_CurrentOpen]    Script Date: 10/10/2018 9:03:24 PM ******/
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
				SELECT TOP 1 Id,[Month],[Year]
				FROM Transaction_BudgetPeriod	
				where
				[Status] = 1
				AND PeriodStatus = 'open'
				ORDER BY PeriodStatus DESC, [Year] DESC, [Month] desc
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPeriod_get]    Script Date: 10/10/2018 9:03:24 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPeriod_getcurrentopen]    Script Date: 10/10/2018 9:03:24 PM ******/
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
				--SELECT * 
				--FROM Transaction_BudgetPeriod	
				--where
				--[Status] = 1 AND PeriodStatus = 'Open';
				SELECT * FROM Transaction_BudgetPeriod WHERE [Status] = 1 ORDER BY Id DESC;
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPeriod_open]    Script Date: 10/10/2018 9:03:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spTransaction_BudgetPeriod_open 12,2018,'Open',1
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
						

			IF EXISTS(SELECT Id FROM [Transaction_BudgetPeriod] WHERE [Year] = @Year AND [Month] = @Month AND [PeriodStatus] = 'Open')
				BEGIN
					SELECT 'budget_period_already_open' AS 'return_message';
				END
			ELSE  IF EXISTS(SELECT [Id] FROM [Transaction_BudgetPeriod] WHERE [Year] = @Year AND [Month] = @Month and [PeriodStatus] = 'Closed')
				BEGIN
					SELECT 'budget_period_already_closed' AS 'return_message';
				END
			ELSE  IF EXISTS(SELECT [Id] FROM [Transaction_BudgetPeriod] WHERE [PeriodStatus] = 'Open')
				BEGIN
					SELECT 'budget_period_has_open' AS 'return_message';
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparation_delete]    Script Date: 10/10/2018 9:03:24 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparation_get]    Script Date: 10/10/2018 9:03:24 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparation_getId]    Script Date: 10/10/2018 9:03:24 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparation_insert]    Script Date: 10/10/2018 9:03:24 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparation_update]    Script Date: 10/10/2018 9:03:24 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationCollections_get]    Script Date: 10/10/2018 9:03:24 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationDetail_delete]    Script Date: 10/10/2018 9:03:24 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationDetail_deleteall]    Script Date: 10/10/2018 9:03:24 PM ******/
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
CREATE PROCEDURE [dbo].[spTransaction_BudgetPreparationDetail_deleteall]
	@BudgetPreparationId	BIGINT,
	@UserId					BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0
			UPDATE [dbo].[Transaction_BudgetPreparationDetail]	 
				SET	
					[Status]	= @_Deleted,
					[Amount]  = @_Deleted,
					Week1  = @_Deleted,
					Week2  = @_Deleted,
					Week3  = @_Deleted,
					Week4  = @_Deleted,
					Week5  = @_Deleted,
					Week6  = @_Deleted,
					Total  = @_Deleted
				WHERE 
					[BudgetPreparationId] = @BudgetPreparationId AND
					CategoryId	!= 2;
						
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationDetail_get]    Script Date: 10/10/2018 9:03:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
/* Description:	<Description,,>
 exec spTransaction_BudgetPreparationDetail_get 1,1
 exec spTransaction_BudgetPreparationDetail_get 1,2
 */
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
			,tbpd.TSEmployeeId,concat(me.Firstname,' ',SUBSTRING(me.Middlename, 1,1),'. ',me.LastName) as 'TS Name',tbpd.Detail,tbpd.Reference,
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
			ORDER BY tbpd.CategoryID, tbpd.TSEmployeeId ASC;
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationDetail_getByBudgePrepRefCatId]    Script Date: 10/10/2018 9:03:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
/* Description:	<Description,,>
 exec spTransaction_BudgetPreparationDetail_get 1,1
 exec spTransaction_BudgetPreparationDetail_get 1,2
 */
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_BudgetPreparationDetail_getByBudgePrepRefCatId]
	-- Add the parameters for the stored procedure here
	@BudgetPreparationId BIGINT,
	@CategoryId	INT,
	@Reference VARCHAR(50),
	@EmployeeId INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Users and its details
			IF (@Reference != '0')
				BEGIN
					SELECT 
						tbpd.DetailId AS 'Id'
					FROM 
						Transaction_BudgetPreparationDetail tbpd
					WHERE
						BudgetPreparationId = @BudgetPreparationId
						AND CategoryId = @CategoryId
						AND Reference = @Reference
				END
			ELSE
				BEGIN
					SELECT TOP(1)
						tbpd.DetailId AS 'Id'
					FROM 
						Transaction_BudgetPreparationDetail tbpd
					WHERE
						BudgetPreparationId = @BudgetPreparationId
						AND CategoryId = @CategoryId
						AND TSEmployeeId = @EmployeeId
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationDetail_insert]    Script Date: 10/10/2018 9:03:24 PM ******/
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
	@DetailId			Bigint,
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
			DECLARE	@_Id				BIGINT,
					@_Status			TINYINT  = 1;

			IF (@CategoryId = 2)
				BEGIN
					IF EXISTS(SELECT DetailId FROM [dbo].[Transaction_BudgetPreparationDetail] WHERE BudgetPreparationId = @BudgetPreparationId AND DetailId = @DetailId)
						BEGIN
							UPDATE [dbo].[Transaction_BudgetPreparationDetail]
							SET 
							Detail = @Detail,
							Reference = @Reference,
							Qty = @Qty,
							Amount = @Amount,
							WeekNo = @WeekNo,
							Week1 = @Week1,
							Week2 = @Week2,
							Week3 = @Week3,
							Week4 = @Week4,
							Week5 = @Week5,
							Week6 = @Week6,
							Total = @Total,
							[Status] = @_Status
							WHERE 
							DetailId = @DetailId;

							set @_Id = @DetailId
						END
					ELSE
						BEGIN
							SELECT @_Id = Isnull(max(DetailId),0) + 1 FROM [dbo].[Transaction_BudgetPreparationDetail];
							INSERT INTO [dbo].[Transaction_BudgetPreparationDetail]
								(DetailId,BudgetPreparationId,[Type],CategoryId,CategoryDescription,
								TSEmployeeId,Detail,Reference,Qty,Amount,WeekNo,ChannelId,Week1,Week2,Week3
								,Week4,Week5,Week6,Total,Remarks,[Status])
							VALUES
								(@_Id,@BudgetPreparationId,@Type,@CategoryId,@CategoryDescription,@TSEmployeeId
								,@Detail,@Reference,@Qty,@Amount,@WeekNo,@ChannelId,@Week1,@Week2,@Week3,@Week4
								,@Week5,@Week6,@Total,@Remarks, @_Status);
						END
				END
			ELSE IF EXISTS(SELECT DetailId FROM [dbo].[Transaction_BudgetPreparationDetail] WHERE BudgetPreparationId = @BudgetPreparationId AND Type= @Type AND CategoryId = @CategoryId AND Detail = @Detail)
				BEGIN
					IF @CategoryId = 1
						BEGIN
							SELECT @_Id = DetailId FROM [dbo].[Transaction_BudgetPreparationDetail] WHERE BudgetPreparationId = @BudgetPreparationId AND Type=1 AND CategoryId = 1 AND Detail = @Detail;
							UPDATE [dbo].[Transaction_BudgetPreparationDetail]
							SET Reference = @Reference,
							Amount = Amount + @Amount,
							Week1 = Week1 + @Week1,
							Week2 = Week2 + @Week2,
							Week3 = Week3 + @Week3,
							Week4 = Week4 + @Week4,
							Week5 = Week5 + @Week5,
							Week6 = Week6 + @Week6,
							Total = Total + @Total,
							Remarks = @Remarks,
							[Status] = @_Status
							WHERE 
							DetailId = @_Id;
						END
					ELSE
						BEGIN
							SELECT @_Id = DetailId FROM [dbo].[Transaction_BudgetPreparationDetail] WHERE BudgetPreparationId = @BudgetPreparationId AND Type = @Type AND CategoryId = @CategoryId AND TSEmployeeId = @TSEmployeeId AND Detail = @Detail;
							UPDATE [dbo].[Transaction_BudgetPreparationDetail]
							SET Reference = @Reference,
							Qty = @Qty,
							Amount = @Amount,
							WeekNo = @WeekNo,
							Week1 = @Week1,
							Week2 = @Week2,
							Week3 = @Week3,
							Week4 = @Week4,
							Week5 = @Week5,
							Week6 = @Week6,
							Total = @Total,
							Remarks = @Remarks,
							[Status] = @_Status
							WHERE 
							DetailId = @_Id;
						END
				END
			ELSE
				BEGIN
					SELECT @_Id = Isnull(max(DetailId),0) + 1 FROM [dbo].[Transaction_BudgetPreparationDetail];
					INSERT INTO [dbo].[Transaction_BudgetPreparationDetail]
						(DetailId,BudgetPreparationId,[Type],CategoryId,CategoryDescription,
						TSEmployeeId,Detail,Reference,Qty,Amount,WeekNo,ChannelId,Week1,Week2,Week3
						,Week4,Week5,Week6,Total,Remarks,[Status])
					VALUES
						(@_Id,@BudgetPreparationId,@Type,@CategoryId,@CategoryDescription,@TSEmployeeId
						,@Detail,@Reference,@Qty,@Amount,@WeekNo,@ChannelId,@Week1,@Week2,@Week3,@Week4
						,@Week5,@Week6,@Total,@Remarks, @_Status);
				END

			SELECT @_Id as 'Id';
							
			
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationDetail_insertTemp]    Script Date: 10/10/2018 9:03:24 PM ******/
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
CREATE PROCEDURE [dbo].[spTransaction_BudgetPreparationDetail_insertTemp]
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
					@matchId			BIGINT,
					@_Status			TINYINT  = 1;		-- Default as 1 as describe as 'Active'

			IF EXISTS(SELECT DetailId FROM [dbo].[Transaction_BudgetPreparationDetail] WHERE BudgetPreparationId = @BudgetPreparationId AND Type= @Type AND CategoryId = @CategoryId AND Detail = @Detail)
				BEGIN
					IF @CategoryId = 1
						BEGIN
							SELECT @matchId = DetailId FROM [dbo].[Transaction_BudgetPreparationDetail] WHERE BudgetPreparationId = @BudgetPreparationId AND Type=1 AND CategoryId = 1 AND Detail = @Detail;
							UPDATE [dbo].[Transaction_BudgetPreparationDetail]
							SET Amount = Amount + @Amount,
							Week1 = Week1 + @Week1,
							Week2 = Week2 + @Week2,
							Week3 = Week3 + @Week3,
							Week4 = Week4 + @Week4,
							Week5 = Week5 + @Week5,
							Week6 = Week6 + @Week6,
							Total = Total + @Total
							WHERE 
							DetailId = @matchId;
						END
					ELSE
						BEGIN
							SELECT @matchId = DetailId FROM [dbo].[Transaction_BudgetPreparationDetail] WHERE BudgetPreparationId = @BudgetPreparationId AND Type = @Type AND CategoryId = @CategoryId AND TSEmployeeId = @TSEmployeeId AND Detail = @Detail;
							UPDATE [dbo].[Transaction_BudgetPreparationDetail]
							SET Qty = @Qty,
							Amount = @Amount,
							WeekNo = @WeekNo,
							Week1 = @Week1,
							Week2 = @Week2,
							Week3 = @Week3,
							Week4 = @Week4,
							Week5 = @Week5,
							Week6 = @Week6,
							Total = @Total
							WHERE 
							DetailId = @matchId;
						END
				END
			ELSE
				BEGIN
					SELECT @_Id = Isnull(max(DetailId),0) + 1 FROM [dbo].[Transaction_BudgetPreparationDetail];
					INSERT INTO [dbo].[Transaction_BudgetPreparationDetail]
						(DetailId,BudgetPreparationId,[Type],CategoryId,CategoryDescription,
						TSEmployeeId,Detail,Reference,Qty,Amount,WeekNo,ChannelId,Week1,Week2,Week3
						,Week4,Week5,Week6,Total,Remarks,[Status])
					VALUES
						(@_Id,@BudgetPreparationId,@Type,@CategoryId,@CategoryDescription,@TSEmployeeId
						,@Detail,@Reference,@Qty,@Amount,@WeekNo,@ChannelId,@Week1,@Week2,@Week3,@Week4
						,@Week5,@Week6,@Total,@Remarks, @_Status);
				END

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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationDetail_update]    Script Date: 10/10/2018 9:03:24 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spTransaction_BudgetPreparationDetailByCategory]    Script Date: 10/10/2018 9:03:24 PM ******/
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
					ORDER BY CategoryId ASC
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
/****** Object:  StoredProcedure [dbo].[spTransaction_CashCardRequest_delete]    Script Date: 10/10/2018 9:03:24 PM ******/
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
Create PROCEDURE [dbo].[spTransaction_CashCardRequest_delete]
	@Id					BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0
			UPDATE [dbo].[Transaction_CashCardRequest]	 
				SET	
					[Status]	= @_Deleted
				WHERE 
					[Id]		= @Id;
		
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
/****** Object:  StoredProcedure [dbo].[spTransaction_CashCardRequest_get]    Script Date: 10/10/2018 9:03:24 PM ******/
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
Create PROCEDURE [dbo].[spTransaction_CashCardRequest_get]
	-- Add the parameters for the stored procedure here
	@BranchId BIGINT,
	@ChartOfAccountId	BIGINT,
	@Date		DATETIME
	
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Regions and its details
				SELECT * from Transaction_CashCardRequest WHERE BranchId = @BranchId 
				AND ChartOfAccountId = @ChartOfAccountId AND [Date] = @Date
			
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
/****** Object:  StoredProcedure [dbo].[spTransaction_CashCardRequest_insert]    Script Date: 10/10/2018 9:03:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Area_insert 'Poblacionsssa',1,'nice',1
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_CashCardRequest_insert]
	-- Add the parameters for the stored procedure here
	@BranchId		 BIGINT,
	@ChartOfAccountId			Bigint,
	@Amount				decimal(10,2),
	@CashCardNumber		Varchar(50),
	@ClientFirstname	VARCHAR(50),
	@ClientMiddlename	VARCHAR(50),
	@ClientLastname		VARCHAR(50),
	@ContactNumber		VARCHAR(20),
	@Address			VARCHAR(150)
AS
BEGIN
	-- Variables starting with _Error is for Try/Catch Statement Set data variables return
	DECLARE	@_Id				BIGINT,
			@_Status			TINYINT  = 1		-- Default as 1 as describe as 'Active'

			;
			(SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Transaction_CashCardRequest]);

			INSERT INTO [dbo].[Transaction_CashCardRequest]
				(Id,BranchId,[Date],ChartOfAccountId,Amount
				,CashCardNumber,ClientFirstname,ClientMiddlename,ClientLastname,ContactNumber
				,[Address],[Status])
			VALUES
				(@_Id, @BranchId,getdate(),@ChartOfAccountId,
				@Amount,@CashCardNumber,@ClientFirstname,@ClientMiddlename,@ClientLastname		
				,@ContactNumber,@Address, @_Status);
				    
	
END
GO
/****** Object:  StoredProcedure [dbo].[spTransaction_CashCardRequest_update]    Script Date: 10/10/2018 9:03:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[spTransaction_CashCardRequest_update]
	-- Add the parameters for the stored procedure here
	@Id					INT,
	@BranchId			BIGINT,
	@ChartOfAccountId	 BIGINT,
	@Date			DATETIME,
	@Amount		Decimal(10,2),
	@CashCardNumber		VARCHAR(50),
	@ClientFirstname	Varchar(50),
	@ClientMiddlename	VARCHAR(50),
	@ClientLastname		VARCHAR(50),
	@ContactNumber		VARCHAR(20),
	@Address			VARCHAR(150)
AS
BEGIN
	BEGIN TRY
	BEGIN TRANSACTION


				UPDATE [dbo].[Transaction_CashCardRequest]	 
					SET	BranchId		= @BranchId,
						ChartOfAccountId	=@ChartOfAccountId,
						[Date]	= @Date,
						Amount = @Amount,
						CashCardNumber = @CashCardNumber,
						ClientFirstname = @ClientFirstname,
						ClientMiddlename = @ClientMiddlename,
						ClientLastname = @ClientLastname,
						ContactNumber = @ContactNumber,
						[Address] = @Address
					WHERE 
						[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT	@Id	AS 'Id',
					@BranchId	AS 'BranchId',
					@ChartOfAccountId AS 'ChartOfAccountCode',
					@Date	AS 'Date',
					@Amount AS 'Amount',
					@CashCardNumber AS 'Cash Card Number',
					@ClientFirstname AS 'ClientFirstname',
					@ClientMiddlename AS 'ClientMiddlename',
					@ClientLastname AS 'ClientLastname',
					@ContactNumber AS 'Contact Number',
					@Address AS 'Address',
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
/****** Object:  StoredProcedure [dbo].[spTransaction_DailyCashFlow_get]    Script Date: 10/10/2018 9:03:24 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spTransaction_DailyCashFlow_getBudget]    Script Date: 10/10/2018 9:03:24 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spTransaction_DailyCashflow_getSetup]    Script Date: 10/10/2018 9:03:24 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spTransaction_DailyCashflow_getSetupDetails]    Script Date: 10/10/2018 9:03:24 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spTransaction_DailyCashFlow_insert]    Script Date: 10/10/2018 9:03:24 PM ******/
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
		@DetailId			BIGINT,
		@Amount				decimal(10,2),
		@UserId				BIGINT
	AS
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION
				-- Variables starting with _Error is for Try/Catch Statement Set data variables return
				DECLARE	@_Id INT;

				IF EXISTS(SELECT Id FROM [dbo].[Transaction_DailyCashFlow] WHERE DetailId = @DetailId AND [Date] = @Date)
					BEGIN
						SELECT @_Id = Id FROM [dbo].[Transaction_DailyCashFlow] WHERE DetailId = @DetailId AND [Date] = @Date;
						UPDATE [dbo].[Transaction_DailyCashFlow]
						SET [Date] = @Date, Amount = @Amount
						WHERE Id = @_Id;
					END
				ELSE
					BEGIN
						SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Transaction_DailyCashFlow];
						INSERT INTO [dbo].[Transaction_DailyCashFlow]
							(Id,[Date],DetailId,Amount)
						VALUES
							(@_Id, @Date,@DetailId,@Amount);
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
/****** Object:  StoredProcedure [dbo].[spTransaction_DailyCashFlow_insertTemp]    Script Date: 10/10/2018 9:03:24 PM ******/
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
	CREATE PROCEDURE [dbo].[spTransaction_DailyCashFlow_insertTemp]
		-- Add the parameters for the stored procedure here
		@Date				Date,
		@DetailId			BIGINT,
		@Amount				decimal(10,2),
		@UserId				BIGINT
	AS
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION
				-- Variables starting with _Error is for Try/Catch Statement Set data variables return
				DECLARE	@_Id INT;

				IF EXISTS(SELECT Id FROM [dbo].[Transaction_DailyCashFlow] WHERE DetailId = @DetailId)
					BEGIN
						SELECT @_Id = Id FROM [dbo].[Transaction_DailyCashFlow] WHERE DetailId = @DetailId;
						UPDATE [dbo].[Transaction_DailyCashFlow]
						SET [Date] = @Date, Amount = @Amount
						WHERE Id = @_Id;
					END
				ELSE
					BEGIN
						SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Transaction_DailyCashFlow];
						INSERT INTO [dbo].[Transaction_DailyCashFlow]
							(Id,[Date],DetailId,Amount)
						VALUES
							(@_Id, @Date,@DetailId,@Amount);
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
/****** Object:  StoredProcedure [dbo].[spTransaction_DailyCashFlow_Open]    Script Date: 10/10/2018 9:03:24 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spTransaction_DailyCashflow_openbySetup]    Script Date: 10/10/2018 9:03:24 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spTransaction_DailyCashFlow_update]    Script Date: 10/10/2018 9:03:24 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spTransaction_DailyCashFlowChannel_delete]    Script Date: 10/10/2018 9:03:24 PM ******/
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
CREATE PROCEDURE [dbo].[spTransaction_DailyCashFlowChannel_delete]
	@Id					INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0;

			UPDATE [dbo].[Transaction_DailyCashFlowChannel]	 
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
/****** Object:  StoredProcedure [dbo].[spTransaction_DailyCashFlowChannel_get]    Script Date: 10/10/2018 9:03:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================= 
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spDailyCashFlowChannel_update 1,'2018-09-11',1,2,'Duterte Bank',2500000,2000000
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_DailyCashFlowChannel_get]
	-- Add the parameters for the stored procedure here
	@Date		DATE,
	@BranchId	BIGINT,
	@ChannelId	BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			SELECT dc.Id,dc.[Date],dc.BranchId,mb.Name AS 'Branch',
			dc.ChannelId,mc.[Description] AS 'Channel',dc.Details AS 'Bank Name',
			dc.Amount,dc.MaintainingBalance AS 'Maintaining Balance'
			FROM Transaction_DailyCashFlowChannel dc
			INNER JOIN Masterfile_Channel mc
			ON dc.ChannelId =  mc.Id
			INNER JOIN Masterfile_Branch mb
			ON dc.BranchId	= mb.Id
			WHERE
			dc.BranchId= @BranchId AND dc.ChannelId = @ChannelId AND dc.[Date] = @Date

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
/****** Object:  StoredProcedure [dbo].[spTransaction_DailyCashFlowChannel_insert]    Script Date: 10/10/2018 9:03:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spDailyCashFlowChannel_insert
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_DailyCashFlowChannel_insert]
	-- Add the parameters for the stored procedure here
	@BranchId	BIGINT,
	@ChannelId	BIGINT,
	@Details	VARCHAR(200),
	@Amount		DECIMAL(10,2),
	@MaintainingBalance DECIMAL(10,2)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			DECLARE	@_Id				INT,
					@_Status			tinyint=1;
					
			SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Transaction_DailyCashFlowChannel];
			INSERT INTO [dbo].[Transaction_DailyCashFlowChannel]
			(Id,[Date],BranchId,ChannelId,Details,Amount,MaintainingBalance,[Status])
			VALUES
			(@_Id,CONVERT(VARCHAR(10),getDate(),110)
			,@BranchId,@ChannelId,@Details,@Amount,@MaintainingBalance,@_Status);
			
			-- Return of the Data type
			SELECT 	@_Id					AS 'Id', 
			CONVERT(VARCHAR(10),getDate(),110) AS 'Date',
					@BranchId				AS 'BranchId',
					@ChannelId				AS 'ChannelId',
					@Details				AS 'Details',
					@Amount					AS 'Amount',
					@MaintainingBalance		AS 'Maintaining Balance',
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
/****** Object:  StoredProcedure [dbo].[spTransaction_DailyCashFlowChannel_update]    Script Date: 10/10/2018 9:03:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spDailyCashFlowChannel_insert 1,2,'Duterte Bank',1500000,1000000
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_DailyCashFlowChannel_update]
	-- Add the parameters for the stored procedure here
	@Id			BIGINT,
	@Date		DATE,
	@BranchId	BIGINT,
	@ChannelId	BIGINT,
	@Details	VARCHAR(200),
	@Amount		DECIMAL(10,2),
	@MaintainingBalance DECIMAL(10,2)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			-- Variables starting with _Error is for Try/Catch Statement Set data variables return
			UPDATE [dbo].[Transaction_DailyCashFlowChannel]	 
					SET	
						[Date]		= @Date,
						[ChannelId] = @ChannelId,
						[Details]	= @Details,
						[Amount]	= @Amount,	
						[MaintainingBalance]	= @MaintainingBalance
					WHERE 
						[Id]		= @Id;
			-- Return of the Data type
			SELECT 	@Id					AS 'Id', 
					@Date					AS 'Date',
					@BranchId				AS 'BranchId',
					@ChannelId				AS 'ChannelId',
					@Details				AS 'Details',
					@Amount					AS 'Amount',
					@MaintainingBalance		AS 'Maintaining Balance',
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
/****** Object:  StoredProcedure [dbo].[spTransaction_RemcoRequest_delete]    Script Date: 10/10/2018 9:03:24 PM ******/
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
Create PROCEDURE [dbo].[spTransaction_RemcoRequest_delete]
	@Id					BIGINT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @_Deleted INT = 0
			UPDATE [dbo].[Transaction_RemcoRequest]	 
				SET	
					[Status]	= @_Deleted
				WHERE 
					[Id]		= @Id;
		
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
/****** Object:  StoredProcedure [dbo].[spTransaction_RemcoRequest_get]    Script Date: 10/10/2018 9:03:24 PM ******/
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
CREATE PROCEDURE [dbo].[spTransaction_RemcoRequest_get]
	-- Add the parameters for the stored procedure here
	@BranchId BIGINT,
	@ChartOfAccountCode	VARCHAR(50),
	@Date		DATETIME
	
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Regions and its details
				SELECT * from Transaction_RemcoRequest WHERE BranchId = @BranchId 
				AND ChartOfAccountCode = @ChartOfAccountCode AND [Date] = @Date
			
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
/****** Object:  StoredProcedure [dbo].[spTransaction_RemcoRequest_insert]    Script Date: 10/10/2018 9:03:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Area_insert 'Poblacionsssa',1,'nice',1
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_RemcoRequest_insert]
	-- Add the parameters for the stored procedure here
	@BranchId		 BIGINT,
	@ChartOfAccountId			Bigint,
	@Amount				decimal(10,2),
	@ClientFirstname	VARCHAR(50),
	@ClientMiddlename	VARCHAR(50),
	@ClientLastname		VARCHAR(50),
	@ContactNumber		VARCHAR(20),
	@Address			VARCHAR(150)
AS
BEGIN
	-- Variables starting with _Error is for Try/Catch Statement Set data variables return
	DECLARE	@_Id				BIGINT,
			@_Status			TINYINT  = 1		-- Default as 1 as describe as 'Active'

			;
			(SELECT @_Id = Isnull(max(Id),0) + 1 FROM [dbo].[Transaction_RemcoRequest]);

			INSERT INTO [dbo].[Transaction_RemcoRequest]
				(Id,BranchId,[Date],ChartOfAccountId,Amount
				,ClientFirstname,ClientMiddlename,ClientLastname,ContactNumber
				,[Address],[Status])
			VALUES
				(@_Id, @BranchId,getdate(),@ChartOfAccountId,
				@Amount,@ClientFirstname,@ClientMiddlename,@ClientLastname		
				,@ContactNumber,@Address, @_Status);
				    
	
END
GO
/****** Object:  StoredProcedure [dbo].[spTransaction_RemcoRequest_update]    Script Date: 10/10/2018 9:03:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spTransaction_RemcoRequest_update]
	-- Add the parameters for the stored procedure here
	@Id					INT,
	@BranchId			BIGINT,
	@ChartOfAccountId	 BIGINT,
	@Date			DATETIME,
	@Amount		Decimal(10,2),
	@ClientFirstname	Varchar(50),
	@ClientMiddlename	VARCHAR(50),
	@ClientLastname		VARCHAR(50),
	@ContactNumber		VARCHAR(20),
	@Address			VARCHAR(150)
AS
BEGIN
	BEGIN TRY
	BEGIN TRANSACTION


				UPDATE [dbo].[Transaction_RemcoRequest]	 
					SET	BranchId		= @BranchId,
						ChartOfAccountId	=@ChartOfAccountId,
						[Date]	= @Date,
						Amount = @Amount,
						ClientFirstname = @ClientFirstname,
						ClientMiddlename = @ClientMiddlename,
						ClientLastname = @ClientLastname,
						ContactNumber = @ContactNumber,
						[Address] = @Address
					WHERE 
						[Id]		= @Id;
			
			-- Return Data of the Update
			SELECT	@Id	AS 'Id',
					@BranchId	AS 'BranchId',
					@ChartOfAccountId AS 'ChartOfAccountCode',
					@Date	AS 'Date',
					@Amount AS 'Amount',
					@ClientFirstname AS 'ClientFirstname',
					@ClientMiddlename AS 'ClientMiddlename',
					@ClientLastname AS 'ClientLastname',
					@ContactNumber AS 'Contact Number',
					@Address AS 'Address',
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
