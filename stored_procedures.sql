/*
    Procedure Name: proGetHomePageAnswersForUser
    Description: 
        Retrieves a distinct list of answers for questions related to topics followed by the specified user (@UserID).
        For each answer, it returns the answer creator's details (name, credential, image), question content, answer content, creation date,
        as well as counts of comments, upvotes, downvotes, and shares associated with the answer.

    Parameters:
        @UserID INT - The ID of the current user for whom the homepage content is being fetched.

    Usage:
        Execute this procedure with the user ID to get relevant answers for the user's homepage feed.
*/


CREATE PROCEDURE dbo.proGetHomePageAnswersForUser
    @UserID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT DISTINCT 
        p.name,
        p.credintial,
        p.img_url,
        cquestions.contentBody AS question, 
        cAnswer.contentBody AS questionAnswer, 
        cAnswer.created_at,
        cAnswer.contentID,
        a.answerID,

        -- number of comments
        dbo.getNumberOfCommentsByAnswerId(a.answerID) AS comments,

        -- number of upvotes
        dbo.getNumberOfUpvotesByContentId(cAnswer.contentId) AS upvotes,

        -- number of downvotes
        dbo.getNumberOfDownvotesByContentId(cAnswer.contentId) AS downvotes,

        -- number of shares
        dbo.getNumberOfSharesByContentId(cAnswer.contentID) AS shares

    FROM Content cAnswer 
    INNER JOIN Answer a ON cAnswer.contentID = a.contentID
    INNER JOIN Questions q ON a.questionID = q.questionID
    INNER JOIN Content cquestions ON q.contentID = cquestions.contentID
    INNER JOIN profile p ON cAnswer.creatorID = p.userID

    -- Filter answers based on topics followed by the current user
    INNER JOIN questionTopics qt ON qt.questiontID = q.questionID
    INNER JOIN topics t ON t.topicID = qt.topicID
    INNER JOIN TopicFollowers tf ON tf.topicID = t.topicID
    INNER JOIN profile currentUser ON currentUser.userID = tf.followerID

    WHERE tf.followerID = @UserID
END
GO
---------------------------------------------------------
/*
    Procedure Name: proGetCommentsForAnswer
    Description: 
        Retrieves all comments for a specific answer, including:
        - The question and answer content
        - Comment content, creation date, and comment ID
        - The names of the post creator and comment creator
        - Count of upvotes and shares on each comment

    Parameters:
        @AnswerID INT - The ID of the answer for which comments are being retrieved.

    Usage:
        EXEC proGetCommentsForAnswer @AnswerID = 1
*/

CREATE PROCEDURE proGetCommentsForAnswer
    @AnswerID INT
AS
BEGIN
    SELECT  
        postCreator.name,
        cquestions.contentBody AS question, 
        cAnswer.contentBody AS questionAnswer, 
        commentCreator.name,
        commentContent.contentBody AS comments,
        commentContent.created_at,
        Comment.commentID,

        -- Number of upvotes for each comment
        dbo.getNumberOfUpvotesByContentId(Comment.contentId) AS upvotes,

        -- Number of shares for each comment
        dbo.getNumberOfSharesByContentId(Comment.contentID) AS shares

    FROM Content cAnswer 
    INNER JOIN Answer a ON cAnswer.contentID = a.contentID
    INNER JOIN Questions q ON a.questionID = q.questionID
    INNER JOIN Content cquestions ON q.contentID = cquestions.contentID

    INNER JOIN AnswerComments ON a.answerID = AnswerComments.answerID

    LEFT JOIN Comment ON Comment.commentID = AnswerComments.commentID
    LEFT JOIN Content commentContent ON commentContent.contentID = Comment.contentID
    LEFT JOIN profile commentCreator ON commentCreator.userID = commentContent.creatorID

    INNER JOIN profile postCreator ON cAnswer.creatorID = postCreator.userID

    WHERE a.answerID = @AnswerID
END
GO
-------------------------------------------------
/*
    Procedure Name: proGetAllPostsWithStats
    Description: 
        Retrieves all posts along with:
        - Creator's name, profile image, and credential
        - Post creation date and content
        - Number of comments, upvotes, and downvotes for each post

    Parameters:
        None

    Usage:
        EXEC proGetAllPostsWithStats
*/

