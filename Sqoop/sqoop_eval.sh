#-e can also be used to write query.
sqoop-eval \
--connect "jdbc:mysql://quickstart.cloudera:3306" \
--username employee_db \
--password password
--query "select * from employee_db.salaray limit 10"

We can display the schema of tabls.
sqoop-eval \
--connect "jdbc:mysql://quickstart.cloudera:3306" \
--username employee_db \
--password password
--e "DESCRIBE employee_db.salaray"
