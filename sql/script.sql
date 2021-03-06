EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'Spayce'
GO
USE [master]
GO
ALTER DATABASE [Spayce] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
USE [master]
GO
/****** Object:  Database [Spayce]    Script Date: 02/21/2016 11:05:28 ******/
DROP DATABASE [Spayce]
GO


USE [master]
GO
/****** Object:  Database [Spayce]    Script Date: 02/22/2016 15:26:41 ******/
CREATE DATABASE [Spayce] ON  PRIMARY 
( NAME = N'Spayce', FILENAME = N'C:\MSSQL\Data\Spayce.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Spayce_log', FILENAME = N'C:\MSSQL\Log\Spayce_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Spayce] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Spayce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Spayce] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Spayce] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Spayce] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Spayce] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Spayce] SET ARITHABORT OFF
GO
ALTER DATABASE [Spayce] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Spayce] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Spayce] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Spayce] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Spayce] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Spayce] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Spayce] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Spayce] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Spayce] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Spayce] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Spayce] SET  DISABLE_BROKER
GO
ALTER DATABASE [Spayce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Spayce] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Spayce] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Spayce] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Spayce] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Spayce] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Spayce] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Spayce] SET  READ_WRITE
GO
ALTER DATABASE [Spayce] SET RECOVERY FULL
GO
ALTER DATABASE [Spayce] SET  MULTI_USER
GO
ALTER DATABASE [Spayce] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Spayce] SET DB_CHAINING OFF
GO
USE [Spayce]
GO
/****** Object:  Schema [setup]    Script Date: 02/22/2016 15:26:41 ******/
CREATE SCHEMA [setup] AUTHORIZATION [dbo]
GO
/****** Object:  Schema [campaign]    Script Date: 02/22/2016 15:26:41 ******/
CREATE SCHEMA [campaign] AUTHORIZATION [dbo]
GO
/****** Object:  Schema [behavior]    Script Date: 02/22/2016 15:26:41 ******/
CREATE SCHEMA [behavior] AUTHORIZATION [dbo]
GO
/****** Object:  Table [dbo].[UserConnection]    Script Date: 02/22/2016 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserConnection](
      [UserId] [nvarchar](255) NOT NULL,
      [ProviderId] [nvarchar](255) NOT NULL,
      [ProviderUserId] [nvarchar](50) NOT NULL,
      [Rank] [int] NOT NULL,
      [DisplayName] [nvarchar](255) NULL,
      [ProfileUrl] [nvarchar](512) NULL,
      [ImageUrl] [nvarchar](512) NULL,
      [AccessToken] [nvarchar](255) NOT NULL,
      [Secret] [nvarchar](255) NULL,
      [RefreshToken] [nvarchar](255) NULL,
      [ExpireTime] [bigint] NULL,
 CONSTRAINT [PK_UserConnection] PRIMARY KEY CLUSTERED 
(
      [UserId] ASC,
      [ProviderId] ASC,
      [ProviderUserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [setup].[TeaserTemplate]    Script Date: 02/22/2016 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [setup].[TeaserTemplate](
      [Id] [bigint] IDENTITY(1,1) NOT NULL,
      [CreateOn] [datetime2](7) NOT NULL,
      [UpdateOn] [datetime2](7) NOT NULL,
      [Version] [int] NOT NULL,
      [Title] [nvarchar](100) NOT NULL,
      [Media] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_TeaserTemplate] PRIMARY KEY CLUSTERED 
(
      [Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [setup].[Segment]    Script Date: 02/22/2016 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[Segment](
      [Id] [bigint] IDENTITY(1,1) NOT NULL,
      [CreateOn] [datetime2](7) NOT NULL,
      [UpdateOn] [datetime2](7) NOT NULL,
      [Version] [int] NOT NULL,
      [Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Segment] PRIMARY KEY CLUSTERED 
(
      [Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [setup].[Account]    Script Date: 02/22/2016 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[Account](
      [Id] [bigint] IDENTITY(1,1) NOT NULL,
      [CreateOn] [datetime2](7) NOT NULL,
      [UpdateOn] [datetime2](7) NOT NULL,
      [Version] [bigint] NOT NULL,
      [Name] [nvarchar](100) NOT NULL,
      [Email] [nvarchar](100) NOT NULL,
      [Password] [nvarchar](150) NOT NULL,
      [AutenticationType] [nchar](15) NOT NULL,
      [Identifier] [nvarchar](50) NOT NULL,
      [Image] [image] NULL,
      [Cellphone] [nvarchar](20) NOT NULL,
      [BirthDate] [date] NULL,
      [Active] [bit] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
      [Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UK_Account_Email] ON [setup].[Account] 
(
      [Email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UK_Account_Identifier] ON [setup].[Account] 
(
      [Identifier] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [behavior].[Behavior]    Script Date: 02/22/2016 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [behavior].[Behavior](
      [Id] [bigint] IDENTITY(1,1) NOT NULL,
      [CreateOn] [datetime2](7) NOT NULL,
      [UpdateOn] [datetime2](7) NOT NULL,
      [Version] [int] NOT NULL,
      [Account] [bigint] NOT NULL,
      [BehaviorType] [nchar](15) NOT NULL,
      [SourceType] [nchar](15) NOT NULL,
      [SourceKey] [bigint] NOT NULL,
 CONSTRAINT [PK_Liked] PRIMARY KEY CLUSTERED 
(
      [Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Behavior_SourceType_SourceKey] ON [behavior].[Behavior] 
(
      [SourceType] ASC,
      [SourceKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [setup].[Merchant]    Script Date: 02/22/2016 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[Merchant](
      [Id] [bigint] IDENTITY(1,1) NOT NULL,
      [CreateOn] [datetime2](7) NOT NULL,
      [UpdateOn] [datetime2](7) NOT NULL,
      [Version] [int] NULL,
      [Identifier] [nvarchar](50) NOT NULL,
      [Name] [nvarchar](100) NOT NULL,
      [Image] [image] NULL,
      [Segment] [bigint] NOT NULL,
 CONSTRAINT [PK_Merchant] PRIMARY KEY CLUSTERED 
(
      [Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UK_Merchant_Identifier] ON [setup].[Merchant] 
(
      [Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [setup].[PaymentProfile]    Script Date: 02/22/2016 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[PaymentProfile](
      [Id] [bigint] IDENTITY(1,1) NOT NULL,
      [CreateOn] [datetime2](7) NOT NULL,
      [UpdateOn] [datetime2](7) NOT NULL,
      [Version] [int] NOT NULL,
      [PaymentGateway] [nchar](15) NOT NULL,
      [CardName] [nvarchar](50) NULL,
      [CardBanner] [nvarchar](50) NULL,
      [Token] [nvarchar](255) NOT NULL,
      [Account] [bigint] NOT NULL,
 CONSTRAINT [PK_PaymentProfile] PRIMARY KEY CLUSTERED 
(
      [Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [setup].[Tag]    Script Date: 02/22/2016 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[Tag](
      [Id] [bigint] IDENTITY(1,1) NOT NULL,
      [CreateOn] [datetime2](7) NOT NULL,
      [UpdateOn] [datetime2](7) NOT NULL,
      [Version] [int] NOT NULL,
      [Name] [nvarchar](100) NOT NULL,
      [TagType] [nchar](10) NOT NULL,
      [Attribute] [nvarchar](100) NOT NULL,
      [Internal] [bit] NOT NULL,
      [Target] [bit] NOT NULL,
      [Trigger] [bit] NOT NULL,
      [Script] [bit] NOT NULL,
      [Merchant] [bigint] NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
      [Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [setup].[MerchantAccount]    Script Date: 02/22/2016 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[MerchantAccount](
      [Id] [bigint] IDENTITY(1,1) NOT NULL,
      [CreateOn] [datetime2](7) NOT NULL,
      [UpdateOn] [datetime2](7) NOT NULL,
      [Version] [int] NOT NULL,
      [Merchant] [bigint] NOT NULL,
      [Account] [bigint] NOT NULL,
      [Administrator] [bit] NOT NULL,
 CONSTRAINT [PK_MerchantAccount] PRIMARY KEY CLUSTERED 
(
      [Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [setup].[Category]    Script Date: 02/22/2016 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[Category](
      [Id] [bigint] IDENTITY(1,1) NOT NULL,
      [CreateOn] [datetime2](7) NOT NULL,
      [UpdateOn] [datetime2](7) NOT NULL,
      [Version] [int] NOT NULL,
      [Name] [nvarchar](100) NOT NULL,
      [Merchant] [bigint] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
      [Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [campaign].[Campaign]    Script Date: 02/22/2016 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [campaign].[Campaign](
      [Id] [bigint] IDENTITY(1,1) NOT NULL,
      [CreateOn] [datetime2](7) NOT NULL,
      [UpdateOn] [datetime2](7) NOT NULL,
      [Version] [int] NOT NULL,
      [Name] [nvarchar](100) NOT NULL,
      [StartDate] [datetime2](7) NOT NULL,
      [ExpirationDate] [datetime2](7) NOT NULL,
      [StatusType] [nchar](10) NOT NULL,
      [Merchant] [bigint] NOT NULL,
 CONSTRAINT [PK_Campaign] PRIMARY KEY CLUSTERED 
(
      [Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [setup].[BillingAddress]    Script Date: 02/22/2016 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[BillingAddress](
      [Id] [bigint] IDENTITY(1,1) NOT NULL,
      [CreateOn] [datetime2](7) NOT NULL,
      [UpdateOn] [datetime2](7) NOT NULL,
      [Version] [int] NOT NULL,
      [Name] [nvarchar](50) NOT NULL,
      [Street] [nvarchar](100) NOT NULL,
      [Number] [nvarchar](20) NOT NULL,
      [District] [nvarchar](100) NOT NULL,
      [City] [nvarchar](100) NOT NULL,
      [State] [nvarchar](50) NOT NULL,
      [Country] [nvarchar](100) NOT NULL,
      [ZipCode] [nchar](10) NOT NULL,
      [Complement] [nvarchar](100) NOT NULL,
      [PaymentProfile] [bigint] NOT NULL,
 CONSTRAINT [PK_BillingAddress] PRIMARY KEY CLUSTERED 
(
      [Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [setup].[Item]    Script Date: 02/22/2016 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[Item](
      [Id] [bigint] IDENTITY(1,1) NOT NULL,
      [CreateOn] [datetime2](7) NOT NULL,
      [UpdateOn] [datetime2](7) NOT NULL,
      [Version] [int] NOT NULL,
      [Name] [nvarchar](50) NOT NULL,
      [Description] [nvarchar](500) NOT NULL,
      [Price] [money] NOT NULL,
      [Code] [nvarchar](50) NOT NULL,
      [Category] [bigint] NOT NULL,
      [Merchant] [bigint] NOT NULL,
      [Active] [bit] NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
      [Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [setup].[PaymentMeans]    Script Date: 02/22/2016 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[PaymentMeans](
      [Id] [bigint] IDENTITY(1,1) NOT NULL,
      [CreateOn] [datetime2](7) NOT NULL,
      [UpdateOn] [datetime2](7) NOT NULL,
      [Version] [int] NOT NULL,
      [PaymentMeansType] [nchar](15) NOT NULL,
      [Merchant] [bigint] NOT NULL,
 CONSTRAINT [PK_PaymentMeans] PRIMARY KEY CLUSTERED 
(
      [Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [campaign].[Element]    Script Date: 02/22/2016 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [campaign].[Element](
      [Id] [bigint] IDENTITY(1,1) NOT NULL,
      [CreateOn] [datetime2](7) NOT NULL,
      [UpdateOn] [datetime2](7) NOT NULL,
      [Version] [int] NOT NULL,
      [Campaign] [bigint] NOT NULL,
      [Tag] [bigint] NOT NULL,
      [ElementType] [nchar](15) NOT NULL,
 CONSTRAINT [PK_Element] PRIMARY KEY CLUSTERED 
(
      [Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] 
GO
/****** Object:  Table [campaign].[Teaser]    Script Date: 02/22/2016 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [campaign].[Teaser](
      [Id] [bigint] IDENTITY(1,1) NOT NULL,
      [CreteOn] [datetime2](7) NOT NULL,
      [UpdateOn] [datetime2](7) NOT NULL,
      [Version] [int] NOT NULL,
      [Title] [nvarchar](100) NOT NULL,
      [Media] [varbinary](max) NOT NULL,
      [TeaserTemplate] [bigint] NULL,
      [Campaign] [bigint] NOT NULL,
 CONSTRAINT [PK_Teaser] PRIMARY KEY CLUSTERED 
(
      [Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [setup].[PaymentTerms]    Script Date: 02/22/2016 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [setup].[PaymentTerms](
      [Id] [bigint] IDENTITY(1,1) NOT NULL,
      [CreateOn] [datetime2](7) NULL,
      [UpdateOn] [datetime2](7) NULL,
      [Version] [int] NULL,
      [Installment] [int] NULL,
      [Percentage] [float] NULL,
      [PaymentMeans] [bigint] NULL,
 CONSTRAINT [PK_PaymentTerms] PRIMARY KEY CLUSTERED 
(
      [Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [campaign].[ElementValue]    Script Date: 02/22/2016 15:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [campaign].[ElementValue](
      [Id] [bigint] IDENTITY(1,1) NOT NULL,
      [CreateOn] [datetime2](7) NOT NULL,
      [UpdateOn] [datetime2](7) NOT NULL,
      [Version] [int] NOT NULL,
      [KeyType] [nvarchar](50) NOT NULL,
      [ValueType] [nvarchar](50) NOT NULL,
      [Value] [nvarchar](100) NOT NULL,
      [Element] [bigint] NOT NULL,
 CONSTRAINT [PK_ElementValue] PRIMARY KEY CLUSTERED 
(
      [Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ElementValue_Element_key] ON [campaign].[ElementValue] 
(
      [Element] ASC,
      [KeyType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Default [DF_Account_Active]    Script Date: 02/22/2016 15:26:42 ******/
