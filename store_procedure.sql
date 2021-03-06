USE [E_learning2]
GO
/****** Object:  StoredProcedure [dbo].[addPointFindByIdRoundTest]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addPointFindByIdRoundTest] @id_round_test nvarchar(30)
AS
BEGIN
SELECT * FROM add_point WHERE id_round_test  = @id_round_test
END


GO
/****** Object:  StoredProcedure [dbo].[answerFindByIdQuestion]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[answerFindByIdQuestion] @id_question nvarchar(30)
AS
begin
select * from answer with(nolock) where id_question  = @id_question  order by answer asc
end


GO
/****** Object:  StoredProcedure [dbo].[CandidateCountByIdRound]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[CandidateCountByIdRound]  @id_group_test  nvarchar(90)  
 
AS
begin
SELECT count(*) FROM candidates  with(nolock) WHERE id_round_test =@id_group_test 
end


GO
/****** Object:  StoredProcedure [dbo].[CandidateCountByIdRoundAndIdGroup]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[CandidateCountByIdRoundAndIdGroup]  @id_group_test  nvarchar(90), @id_round_test  nvarchar(90)
 
AS
begin
SELECT count(*) FROM candidates  WHERE id_group_test = @id_group_test and id_round_test = @id_round_test 
end


GO
/****** Object:  StoredProcedure [dbo].[CandidateFindByConfirm]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[CandidateFindByConfirm]  @id_round  nvarchar(90),@confirm  nvarchar(90)
AS
begin
SELECT * FROM candidates WHERE confirm= @confirm and id_round_test = @id_round
end
 

GO
/****** Object:  StoredProcedure [dbo].[CandidateFindByIdUser]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[CandidateFindByIdUser] @id_user nvarchar(30),@id_round_test nvarchar(30)
AS
begin
SELECT count(*) FROM candidates  WHERE id_user = @id_user and id_round_test = @id_round_test
end
 


GO
/****** Object:  StoredProcedure [dbo].[CandidatefindByIdUserConfirm]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[CandidatefindByIdUserConfirm]  @id_user  nvarchar(90),
 @id_round_test nvarchar(90) ,@confirm nvarchar(90)
AS
begin
SELECT count(*) FROM candidates  WHERE id_user = @id_user and id_round_test = @id_round_test and confirm =@confirm
end

GO
/****** Object:  StoredProcedure [dbo].[CandidateFindByIdUserIdRoundTestCountTest]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[CandidateFindByIdUserIdRoundTestCountTest]  @id_user  nvarchar(90)  ,@id_round_test  nvarchar(90), @counttest  nvarchar(90)
 
AS
begin
SELECT * FROM candidates  WHERE id_user =@id_user  and id_round_test =@id_round_test and counttest=@counttest 
end


GO
/****** Object:  StoredProcedure [dbo].[CandidateFindListByIdUser]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[CandidateFindListByIdUser]  @id_user  nvarchar(90)  ,@id_round_test  nvarchar(90)
 
AS
begin
SELECT * FROM candidates  WHERE id_user = @id_user  and id_round_test =@id_round_test order by counttest asc
end


GO
/****** Object:  StoredProcedure [dbo].[CandidateFindReportByIdRound]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE  [dbo].[CandidateFindReportByIdRound]  @idRound nvarchar(90)
AS
begin
SELECT  a.id,a.last_update,
      a.status_candidates,
      a.time_create,
      a.id_group_test,
      a.id_round_test,
      a.id_user,
      a.counttest,
      a.timeend,
      a.timestart,
     a.result,
      a.timeouts,
      a.point,
      a.lock_candidate,a.confirm FROM candidates  as a join users as u on a.id_user = u.id   WHERE  id_round_test = @idRound
	  and confirm =0 
order by  u.username asc 
end


GO
/****** Object:  StoredProcedure [dbo].[CandidateSaveUser]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[CandidateSaveUser]  @last_update  nvarchar(90), @status_candidates  nvarchar(90), 
@time_create  nvarchar(90), @id_round_test  nvarchar(90), @id_user  nvarchar(90),
 @counttest  nvarchar(90), @lock_candidate  nvarchar(90), @confirm  nvarchar(90)
AS
begin
INSERT INTO   candidates (  last_update, status_candidates, 
              time_create, 
             id_round_test, id_user, counttest, lock_candidate,confirm) values 
            ( @last_update, @status_candidates,@time_create, @id_round_test, @id_user, @counttest, @lock_candidate,@confirm)
end
 

GO
/****** Object:  StoredProcedure [dbo].[CandidateUpdateConfirm]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[CandidateUpdateConfirm]  @id_user  nvarchar(90), @confirm  nvarchar(90),
@id_round_test nvarchar(90)
AS
begin
UPDATE candidates SET confirm =@confirm WHERE id_user=@id_user AND  id_round_test =@id_round_test
end

GO
/****** Object:  StoredProcedure [dbo].[CandidateUpdateGroup]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[CandidateUpdateGroup] @id_group_test nvarchar(30),@id nvarchar(30)
AS
begin
UPDATE candidates SET  id_group_test  = @id_group_test  WHERE id_user = @id
end
GO
/****** Object:  StoredProcedure [dbo].[CandidateUpdateLock]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[CandidateUpdateLock] @lock_candidate nvarchar(30),@id nvarchar(30)
AS
begin
UPDATE candidates SET lock_candidate=@lock_candidate WHERE id_user = @id
end


GO
/****** Object:  StoredProcedure [dbo].[changeUserStatus]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[changeUserStatus] @id BIGINT, @status INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE dbo.users SET status_users = @status WHERE id = @id
END


GO
/****** Object:  StoredProcedure [dbo].[CompetitionCateUpdateStatus]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[CompetitionCateUpdateStatus]  @status nvarchar(90) ,@id  nvarchar(90)
AS
BEGIN
UPDATE competition_category  SET  status  = @status   WHERE id =@id
END



GO
/****** Object:  StoredProcedure [dbo].[CompetitionCountByName]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[CompetitionCountByName]  @name_competition  nvarchar(255)  
AS
BEGIN
SELECT COUNT(*) FROM competition_category    WHERE name_competition =  @name_competition
END



GO
/****** Object:  StoredProcedure [dbo].[CompetitionfindById]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE  [dbo].[CompetitionfindById]  @id nvarchar(90)
AS
begin
SELECT * from competition where id= @id
end

GO
/****** Object:  StoredProcedure [dbo].[countChapterByCourse]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[countChapterByCourse] @courseId bigint 
as
begin
select count(*) from chapter where  id_outline = ( select id from outline where id_course = 10 )
end
GO
/****** Object:  StoredProcedure [dbo].[countCourseFinishedByCourse]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[countCourseFinishedByCourse] @courseId bigint
as 
begin 
	select COUNT(*) from course_join with(nolock) where  finished =1 and id_course = @courseId
end

GO
/****** Object:  StoredProcedure [dbo].[countCourseJoinByCourseId]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[countCourseJoinByCourseId] @courseId bigint
as
begin
 select Count(*) from course_join with(nolock) where id_course = @courseId
end



GO
/****** Object:  StoredProcedure [dbo].[deleteCompetitionCourse]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteCompetitionCourse] @competitionId bigint ,@courseId bigint
as 
begin
	delete course_competition where id_competition = @competitionId and id_course= @courseId 
end


GO
/****** Object:  StoredProcedure [dbo].[deleteDocumentCourse]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteDocumentCourse] @documentId bigint,@courseId bigint
as
begin
	delete course_document where id_document = @documentId and id_course = @courseId
end


GO
/****** Object:  StoredProcedure [dbo].[disableUserRoleCourse]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[disableUserRoleCourse] @id bigint
as begin
update user_role_course set status = 0 where id = @id
end



GO
/****** Object:  StoredProcedure [dbo].[enable_disableUserCourseJoin]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[enable_disableUserCourseJoin] @courseId bigint,@userId bigint, @status int
as
begin
	
	update course_join set status = @status where id_course = @courseId and id_user = @userId
	
end


GO
/****** Object:  StoredProcedure [dbo].[enableUserRoleCourse]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[enableUserRoleCourse] @id bigint
as begin
update user_role_course set status = 1 where id = @id
end


GO
/****** Object:  StoredProcedure [dbo].[find_document_from_course_document]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  PROCEDURE  [dbo].[find_document_from_course_document] @id_document int
AS
begin
SELECT  COUNT (*) FROM course_document  WHERE @id_document  =course_document.id_document
end
GO
/****** Object:  StoredProcedure [dbo].[findByCompetitionForReport]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE  [dbo].[findByCompetitionForReport]  @from  nvarchar(90), @to  nvarchar(90) ,@posCode nvarchar(90)
AS
begin
DECLARE @sql varchar(2000); 

SET @sql = ' SELECT * FROM competition  WHERE time_create  >= '+@from+' and time_create <= '+@to

				 IF (@posCode <> '' )
						begin 
								SET @sql+=', and id_unit = '+ @posCode
						end
	  execute   (@sql);
end


GO
/****** Object:  StoredProcedure [dbo].[findCompetitionByCourseId]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[findCompetitionByCourseId] @courseId bigint
as
begin
	select * from competition with(nolock) where id = (select id_competition from course_competition with(nolock) where id_course = @courseId )
	and status_competition = 0
end


GO
/****** Object:  StoredProcedure [dbo].[findCompetitionNotInCourse]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[findCompetitionNotInCourse] @courseId bigint
as
begin
select * from competition with(nolock) where id not in ( select id_competition from course_competition with(nolock)  where id_course = @courseId )
end


GO
/****** Object:  StoredProcedure [dbo].[findCourseByUserName]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[findCourseByUserName] @username nvarchar(255)
as
begin
declare @userId bigint;
set @userId = (select id from users with(nolock) where username = @username)
select * from course as A with(nolock) where A.id in ( select id_course from user_role_course with(nolock) where id_user = @userId )
end



GO
/****** Object:  StoredProcedure [dbo].[findCourseWareByChapterId]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[findCourseWareByChapterId] @chapterId bigint
As
begin
Select * from course_ware as A with(nolock) inner join chapter_course_ware As B  with(nolock) ON A.id=B.id_course_ware where B.id_chapter = @chapterId order by B.position
End




GO
/****** Object:  StoredProcedure [dbo].[findCourseWareProcess]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[findCourseWareProcess] @courseId bigint,@courseWareId bigint
As
Begin
select * from course_ware_process inner join users as u on id_user = u.id where id_user in
( select id_user from course_join where id_course = @courseId) and id_course_ware = @courseWareId
end


GO
/****** Object:  StoredProcedure [dbo].[findCourseWareProcessByUserIdAndCourswareId]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[findCourseWareProcessByUserIdAndCourswareId] @userId bigint,@coursewareId bigint
as

begin

select top 1 * from course_ware_process where id_user = @userId and id_course_ware = @coursewareId
end



GO
/****** Object:  StoredProcedure [dbo].[findCouseByChapterId]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[findCouseByChapterId] @chapterid bigint
as 
Begin
select * from course  with(nolock) where id in (select o.id_course from outline as o  with(nolock) inner join chapter as c  with(nolock) on o.id =c.id_outline where c.id = @chapterid)
end


GO
/****** Object:  StoredProcedure [dbo].[findDocumentByCourseId]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[findDocumentByCourseId] @CourseId bigint
as
begin
select * from document as d with(nolock) inner join course_document as cd with(nolock) on d.id = cd.id_document where cd.id_course = @CourseId
end


GO
/****** Object:  StoredProcedure [dbo].[findOutlineByChapterId]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[findOutlineByChapterId] @chapterid bigint
as 
Begin
select * from outline as o  with(nolock) inner join chapter as c  with(nolock) on o.id = c.id_outline where c.id = @chapterid
end


GO
/****** Object:  StoredProcedure [dbo].[findUserByCourseId]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[findUserByCourseId] @CourseId bigint
as
begin
select * from users where id in (
	select id_user from course_join where id_course = @CourseId and status = 1
)
end


GO
/****** Object:  StoredProcedure [dbo].[findUserInGroupId]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[findUserInGroupId] @groupId bigint
as 
begin
select * from users with(nolock)  where id in ( select id_user  from  group_join with(nolock)  where id_group=@groupId )
end


GO
/****** Object:  StoredProcedure [dbo].[findUserJoinCourse]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[findUserJoinCourse]
as begin
select * from users with(nolock)  where id in (select distinct id_user  from course_join with(nolock) )
end


GO
/****** Object:  StoredProcedure [dbo].[findUserNotInCourse]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[findUserNotInCourse] @courseId bigint
as
begin

select * from users where id not in ( select id_user from course_join where id_course = @courseId )
 and id not in ( select id_user from  user_role_course where id_course = @courseId )
 end


GO
/****** Object:  StoredProcedure [dbo].[getUserRoleStudentNotInGroup]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[getUserRoleStudentNotInGroup] @groupId bigint
 as
 begin
 select * from users where id not in ( select id_user from group_join where id_group = @groupId )
 end



GO
/****** Object:  StoredProcedure [dbo].[getUserTeacherNotInGroup]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[getUserTeacherNotInGroup] @groupId bigint
 as
 begin
 select * from users where id not in ( select id_user from group_join where id_group = @groupId )
 and id in ( select id_user from user_permistion where id_permistion in ( select id from permistion where codename='ROLE_TEACHER'))
 end
  


GO
/****** Object:  StoredProcedure [dbo].[GroupTestCountByNameGroup]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[GroupTestCountByNameGroup] @name_group nvarchar(90)  
 
AS
begin
select count(*) from group_test where name_group  =@name_group
end
 


GO
/****** Object:  StoredProcedure [dbo].[GroupTestFindByIdRound]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[GroupTestFindByIdRound]  @id_round_test nvarchar(90)  
 
AS
begin
select * from group_test where id_round_test  =  @id_round_test 
end


GO
/****** Object:  StoredProcedure [dbo].[insertCompetitionCourse]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertCompetitionCourse] @competitionId bigint ,@courseId bigint
as
begin
	insert into course_competition (id_competition,id_course) values(@competitionId,@courseId)
end


GO
/****** Object:  StoredProcedure [dbo].[insertfreelecture]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertfreelecture] (  
                                          
                                         
                                          @name NVARCHAR(250),
										  @description NVARCHAR(max),
										  @status varchar,
										  @created_date smalldatetime,
										  @id_course_ware_type bigint,
										  @id_unit bigint
										  ,@id_poscode  bigint
										  ,@content nvarchar(max)
										  ,@shared int
										  , @created_by varchar(255)


										 
										 
										 
										 
										
										  )
AS  
  BEGIN  
INSERT INTO course_ware  
                        (
                        
                        
                         name  ,
						 description,
						 status,
						created_date
                        ,id_course_ware_type,
						id_unit,
						id_poscode ,
						content,
						shared
						,created_by
						
						 
						 )  
VALUES     ( 
			
                                        
                                          @name ,
										  @description,
										  @status,
										  @created_date,
										  @id_course_ware_type,
										  @id_unit
										  ,@id_poscode ,
										  @content,
										  @shared,
										  @created_by
										   
										 
			  
			  )  
        END  

GO
/****** Object:  StoredProcedure [dbo].[LevelGetListAll]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[LevelGetListAll]  
AS
BEGIN
SELECT * FROM levell
END




GO
/****** Object:  StoredProcedure [dbo].[PoscodeCompetitionDelete]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE  PROCEDURE [dbo].[PoscodeCompetitionDelete]  @id_competition nvarchar(90)
AS
begin
delete from poscode_competition where id_competition=@id_competition
end

GO
/****** Object:  StoredProcedure [dbo].[PoscodeCompetitionFindByIdCompetition]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[PoscodeCompetitionFindByIdCompetition]  @id_competition nvarchar(90)
AS
begin
SELECT * FROM poscode_competition WHERE id_competition=@id_competition
end

GO
/****** Object:  StoredProcedure [dbo].[PoscodeCompetitionSave]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE  PROCEDURE [dbo].[PoscodeCompetitionSave]  @id_competition nvarchar(90),
 @id_poscode  nvarchar(90) 
AS
begin
INSERT INTO   poscode_competition (id_poscode,id_competition) values 
            ( @id_poscode,@id_competition)
end

GO
/****** Object:  StoredProcedure [dbo].[PoscodeVnpostGetNamByIdUser]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE  [dbo].[PoscodeVnpostGetNamByIdUser]  @idUser nvarchar(90)
AS
begin
SELECT p.posname from poscode_vnpost p join users u on p.poscode = u.id_unit  where u.id =16
end

GO
/****** Object:  StoredProcedure [dbo].[QuestionCateGetListByIdUnit]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[QuestionCateGetListByIdUnit]  @id_unit  nvarchar(255)  
AS
BEGIN
SELECT * FROM question_category WHERE id_unit =@id_unit
END



GO
/****** Object:  StoredProcedure [dbo].[QuestionCateGetListBySearch]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[QuestionCateGetListBySearch]  @shares nvarchar(255) ,@id_unit  nvarchar(255)  
AS
BEGIN
SELECT * FROM question_category WHERE shares = @shares and  id_unit <> @id_unit
END



GO
/****** Object:  StoredProcedure [dbo].[QuestionRoundTestCountByidQuestionIdRound]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[QuestionRoundTestCountByidQuestionIdRound]  @id_question  nvarchar(90), @id_round_test nvarchar(90)
AS
begin
SELECT count(*) FROM question_round_test  WHERE id_question =@id_question AND id_round_test=@id_round_test
end


GO
/****** Object:  StoredProcedure [dbo].[QuestionRoundTestCountByIdRoundTest]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[QuestionRoundTestCountByIdRoundTest]  @id_round_test nvarchar(90)
AS
begin
SELECT count(*)  FROM question_round_test   WHERE id_round_test =@id_round_test
end


GO
/****** Object:  StoredProcedure [dbo].[QuestionRoundTestDeleteById]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[QuestionRoundTestDeleteById]  @id  nvarchar(90) 
AS
begin
DELETE  FROM question_round_test  WHERE id =@id
end
 


GO
/****** Object:  StoredProcedure [dbo].[QuestionRoundTestDeleteByIdRoundTest]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[QuestionRoundTestDeleteByIdRoundTest]  @id_round_test  nvarchar(90) 
AS
begin
DELETE  FROM question_round_test  WHERE id_round_test = @id_round_test 
end


GO
/****** Object:  StoredProcedure [dbo].[QuestionRoundTestGetListQuestionRound]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[QuestionRoundTestGetListQuestionRound] @id_round_test nvarchar(90), @id_question nvarchar(90)  
as
begin
SELECT * FROM question_round_test  WHERE id_round_test = @id_round_test and id_question = @id_question
end


GO
/****** Object:  StoredProcedure [dbo].[QuestionRoundTestSaveQuestionForRoundTest]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[QuestionRoundTestSaveQuestionForRoundTest] @id_question nvarchar(90),@id_round_test nvarchar(90)
,@id_struct_detail_test nvarchar(90),@last_update nvarchar(90),@time_create nvarchar(90) 
as
begin
INSERT  INTO question_round_test  (id_question,id_round_test,id_struct_detail_test,last_update,time_create)  VALUES ( @id_question,  @id_round_test , 
            @id_struct_detail_test, @last_update , @time_create)
end
 


GO
/****** Object:  StoredProcedure [dbo].[QuestionRoundTestSaveQuestionRoundTest]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[QuestionRoundTestSaveQuestionRoundTest]  
@last_update nvarchar(90), @time_create nvarchar(90) , @id_question nvarchar(90), @id_round_test nvarchar(90), @id_struct_detail_test nvarchar(90)
AS
begin
INSERT INTO   question_round_test  ( last_update , time_create , id_question , id_round_test , id_struct_detail_test ) 
               values (@last_update, @time_create, @id_question,@id_round_test,@id_struct_detail_test)
end


GO
/****** Object:  StoredProcedure [dbo].[QuestionTestCountByidQuestionIdTest]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[QuestionTestCountByidQuestionIdTest] @id_question nvarchar(90) ,@id_test nvarchar(90) 
as
begin
SELECT count(*) FROM question_test  WHERE id_question =@id_question AND id_test=@id_test
end


GO
/****** Object:  StoredProcedure [dbo].[QuestionTestCountByIdTest]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[QuestionTestCountByIdTest] @id_test nvarchar(90) 
as
begin
SELECT count(*) FROM question_test  WHERE id_test =@id_test
end


GO
/****** Object:  StoredProcedure [dbo].[QuestionTestDeleteById]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[QuestionTestDeleteById] @id nvarchar(90) 
as
begin
DELETE  FROM question_test  WHERE id =@id
end


GO
/****** Object:  StoredProcedure [dbo].[QuestionTestDeleteByIdTest]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[QuestionTestDeleteByIdTest] @id_test nvarchar(90) 
AS
begin
DELETE  FROM question_test  WHERE id_test = @id_test
end


GO
/****** Object:  StoredProcedure [dbo].[QuestionTestFindByIdTest]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[QuestionTestFindByIdTest]
 @id_test  nvarchar(90) 
as
begin
select * from question_test where id_test  =  @id_test 
end


GO
/****** Object:  StoredProcedure [dbo].[QuestionTestSaveQuestionForTest]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[QuestionTestSaveQuestionForTest]
@id_question nvarchar(90),@id_test  nvarchar(90),@id_struct_detail_test  nvarchar(90),@last_update nvarchar(90),@time_create  nvarchar(90)
as
begin
INSERT  INTO question_test  (id_question,id_test,id_struct_detail_test,last_update,time_create)  VALUES ( @id_question, @id_test , 
             @id_struct_detail_test,@last_update , @time_create)
end


GO
/****** Object:  StoredProcedure [dbo].[QuestionTestSaveQuestionTest]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[QuestionTestSaveQuestionTest] 
@last_update nvarchar(90) , @time_create  nvarchar(90),
 @id_question  nvarchar(90), @id_test  nvarchar(90), @id_struct_detail_test   nvarchar(90)
as
begin
INSERT INTO   question_test  
           ( last_update , time_create , id_question , id_test , id_struct_detail_test )  
              values( @last_update, @time_create, @id_question,@id_test,@id_struct_detail_test)
end


GO
/****** Object:  StoredProcedure [dbo].[ResultFindByIdQuestion]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[ResultFindByIdQuestion]
 @id_question  nvarchar(90), @counttest  nvarchar(90), @id_round_test  nvarchar(90)
as
begin
select * from result where id_question  = @id_question and counttest=@counttest and id_round_test =@id_round_test   order by answer asc
end


GO
/****** Object:  StoredProcedure [dbo].[RoundTestUpdate2]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[RoundTestUpdate2]  
@auto_create_question nvarchar(90) ,@code_round_test  nvarchar(90) ,@describes  nvarchar(500), 
           @do_again nvarchar(90) , @full_tick_answer nvarchar(90), @give_certificate nvarchar(90), 
            @last_update  datetime2(7), @max_point nvarchar(90), @max_work nvarchar(90),  
            @min_point  nvarchar(90), @mix_answer nvarchar(90),  @name_round nvarchar(255)  , 
            @show_resutl nvarchar(90), @source_question nvarchar(90), @status_round nvarchar(90), 
            @time_end  datetime2(7) , @time_round nvarchar(90), @time_start   datetime2(7), 
            @id_competition nvarchar(90), @id_condition nvarchar(90), 
            @id_mix_compettion nvarchar(90), @id_struct_test nvarchar(90), @show_answer nvarchar(90), 
            @show_explain nvarchar(90),  @id nvarchar(90),@check nvarchar(90) 
AS
BEGIN 
 UPDATE round_test SET  auto_create_question =@auto_create_question ,code_round_test=@code_round_test ,describes =@describes,  
             do_again=@do_again, full_tick_answer=@full_tick_answer, give_certificate=@give_certificate, 
              last_update=@last_update, max_point=@max_point, max_work=@max_work,  
             min_point=@min_point, mix_answer=@mix_answer, name_round=@name_round, 
              show_resutl=@show_resutl, source_question=@source_question, status_round=@status_round,  
              time_round=@time_round,  
             id_competition=@id_competition,  id_condition=@id_condition,
             id_mix_compettion=@id_mix_compettion, id_struct_test=@id_struct_test, show_answer=@show_answer , 
             show_explain=@show_explain
			, time_end =  @time_end, time_start=  @time_start	WHERE id =@id
END
GO
/****** Object:  StoredProcedure [dbo].[RoundTestUpdate3]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[RoundTestUpdate3]  
@auto_create_question nvarchar(90) ,@code_round_test  nvarchar(90) ,@describes  nvarchar(500), 
           @do_again nvarchar(90) , @full_tick_answer nvarchar(90), @give_certificate nvarchar(90), 
            @last_update  datetime2(7), @max_point nvarchar(90), @max_work nvarchar(90),  
            @min_point  nvarchar(90), @mix_answer nvarchar(90),  @name_round nvarchar(255)  , 
            @show_resutl nvarchar(90), @source_question nvarchar(90), @status_round nvarchar(90), 
             @time_round nvarchar(90),
            @id_competition nvarchar(90), @id_condition nvarchar(90), 
            @id_mix_compettion nvarchar(90), @id_struct_test nvarchar(90), @show_answer nvarchar(90), 
            @show_explain nvarchar(90),  @id nvarchar(90),@check nvarchar(90) 
AS
BEGIN 
 UPDATE round_test SET  auto_create_question =@auto_create_question ,code_round_test=@code_round_test ,describes =@describes,  
             do_again=@do_again, full_tick_answer=@full_tick_answer, give_certificate=@give_certificate, 
              last_update=@last_update, max_point=@max_point, max_work=@max_work,  
             min_point=@min_point, mix_answer=@mix_answer, name_round=@name_round, 
              show_resutl=@show_resutl, source_question=@source_question, status_round=@status_round,  
              time_round=@time_round,  
             id_competition=@id_competition,  id_condition=@id_condition,
             id_mix_compettion=@id_mix_compettion, id_struct_test=@id_struct_test, show_answer=@show_answer , 
             show_explain=@show_explain, time_end =  null, time_start=  null
			 	WHERE id =@id
END
GO
/****** Object:  StoredProcedure [dbo].[saveDocumentForCourse]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[saveDocumentForCourse] @documentId bigint,@courseId bigint
as
begin
	insert into course_document  (id_document,id_course)  values(@documentId, @courseId ) 
end


GO
/****** Object:  StoredProcedure [dbo].[StructDTestFindByIdStructTest]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[StructDTestFindByIdStructTest]  @id_truct_test nvarchar(90) 
AS
BEGIN
SELECT * FROM struct_detail_test WHERE id_truct_test =@id_truct_test 
END



GO
/****** Object:  StoredProcedure [dbo].[StructDTestSave]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[StructDTestSave]  @count_test nvarchar(90),   @last_update  nvarchar(90),  @name_group  nvarchar(255),  @time_create nvarchar(90)
             ,  @id_level  nvarchar(90) ,  @id_tag  nvarchar(90) ,  @id_type_question  nvarchar(90)
              ,  @id_questioncategory nvarchar(90)  ,  @id_truct_test nvarchar(90)
AS
BEGIN
INSERT INTO struct_detail_test (count_test,last_update,name_group,time_create, 
            id_level,id_tag,id_type_question,id_questioncategory,id_truct_test) 
             values( @count_test, @last_update  ,@name_group   ,@time_create 
             ,@id_level   ,@id_tag   ,@id_type_question  
              ,@id_questioncategory   ,@id_truct_test )
END



GO
/****** Object:  StoredProcedure [dbo].[SubPointFindByIdRoundTest]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[SubPointFindByIdRoundTest] @id_round_test nvarchar(90)  
 
AS
begin
SELECT * FROM sub_point WHERE id_round_test =@id_round_test
end


GO
/****** Object:  StoredProcedure [dbo].[TagGetListByLimit]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[TagGetListByLimit] 
 
AS
begin
SELECT TOP 15 * FROM tags
end


GO
/****** Object:  StoredProcedure [dbo].[TagGetListByPropertyLike]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[TagGetListByPropertyLike] @key nvarchar(90)  
 
AS
begin
SELECT TOP 15 * FROM tags t WHERE t.name like '%'+@key +'%'
end
 


GO
/****** Object:  StoredProcedure [dbo].[TestFindByIdStructTest]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[TestFindByIdStructTest] @id_struct_test nvarchar(90) 
AS
begin
SELECT * FROM test where id_struct_test = @id_struct_test
end
 


GO
/****** Object:  StoredProcedure [dbo].[TestFindByIdTestKit]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[TestFindByIdTestKit] @id_test_kit nvarchar(90) 
AS
begin
SELECT * FROM test where id_test_kit =@id_test_kit
end


GO
/****** Object:  StoredProcedure [dbo].[TestKitCountByName]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[TestKitCountByName] @name_test nvarchar(90)
AS
begin
SELECT COUNT(*) FROM test_kit    WHERE name_test =@name_test
end


GO
/****** Object:  StoredProcedure [dbo].[TestKitfindAll]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[TestKitfindAll] 
AS
begin
SELECT * FROM test_kit  WHERE status = 0  ORDER by time_create 
end


GO
/****** Object:  StoredProcedure [dbo].[TestKitUpdateStatus]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[TestKitUpdateStatus] @status nvarchar(90),@id  nvarchar(90)
AS
begin
UPDATE test_kit  SET  status  = @status   WHERE id = @id  
end


GO
/****** Object:  StoredProcedure [dbo].[TestUpdate]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[TestUpdate]  @last_update  nvarchar(90) ,@name   nvarchar(255) , @time_create nvarchar(90)  , @type_test   nvarchar(90)  ,@id_struct_test  nvarchar(90) 
,@id_test_kit  nvarchar(90)  , @id_user  nvarchar(90) ,@description  ntext ,@id  nvarchar(90)
AS
begin
UPDATE test  SET  last_update  = @last_update,name =@name, time_create=@time_create , type_test= @type_test ,id_struct_test= @id_struct_test ,id_test_kit=@id_test_kit , id_user= @id_user,description=@description,status=0  WHERE id =@id
end


GO
/****** Object:  StoredProcedure [dbo].[themDocument]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[themDocument] (  
                                          
                                          @link_file nvarchar(255),  
                                          @name_document NVARCHAR(250),
										  @describes NVARCHAR(250),
										  @shares int,
										  @timeCreate smalldatetime,
										  @status_document int,
										  @id_limit bigint,
										  @id_prioritize bigint,
										  @id_poscode bigint,
										  @id_unit bigint,
										  @created_by varchar(255)

										 
										 
										 
										 
										
										  )
AS  
  BEGIN  
INSERT INTO document  
                        (
                        
                         link_file,  
                         name_document  ,
						 describes,
						 shares,
                        time_create,
						status_document,
						id_limit,
						id_prioritize,
						id_poscode,
						id_unit,
						created_by

						
						 
						 )  
VALUES     ( 
			
                                          @link_file ,  
                                          @name_document ,
										  @describes,
										  @shares,
										  @timeCreate,
										  @status_document,
										  @id_limit,
										  @id_prioritize,
										  @id_poscode,
										  @id_unit,
										  @created_by
										   
										 
			  
			  )  
        END  

GO
/****** Object:  StoredProcedure [dbo].[thempowerpoint]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thempowerpoint] (  
                                          
                                          @files nvarchar(255),  
                                          @name NVARCHAR(250),
										  @description NVARCHAR(max),
										  @status varchar,
										  @created_date smalldatetime,
										  @id_course_ware_type bigint,
										  @id_unit bigint
										  ,@id_poscode  bigint,
										  	@created_by nvarchar(255)
										 
										 
										 
										 
										
										  )
AS  
  BEGIN  
INSERT INTO course_ware  
                        (
                        
                         files,  
                         name  ,
						 description,
						 status,
						created_date
                        ,id_course_ware_type,
						id_unit,
						id_poscode ,
						created_by
						
						 
						 )  
VALUES     ( 
			
                                          @files ,  
                                          @name ,
										  @description,
										  @status,
										  @created_date,
										  @id_course_ware_type,
										  @id_unit
										  ,@id_poscode 
										  ,@created_by
										   
										 
			  
			  )  
        END  

GO
/****** Object:  StoredProcedure [dbo].[themscrom]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[themscrom] (  
                                          
                                          @files nvarchar(255),  
                                          @name NVARCHAR(250),
										  @description NVARCHAR(max),
										  @status varchar,
										  @created_date smalldatetime,
										  @id_course_ware_type bigint,
										   @shared int,
										   @id_unit bigint,
										   @id_poscode bigint
										   ,	@created_by nvarchar(255)

										 
										 
										 
										 
										
										  )
AS  
  BEGIN  
INSERT INTO course_ware  
                        (
                        
                         files,  
                         name  ,
						 description,
						 status,
						created_date
                        ,id_course_ware_type
						,shared,
						id_unit,
						id_poscode 
						,created_by
						
						 
						 )  
VALUES     ( 
			
                                          @files ,  
                                          @name ,
										  @description,
										  @status,
										  @created_date,
										  @id_course_ware_type,
										  @shared,
										  @id_unit,
										  @id_poscode ,
										  @created_by
										   
										 
			  
			  )  
        END  

GO
/****** Object:  StoredProcedure [dbo].[themvideo]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[themvideo] (  
                                          
                                          @files nvarchar(255),  
                                          @name NVARCHAR(250),
										  @description NVARCHAR(max),
										  @status varchar,
										  @created_date smalldatetime,
										  @id_course_ware_type bigint,
										  @shared int,
										@id_unit bigint,
										@id_poscode bigint,
										@modifiedBy nvarchar(max),
										@type_multimedia bigint,
										@created_by nvarchar(255)
										
			


										 
										 
										 
										 
										
										  )
AS  
  BEGIN  
INSERT INTO course_ware  
                        (
                        
                         files,  
                         name  ,
						 description,
						 status,
						created_date,
                        id_course_ware_type,
						shared ,
						id_unit,
						id_poscode,
						modified_by,
						type_multimedia
						,created_by
						
						
						 
						 )  
VALUES     ( 
			
                                          @files ,  
                                          @name ,
										  @description,
										  @status,
										  @created_date,
										  @id_course_ware_type,
										  @shared 
										  ,@id_unit 
										  ,@id_poscode
										  ,@modifiedBy,@type_multimedia
										  ,@created_by
										  
										 
			  
			  )  
        END  
  

GO
/****** Object:  StoredProcedure [dbo].[TypeQuestionGetListAll]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[TypeQuestionGetListAll]  
AS
BEGIN
SELECT * FROM type_question
END



GO
/****** Object:  StoredProcedure [dbo].[UnitVnpostFindByIdParent]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[UnitVnpostFindByIdParent] @parent_unit_code nvarchar(90)
AS
begin
  select * from unit_vnpost where parent_unit_code = @parent_unit_code
end



GO
/****** Object:  StoredProcedure [dbo].[UnitVnpostFindByIdUnit]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[UnitVnpostFindByIdUnit] @unit_code nvarchar(90)
AS
begin
  select * from unit_vnpost where unit_code = @unit_code
end


GO
/****** Object:  StoredProcedure [dbo].[UnitVnpostFindByParent]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[UnitVnpostFindByParent] @unit_code nvarchar(30)
AS
begin
  select * from unit_vnpost where unit_code = @unit_code
end



GO
/****** Object:  StoredProcedure [dbo].[UnitVnpostFindParent]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[UnitVnpostFindParent]
AS
begin
select * from unit_vnpost where parent_unit_code = ''
end
 


GO
/****** Object:  StoredProcedure [dbo].[updatePosition]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updatePosition] @chapterId bigint, @courseWareId bigint, @position int
As
begin

Declare @id bigint
set @id = (select id from chapter_course_ware where id_course_ware = @courseWareId and id_chapter = @chapterId )
  Update chapter_course_ware set position = @position where id = @id
  select * from chapter_course_ware where id = @id
end




GO
/****** Object:  StoredProcedure [dbo].[updateUserRoleCourse]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateUserRoleCourse] @id bigint, @roleId bigint, @score int,@evaluate nvarchar(255)
AS
BEGIN
	Update user_role_course set id_course_role = @roleId ,score = @score,evaluate = @evaluate where id = @id
END



GO
/****** Object:  StoredProcedure [dbo].[UserCountByEmail]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[UserCountByEmail] @email nvarchar(250)
AS
BEGIN
SELECT count(*) FROM users  WHERE email like '%'+@email+'%'
END


GO
/****** Object:  StoredProcedure [dbo].[UserFindByEmail]    Script Date: 6/18/2020 1:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[UserFindByEmail] @email nvarchar(250)
AS
BEGIN
SELECT * FROM users  WHERE email  like '%'+@email+'%'
END


GO

 test thay đổi lần 1
 
 
 
 test thay đổi lần 2
 
 test lần 5
 
 
 test thay đổi lần 3
 
 