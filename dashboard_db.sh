
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
CREATE TABLE GRP(
    ID   INT NOT NULL SERIAL PRIMARY KEY,
    NAME TEXT NOT NULL UNIQUE
);

CREATE TABLE CLAIMS_MED(
    ID          INT NOT NULL SERIAL PRIMARY KEY,
    GRP_ID      INT NOT NULL,
    PERIOD      TEXT,
    COUNT       INT,
    TOTAL_PAID  INT,
    FOREIGN KEY (GRP_ID) REFERENCES GRP(ID)
);

CREATE TABLE CLAIMS_RX(
    ID          INT NOT NULL SERIAL PRIMARY KEY,
    GRP_ID      INT NOT NULL,
    PERIOD      TEXT,
    COUNT       INT,
    TOTAL_PAID  INT,
    FOREIGN KEY (GRP_ID) REFERENCES GRP(ID)
);

CREATE TABLE PLACE_OF_SERVICE(
    ID          INT NOT NULL SERIAL PRIMARY KEY,
    GRP_ID      INT NOT NULL,
    LABEL       TEXT,
    COUNT       INT,
    TOTAL_PAID  INT,
    FOREIGN KEY (GRP_ID) REFERENCES GRP(ID)
);

CREATE TABLE GENDER(
    ID          INT NOT NULL SERIAL PRIMARY KEY,
    GRP_ID      INT NOT NULL,
    LABEL       TEXT,
    PERCENT     REAL,
    FOREIGN KEY (GRP_ID) REFERENCES GRP(ID)
);,

CREATE TABLE RELATIONSHIP(
    ID          INT NOT NULL SERIAL PRIMARY KEY,
    GRP_ID      INT NOT NULL,
    LABEL       TEXT,
    PERCENT     REAL,
    FOREIGN KEY (GRP_ID) REFERENCES GRP(ID)
);,

CREATE TABLE MED_DIAGNOSTIC_CODES(
    ID          INT NOT NULL SERIAL PRIMARY KEY,
    GRP_ID      INT NOT NULL,
    LABEL       TEXT,
    COUNT       INT,
    TOTAL_PAID  INT,
    FOREIGN KEY (GRP_ID) REFERENCES GRP(ID)
);

CREATE TABLE CHRONIC_CONDITIONS(
    ID          INT NOT NULL SERIAL PRIMARY KEY,
    GRP_ID      INT NOT NULL,
    LABEL       TEXT,
    COUNT       INT,
    TOTAL_PAID  INT,
    FOREIGN KEY (GRP_ID) REFERENCES GRP(ID)
);

CREATE TABLE ER_VS_UC(
    ID          INT NOT NULL SERIAL PRIMARY KEY,
    GRP_ID      INT NOT NULL,
    PERIOD      TEXT,
    ER_PAID     INT,
    UC_PAID     INT,
    FOREIGN KEY (GRP_ID) REFERENCES GRP(ID)
);

CREATE TABLE GENERIC_VS_MAINT(
    ID              INT NOT NULL SERIAL PRIMARY KEY,
    GRP_ID          INT NOT NULL,
    PERIOD          TEXT,
    GENERIC_PAID    INT,
    MAINT_PAID      INT,
    FOREIGN KEY (GRP_ID) REFERENCES GRP(ID)
);

CREATE TABLE THERAPEUTIC_CLASS(
    ID          INT NOT NULL SERIAL PRIMARY KEY,
    GRP_ID      INT NOT NULL,
    LABEL       TEXT,
    COUNT       INT,
    TOTAL_PAID  INT,
    FOREIGN KEY (GRP_ID) REFERENCES GRP(ID)
);

CREATE TABLE DRUGS(
    ID          INT NOT NULL SERIAL PRIMARY KEY,
    GRP_ID      INT NOT NULL,
    LABEL       TEXT,
    COUNT       INT,
    TOTAL_PAID  INT,
    FOREIGN KEY (GRP_ID) REFERENCES GRP(ID)
);

CREATE TABLE MAIL_VS_RETAIL(
    ID              INT NOT NULL SERIAL PRIMARY KEY,
    GRP_ID          INT NOT NULL,
    PERIOD          TEXT,
    MAIL_PAID       INT,
    RETAIL_PAID     INT,
    FOREIGN KEY (GRP_ID) REFERENCES GRP(ID)
);

