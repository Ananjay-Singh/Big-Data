#-z can also be used to compress
#By default gzip algorithum will apply
sqoop-import \
--connect "jdbc:mysql://quickstart.cloudera:3306/employee_db" \
--username employee_db \
--password password \
--table department \
--compress \
--target-dir /imported_data

#We can specify any Hadoop compression codec using --compression-codec
sqoop-import \
--connect "jdbc:mysql://quickstart.cloudera:3306/employee_db" \
--username employee_db \
--password password \
--table department \
--compression-codec BZip2Codec \
--target-dir /imported_data
