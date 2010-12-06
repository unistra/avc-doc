-- Migration "release 2.33 to release 2.34" : run this sql script on your database univrav

ALTER TABLE course ADD COLUMN recorddate timestamp without time zone;
ALTER TABLE course ALTER COLUMN recorddate SET STORAGE PLAIN;

