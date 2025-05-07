CREATE DATABASE colorectal_cancer; 
use colorectal_cancer;


-- what is the distribution of cancer diagnosis by gender and smoking status?

select Gender, Smoking_History, count(*)
from patients
group by Gender, Smoking_History;

-- what is the distribution of cancer diagnosis by patient age?


select 
CASE
  WHEN Age < 40 THEN 'Less_Than_40'
  WHEN Age between 40 and 60 then 'Between 40 and 60'
  WHEN Age > 60 THEN 'More than 60'
END AS Age_Bracket,
count(*) AS Distribution_of_Patients
from patients
group by Age_Bracket;

-- How did screening frequency affect detection?

select
Screening_History,count(*) AS Count
from diagnosis
where Early_Detection = 'Yes'
group by Screening_History;

-- Which is the most common treatment type for each cancer stage?

WITH common_treatment AS (
select
Cancer_Stage, Treatment_Type, count(*) AS Count, rank() over(partition by Cancer_Stage order by count(*) desc) as RNK
from diagnosis
join treatment_type
  on diagnosis.Patient_ID = treatment_type.Patient_ID
group by Cancer_Stage, Treatment_Type)
select * from common_treatment
where RNK = 1;

-- Use of different Treatment types in developed regions vs developing regions


select 
Economic_Classification, Treatment_Type, count(*) AS Count
from healthcare_data
join treatment_type
   on healthcare_data.Patient_ID = treatment_type.Patient_ID
group by Economic_Classification, Treatment_Type;

-- Number of patients predicted to survive by each cancer stage


select
Cancer_Stage, Survival_Prediction, count(*) AS Count
from diagnosis
join outcomes
     on diagnosis.Patient_ID = outcomes.Patient_ID
where Survival_Prediction = 'Yes'
group by Cancer_Stage, Survival_Prediction
order by Count desc;

-- How does the 5 year survival rate vary by treatment type?

select 
Treatment_Type, Survival_5_years, count(*) As Count
from treatment_type
join outcomes
    on treatment_type.Patient_ID = outcomes.Patient_ID
group by Treatment_Type, Survival_5_years
order by Treatment_Type;

-- How does survival prediction vary by treatment type?

select 
Treatment_Type, Survival_Prediction, count(*) As Count
from treatment_type
join outcomes
    on treatment_type.Patient_ID = outcomes.Patient_ID
group by Treatment_Type, Survival_Prediction
order by Treatment_Type;

-- Is there a correlation between healthcare access and survival prediction?

select
Healthcare_Access, Survival_Prediction, count(*) AS Count
from healthcare_data
join outcomes
   on healthcare_data.Patient_ID = outcomes.Patient_ID
group by Healthcare_Access, Survival_Prediction
order by Healthcare_Access;

-- How does the combination of cancer stage and early detection affect survival prediction?

select
Cancer_Stage, Survival_Prediction, count(*) AS Count
from diagnosis
join outcomes
  on diagnosis.Patient_ID = outcomes.Patient_ID
where Early_Detection = 'Yes'
group by Cancer_Stage, Survival_Prediction
order by Cancer_Stage;


--  Query to import data into Power bi

select
patients.Patient_ID, Healthcare_Access, Urban_or_Rural, Economic_Classification, Cancer_Stage, Early_Detection, Treatment_Type, Survival_5_years, Survival_Prediction
from
diagnosis
join healthcare_data
  on diagnosis.Patient_ID = healthcare_data.Patient_ID
  join outcomes
   on healthcare_data.Patient_ID = outcomes.Patient_ID
   join patients
     on outcomes.Patient_ID = patients.Patient_ID
     join treatment_type
       on patients.Patient_ID = treatment_type.Patient_ID


