## loading data in hdfs
### 1. strcture of data folder and files >> out_put of data preparations

.data_avro
├── admissions
            └── admissions.avro
├── d_icd_dignoses
            └── d_icd_dignoses.avro
├── d_labitems
            └── d_labitems.avro
├── diagnoses
            └── diagnoses.avro
├── icustay
            └── icustay.avro
├── labeventes
            └── labeventes.avro
├── transferes
            └── transferes.avro
└── patients
            └── patients.avro

### 2. copy data in my docker env >>

👉 docker cp path/to/data_avro namenode:/tmp/data

### 3. exce hdfs dfs command >>

👉 hdfs dfs -mkdir /user/data

👉 hdfs dfs -put /tmp/data /user/data/

👉 hdfs dfs -ls /user/data/ 












