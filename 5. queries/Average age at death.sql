SELECT ROUND(AVG(DATEDIFF(dod, dob) / 365), 2) AS avg_age_at_death
FROM patients
WHERE dod IS NOT NULL AND dob IS NOT NULL;

