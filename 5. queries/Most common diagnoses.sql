SELECT diagnosis, COUNT(*) AS num_admissions
FROM admissions
WHERE diagnosis IS NOT NULL
GROUP BY diagnosis
ORDER BY num_admissions DESC
LIMIT 10;

