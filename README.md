# Big Data Healthcare Analytics with MIMIC-III

## 📊 About the Project

This project implements a Big Data analytics pipeline using Hadoop and Hive on the MIMIC-III clinical dataset to extract insights from healthcare records.

## 🔧 Technologies Used
- **Docker compose repo** : GitHub - Marcel-Jan/docker-hadoop-spark: Multi-container environment with Hadoop, Hive 
- Hadoop HDFS
- MapReduce (for trying it)
- Hive (SQL over Big Data)
- Docker & Docker compose (for environment setup)
- Beeline (CLI client for Hive)
- Python (for data processing and analysis)


## 📁 Project Structure
- **`Environment preparations`** 👉 installations requerments
- **`Data_preprocessing`** : 👉 data model & preprocessing data & converting it to >> avro format
- **`hdfs_ddl/`**: 👉 loading data in hdfs 
- **`hive_ddl/`**: 👉 Hive CREATE TABLE scripts
- **`queries/`**: 👉 Analysis SQL queries
- **`docs/`**: 👉 Report and presentation
- **`screenshots/`**: 👉 CLI and results screenshots

## 📈 Key Analyses 
- **queries**: 👉 queries folder
- **queries Resules**: 👉 queries results folder
- Average Length of Stay
- Top Diagnoses
- Mortality Rates by Gender and Age
- ICU Readmissions
- Top Prescribed Drugs

## 📚 Dataset
[MIMIC-III Clinical Database (Demo)](https://physionet.org/content/mimiciii-demo/1.4/)