ALTER TABLE [setup].[Account] ADD  CONSTRAINT [DF_Account_Active]  DEFAULT ((0)) FOR [Active]
GO
/****** Object:  Default [DF_MerchantAccount_Administrator]    Script Date: 02/22/2016 15:26:42 ******/
ALTER TABLE [setup].[MerchantAccount] ADD  CONSTRAINT [DF_MerchantAccount_Administrator]  DEFAULT ((0)) FOR [Administrator]
GO
/****** Object:  Default [DF_Item_Active]    Script Date: 02/22/2016 15:26:42 ******/
ALTER TABLE [setup].[Item] ADD  CONSTRAINT [DF_Item_Active]  DEFAULT ((0)) FOR [Active]
GO
/****** Object:  ForeignKey [FK_Liked_Account]    Script Date: 02/22/2016 15:26:42 ******/
ALTER TABLE [behavior].[Behavior]  WITH CHECK ADD  CONSTRAINT [FK_Liked_Account] FOREIGN KEY([Account])
REFERENCES [setup].[Account] ([Id])
GO
ALTER TABLE [behavior].[Behavior] CHECK CONSTRAINT [FK_Liked_Account]
GO
/****** Object:  ForeignKey [FK_Merchant_Segment]    Script Date: 02/22/2016 15:26:42 ******/
ALTER TABLE [setup].[Merchant]  WITH CHECK ADD  CONSTRAINT [FK_Merchant_Segment] FOREIGN KEY([Segment])
REFERENCES [setup].[Segment] ([Id])
GO
ALTER TABLE [setup].[Merchant] CHECK CONSTRAINT [FK_Merchant_Segment]
GO
/****** Object:  ForeignKey [FK_PaymentMeans_Account]    Script Date: 02/22/2016 15:26:42 ******/
ALTER TABLE [setup].[PaymentProfile]  WITH CHECK ADD  CONSTRAINT [FK_PaymentMeans_Account] FOREIGN KEY([Account])
REFERENCES [setup].[Account] ([Id])
GO
ALTER TABLE [setup].[PaymentProfile] CHECK CONSTRAINT [FK_PaymentMeans_Account]
GO
/****** Object:  ForeignKey [FK_Merchant_Tag]    Script Date: 02/22/2016 15:26:42 ******/
ALTER TABLE [setup].[Tag]  WITH CHECK ADD  CONSTRAINT [FK_Merchant_Tag] FOREIGN KEY([Merchant])
REFERENCES [setup].[Merchant] ([Id])
GO
ALTER TABLE [setup].[Tag] CHECK CONSTRAINT [FK_Merchant_Tag]
GO
/****** Object:  ForeignKey [FK_MerchantAccount_Account]    Script Date: 02/22/2016 15:26:42 ******/
ALTER TABLE [setup].[MerchantAccount]  WITH CHECK ADD  CONSTRAINT [FK_MerchantAccount_Account] FOREIGN KEY([Account])
REFERENCES [setup].[Account] ([Id])
GO
ALTER TABLE [setup].[MerchantAccount] CHECK CONSTRAINT [FK_MerchantAccount_Account]
GO
/****** Object:  ForeignKey [FK_MerchantAccount_Merchant]    Script Date: 02/22/2016 15:26:42 ******/
ALTER TABLE [setup].[MerchantAccount]  WITH CHECK ADD  CONSTRAINT [FK_MerchantAccount_Merchant] FOREIGN KEY([Merchant])
REFERENCES [setup].[Merchant] ([Id])
GO
ALTER TABLE [setup].[MerchantAccount] CHECK CONSTRAINT [FK_MerchantAccount_Merchant]
GO
/****** Object:  ForeignKey [FK_Category_Merchant]    Script Date: 02/22/2016 15:26:42 ******/
ALTER TABLE [setup].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Merchant] FOREIGN KEY([Merchant])
REFERENCES [setup].[Merchant] ([Id])
GO
ALTER TABLE [setup].[Category] CHECK CONSTRAINT [FK_Category_Merchant]
GO
/****** Object:  ForeignKey [FK_Campaign_Merchant]    Script Date: 02/22/2016 15:26:42 ******/
ALTER TABLE [campaign].[Campaign]  WITH CHECK ADD  CONSTRAINT [FK_Campaign_Merchant] FOREIGN KEY([Merchant])
REFERENCES [setup].[Merchant] ([Id])
GO
ALTER TABLE [campaign].[Campaign] CHECK CONSTRAINT [FK_Campaign_Merchant]
GO
/****** Object:  ForeignKey [FK_BillingAddress_PaymentProfile]    Script Date: 02/22/2016 15:26:42 ******/
ALTER TABLE [setup].[BillingAddress]  WITH CHECK ADD  CONSTRAINT [FK_BillingAddress_PaymentProfile] FOREIGN KEY([PaymentProfile])
REFERENCES [setup].[PaymentProfile] ([Id])
GO
ALTER TABLE [setup].[BillingAddress] CHECK CONSTRAINT [FK_BillingAddress_PaymentProfile]
GO
/****** Object:  ForeignKey [FK_Item_Category]    Script Date: 02/22/2016 15:26:42 ******/
ALTER TABLE [setup].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Category] FOREIGN KEY([Category])
REFERENCES [setup].[Category] ([Id])
GO
ALTER TABLE [setup].[Item] CHECK CONSTRAINT [FK_Item_Category]
GO
/****** Object:  ForeignKey [FK_Item_Merchant]    Script Date: 02/22/2016 15:26:42 ******/
ALTER TABLE [setup].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Merchant] FOREIGN KEY([Merchant])
REFERENCES [setup].[Merchant] ([Id])
GO
ALTER TABLE [setup].[Item] CHECK CONSTRAINT [FK_Item_Merchant]
GO
/****** Object:  ForeignKey [FK_Item_Merchant1]    Script Date: 02/22/2016 15:26:42 ******/
ALTER TABLE [setup].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Merchant1] FOREIGN KEY([Merchant])
REFERENCES [setup].[Merchant] ([Id])
GO
ALTER TABLE [setup].[Item] CHECK CONSTRAINT [FK_Item_Merchant1]
GO
/****** Object:  ForeignKey [FK_PaymentMeans_MerchantAccount]    Script Date: 02/22/2016 15:26:42 ******/
ALTER TABLE [setup].[PaymentMeans]  WITH CHECK ADD  CONSTRAINT [FK_PaymentMeans_MerchantAccount] FOREIGN KEY([Merchant])
REFERENCES [setup].[MerchantAccount] ([Id])
GO
ALTER TABLE [setup].[PaymentMeans] CHECK CONSTRAINT [FK_PaymentMeans_MerchantAccount]
GO
/****** Object:  ForeignKey [FK_Element_Campaign]    Script Date: 02/22/2016 15:26:42 ******/
ALTER TABLE [campaign].[Element]  WITH CHECK ADD  CONSTRAINT [FK_Element_Campaign] FOREIGN KEY([Campaign])
REFERENCES [campaign].[Campaign] ([Id])
GO
ALTER TABLE [campaign].[Element] CHECK CONSTRAINT [FK_Element_Campaign]
GO
/****** Object:  ForeignKey [FK_Element_Tag]    Script Date: 02/22/2016 15:26:42 ******/
ALTER TABLE [campaign].[Element]  WITH CHECK ADD  CONSTRAINT [FK_Element_Tag] FOREIGN KEY([Tag])
REFERENCES [setup].[Tag] ([Id])
GO
ALTER TABLE [campaign].[Element] CHECK CONSTRAINT [FK_Element_Tag]
GO
/****** Object:  ForeignKey [FK_Teaser_Campaign]    Script Date: 02/22/2016 15:26:42 ******/
ALTER TABLE [campaign].[Teaser]  WITH CHECK ADD  CONSTRAINT [FK_Teaser_Campaign] FOREIGN KEY([Campaign])
REFERENCES [campaign].[Campaign] ([Id])
GO
ALTER TABLE [campaign].[Teaser] CHECK CONSTRAINT [FK_Teaser_Campaign]
GO
/****** Object:  ForeignKey [FK_Teaser_TeaserTemplate]    Script Date: 02/22/2016 15:26:42 ******/
ALTER TABLE [campaign].[Teaser]  WITH CHECK ADD  CONSTRAINT [FK_Teaser_TeaserTemplate] FOREIGN KEY([TeaserTemplate])
REFERENCES [setup].[TeaserTemplate] ([Id])
GO
ALTER TABLE [campaign].[Teaser] CHECK CONSTRAINT [FK_Teaser_TeaserTemplate]
GO
/****** Object:  ForeignKey [FK_PaymentTerms_PaymentMeans]    Script Date: 02/22/2016 15:26:42 ******/
ALTER TABLE [setup].[PaymentTerms]  WITH CHECK ADD  CONSTRAINT [FK_PaymentTerms_PaymentMeans] FOREIGN KEY([PaymentMeans])
REFERENCES [setup].[PaymentMeans] ([Id])
GO
ALTER TABLE [setup].[PaymentTerms] CHECK CONSTRAINT [FK_PaymentTerms_PaymentMeans]
GO
/****** Object:  ForeignKey [FK_ElementValue_Element]    Script Date: 02/22/2016 15:26:42 ******/
ALTER TABLE [campaign].[ElementValue]  WITH CHECK ADD  CONSTRAINT [FK_ElementValue_Element] FOREIGN KEY([Element])
REFERENCES [campaign].[Element] ([Id])
GO
ALTER TABLE [campaign].[ElementValue] CHECK CONSTRAINT [FK_ElementValue_Element]
GO

