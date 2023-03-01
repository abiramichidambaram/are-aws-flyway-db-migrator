DROP USER IF EXISTS rwuser;
CREATE USER rwuser WITH LOGIN;
GRANT rw_role TO rwuser;
 
DROP USER IF EXISTS rouser;
CREATE USER rouser WITH LOGIN;
GRANT ro_role TO rouser;
