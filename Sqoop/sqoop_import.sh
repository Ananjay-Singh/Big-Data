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

#We can select columnn and ordering using --columns
sqoop-import \
--connect "jdbc:mysql://quickstart.cloudera:3306/employee_db" \
--username employee_db \
--password password \
--table employee \
--columnn employee_id, employee_name, address \
--target-dir /imported_data

#We can filter the rwo using --where
sqoop-import \
--connect "jdbc:mysql://quickstart.cloudera:3306/employee_db" \
--username employee_db \
--password password \
--table employee \
--columnn employee_id, employee_name, address \
--where "employee_id in ('EMP_01, EMP_02')" \
--target-dir /imported_data

#We can specify the Delimiters also while importing
#--fields-terminated-by '|'
#--lines-terminated-by ';'
sqoop-import \
--connect "jdbc:mysql://quickstart.cloudera:3306/employee_db" \
--username employee_db \
--password password \
--table employee \
--columnn employee_id, employee_name, address \
--fields-terminated-by '|' \
--lines-terminated-by ';' \
--target-dir /imported_data

#append parameter will append the data into the existing HDFS path
#--append
sqoop-import \
--connect "jdbc:mysql://quickstart.cloudera:3306/employee_db" \
--username employee_db \
--password password \
--table employee \
--columnn employee_id, employee_name, address \
--where "employee_id in ('EMP_01, EMP_02')" \
--target-dir /imported_data
--append

#Delete taget directory if exists
#--delete-target-dir
sqoop-import \
--connect "jdbc:mysql://quickstart.cloudera:3306/employee_db" \
--username employee_db \
--password password \
--table employee \
--columnn employee_id, employee_name, address \
--where "employee_id in ('EMP_01, EMP_02')" \
--target-dir /imported_data
--delete-target-dir

#Dealing with nulls while importing data. if not then null will become 'NULL'
#--null-non-string
#--null-string
sqoop-import \
--connect "jdbc:mysql://quickstart.cloudera:3306/employee_db" \
--username employee_db \
--password password \
--table employee \
--columnn employee_id, employee_name, address \
--where "employee_id in ('EMP_01, EMP_02')" \
--null-non-string "-1"
--null-string "NA"
--target-dir /imported_data

#default import - if path is not given it will import in home directory in HDFS
sqoop-import \
--connect "jdbc:mysql://quickstart.cloudera:3306/employee_db" \
--username employee_db \
--password password \
--table department \

#Instead of using the --table, --columns and --where arguments,
#you can specify a SQL statement with the --query argument.
#you must specify a destination directory with --target-dir.
#And no OR conditions in the WHERE clause.
#You must also select a splitting column with --split-by.
#Use of complex queries such as queries that have sub-queries or joins leading to ambiguous projections
#Your query must include the token $CONDITIONS for bounding conditions
#Example 1:
sqoop-import \
--connect jdbc:mysql://quickstart.cloudera:3306/retail_db \
--username root \
--password cloudera \
--query 'select * from orders where $CONDITIONS AND order_id > 50000' \
--target-dir /data/orders3 \
--split-by order_id

# In double quotes ("), you will have to use \$CONDITIONS instead of just $CONDITIONS
#Example 2:
sqoop-import \
--connect jdbc:mysql://quickstart.cloudera:3306/retail_db \
--username root \
--password cloudera \
--query "select * from orders where \$CONDITIONS AND order_id > 50000" \
--target-dir /data/orders2 \
--split-by order_id


#--direct argument, you are specifying that Sqoop should attempt the direct import channel.
#Some databases can perform imports in a more high-performance fashion by using database-specific data movement tools.
sqoop-import \
--connect "jdbc:mysql://quickstart.cloudera:3306/employee_db" \
--username employee_db \
--password password \
--table department \
--target-dir /imported_data
--direct

#validate the import
sqoop-import \
--connect jdbc:mysql://quickstart.cloudera:3306/retail_db \
--username root \
--password cloudera \
--table orders \
--target-dir /data/orders \
--validate
