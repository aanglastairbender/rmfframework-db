USE [master]
GO
/****** Object:  Database [RMF_CMT]    Script Date: 7/26/2018 6:14:59 PM ******/
CREATE DATABASE [RMF_CMT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RMF_CMT', FILENAME = N'G:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\RMF_CMT.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RMF_CMT_log', FILENAME = N'G:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\RMF_CMT_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[Masterfile_AccessRights]    Script Date: 7/26/2018 6:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masterfile_AccessRights](
	[Id] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[SystemRightsId] [int] NOT NULL,
 CONSTRAINT [PK_Masterfile_AccessRights] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masterfile_Area]    Script Date: 7/26/2018 6:15:01 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Masterfile_Area] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masterfile_Branch]    Script Date: 7/26/2018 6:15:01 PM ******/
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
	[Longitude] [decimal](8, 6) NULL,
	[Remarks] [varchar](150) NULL,
	[Status] [tinyint] NOT NULL,
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
/****** Object:  Table [dbo].[Masterfile_Category]    Script Date: 7/26/2018 6:15:01 PM ******/
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
/****** Object:  Table [dbo].[Masterfile_Channel]    Script Date: 7/26/2018 6:15:01 PM ******/
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
/****** Object:  Table [dbo].[Masterfile_ChartOfAccount]    Script Date: 7/26/2018 6:15:02 PM ******/
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
/****** Object:  Table [dbo].[Masterfile_District]    Script Date: 7/26/2018 6:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masterfile_District](
	[Id] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[RegionId] [int] NOT NULL,
	[Remarks] [varchar](150) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Masterfile_District] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masterfile_Employee]    Script Date: 7/26/2018 6:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masterfile_Employee](
	[Id] [int] NOT NULL,
	[EmployeeIdNo] [varchar](10) NOT NULL,
	[Firstname] [varchar](50) NOT NULL,
	[Middlename] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[PositionId] [int] NOT NULL,
	[EmailAddress] [varchar](150) NOT NULL,
	[GmailId] [varchar](100) NOT NULL,
	[ContactNumber] [varchar](15) NOT NULL,
	[BranchId] [int] NOT NULL,
	[Remarks] [varchar](150) NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Masterfile_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masterfile_OtherDisbursementDetail]    Script Date: 7/26/2018 6:15:02 PM ******/
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
 CONSTRAINT [PK_Masterfile_OtherDisbursementDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masterfile_OtherReceiptDetail]    Script Date: 7/26/2018 6:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masterfile_OtherReceiptDetail](
	[Id] [int] NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[BranchId] [int] NOT NULL,
	[SetUpAmount] [decimal](10, 10) NOT NULL,
	[ChartOfAccountId] [int] NOT NULL,
	[Remarks] [varchar](150) NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Masterfile_OtherReceiptDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masterfile_Position]    Script Date: 7/26/2018 6:15:02 PM ******/
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
/****** Object:  Table [dbo].[Masterfile_Region]    Script Date: 7/26/2018 6:15:03 PM ******/
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
/****** Object:  Table [dbo].[Masterfile_Role]    Script Date: 7/26/2018 6:15:03 PM ******/
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
/****** Object:  Table [dbo].[Masterfile_SystemRights]    Script Date: 7/26/2018 6:15:03 PM ******/
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
/****** Object:  Table [dbo].[Masterfile_User]    Script Date: 7/26/2018 6:15:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masterfile_User](
	[Id] [int] NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[RoleId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[Remarks] [varchar](150) NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Masterfile_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Masterfile_Area]  WITH CHECK ADD  CONSTRAINT [FK_Masterfile_Area_Masterfile_District_AreaId] FOREIGN KEY([Id])
REFERENCES [dbo].[Masterfile_District] ([Id])
GO
ALTER TABLE [dbo].[Masterfile_Area] CHECK CONSTRAINT [FK_Masterfile_Area_Masterfile_District_AreaId]
GO
ALTER TABLE [dbo].[Masterfile_Branch]  WITH CHECK ADD  CONSTRAINT [FK_Masterfile_Branch_Masterfile_Area_AreaId] FOREIGN KEY([Id])
REFERENCES [dbo].[Masterfile_Area] ([Id])
GO
ALTER TABLE [dbo].[Masterfile_Branch] CHECK CONSTRAINT [FK_Masterfile_Branch_Masterfile_Area_AreaId]
GO
/****** Object:  StoredProcedure [dbo].[spMasterfile_AccessRights_get]    Script Date: 7/26/2018 6:15:03 PM ******/
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
	@AccessRightsId		INT	= 0,
	@PageNumber		INT = 1,
	@RowsPage 		INT = 10
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active AccessRightss and its details
			IF  (@AccessRightsId = 0)
				BEGIN
					SELECT ma.Id,ma.RoleId,mr.[Description] AS [Role],ma.SystemRightsId
					,ms.Module  AS Rights
					from Masterfile_AccessRights ma
					left join Masterfile_Role mr 
					on ma.RoleId =mr.Id 
					left join Masterfile_SystemRights ms
					on ma.SystemRightsId = ms.Id
					ORDER BY ma.Id
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;
				END
			ELSE
				BEGIN
					SELECT ma.Id,ma.RoleId,mr.[Description] AS [Role],ma.SystemRightsId
					,ms.Module  AS Rights
					from Masterfile_AccessRights ma
					left join Masterfile_Role mr 
					on ma.RoleId =mr.Id 
					left join Masterfile_SystemRights ms
					on ma.SystemRightsId = ms.Id
					where
					ma.Id = @AccessRightsId;
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Area_get]    Script Date: 7/26/2018 6:15:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Region_get
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
					SELECT ma.Id,ma.Name,ma.DistrictId,md.Name as District,ma.Remarks from Masterfile_Area ma
					left join Masterfile_District md
					on ma.DistrictId = md.Id
					where
					ma.[Status] = 1 ORDER BY ma.Name
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;
				END
			ELSE
				BEGIN
					SELECT ma.Id,ma.Name,ma.DistrictId,md.Name as District,ma.Remarks from Masterfile_Area ma
					left join Masterfile_District md
					on ma.DistrictId = md.Id
					where
					ma.[Status] = 1 and ma.Id = @AreaId;
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Branch_get]    Script Date: 7/26/2018 6:15:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Branch_get
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
					SELECT mb.Id,mb.Name,mb.AreaId,ma.Name AS Area,mb.[Address],
					mb.Latitude,mb.Longitude,mb.Remarks 
					from Masterfile_Branch mb
					left join Masterfile_Area ma 
					on mb.AreaId =ma.Id 
					where
					mb.[Status] = 1 ORDER BY mb.Name
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;
				END
			ELSE
				BEGIN
					SELECT mb.Id,mb.Name,mb.AreaId,ma.Name AS Area,mb.[Address],
					mb.Latitude,mb.Longitude,mb.Remarks 
					from Masterfile_Branch mb
					left join Masterfile_Area ma 
					on mb.AreaId =ma.Id 
					where
					mb.[Status] = 1 and mb.Id = @BranchId;
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Category_get]    Script Date: 7/26/2018 6:15:03 PM ******/
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
					SELECT Id,[Description],[Type],Remarks from Masterfile_Category
					where
					[Status] = 1  ORDER BY [Description]
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;
				END
			ELSE
				BEGIN
					SELECT Id,[Description],[Type],Remarks from Masterfile_Category
					where
					[Status] = 1 and Id = @CategoryId;
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Channel_get]    Script Date: 7/26/2018 6:15:03 PM ******/
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
					SELECT Id,[Description],Remarks from Masterfile_Channel
					where
					[Status] = 1  ORDER BY [Description]
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;
				END
			ELSE
				BEGIN
					SELECT Id,[Description],Remarks from Masterfile_Channel
					where
					[Status] = 1 and Id = @ChannelId;
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_ChartOfAccount_get]    Script Date: 7/26/2018 6:15:03 PM ******/
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
					SELECT Id,Code,[Description],Remarks from Masterfile_ChartOfAccount
					where 
					[Status] = 1 ORDER BY [Description]
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;
				END
			ELSE
				BEGIN
					SELECT Id,Code,[Description],Remarks from Masterfile_ChartOfAccount
					where 
					[Status] = 1 and Id = @ChartOfAccountId;
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_District_get]    Script Date: 7/26/2018 6:15:03 PM ******/
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
					SELECT md.Id,md.Name,md.RegionId,mr.Name AS Region,md.Remarks from Masterfile_District md
					left join Masterfile_Region mr 
					on md.RegionId =mr.Id and mr.[Status] = 1
					where
					md.[Status] = 1 ORDER BY md.Name
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;
				END
			ELSE
				BEGIN
					SELECT md.Id,md.Name,md.RegionId,mr.Name AS Region,md.Remarks from Masterfile_District md
					left join Masterfile_Region mr 
					on md.RegionId =mr.Id and mr.[Status] = 1
					where
					md.[Status] = 1 and md.Id = @DistrictId;
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Employee_get]    Script Date: 7/26/2018 6:15:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Employee_get
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
					SELECT me.Id,me.EmployeeIdNo as [Employee Id No.],me.Firstname,me.Middlename,
					me.Lastname,me.PositionId,mp.[Description] AS Position,me.EmailAddress,
					me.GmailId,me.ContactNumber,me.BranchId,mb.Name AS Branch,me.Remarks
					from Masterfile_Employee me
					left join Masterfile_Branch mb
					on me.BranchId =mb.Id 
					left join Masterfile_Position mp
					on me.PositionId = mp.Id
					where
					me.[Status] = 1 ORDER BY me.Firstname
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;
				END
			ELSE
				BEGIN
					SELECT me.Id,me.EmployeeIdNo as [Employee Id No.],me.Firstname,me.Middlename,
					me.Lastname,me.PositionId,mp.[Description] AS Position,me.EmailAddress,
					me.GmailId,me.ContactNumber,me.BranchId,mb.Name AS Branch,me.Remarks
					from Masterfile_Employee me
					left join Masterfile_Branch mb
					on me.BranchId =mb.Id 
					left join Masterfile_Position mp
					on me.PositionId = mp.Id
					where
					me.[Status] = 1 and me.Id = @EmployeeId;
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherDisbursementDetail_get]    Script Date: 7/26/2018 6:15:03 PM ******/
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
					SELECT md.Id,md.[Description],md.CategoryId,mc.Id AS 'Category',
					md.BranchId,mb.Id AS  'Branch',md.SetUpAmount,md.ChartOfAccountId ,
					md.Remarks					 
					from Masterfile_OtherDisbursementDetail md
					left join Masterfile_Category mc 
					on md.CategoryId =mc.Id 
					left join Masterfile_Branch mb
					on md.BranchId  = mb.Id
					where
					md.[Status] = 1  ORDER BY [Description]
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;
				END
			ELSE
				BEGIN
					SELECT md.Id,md.[Description],md.CategoryId,mc.Id AS 'Category',
					md.BranchId,mb.Id AS  'Branch',md.SetUpAmount,md.ChartOfAccountId ,
					md.Remarks					 
					from Masterfile_OtherDisbursementDetail md
					left join Masterfile_Category mc 
					on md.CategoryId =mc.Id 
					left join Masterfile_Branch mb
					on md.BranchId  = mb.Id
					where
					md.[Status] = 1 AND md.[Id] = @OtherDisbursementDetailId;
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_OtherReceiptDetail_get]    Script Date: 7/26/2018 6:15:03 PM ******/
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
					SELECT mo.Id,mo.[Description],mo.CategoryId,mc.Id AS 'Category',
					mo.BranchId,mb.Id AS  'Branch',mo.SetUpAmount,mo.ChartOfAccountId ,
					mo.Remarks					 
					from Masterfile_OtherReceiptDetail mo
					left join Masterfile_Category mc 
					on mo.CategoryId =mc.Id 
					left join Masterfile_Branch mb
					on mo.BranchId  = mb.Id
					where
					mo.[Status] = 1  ORDER BY [Description]
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;
				END
			ELSE
				BEGIN
					SELECT mo.Id,mo.[Description],mo.CategoryId,mc.Id AS 'Category',
					mo.BranchId,mb.Id AS  'Branch',mo.SetUpAmount,mo.ChartOfAccountId ,
					mo.Remarks					 
					from Masterfile_OtherReceiptDetail mo
					left join Masterfile_Category mc 
					on mo.CategoryId =mc.Id 
					left join Masterfile_Branch mb
					on mo.BranchId  = mb.Id
					where
					mo.[Status] = 1 AND mo.[Id] = @OtherReceiptDetailId;
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Position_get]    Script Date: 7/26/2018 6:15:03 PM ******/
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
					SELECT Id,Code,[Description],Remarks from Masterfile_Position
					where 
					[Status] = 1 ORDER BY [Description]
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;
				END
			ELSE
				BEGIN
					SELECT Id,Code,[Description],Remarks from Masterfile_Position
					where 
					[Status] = 1 and Id = @PositionId;
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Region_delete]    Script Date: 7/26/2018 6:15:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Region_get]    Script Date: 7/26/2018 6:15:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC spMasterfile_Region_get
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
					SELECT Id,Name,Remarks from Masterfile_Region
					where 
					[Status] = 1 ORDER BY Name
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;
				END
			ELSE
				BEGIN
					SELECT Id,Name,Remarks from Masterfile_Region
					where
					[Status] = 1 and Id = @RegionId;
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Region_insert]    Script Date: 7/26/2018 6:15:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Region_update]    Script Date: 7/26/2018 6:15:03 PM ******/
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
			SELECT	@Id,
					@Name,
					@Remarks,
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_Role_get]    Script Date: 7/26/2018 6:15:03 PM ******/
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
					SELECT Id,[Description],Remarks from Masterfile_Role
					where
					[Status] = 1  ORDER BY [Description]
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;
				END
			ELSE
				BEGIN
					SELECT Id,[Description],Remarks from Masterfile_Role
					where
					[Status] = 1 and Id = @RoleId;
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_SystemRights_get]    Script Date: 7/26/2018 6:15:03 PM ******/
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
					SELECT Id,[Module],[Page],PageSeqNo,Rights,RightsSeqNo
					from Masterfile_SystemRights
					 ORDER BY PageSeqNo,RightsSeqNo
					OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;
				END
			ELSE
				BEGIN
					SELECT Id,[Module],[Page],PageSeqNo,Rights,RightsSeqNo
					from Masterfile_SystemRights
					where
					Id = @SystemRightsId;
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
/****** Object:  StoredProcedure [dbo].[spMasterfile_User_get]    Script Date: 7/26/2018 6:15:03 PM ******/
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
	@PageNumuer		INT = 1,
	@RowsPage 		INT = 10
	
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION			
			-- Get list of Active Users and its details
			IF  (@UserId = 0)
				BEGIN
					SELECT mu.Id,mu.[Password],mu.Username,
					mu.RoleId,mr.[Description] AS [Role],mu.EmployeeId,me.Firstname AS Firstname,me.Middlename AS Middlename,
					me.Lastname AS Lastname,mu.Remarks 
					from Masterfile_User mu
					left join Masterfile_Role mr 
					on mu.RoleId =mr.Id 
					left join Masterfile_Employe me
					on mu.EmployeeId = me.Id
					where
					mu.[Status] = 1 ORDER BY mu.Name
					OFFSET ((@PageNumuer - 1) * @RowsPage) ROWS
					FETCH NEXT @RowsPage ROWS ONLY;
				END
			ELSE
				BEGIN
					SELECT mu.Id,mu.[Password],mu.Username,
					mu.RoleId,mr.[Description] AS [Role],mu.EmployeeId,me.Firstname AS Firstname,me.Middlename AS Middlename,
					me.Lastname AS Lastname,mu.Remarks 
					from Masterfile_User mu
					left join Masterfile_Role mr 
					on mu.RoleId =mr.Id 
					left join Masterfile_Employe me
					on mu.EmployeeId = me.Id
					where
					mu.[Status] = 1 and mu.Id = @UserId;
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
USE [master]
GO
ALTER DATABASE [RMF_CMT] SET  READ_WRITE 
GO
