#Creating Sqoop job
sqoop job \
--create job_employee \
-- import \
--connect jdbc:mysql://quickstart.cloudera:3306/employee_db \
--username root \
--password password \
--table employee \
--warehouse-dir /data \
--incremental append \
--check-column employee_id \
--last-value 0

#See the list of sqoop jobs
sqoop job --list

#Executing the sqoop job
sqoop job --exec job_employee

#Checking the saved state of the job
sqoop job --show job_employee

#Deleting a Sqoop Job
sqoop job --delete job_orders

#The state of job stored in the current directory from where the job has been created
cd .sqoop
cat metastore.db.script | grep incremental