USE [Spayce]
GO

/****** Goal: generate a data sampler ******/

INSERT INTO [setup].[Account] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Root', 'root@spayce.com.br', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'SPAYCE', '77407172749', NULL, '554499191551', '2016-04-01', 1)
INSERT INTO [setup].[Account] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Everton Gomede', 'evertongomede@gmail.com', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'GOOGLE', '02529756937', NULL, '554499660874', '1980-06-20', 1)
INSERT INTO [setup].[Account] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Leandro Nakanishi', 'leandronakanishi@gmail.com', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'GOOGLE', '24523328366', NULL, '554488050955', '1980-06-20', 1)
INSERT INTO [setup].[Account] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Carlos Teixeira', 'cabteix@hotmail.com', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'FACEBOOK', '16244318447', NULL, '554499604578', '1980-06-20', 1)

INSERT INTO [setup].[PaymentProfile] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'AYDEN', 'Cartão Visa Prerencial', 'VISA', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 1)
INSERT INTO [setup].[PaymentProfile] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'AYDEN', 'Cartão Master Prerencial', 'MASTER', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 2)

INSERT INTO [setup].[BillingAddress] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Escritório', 'Rua Quebec', 'Montreal', '392', 'Marigá', 'Paraná', 'Brasil', '87020000', 'Sobre Loja 2', 1)
INSERT INTO [setup].[BillingAddress] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Escritório', 'Av. Pedro Taques', 'Zona 07', '294', 'Marigá', 'Paraná', 'Brasil', '87020000', 'Sobre Loja 2', 2)