CREATE PROCEDURE proGetAllPostsWithStats
AS
BEGIN
    SELECT 
        profile.name,
        profile.img_url,
        profile.credintial,
        postContent.created_at,
        postContent.contentBody AS posts,

        -- Total comments on the post
        dbo.getNumberOfCommentsByPostId(post.postID) AS comments,

        -- Total upvotes on the post
        dbo.getNumberOfUpvotesByContentId(postContent.contentID) AS upvotes,

        -- Total downvotes on the post
        dbo.getNumberOfDownvotesByContentId(postContent.contentID) AS downvotes

    FROM content postContent
    INNER JOIN Post post ON post.contentID = postContent.contentID
    INNER JOIN profile ON profile.userID = postContent.creatorID
END
GO

---------------------------------------------

/*
    Procedure Name: proGetUserFollowedTopicsAndSpaces
    Description: 
        Returns all topics and spaces that a specific user is following.

    Parameters:
        @UserID INT — The ID of the user whose followed topics and spaces are to be retrieved.

    Usage:
        EXEC proGetUserFollowedTopicsAndSpaces @UserID = 21
*/

CREATE PROCEDURE proGetUserFollowedTopicsAndSpaces
    @UserID INT
AS
BEGIN
    SELECT *
    FROM dbo.getUserFollowedTopicsAndSpaces(@UserID)
END
GO
-------------------------------------------------

/*
    Procedure Name: proGetRecommendedQuestionsForUser
    Description:
        Returns questions that belong to topics followed by a specific user.
        Also returns number of answers and followers for each question.

    Parameters:
        @UserID INT — The ID of the user

    Example Usage:
        EXEC proGetRecommendedQuestionsForUser @UserID = 21
*/
CREATE PROCEDURE proGetRecommendedQuestionsForUser
    @UserID INT
AS
BEGIN
    SELECT DISTINCT
        Content.contentBody AS question,
        Content.created_at,
        dbo.getNumberOfFollowersByQuestionId(Questions.questionID) AS followers,
        dbo.getNumberOfAnswersByQuestionId(Questions.questionID) AS answers
    FROM Content
    INNER JOIN Questions ON Questions.contentID = Content.contentID
    INNER JOIN questionTopics ON questionTopics.questiontID = Questions.questionID
    INNER JOIN topics ON topics.topicID = questionTopics.topicID
    INNER JOIN TopicFollowers ON TopicFollowers.topicID = topics.topicID
    WHERE TopicFollowers.followerID = @UserID
END
GO
----------------------------------------------------
/*
    Procedure Name: proGetUserProfileOverview
    Description:
        Retrieves full profile info for a specific user, including:
        - Personal details (name, credential, etc.)
        - Statistics (followers, followings, spaces, posts, answers, questions)

    Parameters:
        @UserID INT — The ID of the user

    Example Usage:
        EXEC proGetUserProfileOverview @UserID = 2
*/
CREATE PROCEDURE proGetUserProfileOverview
    @UserID INT
AS
BEGIN
    SELECT  
        p.name,
        p.credintial,
        p.img_url,
        p.education,
        p.employment,
        p.locationName,
        p.creationDate AS joinAt,

        dbo.getUserFollowersCount(p.userID) AS followers,
        dbo.getUserFollowingCount(p.userID) AS following,
        dbo.getUserOwnedSpacesCount(p.userID) AS active_in_spaces,
        dbo.getUserPostsCount(p.userID) AS posts,
        dbo.getUserAnswersCount(p.userID) AS answers,
        dbo.getUserQuestionsCount(p.userID) AS questions
    FROM profile p
    WHERE p.userID = @UserID
END
GO
------------------------------------------------
/*
    Procedure Name: proGetUserAnswers
    Description:
        Returns all answers posted by a specific user, including:
        - Question text
        - Answer content
        - Number of comments, upvotes, downvotes, and shares

    Parameters:
        @UserID INT — The ID of the answer creator

    Example Usage:
        EXEC proGetUserAnswers @UserID = 4
*/
CREATE PROCEDURE proGetUserAnswers
    @UserID INT
