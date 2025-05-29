CREATE EXTERNAL TABLE IF NOT EXISTS d_items (
row_id INT,
itemid INT,
label STRING,
abbreviation STRING,
dbsource STRING,
linksto STRING,
category STRING,
unitname STRING,
param_type STRING,
conceptid FLOAT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/mimic/d_items/'
TBLPROPERTIES ("skip.header.line.count"="1");
