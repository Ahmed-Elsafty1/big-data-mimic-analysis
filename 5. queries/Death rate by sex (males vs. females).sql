SELECT gender, COUNT(*) AS total_patients, SUM(expire_flag) AS deaths,
ROUND(SUM(expire_flag)*100.0 / COUNT(*), 2) AS death_rate_percent
FROM patients
WHERE gender IS NOT NULL
GROUP BY gender;

