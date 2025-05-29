CREATE EXTERNAL TABLE d_icd_dignoses (
    row_id INT,
    icd9_code STRING,
    short_title STRING,
    long_title STRING
)
STORED AS AVRO
LOCATION '/user/dtest/avrotest/d_icd_dignoses'
TBLPROPERTIES (
    'avro.schema.literal'='{
        "type": "record",
        "name": "ICD9Dictionary",
        "fields": [
            {"name": "row_id", "type": ["int", "null"]},
            {"name": "icd9_code", "type": ["string", "null"]},
            {"name": "short_title", "type": ["string", "null"]},
            {"name": "long_title", "type": ["string", "null"]}
        ]
    }'
);