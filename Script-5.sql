--процент уволившихся сотрудников в штабе--
/*SELECT 
count(*) AS Attrition, 
count(*) filter(where "Attrition" in ('Yes')) as attrition_count,
round((count(*) filter( where "Attrition" in ('Yes') ):: numeric/count(*)) *100, 2) as attrition_percent

FROM raw.wa; */

--процент уволившихся сотрудников в штабе (по департаментам)--
/*select "Department", 
count(*) as Attrition, 
count(*) filter(where "Attrition" in ('Yes')) as attrition_count,
round((count(*) filter(where "Attrition" in ('Yes')))::numeric/(count(*))*100, 2) as attriction_percent
from raw.wa
group by  "Department" */

--уволившиеся сотрудники: классификация по возростам и департаментам--
/*with age_people as(
	select "Department", "Attrition",
	case 
		when "Age" <=25 then 'before 25'
		when "Age" between 26 and 35 then '26-35'
		when "Age" between 36 and 50 then '36-50'
		else 'more 50'
	end as categories
	from raw.wa)
select "Department","categories",
count(*) as attrition, 
count(*) filter (where "Attrition" in ('Yes')) as attrition_count, 
round((count(*) filter (where "Attrition" in ('Yes')):: numeric/count(*))*100, 2) as percent_age
from age_people
group by "Department", "categories"
order by "Department", "categories";*/

/*select "DistanceFromHome", 
count(*) as employees,
count(*) filter (where "Attrition" in ('Yes')) as attrition_count, 
round((count(*) filter (where "Attrition" in ('Yes')):: numeric/count(*))*100, 2) as percent_distance
from raw.wa
group by "DistanceFromHome"
order by "percent_distance"
--order by "DistanceFromHome";*/

--командировки
select "BusinessTravel",
count(*) as employees,
count(*) filter (where "Attrition" in ('Yes')) as attrition_count, 
round((count(*) filter (where "Attrition" in ('Yes')):: numeric/count(*))*100, 2) as percent_travel
from raw.wa
group by "BusinessTravel"









