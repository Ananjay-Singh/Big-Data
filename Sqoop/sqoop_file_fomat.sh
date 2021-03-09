#Sqoop support below file format
#--as-testfile
#--as-sequencefile
#--as-avrodatafile
#--as-parquetfile
sqoop-import \
--connect "jdbc:mysql://quickstart.cloudera:3306/employee_db" \
--username employee_db \
--password password \
--table department \
--as-textfile \
--target-dir /imported_data
