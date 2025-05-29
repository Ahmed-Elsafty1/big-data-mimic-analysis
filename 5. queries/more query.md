
-- ✅ Goal: Calculate the average glucose lab value
-- Why: To understand overall glucose levels among patients.
SELECT i.label, AVG(l.valuenum) AS avg_value
FROM labeventes l
JOIN d_labitems i ON l.itemid = i.itemid
WHERE i.label LIKE '%glucose%' AND l.valuenum IS NOT NULL
GROUP BY i.label;


-- ✅ Goal: Retrieve the most frequently performed lab tests
-- Why: To identify the most commonly measured lab items.
SELECT l.itemid, i.label, COUNT(*) AS measurement_count
FROM labeventes l
JOIN d_labitems i ON l.itemid = i.itemid
GROUP BY l.itemid, i.label
ORDER BY measurement_count DESC
LIMIT 10;


-- ✅ Goal: Identify the most common diagnoses (ICD-9 codes)
-- Why: To understand which conditions are most prevalent.
SELECT d.icd9_code, i.short_title, COUNT(*) AS diagnosis_count
FROM diagnoses d
JOIN d_icd_dignoses i ON d.icd9_code = i.icd9_code
GROUP BY d.icd9_code, i.short_title
ORDER BY diagnosis_count DESC
LIMIT 10;


-- ✅ Goal: Find patients with multiple ICU stays
-- Why: To highlight patients with chronic or recurring critical illness.
SELECT subject_id, COUNT(*) AS icu_stay_count
FROM icustay
GROUP BY subject_id
HAVING COUNT(*) > 1
ORDER BY icu_stay_count DESC
LIMIT 10;


-- ✅ Goal: Calculate the average ICU length of stay per care unit
-- Why: To assess unit-level patient duration and resource usage.
SELECT first_careunit, AVG(DATEDIFF(outtime, intime)) AS avg_icu_los_days
FROM icustay
WHERE outtime IS NOT NULL AND outtime > intime
GROUP BY first_careunit
ORDER BY avg_icu_los_days DESC;


-- ✅ Goal: Calculate average length of hospital stay
-- Why: To evaluate patient throughput and hospitalization intensity.
SELECT AVG(DATEDIFF(dischtime, admittime)) AS avg_los_days
FROM admissions
WHERE dischtime IS NOT NULL AND dischtime > admittime;


-- ✅ Goal: Determine mortality rate by gender
-- Why: To analyze gender-based differences in patient outcomes.
SELECT gender, AVG(CAST(expire_flag AS DOUBLE)) AS mortality_rate
FROM patients
GROUP BY gender;


-- ✅ Goal: Count total patients by gender
-- Why: For demographic insights and population statistics.
SELECT gender, COUNT(*) AS patient_count
FROM patients
GROUP BY gender;


-- ✅ Goal: Analyze monthly admission trends
-- Why: To identify seasonal or monthly admission patterns.
SELECT FROM_UNIXTIME(UNIX_TIMESTAMP(admittime), 'yyyy-MM') AS admission_month, COUNT(*) AS admission_count
FROM admissions
GROUP BY FROM_UNIXTIME(UNIX_TIMESTAMP(admittime), 'yyyy-MM')
ORDER BY admission_month;


-- ✅ Goal: Identify peak hours for lab events
-- Why: To understand when clinical activity is highest.
SELECT HOUR(charttime) AS hour_of_day, COUNT(*) AS event_count
FROM labeventes
GROUP BY HOUR(charttime)
ORDER BY hour_of_day;


-- ✅ Goal: Find patients with long ICU stays and mortality outcome
-- Why: To examine relationship between extended stays and death.
SELECT i.subject_id, DATEDIFF(i.outtime, i.intime) AS los_days, p.expire_flag
FROM icustay i
JOIN patients p ON i.subject_id = p.subject_id
WHERE DATEDIFF(i.outtime, i.intime) > 30 AND i.outtime IS NOT NULL
ORDER BY los_days DESC
LIMIT 10;


-- ✅ Goal: Identify diabetic patients with abnormal glucose results
-- Why: To link diagnosis with relevant lab abnormalities.
SELECT DISTINCT p.subject_id, p.gender
FROM patients p
JOIN diagnoses d ON p.subject_id = d.subject_id
JOIN d_icd_dignoses i ON d.icd9_code = i.icd9_code
JOIN labeventes l ON p.subject_id = l.subject_id
JOIN d_labitems li ON l.itemid = li.itemid
WHERE i.long_title LIKE '%diabetes%' AND l.flag = 'abnormal' AND li.label LIKE '%glucose%'
LIMIT 10;


-- ✅ Goal: Average lab value per diagnosis
-- Why: To explore how diagnoses correlate with lab measurements.
SELECT i.short_title, li.label, AVG(l.valuenum) AS avg_value
FROM diagnoses d
JOIN d_icd_dignoses i ON d.icd9_code = i.icd9_code
JOIN labeventes l ON d.subject_id = l.subject_id
JOIN d_labitems li ON l.itemid = li.itemid
WHERE l.valuenum IS NOT NULL
GROUP BY i.short_title, li.label
ORDER BY avg_value DESC
LIMIT 10;


-- ✅ Goal: Analyze lab activity span and frequency per patient
-- Why: To see how much and how long patients are monitored.
SELECT p.subject_id, COUNT(l.itemid) AS lab_event_count,
       DATEDIFF(MAX(l.charttime), MIN(l.charttime)) AS days_active
