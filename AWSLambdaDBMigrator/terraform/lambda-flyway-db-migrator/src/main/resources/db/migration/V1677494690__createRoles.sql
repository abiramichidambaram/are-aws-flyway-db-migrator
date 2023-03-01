DROP ROLE IF EXISTS ro_role;
create role ro_role;
grant usage on schema dbmigrator to ro_role;
grant select on all tables in schema dbmigrator to ro_role;

DROP ROLE IF EXISTS rw_role;
create role rw_role;
grant usage on schema dbmigrator to rw_role;
grant select,update,delete,insert on all tables in schema dbmigrator to rw_role;
