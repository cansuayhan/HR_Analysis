create database HR_Analysis ;

-- use table data import wizard to import datasets (absenteesim_at_work, compensation, reasons)

SELECT * FROM HR_Analysis.absenteeism_at_work;

-- create a script from imported file as

show create table absenteeism_at_work;
 
# Table, Create Table
-- 'absenteeism_at_work', '

CREATE TABLE `absenteeism_at_work` (
`ID` int DEFAULT NULL,
`Reason for absence` int DEFAULT NULL,
`Month of absence` int DEFAULT NULL,
`Day of the week` int DEFAULT NULL,
`Seasons` int DEFAULT NULL,
`Transportation expense` int DEFAULT NULL,
`Distance from Residence to Work` int DEFAULT NULL,
`Service time` int DEFAULT NULL,
`Age` int DEFAULT NULL,
`Work load Average/day` text,
`Hit target` int DEFAULT NULL,
`Disciplinary failure` int DEFAULT NULL,
`Education` int DEFAULT NULL,
`Son` int DEFAULT NULL,
`Social drinker` int DEFAULT NULL,
`Social smoker` int DEFAULT NULL,
`Pet` int DEFAULT NULL,
`Weight` int DEFAULT NULL,
`Height` int DEFAULT NULL,
`Body mass index` int DEFAULT NULL,
`Absenteeism time in hours` int DEFAULT NULL
);

-- optimize above query------- change column name that involves spaces with '_'


alter table absenteeism_at_work
rename column `Reason for absence` to reason_for_absence;

alter table absenteeism_at_work
rename column `Month of absence` to month_of_absence,
rename column `Day of the week` to day_of_the_week,	
rename column `Transportation expense` to Transportation_expense,
rename column `Distance from Residence to Work` to Distance_from_Residence_to_Work,
rename column `Service time` to Service_time,
rename column `Work load Average/day` to Work_load_Average_day,
rename column `Hit target` to Hit_target,
rename column `Disciplinary failure` to Disciplinary_failure,
rename column `Social drinker` to Social_drinker,
rename column `Social smoker` to Social_smoker,
rename column `Body mass index` to Body_mass_index,
rename column `Absenteeism time in hours` to Absenteeism_time_in_hours;

            