INSERT INTO [setup].[Segment] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Transporte Aéreo')
INSERT INTO [setup].[Segment] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Loja de Departamento')

INSERT INTO [setup].[Merchant] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, '68815335000100', 'Azul Linhas Aéreas Brasileiras S/A', NULL, 1)
INSERT INTO [setup].[Merchant] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, '35544761000199', 'Casas Bahia', NULL, 2)

INSERT INTO [setup].[MerchantAccount] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 1, 1, 0)
INSERT INTO [setup].[MerchantAccount] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 1, 2, 0)

INSERT INTO [setup].[PaymentMeans] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'VISA', 1)
INSERT INTO [setup].[PaymentMeans] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'MASTER', 1)

INSERT INTO [setup].[PaymentTerms] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 1, 0.00, 1)
INSERT INTO [setup].[PaymentTerms] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 2, 0.00, 1)
INSERT INTO [setup].[PaymentTerms] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 3, 0.00, 1)
INSERT INTO [setup].[PaymentTerms] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 4, 0.50, 1)
INSERT INTO [setup].[PaymentTerms] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 5, 0.79, 1)
INSERT INTO [setup].[PaymentTerms] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 6, 1.10, 1)

INSERT INTO [setup].[Category] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Celulares', 2)
INSERT INTO [setup].[Category] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Eletrodomésticos', 2)
INSERT INTO [setup].[Category] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Seguros', 1)

