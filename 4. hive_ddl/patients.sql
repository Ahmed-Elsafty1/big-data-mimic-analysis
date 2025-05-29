CREATE EXTERNAL TABLE patients (
    row_id INT,
    subject_id INT,
    gender STRING,
    dob TIMESTAMP,
    dod TIMESTAMP,
    dod_hosp TIMESTAMP,
    dod_ssn TIMESTAMP,
    expire_flag INT
)
STORED AS AVRO
LOCATION '/user/dtest/avrotest/patients'
TBLPROPERTIES ('avro.schema.literal'='
{
    "type": "record",
    "name": "Patient",
    "fields": [
        {"name": "row_id", "type": ["int", "null"]},
        {"name": "subject_id", "type": ["int", "null"]},
        {"name": "gender", "type": ["string", "null"]},
        {"name": "dob", "type": [{"type": "long", "logicalType": "timestamp-millis"}, "null"]},
        {"name": "dod", "type": [{"type": "long", "logicalType": "timestamp-millis"}, "null"]},
        {"name": "dod_hosp", "type": [{"type": "long", "logicalType": "timestamp-millis"}, "null"]},
        {"name": "dod_ssn", "type": [{"type": "long", "logicalType": "timestamp-millis"}, "null"]},
        {"name": "expire_flag", "type": ["int", "null"]}
    ]
}');