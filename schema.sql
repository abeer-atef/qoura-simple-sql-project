USE [QuoraDB]
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 10/5/2025 9:12:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[contentID] [int] NOT NULL,
	[answerID] [int] NOT NULL,
	[questionID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[answerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnswerComments]    Script Date: 10/5/2025 9:12:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnswerComments](
	[commentID] [int] NOT NULL,
	[answerID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[commentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 10/5/2025 9:12:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[contentID] [int] NOT NULL,
	[commentID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[commentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Content]    Script Date: 10/5/2025 9:12:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Content](
	[contentID] [int] NOT NULL,
	[creatorID] [int] NOT NULL,
	[contentBody] [nvarchar](max) NULL,
	[img_url] [nvarchar](100) NULL,
	[created_at] [date] NOT NULL,
	[updated_at] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[contentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 10/5/2025 9:12:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[contentID] [int] NOT NULL,
	[postID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[postID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostComments]    Script Date: 10/5/2025 9:12:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostComments](
	[commentID] [int] NOT NULL,
	[postID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[commentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[profile]    Script Date: 10/5/2025 9:12:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profile](
	[userID] [int] NOT NULL,
	[name] [nvarchar](20) NOT NULL,
	[bio] [nvarchar](60) NULL,
	[img_url] [nvarchar](60) NULL,
	[credintial] [nvarchar](60) NULL,
	[employment] [nvarchar](60) NULL,
	[education] [nvarchar](60) NULL,
	[locationName] [nvarchar](60) NULL,
	[locationStartDate] [date] NULL,
	[locationEndDate] [date] NULL,
	[creationDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionFollowers]    Script Date: 10/5/2025 9:12:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionFollowers](
	[questiontID] [int] NOT NULL,
	[userID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[questiontID] ASC,
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 10/5/2025 9:12:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[contentID] [int] NOT NULL,
	[questionID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[questionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[questionTopics]    Script Date: 10/5/2025 9:12:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[questionTopics](
	[questiontID] [int] NOT NULL,
	[topicID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[questiontID] ASC,
	[topicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shares]    Script Date: 10/5/2025 9:12:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shares](
	[contentID] [int] NOT NULL,
	[userID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[contentID] ASC,
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Space]    Script Date: 10/5/2025 9:12:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Space](
	[spaceID] [int] NOT NULL,
	[ownerID] [int] NOT NULL,
	[name] [nvarchar](60) NULL,
	[discribtion] [nvarchar](60) NULL,
	[details] [nvarchar](500) NULL,
	[creationDate] [date] NOT NULL,
	[is_private] [int] NOT NULL,
	[icon] [nvarchar](100) NULL,
	[cover_photo] [nvarchar](100) NULL,
	[color] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[spaceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpaceMembers]    Script Date: 10/5/2025 9:12:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpaceMembers](
	[spaceID] [int] NOT NULL,
	[memberID] [int] NOT NULL,
	[experience] [nvarchar](60) NULL,
	[memberSpaceRole] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[spaceID] ASC,
	[memberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpacePosts]    Script Date: 10/5/2025 9:12:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpacePosts](
	[spaceID] [int] NOT NULL,
	[postID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[spaceID] ASC,
	[postID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpaceQuestions]    Script Date: 10/5/2025 9:12:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpaceQuestions](
	[questiontID] [int] NOT NULL,
	[spaceID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[questiontID] ASC,
	[spaceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpaceRoles]    Script Date: 10/5/2025 9:12:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpaceRoles](
	[roleID] [int] NOT NULL,
	[Role] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TopicFollowers]    Script Date: 10/5/2025 9:12:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TopicFollowers](
	[followerID] [int] NOT NULL,
	[topicID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[followerID] ASC,
	[topicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[topics]    Script Date: 10/5/2025 9:12:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[topics](
	[topicID] [int] NOT NULL,
	[topicTitle] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[topicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserFollowers]    Script Date: 10/5/2025 9:12:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserFollowers](
	[followerID] [int] NOT NULL,
	[followedID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[followerID] ASC,
	[followedID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 10/5/2025 9:12:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[roleID] [int] NOT NULL,
	[role] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/5/2025 9:12:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userID] [int] NOT NULL,
	[userName] [nvarchar](20) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[password] [nvarchar](20) NULL,
	[roleID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Votes]    Script Date: 10/5/2025 9:12:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Votes](
	[contentID] [int] NOT NULL,
	[userID] [int] NOT NULL,
	[value] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[contentID] ASC,
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Answer] ([contentID], [answerID], [questionID]) VALUES (3, 1, 1)
GO
INSERT [dbo].[Answer] ([contentID], [answerID], [questionID]) VALUES (4, 2, 2)
GO
INSERT [dbo].[Answer] ([contentID], [answerID], [questionID]) VALUES (10, 3, 1)
GO
INSERT [dbo].[Answer] ([contentID], [answerID], [questionID]) VALUES (21, 20, 20)
GO
INSERT [dbo].[Answer] ([contentID], [answerID], [questionID]) VALUES (23, 21, 21)
GO
INSERT [dbo].[AnswerComments] ([commentID], [answerID]) VALUES (1, 1)
GO
INSERT [dbo].[AnswerComments] ([commentID], [answerID]) VALUES (3, 2)
GO
INSERT [dbo].[AnswerComments] ([commentID], [answerID]) VALUES (20, 20)
GO
INSERT [dbo].[AnswerComments] ([commentID], [answerID]) VALUES (22, 21)
GO
INSERT [dbo].[Comment] ([contentID], [commentID]) VALUES (7, 1)
GO
INSERT [dbo].[Comment] ([contentID], [commentID]) VALUES (8, 2)
GO
INSERT [dbo].[Comment] ([contentID], [commentID]) VALUES (9, 3)
GO
INSERT [dbo].[Comment] ([contentID], [commentID]) VALUES (26, 20)
GO
INSERT [dbo].[Comment] ([contentID], [commentID]) VALUES (27, 21)
GO
INSERT [dbo].[Comment] ([contentID], [commentID]) VALUES (28, 22)
GO
INSERT [dbo].[Content] ([contentID], [creatorID], [contentBody], [img_url], [created_at], [updated_at]) VALUES (1, 1, N'What is Artificial Intelligence?', NULL, CAST(N'2025-09-09' AS Date), NULL)
GO
INSERT [dbo].[Content] ([contentID], [creatorID], [contentBody], [img_url], [created_at], [updated_at]) VALUES (2, 2, N'How to learn backend development?', NULL, CAST(N'2025-09-09' AS Date), NULL)
GO
INSERT [dbo].[Content] ([contentID], [creatorID], [contentBody], [img_url], [created_at], [updated_at]) VALUES (3, 4, N'AI is the simulation of human intelligence.', NULL, CAST(N'2025-09-09' AS Date), NULL)
GO
INSERT [dbo].[Content] ([contentID], [creatorID], [contentBody], [img_url], [created_at], [updated_at]) VALUES (4, 3, N'Start with Python, then learn frameworks like Django.', NULL, CAST(N'2025-09-09' AS Date), NULL)
GO
INSERT [dbo].[Content] ([contentID], [creatorID], [contentBody], [img_url], [created_at], [updated_at]) VALUES (5, 1, N'Just finished reading a great book on AI!', NULL, CAST(N'2025-09-09' AS Date), NULL)
GO
INSERT [dbo].[Content] ([contentID], [creatorID], [contentBody], [img_url], [created_at], [updated_at]) VALUES (6, 2, N'Started my backend journey today!', NULL, CAST(N'2025-09-09' AS Date), NULL)
GO
INSERT [dbo].[Content] ([contentID], [creatorID], [contentBody], [img_url], [created_at], [updated_at]) VALUES (7, 2, N'Great answer!', NULL, CAST(N'2025-09-09' AS Date), NULL)
GO
INSERT [dbo].[Content] ([contentID], [creatorID], [contentBody], [img_url], [created_at], [updated_at]) VALUES (8, 1, N'Thanks for sharing!', NULL, CAST(N'2025-09-09' AS Date), NULL)
GO
INSERT [dbo].[Content] ([contentID], [creatorID], [contentBody], [img_url], [created_at], [updated_at]) VALUES (9, 1, N'This helped me a lot.', NULL, CAST(N'2025-09-09' AS Date), NULL)
GO
INSERT [dbo].[Content] ([contentID], [creatorID], [contentBody], [img_url], [created_at], [updated_at]) VALUES (10, 3, N'AI helps machines make decisions like humans.', NULL, CAST(N'2025-09-09' AS Date), NULL)
GO
INSERT [dbo].[Content] ([contentID], [creatorID], [contentBody], [img_url], [created_at], [updated_at]) VALUES (11, 2, N'What is the difference between AI and Machine Learning?', NULL, CAST(N'2025-09-09' AS Date), NULL)
GO
INSERT [dbo].[Content] ([contentID], [creatorID], [contentBody], [img_url], [created_at], [updated_at]) VALUES (20, 21, N'What are the best resources to learn data science?', NULL, CAST(N'2025-09-11' AS Date), NULL)
GO
INSERT [dbo].[Content] ([contentID], [creatorID], [contentBody], [img_url], [created_at], [updated_at]) VALUES (21, 20, N'Check out Coursera, fast.ai, and Kaggle.', NULL, CAST(N'2025-09-11' AS Date), NULL)
GO
INSERT [dbo].[Content] ([contentID], [creatorID], [contentBody], [img_url], [created_at], [updated_at]) VALUES (22, 22, N'Is CSS Grid better than Flexbox for layout?', NULL, CAST(N'2025-09-11' AS Date), NULL)
GO
INSERT [dbo].[Content] ([contentID], [creatorID], [contentBody], [img_url], [created_at], [updated_at]) VALUES (23, 23, N'Depends on the use case, but Grid is more powerful.', NULL, CAST(N'2025-09-11' AS Date), NULL)
GO
INSERT [dbo].[Content] ([contentID], [creatorID], [contentBody], [img_url], [created_at], [updated_at]) VALUES (24, 22, N'Just finished a long article on UI/UX basics!', NULL, CAST(N'2025-09-11' AS Date), NULL)
GO
INSERT [dbo].[Content] ([contentID], [creatorID], [contentBody], [img_url], [created_at], [updated_at]) VALUES (25, 20, N'Shared a Figma tutorial I loved!', NULL, CAST(N'2025-09-11' AS Date), NULL)
GO
INSERT [dbo].[Content] ([contentID], [creatorID], [contentBody], [img_url], [created_at], [updated_at]) VALUES (26, 22, N'Great explanation, thanks!', NULL, CAST(N'2025-09-11' AS Date), NULL)
GO
INSERT [dbo].[Content] ([contentID], [creatorID], [contentBody], [img_url], [created_at], [updated_at]) VALUES (27, 21, N'Interesting post, keep it up!', NULL, CAST(N'2025-09-11' AS Date), NULL)
GO
INSERT [dbo].[Content] ([contentID], [creatorID], [contentBody], [img_url], [created_at], [updated_at]) VALUES (28, 21, N'Helped me understand flexbox better.', NULL, CAST(N'2025-09-11' AS Date), NULL)
GO
INSERT [dbo].[Post] ([contentID], [postID]) VALUES (5, 1)
GO
INSERT [dbo].[Post] ([contentID], [postID]) VALUES (6, 2)
GO
INSERT [dbo].[Post] ([contentID], [postID]) VALUES (24, 20)
GO
INSERT [dbo].[Post] ([contentID], [postID]) VALUES (25, 21)
GO
INSERT [dbo].[PostComments] ([commentID], [postID]) VALUES (2, 1)
GO
INSERT [dbo].[PostComments] ([commentID], [postID]) VALUES (21, 20)
GO
INSERT [dbo].[profile] ([userID], [name], [bio], [img_url], [credintial], [employment], [education], [locationName], [locationStartDate], [locationEndDate], [creationDate]) VALUES (1, N'Sara Adel', N'Tech Enthusiast', N'sara.jpg', N'Software Engineer', N'Google', N'MIT', N'Cairo', CAST(N'2015-01-01' AS Date), CAST(N'2019-01-01' AS Date), CAST(N'2025-09-09' AS Date))
GO
INSERT [dbo].[profile] ([userID], [name], [bio], [img_url], [credintial], [employment], [education], [locationName], [locationStartDate], [locationEndDate], [creationDate]) VALUES (2, N'Omar Khaled', N'Backend Developer', N'omar.jpg', N'DevOps Specialist', N'Amazon', N'Harvard', N'Giza', CAST(N'2016-01-01' AS Date), CAST(N'2020-01-01' AS Date), CAST(N'2025-09-09' AS Date))
GO
INSERT [dbo].[profile] ([userID], [name], [bio], [img_url], [credintial], [employment], [education], [locationName], [locationStartDate], [locationEndDate], [creationDate]) VALUES (3, N'Noor Samir', N'Writer and Editor', N'noor.jpg', N'Content Writer', N'Freelance', N'AUC', N'Alexandria', CAST(N'2018-01-01' AS Date), CAST(N'2022-01-01' AS Date), CAST(N'2025-09-09' AS Date))
GO
INSERT [dbo].[profile] ([userID], [name], [bio], [img_url], [credintial], [employment], [education], [locationName], [locationStartDate], [locationEndDate], [creationDate]) VALUES (4, N'Khaled Hany', N'AI Researcher', N'khaled.jpg', N'ML Engineer', N'Meta', N'Stanford', N'Mansoura', CAST(N'2014-01-01' AS Date), CAST(N'2018-01-01' AS Date), CAST(N'2025-09-09' AS Date))
GO
INSERT [dbo].[profile] ([userID], [name], [bio], [img_url], [credintial], [employment], [education], [locationName], [locationStartDate], [locationEndDate], [creationDate]) VALUES (20, N'Lina Salah', N'Frontend Dev', N'lina.jpg', N'React Developer', N'Upwork', N'Helwan University', N'Cairo', CAST(N'2017-01-01' AS Date), CAST(N'2021-01-01' AS Date), CAST(N'2025-09-11' AS Date))
GO
INSERT [dbo].[profile] ([userID], [name], [bio], [img_url], [credintial], [employment], [education], [locationName], [locationStartDate], [locationEndDate], [creationDate]) VALUES (21, N'Youssef Adel', N'Data Enthusiast', N'youssef.jpg', N'Data Scientist', N'Microsoft', N'AUC', N'Alexandria', CAST(N'2016-01-01' AS Date), CAST(N'2020-01-01' AS Date), CAST(N'2025-09-11' AS Date))
GO
INSERT [dbo].[profile] ([userID], [name], [bio], [img_url], [credintial], [employment], [education], [locationName], [locationStartDate], [locationEndDate], [creationDate]) VALUES (22, N'Mona Fathy', N'Content Creator', N'mona.jpg', N'Editor', N'Freelance', N'Ain Shams', N'Giza', CAST(N'2018-01-01' AS Date), CAST(N'2022-01-01' AS Date), CAST(N'2025-09-11' AS Date))
GO
INSERT [dbo].[profile] ([userID], [name], [bio], [img_url], [credintial], [employment], [education], [locationName], [locationStartDate], [locationEndDate], [creationDate]) VALUES (23, N'Ahmed Mostafa', N'Project Manager', N'ahmed.jpg', N'PM', N'Valeo', N'MIT', N'Tanta', CAST(N'2015-01-01' AS Date), CAST(N'2019-01-01' AS Date), CAST(N'2025-09-11' AS Date))
GO
INSERT [dbo].[QuestionFollowers] ([questiontID], [userID]) VALUES (1, 1)
GO
INSERT [dbo].[QuestionFollowers] ([questiontID], [userID]) VALUES (1, 2)
GO
INSERT [dbo].[QuestionFollowers] ([questiontID], [userID]) VALUES (1, 4)
GO
INSERT [dbo].[QuestionFollowers] ([questiontID], [userID]) VALUES (2, 2)
GO
INSERT [dbo].[QuestionFollowers] ([questiontID], [userID]) VALUES (2, 3)
GO
INSERT [dbo].[QuestionFollowers] ([questiontID], [userID]) VALUES (20, 20)
GO
INSERT [dbo].[QuestionFollowers] ([questiontID], [userID]) VALUES (20, 22)
GO
INSERT [dbo].[QuestionFollowers] ([questiontID], [userID]) VALUES (21, 21)
GO
INSERT [dbo].[QuestionFollowers] ([questiontID], [userID]) VALUES (21, 23)
GO
INSERT [dbo].[Questions] ([contentID], [questionID]) VALUES (1, 1)
GO
INSERT [dbo].[Questions] ([contentID], [questionID]) VALUES (2, 2)
GO
INSERT [dbo].[Questions] ([contentID], [questionID]) VALUES (11, 3)
GO
INSERT [dbo].[Questions] ([contentID], [questionID]) VALUES (20, 20)
GO
INSERT [dbo].[Questions] ([contentID], [questionID]) VALUES (22, 21)
GO
INSERT [dbo].[questionTopics] ([questiontID], [topicID]) VALUES (1, 1)
GO
INSERT [dbo].[questionTopics] ([questiontID], [topicID]) VALUES (2, 2)
GO
INSERT [dbo].[questionTopics] ([questiontID], [topicID]) VALUES (2, 3)
GO
INSERT [dbo].[questionTopics] ([questiontID], [topicID]) VALUES (3, 1)
GO
INSERT [dbo].[questionTopics] ([questiontID], [topicID]) VALUES (20, 20)
GO
INSERT [dbo].[questionTopics] ([questiontID], [topicID]) VALUES (20, 22)
GO
INSERT [dbo].[questionTopics] ([questiontID], [topicID]) VALUES (21, 21)
GO
INSERT [dbo].[questionTopics] ([questiontID], [topicID]) VALUES (21, 23)
GO
INSERT [dbo].[Shares] ([contentID], [userID]) VALUES (3, 1)
GO
INSERT [dbo].[Shares] ([contentID], [userID]) VALUES (3, 2)
GO
INSERT [dbo].[Shares] ([contentID], [userID]) VALUES (4, 3)
GO
INSERT [dbo].[Shares] ([contentID], [userID]) VALUES (5, 2)
GO
INSERT [dbo].[Shares] ([contentID], [userID]) VALUES (21, 23)
GO
INSERT [dbo].[Shares] ([contentID], [userID]) VALUES (24, 20)
GO
INSERT [dbo].[Shares] ([contentID], [userID]) VALUES (25, 22)
GO
INSERT [dbo].[Space] ([spaceID], [ownerID], [name], [discribtion], [details], [creationDate], [is_private], [icon], [cover_photo], [color]) VALUES (1, 1, N'AI Enthusiasts', N'A space to explore Artificial Intelligence', N'We share research, articles, and discussions about AI.', CAST(N'2025-09-09' AS Date), 0, N'ai_icon.png', N'ai_cover.jpg', N'#123456')
GO
INSERT [dbo].[Space] ([spaceID], [ownerID], [name], [discribtion], [details], [creationDate], [is_private], [icon], [cover_photo], [color]) VALUES (20, 21, N'Data Science Space', N'For data enthusiasts', N'Discussions about data, ML, AI, and more.', CAST(N'2025-09-11' AS Date), 0, N'data_icon.png', N'data_cover.jpg', N'#0055FF')
GO
INSERT [dbo].[Space] ([spaceID], [ownerID], [name], [discribtion], [details], [creationDate], [is_private], [icon], [cover_photo], [color]) VALUES (21, 20, N'Frontend World', N'All about frontend dev', N'CSS, JS, React, Vue, and more.', CAST(N'2025-09-11' AS Date), 0, N'frontend_icon.png', N'frontend_cover.jpg', N'#FF6600')
GO
INSERT [dbo].[SpaceMembers] ([spaceID], [memberID], [experience], [memberSpaceRole]) VALUES (1, 1, N'Founder of the space', 1)
GO
INSERT [dbo].[SpaceMembers] ([spaceID], [memberID], [experience], [memberSpaceRole]) VALUES (1, 2, N'Interested in AI', 4)
GO
INSERT [dbo].[SpaceMembers] ([spaceID], [memberID], [experience], [memberSpaceRole]) VALUES (1, 4, N'Expert in ML', 3)
GO
INSERT [dbo].[SpaceMembers] ([spaceID], [memberID], [experience], [memberSpaceRole]) VALUES (20, 20, N'Just follows', 4)
GO
INSERT [dbo].[SpaceMembers] ([spaceID], [memberID], [experience], [memberSpaceRole]) VALUES (20, 21, N'Owner', 1)
GO
INSERT [dbo].[SpaceMembers] ([spaceID], [memberID], [experience], [memberSpaceRole]) VALUES (20, 22, N'Writes ML articles', 2)
GO
INSERT [dbo].[SpaceMembers] ([spaceID], [memberID], [experience], [memberSpaceRole]) VALUES (20, 23, N'Moderates comments', 3)
GO
INSERT [dbo].[SpaceMembers] ([spaceID], [memberID], [experience], [memberSpaceRole]) VALUES (21, 20, N'Owner', 1)
GO
INSERT [dbo].[SpaceMembers] ([spaceID], [memberID], [experience], [memberSpaceRole]) VALUES (21, 22, N'Writes frontend tips', 2)
GO
INSERT [dbo].[SpaceMembers] ([spaceID], [memberID], [experience], [memberSpaceRole]) VALUES (21, 23, N'Moderates', 3)
GO
INSERT [dbo].[SpacePosts] ([spaceID], [postID]) VALUES (1, 1)
GO
INSERT [dbo].[SpacePosts] ([spaceID], [postID]) VALUES (20, 21)
GO
INSERT [dbo].[SpacePosts] ([spaceID], [postID]) VALUES (21, 20)
GO
INSERT [dbo].[SpaceQuestions] ([questiontID], [spaceID]) VALUES (1, 1)
GO
INSERT [dbo].[SpaceQuestions] ([questiontID], [spaceID]) VALUES (20, 20)
GO
INSERT [dbo].[SpaceQuestions] ([questiontID], [spaceID]) VALUES (21, 21)
GO
INSERT [dbo].[SpaceRoles] ([roleID], [Role]) VALUES (1, N'Admin')
GO
INSERT [dbo].[SpaceRoles] ([roleID], [Role]) VALUES (2, N'contributor')
GO
INSERT [dbo].[SpaceRoles] ([roleID], [Role]) VALUES (4, N'Follower')
GO
INSERT [dbo].[SpaceRoles] ([roleID], [Role]) VALUES (3, N'Moderator')
GO
INSERT [dbo].[TopicFollowers] ([followerID], [topicID]) VALUES (1, 1)
GO
INSERT [dbo].[TopicFollowers] ([followerID], [topicID]) VALUES (1, 2)
GO
INSERT [dbo].[TopicFollowers] ([followerID], [topicID]) VALUES (1, 20)
GO
INSERT [dbo].[TopicFollowers] ([followerID], [topicID]) VALUES (1, 22)
GO
INSERT [dbo].[TopicFollowers] ([followerID], [topicID]) VALUES (2, 1)
GO
INSERT [dbo].[TopicFollowers] ([followerID], [topicID]) VALUES (2, 2)
GO
INSERT [dbo].[TopicFollowers] ([followerID], [topicID]) VALUES (2, 3)
GO
INSERT [dbo].[TopicFollowers] ([followerID], [topicID]) VALUES (2, 21)
GO
INSERT [dbo].[TopicFollowers] ([followerID], [topicID]) VALUES (3, 1)
GO
INSERT [dbo].[TopicFollowers] ([followerID], [topicID]) VALUES (3, 2)
GO
INSERT [dbo].[TopicFollowers] ([followerID], [topicID]) VALUES (3, 22)
GO
INSERT [dbo].[TopicFollowers] ([followerID], [topicID]) VALUES (3, 23)
GO
INSERT [dbo].[TopicFollowers] ([followerID], [topicID]) VALUES (4, 1)
GO
INSERT [dbo].[TopicFollowers] ([followerID], [topicID]) VALUES (4, 3)
GO
INSERT [dbo].[TopicFollowers] ([followerID], [topicID]) VALUES (20, 20)
GO
INSERT [dbo].[TopicFollowers] ([followerID], [topicID]) VALUES (20, 22)
GO
INSERT [dbo].[TopicFollowers] ([followerID], [topicID]) VALUES (21, 1)
GO
INSERT [dbo].[TopicFollowers] ([followerID], [topicID]) VALUES (21, 2)
GO
INSERT [dbo].[TopicFollowers] ([followerID], [topicID]) VALUES (21, 21)
GO
INSERT [dbo].[TopicFollowers] ([followerID], [topicID]) VALUES (21, 22)
GO
INSERT [dbo].[TopicFollowers] ([followerID], [topicID]) VALUES (22, 23)
GO
INSERT [dbo].[TopicFollowers] ([followerID], [topicID]) VALUES (23, 1)
GO
INSERT [dbo].[TopicFollowers] ([followerID], [topicID]) VALUES (23, 20)
GO
INSERT [dbo].[TopicFollowers] ([followerID], [topicID]) VALUES (23, 21)
GO
INSERT [dbo].[topics] ([topicID], [topicTitle]) VALUES (1, N'Artificial Intelligence')
GO
INSERT [dbo].[topics] ([topicID], [topicTitle]) VALUES (2, N'Backend Development')
GO
INSERT [dbo].[topics] ([topicID], [topicTitle]) VALUES (3, N'Career Advice')
GO
INSERT [dbo].[topics] ([topicID], [topicTitle]) VALUES (23, N'CSS Tips')
GO
INSERT [dbo].[topics] ([topicID], [topicTitle]) VALUES (20, N'Data Science')
GO
INSERT [dbo].[topics] ([topicID], [topicTitle]) VALUES (21, N'Frontend Development')
GO
INSERT [dbo].[topics] ([topicID], [topicTitle]) VALUES (22, N'Machine Learning')
GO
INSERT [dbo].[UserFollowers] ([followerID], [followedID]) VALUES (1, 2)
GO
INSERT [dbo].[UserFollowers] ([followerID], [followedID]) VALUES (1, 3)
GO
INSERT [dbo].[UserFollowers] ([followerID], [followedID]) VALUES (1, 4)
GO
INSERT [dbo].[UserFollowers] ([followerID], [followedID]) VALUES (2, 1)
GO
INSERT [dbo].[UserFollowers] ([followerID], [followedID]) VALUES (2, 3)
GO
INSERT [dbo].[UserFollowers] ([followerID], [followedID]) VALUES (2, 4)
GO
INSERT [dbo].[UserFollowers] ([followerID], [followedID]) VALUES (3, 1)
GO
INSERT [dbo].[UserFollowers] ([followerID], [followedID]) VALUES (3, 2)
GO
INSERT [dbo].[UserFollowers] ([followerID], [followedID]) VALUES (4, 1)
GO
INSERT [dbo].[UserFollowers] ([followerID], [followedID]) VALUES (4, 3)
GO
INSERT [dbo].[UserRoles] ([roleID], [role]) VALUES (1, N'Admin')
GO
INSERT [dbo].[UserRoles] ([roleID], [role]) VALUES (2, N'Member')
GO
INSERT [dbo].[Users] ([userID], [userName], [email], [password], [roleID]) VALUES (1, N'sara_22', N'sara@email.com', N'pass123', 1)
GO
INSERT [dbo].[Users] ([userID], [userName], [email], [password], [roleID]) VALUES (2, N'omar_dev', N'omar@email.com', N'pass456', 2)
GO
INSERT [dbo].[Users] ([userID], [userName], [email], [password], [roleID]) VALUES (3, N'noor_writer', N'noor@email.com', N'pass789', 2)
GO
INSERT [dbo].[Users] ([userID], [userName], [email], [password], [roleID]) VALUES (4, N'khaled_ai', N'khaled@email.com', N'pass321', 1)
GO
INSERT [dbo].[Users] ([userID], [userName], [email], [password], [roleID]) VALUES (20, N'lina_dev', N'lina@email.com', N'devpass', 2)
GO
INSERT [dbo].[Users] ([userID], [userName], [email], [password], [roleID]) VALUES (21, N'youssef_ds', N'youssef@email.com', N'ds1234', 1)
GO
INSERT [dbo].[Users] ([userID], [userName], [email], [password], [roleID]) VALUES (22, N'mona_writer', N'mona@email.com', N'monapass', 2)
GO
INSERT [dbo].[Users] ([userID], [userName], [email], [password], [roleID]) VALUES (23, N'ahmed_pm', N'ahmed@email.com', N'ahmed321', 2)
GO
INSERT [dbo].[Votes] ([contentID], [userID], [value]) VALUES (3, 1, 1)
GO
INSERT [dbo].[Votes] ([contentID], [userID], [value]) VALUES (3, 2, 1)
GO
INSERT [dbo].[Votes] ([contentID], [userID], [value]) VALUES (4, 1, 0)
GO
INSERT [dbo].[Votes] ([contentID], [userID], [value]) VALUES (4, 4, 1)
GO
INSERT [dbo].[Votes] ([contentID], [userID], [value]) VALUES (5, 3, 1)
GO
INSERT [dbo].[Votes] ([contentID], [userID], [value]) VALUES (6, 1, 1)
GO
INSERT [dbo].[Votes] ([contentID], [userID], [value]) VALUES (21, 22, 1)
GO
INSERT [dbo].[Votes] ([contentID], [userID], [value]) VALUES (23, 20, 1)
GO
INSERT [dbo].[Votes] ([contentID], [userID], [value]) VALUES (24, 21, 1)
GO
INSERT [dbo].[Votes] ([contentID], [userID], [value]) VALUES (25, 23, 1)
GO
INSERT [dbo].[Votes] ([contentID], [userID], [value]) VALUES (26, 20, 1)
GO
INSERT [dbo].[Votes] ([contentID], [userID], [value]) VALUES (26, 21, 1)
GO
INSERT [dbo].[Votes] ([contentID], [userID], [value]) VALUES (27, 22, 1)
GO
INSERT [dbo].[Votes] ([contentID], [userID], [value]) VALUES (27, 23, 0)
GO
INSERT [dbo].[Votes] ([contentID], [userID], [value]) VALUES (28, 20, 1)
GO
INSERT [dbo].[Votes] ([contentID], [userID], [value]) VALUES (28, 22, 1)
GO
/****** Object:  Index [UQ__Answer__0BDC873893EDD1DD]    Script Date: 10/5/2025 9:12:04 PM ******/
ALTER TABLE [dbo].[Answer] ADD UNIQUE NONCLUSTERED 
(
	[contentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Comment__0BDC8738F36E9C97]    Script Date: 10/5/2025 9:12:04 PM ******/
ALTER TABLE [dbo].[Comment] ADD UNIQUE NONCLUSTERED 
(
	[contentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Post__0BDC873865C1C59C]    Script Date: 10/5/2025 9:12:04 PM ******/
ALTER TABLE [dbo].[Post] ADD UNIQUE NONCLUSTERED 
(
	[contentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Question__0BDC87386882CA26]    Script Date: 10/5/2025 9:12:04 PM ******/
ALTER TABLE [dbo].[Questions] ADD UNIQUE NONCLUSTERED 
(
	[contentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__SpaceRol__DA15413E15F1B72D]    Script Date: 10/5/2025 9:12:04 PM ******/
ALTER TABLE [dbo].[SpaceRoles] ADD UNIQUE NONCLUSTERED 
(
	[Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__topics__7F11FB5DA628E7C4]    Script Date: 10/5/2025 9:12:04 PM ******/
ALTER TABLE [dbo].[topics] ADD UNIQUE NONCLUSTERED 
(
	[topicTitle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__UserRole__863D2148CBA6A0CD]    Script Date: 10/5/2025 9:12:04 PM ******/
ALTER TABLE [dbo].[UserRoles] ADD UNIQUE NONCLUSTERED 
(
	[role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__66DCF95C275450AB]    Script Date: 10/5/2025 9:12:04 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__AB6E616407198DDF]    Script Date: 10/5/2025 9:12:04 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Content] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[profile] ADD  CONSTRAINT [DF_profile_creationDate]  DEFAULT (getdate()) FOR [creationDate]
GO
ALTER TABLE [dbo].[Space] ADD  DEFAULT (getdate()) FOR [creationDate]
GO
ALTER TABLE [dbo].[Space] ADD  DEFAULT ((0)) FOR [is_private]
GO
ALTER TABLE [dbo].[SpaceMembers] ADD  DEFAULT ((1)) FOR [memberSpaceRole]
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD FOREIGN KEY([contentID])
REFERENCES [dbo].[Content] ([contentID])
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Question] FOREIGN KEY([questionID])
REFERENCES [dbo].[Questions] ([questionID])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Question]
GO
ALTER TABLE [dbo].[AnswerComments]  WITH CHECK ADD FOREIGN KEY([answerID])
REFERENCES [dbo].[Answer] ([answerID])
GO
ALTER TABLE [dbo].[AnswerComments]  WITH CHECK ADD FOREIGN KEY([commentID])
REFERENCES [dbo].[Comment] ([commentID])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([contentID])
REFERENCES [dbo].[Content] ([contentID])
GO
ALTER TABLE [dbo].[Content]  WITH CHECK ADD FOREIGN KEY([creatorID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD FOREIGN KEY([contentID])
REFERENCES [dbo].[Content] ([contentID])
GO
ALTER TABLE [dbo].[PostComments]  WITH CHECK ADD FOREIGN KEY([commentID])
REFERENCES [dbo].[Comment] ([commentID])
GO
ALTER TABLE [dbo].[PostComments]  WITH CHECK ADD FOREIGN KEY([postID])
REFERENCES [dbo].[Post] ([postID])
GO
ALTER TABLE [dbo].[profile]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[QuestionFollowers]  WITH CHECK ADD FOREIGN KEY([questiontID])
REFERENCES [dbo].[Questions] ([questionID])
GO
ALTER TABLE [dbo].[QuestionFollowers]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD FOREIGN KEY([contentID])
REFERENCES [dbo].[Content] ([contentID])
GO
ALTER TABLE [dbo].[questionTopics]  WITH CHECK ADD FOREIGN KEY([questiontID])
REFERENCES [dbo].[Questions] ([questionID])
GO
ALTER TABLE [dbo].[questionTopics]  WITH CHECK ADD FOREIGN KEY([topicID])
REFERENCES [dbo].[topics] ([topicID])
GO
ALTER TABLE [dbo].[Shares]  WITH CHECK ADD FOREIGN KEY([contentID])
REFERENCES [dbo].[Content] ([contentID])
GO
ALTER TABLE [dbo].[Shares]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Space]  WITH CHECK ADD FOREIGN KEY([ownerID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[SpaceMembers]  WITH CHECK ADD FOREIGN KEY([memberID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[SpaceMembers]  WITH CHECK ADD FOREIGN KEY([memberSpaceRole])
REFERENCES [dbo].[SpaceRoles] ([roleID])
GO
ALTER TABLE [dbo].[SpaceMembers]  WITH CHECK ADD FOREIGN KEY([spaceID])
REFERENCES [dbo].[Space] ([spaceID])
GO
ALTER TABLE [dbo].[SpacePosts]  WITH CHECK ADD FOREIGN KEY([postID])
REFERENCES [dbo].[Post] ([postID])
GO
ALTER TABLE [dbo].[SpacePosts]  WITH CHECK ADD FOREIGN KEY([spaceID])
REFERENCES [dbo].[Space] ([spaceID])
GO
ALTER TABLE [dbo].[SpaceQuestions]  WITH CHECK ADD FOREIGN KEY([questiontID])
REFERENCES [dbo].[Questions] ([questionID])
GO
ALTER TABLE [dbo].[SpaceQuestions]  WITH CHECK ADD FOREIGN KEY([spaceID])
REFERENCES [dbo].[Space] ([spaceID])
GO
ALTER TABLE [dbo].[TopicFollowers]  WITH CHECK ADD FOREIGN KEY([followerID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[TopicFollowers]  WITH CHECK ADD FOREIGN KEY([topicID])
REFERENCES [dbo].[topics] ([topicID])
GO
ALTER TABLE [dbo].[UserFollowers]  WITH CHECK ADD FOREIGN KEY([followerID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[UserFollowers]  WITH CHECK ADD FOREIGN KEY([followedID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([roleID])
REFERENCES [dbo].[UserRoles] ([roleID])
GO
ALTER TABLE [dbo].[Votes]  WITH CHECK ADD FOREIGN KEY([contentID])
REFERENCES [dbo].[Content] ([contentID])
GO
ALTER TABLE [dbo].[Votes]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Space]  WITH CHECK ADD CHECK  (([is_private]=(1) OR [is_private]=(0)))
GO
ALTER TABLE [dbo].[UserFollowers]  WITH CHECK ADD CHECK  (([followerID]<>[followedID]))
GO
ALTER TABLE [dbo].[Votes]  WITH CHECK ADD CHECK  (([value]=(0) OR [value]=(1)))
GO