CREATE TABLE LARGE_CLAIMS(
    ID                  INT NOT NULL SERIAL PRIMARY KEY,
    GRP_ID              INT NOT NULL,
    PERIOD              TEXT,
    PAID                INT,
    PLACE_OF_SERVICE    TEXT,
    CITY                TEXT,
    STATE               TEXT,
    ZIPCODE             TEXT,
    DIAGNOSIS           TEXT,
    FOREIGN KEY (GRP_ID) REFERENCES GRP(ID)
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
INSERT INTO GRP(ID, NAME)
    values  (1, 'Default')
            ;

INSERT INTO CLAIMS_MED(GRP_ID, PERIOD, COUNT, TOTAL_PAID)
    values  (1,'NOV 2015',1813990,23201),
            (1,'DEC 2015',1823433,22987),
            (1,'JAN 2016',1833990,22435),
            (1,'FEB 2016',1822343,22333),
            (1,'MAR 2016',1823432,22132),
            (1,'APR 2016',1839789,21232)
            ;

INSERT INTO CLAIMS_RX(GRP_ID, PERIOD, COUNT, TOTAL_PAID)
    values  (1,'NOV 2015',1813990,23201),
            (1,'DEC 2015',1823433,22987),
            (1,'JAN 2016',1833990,22435),
            (1,'FEB 2016',1822343,22333),
            (1,'MAR 2016',1823432,22132),
            (1,'APR 2016',1839789,21232)
            ;

INSERT INTO PLACE_OF_SERVICE(GRP_ID, LABEL, COUNT, TOTAL_PAID)
    values  (1,'OUTPATIENT HOSPITAL',128360,18651531),
            (1,'OFFICE',339402,17979756),
            (1,'INPATIENT HOSPITAL',5681,2831836),
            (1,'INDEPENDANT LAB',28105,844455),
            (1,'EMERGENCY ROOM',10143,406860),
            (1,'AMBULANCE',4225,313953),
            (1,'INDEPENDANT CLINIC',1076,311192),
            (1,'NURSING FACILITY',945,117323),
            (1,'DENTIST',3076,59529)
            ;

INSERT INTO PLACE_OF_SERVICE(GRP_ID, LABEL, COUNT, TOTAL_PAID)
    values  (1,'F',346344,25515694),
            (1,'M',175822,16056652)
            ;

INSERT INTO RELATIONSHIP(GRP_ID, LABEL, COUNT, TOTAL_PAID)
    values  (1,'EMPLOYEE',346344,15515694),
            (1,'SPOUSE',275822,8056652),
            (1,'CHILD',165822,2056652),
            (1,'OTHER',115822,1056652)
            ;

INSERT INTO MED_DIAGNOSTIC_CODES(GRP_ID, LABEL, COUNT, TOTAL_PAID)
    values  (1,'Routine Child Health Exam',19905,1050049),
            (1,'Routine Medical Exam',23716,728393),
            (1,'Malign Neopl Breast NOS',2868,613121),
            (1,'Hemolytic Hemoglobinuria',524,606254),
            (1,'End Stage Renal Disease',3478,543167),
            (1,'Routine Gyn Exam',7839,488500),
            (1,'Screen Malig Neop-Colon',1356,440251),
            (1,'Antineoplastic Chemo Enc',583,432121),
            (1,'Normal Delivery',357,324344)
            ;

INSERT INTO CHRONIC_CONDITIONS(GRP_ID, LABEL, COUNT, TOTAL_PAID)
    values  (1,'Routine Child Health Exam',19905,1050049),
            (1,'Routine Medical Exam',23716,728393),
            (1,'Malign Neopl Breast NOS',2868,613121),
            (1,'Hemolytic Hemoglobinuria',524,606254),
            (1,'End Stage Renal Disease',3478,543167),
            (1,'Routine Gyn Exam',7839,488500),
            (1,'Screen Malig Neop-Colon',1356,440251),
            (1,'Antineoplastic Chemo Enc',583,432121),
            (1,'Normal Delivery',357,324344)
            ;

INSERT INTO ER_VS_UC(GRP_ID, PERIOD, ER_PAID, UC_PAID)
    values  (1,'NOV 2015',11990,23201),
            (1,'DEC 2015',12433,22987),
            (1,'JAN 2016',13990,22435),
            (1,'FEB 2016',12343,22333),
            (1,'MAR 2016',12432,22132),
            (1,'APR 2016',13789,21232)
            ;

INSERT INTO GENERIC_VS_MAINT(GRP_ID, PERIOD, GENERIC_PAID, MAINT_PAID)
    values  (1,'NOV 2015',11990,23201),
            (1,'DEC 2015',12433,22987),
            (1,'JAN 2016',13990,22435),
            (1,'FEB 2016',12343,22333),
            (1,'MAR 2016',12432,22132),
            (1,'APR 2016',13789,21232)
            ;

INSERT INTO THERAPEUTIC_CLASS(GRP_ID, LABEL, COUNT, TOTAL_PAID)
    values  (1,'Pyrimethamine ',19905,1050049),
            (1,'Chloroquine ',23716,728393),
            (1,'Gemifloxacin ',2868,613121),
            (1,'Turpentine',524,606254),
            (1,'Sodium Benzoate',3478,543167),
            (1,'Amiacin Sulfate',7839,488500),
            (1,'Niclosamide',1356,440251),
            (1,'Ivermectin',583,432121),
            (1,'Amebicides',357,324344)
            ;

INSERT INTO DRUGS(GRP_ID, LABEL, COUNT, TOTAL_PAID)
    values  (1,'ADALIMUMAB INJ KIT 40 MG/0.8ML (50 MG/ML) ',505,1772106),
            (1,'ADALIMUMAB PEN-INJECTOR KIT 40 MG/0.8ML ',342,1369030),
            (1,'LEDIPASVIR-SOFOSBUVIR TAB 90-400 MG ',42,1348174),
            (1,'ETANERCEPT SUBCUTANEOUS SOLUTION AUTO-INJECTOR 50 MG/ML',350,1178776),
            (1,'ANTIHEMOPHILIC FACTOR (RECOMBINANT) FOR INJ 1241-1800 UNIT',31,1060091),
            (1,'TERIFLUNOMIDE TAB 14 MG',145,720209),
            (1,'*MESALAMINE RECTAL ENEMA 4 GM & CLEANSER  WIPE KIT**',6,684534),
            (1,'ETANERCEPT SUBCUTANEOUS INJ 50 MG/ML',185,649687),
            (1,'INSULIN GLARGINE INJ 100 UNIT/ML',435,514980)
            ;

INSERT INTO MAIL_VS_RETAIL(GRP_ID, PERIOD, MAIL_PAID, RETAIL_PAID)
    values  (1,'NOV 2015',11990,23201),
            (1,'DEC 2015',12433,22987),
            (1,'JAN 2016',13990,22435),
            (1,'FEB 2016',12343,22333),
            (1,'MAR 2016',12432,22132),
            (1,'APR 2016',13789,21232)
            ;

INSERT INTO LARGE_CLAIMS(GRP_ID, PERIOD, PAID, PLACE_OF_SERVICE, CITY, STATE, ZIPCODE, DIAGNOSIS)
    values  (1,'2014-11-29',133517,'','ATLANTA','GA','30384','IMMUNOTHERAPY ENCOUNTER'),
            (1,'2015-10-22',122050,'','ATLANTA','GA','30384','OTH SEQUELA, CHR LIV DIS'),
            (1,'2016-01-23',89417,'','LYNCHBURG','VA','24501','MYELODYSPLASTIC SYND NOS'),
            (1,'2015-09-30',85833,'','CHARLOTTE','NC','28275',''),
            (1,'2015-07-02',85833,'','CHARLOTTE','NC','28275',''),
            (1,'2016-02-18',85833,'','CHARLOTTE','NC','28275',''),
            (1,'2015-09-26',60418,'','ATLANTA','GA','30384','DMII WO CMP NT ST UNCNTR'),
            (1,'2015-05-19',46357,'','ATLANTA','GA','30384','BENIGN NEO CRANIAL NERVE'),
            (1,'2015-04-11',44247,'','BELFAST','ME','04915','HYPERSOM W SLP APNEA NOS'),
            (1,'2014-01-26',42699,'','CHICAGO','IL','60674','IMMUNOTHERAPY ENCOUNTER')
            ;


# Exit
\q


#ZEND