AS
BEGIN
    SELECT 
        questionContent.contentBody AS question,
        answerContent.contentBody AS answer,
        dbo.getNumberOfCommentsByAnswerId(Answer.answerID) AS comments,
        dbo.getNumberOfUpvotesByContentId(answerContent.contentID) AS upvotes,
        dbo.getNumberOfDownvotesByContentId(answerContent.contentID) AS downvotes,
        dbo.getNumberOfSharesByContentId(answerContent.contentID) AS shares
    FROM Content questionContent
    INNER JOIN Questions ON Questions.contentID = questionContent.contentID
    INNER JOIN Answer ON Answer.questionID = Questions.questionID
    INNER JOIN Content answerContent ON answerContent.contentID = Answer.contentID
    WHERE answerContent.creatorID = @UserID
END
GO
-------------------------------------------------------
/*
    Procedure Name: proGetUserAnswerComments
    Description:
        Returns all comments made on a specific answer written by a specific user.
        Also returns question, answer content, and number of upvotes/downvotes per comment.

    Parameters:
        @AnswerID INT — The ID of the answer
        @UserID INT — The user who wrote the answer

    Example Usage:
        EXEC proGetUserAnswerComments @AnswerID = 20, @UserID = 20
*/
CREATE PROCEDURE proGetUserAnswerComments
    @AnswerID INT,
    @UserID INT
AS
BEGIN
    SELECT
        dbo.getQuestionTextByQuestionId(An.QuestionID) AS Question,
        A.ContentBody AS Answer,
        C.ContentBody AS Comment,
        dbo.getNumberOfUpvotesByContentId(C.ContentID) AS Upvotes,
        dbo.getNumberOfDownvotesByContentId(C.ContentID) AS Downvotes
    FROM Answer An
    INNER JOIN Content A ON A.ContentID = An.ContentID AND A.CreatorID = @UserID
    INNER JOIN AnswerComments AC ON AC.AnswerID = An.AnswerID
    INNER JOIN Comment Cm ON Cm.CommentID = AC.CommentID
    INNER JOIN Content C ON C.ContentID = Cm.ContentID
    WHERE An.AnswerID = @AnswerID
END
GO
--------------------------------------------------------
/*
    Procedure Name: proGetQuestionsByUser
    Description:
        Retrieves all questions written by a user and their number of answers and followers.

    Parameters:
        @UserID INT — The ID of the user

    Example Usage:
        EXEC proGetQuestionsByUser @UserID = 1
*/
CREATE PROCEDURE proGetQuestionsByUser
    @UserID INT
AS
BEGIN
    SELECT
        Q.ContentBody AS Question,
        dbo.getAnswerCountByQuestionId(Qs.QuestionID) AS Answers,
        dbo.getFollowerNumberByQuestionId(Qs.QuestionID) AS Followers
    FROM Content Q
    INNER JOIN Questions Qs ON Qs.ContentID = Q.ContentID
    WHERE Q.CreatorID = @UserID
END
GO
---------------------------------------------
/*
    Procedure Name: proGetAnswersToUserQuestions
    Description:
        Returns all answers to questions written by a specific user,
        including question and answer creator info.

    Parameters:
        @UserID INT — The ID of the question creator

    Example Usage:
        EXEC proGetAnswersToUserQuestions @UserID = 1
*/
CREATE PROCEDURE proGetAnswersToUserQuestions
    @UserID INT
AS
BEGIN
    SELECT
        questionCreator.Name AS question_creator,
        q.ContentBody AS question,
        answerCreator.Name AS answer_creator,
        answerCreator.Credintial,
        answerCreator.Img_Url,
        a.ContentBody AS answer_content
    FROM Content q
    INNER JOIN Questions qs ON qs.ContentID = q.ContentID
    LEFT JOIN Answer ans ON ans.QuestionID = qs.QuestionID
    LEFT JOIN Content a ON a.ContentID = ans.ContentID
    LEFT JOIN Profile questionCreator ON questionCreator.UserID = q.CreatorID
    LEFT JOIN Profile answerCreator ON answerCreator.UserID = a.CreatorID
    WHERE q.CreatorID = @UserID