INSERT INTO [setup].[Item] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Smartphone Samsung Galaxy', 'Smartphone Samsung Galaxy J5 Duos Dourado com Dual chip, Tela 5.0", 4G, Câmera 13MP, Android 5.1 e Processador Quad Core de 1.2 Ghz', 997.00, '5904203', 1, 2, 1)
INSERT INTO [setup].[Item] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Lavadora de Roupas Electrolux', 'Lavadora de Roupas Electrolux 13 kg Alta Capacidade LT13B - Branca', 1398.60, '4168904', 2, 2, 1)
INSERT INTO [setup].[Item] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Seguro Viagem', 'Seguro Viagem', 20.00, '1234567', 3, 1, 1)

INSERT INTO [campaign].[Campaign] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Fim de Semana Visa', '2016-02-01', '2016-02-28', 'NEW', 1)

INSERT INTO [behavior].[Behavior] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 2, 'LIKE', 'CAMPAIGN', '1')
INSERT INTO [behavior].[Behavior] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 2, 'FOLLOW', 'CAMPAIGN', '1')
INSERT INTO [behavior].[Behavior] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 4, 'FOLLOW', 'CAMPAIGN', '1')

INSERT INTO [setup].[Tag] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Solicitação de pagamento', 'INTERNAL', 'NA', 1, 0, 1, 0, NULL)

