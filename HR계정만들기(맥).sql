CREATE USER HR IDENTIFIED BY PASS
GRANT RESOURCE, CONNECT TO HR;
grant create session, create table, create procedure to HR;
ALTER USER HR quota unlimited on USERS;