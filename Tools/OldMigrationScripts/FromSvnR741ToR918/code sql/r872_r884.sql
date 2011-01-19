CREATE TABLE discipline
(
  disciplineid serial NOT NULL,
  codecomp character varying NOT NULL,
  namecomp character varying,
  codedom character varying,
  namedom character varying,
  CONSTRAINT discipline_pkey PRIMARY KEY (disciplineid),
  CONSTRAINT discipline_codecomp_key UNIQUE (codecomp)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE discipline OWNER TO sqluser;

CREATE TABLE "level"
(
  levelid serial NOT NULL,
  code character varying NOT NULL,
  "name" character varying,
  CONSTRAINT level_pkey PRIMARY KEY (levelid),
  CONSTRAINT level_code_key UNIQUE (code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "level" OWNER TO sqluser;

ALTER TABLE "user" ADD COLUMN etp character varying;
ALTER TABLE "user" ALTER COLUMN etp SET STORAGE EXTENDED;

