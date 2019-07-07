# 1.查询同时存在1课程和2课程的情况

select s.*
from student as s left join (select studentId from student_course where courseId != 3 group by studentId having count(studentId)>1) 
as sc 
on s.id=sc.studentId
where sc.studentId is not null;

# 2.查询同时存在1课程和2课程的情况

select s.*
from student as s left join (select studentId from student_course where courseId != 3 group by studentId having count(studentId)>1) 
as sc 
on s.id=sc.studentId
where sc.studentId is not null;
 

 
# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
select s.id, any_value(s.name) as name, avg(sc.score) as avg
from student as s left join student_course as sc on s.id = sc.studentId
GROUP BY s.id having avg(sc.score) > 60;

# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
select tmp.* from 
(SELECT  distinct student.*, student_course.score FROM student left join student_course on student.id = student_course.studentId) as tmp where tmp.score is null;

# 5.查询所有有成绩的SQL
SELECT distinct student.* FROM student,student_course
WHERE student.id=student_course.studentId;

# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息

select s.*
from student as s left join (select studentId from student_course where courseId != 3 group by studentId having count(studentId)>1) 
as sc 
on s.id=sc.studentId
where sc.studentId is not null;

# 7.检索1课程分数小于60，按分数降序排列的学生信息
SELECT  student.*, student_course.score FROM student,student_course
WHERE student.id=student_course.studentId
AND student_course.courseId=1
AND student_course.score < 60
order by student_course.score desc;

# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列

SELECT any_value(c.id) as id, c.name as name,  
avg(sc.score) as avg from course as c left join student_course as sc on c.id = sc.courseId 
group by c.name order by avg(sc.score) desc;

# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
SELECT  distinct student.name, student_course.score FROM student left join student_course on student.id = student_course.studentId
where student_course.courseID =(
select tmp.courseID from 
(SELECT  distinct student_course.courseID,course.name FROM student_course left join course on course.id = student_course.courseID) as tmp where tmp.name =  "数学")
AND score < 60;



