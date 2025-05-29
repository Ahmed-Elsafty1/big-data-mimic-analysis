SELECT itemid, COUNT(*) AS abnormal_count
FROM labeventes
WHERE flag = 'abnormal'
GROUP BY itemid
ORDER BY abnormal_count DESC
LIMIT 10;