END
GO
---------------------------------------------------
/*
    Procedure Name: proGetUserFollowers
    Description:
        Returns a list of all users who follow a specific user.

    Parameters:
        @UserID INT — The ID of the followed user

    Example Usage:
        EXEC proGetUserFollowers @UserID = 1
*/
CREATE PROCEDURE proGetUserFollowers
    @UserID INT
AS
BEGIN
    SELECT
        followed.Name AS followed,
        follower.Name AS follower
    FROM UserFollowers
    INNER JOIN Profile followed ON UserFollowers.FollowedID = followed.UserID
    INNER JOIN Profile follower ON UserFollowers.FollowerID = follower.UserID
    WHERE followed.UserID = @UserID
    ORDER BY followed
END
GO

--------------------------------------------------
/*
    Procedure Name: proGetUserFollowing
    Description:
        Returns a list of all users that a specific user is following.

    Parameters:
        @UserID INT — The follower's user ID

    Example Usage:
        EXEC proGetUserFollowing @UserID = 1
*/
CREATE PROCEDURE proGetUserFollowing
    @UserID INT
AS
BEGIN
    SELECT 
        followed.Name AS followed,
        follower.Name AS follower
    FROM UserFollowers
    INNER JOIN Profile followed ON UserFollowers.FollowedID = followed.UserID
    INNER JOIN Profile follower ON UserFollowers.FollowerID = follower.UserID
    WHERE follower.UserID = @UserID
    ORDER BY followed
END
GO

-------------------------------------------

/*
    Procedure Name: proGetUserSpaces
    Description:
        Returns the names of all spaces that a user is a member of with a role of Admin, Contributor, or Moderator.

    Parameters:
        @UserID INT — The ID of the user

    Example Usage:
        EXEC proGetUserSpaces @UserID = 1
*/
CREATE PROCEDURE proGetUserSpaces
    @UserID INT
AS
BEGIN
    SELECT s.Name AS space_name
    FROM Space s
    INNER JOIN SpaceMembers sm ON sm.SpaceID = s.SpaceID
    WHERE sm.MemberID = @UserID AND sm.MemberSpaceRole IN (1, 2, 3)
END
GO
-----------------------------------------
/*
    Procedure Name: proGetUserFollowedTopics
    Description:
        Returns the titles of all topics followed by a specific user.

    Parameters:
        @UserID INT — The ID of the user

    Example Usage:
        EXEC proGetUserFollowedTopics @UserID = 1
*/
CREATE PROCEDURE proGetUserFollowedTopics
    @UserID INT
AS
BEGIN
    SELECT t.topicTitle
    FROM Topics t
    INNER JOIN TopicFollowers tf ON tf.topicID = t.topicID
    WHERE tf.followerID = @UserID
END
GO
----------------------------------------
/*
    Procedure Name: proGetSpaceDetails
    Description:
        Returns detailed information about a specific space including:
        - Space name, icon, cover photo, description, and details
        - Number of contributors, followers, and today's posts

    Parameters:
        @SpaceID INT — The ID of the space

    Example Usage:
        EXEC proGetSpaceDetails @SpaceID = 1
*/
CREATE PROCEDURE proGetSpaceDetails
    @SpaceID INT
AS
BEGIN
    SELECT 
        s.Name,
        s.Icon,
        s.Cover_Photo,
        s.Discribtion,
        s.Details,
        dbo.getSpaceContributorsCount(s.SpaceID) AS contributors,
        dbo.getSpaceFollowersCount(s.SpaceID) AS followers,
        dbo.getTodayPostsCountInSpace(s.SpaceID) AS posts_today
    FROM Space s
    WHERE s.SpaceID = @SpaceID
END
GO
--------------------------------------
/*
    Procedure Name: proGetSpacePosts
    Description:
        Returns all posts from a specific space.
        Includes:
        - Author name, profile image, experience in the space
        - Post content and date
        - Number of comments, upvotes, and shares

    Parameters:
        @SpaceID INT — The ID of the space

    Example Usage:
        EXEC proGetSpacePosts @SpaceID = 21
*/
CREATE PROCEDURE proGetSpacePosts
    @SpaceID INT
