#4 ways to pass the password
#1. In the command using --password
#2. Passing the parameter at runtime using -P

#3. Storing the password in password file
echo -n "password" >> .password-file
sqoop-eval \
--connect "jdbc:mysql://quickstart.cloudera:3306" \
--username employee_db \
--password-file file:///home/cloudera/.password-file \
--e "DESCRIBE employee_db.salaray"

#4. Password alias with encrypted password
hadoop credential create mysql.employee.password -provider jceks://hdfs/user/cloudera/mysql.password.jceks
sqoop-eval \
-Dhadoop.security.credential.provider.path=jceks://hdfs/user/cloudera/mysql.password.jceks \
--connect "jdbc:mysql://quickstart.cloudera:3306" \
--username employee_db \
--password-alias mysql.employee.password \
--e "DESCRIBE employee_db.salaray"
