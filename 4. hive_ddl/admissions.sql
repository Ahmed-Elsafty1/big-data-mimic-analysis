CREATE EXTERNAL TABLE admissions (
    row_id INT,
    subject_id INT,
    hadm_id INT,
    admittime TIMESTAMP,
    dischtime TIMESTAMP,
    deathtime TIMESTAMP,
    admission_type STRING,
    admission_location STRING,
    discharge_location STRING,
    insurance STRING,
    language STRING,
    religion STRING,
    marital_status STRING,
    ethnicity STRING,
    edregtime TIMESTAMP,
    edouttime TIMESTAMP,
    diagnosis STRING,
    hospital_expire_flag INT,
    has_chartevents_data INT
)
STORED AS AVRO
LOCATION '/user/dtest/avrotest/admissions'
TBLPROPERTIES (
    'avro.schema.literal'='{
        "type": "record",
        "name": "Admission",
        "fields": [
            {"name": "row_id", "type": ["int", "null"]},
            {"name": "subject_id", "type": ["int", "null"]},
            {"name": "hadm_id", "type": ["int", "null"]},
            {"name": "admittime", "type": [{"type": "long", "logicalType": "timestamp-millis"}, "null"]},
            {"name": "dischtime", "type": [{"type": "long", "logicalType": "timestamp-millis"}, "null"]},
            {"name": "deathtime", "type": [{"type": "long", "logicalType": "timestamp-millis"}, "null"]},
            {"name": "admission_type", "type": ["string", "null"]},
            {"name": "admission_location", "type": ["string", "null"]},
            {"name": "discharge_location", "type": ["string", "null"]},
            {"name": "insurance", "type": ["string", "null"]},
            {"name": "language", "type": ["string", "null"]},
            {"name": "religion", "type": ["string", "null"]},
            {"name": "marital_status", "type": ["string", "null"]},
            {"name": "ethnicity", "type": ["string", "null"]},
            {"name": "edregtime", "type": [{"type": "long", "logicalType": "timestamp-millis"}, "null"]},
            {"name": "edouttime", "type": [{"type": "long", "logicalType": "timestamp-millis"}, "null"]},
            {"name": "diagnosis", "type": ["string", "null"]},
            {"name": "hospital_expire_flag", "type": ["int", "null"]},
            {"name": "has_chartevents_data", "type": ["int", "null"]}
        ]
    }'
);