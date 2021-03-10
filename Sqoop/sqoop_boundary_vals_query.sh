#Boundary vals query will run by default if we have more than one mappers.
#It is required to divide the work across the mappers using primary key.
#If primary key is not there then It will pick form split by
#or we can customize or own boundary values.
#Reason of customizeing our own is to discard the outlate values that causes the empty output file
#or inconsistent the work load between the mappers.
sqoop-import \
--connect "jdbc:mysql://quickstart.cloudera:3306/employee_db" \
--username employee_db \
--password password \
--table employee \
--boundary-query "SELECT 1, 20000" \
--columnn employee_id, employee_name, address \
--target-dir /imported_data

#Where clause will be part of boundary vals query.
sqoop-import \
--connect "jdbc:mysql://quickstart.cloudera:3306/employee_db" \
--username employee_db \
--password password \
--table employee \
--boundary-query "SELECT min(employee_id), max(employee_id) from department" \
--columnn employee_id, employee_name, address \
--where "employee_id in ('EMP_01, EMP_02')" \
--target-dir /imported_data
