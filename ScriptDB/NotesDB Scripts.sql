USE [NotesDB]
GO
/****** Object:  Table [dbo].[Notes]    Script Date: 21.05.2024 22:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Heading] [nvarchar](50) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Notes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 21.05.2024 22:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Title_Role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 21.05.2024 22:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[id_Role] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Notes] ON 

INSERT [dbo].[Notes] ([id], [Heading], [Text]) VALUES (15, N'Пункт 1', N'Продумать план создания программы')
INSERT [dbo].[Notes] ([id], [Heading], [Text]) VALUES (16, N'Пункт 2', N'Создать Модель(ERD)')
INSERT [dbo].[Notes] ([id], [Heading], [Text]) VALUES (17, N'Пункт 3', N'Продумать Логику')
INSERT [dbo].[Notes] ([id], [Heading], [Text]) VALUES (18, N'Пункт 4', N'Создать Базу Данных по ERD диаграмме')
INSERT [dbo].[Notes] ([id], [Heading], [Text]) VALUES (19, N'Пункт 5', N'Создать проект в Visual Studio')
INSERT [dbo].[Notes] ([id], [Heading], [Text]) VALUES (20, N'Пункт 6', N'Сделать скелет проект(Создать папки и т.д)')
INSERT [dbo].[Notes] ([id], [Heading], [Text]) VALUES (21, N'Пункт 7', N'Подключить базу данных к проекту')
INSERT [dbo].[Notes] ([id], [Heading], [Text]) VALUES (23, N'Пункт 8', N'Придумать и создать дизайн программы(Figma)')
INSERT [dbo].[Notes] ([id], [Heading], [Text]) VALUES (24, N'Пункт 9', N'Сверсать дизайн с figma в код xaml')
INSERT [dbo].[Notes] ([id], [Heading], [Text]) VALUES (25, N'Пункт 10', N'Прописать логику программы')
INSERT [dbo].[Notes] ([id], [Heading], [Text]) VALUES (26, N'Пункт 11', N'Сделать скрипт Базы данных')
INSERT [dbo].[Notes] ([id], [Heading], [Text]) VALUES (28, N'Пункт 12', N'Проверить и уладить нюансы программы')
INSERT [dbo].[Notes] ([id], [Heading], [Text]) VALUES (29, N'Пункт 13', N'Завершить проект(Заметки)')
INSERT [dbo].[Notes] ([id], [Heading], [Text]) VALUES (31, N'Пункт 14', N'Загрузить готовое решение на Git Hub')
SET IDENTITY_INSERT [dbo].[Notes] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([id], [Title_Role]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([id], [Title_Role]) VALUES (2, N'Пользователь')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [Login], [Password], [FullName], [id_Role]) VALUES (1, N'admin', N'admin', N'Иванов Иван Иванович', 1)
INSERT [dbo].[User] ([id], [Login], [Password], [FullName], [id_Role]) VALUES (2, N'user', N'user', N'Петров Петр Петрович', 2)
INSERT [dbo].[User] ([id], [Login], [Password], [FullName], [id_Role]) VALUES (5, N'1', N'1', N'1', 1)
INSERT [dbo].[User] ([id], [Login], [Password], [FullName], [id_Role]) VALUES (6, N'2', N'2', N'2', 2)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([id_Role])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
