# Run a Single-Instance Stateful Application

[https://kubernetes.io/docs/tasks/run-application/run-single-instance-stateful-application/](https://kubernetes.io/docs/tasks/run-application/run-single-instance-stateful-application/)

## Create
  - PV and PVC FIRST of the YAML file:
    - `kubectl apply -f mysql-pv.yaml`
  - Deployment:
    - `kubectl apply -f mysql-deployment.yaml`

## Describe
  - `kdd mysql`
  - `kdpvc mysql-pv-claim`

## Accessing the MySQL instance
  - Run MySQL CLI Client to connect to MySQL Server
    - `kubectl run -it --rm --image=mysql:5.6 --restart=Never mysql-client -- mysql -h mysql -ppassword`

  - [DB](https://www.tutorialspoint.com/mysql/mysql-create-database.htm) 
    - `SHOW DATABASES;`
    - `CREATE DATABASE mydb`
    - `USE mydb`
    
  - [Table](https://www.tutorialspoint.com/mysql/mysql-create-tables.htm)
    - `SHOW TABLES`
    - Create table
        ```
        create table tutorials_tbl(
        tutorial_id INT NOT NULL AUTO_INCREMENT,
        tutorial_title VARCHAR(100) NOT NULL,
        tutorial_author VARCHAR(40) NOT NULL,
        submission_date DATE,
        PRIMARY KEY ( tutorial_id )
        );    
        ```
    - `INSERT INTO tutorials_tbl (tutorial_title, tutorial_author, submission_date) VALUES ("Learn PHP", "John Poul", NOW());`
    - `SELECT * from tutorials_tbl`
    

