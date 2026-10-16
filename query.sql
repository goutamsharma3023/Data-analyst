-- total patient by year wise month
 
SELECT COUNT(p.patient_id) AS Total_Patients,
  MONTH(p.registration_date) AS Month,
  YEAR(p.registration_date)  AS Year  
FROM patient p
GROUP BY YEAR(p.registration_date), MONTH(p.registration_date)
ORDER BY Year, Month;

-- total patients by allergies

select distinct(count(p.patient_id)) as total_patients, p.allergies 
from patient p
group by allergies
order by total_patients desc;

-- total patients by chronic conditions

select distinct(count(p.patient_id)) as total_patients, p.chronic_conditions
from patient p
group by chronic_conditions
order by total_patients desc;

-- total patients by state

select distinct(count(p.patient_id)) as total_patients, p.state
from patient p
group by state
order by total_patients desc;

-- total patients by gender

select distinct(count(p.patient_id)) as total_patients, gender
from patient p
group by gender
order by total_patients desc; 

-- total patients by age group

SELECT
  CASE
    WHEN age < 18 THEN '0-17'
    WHEN age BETWEEN 18 AND 34 THEN '18-34'
    WHEN age BETWEEN 35 AND 49 THEN '35-49'
    WHEN age BETWEEN 50 AND 64 THEN '50-64'
    ELSE '65+'
  END AS age_group,
  COUNT(p.patient_id) AS total_patients
FROM patient p
GROUP BY age_group
ORDER BY MIN(age);

-- Top insurance providers

SELECT p.insurance_provider_text as top_insurance_provider, COUNT(p.patient_id) as total_patients
FROM patient p
WHERE p.insurance_provider_text IS NOT NULL
GROUP BY top_insurance_provider
ORDER BY total_patients desc LIMIT 10;

-- top visits by diagnosis

select distinct(count(v.visit_id)) total_visits, v.diagnosis
from visit v
group by diagnosis
order by total_visits desc limit 5;

-- treatment outcomes

select count(t.treatment_id) total_treatments, t.outcome
from treatment t
group by outcome
order by total_treatments;

-- top visit types

select distinct(count(v.visit_id)) as total_visits, v.visit_type
from visit v
group by visit_type
order by total_visits desc; 
 

    

