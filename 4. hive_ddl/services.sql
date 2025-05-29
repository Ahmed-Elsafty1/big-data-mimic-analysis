CREATE EXTERNAL TABLE IF NOT EXISTS services (
row_id INT,
subject_id INT,
hadm_id INT,
transfertime TIMESTAMP,
prev_service STRING,
curr_service STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/mimic/services/'
TBLPROPERTIES ("skip.header.line.count"="1");
