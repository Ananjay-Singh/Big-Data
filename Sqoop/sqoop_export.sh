#Table should be created prior to export.
#Sqoop exprt can fail and that can have many reason, one of the reason is primary key voilation.
#failure can lead to partial data into tables.
sqoop export \
--connect "jdbc:mysql://quickstart.cloudera:3306/employee_db" \
--username employee_db \
--password password \
--table department \
--export-dir /data/department.csv
--fields-terminated-by ','

#one another satge table need to create to solve the partial data problem
#and schema should be same as final table.
#if sqoop command fails the partial data will be in stage table not in the final table
#if sqoop command success the data will load to stage table
#and it will migrate to final table and stage table will be truncated.
sqoop export \
--connect "jdbc:mysql://quickstart.cloudera:3306/employee_db" \
--username employee_db \
--password password \
--table department \
--staging-table department_stage \
--export-dir /data/department.csv
--fields-terminated-by ','
