USE [master]
GO
EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'Spayce'
GO
USE [master]
GO
ALTER DATABASE [Spayce] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
/****** Object:  Database [Spayce]    Script Date: 02/11/2016 14:39:41 ******/
DROP DATABASE [Spayce]
GO
 
 
USE [master]
GO
/****** Object:  Database [Spayce]    Script Date: 02/15/2016 09:45:39 ******/
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
/****** Object:  Schema [setup]    Script Date: 02/15/2016 09:45:39 ******/
CREATE SCHEMA [setup] AUTHORIZATION [dbo]
GO
/****** Object:  Schema [campaign]    Script Date: 02/15/2016 09:45:39 ******/
CREATE SCHEMA [campaign] AUTHORIZATION [dbo]
GO
/****** Object:  Table [setup].[Account]    Script Date: 02/15/2016 09:45:40 ******/
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
/****** Object:  Table [dbo].[UserConnection]    Script Date: 02/15/2016 09:45:40 ******/
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
/****** Object:  Table [setup].[Segment]    Script Date: 02/15/2016 09:45:40 ******/
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
/****** Object:  Table [setup].[Merchant]    Script Date: 02/15/2016 09:45:40 ******/
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
/****** Object:  Table [campaign].[Campaign]    Script Date: 02/15/2016 09:45:40 ******/
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
/****** Object:  Table [setup].[Tag]    Script Date: 02/15/2016 09:45:40 ******/
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
      [Merchant] [bigint] NULL,
CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED
(
      [Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [campaign].[Target]    Script Date: 02/15/2016 09:45:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [campaign].[Target](
      [Id] [bigint] IDENTITY(1,1) NOT NULL,
      [CreateOn] [datetime2](7) NOT NULL,
      [UpdateOn] [datetime2](7) NOT NULL,
      [Verion] [int] NOT NULL,
      [MainValue] [nvarchar](100) NOT NULL,
      [AdditionalValue] [nvarchar](100) NULL,
      [Campaign] [bigint] NOT NULL,
      [Tag] [bigint] NOT NULL,
CONSTRAINT [PK_Target] PRIMARY KEY CLUSTERED
(
      [Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Merchant_Segment]    Script Date: 02/15/2016 09:45:40 ******/
ALTER TABLE [setup].[Merchant]  WITH CHECK ADD  CONSTRAINT [FK_Merchant_Segment] FOREIGN KEY([Segment])
REFERENCES [setup].[Segment] ([Id])
GO
ALTER TABLE [setup].[Merchant] CHECK CONSTRAINT [FK_Merchant_Segment]
GO
/****** Object:  ForeignKey [FK_Campaign_Merchant]    Script Date: 02/15/2016 09:45:40 ******/
ALTER TABLE [campaign].[Campaign]  WITH CHECK ADD  CONSTRAINT [FK_Campaign_Merchant] FOREIGN KEY([Merchant])
REFERENCES [setup].[Merchant] ([Id])
GO
ALTER TABLE [campaign].[Campaign] CHECK CONSTRAINT [FK_Campaign_Merchant]
GO
/****** Object:  ForeignKey [FK_Merchant_Tag]    Script Date: 02/15/2016 09:45:40 ******/
ALTER TABLE [setup].[Tag]  WITH CHECK ADD  CONSTRAINT [FK_Merchant_Tag] FOREIGN KEY([Merchant])
REFERENCES [setup].[Merchant] ([Id])
GO
ALTER TABLE [setup].[Tag] CHECK CONSTRAINT [FK_Merchant_Tag]
GO
/****** Object:  ForeignKey [FK_Target_Campaign]    Script Date: 02/15/2016 09:45:40 ******/
ALTER TABLE [campaign].[Target]  WITH CHECK ADD  CONSTRAINT [FK_Target_Campaign] FOREIGN KEY([Campaign])
REFERENCES [campaign].[Campaign] ([Id])
GO
ALTER TABLE [campaign].[Target] CHECK CONSTRAINT [FK_Target_Campaign]
GO
/****** Object:  ForeignKey [FK_Target_Tag]    Script Date: 02/15/2016 09:45:40 ******/
ALTER TABLE [campaign].[Target]  WITH CHECK ADD  CONSTRAINT [FK_Target_Tag] FOREIGN KEY([Tag])
REFERENCES [setup].[Tag] ([Id])
GO
ALTER TABLE [campaign].[Target] CHECK CONSTRAINT [FK_Target_Tag]
GO

INSERT INTO [setup].[Account] VALUES (GETDATE(), GETDATE(), 0, 'Root', 'root@spayce.com.br', 'spayce', 'SPAYCE', '77407172749', NULL)
INSERT INTO [setup].[Segment] VALUES (GETDATE(), GETDATE(), 0, 'Transporte Aéreo')
INSERT INTO [setup].[Merchant] VALUES (GETDATE(), GETDATE(), 0, '82393187000103', 'Mechant', NULL, 1)
INSERT INTO [setup].[Tag] VALUES (GETDATE(), GETDATE(), 0, 'Pessoas Físicas', 'DOMAIN', 'PessoaType', 0, 1)
INSERT INTO [setup].[Tag] VALUES (GETDATE(), GETDATE(), 0, 'Abandono de script', 'DOMAIN', 'PessoaType', 1, NULL)
INSERT INTO [setup].[Tag] VALUES (GETDATE(), GETDATE(), 0, 'Solicitação de pagamento', 'DOMAIN', 'PessoaType', 1, NULL)
INSERT INTO [setup].[Tag] VALUES (GETDATE(), GETDATE(), 0, 'Abandono de pagamento', 'DOMAIN', 'PessoaType', 1, NULL)
INSERT INTO [setup].[Tag] VALUES (GETDATE(), GETDATE(), 0, 'Escolha de opção de script', 'DOMAIN', 'PessoaType', 1, NULL)
INSERT INTO [setup].[Tag] VALUES (GETDATE(), GETDATE(), 0, 'Valor do pagamento', 'DOMAIN', 'PessoaType', 1, NULL)
INSERT INTO [setup].[Tag] VALUES (GETDATE(), GETDATE(), 0, 'Meio de pagamento escolhido', 'DOMAIN', 'PessoaType', 1, NULL)
INSERT INTO [setup].[Tag] VALUES (GETDATE(), GETDATE(), 0, 'Número de parcelas escolhido', 'DOMAIN', 'PessoaType', 1, NULL)
INSERT INTO [setup].[Tag] VALUES (GETDATE(), GETDATE(), 0, 'Escolha de voucher', 'DOMAIN', 'PessoaType', 1, NULL)
INSERT INTO [setup].[Tag] VALUES (GETDATE(), GETDATE(), 0, 'Escolha de promo code', 'DOMAIN', 'PessoaType', 1, NULL)
INSERT INTO [setup].[Tag] VALUES (GETDATE(), GETDATE(), 0, 'Like de deal', 'DOMAIN', 'PessoaType', 1, NULL)
INSERT INTO [setup].[Tag] VALUES (GETDATE(), GETDATE(), 0, 'Publicação de deal no Facebook', 'DOMAIN', 'PessoaType', 1, NULL)
INSERT INTO [setup].[Tag] VALUES (GETDATE(), GETDATE(), 0, 'Encaminhamento de deal no Whatsapp', 'DOMAIN', 'PessoaType', 1, NULL)
INSERT INTO [setup].[Tag] VALUES (GETDATE(), GETDATE(), 0, 'Encaminhamento de deal no Messenger', 'DOMAIN', 'PessoaType', 1, NULL)
INSERT INTO [setup].[Tag] VALUES (GETDATE(), GETDATE(), 0, 'Encaminhamento de deal no Instagram', 'DOMAIN', 'PessoaType', 1, NULL)
INSERT INTO [setup].[Tag] VALUES (GETDATE(), GETDATE(), 0, 'Geolocalização: Entra numa área', 'DOMAIN', 'PessoaType', 1, NULL)
INSERT INTO [setup].[Tag] VALUES (GETDATE(), GETDATE(), 0, 'Geolocalização: Sai de uma área', 'DOMAIN', 'PessoaType', 1, NULL)
INSERT INTO [setup].[Tag] VALUES (GETDATE(), GETDATE(), 0, 'Clock', 'DOMAIN', 'PessoaType', 1, NULL)
INSERT INTO [setup].[Tag] VALUES (GETDATE(), GETDATE(), 0, 'Meio de pagamento cadastrado nas preferências do usuário', 'DOMAIN', 'PessoaType', 1, NULL)
INSERT INTO [setup].[Tag] VALUES (GETDATE(), GETDATE(), 0, 'Aprovação de pagamento', 'DOMAIN', 'PessoaType', 1, NULL)
INSERT INTO [campaign].[Campaign] VALUES (GETDATE(), GETDATE(), 0, 'FDS nos EUA', GETDATE(), GETDATE(), 'NEW', 1)
INSERT INTO [campaign].[Target] VALUES (GETDATE(), GETDATE(), 0, 'PF', NULL, 1, 1)
