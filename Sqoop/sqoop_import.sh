#target directory should not be there when we are using target-dir otherwise it will give an error.
#department table should have the primary key otherwise it will give an error.
#By default the numbers of mappers are 4, so the number of output file will be 4.
sqoop-import \
--connect "jdbc:mysql://quickstart.cloudera:3306/employee_db" \
--username employee_db \
--password password \
--table department \
--target-dir /imported_data

#Now the number of file will be 1 as we have set the mappers to 1.
#this is required when we don't have primary key in the table.
#--num-mappers can also be used to specify the numbers of mappers
sqoop-import \
--connect "jdbc:mysql://quickstart.cloudera:3306/employee_db" \
--username employee_db \
--password password \
--table department \
-m 1 \
--target-dir /imported_data

#This command will import all the tables from given database
#folders will be created inside given path when we are using warehouse-dir.
sqoop-import-all-tables \
--connect "jdbc:mysql://quickstart.cloudera:3306/employee_db" \
--username employee_db \
--password password \
--warehouse-dir /employee_db_tables
