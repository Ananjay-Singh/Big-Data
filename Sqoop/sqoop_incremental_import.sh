#We can import the newer rows than the previously-imported set of rows.
#--check-column(col) (char nor supported)
#--incremental (mode) (append, lastmodified)
#--last-value(value)

#--Append will append all the rows, greater then tha last value of check column
#last value as 0 will append all the data.
sqoop-import \
--connect jdbc:mysql://quickstart.cloudera:3306/retail_db \
--username root \
--password password \
--table employee \
--warehouse-dir /data \
--incremental append \
--check-column employee_id \
--last-value 0

#last value as 500 will append all the record whose order_id is greater than the 500.
sqoop-import \
--connect jdbc:mysql://quickstart.cloudera:3306/retail_db \
--username root \
--password password \
--table employee \
--warehouse-dir /data \
--incremental append \
--check-column employee_id \
--last-value 500


#--lastmodified will update the older rows and insert new rows and check column shuold be timestamp
#--append will cause the duplicate records like the older record and the updated new record both will be there in the HDFS path
sqoop-import \
--connect jdbc:mysql://quickstart.cloudera:3306/retail_db \
--username root \
--password password \
--table employee \
--warehouse-dir /data \
--incremental lastmodified \
--check-column joining_date \
--last-value '2021-03-10 10:00:32' \
--append

#What if we just want the latest records in HDFS?
#Then in that case we need to use --merge-key <merge-column>
#merge will happen after sqoop import
#it will lead to single output file
sqoop-import \
--connect jdbc:mysql://quickstart.cloudera:3306/retail_db \
--username root \
--password password \
--table employee \
--warehouse-dir /data \
--incremental lastmodified \
--check-column joining_date \
--last-value '2020-04-14 16:41:02' \
--merge-key employee_id

#We have to manually keep a track of last value and then supply that during the next run.
#This was a manual process. Solution is sqoop job.
