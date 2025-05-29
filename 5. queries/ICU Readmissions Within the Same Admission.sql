SELECT i.hadm_id, i.subject_id, COUNT(*) as icu_stay_count
FROM ICUSTAY i
GROUP BY i.hadm_id, i.subject_id
HAVING COUNT(*) > 1
ORDER BY icu_stay_count DESC
LIMIT 10;

