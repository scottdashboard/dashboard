
# Login as postgres user
sudo -i -u postgres

# Create database
createdb dashboard_db1

# Connect
\c dashboard_db1

#######################################################
#
#   Create Table
#
#######################################################
CREATE TABLE CLAIMS_MED(
    PERIOD      TEXT PRIMARY KEY,
    COUNT       INT,
    TOTAL_PAID  INT
);

CREATE TABLE CLAIMS_RX(
    PERIOD      TEXT PRIMARY KEY,
    COUNT       INT,
    TOTAL_PAID  INT
);

CREATE TABLE PLACE_OF_SERVICE(
    LABEL       TEXT PRIMARY KEY,
    COUNT       INT,
    TOTAL_PAID  INT
);

CREATE TABLE GENDER(
    LABEL       TEXT PRIMARY KEY,
    PERCENT     REAL
);


CREATE TABLE MED_DIAGNOSTIC_CODES(
    LABEL       TEXT PRIMARY KEY,
    COUNT       INT,
    TOTAL_PAID  INT
);

CREATE TABLE CHRONIC_CONDITIONS(
    LABEL       TEXT PRIMARY KEY,
    COUNT       INT,
    TOTAL_PAID  INT
);

CREATE TABLE ER_VS_UC(
    PERIOD      TEXT PRIMARY KEY,
    ER_PAID     INT,
    UC_PAID     INT
);

CREATE TABLE GENERIC_VS_MAINT(
    PERIOD          TEXT PRIMARY KEY,
    GENERIC_PAID    INT,
    MAINT_PAID      INT
);

CREATE TABLE THERAPEUTIC_CLASS(
    LABEL       TEXT PRIMARY KEY,
    COUNT       INT,
    TOTAL_PAID  INT
);

CREATE TABLE DRUGS(
    LABEL       TEXT PRIMARY KEY,
    COUNT       INT,
    TOTAL_PAID  INT
);

CREATE TABLE MAIL_VS_RETAIL(
    PERIOD          TEXT PRIMARY KEY,
    MAIL_PAID       INT,
    RETAIL_PAID     INT
);

CREATE TABLE LARGE_CLAIMS(
    PERIOD              TEXT PRIMARY KEY,
    PAID                INT,
    PLACE_OF_SERVICE    TEXT,
    CITY                TEXT,
    STATE               TEXT,
    ZIPCODE             TEXT,
    DIAGNOSIS           TEXT
);

#######################################################
#
#   List Tables
#
#######################################################
\dt


#######################################################
#
#   Populate Tables
#
#######################################################
INSERT INTO CLAIMS_MED(PERIOD, COUNT, TOTAL_PAID)
    values  ('NOV 2015',1813990,23201),
            ('DEC 2015',1823433,22987),
            ('JAN 2016',1833990,22435),
            ('FEB 2016',1822343,22333),
            ('MAR 2016',1823432,22132),
            ('APR 2016',1839789,21232)
            ;

INSERT INTO CLAIMS_RX(PERIOD, COUNT, TOTAL_PAID)
    values  ('NOV 2015',1813990,23201),
            ('DEC 2015',1823433,22987),
            ('JAN 2016',1833990,22435),
            ('FEB 2016',1822343,22333),
            ('MAR 2016',1823432,22132),
            ('APR 2016',1839789,21232)
            ;

INSERT INTO PLACE_OF_SERVICE(LABEL, COUNT, TOTAL_PAID)
    values  ('OUTPATIENT HOSPITAL',128360,18651531),
            ('OFFICE',339402,17979756),
            ('INPATIENT HOSPITAL',5681,2831836),
            ('INDEPENDANT LAB',28105,844455),
            ('EMERGENCY ROOM',10143,406860),
            ('AMBULANCE',4225,313953),
            ('INDEPENDANT CLINIC',1076,311192),
            ('NURSING FACILITY',945,117323),
            ('DENTIST',3076,59529)
            ;

INSERT INTO PLACE_OF_SERVICE(LABEL, COUNT, TOTAL_PAID)
    values  ('F',346344,25515694),
            ('M',175822,16056652)
            ;

INSERT INTO MED_DIAGNOSTIC_CODES(LABEL, COUNT, TOTAL_PAID)
    values  ('Routine Child Health Exam',19905,1050049),
            ('Routine Medical Exam',23716,728393),
            ('Malign Neopl Breast NOS',2868,613121),
            ('Hemolytic Hemoglobinuria',524,606254),
            ('End Stage Renal Disease',3478,543167),
            ('Routine Gyn Exam',7839,488500),
            ('Screen Malig Neop-Colon',1356,440251),
            ('Antineoplastic Chemo Enc',583,432121),
            ('Normal Delivery',357,324344)
            ;

