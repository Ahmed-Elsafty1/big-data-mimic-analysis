SELECT subject_id, COUNT(*) AS icu_visits
FROM icustay
GROUP BY subject_id
HAVING COUNT(*) > 1
ORDER BY icu_visits DESC
LIMIT 10;

