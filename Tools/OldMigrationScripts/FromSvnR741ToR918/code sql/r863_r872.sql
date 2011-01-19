DROP TABLE Univr;

CREATE TABLE job
(
  jobid integer NOT NULL,
  courseid integer NOT NULL,
  status character varying NOT NULL,
  mediatype integer NOT NULL,
  coursetype character varying NOT NULL,
  mediapath character varying,
  extension character varying NOT NULL,
  CONSTRAINT job_pkey PRIMARY KEY (jobid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE job OWNER TO sqluser;

CREATE SEQUENCE job_jobid_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE job_jobid_seq OWNER TO sqluser;

