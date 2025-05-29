SELECT AVG(datediff(dischtime, admittime)) AS avg_length_of_stay
FROM admissions
WHERE dischtime IS NOT NULL AND admittime IS NOT NULL;