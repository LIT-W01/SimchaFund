USE [SimchaFund]
GO
/****** Object:  Table [dbo].[Contributions]    Script Date: 2/8/2016 12:26:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contributions](
	[SimchaId] [int] NOT NULL,
	[ContributorId] [int] NOT NULL,
	[Amount] [money] NOT NULL,
 CONSTRAINT [PK_Contributions] PRIMARY KEY CLUSTERED 
(
	[SimchaId] ASC,
	[ContributorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contributors]    Script Date: 2/8/2016 12:26:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contributors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NOT NULL,
	[CellNumber] [varchar](15) NOT NULL,
	[Date] [date] NOT NULL,
	[AlwaysInclude] [bit] NOT NULL,
 CONSTRAINT [PK_Contributors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Deposits]    Script Date: 2/8/2016 12:26:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deposits](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContributorId] [int] NOT NULL,
	[Amount] [money] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_Deposits] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Simchas]    Script Date: 2/8/2016 12:26:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Simchas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_Simchas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Contributions]  WITH CHECK ADD  CONSTRAINT [FK_Contributions_Contributors] FOREIGN KEY([ContributorId])
REFERENCES [dbo].[Contributors] ([Id])
GO
ALTER TABLE [dbo].[Contributions] CHECK CONSTRAINT [FK_Contributions_Contributors]
GO
ALTER TABLE [dbo].[Contributions]  WITH CHECK ADD  CONSTRAINT [FK_Contributions_Simchas] FOREIGN KEY([SimchaId])
REFERENCES [dbo].[Simchas] ([Id])
GO
ALTER TABLE [dbo].[Contributions] CHECK CONSTRAINT [FK_Contributions_Simchas]
GO
ALTER TABLE [dbo].[Deposits]  WITH CHECK ADD  CONSTRAINT [FK_Deposits_Contributors] FOREIGN KEY([ContributorId])
REFERENCES [dbo].[Contributors] ([Id])
GO
ALTER TABLE [dbo].[Deposits] CHECK CONSTRAINT [FK_Deposits_Contributors]
GO
