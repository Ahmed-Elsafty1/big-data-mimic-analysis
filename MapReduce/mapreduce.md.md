## MapReduce
### 1. file which run jop on it

.user/data/
    └── patients
            └── patients.avro

### 2. exce namenode >>
👉 docker exec -it namenode bash
    for ensure that hadoop cluster running or exist
    └── start-dfs.sh
    └── start-yarn.sh
    └── jps (ResourceManager, DataNode, NameNode, NodeManager)
    └── java -version

### 3. some requerments
    └── avro-1.11.3.jar
    └── avro-mapred-1.11.3.jar

### 4. share this file in common area for all node 
    └── cp /opt/hadoop-3.2.1/lib/avro-*.jar $HADOOP_HOME/share/hadoop/common/lib/

### 5. exce jop 
    └── hadoop fs -rm -r /user/hive/output
    └── hadoop jar /root/average_patient_age_avro.jar AveragePatientAgeAvro \
    -files hdfs:///path/to/avro-mapred-1.11.3.jar#avro-mapred.jar \
    "/user/data/avrotest/patients/patients.avro" \
    /user/hive/output

