-- Generated by Oracle SQL Developer Data Modeler 4.0.3.853
--   at:        2015-02-15 15:22:14 CST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g




DROP TABLE SIM_Person CASCADE CONSTRAINTS ;

DROP TABLE SIM_contri CASCADE CONSTRAINTS ;

DROP TABLE SIM_dept CASCADE CONSTRAINTS ;

DROP TABLE SIM_manager CASCADE CONSTRAINTS ;

DROP TABLE SIM_project CASCADE CONSTRAINTS ;

DROP TABLE SIM_project_emp CASCADE CONSTRAINTS ;

CREATE TABLE SIM_Person
  (
    person_id               INTEGER NOT NULL ,
    type                    VARCHAR2 (255) ,
    name                    VARCHAR2 (255) ,
    ssnum                   INTEGER ,
    gender                  VARCHAR2 (255) ,
    birth_date              DATE ,
    address                 VARCHAR2 (255) ,
    city                    VARCHAR2 ,
    state                   VARCHAR2 ,
    zip                     INTEGER ,
    emp_id                  INTEGER NOT NULL ,
    hire_date               DATE ,
    salary                  INTEGER ,
    status                  VARCHAR2 (255) ,
    SIM_project_emp_pemp_id INTEGER ,
    SIM_manager_man_id      INTEGER
  ) ;
CREATE UNIQUE INDEX SIM_Person__IDX ON SIM_Person
  (
    SIM_project_emp_pemp_id ASC
  )
  ;
CREATE UNIQUE INDEX SIM_Person__IDXv1 ON SIM_Person
  (
    SIM_manager_man_id ASC
  )
  ;
  ALTER TABLE SIM_Person ADD CONSTRAINT SIM_Person_PK PRIMARY KEY ( person_id ) ;

CREATE TABLE SIM_contri
  (
    SIM_project_emp_pemp_id INTEGER ,
    SIM_project_project_id  INTEGER
  ) ;

CREATE TABLE SIM_dept
  (
    dept_id            INTEGER NOT NULL ,
    name               VARCHAR2 (255) ,
    location           VARCHAR2 (255) ,
    emp_id             INTEGER ,
    SIM_manager_man_id INTEGER
  ) ;
CREATE UNIQUE INDEX SIM_dept__IDX ON SIM_dept
  (
    SIM_manager_man_id ASC
  )
  ;
  ALTER TABLE SIM_dept ADD CONSTRAINT SIM_dept_PK PRIMARY KEY ( dept_id ) ;

CREATE TABLE SIM_manager
  (
    title                VARCHAR2 (255) ,
    bonus                INTEGER ,
    man_id               INTEGER NOT NULL ,
    SIM_Person_person_id INTEGER ,
    SIM_dept_dept_id     INTEGER
  ) ;
CREATE UNIQUE INDEX SIM_manager__IDX ON SIM_manager
  (
    SIM_Person_person_id ASC
  )
  ;
CREATE UNIQUE INDEX SIM_manager__IDXv1 ON SIM_manager
  (
    SIM_dept_dept_id ASC
  )
  ;
  ALTER TABLE SIM_manager ADD CONSTRAINT SIM_manager_PK PRIMARY KEY ( man_id ) ;

CREATE TABLE SIM_project
  (
    project_id       INTEGER NOT NULL ,
    name             VARCHAR2 (255) ,
    SIM_dept_dept_id INTEGER
  ) ;
ALTER TABLE SIM_project ADD CONSTRAINT SIM_project_PK PRIMARY KEY ( project_id ) ;

CREATE TABLE SIM_project_emp
  (
    title                VARCHAR2 (255) ,
    rating               VARCHAR2 (255) ,
    pemp_id              INTEGER NOT NULL ,
    SIM_Person_person_id INTEGER ,
    SIM_dept_dept_id     INTEGER
  ) ;
CREATE UNIQUE INDEX SIM_project_emp__IDX ON SIM_project_emp
  (
    SIM_Person_person_id ASC
  )
  ;
  ALTER TABLE SIM_project_emp ADD CONSTRAINT SIM_project_emp_PK PRIMARY KEY ( pemp_id ) ;

ALTER TABLE SIM_Person ADD CONSTRAINT SIM_Person_SIM_manager_FK FOREIGN KEY ( SIM_manager_man_id ) REFERENCES SIM_manager ( man_id ) ;

ALTER TABLE SIM_Person ADD CONSTRAINT SIM_Person_SIM_project_emp_FK FOREIGN KEY ( SIM_project_emp_pemp_id ) REFERENCES SIM_project_emp ( pemp_id ) ;

ALTER TABLE SIM_contri ADD CONSTRAINT SIM_contri_SIM_project_FK FOREIGN KEY ( SIM_project_project_id ) REFERENCES SIM_project ( project_id ) ;

ALTER TABLE SIM_contri ADD CONSTRAINT SIM_contri_SIM_project_emp_FK FOREIGN KEY ( SIM_project_emp_pemp_id ) REFERENCES SIM_project_emp ( pemp_id ) ;

ALTER TABLE SIM_dept ADD CONSTRAINT SIM_dept_SIM_manager_FK FOREIGN KEY ( SIM_manager_man_id ) REFERENCES SIM_manager ( man_id ) ;

ALTER TABLE SIM_manager ADD CONSTRAINT SIM_manager_SIM_Person_FK FOREIGN KEY ( SIM_Person_person_id ) REFERENCES SIM_Person ( person_id ) ;

ALTER TABLE SIM_manager ADD CONSTRAINT SIM_manager_SIM_dept_FK FOREIGN KEY ( SIM_dept_dept_id ) REFERENCES SIM_dept ( dept_id ) ;

ALTER TABLE SIM_project ADD CONSTRAINT SIM_project_SIM_dept_FK FOREIGN KEY ( SIM_dept_dept_id ) REFERENCES SIM_dept ( dept_id ) ;

ALTER TABLE SIM_project_emp ADD CONSTRAINT SIM_project_emp_SIM_Person_FK FOREIGN KEY ( SIM_Person_person_id ) REFERENCES SIM_Person ( person_id ) ;

ALTER TABLE SIM_project_emp ADD CONSTRAINT SIM_project_emp_SIM_dept_FK FOREIGN KEY ( SIM_dept_dept_id ) REFERENCES SIM_dept ( dept_id ) ;


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             6
-- ALTER TABLE                             15
-- CREATE VIEW                              0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
