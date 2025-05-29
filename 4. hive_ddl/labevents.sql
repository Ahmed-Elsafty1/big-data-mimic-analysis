CREATE EXTERNAL TABLE labeventes (
    row_id INT,
    subject_id INT,
    hadm_id INT,
    itemid INT,
    charttime TIMESTAMP,
    value STRING,
    valuenum DOUBLE,
    valueuom STRING,
    flag STRING
)
STORED AS AVRO
LOCATION '/user/dtest/avrotest/labeventes'
TBLPROPERTIES (
    'avro.schema.literal'='{
        "type": "record",
        "name": "ChartEvent",
        "fields": [
            {"name": "row_id", "type": ["int", "null"]},
            {"name": "subject_id", "type": ["int", "null"]},
            {"name": "hadm_id", "type": ["int", "null"]},
            {"name": "itemid", "type": ["int", "null"]},
            {"name": "charttime", "type": [{"type": "long", "logicalType": "timestamp-millis"}, "null"]},
            {"name": "value", "type": ["string", "null"]},
            {"name": "valuenum", "type": ["double", "null"]},
            {"name": "valueuom", "type": ["string", "null"]},
            {"name": "flag", "type": ["string", "null"]}
        ]
    }'
);
