##  Environment
###  Docker environment
#### 1. Install Docker & Docker Compose
You can download and install Docker from the official Docker website"
##### 👉 https://www.docker.com/products/docker-desktop/
##### 👉 for ensure all done 
            docker --version
            docker-compose --version

#### 2. Clone the repository
git clone https://github.com/Marcel-Jan/docker-hadoop-spark.git
cd docker-hadoop-spark

#### 3. Buid & Run Our Containers
docker-compose up --build
docker-compose ps

#### 4. exce namenode container >> Enter it
docker exec -it namenode bash



###  python environment & jupyter
#### 1. create venv
python -m venv venv
source venv/bin/activate     # ( Linux - WSL )
venv\Scripts\activate        # ( Windows )
#### 2. install required packages
pip install -r requirements.txt
pip freeze > requirements.txt

pip install jupyter
pip install pandas
pip install avro
pip install pyarrow


## Data Preparations
#### follow 👉  Data_preprocessing.ipynb

## loading Data In hdfs 
#### follow 👉  hdfs_ddl.md 

## Creating Data Tables In Hive
#### follow 👉  hive_ddl.md

## MapReduce 
#### follow 👉  mapreduce.md

## 📊 About the Project


