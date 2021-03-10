#sqoop --split-by comes into the picture when there is no primary key
#or the primary key columns are not evenly distributed.
#It should be numeric column and it should not have null values.
sqoop-import \
--connect "jdbc:mysql://quickstart.cloudera:3306/employee_db" \
--username employee_db \
--password password \
--table salary \
--split-by employee_id
--target-dir /imported_data

#We need to set the below property for non numeric columnn.
#org.apache.sqoop.splitter.allow_test_splitter=true
sqoop-import \
-Dorg.apache.sqoop.splitter.allow_test_splitter=true \
--connect "jdbc:mysql://quickstart.cloudera:3306/employee_db" \
--username employee_db \
--password password \
--table salary \
--split-by employee_id
--target-dir /imported_data

#We can set to autoreset to one mapper if primary key is not there so that job will not fail.
sqoop-import \
--connect "jdbc:mysql://quickstart.cloudera:3306/employee_db" \
--username employee_db \
--password password \
--table salary \
--autoreset-to-one-mapper \
--num-mappers 8 \
--target-dir /imported_data