INSERT INTO CHRONIC_CONDITIONS(LABEL, COUNT, TOTAL_PAID)
    values  ('Routine Child Health Exam',19905,1050049),
            ('Routine Medical Exam',23716,728393),
            ('Malign Neopl Breast NOS',2868,613121),
            ('Hemolytic Hemoglobinuria',524,606254),
            ('End Stage Renal Disease',3478,543167),
            ('Routine Gyn Exam',7839,488500),
            ('Screen Malig Neop-Colon',1356,440251),
            ('Antineoplastic Chemo Enc',583,432121),
            ('Normal Delivery',357,324344)
            ;

INSERT INTO ER_VS_UC(PERIOD, ER_PAID, UC_PAID)
    values  ('NOV 2015',11990,23201),
            ('DEC 2015',12433,22987),
            ('JAN 2016',13990,22435),
            ('FEB 2016',12343,22333),
            ('MAR 2016',12432,22132),
            ('APR 2016',13789,21232)
            ;

INSERT INTO GENERIC_VS_MAINT(PERIOD, GENERIC_PAID, MAINT_PAID)
    values  ('NOV 2015',11990,23201),
            ('DEC 2015',12433,22987),
            ('JAN 2016',13990,22435),
            ('FEB 2016',12343,22333),
            ('MAR 2016',12432,22132),
            ('APR 2016',13789,21232)
            ;

INSERT INTO THERAPEUTIC_CLASS(LABEL, COUNT, TOTAL_PAID)
    values  ('Pyrimethamine ',19905,1050049),
            ('Chloroquine ',23716,728393),
            ('Gemifloxacin ',2868,613121),
            ('Turpentine',524,606254),
            ('Sodium Benzoate',3478,543167),
            ('Amiacin Sulfate',7839,488500),
            ('Niclosamide',1356,440251),
            ('Ivermectin',583,432121),
            ('Amebicides',357,324344)
            ;

INSERT INTO DRUGS(LABEL, COUNT, TOTAL_PAID)
    values  ('ADALIMUMAB INJ KIT 40 MG/0.8ML (50 MG/ML) ',505,1772106),
            ('ADALIMUMAB PEN-INJECTOR KIT 40 MG/0.8ML ',342,1369030),
            ('LEDIPASVIR-SOFOSBUVIR TAB 90-400 MG ',42,1348174),
            ('ETANERCEPT SUBCUTANEOUS SOLUTION AUTO-INJECTOR 50 MG/ML',350,1178776),
            ('ANTIHEMOPHILIC FACTOR (RECOMBINANT) FOR INJ 1241-1800 UNIT',31,1060091),
            ('TERIFLUNOMIDE TAB 14 MG',145,720209),
            ('*MESALAMINE RECTAL ENEMA 4 GM & CLEANSER  WIPE KIT**',6,684534),
            ('ETANERCEPT SUBCUTANEOUS INJ 50 MG/ML',185,649687),
            ('INSULIN GLARGINE INJ 100 UNIT/ML',435,514980)
            ;

INSERT INTO MAIL_VS_RETAIL(PERIOD, MAIL_PAID, RETAIL_PAID)
    values  ('NOV 2015',11990,23201),
            ('DEC 2015',12433,22987),
            ('JAN 2016',13990,22435),
            ('FEB 2016',12343,22333),
            ('MAR 2016',12432,22132),
            ('APR 2016',13789,21232)
            ;

INSERT INTO LARGE_CLAIMS(PERIOD, PAID, PLACE_OF_SERVICE, CITY, STATE, ZIPCODE, DIAGNOSIS) 
    values  ('2014-11-29',133517,'ATLANTA','GA','30384','IMMUNOTHERAPY ENCOUNTER'),
            ('2015-10-22',122050,'ATLANTA','GA','30384','OTH SEQUELA, CHR LIV DIS'),
            ('2016-01-23',89417,'LYNCHBURG','VA','24501','MYELODYSPLASTIC SYND NOS'),
            ('2015-09-30',85833,'CHARLOTTE','NC','28275',''),
            ('2015-07-02',85833,'CHARLOTTE','NC','28275',''),
            ('2016-02-18',85833,'CHARLOTTE','NC','28275',''),
            ('2015-09-26',60418,'ATLANTA','GA','30384','DMII WO CMP NT ST UNCNTR'),
            ('2015-05-19',46357,'ATLANTA','GA','30384','BENIGN NEO CRANIAL NERVE'),
            ('2015-04-11',44247,'BELFAST','ME','04915','HYPERSOM W SLP APNEA NOS'),
            ('2014-01-26',42699,'CHICAGO','IL','60674','IMMUNOTHERAPY ENCOUNTER')
            ;


# Exit
\q


#ZEND
