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