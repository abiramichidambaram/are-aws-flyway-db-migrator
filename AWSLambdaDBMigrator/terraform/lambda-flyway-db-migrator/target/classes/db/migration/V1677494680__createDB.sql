SELECT 'CREATE DATABASE testdb'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'testdb');

SET search_path TO dbmigrator;