INSERT INTO [setup].[Tag] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Aprovação de pagamento', 'INTERNAL', 'NA', 1, 0, 1, 0, NULL)
INSERT INTO [setup].[Tag] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Abandono de diálogo', 'INTERNAL', 'NA', 1, 1, 1, 0, NULL)
INSERT INTO [setup].[Tag] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Abandono de pagamento', 'INTERNAL', 'NA', 1, 1, 1, 0, NULL)
INSERT INTO [setup].[Tag] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Escolha de opção de diálogo', 'INTERNAL', 'NA', 1, 1, 0, 0, NULL)
INSERT INTO [setup].[Tag] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Valor do pagamento', 'INTERNAL', 'NA', 1, 1, 0, 0, NULL)
INSERT INTO [setup].[Tag] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Meio de pagamento', 'INTERNAL', 'NA', 1, 0, 1, 3, NULL)
INSERT INTO [setup].[Tag] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Meio de pagamento escolhido', 'INTERNAL', 'NA', 1, 1, 0, 0, NULL)
INSERT INTO [setup].[Tag] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Número de parcelas', 'INTERNAL', 'NA', 1, 0, 0, 1, NULL)
INSERT INTO [setup].[Tag] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Número de parcelas escolhido', 'INTERNAL', 'NA', 1, 1, 0, 0, NULL)
INSERT INTO [setup].[Tag] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Voucher', 'INTERNAL', 'NA', 1, 0, 0, 1, NULL)
INSERT INTO [setup].[Tag] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Voucher utilizado', 'INTERNAL', 'NA', 1, 1, 0, 0, NULL)
INSERT INTO [setup].[Tag] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Promo code', 'INTERNAL', 'NA', 1, 0, 0, 1, NULL)
INSERT INTO [setup].[Tag] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Promo code utilizado', 'INTERNAL', 'NA', 1, 0, 0, 1, NULL)
INSERT INTO [setup].[Tag] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Like de deal', 'INTERNAL', 'NA', 1, 1, 1, 0, NULL)
INSERT INTO [setup].[Tag] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Publicação de deal no Facebook', 'INTERNAL', 'NA', 1, 1, 1, 0, NULL)
INSERT INTO [setup].[Tag] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Encaminhamento de deal no Whatsapp', 'INTERNAL', 'NA', 1, 1, 1, 0, NULL)
INSERT INTO [setup].[Tag] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Encaminhamento de deal no Messenger', 'INTERNAL', 'NA', 1, 1, 1, 0, NULL)
INSERT INTO [setup].[Tag] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Entrada numa área', 'INTERNAL', 'NA', 1, 1, 1, 0, NULL)
INSERT INTO [setup].[Tag] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Saída duma área', 'INTERNAL', 'NA', 1, 1, 1, 0, NULL)

