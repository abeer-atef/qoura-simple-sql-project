-------------------------------------------------
-------- posts & questions in home page-----------
--------------------------------------------------


-- This procedure returns answers to questions in topics followed by the user.
-- It shows:
-- - Answer content, related question, author info
-- - Number of comments, upvotes, downvotes, shares

EXEC proGetHomePageAnswersForUser @UserID = 1;
GO

------------------------------

-- This procedure returns comments for a specific answer.
-- It shows:
-- - The answer, related question, comment content and author
-- - Number of upvotes and shares per comment

EXEC proGetCommentsForAnswer @AnswerID = 1;

-----------------------------
-- This procedure returns all general posts with:
-- - Author info, post content, and created date
-- - Number of comments, upvotes, downvotes

EXEC proGetAllPostsWithStats
GO

-----------------------------------------------
-----topics & spaces that followed by user-----
-----------------------------------------------

EXEC proGetUserFollowedTopicsAndSpaces  @UserID = 21;
GO


----------------------------------------------
--------------questions for you---------------
----------------------------------------------

-- This procedure returns suggested questions based on followed topics
-- Shows: question content, creation date, number of answers and followers

EXEC proGetRecommendedQuestionsForUser @UserID = 21
GO

-----------------------------------------------
--------------------profile--------------------
-----------------------------------------------

-- This query returns full profile information for a specific user.
-- It includes:
-- - Name, credential, image, education, job, location, join date
-- - Number of followers and followings
-- - Number of spaces owned
-- - Number of posts, answers, and questions created by the user

EXEC proGetUserProfileOverview @UserID = 2
Go
---------------------------------

-- This query gets all answers written by a specific user (userID = 4),
-- and shows:
-- - The related question content
-- - The answer content
-- - Number of comments on each answer
-- - Number of upvotes and downvotes
-- - Number of times the answer was shared

EXEC proGetUserAnswers @UserID = 4
Go
---------------------------------

-- This query shows all comments on a specific answer
-- written by a specific user.
-- It shows:
-- - The related question
-- - The answer text
-- - Each comment
-- - Number of upvotes and downvotes on each comment

EXEC proGetUserAnswerComments @AnswerID = 20, @UserID = 20
Go
---------------------------------

-- This query shows all questions written by a specific user (userID = 1)
-- It calculates:
-- - Number of answers for each question
-- - Number of followers for each question

EXEC proGetQuestionsByUser @UserID = 1
Go
---------------------------------
-- This query gets all answers for questions written by a specific user (userID = 1)
-- It shows:
-- - Question creator name
-- - Question text
-- - Answer creator name, credential, and image
-- - Answer content

 EXEC proGetAnswersToUserQuestions @UserID = 1
Go
----------------------------
-- This query gets all users that a user is following
-- Shows: follower and followed names

EXEC proGetUserFollowing @UserID = 1;
GO
----------------------------
-- This query gets all followers of a user
-- Shows: followed user and their followers

EXEC proGetUserFollowers @UserID = 1;
GO

----------------------------
-- This query gets all spaces a user is a member of
-- Only includes roles: Admin, Contributor, Moderator

EXEC proGetUserSpaces @UserID = 1
Go
----------------------------
  -- This query gets all topic titles followed by a specific user (userID = 1)

 EXEC proGetUserFollowedTopics @UserID = 1
go
  -----------------------------------------
  --------------space page-----------------
  -----------------------------------------

-- This query gets details about space with ID = 1
-- It also counts:
-- - contributors (roles 1, 2, 3)
-- - followers (role 4)
-- - today's posts

EXEC proGetSpaceDetails @SpaceID = 1
go
---------------------------------------------

-- This query gets posts from space ID = 21
-- For each post, it shows:
-- - Author name, profile image, and experience in space
-- - Post content and date
-- - Number of comments, votes, and shares

 EXEC proGetSpacePosts @SpaceID = 21
Go

--------------------------------------------

-- This query gets all admins in a specific space (spaceID = 1)
-- It shows:
-- - Admin name
-- - Their experience in the space
-- - Their profile image

EXEC proGetSpaceAdmins @SpaceID = 1
Go

-----------------------------------------

  -- This query gets all contributors in a specific space (spaceID = 20)
-- It shows:
-- - Contributor name
-- - Their experience in the space
-- - Their profile image

 EXEC proGetSpaceContributors @SpaceID = 20
 Go
----------------------------------------

  -- This query gets all followers in a specific space (spaceID = 1)
-- It shows:
-- - Follower name
-- - Their experience in the space
-- - Their profile image

EXEC proGetSpaceFollowers @SpaceID = 1
Go
------------------------------------

  -- This query gets all questions in a space
-- It shows:
-- - The question content
-- - When it was created
-- - Total number of answers 
-- - Total number of followers 

EXEC proGetSpaceQuestions @SpaceID = 1
Go