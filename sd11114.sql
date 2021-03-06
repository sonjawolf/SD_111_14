USE [sd11114]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/17/2021 1:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/17/2021 1:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CategoryName] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 6/17/2021 1:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Text] [nvarchar](160) NOT NULL,
	[UserId] [int] NOT NULL,
	[PostId] [int] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pictures]    Script Date: 6/17/2021 1:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pictures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[PictureName] [nvarchar](max) NULL,
	[PostId] [int] NOT NULL,
	[Alt] [nvarchar](150) NULL,
 CONSTRAINT [PK_Pictures] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 6/17/2021 1:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Title] [nvarchar](450) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[PostedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UseCaseLogs]    Script Date: 6/17/2021 1:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UseCaseLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[UseCaseName] [nvarchar](max) NULL,
	[Data] [nvarchar](max) NULL,
	[Actor] [nvarchar](max) NULL,
 CONSTRAINT [PK_UseCaseLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/17/2021 1:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Username] [nvarchar](max) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserUseCases]    Script Date: 6/17/2021 1:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUseCases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
 CONSTRAINT [PK_UserUseCases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200815231922_initial', N'3.1.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200817214741_Added users and use-cases', N'3.1.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200818154430_UseCaseLogs', N'3.1.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200821182803_Category', N'3.1.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200822165913_update entity', N'3.1.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200823170202_Add Posts', N'3.1.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200823174600_Add Posts 2', N'3.1.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200823184231_Add update', N'3.1.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200824161206_Comments', N'3.1.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200824161838_Comments -1', N'3.1.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200825115920_Picture11', N'3.1.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200825234850_UserUseCase', N'3.1.7')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [CategoryName]) VALUES (2, CAST(N'2020-08-22T20:37:28.4092511' AS DateTime2), NULL, 0, 1, N'Health')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [CategoryName]) VALUES (3, CAST(N'2020-08-23T23:09:11.7732598' AS DateTime2), NULL, 0, 1, N'Traveling')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [CategoryName]) VALUES (4, CAST(N'2020-08-23T23:09:11.7732598' AS DateTime2), NULL, 0, 1, N'Reciepes')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [CategoryName]) VALUES (5, CAST(N'2021-06-16T23:45:30.2409343' AS DateTime2), NULL, 0, 1, N'hronika')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [CategoryName]) VALUES (6, CAST(N'2021-06-16T23:46:32.5075615' AS DateTime2), NULL, 0, 1, N'Politika')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Text], [UserId], [PostId]) VALUES (1, CAST(N'2020-08-23T22:50:27.5080419' AS DateTime2), CAST(N'2020-08-24T20:08:20.9953361' AS DateTime2), 1, 0, N'string', 2, 2)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Text], [UserId], [PostId]) VALUES (2, CAST(N'2020-08-25T16:09:57.5903776' AS DateTime2), CAST(N'2021-06-17T00:01:46.0894455' AS DateTime2), 1, 0, N'string update', 4, 3)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Text], [UserId], [PostId]) VALUES (3, CAST(N'2020-08-23T19:01:49.2493559' AS DateTime2), NULL, 0, 1, N'Komentar sve ok', 2, 2)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Text], [UserId], [PostId]) VALUES (5, CAST(N'2020-08-23T19:01:49.2493559' AS DateTime2), NULL, 1, 0, N'Jao kako je divno, isto tako i ja', 3, 2)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Text], [UserId], [PostId]) VALUES (7, CAST(N'2020-08-23T19:01:49.2493559' AS DateTime2), NULL, 0, 1, N'DAnas smo isli u setnju', 1, 2)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Text], [UserId], [PostId]) VALUES (8, CAST(N'2020-08-23T19:01:49.2493559' AS DateTime2), NULL, 0, 1, N'Sutra idemo na tobogam', 3, 2)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Text], [UserId], [PostId]) VALUES (9, CAST(N'2021-06-17T01:30:44.4878675' AS DateTime2), NULL, 0, 1, N'komenst', 2, 2)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Pictures] ON 

INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [PictureName], [PostId], [Alt]) VALUES (3, CAST(N'2020-08-25T18:09:26.8533467' AS DateTime2), NULL, 0, 1, N'cbaeb3a7-d660-46f7-9583-f619335e6caf.jpg', 2, N'reno')
SET IDENTITY_INSERT [dbo].[Pictures] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Text], [CategoryId], [PostedAt]) VALUES (2, CAST(N'2020-08-23T21:00:00.5200629' AS DateTime2), CAST(N'2021-06-17T00:09:56.2717093' AS DateTime2), 1, 0, N'test1', N'tekst tekst', 2, CAST(N'2020-08-23T18:59:59.8308613' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Text], [CategoryId], [PostedAt]) VALUES (3, CAST(N'2020-08-23T21:01:49.2527310' AS DateTime2), NULL, 1, 1, N'sonja', N'sonja sonja sonja', 2, CAST(N'2020-08-23T19:01:49.2493559' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Text], [CategoryId], [PostedAt]) VALUES (30, CAST(N'2020-08-23T19:01:49.2493559' AS DateTime2), NULL, 0, 1, N'Anksioznost', N'Anksioznost… kolika je to patnja znaju oni koji su je osetili… i bar jednom u životu dobili dijagnozu anksiozno stanje ili njegov stariji brat, car nad svim carevima, panični napad… trenutak izmedju dva sveta, izmedju ludila i razuma… a sve iz normalnog stanja, iz pune svesti, iz punog zdravlja… kažu lekari “nije vam ništa” a čovek – invalid u punoj snazi… ne sme ovo, pa ne sme ono', 2, CAST(N'2020-08-23T19:01:49.2493559' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Text], [CategoryId], [PostedAt]) VALUES (39, CAST(N'2020-08-23T19:01:49.2493559' AS DateTime2), NULL, 0, 1, N'Ispovest', N'Priča mi, nedavno, jedna mlada devojka o mladiću „koji joj se uvek vraća“… ide svuda, živi svoj život o kojem ga ona nikad ne pita da ne pokvari čaroliju, dolazi odnegde, pun priča, uzbudljiv kao, uostalom, sve što se retko pojavljuje, unese se u njene oči, izabere je da s njom podeli svoju posebnost prenevši tako na nju deo svoje harizme i ode… posle tog vatrometa sivo nebo izgleda još sivlje i ona samo čeka da on ponovo dodje i osvetli ga… živi tako zamrznuta u', 3, CAST(N'2020-08-23T19:01:49.2493559' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Text], [CategoryId], [PostedAt]) VALUES (40, CAST(N'2020-08-23T19:01:49.2493559' AS DateTime2), NULL, 0, 1, N'Zasto dusa mora da pati', N'Iako u jednom životu izgleda da um zlostavlja dušu svojim bezumljem i ograničenjem, to je iskustvo koje duša bira kao lekciju.

Pitanje koje se postavlja je:

Zašto se ne prepustimo ulozi koju smo dobili u ovom životu, kada je to već kreacija duše?', 4, CAST(N'2020-08-23T19:01:49.2493559' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Text], [CategoryId], [PostedAt]) VALUES (41, CAST(N'2020-08-23T19:01:49.2493559' AS DateTime2), NULL, 0, 1, N'Detinjstvo nas odredjuje', N'Možemo to različito zvati i možemo do toga doći na različite načine i kazati: dobićeš ono što očekuješ ili „kako zračiš tako i  privlačiš“, ili „kakva te ljuljaška zaljulja –  takva te do kraja ljulja“, ali čini mi se da postoji tačno utvrdjena, programirana količina ljubavi koju kroz život možemo da dobijemo,', 2, CAST(N'2020-08-23T19:01:49.2493559' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Text], [CategoryId], [PostedAt]) VALUES (42, CAST(N'2020-08-23T19:01:49.2493559' AS DateTime2), NULL, 1, 0, N'Kako da se uskladimo sa sopstvenom dusom?', N'19. децембра 2019.
Nalazimo se u vremenu promena kada je samo jedan putokaz autentičan i pravi, a to je putokaz koji nam govori naša duša.

Naša duša je besmrtna a naš um je ograničen ovim životom sa pet čula. Duša ima bezbroj čula i oseća mnogo dublje, neograničena informacijama pet čula. Zbog tih ograničenja um ne prepoznaje nežno srce iza grubog ponašanja ili zlu nameru iza nasmejanog lica i pohvala. ', 3, CAST(N'2020-08-23T19:01:49.2493559' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Text], [CategoryId], [PostedAt]) VALUES (43, CAST(N'2020-08-23T19:01:49.2493559' AS DateTime2), NULL, 0, 1, N'O bolu i gubitku vere', N'Depresivni ljudi mogu dugo da pričaju o tome šta osećaju, šta su izgubili ili šta nikad nisu imali a nedostaje im i u stanju su da traže pomoć.
Kada ih boli neki deo tela ili neki organ, ljudi mogu da pričaju o svom bolu, detaljno, odakle dolazi i kako se širi, šta ga izaziva i šta olakšava , kada je počelo da ih boli i sve što smatraju da je od koristi da kažu da bi im bila pružena najbolja moguća pomoć.', 4, CAST(N'2020-08-23T19:01:49.2493559' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Text], [CategoryId], [PostedAt]) VALUES (44, CAST(N'2020-08-23T19:01:49.2493559' AS DateTime2), NULL, 0, 1, N'Slucajnost ne postoji', N'„Ono što ljudi najčešće traže u molitvama od Boga, to je da dva i dva ne bude četiri“… da se vrati onaj koji je davno otišao, da otopli onaj što je zaledjen, da ih vole oni koji su prestali i da nesretne porodice sede u dnevnoj sobi skupa i  da u miru, koji pruža samo zajednička sreća, piju čaj od lipe… a ono što ljudi često traže kod psihologa je da ih sasluša bez da išta čuju, da iskipuju svoj težak tovar i da odu bez da išta promene… ', 4, CAST(N'2020-08-23T19:01:49.2493559' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Text], [CategoryId], [PostedAt]) VALUES (46, CAST(N'2020-08-23T19:01:49.2493559' AS DateTime2), NULL, 1, 0, N'Lubav i granice', N'Radeći sa mladim ljudima koji imaju problem zavisnosti, bilo da je u pitanju alkohol, droga ili kocka, uočila sam jednu zakonitost koja se po svojoj postojanosti gotovo može da meri sa zakonima iz prirodnih nauka – dok god jedan od roditelja ostane usamljen u pokušajima da ispravi neko nepoželjno ponašanje deteta, na primer, dugo očekivanog sina, a drugi roditelj opstruira takve njegove pokušaje ', 3, CAST(N'2020-08-23T19:01:49.2493559' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Text], [CategoryId], [PostedAt]) VALUES (48, CAST(N'2020-08-23T19:01:49.2493559' AS DateTime2), NULL, 0, 1, N'Svaka misao je dozvoljane', N'Jednostavno i najpoštenije rečeno – imamo pravo na svaku svoju misao: agresivnu, “bogohulnu”, nečistu, pokvarenu, zavidnu, zlu… i to ne treba da nas plaši… ”čovek – kako to gordo zvuči”, rekao je neko nekada davno a u medjuvremenu izmišljen je zvučni film, što bi rekle šaljivdžije, a zapravo nauka je bolje upoznala čoveka i mnogo je sveštenika, psihijatara i psihologa razgovaralo sa ljudima i svakakve su se reči našle izrečene i svakakva su dela uči', 3, CAST(N'2020-08-23T19:01:49.2493559' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Text], [CategoryId], [PostedAt]) VALUES (49, CAST(N'2020-08-23T19:01:49.2493559' AS DateTime2), NULL, 0, 1, N'Samohrane majke', N'Samohrane majke, razvedene ili one koje rode i podižu dete same, van partnerske zajednice… veliki krst, veliki izazov, stigma, odgovornost, hrabrost ali… svako mučeništvo ima svoju drugu stranu… razgovarala sam sa mnogo odraslih ljudi čije su majke bile hrabre i jake i podizale ih same… neki od njih čak i ne znaju oca, drugi sa njim imaju nikakav ili jako loš kontakt jer su o njemu slušali iz usta žene koju je razočarao i koja je u njihovo ime odlučila da otac ne postoji…', 3, CAST(N'2020-08-23T19:01:49.2493559' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Text], [CategoryId], [PostedAt]) VALUES (50, CAST(N'2021-06-17T00:35:40.4145378' AS DateTime2), NULL, 0, 1, N'Title za post', N'TExt tekst ', 6, CAST(N'2021-06-16T22:35:40.3390999' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
SET IDENTITY_INSERT [dbo].[UseCaseLogs] ON 

INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1, CAST(N'2020-08-18T17:50:42.5069406' AS DateTime2), N'User registration.', N'{"FirstName":null,"LastName":null,"Username":null,"Password":null,"Email":null}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2, CAST(N'2020-08-18T17:50:40.0321346' AS DateTime2), N'User registration.', N'{"FirstName":null,"LastName":null,"Username":null,"Password":null,"Email":null}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (3, CAST(N'2020-08-18T17:50:12.7060504' AS DateTime2), N'User registration.', N'{"FirstName":null,"LastName":null,"Username":null,"Password":null,"Email":null}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (4, CAST(N'2020-08-18T17:52:14.3327040' AS DateTime2), N'User registration.', N'{"FirstName":"sonja","LastName":"damj","Username":"sonjakkk","Password":"sifra1","Email":"sonja@gmail.com"}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (5, CAST(N'2020-08-18T21:20:43.7908078' AS DateTime2), N'User registration.', N'{"FirstName":"sonja","LastName":"damj","Username":"sonjadamkkk","Password":"sifra1","Email":"sonjadamjanovic@gmail.com"}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (6, CAST(N'2020-08-18T21:23:31.0908889' AS DateTime2), N'User registration.', N'{"FirstName":"sonja","LastName":"damj","Username":"sonjadamkkk","Password":"sifra1","Email":"sonjadamjanovic@gmail.com"}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (7, CAST(N'2020-08-18T21:24:25.9707493' AS DateTime2), N'User registration.', N'{"FirstName":"sonja","LastName":"damj","Username":"sonjadamjanovic","Password":"sifra1","Email":"sonjadamjanovic@gmail.com"}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (8, CAST(N'2020-08-18T21:27:52.0467762' AS DateTime2), N'User registration.', N'{"FirstName":"sonja","LastName":"damj","Username":"sonjad","Password":"sifra1","Email":"sonjadamjanovic@gmail.com"}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (9, CAST(N'2020-08-18T21:31:29.5627622' AS DateTime2), N'User registration.', N'{"FirstName":"sonja","LastName":"damj","Username":"kojekude","Password":"sifra1","Email":"sonjadamjanovic@gmail.com"}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (10, CAST(N'2020-08-18T21:48:31.7548387' AS DateTime2), N'User registration.', N'{"FirstName":"sonja","LastName":"damj","Username":"kojed","Password":"sifra1","Email":"sonjadamjanovic@gmail.com"}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (11, CAST(N'2020-08-18T21:52:43.7003703' AS DateTime2), N'User registration.', N'{"FirstName":"sonja","LastName":"damj","Username":"kojed","Password":"sifra1","Email":"sonjadamjanovic@gmail.com"}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (12, CAST(N'2020-08-18T21:53:35.7903029' AS DateTime2), N'User registration.', N'{"FirstName":"sonja","LastName":"damj","Username":"sdfsfa","Password":"sifra1","Email":"sonjadamjanovic@gmail.com"}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (13, CAST(N'2020-08-18T22:02:28.4651669' AS DateTime2), N'User registration.', N'{"FirstName":"sonja","LastName":"damj","Username":"1232123651","Password":"sifra1","Email":"sonjadamjanovic@gmail.com"}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (14, CAST(N'2020-08-18T22:11:51.3293512' AS DateTime2), N'User registration.', N'{"FirstName":"sonja","LastName":"damj","Username":"hkh9n","Password":"sifra1","Email":"sonjadamjanovic@gmail.com"}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (15, CAST(N'2020-08-18T22:13:51.7905238' AS DateTime2), N'User registration.', N'{"FirstName":"sonja","LastName":"damj","Username":"asdsare","Password":"sifra1","Email":"sonjadamjanovic@gmail.com"}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (16, CAST(N'2020-08-21T18:52:36.3813384' AS DateTime2), N'Pravljenje nove kategorije', N'{"Id":0,"CategoryName":null}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (17, CAST(N'2020-08-22T17:44:29.9294858' AS DateTime2), N'Pravljenje nove kategorije', N'{"Id":0,"CategoryName":"LifeStyle"}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (18, CAST(N'2020-08-22T17:51:49.6460205' AS DateTime2), N'Pravljenje nove kategorije', N'{"Id":0,"CategoryName":"Life"}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (19, CAST(N'2020-08-22T18:03:15.1180394' AS DateTime2), N'Pravljenje nove kategorije', N'{"Id":0,"CategoryName":"Life"}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (20, CAST(N'2020-08-22T18:21:31.0488435' AS DateTime2), N'Pravljenje nove kategorije', N'{"Id":0,"CategoryName":"Life"}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (21, CAST(N'2020-08-22T18:26:43.9433791' AS DateTime2), N'Pravljenje nove kategorije', N'{"Id":0,"CategoryName":"Life"}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (22, CAST(N'2020-08-22T18:27:09.3251595' AS DateTime2), N'Select kategorija', N'{"Name":null,"PerPage":10,"Page":1}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (23, CAST(N'2020-08-22T18:28:43.6203832' AS DateTime2), N'Select kategorija', N'{"Name":null,"PerPage":10,"Page":1}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (24, CAST(N'2020-08-22T18:29:33.1712904' AS DateTime2), N'Select kategorija', N'{"Name":null,"PerPage":10,"Page":1}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (25, CAST(N'2020-08-22T18:32:23.7070293' AS DateTime2), N'Select kategorija', N'{"Name":null,"PerPage":10,"Page":1}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (26, CAST(N'2020-08-22T18:32:57.0221164' AS DateTime2), N'Select kategorija', N'{"Name":null,"PerPage":1,"Page":1}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (27, CAST(N'2020-08-22T18:36:37.8126662' AS DateTime2), N'Select kategorija', N'{"Name":null,"PerPage":1,"Page":1}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (28, CAST(N'2020-08-22T18:37:24.7179840' AS DateTime2), N'Pravljenje nove kategorije', N'{"Id":0,"CategoryName":"Health"}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (29, CAST(N'2020-08-22T18:37:44.4433467' AS DateTime2), N'Select kategorija', N'{"Name":null,"PerPage":10,"Page":1}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (30, CAST(N'2020-08-22T21:46:54.4070161' AS DateTime2), N'Select kategorija', N'{"Name":null,"PerPage":1,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (31, CAST(N'2020-08-22T21:50:34.3347687' AS DateTime2), N'Select kategorija', N'{"Name":null,"PerPage":1,"Page":1}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (32, CAST(N'2020-08-22T21:51:08.3190421' AS DateTime2), N'Dohvatanje jedne kategorije', N'2', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (33, CAST(N'2020-08-22T21:51:30.1269838' AS DateTime2), N'Dohvatanje jedne kategorije', N'1', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (34, CAST(N'2020-08-22T21:51:39.2013555' AS DateTime2), N'Dohvatanje jedne kategorije', N'2', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (35, CAST(N'2020-08-22T21:51:52.5168712' AS DateTime2), N'Dohvatanje jedne kategorije', N'3', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (36, CAST(N'2020-08-22T22:24:50.8007790' AS DateTime2), N'Brisanje korisnika iz baze', N'10', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (37, CAST(N'2020-08-22T22:31:30.9915505' AS DateTime2), N'Brisanje korisnika iz baze', N'10', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (38, CAST(N'2020-08-22T22:34:14.9325126' AS DateTime2), N'Brisanje korisnika iz baze', N'10', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (39, CAST(N'2020-08-22T22:37:25.9147360' AS DateTime2), N'Brisanje korisnika iz baze', N'11', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (40, CAST(N'2020-08-22T22:38:23.4493641' AS DateTime2), N'Brisanje kategorije', N'1', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (41, CAST(N'2020-08-22T23:19:02.6300372' AS DateTime2), N'Select Svih korisnika', N'{"Username":"sonja","PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (42, CAST(N'2020-08-23T09:19:24.9992125' AS DateTime2), N'Dohvatanje korisnika po ID', N'2', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (43, CAST(N'2020-08-23T09:23:51.7301907' AS DateTime2), N'Dohvatanje korisnika po ID', N'2', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (44, CAST(N'2020-08-23T09:24:01.6554035' AS DateTime2), N'Dohvatanje korisnika po ID', N'5', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (45, CAST(N'2020-08-23T09:24:03.0756347' AS DateTime2), N'Dohvatanje korisnika po ID', N'5', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (46, CAST(N'2020-08-23T10:13:16.9041501' AS DateTime2), N'Update korisnika', N'{"Id":12,"FirstName":"Hristina","LastName":"Hristic","Username":"hrile","Password":"sifra1","Email":"hrile@gmail.com"}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (47, CAST(N'2020-08-23T17:32:19.2517560' AS DateTime2), N'Dodavanje novog posta', N'{"Id":0,"Title":"Cajevi za bolji san","Text":"Cajevi za bolji san Cajevi za bolji san Cajevi za bolji san","CategoryId":2,"PostedAt":"2020-08-23T17:29:32.762Z","Category":null}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (48, CAST(N'2020-08-23T17:42:09.8282691' AS DateTime2), N'Dodavanje novog posta', N'{"Id":1,"Title":"title 1","Text":" stringstringstringstringstringstringstringstringstring ","CategoryId":2,"PostedAt":"2020-08-23T17:40:31.992Z","Category":{"Id":2,"CategoryName":"string","Posts":[{"Id":1,"Title":"Title 1","Text":" string string ","CategoryId":2,"PostedAt":"2020-08-23T17:40:31.992Z","Category":null,"CreatedAt":"2020-08-23T17:40:31.992Z","ModifiedAt":"2020-08-23T17:40:31.992Z","IsDeleted":false,"IsActive":true}],"CreatedAt":"2020-08-23T17:40:31.992Z","ModifiedAt":"2020-08-23T17:40:31.992Z","IsDeleted":false,"IsActive":true}}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (49, CAST(N'2020-08-23T18:05:15.9986831' AS DateTime2), N'Dodavanje novog posta', N'{"Id":1,"Title":"test1","Text":"string 1 string 1 string 1 string 1 string 1 string 1 string 1 string 1 ","CategoryId":3,"PostedAt":"2020-08-23T18:03:01.956Z","Category":{"Id":3,"CategoryName":"Life","Posts":[{"Id":1,"Title":"test 1","Text":"string 1 string 1 string 1 string 1 string 1 ","CategoryId":2,"PostedAt":"2020-08-23T18:03:01.956Z","Category":null}],"CreatedAt":"2020-08-23T18:03:01.962Z","ModifiedAt":"2020-08-23T18:03:01.962Z","IsDeleted":false,"IsActive":true}}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (50, CAST(N'2020-08-23T18:51:36.6955916' AS DateTime2), N'Dodavanje novog posta', N'{"Id":0,"Title":"string1","Text":"string11","CategoryId":0,"PostedAt":"2020-08-23T18:50:33.424Z","Category":{"Id":1,"CategoryName":"string1","Posts":[{"Id":0,"Title":"string1","Text":"string11","CategoryId":1,"PostedAt":"2020-08-23T18:50:33.424Z","Category":null,"CreatedAt":"2020-08-23T18:50:33.424Z","ModifiedAt":"2020-08-23T18:50:33.424Z","IsDeleted":true,"IsActive":true}],"CreatedAt":"2020-08-23T18:50:33.424Z","ModifiedAt":"2020-08-23T18:50:33.424Z","IsDeleted":true,"IsActive":true}}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (51, CAST(N'2020-08-23T18:53:49.4310183' AS DateTime2), N'Dodavanje novog posta', N'{"Id":0,"Title":"string1","Text":"string11","CategoryId":2,"PostedAt":"2020-08-23T18:50:33.424Z","Category":{"Id":2,"CategoryName":"string1","Posts":[{"Id":0,"Title":"string1","Text":"string11","CategoryId":2,"PostedAt":"2020-08-23T18:50:33.424Z","Category":null,"CreatedAt":"2020-08-23T18:50:33.424Z","ModifiedAt":"2020-08-23T18:50:33.424Z","IsDeleted":true,"IsActive":true}],"CreatedAt":"2020-08-23T18:50:33.424Z","ModifiedAt":"2020-08-23T18:50:33.424Z","IsDeleted":true,"IsActive":true}}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (52, CAST(N'2020-08-23T18:59:34.1530776' AS DateTime2), N'Dodavanje novog posta', N'{"Id":0,"Title":"test1","Text":"tekst tekst","CategoryId":2,"PostedAt":"0001-01-01T00:00:00","Category":null}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (53, CAST(N'2020-08-23T19:01:48.6376168' AS DateTime2), N'Dodavanje novog posta', N'{"Id":0,"Title":"sonja","Text":"sonja sonja sonja","CategoryId":2,"PostedAt":"2020-08-23T19:01:06.434Z","Category":null}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (54, CAST(N'2020-08-23T21:08:49.3610504' AS DateTime2), N'Pravljenje nove kategorije', N'{"Id":3,"CategoryName":"Traveling","Posts":null}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (55, CAST(N'2020-08-23T21:09:29.5873884' AS DateTime2), N'Select kategorija', N'{"Name":null,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (56, CAST(N'2020-08-23T21:10:27.2722512' AS DateTime2), N'Dohvatanje jedne kategorije', N'0', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (57, CAST(N'2020-08-23T21:11:03.2606076' AS DateTime2), N'Dohvatanje jedne kategorije', N'2', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (58, CAST(N'2020-08-23T21:33:26.0088220' AS DateTime2), N'Delete post', N'1', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (59, CAST(N'2020-08-23T21:34:52.0126594' AS DateTime2), N'Delete post', N'2', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (60, CAST(N'2020-08-23T22:01:27.0196111' AS DateTime2), N'Delete post', N'2', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (61, CAST(N'2020-08-23T22:02:05.0194611' AS DateTime2), N'Dohvatanje jednog posta', N'{"Title":"sonja","Text":null,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (62, CAST(N'2020-08-23T22:03:23.7411915' AS DateTime2), N'Dohvatanje jednog posta', N'{"Title":"sonja","Text":null,"PerPage":1,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (63, CAST(N'2020-08-23T22:04:26.5502292' AS DateTime2), N'Dohvatanje jednog posta', N'{"Title":"sonja","Text":"sonja","PerPage":1,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (64, CAST(N'2020-08-23T22:19:09.8389879' AS DateTime2), N'Dohvatanje jednog posta', N'{"Title":"sonja","Text":null,"PerPage":1,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (65, CAST(N'2020-08-23T22:22:02.1440985' AS DateTime2), N'Dohvatanje jednog posta', N'{"Title":"sonja","Text":"test","PerPage":1,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (66, CAST(N'2020-08-23T22:49:01.1402663' AS DateTime2), N'Dohvatanje jednog posta', N'{"Title":"sonja","Text":null,"PerPage":1,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (67, CAST(N'2020-08-23T22:49:47.1974831' AS DateTime2), N'Dohvatanje jednog posta', N'{"Title":null,"Text":"sonja","PerPage":1,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (68, CAST(N'2020-08-23T22:50:27.5080419' AS DateTime2), N'Dohvatanje jednog posta', N'{"Title":"test","Text":null,"PerPage":1,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (69, CAST(N'2020-08-23T22:58:04.0423594' AS DateTime2), N'Dohvatanje jednog posta', N'{"Title":"sonja","Text":null,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (70, CAST(N'2020-08-23T22:58:51.5055276' AS DateTime2), N'Dohvatanje jednog posta', N'{"Title":"sonja","Text":"sonja","PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (71, CAST(N'2020-08-23T23:05:00.5922261' AS DateTime2), N'Dohvatanje jednog posta', N'{"Title":"sonja","Text":null,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (72, CAST(N'2020-08-23T23:04:44.8832315' AS DateTime2), N'Dohvatanje jednog posta', N'{"Title":"sonja","Text":null,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (73, CAST(N'2020-08-23T23:07:28.9845213' AS DateTime2), N'Dohvatanje jednog posta', N'{"Title":"sonjaaaaaaaaaaaaaaaaa","Text":"sonja","PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (74, CAST(N'2020-08-23T23:07:42.2696610' AS DateTime2), N'Dohvatanje jednog posta', N'{"Title":null,"Text":"sonja","PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (75, CAST(N'2020-08-24T10:24:22.5600583' AS DateTime2), N'Dohvatanje jednog posta po id-ju', N'2', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (76, CAST(N'2020-08-24T10:24:57.2989871' AS DateTime2), N'Dohvatanje jednog posta po id-ju', N'2', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (77, CAST(N'2020-08-24T10:25:11.5219233' AS DateTime2), N'Dohvatanje jednog posta po id-ju', N'3', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (78, CAST(N'2020-08-24T10:27:41.4071766' AS DateTime2), N'Dohvatanje jednog posta', N'{"Title":null,"Text":null,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (79, CAST(N'2020-08-24T10:28:06.8761507' AS DateTime2), N'Dohvatanje jednog posta po id-ju', N'0', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (80, CAST(N'2020-08-24T10:34:27.5561840' AS DateTime2), N'Dohvatanje jednog posta po id-ju', N'2', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (81, CAST(N'2020-08-24T10:40:35.6638810' AS DateTime2), N'Dohvatanje jednog posta po id-ju', N'3', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (82, CAST(N'2020-08-24T10:41:04.5421597' AS DateTime2), N'Dohvatanje jednog posta po id-ju', N'2', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (83, CAST(N'2020-08-24T10:46:08.0781953' AS DateTime2), N'Dohvatanje jedne kategorije', N'0', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (84, CAST(N'2020-08-24T10:46:58.0634912' AS DateTime2), N'Dohvatanje jedne kategorije', N'2', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (85, CAST(N'2020-08-24T10:47:17.5844101' AS DateTime2), N'Dohvatanje jedne kategorije', N'1', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (86, CAST(N'2020-08-24T10:47:49.1693768' AS DateTime2), N'Dohvatanje jedne kategorije', N'1', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (87, CAST(N'2020-08-24T10:48:04.4332069' AS DateTime2), N'Dohvatanje jedne kategorije', N'1', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (88, CAST(N'2020-08-24T10:48:19.9277719' AS DateTime2), N'Dohvatanje jedne kategorije', N'1', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (89, CAST(N'2020-08-24T10:49:10.1592237' AS DateTime2), N'Dohvatanje jednog posta po id-ju', N'2', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (90, CAST(N'2020-08-24T10:55:23.2648436' AS DateTime2), N'Dohvatanje jedne kategorije', N'2', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (91, CAST(N'2020-08-24T10:56:17.3498913' AS DateTime2), N'Dohvatanje jedne kategorije', N'1', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (92, CAST(N'2020-08-24T10:56:40.2556982' AS DateTime2), N'Dohvatanje jedne kategorije', N'3', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (93, CAST(N'2020-08-24T11:18:24.6894624' AS DateTime2), N'Update posta', N'{"Id":2,"Title":"Update posta","Text":"Update posta Update posta Update posta","CategoryId":3,"PostedAt":"2020-08-24T11:16:16.846Z","Category":{"Id":3,"CategoryName":"Health update","Posts":[{"Id":0,"Title":"Update posta","Text":"Update posta Update posta Update posta","CategoryId":3,"PostedAt":"2020-08-24T11:16:16.846Z","Category":null,"CreatedAt":"2020-08-24T11:16:16.846Z","ModifiedAt":"2020-08-24T11:16:16.846Z","IsDeleted":false,"IsActive":true}],"CreatedAt":"2020-08-24T11:16:16.846Z","ModifiedAt":"2020-08-24T11:16:16.846Z","IsDeleted":false,"IsActive":true}}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (94, CAST(N'2020-08-24T11:19:54.5514861' AS DateTime2), N'Update posta', N'{"Id":2,"Title":"Update posta","Text":"Update posta Update posta Update posta","CategoryId":3,"PostedAt":"2020-08-24T11:16:16.846Z","Category":null}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (95, CAST(N'2020-08-24T11:22:01.9957387' AS DateTime2), N'Update posta', N'{"Id":2,"Title":"Update posta","Text":"Update posta Update posta Update posta","CategoryId":2,"PostedAt":"2020-08-24T11:16:16.846Z","Category":null}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (96, CAST(N'2020-08-24T11:22:37.2243688' AS DateTime2), N'Delete post', N'6', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (97, CAST(N'2020-08-24T11:23:21.8613740' AS DateTime2), N'Update posta', N'{"Id":3,"Title":"Update posta","Text":"Update posta Update posta Update posta","CategoryId":2,"PostedAt":"2020-08-24T11:16:16.846Z","Category":null}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (98, CAST(N'2020-08-24T11:24:45.3364406' AS DateTime2), N'Update posta', N'{"Id":2,"Title":"string","Text":"string","CategoryId":0,"PostedAt":"2020-08-24T11:24:35.243Z","Category":{"Id":0,"CategoryName":"string","Posts":[{"Id":0,"Title":"string","Text":"string","CategoryId":0,"PostedAt":"2020-08-24T11:24:35.243Z","Category":null,"CreatedAt":"2020-08-24T11:24:35.243Z","ModifiedAt":"2020-08-24T11:24:35.243Z","IsDeleted":true,"IsActive":true}],"CreatedAt":"2020-08-24T11:24:35.243Z","ModifiedAt":"2020-08-24T11:24:35.244Z","IsDeleted":true,"IsActive":true}}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (99, CAST(N'2020-08-24T11:25:36.5149141' AS DateTime2), N'Update posta', N'{"Id":2,"Title":"string","Text":"string","CategoryId":2,"PostedAt":"2020-08-24T11:24:35.243Z","Category":{"Id":0,"CategoryName":"string","Posts":[{"Id":0,"Title":"string","Text":"string","CategoryId":2,"PostedAt":"2020-08-24T11:24:35.243Z","Category":null,"CreatedAt":"2020-08-24T11:24:35.243Z","ModifiedAt":"2020-08-24T11:24:35.243Z","IsDeleted":true,"IsActive":true}],"CreatedAt":"2020-08-24T11:24:35.243Z","ModifiedAt":"2020-08-24T11:24:35.244Z","IsDeleted":true,"IsActive":true}}', N'AnonymousActor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (100, CAST(N'2020-08-24T14:43:22.6035202' AS DateTime2), N'Dohvatanje postova', N'{"Title":"sonja","Text":null,"CategoryId":0,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (101, CAST(N'2020-08-24T14:44:06.2880738' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":"sonja","CategoryId":0,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (102, CAST(N'2020-08-24T14:44:27.1291030' AS DateTime2), N'Dohvatanje postova', N'{"Title":"sonja","Text":"sonja","CategoryId":0,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (103, CAST(N'2020-08-24T14:44:50.2199579' AS DateTime2), N'Dohvatanje postova', N'{"Title":"sonja","Text":"sonja","CategoryId":2,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (104, CAST(N'2020-08-24T14:46:04.1055323' AS DateTime2), N'Dohvatanje postova', N'{"Title":"sonja","Text":null,"CategoryId":0,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (105, CAST(N'2020-08-24T14:47:50.1234419' AS DateTime2), N'Dohvatanje postova', N'{"Title":"update","Text":null,"CategoryId":0,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (106, CAST(N'2020-08-24T14:48:15.2883000' AS DateTime2), N'Dohvatanje postova', N'{"Title":"update","Text":null,"CategoryId":0,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (107, CAST(N'2020-08-24T14:48:39.5256766' AS DateTime2), N'Dohvatanje postova', N'{"Title":"updat","Text":null,"CategoryId":0,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (108, CAST(N'2020-08-24T14:48:52.4521694' AS DateTime2), N'Dohvatanje postova', N'{"Title":"updat","Text":"update","CategoryId":0,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (109, CAST(N'2020-08-24T14:56:12.5809308' AS DateTime2), N'Dohvatanje postova', N'{"Title":"sonja","Text":null,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (110, CAST(N'2020-08-24T14:56:43.2673009' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":null,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (111, CAST(N'2020-08-24T14:59:32.9501101' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":null,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (112, CAST(N'2020-08-24T15:00:03.8329583' AS DateTime2), N'Select kategorija', N'{"Name":null,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (113, CAST(N'2020-08-24T15:00:19.7893667' AS DateTime2), N'Select kategorija', N'{"Name":null,"PerPage":1,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (114, CAST(N'2020-08-24T15:00:34.0370447' AS DateTime2), N'Select kategorija', N'{"Name":null,"PerPage":1,"Page":2}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (115, CAST(N'2020-08-24T15:03:53.7816563' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":null,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (116, CAST(N'2020-08-24T15:06:00.3390213' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":null,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (117, CAST(N'2020-08-24T15:06:28.9186462' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":"sonja","PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (118, CAST(N'2020-08-24T15:06:43.9550646' AS DateTime2), N'Dohvatanje postova', N'{"Title":"string","Text":null,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (119, CAST(N'2020-08-24T15:06:56.0432767' AS DateTime2), N'Dohvatanje postova', N'{"Title":"test","Text":null,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (120, CAST(N'2020-08-24T15:07:14.3514534' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":"tekst","PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (121, CAST(N'2020-08-24T15:07:22.5463115' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":null,"PerPage":3,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (122, CAST(N'2020-08-24T15:07:43.8713351' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":null,"PerPage":3,"Page":2}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (123, CAST(N'2020-08-24T15:07:58.2975857' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":null,"PerPage":3,"Page":3}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (124, CAST(N'2020-08-24T15:08:06.3189534' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":"post","PerPage":3,"Page":3}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (125, CAST(N'2020-08-24T15:08:13.1234821' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":"post","PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (126, CAST(N'2020-08-24T16:52:29.7244029' AS DateTime2), N'Select Svih korisnika', N'{"Username":null,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (127, CAST(N'2020-08-24T17:13:28.0707313' AS DateTime2), N'Delete komentar', N'1', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (128, CAST(N'2020-08-24T17:49:20.4601454' AS DateTime2), N'Delete komentar', N'1', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (129, CAST(N'2020-08-24T18:07:58.5861404' AS DateTime2), N'Update komentara', N'{"Id":1,"Text":"string","UserId":0,"PostId":0,"Post":{"Id":0,"Title":"string","Text":"string","CategoryId":0,"PostedAt":"2020-08-24T18:07:15.624Z","Category":{"Id":0,"CategoryName":"string","Posts":[null],"CreatedAt":"2020-08-24T18:07:15.624Z","ModifiedAt":"2020-08-24T18:07:15.624Z","IsDeleted":true,"IsActive":true},"Comments":[{"Id":0,"Text":"string","UserId":0,"PostId":0,"Post":null,"User":{"Id":0,"Username":"string","FirstName":"string","LastName":"string","Password":"string","Email":"string","UserUseCases":[{"Id":0,"UserId":0,"UseCaseId":0,"User":null}],"CreatedAt":"2020-08-24T18:07:15.624Z","ModifiedAt":"2020-08-24T18:07:15.624Z","IsDeleted":true,"IsActive":true},"CreatedAt":"2020-08-24T18:07:15.624Z","ModifiedAt":"2020-08-24T18:07:15.625Z","IsDeleted":true,"IsActive":true}],"CreatedAt":"2020-08-24T18:07:15.625Z","ModifiedAt":"2020-08-24T18:07:15.625Z","IsDeleted":true,"IsActive":true},"User":{"Id":0,"Username":"string","FirstName":"string","LastName":"string","Password":"string","Email":"string","UserUseCases":[{"Id":0,"UserId":0,"UseCaseId":0,"User":null}],"CreatedAt":"2020-08-24T18:07:15.625Z","ModifiedAt":"2020-08-24T18:07:15.625Z","IsDeleted":true,"IsActive":true}}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (130, CAST(N'2020-08-24T18:34:49.4968666' AS DateTime2), N'Komentari', N'{"Text":null,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (131, CAST(N'2020-08-24T23:59:04.6503511' AS DateTime2), N'Select kategorija', N'{"Name":null,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (132, CAST(N'2020-08-25T10:45:40.7695722' AS DateTime2), N'Komentari', N'{"Text":null,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (133, CAST(N'2020-08-25T12:57:28.3901330' AS DateTime2), N'Select Svih korisnika', N'{"Username":null,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (134, CAST(N'2020-08-25T12:58:00.9571262' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":null,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (135, CAST(N'2020-08-25T14:09:35.8693666' AS DateTime2), N'Dodavanje komentara', N'{"Id":0,"Text":"Komentar na vesr br 3","UserId":4,"PostId":3}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (136, CAST(N'2020-08-25T14:13:59.9227621' AS DateTime2), N'Komentari', N'{"Text":null,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (137, CAST(N'2020-08-25T14:14:40.9375386' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":null,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (138, CAST(N'2020-08-25T14:15:50.2734794' AS DateTime2), N'Select kategorija', N'{"Name":null,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (139, CAST(N'2020-08-25T15:02:01.4669760' AS DateTime2), N'Delete slike', N'1', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (140, CAST(N'2020-08-25T15:03:35.6926691' AS DateTime2), N'Delete slike', N'2', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (141, CAST(N'2020-08-25T15:06:01.2615101' AS DateTime2), N'Delete slike', N'1', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (142, CAST(N'2020-08-25T15:08:32.6215296' AS DateTime2), N'Delete slike', N'2', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (143, CAST(N'2020-08-25T16:06:53.7291322' AS DateTime2), N'Prikaz slika', N'{"Alt":null,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (144, CAST(N'2020-08-25T16:09:44.8156672' AS DateTime2), N'Prikaz slika', N'{"Alt":null,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (145, CAST(N'2020-08-25T16:35:31.6531095' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":null,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (146, CAST(N'2020-08-25T16:36:18.0050403' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":null,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (147, CAST(N'2020-08-25T16:36:37.4899963' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":null,"PerPage":2,"Page":2}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (148, CAST(N'2020-08-25T16:38:33.2628835' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":null,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (149, CAST(N'2020-08-25T16:39:18.1696460' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":null,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (150, CAST(N'2020-08-25T16:39:24.3263318' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":null,"PerPage":2,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (151, CAST(N'2020-08-25T16:42:21.7253436' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":null,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (152, CAST(N'2020-08-25T17:13:42.0229135' AS DateTime2), N'Pretraga UseCaseLogera', N'{"Date":"0001-01-01T00:00:00","UseCaseName":"upload","Actor":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (153, CAST(N'2020-08-25T17:14:53.3205228' AS DateTime2), N'Pretraga UseCaseLogera', N'{"Date":"0001-01-01T00:00:00","UseCaseName":"user","Actor":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (154, CAST(N'2020-08-25T17:15:47.6726299' AS DateTime2), N'Pretraga UseCaseLogera', N'{"Date":"0001-01-01T00:00:00","UseCaseName":null,"Actor":"pera","DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (155, CAST(N'2020-08-25T17:18:32.0979959' AS DateTime2), N'User registration.', N'{"Id":0,"FirstName":"Svetlucava","LastName":"Sjajna","Username":"svetlucavasjajna","Password":"sifra1","Email":"svetlucava@sjajna.com"}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (156, CAST(N'2020-08-25T17:19:19.7022764' AS DateTime2), N'Select Svih korisnika', N'{"Username":null,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (157, CAST(N'2020-08-25T17:20:02.0090222' AS DateTime2), N'Select Svih korisnika', N'{"Username":null,"PerPage":10,"Page":2}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (158, CAST(N'2020-08-25T17:20:30.7827361' AS DateTime2), N'Pretraga UseCaseLogera', N'{"Date":"0001-01-01T00:00:00","UseCaseName":null,"Actor":"svetlucava","DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (159, CAST(N'2020-08-25T17:38:19.6589412' AS DateTime2), N'Pretraga UseCaseLogera', N'{"Date":"0001-01-01T00:00:00","UseCaseName":null,"Actor":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (160, CAST(N'2020-08-25T17:39:21.1549916' AS DateTime2), N'Dohvatanje jedne kategorije', N'2', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (161, CAST(N'2020-08-25T17:41:03.1852826' AS DateTime2), N'Pretraga UseCaseLogera', N'{"Date":"0001-01-01T00:00:00","UseCaseName":null,"Actor":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","PerPage":10,"Page":1}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (162, CAST(N'2020-08-25T21:50:53.1088607' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":null,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (163, CAST(N'2020-08-25T21:57:57.6350493' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":null,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (164, CAST(N'2020-08-25T22:00:36.5978429' AS DateTime2), N'Dohvatanje jedne kategorije', N'2', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (165, CAST(N'2020-08-25T22:03:16.6735670' AS DateTime2), N'Pretraga UseCaseLogera', N'{"Date":"0001-01-01T00:00:00","UseCaseName":null,"Actor":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","PerPage":10,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (166, CAST(N'2020-08-25T22:04:31.7230732' AS DateTime2), N'Pretraga UseCaseLogera', N'{"Date":"2020-08-18T17:50:42.5069406","UseCaseName":null,"Actor":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","PerPage":10,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (167, CAST(N'2020-08-25T22:05:29.1579700' AS DateTime2), N'Pretraga UseCaseLogera', N'{"Date":"0001-01-01T00:00:00","UseCaseName":null,"Actor":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"2020-08-18T17:50:12.7060504","PerPage":10,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (168, CAST(N'2020-08-25T22:05:54.6778979' AS DateTime2), N'Pretraga UseCaseLogera', N'{"Date":"0001-01-01T00:00:00","UseCaseName":null,"Actor":"pera","DateFrom":"0001-01-01T00:00:00","DateTo":"2020-08-18T17:50:12.7060504","PerPage":10,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (169, CAST(N'2020-08-25T22:06:52.2417325' AS DateTime2), N'Select Svih korisnika', N'{"Username":null,"PerPage":10,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (170, CAST(N'2020-08-25T22:09:38.6020725' AS DateTime2), N'Pretraga UseCaseLogera', N'{"Date":"0001-01-01T00:00:00","UseCaseName":null,"Actor":"pera","DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","PerPage":10,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (171, CAST(N'2020-08-25T22:09:40.1340654' AS DateTime2), N'Pretraga UseCaseLogera', N'{"Date":"0001-01-01T00:00:00","UseCaseName":null,"Actor":"pera","DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","PerPage":10,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (172, CAST(N'2020-08-25T22:10:14.8620608' AS DateTime2), N'Komentari', N'{"Text":null,"PerPage":10,"Page":1}', N'Admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (173, CAST(N'2020-08-25T22:31:43.0117157' AS DateTime2), N'User registration.', N'{"Id":0,"FirstName":"Noiv","LastName":"novi","Username":"novak","Password":"sifra1","Email":"sonja.damjanovic.111.14@ict.edu.rs"}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (174, CAST(N'2020-08-25T22:59:29.9034216' AS DateTime2), N'Pretraga UseCaseLogera', N'{"Date":"0001-01-01T00:00:00","UseCaseName":null,"Actor":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","PerPage":10,"Page":1}', N'laza')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (175, CAST(N'2020-08-25T23:00:11.2279983' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":null,"PerPage":10,"Page":1}', N'laza')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (176, CAST(N'2020-08-25T23:02:44.6232828' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":null,"PerPage":10,"Page":1}', N'laza')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (177, CAST(N'2020-08-25T23:03:46.4518997' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":null,"PerPage":10,"Page":1}', N'laza')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (178, CAST(N'2020-08-25T23:07:19.0929060' AS DateTime2), N'Pretraga UseCaseLogera', N'{"Date":"0001-01-01T00:00:00","UseCaseName":null,"Actor":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","PerPage":10,"Page":1}', N'laza')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (179, CAST(N'2020-08-25T23:08:21.2949583' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":null,"PerPage":10,"Page":1}', N'laza')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (180, CAST(N'2020-08-25T23:18:02.8152710' AS DateTime2), N'Select Svih korisnika', N'{"Username":null,"PerPage":10,"Page":1}', N'laza')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (181, CAST(N'2020-08-25T23:18:26.2145162' AS DateTime2), N'Select Svih korisnika', N'{"Username":null,"PerPage":10,"Page":1}', N'laza')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (182, CAST(N'2020-08-25T23:22:02.7099628' AS DateTime2), N'Select Svih korisnika', N'{"Username":null,"PerPage":10,"Page":1}', N'laza')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (183, CAST(N'2020-08-25T23:30:05.7802668' AS DateTime2), N'Komentari', N'{"Text":null,"PerPage":10,"Page":1}', N'laza')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (184, CAST(N'2020-08-26T00:19:03.2496557' AS DateTime2), N'Insert userusecase', N'{"Id":0,"UserId":2,"UseCaseId":24,"User":{"Id":0,"Username":"string","FirstName":"string","LastName":"string","Password":"string","Email":"string","UserUseCases":[{"Id":0,"UserId":0,"UseCaseId":0,"User":null}],"CreatedAt":"2020-08-26T00:18:36.464Z","ModifiedAt":"2020-08-26T00:18:36.464Z","IsDeleted":true,"IsActive":true}}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (185, CAST(N'2021-06-16T19:16:34.5277788' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":null,"CategoryId":0,"PerPage":10,"Page":1}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (186, CAST(N'2021-06-16T19:20:26.5513758' AS DateTime2), N'Select Svih korisnika', N'{"Username":null,"PerPage":10,"Page":1}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (187, CAST(N'2021-06-16T21:43:54.0108604' AS DateTime2), N'Pretraga UseCaseLogera', N'{"Date":"0001-01-01T00:00:00","UseCaseName":null,"Actor":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","PerPage":10,"Page":1}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (188, CAST(N'2021-06-16T21:44:15.5805129' AS DateTime2), N'Pretraga UseCaseLogera', N'{"Date":"0001-01-01T00:00:00","UseCaseName":null,"Actor":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","PerPage":10,"Page":10}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (189, CAST(N'2021-06-16T21:44:29.5476341' AS DateTime2), N'Select kategorija', N'{"Name":null,"PerPage":10,"Page":1}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (190, CAST(N'2021-06-16T21:45:27.9238742' AS DateTime2), N'Pravljenje nove kategorije', N'{"Id":5,"CategoryName":"hronika","Posts":[{"Title":"string","Text":"string","CategoryId":0,"PostedAt":"2021-06-16T21:44:46.976Z","Category":{"CategoryName":"string","Posts":[null],"Id":0,"CreatedAt":"2021-06-16T21:44:46.976Z","ModifiedAt":"2021-06-16T21:44:46.976Z","IsDeleted":true,"IsActive":true},"Comments":[{"Text":"string","UserId":0,"PostId":0,"Post":null,"User":{"Username":"string","FirstName":"string","LastName":"string","Password":"string","Email":"string","UserUseCases":[{"Id":0,"UserId":0,"UseCaseId":0,"User":null}],"Comments":[null],"Id":0,"CreatedAt":"2021-06-16T21:44:46.976Z","ModifiedAt":"2021-06-16T21:44:46.977Z","IsDeleted":true,"IsActive":true},"Id":0,"CreatedAt":"2021-06-16T21:44:46.977Z","ModifiedAt":"2021-06-16T21:44:46.977Z","IsDeleted":true,"IsActive":true}],"Pictures":[{"PictureName":"string","PostId":0,"Alt":"string","Post":null,"Id":0,"CreatedAt":"2021-06-16T21:44:46.977Z","ModifiedAt":"2021-06-16T21:44:46.977Z","IsDeleted":true,"IsActive":true}],"Id":0,"CreatedAt":"2021-06-16T21:44:46.977Z","ModifiedAt":"2021-06-16T21:44:46.977Z","IsDeleted":true,"IsActive":true}]}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (191, CAST(N'2021-06-16T21:45:48.3510919' AS DateTime2), N'Select kategorija', N'{"Name":null,"PerPage":10,"Page":1}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (192, CAST(N'2021-06-16T21:46:31.1666482' AS DateTime2), N'Pravljenje nove kategorije', N'{"Id":6,"CategoryName":"Politika","Posts":null}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (193, CAST(N'2021-06-16T21:46:49.7275729' AS DateTime2), N'Select kategorija', N'{"Name":null,"PerPage":10,"Page":1}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (194, CAST(N'2021-06-16T21:47:10.5535945' AS DateTime2), N'Dohvatanje jedne kategorije', N'2', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (195, CAST(N'2021-06-16T21:48:09.4623496' AS DateTime2), N'Brisanje kategorije', N'2', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (196, CAST(N'2021-06-16T21:52:46.1067183' AS DateTime2), N'Komentari', N'{"Text":null,"PerPage":10,"Page":1}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (197, CAST(N'2021-06-16T21:54:06.6076030' AS DateTime2), N'Komentari', N'{"Text":null,"PerPage":10,"Page":1}', N'laza')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (198, CAST(N'2021-06-16T21:55:31.2013067' AS DateTime2), N'Dodavanje komentara', N'{"Id":13,"Text":"Radi li ","UserId":3,"PostId":3,"Post":null,"User":null}', N'laza')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (199, CAST(N'2021-06-16T21:56:46.9819731' AS DateTime2), N'Update komentara', N'{"Id":2,"Text":"string update","UserId":2,"PostId":2,"Post":null,"User":null}', N'laza')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (200, CAST(N'2021-06-16T21:57:18.0237937' AS DateTime2), N'Delete komentar', N'2', N'laza')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (201, CAST(N'2021-06-16T21:59:18.7057260' AS DateTime2), N'Dohvatanje jedne kategorije', N'3', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (202, CAST(N'2021-06-16T22:01:08.7938945' AS DateTime2), N'Dodavanje komentara', N'{"Id":13,"Text":"Radi li ","UserId":3,"PostId":3,"Post":null,"User":null}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (203, CAST(N'2021-06-16T22:01:45.6743168' AS DateTime2), N'Update komentara', N'{"Id":2,"Text":"string update","UserId":2,"PostId":2,"Post":null,"User":null}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (204, CAST(N'2021-06-16T22:02:17.6543846' AS DateTime2), N'Prikaz slika', N'{"Alt":null,"PerPage":10,"Page":1}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (205, CAST(N'2021-06-16T22:03:43.1344192' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":null,"CategoryId":0,"PerPage":10,"Page":1}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (206, CAST(N'2021-06-16T22:04:07.4010965' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":null,"CategoryId":0,"PerPage":10,"Page":2}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (207, CAST(N'2021-06-16T22:04:09.3969523' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":null,"CategoryId":0,"PerPage":10,"Page":2}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (208, CAST(N'2021-06-16T22:06:41.4554175' AS DateTime2), N'Dodavanje novog posta', N'{"Id":0,"Title":"Novi post","Text":"Novi post novi post","CategoryId":2,"PostedAt":"2021-06-16T22:04:35.075Z","Category":null,"Comments":null,"Pictures":null}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (209, CAST(N'2021-06-16T22:07:10.4961347' AS DateTime2), N'Dodavanje novog posta', N'{"Id":0,"Title":"Novi post 123","Text":"Novi post novi post","CategoryId":2,"PostedAt":"2021-06-16T22:04:35.075Z","Category":null,"Comments":null,"Pictures":null}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (210, CAST(N'2021-06-16T22:07:48.0925319' AS DateTime2), N'Dodavanje novog posta', N'{"Id":0,"Title":"Novi post 123589","Text":"Novi post novi post","CategoryId":2,"PostedAt":"2021-06-16T22:04:35.075Z","Category":null,"Comments":null,"Pictures":null}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (211, CAST(N'2021-06-16T22:08:54.8487719' AS DateTime2), N'Dohvatanje jednog posta po id-ju', N'2', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (212, CAST(N'2021-06-16T22:09:55.3863746' AS DateTime2), N'Delete post', N'2', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (213, CAST(N'2021-06-16T22:10:27.6824834' AS DateTime2), N'Select Svih korisnika', N'{"Username":null,"PerPage":10,"Page":1}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (214, CAST(N'2021-06-16T22:14:01.2381523' AS DateTime2), N'Select Svih korisnika', N'{"Username":null,"PerPage":10,"Page":1}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (215, CAST(N'2021-06-16T22:14:04.7396628' AS DateTime2), N'Select Svih korisnika', N'{"Username":null,"PerPage":10,"Page":1}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (216, CAST(N'2021-06-16T22:15:10.9347969' AS DateTime2), N'Dohvatanje korisnika po ID', N'2', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (217, CAST(N'2021-06-16T22:16:42.1452108' AS DateTime2), N'Update korisnika', N'{"Id":3,"FirstName":"jagoda","LastName":"jagodic","Username":"jagoda","Password":"sifra1","Email":"jagoda@gmail.com"}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (218, CAST(N'2021-06-16T22:17:07.8124441' AS DateTime2), N'Select Svih korisnika', N'{"Username":null,"PerPage":10,"Page":1}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (219, CAST(N'2021-06-16T22:17:52.6319367' AS DateTime2), N'Brisanje korisnika iz baze', N'3', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (220, CAST(N'2021-06-16T22:19:09.0174032' AS DateTime2), N'Delete userUseCase', N'3', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (221, CAST(N'2021-06-16T22:20:26.8664186' AS DateTime2), N'Delete userUseCase', N'3', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (222, CAST(N'2021-06-16T22:21:22.8168527' AS DateTime2), N'Select kategorija', N'{"Name":null,"PerPage":10,"Page":1}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (223, CAST(N'2021-06-16T22:22:07.1218343' AS DateTime2), N'Dohvatanje jedne kategorije', N'3', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (224, CAST(N'2021-06-16T22:22:41.1419591' AS DateTime2), N'Brisanje kategorije', N'4', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (225, CAST(N'2021-06-16T22:23:50.4738154' AS DateTime2), N'Brisanje kategorije', N'0', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (226, CAST(N'2021-06-16T22:24:18.2223999' AS DateTime2), N'Brisanje kategorije', N'1', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (227, CAST(N'2021-06-16T22:24:31.2763865' AS DateTime2), N'Brisanje kategorije', N'2', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (228, CAST(N'2021-06-16T22:31:23.5350724' AS DateTime2), N'Select kategorija', N'{"Name":null,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (229, CAST(N'2021-06-16T22:32:54.0581461' AS DateTime2), N'Select kategorija', N'{"Name":null,"PerPage":10,"Page":1}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (230, CAST(N'2021-06-16T22:33:18.9943931' AS DateTime2), N'Dohvatanje jedne kategorije', N'6', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (231, CAST(N'2021-06-16T22:33:51.2283259' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":null,"CategoryId":0,"PerPage":10,"Page":1}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (232, CAST(N'2021-06-16T22:34:08.2783901' AS DateTime2), N'Dohvatanje jednog posta po id-ju', N'30', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (233, CAST(N'2021-06-16T22:35:40.1202941' AS DateTime2), N'Dodavanje novog posta', N'{"Id":20,"Title":"Title za post","Text":"TExt tekst ","CategoryId":6,"PostedAt":"2021-06-16T22:34:40.772Z","Category":null,"Comments":null,"Pictures":null}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (234, CAST(N'2021-06-16T22:35:53.5699938' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":null,"CategoryId":0,"PerPage":10,"Page":1}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (235, CAST(N'2021-06-16T23:23:14.9920489' AS DateTime2), N'Dohvatanje jedne kategorije', N'6', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (236, CAST(N'2021-06-16T23:23:44.7426417' AS DateTime2), N'Komentari', N'{"Text":null,"PerPage":10,"Page":1}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (237, CAST(N'2021-06-16T23:25:20.5322000' AS DateTime2), N'Brisanje kategorije', N'6', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (238, CAST(N'2021-06-16T23:26:59.0655493' AS DateTime2), N'Brisanje kategorije', N'3', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (239, CAST(N'2021-06-16T23:29:23.0690515' AS DateTime2), N'Komentari', N'{"Text":null,"PerPage":10,"Page":1}', N'laza')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (240, CAST(N'2021-06-16T23:30:03.4293901' AS DateTime2), N'Dohvatanje jedne kategorije', N'6', N'laza')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (241, CAST(N'2021-06-16T23:30:43.9590550' AS DateTime2), N'Dodavanje komentara', N'{"Id":12,"Text":"komenst","UserId":2,"PostId":2,"Post":null,"User":null}', N'laza')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (242, CAST(N'2021-06-16T23:31:01.9140406' AS DateTime2), N'Komentari', N'{"Text":null,"PerPage":10,"Page":1}', N'laza')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (243, CAST(N'2021-06-16T23:31:51.7653781' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":null,"CategoryId":0,"PerPage":10,"Page":1}', N'laza')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (244, CAST(N'2021-06-17T09:30:49.2974651' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":null,"CategoryId":0,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (245, CAST(N'2021-06-17T09:36:54.3781977' AS DateTime2), N'Dohvatanje jednog posta po id-ju', N'30', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (246, CAST(N'2021-06-17T09:37:17.4037421' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":null,"CategoryId":0,"PerPage":10,"Page":1}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (247, CAST(N'2021-06-17T09:37:25.5733131' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":null,"CategoryId":0,"PerPage":10,"Page":1}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (248, CAST(N'2021-06-17T09:37:47.0261880' AS DateTime2), N'Select Svih korisnika', N'{"Username":null,"PerPage":10,"Page":1}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (249, CAST(N'2021-06-17T09:38:30.7789913' AS DateTime2), N'Dohvatanje jednog posta po id-ju', N'44', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (250, CAST(N'2021-06-17T09:39:19.3713270' AS DateTime2), N'Komentari', N'{"Text":null,"PerPage":10,"Page":1}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (251, CAST(N'2021-06-17T09:40:40.6192044' AS DateTime2), N'Pretraga UseCaseLogera', N'{"Date":"0001-01-01T00:00:00","UseCaseName":null,"Actor":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","PerPage":10,"Page":1}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (252, CAST(N'2021-06-17T09:42:44.8692692' AS DateTime2), N'Pretraga UseCaseLogera', N'{"Date":"0001-01-01T00:00:00","UseCaseName":null,"Actor":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","PerPage":10,"Page":24}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (253, CAST(N'2021-06-17T09:43:13.4634677' AS DateTime2), N'Pretraga UseCaseLogera', N'{"Date":"0001-01-01T00:00:00","UseCaseName":"brisanje","Actor":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","PerPage":10,"Page":1}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (254, CAST(N'2021-06-17T09:43:54.7228394' AS DateTime2), N'Select kategorija', N'{"Name":null,"PerPage":10,"Page":1}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (255, CAST(N'2021-06-17T09:44:35.5749011' AS DateTime2), N'Dohvatanje jedne kategorije', N'3', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (256, CAST(N'2021-06-17T09:45:03.5829147' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":null,"CategoryId":0,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (257, CAST(N'2021-06-17T09:45:26.2453390' AS DateTime2), N'Select Svih korisnika', N'{"Username":"sonja","PerPage":10,"Page":1}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (258, CAST(N'2021-06-17T09:45:46.6597481' AS DateTime2), N'Dohvatanje jednog posta po id-ju', N'30', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (259, CAST(N'2021-06-17T09:45:57.5988776' AS DateTime2), N'Select Svih korisnika', N'{"Username":"laza","PerPage":10,"Page":1}', N'pera')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (260, CAST(N'2021-06-17T10:44:36.1254004' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":null,"CategoryId":0,"PerPage":10,"Page":1}', N'AnonymousActor')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (261, CAST(N'2021-06-17T10:45:32.6121640' AS DateTime2), N'Dohvatanje postova', N'{"Title":null,"Text":null,"CategoryId":0,"PerPage":10,"Page":1}', N'AnonymousActor')
SET IDENTITY_INSERT [dbo].[UseCaseLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Username], [FirstName], [LastName], [Password], [Email]) VALUES (1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, N'pera', N'Petar', N'Peric', N'sifra1', N'')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Username], [FirstName], [LastName], [Password], [Email]) VALUES (2, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, N'laza', N'Lazar', N'Lazic', N'sifra1', N'')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Username], [FirstName], [LastName], [Password], [Email]) VALUES (3, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2021-06-17T00:17:52.8799497' AS DateTime2), 1, 0, N'sonjakkk', N'sonja', N'damj', N'sifra1', N'sonja@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Username], [FirstName], [LastName], [Password], [Email]) VALUES (4, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 1, 0, N'sonjadamkkk', N'sonja', N'damj', N'sifra1', N'sonjadamjanovic@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Username], [FirstName], [LastName], [Password], [Email]) VALUES (5, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 1, 0, N'sonjadamjanovic', N'sonja', N'damj', N'sifra1', N'sonjadamjanovic@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Username], [FirstName], [LastName], [Password], [Email]) VALUES (6, CAST(N'2021-06-17T00:16:42.4971179' AS DateTime2), NULL, 0, 1, N'jagoda', N'jagoda', N'jagodic', N'sifra1', N'jagoda@gmail.com')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserUseCases] ON 

INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1, 1, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (4, 1, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (5, 1, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (6, 2, 15)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (7, 1, 5)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (8, 1, 6)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (10, 1, 7)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (11, 1, 8)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (12, 1, 9)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (13, 1, 10)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (14, 1, 11)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (15, 1, 12)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (16, 1, 13)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (17, 1, 14)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (18, 1, 15)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (19, 1, 16)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (20, 1, 17)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (21, 1, 18)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (22, 1, 19)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (23, 1, 20)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (24, 1, 22)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (25, 1, 23)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (26, 1, 24)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (27, 2, 8)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (28, 2, 11)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (29, 2, 16)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (30, 2, 18)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (31, 2, 19)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (32, 2, 21)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (33, 1, 25)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (34, 1, 26)
SET IDENTITY_INSERT [dbo].[UserUseCases] OFF
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Posts] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Posts] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Posts] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Posts] ADD  DEFAULT ('2021-06-16T16:51:18.9762311Z') FOR [PostedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'') FOR [Email]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Posts_PostId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users_UserId]
GO
ALTER TABLE [dbo].[Pictures]  WITH CHECK ADD  CONSTRAINT [FK_Pictures_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[Pictures] CHECK CONSTRAINT [FK_Pictures_Posts_PostId]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Categories_CategoryId]
GO
ALTER TABLE [dbo].[UserUseCases]  WITH CHECK ADD  CONSTRAINT [FK_UserUseCases_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserUseCases] CHECK CONSTRAINT [FK_UserUseCases_Users_UserId]
GO
