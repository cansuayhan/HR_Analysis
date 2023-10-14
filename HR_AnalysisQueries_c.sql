
-- create a join table

select *
from absenteeism_at_work abs
join reasons 
	on abs.reason_for_absence = reasons.Number
;

select *
from (
		select *
from absenteeism_at_work abs
join reasons 
	on abs.reason_for_absence = reasons.Number
) abs_reas
join compensation
	on abs_reas.ID = compensation.ID;
    

-- or  can join three table as

select * 
from absenteeism_at_work abs
left join compensation
	 on abs.ID = compensation.ID
left join reasons r
	on abs.reason_for_absence = r.Number;
    

-- find the healthiest employees for the bonus ( Heathy Individuals & Low Absenteesim ) 
                    
select ID, Absenteeism_time_in_hours, Social_drinker, Social_smoker, Body_mass_index
from absenteeism_at_work
order by Absenteeism_time_in_hours, Social_drinker, Social_smoker, Body_mass_index desc;              
    
-- or 

select ID, Absenteeism_time_in_hours, Social_drinker, Social_smoker, Body_mass_index
from absenteeism_at_work
where Social_drinker = 0 and Social_smoker = 0
and Body_mass_index < 25 
and Absenteeism_time_in_hours < (select avg(Absenteeism_time_in_hours) from absenteeism_at_work)
order by Body_mass_index, Absenteeism_time_in_hours asc;


-- Calculate a wage Increase or annual compensation for Non-Smokers 
-- compensaiton rate increse for non-smokers budget 983,221$ so 0.68(cent) increase per hour / 1.414.4$ per year 

select count(*) as nonsmokers
from absenteeism_at_work
where Social_smoker = 0; 

-- optimize this query

select 
a.ID, 
r.reason,
Month_of_absence,
Body_mass_index,
Case when body_mass_index < 18.5 then 'underweight'
	 when body_mass_index between 18.5 and 25 then 'Healthy Weight'
     when body_mass_index between 25 and 29.9 then 'Overweight'
     when body_mass_index > 39 then 'obese'
     else 'unknown' end as BMI_Category,
Case when month_of_absence in ( 12, 1, 2) Then 'Winter'
	 when month_of_absence in ( 3, 4, 5) Then 'Spring'
     when month_of_absence in ( 6, 7, 8) Then 'Summer'
	 when month_of_absence in ( 9, 10, 11) Then 'Fall'
     else 'unknown' end as Season_names,
month_of_absence,
day_of_the_week,
Transportation_expense,
Education,
Son,
Social_drinker,
Social_smoker,
Pet,
Disciplinary_failure,
Age,
Work_load_Average_day,
Absenteeism_time_in_hours
from absenteeism_at_work a
left join compensation c
	 on a.ID = c.ID
left join reasons r
	on a.reason_for_absence = r.Number;
