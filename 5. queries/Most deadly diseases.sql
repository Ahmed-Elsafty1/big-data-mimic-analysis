SELECT diagnosis, COUNT(*) AS death_count
FROM admissions
WHERE hospital_expire_flag = 1
GROUP BY diagnosis
ORDER BY death_count DESC
LIMIT 10;

