USE [QuoraDB2]
GO
/****** Object:  UserDefinedFunction [dbo].[getAnswerCountByQuestionId]    Script Date: 10/5/2025 9:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getAnswerCountByQuestionId](@questionID INT)
RETURNS INT
AS
BEGIN
    RETURN (
        SELECT COUNT(DISTINCT AnswerID)
        FROM Answer
        WHERE QuestionID = @questionID
    )
END
GO
/****** Object:  UserDefinedFunction [dbo].[getFollowerNumberByQuestionId]    Script Date: 10/5/2025 9:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getFollowerNumberByQuestionId](@questionID INT)
RETURNS INT
AS
BEGIN
    RETURN (
        SELECT COUNT(DISTINCT UserID)
        FROM QuestionFollowers
        WHERE QuestiontID = @questionID
    )
END
GO
/****** Object:  UserDefinedFunction [dbo].[getFollowingCountByUserId]    Script Date: 10/5/2025 9:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[getFollowingCountByUserId](@userID INT)
RETURNS INT
AS
BEGIN
    RETURN (
        SELECT COUNT(DISTINCT FollowedID)
        FROM UserFollowers
        WHERE FollowerID = @userID
    )
END
GO
/****** Object:  UserDefinedFunction [dbo].[getNumberOfAnswersByQuestionId]    Script Date: 10/5/2025 9:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getNumberOfAnswersByQuestionId]
(
    @questionID INT
)
RETURNS INT
AS
BEGIN
    RETURN (
        SELECT COUNT(DISTINCT answerID)
        FROM Answer
        WHERE questionID = @questionID
    );
END;
GO
/****** Object:  UserDefinedFunction [dbo].[getNumberOfCommentsByAnswerId]    Script Date: 10/5/2025 9:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[getNumberOfCommentsByAnswerId](@answerId int)
returns int
as
begin
declare @numberOfComments int
select @numberOfComments=COUNT(AnswerComments.commentID)
from AnswerComments
where AnswerComments.answerID=@answerId
 RETURN @numberOfComments
end
GO
/****** Object:  UserDefinedFunction [dbo].[getNumberOfCommentsByPostId]    Script Date: 10/5/2025 9:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getNumberOfCommentsByPostId]
(
    @postID INT
)
RETURNS INT
AS
BEGIN
    RETURN (
        SELECT COUNT(DISTINCT commentID)
        FROM PostComments
        WHERE postID = @postID
    );
END
GO
/****** Object:  UserDefinedFunction [dbo].[getNumberOfDownvotesByContentId]    Script Date: 10/5/2025 9:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[getNumberOfDownvotesByContentId](@ContentID INT)
RETURNS INT
AS
BEGIN
    DECLARE @Count INT;
    SELECT @Count = COUNT(DISTINCT userID)
    FROM Votes
    WHERE contentID = @ContentID AND value = 0;
    RETURN @Count;
END
GO
/****** Object:  UserDefinedFunction [dbo].[getNumberOfFollowersByQuestionId]    Script Date: 10/5/2025 9:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getNumberOfFollowersByQuestionId]
(
    @questionID INT
)
RETURNS INT
AS
BEGIN
    RETURN (
        SELECT COUNT(DISTINCT userID)
        FROM QuestionFollowers
        WHERE questiontID = @questionID
    );
END;
GO
/****** Object:  UserDefinedFunction [dbo].[getNumberOfSharesByContentId]    Script Date: 10/5/2025 9:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getNumberOfSharesByContentId]
(
    @contentId INT
)
RETURNS INT
AS
BEGIN
    DECLARE @result INT;

    SELECT @result = COUNT(userID)
    FROM Shares
    WHERE contentID = @contentId;

    RETURN @result;
END
GO
/****** Object:  UserDefinedFunction [dbo].[getNumberOfUpvotesAndDownvotes]    Script Date: 10/5/2025 9:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  create function [dbo].[getNumberOfUpvotesAndDownvotes](@contentId int)
  returns
  @result table
  (
  upvotes int ,

  downvotes int
  
  )
  as
  begin 
 
	insert into @result 
  select 
  count (case when v.value=1then v.userID end ) as upvotes,
  count (case when v.value=0 then v.userID end ) as downvotes
  from Votes v
  where v.contentID=@contentId
  return
  end
GO
/****** Object:  UserDefinedFunction [dbo].[getNumberOfUpvotesByContentId]    Script Date: 10/5/2025 9:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getNumberOfUpvotesByContentId](@ContentID INT)
RETURNS INT
AS
BEGIN
    DECLARE @Count INT;
    SELECT @Count = COUNT(DISTINCT userID)
    FROM Votes
    WHERE contentID = @ContentID AND value = 1;
    RETURN @Count;
END
GO
/****** Object:  UserDefinedFunction [dbo].[getQuestionTextByQuestionId]    Script Date: 10/5/2025 9:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[getQuestionTextByQuestionId](@questionID INT)
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @questionText NVARCHAR(MAX)

    SELECT @questionText = C.contentBody
    FROM Questions Q
    INNER JOIN Content C ON Q.contentID = C.contentID
    WHERE Q.questionID = @questionID

    RETURN @questionText
END
GO
/****** Object:  UserDefinedFunction [dbo].[getSpaceContributorsCount]    Script Date: 10/5/2025 9:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- دالة عدد المساهمين في Space
CREATE FUNCTION [dbo].[getSpaceContributorsCount]
(
    @spaceId INT
)
RETURNS INT
AS
BEGIN
    DECLARE @count INT;

    SELECT @count = COUNT(memberId)
    FROM SpaceMembers
    WHERE SpaceID = @spaceId AND MemberSpaceRole IN (1, 2, 3);

    RETURN ISNULL(@count, 0);
END
GO
/****** Object:  UserDefinedFunction [dbo].[getSpaceFollowersCount]    Script Date: 10/5/2025 9:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- دالة عدد المتابعين في Space
CREATE FUNCTION [dbo].[getSpaceFollowersCount]
(
    @spaceId INT
)
RETURNS INT
AS
BEGIN
    DECLARE @count INT;

    SELECT @count = COUNT(memberId)
    FROM SpaceMembers
    WHERE SpaceID = @spaceId AND MemberSpaceRole = 4;

    RETURN ISNULL(@count, 0);
END
GO
/****** Object:  UserDefinedFunction [dbo].[getTodayPostsCountInSpace]    Script Date: 10/5/2025 9:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- دالة عدد المنشورات اليوم في Space
CREATE FUNCTION [dbo].[getTodayPostsCountInSpace]
(
    @spaceId INT
)
RETURNS INT
AS
BEGIN
    DECLARE @count INT;

    SELECT @count = COUNT(DISTINCT sp.PostID)
    FROM SpacePosts sp
    INNER JOIN Post p ON p.PostID = sp.PostID
    INNER JOIN Content c ON c.ContentID = p.ContentID
    WHERE sp.SpaceID = @spaceId
      AND CAST(c.created_at AS DATE) = CAST(GETDATE() AS DATE);

    RETURN ISNULL(@count, 0);
END
GO
/****** Object:  UserDefinedFunction [dbo].[getUserAnswersCount]    Script Date: 10/5/2025 9:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
       CREATE FUNCTION [dbo].[getUserAnswersCount](@userID INT)
RETURNS INT
AS
BEGIN
    RETURN (
        SELECT COUNT(DISTINCT Answer.answerID)
        FROM Answer
        INNER JOIN Content ON Answer.contentID = Content.contentID
        WHERE Content.creatorID = @userID
    )
END   
GO
/****** Object:  UserDefinedFunction [dbo].[getUserFollowedTopicsAndSpaces]    Script Date: 10/5/2025 9:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getUserFollowedTopicsAndSpaces]
(
    @userID INT
)
RETURNS @Result TABLE
(
    name NVARCHAR(255)

)
AS
BEGIN
    -- Add followed topics
    INSERT INTO @Result (name)
    SELECT 
        t.topicTitle

    FROM topics t
    INNER JOIN TopicFollowers tf ON t.topicID = tf.topicID
    WHERE tf.followerID = @userID;

    -- Add joined spaces
    INSERT INTO @Result (name)
    SELECT 
        s.name

    FROM Space s
    INNER JOIN SpaceMembers sm ON s.spaceID = sm.spaceID
    WHERE sm.memberID = @userID;

    RETURN;
END;

GO
/****** Object:  UserDefinedFunction [dbo].[getUserFollowersCount]    Script Date: 10/5/2025 9:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getUserFollowersCount](@userID INT)
RETURNS INT
AS
BEGIN
    RETURN (
        SELECT COUNT(DISTINCT followerID)
        FROM UserFollowers
        WHERE followedID = @userID
    )
END
GO
/****** Object:  UserDefinedFunction [dbo].[getUserFollowingCount]    Script Date: 10/5/2025 9:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getUserFollowingCount](@userID INT)
RETURNS INT
AS
BEGIN
    RETURN (
        SELECT COUNT(DISTINCT followedID)
        FROM UserFollowers
        WHERE followerID = @userID
    )
END
GO
/****** Object:  UserDefinedFunction [dbo].[getUserOwnedSpacesCount]    Script Date: 10/5/2025 9:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getUserOwnedSpacesCount](@userID INT)
RETURNS INT
AS
BEGIN
    RETURN (
        SELECT COUNT(DISTINCT spaceID)
        FROM Space
        WHERE ownerID = @userID
    )
END      
GO
/****** Object:  UserDefinedFunction [dbo].[getUserPostsCount]    Script Date: 10/5/2025 9:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[getUserPostsCount](@userID INT)
RETURNS INT
AS
BEGIN
    RETURN (
        SELECT COUNT(DISTINCT Post.postID)
        FROM Post
        INNER JOIN Content ON Post.contentID = Content.contentID
        WHERE Content.creatorID = @userID
    )
END     
GO
/****** Object:  UserDefinedFunction [dbo].[getUserQuestionsCount]    Script Date: 10/5/2025 9:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
   CREATE FUNCTION [dbo].[getUserQuestionsCount](@userID INT)
RETURNS INT
AS
BEGIN
    RETURN (
        SELECT COUNT(DISTINCT Questions.questionID)
        FROM Questions
        INNER JOIN Content ON Questions.contentID = Content.contentID
        WHERE Content.creatorID = @userID
    )
END     
GO