FROM patients p
JOIN labeventes l ON p.subject_id = l.subject_id
GROUP BY p.subject_id
HAVING COUNT(l.itemid) > 0
ORDER BY lab_event_count DESC
LIMIT 10;


-- ✅ Goal: Patients with high diagnosis count and elevated lab values
-- Why: To highlight complex cases with severe conditions.
SELECT p.subject_id, COUNT(DISTINCT d.icd9_code) AS diagnosis_count,
       MAX(l.valuenum) AS max_lab_value
FROM patients p
JOIN diagnoses d ON p.subject_id = d.subject_id
JOIN labeventes l ON p.subject_id = l.subject_id
WHERE l.valuenum IS NOT NULL
GROUP BY p.subject_id
HAVING COUNT(DISTINCT d.icd9_code) > 2 AND MAX(l.valuenum) > 100
ORDER BY diagnosis_count DESC
LIMIT 10;


-- ✅ Goal: Relationship between ICU stay duration and abnormal lab flags
-- Why: To study how longer ICU stays correlate with abnormal results.
SELECT i.subject_id, DATEDIFF(i.outtime, i.intime) AS los_days,
       COUNT(CASE WHEN l.flag = 'abnormal' THEN 1 END) AS abnormal_count
FROM icustay i
JOIN labeventes l ON i.subject_id = l.subject_id AND i.hadm_id = l.hadm_id
WHERE i.outtime IS NOT NULL AND l.flag IS NOT NULL
  AND l.charttime BETWEEN i.intime AND i.outtime
GROUP BY i.subject_id, DATEDIFF(i.outtime, i.intime)
HAVING DATEDIFF(i.outtime, i.intime) > 0
ORDER BY los_days DESC, abnormal_count DESC
LIMIT 10;



SELECT d.icd9_code, di.short_title, 
       AVG(DATEDIFF(a.dischtime, a.admittime)) as avg_los_days
FROM ADMISSIONS a
JOIN DIAGNOSES_ICD d ON a.subject_id = d.subject_id AND a.hadm_id = d.hadm_id
JOIN D_ICD_DIAGNOSES di ON d.icd9_code = di.icd9_code
WHERE a.dischtime IS NOT NULL AND a.dischtime > a.admittime
GROUP BY d.icd9_code, di.short_title
ORDER BY avg_los_days DESC
LIMIT 10;



SELECT i.hadm_id, i.subject_id, COUNT(*) as icu_stay_count
FROM ICUSTAYS i
GROUP BY i.hadm_id, i.subject_id
HAVING COUNT(*) > 1
ORDER BY icu_stay_count DESC
LIMIT 10;



WITH PatientICUCounts AS (
    SELECT subject_id, COUNT(DISTINCT hadm_id) as admission_count_with_icu
    FROM ICUSTAY
    GROUP BY subject_id
    HAVING COUNT(DISTINCT hadm_id) > 1
)
SELECT admission_count_with_icu, COUNT(*) as patient_count
FROM PatientICUCounts
GROUP BY admission_count_with_icu
ORDER BY admission_count_with_icu;


SELECT 
    CASE 
        WHEN FLOOR(DATEDIFF(CURRENT_DATE, p.dob) / 365.25) < 18 THEN '0-17'
        WHEN FLOOR(DATEDIFF(CURRENT_DATE, p.dob) / 365.25) BETWEEN 18 AND 44 THEN '18-44'
        WHEN FLOOR(DATEDIFF(CURRENT_DATE, p.dob) / 365.25) BETWEEN 45 AND 64 THEN '45-64'
        ELSE '65+' 
    END as age_group,
    AVG(CAST(p.expire_flag AS DOUBLE)) as mortality_rate
FROM PATIENTS p
WHERE p.dob IS NOT NULL
GROUP BY 
    CASE 
        WHEN FLOOR(DATEDIFF(CURRENT_DATE, p.dob) / 365.25) < 18 THEN '0-17'
        WHEN FLOOR(DATEDIFF(CURRENT_DATE, p.dob) / 365.25) BETWEEN 18 AND 44 THEN '18-44'
        WHEN FLOOR(DATEDIFF(CURRENT_DATE, p.dob) / 365.25) BETWEEN 45 AND 64 THEN '45-64'
        ELSE '65+' 
    END
ORDER BY age_group;



SELECT 
    p.gender,
    CASE
        WHEN FLOOR(DATEDIFF(CURRENT_DATE, p.dob) / 365.25) < 18 THEN '0-17'
        WHEN FLOOR(DATEDIFF(CURRENT_DATE, p.dob) / 365.25) BETWEEN 18 AND 44 THEN '18-44'
        WHEN FLOOR(DATEDIFF(CURRENT_DATE, p.dob) / 365.25) BETWEEN 45 AND 64 THEN '45-64'
        ELSE '65+' 
    END as age_group,
    AVG(CAST(p.expire_flag AS DOUBLE)) as mortality_rate
FROM PATIENTS p
WHERE p.dob IS NOT NULL
GROUP BY
    p.gender,
    CASE
        WHEN FLOOR(DATEDIFF(CURRENT_DATE, p.dob) / 365.25) < 18 THEN '0-17'
        WHEN FLOOR(DATEDIFF(CURRENT_DATE, p.dob) / 365.25) BETWEEN 18 AND 44 THEN '18-44'
        WHEN FLOOR(DATEDIFF(CURRENT_DATE, p.dob) / 365.25) BETWEEN 45 AND 64 THEN '45-64'
        ELSE '65+'
    END
ORDER BY p.gender, age_group;

