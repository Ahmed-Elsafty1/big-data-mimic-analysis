CREATE EXTERNAL TABLE icustay (
    row_id INT,
    subject_id INT,
    hadm_id INT,
    icustay_id INT,
    dbsource STRING,
    first_careunit STRING,
    last_careunit STRING,
    first_wardid INT,
    last_wardid INT,
    intime TIMESTAMP,
    outtime TIMESTAMP,
    los DOUBLE
)
STORED AS AVRO
LOCATION '/user/dtest/avrotest/icustay'
TBLPROPERTIES (
    'avro.schema.literal'='{
        "type": "record",
        "name": "ICUStay",
        "fields": [
            {"name": "row_id", "type": ["int", "null"]},
            {"name": "subject_id", "type": ["int", "null"]},
            {"name": "hadm_id", "type": ["int", "null"]},
            {"name": "icustay_id", "type": ["int", "null"]},
            {"name": "dbsource", "type": ["string", "null"]},
            {"name": "first_careunit", "type": ["string", "null"]},
            {"name": "last_careunit", "type": ["string", "null"]},
            {"name": "first_wardid", "type": ["int", "null"]},
            {"name": "last_wardid", "type": ["int", "null"]},
            {"name": "intime", "type": [{"type": "long", "logicalType": "timestamp-millis"}, "null"]},
            {"name": "outtime", "type": [{"type": "long", "logicalType": "timestamp-millis"}, "null"]},
            {"name": "los", "type": ["double", "null"]}
        ]
    }'
);
