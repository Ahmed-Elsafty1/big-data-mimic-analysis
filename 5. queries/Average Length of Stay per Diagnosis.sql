SELECT d.icd9_code, di.short_title, 
       AVG(DATEDIFF(a.dischtime, a.admittime)) as avg_los_days
FROM ADMISSIONS a
JOIN DIAGNOSES d ON a.subject_id = d.subject_id AND a.hadm_id = d.hadm_id
JOIN D_ICD_DIGNOSES di ON d.icd9_code = di.icd9_code
WHERE a.dischtime IS NOT NULL AND a.dischtime > a.admittime
GROUP BY d.icd9_code, di.short_title
ORDER BY avg_los_days DESC
LIMIT 10;
