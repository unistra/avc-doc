ALTER TABLE course ADD COLUMN volume smallint;
ALTER TABLE course ALTER COLUMN volume SET STORAGE PLAIN;
ALTER TABLE course ALTER COLUMN volume SET NOT NULL;
ALTER TABLE course ALTER COLUMN volume SET DEFAULT 1;
ALTER TABLE course DROP COLUMN mediafolder;
