SELECT p.expire_flag, COUNT(DISTINCT i.icustay_id) AS total_icu_visits
FROM icustay i
JOIN patients p ON i.subject_id = p.subject_id
GROUP BY p.expire_flag;