INSERT INTO [setup].[Tag] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Portadores de cartão Visa Platinum', 'ENUM', 'NA', 0, 1, 0, 0, 1)
INSERT INTO [setup].[Tag] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Compra com Ticket Médio', 'DOMAIN', 'Table.Column', 0, 1, 0, 0, 1)
INSERT INTO [setup].[Tag] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Aniversariantes', 'DOMAIN', 'Table.Column', 0, 1, 0, 0, 1)
INSERT INTO [setup].[Tag] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Quantidade Comprada', 'DOMAIN', 'Table.Column', 0, 1, 0, 0, 1)
INSERT INTO [setup].[Tag] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Destino', 'DOMAIN', 'Table.Column', 0, 1, 0, 0, 1)

INSERT INTO [setup].[Tag] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Avisar 2 dias depois da compra', 'DOMAIN', 'Table.Column', 0, 0, 1, 0, 1)
INSERT INTO [setup].[Tag] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Quando o usuário estiver no raio de alcance', 'MAP', 'NA', 0, 0, 1, 0, 1)
INSERT INTO [setup].[Tag] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Seguro Viagem', 'QUESTION', 'NA', 0, 0, 1, 0, 1)
INSERT INTO [setup].[Tag] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Recusa de Oferta', 'QUESTION', 'NA', 0, 0, 1, 0, 1)

INSERT INTO [setup].[Tag] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Olá! Feliz Aniversário', 'INFO', 'NA', 0, 0, 0, 1, 1)
INSERT INTO [setup].[Tag] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Gostaria de receber mais informações sobre este produto?', 'QUESTION', 'NA', 0, 0, 0, 1, 1)
INSERT INTO [setup].[Tag] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Quer incluir seguro viagem?', 'QUESTION', 'NA', 0, 0, 0, 1, 1)
INSERT INTO [setup].[Tag] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Meios de Pagamento', 'ENUM', 'NA', 0, 0, 0, 1, 1)

INSERT INTO [campaign].[Element] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 1, 21, 'TARGET')
INSERT INTO [campaign].[ElementValue] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'cartao', 'string', 'visa platinum', 1)

INSERT INTO [campaign].[Element] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 1, 22, 'TARGET')
INSERT INTO [campaign].[ElementValue] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'valorMinimo', 'float', '100.00', 2)
INSERT INTO [campaign].[ElementValue] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'valorMaximo', 'float', '200.00', 2)

INSERT INTO [campaign].[Element] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 1, 23, 'TARGET')
INSERT INTO [campaign].[ElementValue] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'dataInicial', 'date', '2016-02-01', 3)
INSERT INTO [campaign].[ElementValue] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'dataFinal', 'date', '2016-02-28', 3)

INSERT INTO [campaign].[Element] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 1, 24, 'TARGET')
INSERT INTO [campaign].[ElementValue] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'quantidadeMinima', 'int', '01', 4)
INSERT INTO [campaign].[ElementValue] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'quantidadeMaxima', 'int', '150', 4)

INSERT INTO [campaign].[Element] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 1, 25, 'TARGET')
INSERT INTO [campaign].[ElementValue] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'localidade', 'array', 'MGA, USA, MYA', 5)

INSERT INTO [campaign].[Element] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 1, 26, 'TRIGGER')
INSERT INTO [campaign].[ElementValue] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'quantidadeDias', 'int', '2', 6)
INSERT INTO [campaign].[ElementValue] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'quantidadeHoras', 'int', '0', 6)
INSERT INTO [campaign].[ElementValue] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'quantidadeMinutos', 'int', '0', 6)

INSERT INTO [campaign].[Element] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 1, 27, 'TRIGGER')
INSERT INTO [campaign].[ElementValue] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'geolocalizacao', 'float', '1.2659898989', 7)
INSERT INTO [campaign].[ElementValue] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'raio', 'int', '50', 7)
INSERT INTO [campaign].[ElementValue] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'unidade', 'string', 'm', 7)

INSERT INTO [campaign].[Element] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 1, 28, 'TRIGGER')
INSERT INTO [campaign].[ElementValue] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'incluirSeguroViagem', 'boolean', 'true', 8)

INSERT INTO [campaign].[Element] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 1, 29, 'TRIGGER')
INSERT INTO [campaign].[ElementValue] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'mensagem', 'string', 'Gostaria de adquirir este produto?', 9)
INSERT INTO [campaign].[ElementValue] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'quantidadeDias', 'int', '1', 9)

INSERT INTO [campaign].[Element] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 1, 30, 'SCRIPT')
INSERT INTO [campaign].[ElementValue] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'mensagem', 'string', 'Feliz Aniversário', 10)

INSERT INTO [campaign].[Element] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 1, 31, 'SCRIPT')
INSERT INTO [campaign].[ElementValue] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'mensagem', 'string', 'Gostaria de receber mais informações sobre este produto?', 11)

INSERT INTO [campaign].[Element] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 1, 32, 'SCRIPT')
INSERT INTO [campaign].[ElementValue] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'mensagem', 'string', 'Quer incluir seguro viagem?', 12)

INSERT INTO [campaign].[Element] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 1, 33, 'SCRIPT')
INSERT INTO [campaign].[ElementValue] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'formaPagamento', 'array', 'DEBITO, CREDITO', 13)
INSERT INTO [campaign].[ElementValue] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'meiosPagamento', 'string', 'VISA, MASTER, AMEX', 13)

