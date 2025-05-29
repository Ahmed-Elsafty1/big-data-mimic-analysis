CREATE EXTERNAL TABLE IF NOT EXISTS d_labitems (
row_id INT,
itemid INT,
label STRING,
fluid STRING,
category STRING,
loinc_code STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/mimic/d_labitems/'
TBLPROPERTIES ("skip.header.line.count"="1");
