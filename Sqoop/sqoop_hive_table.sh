#The create-hive-table arguments populate a hive metastore with a definitaon for a table based on a database.
#Below command will create empty hive
sqoop create-hive-table \
--connect "jdbc:mysql://quickstart.cloudera:3306/employee_db" \
--username employee_db \
--password password \
--table employee \
--hive-table emp \
--fields-terminated-by ','

#It will create table and load the data.
#--hive-overwrite option to repalced the existing table and reload
#if we not give --hive-table then the table name will same as source table.
sqoop-import \
--connect jdbc:mysql://quickstart.cloudera:3306/retail_db \
--username root \
--password cloudera \
--table orders \
--hive-import \
--hive-table orders_new \
--null-string '\\N' \
--null-non-string '\\N'
