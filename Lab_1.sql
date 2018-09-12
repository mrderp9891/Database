CREATE DATABASE lab_1;

CREATE TABLE users(
  id     integer PRIMARY KEY ,
  firstname varchar(50) NOT NULL ,
  lastname varchar(50) NOT NULL
);

ALTER TABLE users ADD COLUMN isadmin VARCHAR(50);

ALTER TABLE users ALTER COLUMN isadmin DROP DEFAULT;

ALTER TABLE users ALTER isadmin TYPE bool USING isadmin::boolean;

ALTER TABLE users ALTER COLUMN isadmin SET DEFAULT FALSE;

ALTER TABLE users ADD CONSTRAINT primaryKey_tmp PRIMARY KEY (id);


CREATE TABLE tasks(
  id     integer PRIMARY KEY ,
  name varchar(50) NOT NULL ,
  user_id integer NOT NULL
);

DROP TABLE tasks;

DROP DATABASE lab1;