INSERT INTO [campaign].[Teaser] VALUES ('2016-04-01 00:01:00', '2016-04-01 00:01:00', 0, 'Teaser - Fim de Semana Visa', CONVERT(VARBINARY(MAX), 'ProjetoSpayce'), NULL, 1)

--(1) Quais sao os usuario com suas preferencias de pagamento + endereco de cobranca?
SELECT 
      a.[Identifier],
      a.[Name], 
      a.[Email], 
      a.[Cellphone], 
      a.[AutenticationType], 
      CAST((DATEDIFF(DD, a.[BirthDate], GETDATE())/365.25) AS INT) AS Age,
      b.[CardName],
      b.[CardBanner],
      b.[PaymentGateway],
      c.[Name],
      c.[City]
FROM [setup].[Account] a 
      LEFT JOIN [setup].[PaymentProfile] b 
            ON a.[Id] = b.[Account]
      LEFT JOIN [setup].[BillingAddress] c
            ON b.[Id] = c.[PaymentProfile]
            

--(2) Quais sao os merchants?
SELECT a.Identifier, a.Name, b.Name
FROM [setup].[Merchant] a
      INNER JOIN [setup].[Segment] b
            ON b.Id = a.Segment

--(3) Quais sao os usuarios do merchant Azul?
SELECT 
      a.[Identifier],
      a.[Name], 
      a.[Email], 
      a.[Cellphone], 
      a.[AutenticationType],
      b.[Administrator]
FROM [setup].[Account] a
      INNER JOIN [setup].[MerchantAccount] b
            ON a.[Id] = b.[Account]
      INNER JOIN [setup].[Merchant] C
            ON c.[Id] = b.[Merchant]
WHERE c.[Name] LIKE '%Azul%'

--(4) Quais sao as condicoes de pagamento do merchant Azul para o cartao Visa Platinum?
SELECT 
      a.[Name], 
      b.[PaymentMeansType], 
      c.[Installment], 
      c.[Percentage] 
FROM 
      [setup].[Merchant] a
LEFT JOIN [setup].[PaymentMeans] b
      ON a.[Id] = b.[Merchant]
LEFT JOIN [setup].[PaymentTerms] c
      ON b.[Id] = c.[PaymentMeans]
WHERE a.[Name] LIKE '%Azul%'
      AND b.[PaymentMeansType] = 'VISA'
      
--(5) Quais sao os itens do merchant Casas Bahia?
SELECT 
      a.[Code], 
      a.[Name], 
      a.[Price], 
      a.[Description], 
      b.[Name]
FROM [setup].[Item] a
      INNER JOIN [setup].[Merchant] b
            ON a.[Merchant] = b.[Id]
WHERE b.[Name] LIKE '%Casas Bahia%'

--(6) Quais sao as campanhas do Merchant Azul que receberam Likes + Follow?
SELECT a.[Name], c.[Name], d.[Name], b.[BehaviorType], b.[CreateOn]
FROM [campaign].[Campaign] a
      INNER JOIN [behavior].[Behavior] b
            ON a.Id = b.SourceKey
      INNER JOIN [setup].[Merchant] c
            ON a.Merchant = c.Id
      INNER JOIN [setup].[Account] d
            ON b.Account = d.Id

--(7) Quais sao as tags que podem ser utilizadas para direcionar uma campanha?
SELECT [Name] FROM [setup].[Tag] WHERE [Target] = 1

--(8) Quais sao as tags que podem ser utilizadas para disparar eventos?
SELECT [Name] FROM [setup].[Tag] WHERE [Trigger] = 1

--(9) Quais sao as tags que podem ser utilizadas para compor um dialogo?
SELECT [Name] FROM [setup].[Tag] WHERE [Script] = 1

--(10) Quais sao as campanhas (Target + Trigger + Script) aguardando o inicio do Merchant Azul?
SELECT a.Name, a.StartDate, a.ExpirationDate, a.StatusType, b.Name, c.Title
FROM [campaign].[Campaign] a
INNER JOIN [setup].[Merchant] b
      ON a.Merchant = b.Id
LEFT JOIN [campaign].[Teaser] c
      ON a.Id = c.Campaign
WHERE b.Name LIKE '%Azul%'

SELECT a.ElementType, b.Name, c.KeyType, c.ValueType, c.Value
FROM [campaign].[Element] a
      INNER JOIN [setup].[Tag] b
            ON a.Tag = b.Id
      INNER JOIN [campaign].[ElementValue] c
            ON a.id = c.Element
WHERE [Campaign] = 1
AND a.ElementType = 'TARGET'

SELECT a.ElementType, b.Name, c.KeyType, c.ValueType, c.Value
FROM [campaign].[Element] a
      INNER JOIN [setup].[Tag] b
            ON a.Tag = b.Id
      INNER JOIN [campaign].[ElementValue] c
            ON a.id = c.Element
WHERE [Campaign] = 1
AND a.ElementType = 'TRIGGER'

SELECT a.ElementType, b.Name, c.KeyType, c.ValueType, c.Value
FROM [campaign].[Element] a
      INNER JOIN [setup].[Tag] b
            ON a.Tag = b.Id
      INNER JOIN [campaign].[ElementValue] c
            ON a.id = c.Element
WHERE [Campaign] = 1
AND a.ElementType = 'SCRIPT'