AS
BEGIN
    SELECT DISTINCT
        profile.Name AS name,
        member.Experience AS experience,
        profile.Img_Url AS image,
        postContent.ContentBody AS post,
        postContent.Created_At AS post_date,
        dbo.getNumberOfCommentsByPostId(posts.PostID) AS comments,
        dbo.getNumberOfUpvotesByContentId(posts.ContentID) AS votes,
        dbo.getNumberOfSharesByContentId(posts.ContentID) AS shares
    FROM Space space
    INNER JOIN SpacePosts sp ON sp.SpaceID = space.SpaceID AND space.SpaceID = @SpaceID
    INNER JOIN Post posts ON posts.PostID = sp.PostID
    INNER JOIN Content postContent ON postContent.ContentID = posts.ContentID
    INNER JOIN SpaceMembers member ON member.MemberID = postContent.CreatorID
    INNER JOIN Profile ON profile.UserID = member.MemberID
END
GO
---------------------------------------------
/*
    Procedure Name: proGetSpaceAdmins
    Description:
        Returns all admins in a specific space, including their names, profile image, and experience.

    Parameters:
        @SpaceID INT — The ID of the space

    Example Usage:
        EXEC proGetSpaceAdmins @SpaceID = 1
*/
CREATE PROCEDURE proGetSpaceAdmins
    @SpaceID INT
AS
BEGIN
    SELECT 
        p.Name AS admin_name,
        sm.Experience,
        p.Img_Url
    FROM SpaceMembers sm
    INNER JOIN Space s ON s.SpaceID = sm.SpaceID AND s.SpaceID = @SpaceID
    INNER JOIN Profile p ON p.UserID = sm.MemberID
    WHERE sm.MemberSpaceRole = 1
END
GO
--------------------------------------------
/*
    Procedure Name: proGetSpaceContributors
    Description:
        Returns all contributors in a space (role = 2), including name, profile image, and experience.

    Parameters:
        @SpaceID INT — The ID of the space

    Example Usage:
        EXEC proGetSpaceContributors @SpaceID = 20
*/
CREATE PROCEDURE proGetSpaceContributors
    @SpaceID INT
AS
BEGIN
    SELECT 
        p.Name AS contributor_name,
        sm.Experience,
        p.Img_Url
    FROM SpaceMembers sm
    INNER JOIN Space s ON s.SpaceID = sm.SpaceID AND s.SpaceID = @SpaceID
    INNER JOIN Profile p ON p.UserID = sm.MemberID
    WHERE sm.MemberSpaceRole = 2
END
GO
---------------------------------------
/*
    Procedure Name: proGetSpaceFollowers
    Description:
        Returns all followers (role = 4) in a specific space, including profile and experience.

    Parameters:
        @SpaceID INT — The ID of the space

    Example Usage:
        EXEC proGetSpaceFollowers @SpaceID = 1
*/
CREATE PROCEDURE proGetSpaceFollowers
    @SpaceID INT
AS
BEGIN
    SELECT 
        p.Name AS follower_name,
        sm.Experience,
        p.Img_Url
    FROM SpaceMembers sm
    INNER JOIN Space s ON s.SpaceID = sm.SpaceID AND s.SpaceID = @SpaceID
    INNER JOIN Profile p ON p.UserID = sm.MemberID
    WHERE sm.MemberSpaceRole = 4
END
GO
-----------------------------------------
/*
    Procedure Name: proGetSpaceQuestions
    Description:
        Returns all questions in a given space.
        Includes question content, creation date, and number of answers and followers.

    Parameters:
        @SpaceID INT — The ID of the space

    Example Usage:
        EXEC proGetSpaceQuestions @SpaceID = 1
*/
CREATE PROCEDURE proGetSpaceQuestions
    @SpaceID INT
AS
BEGIN
    SELECT 
        questionContent.ContentBody AS question_text,
        questionContent.Created_At AS question_date,
        dbo.getAnswerCountByQuestionId(Questions.QuestionID) AS total_answers,
        dbo.getFollowerNumberByQuestionId(Questions.QuestionID) AS total_followers
    FROM Space
    INNER JOIN SpaceQuestions ON Space.SpaceID = SpaceQuestions.SpaceID
    INNER JOIN Questions ON Questions.QuestionID = SpaceQuestions.QuestiontID
    INNER JOIN Content questionContent ON questionContent.ContentID = Questions.ContentID
    WHERE Space.SpaceID = @SpaceID
END
GO
----------------------------------------------

