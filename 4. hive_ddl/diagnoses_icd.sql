CREATE EXTERNAL TABLE diagnoses (
    row_id INT,
    subject_id INT,
    hadm_id INT,
    seq_num INT,
    icd9_code STRING
)
STORED AS AVRO
LOCATION '/user/dtest/avrotest/diagnoses'
TBLPROPERTIES (
    'avro.schema.literal'='{
        "type": "record",
        "name": "Diagnosis",
        "fields": [
            {"name": "row_id", "type": ["int", "null"]},
            {"name": "subject_id", "type": ["int", "null"]},
            {"name": "hadm_id", "type": ["int", "null"]},
            {"name": "seq_num", "type": ["int", "null"]},
            {"name": "icd9_code", "type": ["string", "null"]}
        ]
    }'
);