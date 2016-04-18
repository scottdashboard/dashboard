
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

# ADD PERCENT (AS PER JOSH ON 2016APR18)
CREATE TABLE PLACE_OF_SERVICE(
    ID          INT NOT NULL SERIAL PRIMARY KEY,
    GRP_ID      INT NOT NULL,
    LABEL       TEXT,
    COUNT       INT,
    PERCENT     REAL,
    TOTAL_PAID  INT,
    FOREIGN KEY (GRP_ID) REFERENCES GRP(ID)
);

# ADD PERCENT (AS PER JOSH ON 2016APR18)
CREATE TABLE GENDER(
    ID          INT NOT NULL SERIAL PRIMARY KEY,
    GRP_ID      INT NOT NULL,
    LABEL       TEXT,
    COUNT       INT,
    PERCENT     REAL,
    TOTAL_PAID  INT,
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

# ADD NEW CATEGORY CALLED SPECIALTY AND CHANGE MAINT TO "BRAND" (AS PER JOSH ON 2016APR18)
# IF NO SPECIALTY, THEN WE CAN GROUP THIS INTO "BRAND" (AS PER JOSH ON 2016APR18)
CREATE TABLE GENERIC_VS_MAINT(
    ID              INT NOT NULL SERIAL PRIMARY KEY,
    GRP_ID          INT NOT NULL,
    PERIOD          TEXT,
    GENERIC_PAID    INT,
    BRAND_PAID      INT,
    SPECIALTY_PAID  INT,
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

# THIS GRAPH SHOULD BE THE TOP X MEMBERS THAT SUBMIT THE HIGHEST CLAIMS (SHOW MEDICAL AND RX) 
# IN THE LATEST MONTH AND THE PAST MONTH
# DIAGNOSS MEDICAL$(12-MONTH PERIOD) RX$(12-MONTH PERIOD) TOTAL_COST(MED+RX) MOST_RECENT_MONTH_SPEND$
CREATE TABLE LARGE_CLAIMS(
    ID                      INT NOT NULL SERIAL PRIMARY KEY,
    GRP_ID                  INT NOT NULL,
    DIAGNOSIS               TEXT,
    PAID_MEDICAL            INT,
    PAID_RX                 INT,
    TOTAL_PAID              INT,
    TOTAL_PAID_THIS_MONTH   INT,
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

INSERT INTO PLACE_OF_SERVICE(GRP_ID, LABEL, COUNT, PERCENT, TOTAL_PAID)
    values  (1,'OUTPATIENT HOSPITAL',128360,43,18651531),
            (1,'OFFICE',339402,37,17979756),
            (1,'INPATIENT HOSPITAL',5681,31,2831836),
            (1,'INDEPENDANT LAB',28105,25,844455),
            (1,'EMERGENCY ROOM',10143,20,406860),
            (1,'AMBULANCE',4225,15,313953),
            (1,'INDEPENDANT CLINIC',1076,14,311192),
            (1,'NURSING FACILITY',945,12,117323),
            (1,'DENTIST',3076,7,59529)
            ;

INSERT INTO GENDER(GRP_ID, LABEL, COUNT, PERCENT, TOTAL_PAID)
    values  (1,'F',346344,53,25515694),
            (1,'M',175822,47,16056652)
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

INSERT INTO GENERIC_VS_MAINT(GRP_ID, PERIOD, GENERIC_PAID, MAINT_PAID, SPECIALTY_PAID)
    values  (1,'NOV 2015',11990,23201,14012),
            (1,'DEC 2015',12433,22987,11021),
            (1,'JAN 2016',13990,22435,12231),
            (1,'FEB 2016',12343,22333,16324),
            (1,'MAR 2016',12432,22132,11122),
            (1,'APR 2016',13789,21232,12111)
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
    values  (1,'IMMUNOTHERAPY ENCOUNTER',133517,50000,183517,3454),
            (1,'OTH SEQUELA, CHR LIV DIS',122050,20000,142050,45343),
            (1,'MYELODYSPLASTIC SYND NOS',89417,10000,99417,12323),
            (1,'DMII WO CMP NT ST UNCNTR',85833,10000,95833,12122),
            (1,'ANEMIA',85833,20000,105833,23423),
            (1,'DIABETES',85833,10000,95833,34334),
            (1,'CARDIO DISEASE',60418,40000,100418,2324),
            (1,'BENIGN NEO CRANIAL NERVE',46357,20000,66357,4543),
            (1,'HYPERSOM W SLP APNEA NOS',44247,30000,74247,23432),
            (1,'IMMUNOTHERAPY ENCOUNTER',42699,20000,62699,3432)
            ;


# Exit
\q


#ZEND
