@echo off
set password=%1
IF "%1"=="" (GOTO :ERROR)

del *.sql
for /f %%f in ('mysql -uroot -p%password% dbname -e "show tables;" -N -B') do mysqldump --skip-comments -d -uroot -p%password% dbname %%f> dbname_%%f.sql
mysqldump --skip-comments -R -t -n -d -uroot -p%password% dbname>dbname_routines.sql
GOTO :END
:ERROR
echo missing password
:END

