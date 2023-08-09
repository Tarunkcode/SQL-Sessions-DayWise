
update cbp_stu set weight = 74.2, body_temp =103.2, age =32 where stu_id =2

INSERT INTO cbp_stu (name, age, weight) 
values 
('Param',21, 72.23) 

ALTER TABLE cbp_stu 
ADD COLUMN points int default 0

SELECT * from cbp_stu

UPDATE cbp_stu set
points = 6
where stu_id=6

SELECT *, (
SELECT
	CASE 
 		WHEN points > 4 Then 'Pass'
	Else 'Failed'
 	end 
from cbp_stu t2 
	WHERE t1.stu_id = t2.stu_id
) as "STATUS" From cbp_stu t1

SELECT * from cbp_stu WHERE name ILike '%''k'


