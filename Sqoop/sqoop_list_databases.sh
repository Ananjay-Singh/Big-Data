#We can redirect the logs into files.
sqoop-list-databases \
--connect "jdbc:mysql://quickstart.cloudera:3306" \
--username employee_db \
--password password 1>query.out 2>query.err

#To see more logs and debugging information, We need to use below parameter.
#--verbose
sqoop-list-databases \
--connect "jdbc:mysql://quickstart.cloudera:3306" \
--username employee_db \
--password password
--verbose
