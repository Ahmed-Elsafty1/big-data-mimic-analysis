SELECT curr_service, COUNT(DISTINCT subject_id) AS patient_count
FROM services
GROUP BY curr_service
ORDER BY patient_count DESC;

