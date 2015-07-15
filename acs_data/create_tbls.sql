--
-- Make sure schema exists
--
CREATE SCHEMA IF NOT EXISTS acs;

--
-- Meta table for column names
--
DROP TABLE IF EXISTS acs.col_names;
CREATE TABLE acs.col_names (
    indicator character varying(10) NOT NULL,
    col character varying(14) NOT NULL,
    col_name text
);

--
-- Data table: Age distribution
--
CREATE TABLE IF NOT EXISTS acs.b01001 (
    year smallint,
    year_est smallint,
    sumlevel varchar(16),
    geoid varchar(32),
    b01001_0 decimal(15),
    b01001_0_moe decimal(15),
    b01001_1 decimal(15),
    b01001_1_moe decimal(15),
    b01001_2 decimal(15),
    b01001_2_moe decimal(15),
    b01001_3 decimal(15),
    b01001_3_moe decimal(15),
    b01001_4 decimal(15),
    b01001_4_moe decimal(15),
    b01001_5 decimal(15),
    b01001_5_moe decimal(15),
    b01001_6 decimal(15),
    b01001_6_moe decimal(15),
    b01001_7 decimal(15),
    b01001_7_moe decimal(15),
    b01001_8 decimal(15),
    b01001_8_moe decimal(15),
    b01001_9 decimal(15),
    b01001_9_moe decimal(15),
    b01001_10 decimal(15),
    b01001_10_moe decimal(15),
    b01001_11 decimal(15),
    b01001_11_moe decimal(15),
    b01001_12 decimal(15),
    b01001_12_moe decimal(15),
    b01001_13 decimal(15),
    b01001_13_moe decimal(15),
    b01001_14 decimal(15),
    b01001_14_moe decimal(15),
    b01001_15 decimal(15),
    b01001_15_moe decimal(15),
    b01001_16 decimal(15),
    b01001_16_moe decimal(15),
    b01001_17 decimal(15),
    b01001_17_moe decimal(15),
    b01001_18 decimal(15),
    b01001_18_moe decimal(15),
    b01001_19 decimal(15),
    b01001_19_moe decimal(15),
    b01001_20 decimal(15),
    b01001_20_moe decimal(15),
    b01001_21 decimal(15),
    b01001_21_moe decimal(15),
    b01001_22 decimal(15),
    b01001_22_moe decimal(15),
    b01001_23 decimal(15),
    b01001_23_moe decimal(15),  
    PRIMARY KEY (year, year_est, geoid, sumlevel)
);
--
-- Add metadata for column names
--
INSERT INTO acs.col_names VALUES ('b01001', 'b01001_0', 'Total');
INSERT INTO acs.col_names VALUES ('b01001', 'b01001_1', 'Under 5 years');
INSERT INTO acs.col_names VALUES ('b01001', 'b01001_2', '5 to 9 years');
INSERT INTO acs.col_names VALUES ('b01001', 'b01001_3', '10 to 14 years');
INSERT INTO acs.col_names VALUES ('b01001', 'b01001_4', '15 to 17 years');
INSERT INTO acs.col_names VALUES ('b01001', 'b01001_5', '18 and 19 years');
INSERT INTO acs.col_names VALUES ('b01001', 'b01001_6', '20 years');
INSERT INTO acs.col_names VALUES ('b01001', 'b01001_7', '21 years');
INSERT INTO acs.col_names VALUES ('b01001', 'b01001_8', '22 to 24 years');
INSERT INTO acs.col_names VALUES ('b01001', 'b01001_9', '25 to 29 years');
INSERT INTO acs.col_names VALUES ('b01001', 'b01001_10', '30 to 34 years');
INSERT INTO acs.col_names VALUES ('b01001', 'b01001_11', '35 to 39 years');
INSERT INTO acs.col_names VALUES ('b01001', 'b01001_12', '40 to 44 years');
INSERT INTO acs.col_names VALUES ('b01001', 'b01001_13', '45 to 49 years');
INSERT INTO acs.col_names VALUES ('b01001', 'b01001_14', '50 to 54 years');
INSERT INTO acs.col_names VALUES ('b01001', 'b01001_15', '55 to 59 years');
INSERT INTO acs.col_names VALUES ('b01001', 'b01001_16', '60 and 61 years');
INSERT INTO acs.col_names VALUES ('b01001', 'b01001_17', '62 to 64 years');
INSERT INTO acs.col_names VALUES ('b01001', 'b01001_18', '65 and 66 years');
INSERT INTO acs.col_names VALUES ('b01001', 'b01001_19', '67 to 69 years');
INSERT INTO acs.col_names VALUES ('b01001', 'b01001_20', '70 to 74 years');
INSERT INTO acs.col_names VALUES ('b01001', 'b01001_21', '75 to 79 years');
INSERT INTO acs.col_names VALUES ('b01001', 'b01001_22', '80 to 84 years');
INSERT INTO acs.col_names VALUES ('b01001', 'b01001_23', '85 years and over');


--
-- Data table: Nativity
--
CREATE TABLE IF NOT EXISTS acs.b05001 (
    year smallint,
    year_est smallint,
    sumlevel varchar(16),
    geoid varchar(32),
    b05001_0 decimal(15),
    b05001_0_moe decimal(15),
    b05001_1 decimal(15),
    b05001_1_moe decimal(15),
    b05001_2 decimal(15),
    b05001_2_moe decimal(15),
    b05001_3 decimal(15),
    b05001_3_moe decimal(15),
    b05001_4 decimal(15),
    b05001_4_moe decimal(15),
    b05001_5 decimal(15),
    b05001_5_moe decimal(15),
    PRIMARY KEY (year, year_est, geoid, sumlevel)
);
--
-- Add metadata for nativity column names
--
INSERT INTO acs.col_names VALUES ('b05001', 'b05001_0', 'Total');
INSERT INTO acs.col_names VALUES ('b05001', 'b05001_1', 'U.S. citizen, born in the United States');
INSERT INTO acs.col_names VALUES ('b05001', 'b05001_2', 'U.S. citizen, born in Puerto Rico or U.S. Island Areas');
INSERT INTO acs.col_names VALUES ('b05001', 'b05001_3', 'U.S. citizen, born abroad of American parent(s)');
INSERT INTO acs.col_names VALUES ('b05001', 'b05001_4', 'U.S. citizen by naturalization');
INSERT INTO acs.col_names VALUES ('b05001', 'b05001_5', 'Not a U.S. citizen');


--
-- Data table: Tenure
--
CREATE TABLE IF NOT EXISTS acs.b25003 (
    year smallint,
    year_est smallint,
    sumlevel varchar(16),
    geoid varchar(32),
    b25003_0 decimal(15),
    b25003_0_moe decimal(15),
    b25003_1 decimal(15),
    b25003_1_moe decimal(15),
    b25003_2 decimal(15),
    b25003_2_moe decimal(15),
    PRIMARY KEY (year, year_est, geoid, sumlevel)
);
--
-- Add metadata for tenure column names
--
INSERT INTO acs.col_names VALUES ('b25003', 'b25003_0', 'Total');
INSERT INTO acs.col_names VALUES ('b25003', 'b25003_1', 'U.S. citizen, born in the United States');
INSERT INTO acs.col_names VALUES ('b25003', 'b25003_2', 'U.S. citizen, born in Puerto Rico or U.S. Island Areas');


--
-- Data table: Vehicles Available
--
CREATE TABLE IF NOT EXISTS acs.b08201 (
    year smallint,
    year_est smallint,
    sumlevel varchar(16),
    geoid varchar(32),
    b08201_0 decimal(15),
    b08201_0_moe decimal(15),
    b08201_1 decimal(15),
    b08201_1_moe decimal(15),
    b08201_2 decimal(15),
    b08201_2_moe decimal(15),
    b08201_3 decimal(15),
    b08201_3_moe decimal(15),
    b08201_4 decimal(15),
    b08201_4_moe decimal(15),
    b08201_5 decimal(15),
    b08201_5_moe decimal(15),
    PRIMARY KEY (year, year_est, geoid, sumlevel)
);
--
-- Add metadata for vehicles available column names
--
INSERT INTO acs.col_names VALUES ('b08201', 'b08201_0', 'Total');
INSERT INTO acs.col_names VALUES ('b08201', 'b08201_1', 'No vehicle available');
INSERT INTO acs.col_names VALUES ('b08201', 'b08201_2', '1 vehicle available');
INSERT INTO acs.col_names VALUES ('b08201', 'b08201_3', '2 vehicles available');
INSERT INTO acs.col_names VALUES ('b08201', 'b08201_4', '3 vehicles available');
INSERT INTO acs.col_names VALUES ('b08201', 'b08201_5', '4 or more vehicles available');


--
-- Data table: Means of Transportation
--
CREATE TABLE IF NOT EXISTS acs.b08141 (
    year smallint,
    year_est smallint,
    sumlevel varchar(16),
    geoid varchar(32),
    b08141_0 decimal(15),
    b08141_0_moe decimal(15),
    b08141_1 decimal(15),
    b08141_1_moe decimal(15),
    b08141_2 decimal(15),
    b08141_2_moe decimal(15),
    b08141_3 decimal(15),
    b08141_3_moe decimal(15),
    b08141_4 decimal(15),
    b08141_4_moe decimal(15),
    b08141_5 decimal(15),
    b08141_5_moe decimal(15),
    b08141_6 decimal(15),
    b08141_6_moe decimal(15),
    PRIMARY KEY (year, year_est, geoid, sumlevel)
);
--
-- Add metadata for means of transportation column names
--
INSERT INTO acs.col_names VALUES ('b08141', 'b08141_0', 'Total');
INSERT INTO acs.col_names VALUES ('b08141', 'b08141_1', 'Car, truck, or van - drove alone');
INSERT INTO acs.col_names VALUES ('b08141', 'b08141_2', 'Car, truck, or van - carpooled');
INSERT INTO acs.col_names VALUES ('b08141', 'b08141_3', 'Public transportation (excluding taxicab)');
INSERT INTO acs.col_names VALUES ('b08141', 'b08141_4', 'Walked');
INSERT INTO acs.col_names VALUES ('b08141', 'b08141_5', 'Taxicab, motorcycle, bicycle, or other means');
INSERT INTO acs.col_names VALUES ('b08141', 'b08141_6', 'Worked at home');


--
-- Data table: Poverty
--
CREATE TABLE IF NOT EXISTS acs.b17001 (
    year smallint,
    year_est smallint,
    sumlevel varchar(16),
    geoid varchar(32),
    b17001_0 decimal(15),
    b17001_0_moe decimal(15),
    b17001_1 decimal(15),
    b17001_1_moe decimal(15),
    b17001_2 decimal(15),
    b17001_2_moe decimal(15),
    PRIMARY KEY (year, year_est, geoid, sumlevel)
);
--
-- Add metadata for poverty column names
--
INSERT INTO acs.col_names VALUES ('b17001', 'b17001_0', 'Total');
INSERT INTO acs.col_names VALUES ('b17001', 'b17001_1', 'Income in the past 12 months below poverty level');
INSERT INTO acs.col_names VALUES ('b17001', 'b17001_2', 'Income in the past 12 months at or above poverty level');


--
-- Data table: Veteren Status
--
CREATE TABLE IF NOT EXISTS acs.b21002 (
    year smallint,
    year_est smallint,
    sumlevel varchar(16),
    geoid varchar(32),
    b21002_0 decimal(15),
    b21002_0_moe decimal(15),
    b21002_1 decimal(15),
    b21002_1_moe decimal(15),
    b21002_2 decimal(15),
    b21002_2_moe decimal(15),
    b21002_3 decimal(15),
    b21002_3_moe decimal(15),
    b21002_4 decimal(15),
    b21002_4_moe decimal(15),
    b21002_5 decimal(15),
    b21002_5_moe decimal(15),
    b21002_6 decimal(15),
    b21002_6_moe decimal(15),
    b21002_7 decimal(15),
    b21002_7_moe decimal(15),
    b21002_8 decimal(15),
    b21002_8_moe decimal(15),
    b21002_9 decimal(15),
    b21002_9_moe decimal(15),
    b21002_10 decimal(15),
    b21002_10_moe decimal(15),
    b21002_11 decimal(15),
    b21002_11_moe decimal(15),
    b21002_12 decimal(15),
    b21002_12_moe decimal(15),
    b21002_13 decimal(15),
    b21002_13_moe decimal(15),
    b21002_14 decimal(15),
    b21002_14_moe decimal(15),
    b21002_15 decimal(15),
    b21002_15_moe decimal(15),
    PRIMARY KEY (year, year_est, geoid, sumlevel)
);
--
-- Add metadata for veteren column names
--
INSERT INTO acs.col_names VALUES ('b21002', 'b21002_0', 'Total');
INSERT INTO acs.col_names VALUES ('b21002', 'b21002_1', 'Gulf War (9/2001 or later), no Gulf War (8/1990 to 8/2001), no Vietnam Era');
INSERT INTO acs.col_names VALUES ('b21002', 'b21002_2', 'Gulf War (9/2001 or later) and Gulf War (8/1990 to 8/2001), no Vietnam Era');
INSERT INTO acs.col_names VALUES ('b21002', 'b21002_3', 'Gulf War (9/2001 or later), and Gulf War (8/1990 to 8/2001), and Vietnam Era');
INSERT INTO acs.col_names VALUES ('b21002', 'b21002_4', 'Gulf War (8/1990 to 8/2001), no Vietnam Era');
INSERT INTO acs.col_names VALUES ('b21002', 'b21002_5', 'Gulf War (8/1990 to 8/2001) and Vietnam Era');
INSERT INTO acs.col_names VALUES ('b21002', 'b21002_6', 'Vietnam Era, no Korean War, no World War II');
INSERT INTO acs.col_names VALUES ('b21002', 'b21002_7', 'Vietnam Era and Korean War, no World War II');
INSERT INTO acs.col_names VALUES ('b21002', 'b21002_8', 'Vietnam Era and Korean War and World War II');
INSERT INTO acs.col_names VALUES ('b21002', 'b21002_9', 'Korean War, no Vietnam Era, no World War II');
INSERT INTO acs.col_names VALUES ('b21002', 'b21002_10', 'Korean War and World War II, no Vietnam Era');
INSERT INTO acs.col_names VALUES ('b21002', 'b21002_11', 'World War II, no Korean War, no Vietnam Era');
INSERT INTO acs.col_names VALUES ('b21002', 'b21002_12', 'Between Gulf War and Vietnam Era only');
INSERT INTO acs.col_names VALUES ('b21002', 'b21002_13', 'Between Vietnam Era and Korean War only');
INSERT INTO acs.col_names VALUES ('b21002', 'b21002_14', 'Between Korean War and World War II only');
INSERT INTO acs.col_names VALUES ('b21002', 'b21002_15', 'Pre-World War II only');


--
-- Data table: Language Spoken at Home
--
CREATE TABLE IF NOT EXISTS acs.b16001 (
    year smallint,
    year_est smallint,
    sumlevel varchar(16),
    geoid varchar(32),
    b16001_0 decimal(15),
    b16001_0_moe decimal(15),
    b16001_1 decimal(15),
    b16001_1_moe decimal(15),
    b16001_2 decimal(15),
    b16001_2_moe decimal(15),
    b16001_3 decimal(15),
    b16001_3_moe decimal(15),
    b16001_4 decimal(15),
    b16001_4_moe decimal(15),
    b16001_5 decimal(15),
    b16001_5_moe decimal(15),
    b16001_6 decimal(15),
    b16001_6_moe decimal(15),
    b16001_7 decimal(15),
    b16001_7_moe decimal(15),
    b16001_8 decimal(15),
    b16001_8_moe decimal(15),
    b16001_9 decimal(15),
    b16001_9_moe decimal(15),
    b16001_10 decimal(15),
    b16001_10_moe decimal(15),
    b16001_11 decimal(15),
    b16001_11_moe decimal(15),
    b16001_12 decimal(15),
    b16001_12_moe decimal(15),
    b16001_13 decimal(15),
    b16001_13_moe decimal(15),
    b16001_14 decimal(15),
    b16001_14_moe decimal(15),
    b16001_15 decimal(15),
    b16001_15_moe decimal(15),
    b16001_16 decimal(15),
    b16001_16_moe decimal(15),
    b16001_17 decimal(15),
    b16001_17_moe decimal(15),
    b16001_18 decimal(15),
    b16001_18_moe decimal(15),
    b16001_19 decimal(15),
    b16001_19_moe decimal(15),
    b16001_20 decimal(15),
    b16001_20_moe decimal(15),
    b16001_21 decimal(15),
    b16001_21_moe decimal(15),
    b16001_22 decimal(15),
    b16001_22_moe decimal(15),
    b16001_23 decimal(15),
    b16001_23_moe decimal(15),
    b16001_24 decimal(15),
    b16001_24_moe decimal(15),
    b16001_25 decimal(15),
    b16001_25_moe decimal(15),
    b16001_26 decimal(15),
    b16001_26_moe decimal(15),
    b16001_27 decimal(15),
    b16001_27_moe decimal(15),
    b16001_28 decimal(15),
    b16001_28_moe decimal(15),
    b16001_29 decimal(15),
    b16001_29_moe decimal(15),
    b16001_30 decimal(15),
    b16001_30_moe decimal(15),
    b16001_31 decimal(15),
    b16001_31_moe decimal(15),
    b16001_32 decimal(15),
    b16001_32_moe decimal(15),
    b16001_33 decimal(15),
    b16001_33_moe decimal(15),
    b16001_34 decimal(15),
    b16001_34_moe decimal(15),
    b16001_35 decimal(15),
    b16001_35_moe decimal(15),
    b16001_36 decimal(15),
    b16001_36_moe decimal(15),
    b16001_37 decimal(15),
    b16001_37_moe decimal(15),
    b16001_38 decimal(15),
    b16001_38_moe decimal(15),
    b16001_39 decimal(15),
    b16001_39_moe decimal(15),
    b16001_40 decimal(15),
    b16001_40_moe decimal(15),
    PRIMARY KEY (year, year_est, geoid, sumlevel)
);
--
-- Add metadata for language spoken at home column names
--
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_0',  'Total');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_1',  'Speak only English');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_2',  'Spanish or Spanish Creole');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_3',  'French (incl. Patois, Cajun)');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_4',  'French Creole');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_5',  'Italian');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_6',  'Portuguese or Portuguese Creole');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_7',  'German');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_8',  'Yiddish');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_9',  'Other West Germanic languages');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_10', 'Scandinavian languages');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_11', 'Greek');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_12', 'Russian');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_13', 'Polish');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_14', 'Serbo-Croatian');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_15', 'Other Slavic languages');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_16', 'Armenian');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_17', 'Persian');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_18', 'Gujarati');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_19', 'Hindi');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_20', 'Urdu');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_21', 'Other Indic languages');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_22', 'Other Indo-European languages');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_23', 'Chinese');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_24', 'Japanese');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_25', 'Korean');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_26', 'Mon-Khmer, Cambodian');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_27', 'Hmong');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_28', 'Thai');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_29', 'Laotian');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_30', 'Vietnamese');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_31', 'Other Asian languages');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_32', 'Tagalog');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_33', 'Other Pacific Island languages');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_34', 'Navajo');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_35', 'Other Native North American languages');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_36', 'Hungarian');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_37', 'Arabic');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_38', 'Hebrew');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_39', 'African languages');
INSERT INTO acs.col_names VALUES ('b16001', 'b16001_40', 'Other and unspecified languages');





--
-- Data table: Place of Birth
--
CREATE TABLE IF NOT EXISTS acs.b05006 (
    year smallint,
    year_est smallint,
    sumlevel varchar(16),
    geoid varchar(32),
    b05006_0 decimal(15),
    b05006_0_moe decimal(15),
    b05006_1 decimal(15),
    b05006_1_moe decimal(15),
    b05006_2 decimal(15),
    b05006_2_moe decimal(15),
    b05006_3 decimal(15),
    b05006_3_moe decimal(15),
    b05006_4 decimal(15),
    b05006_4_moe decimal(15),
    b05006_5 decimal(15),
    b05006_5_moe decimal(15),
    b05006_6 decimal(15),
    b05006_6_moe decimal(15),
    b05006_7 decimal(15),
    b05006_7_moe decimal(15),
    b05006_8 decimal(15),
    b05006_8_moe decimal(15),
    b05006_9 decimal(15),
    b05006_9_moe decimal(15),
    b05006_10 decimal(15),
    b05006_10_moe decimal(15),
    b05006_11 decimal(15),
    b05006_11_moe decimal(15),
    b05006_12 decimal(15),
    b05006_12_moe decimal(15),
    b05006_13 decimal(15),
    b05006_13_moe decimal(15),
    b05006_14 decimal(15),
    b05006_14_moe decimal(15),
    b05006_15 decimal(15),
    b05006_15_moe decimal(15),
    b05006_16 decimal(15),
    b05006_16_moe decimal(15),
    b05006_17 decimal(15),
    b05006_17_moe decimal(15),
    b05006_18 decimal(15),
    b05006_18_moe decimal(15),
    b05006_19 decimal(15),
    b05006_19_moe decimal(15),
    b05006_20 decimal(15),
    b05006_20_moe decimal(15),
    b05006_21 decimal(15),
    b05006_21_moe decimal(15),
    b05006_22 decimal(15),
    b05006_22_moe decimal(15),
    b05006_23 decimal(15),
    b05006_23_moe decimal(15),
    b05006_24 decimal(15),
    b05006_24_moe decimal(15),
    b05006_25 decimal(15),
    b05006_25_moe decimal(15),
    b05006_26 decimal(15),
    b05006_26_moe decimal(15),
    b05006_27 decimal(15),
    b05006_27_moe decimal(15),
    b05006_28 decimal(15),
    b05006_28_moe decimal(15),
    b05006_29 decimal(15),
    b05006_29_moe decimal(15),
    b05006_30 decimal(15),
    b05006_30_moe decimal(15),
    b05006_31 decimal(15),
    b05006_31_moe decimal(15),
    b05006_32 decimal(15),
    b05006_32_moe decimal(15),
    b05006_33 decimal(15),
    b05006_33_moe decimal(15),
    b05006_34 decimal(15),
    b05006_34_moe decimal(15),
    b05006_35 decimal(15),
    b05006_35_moe decimal(15),
    b05006_36 decimal(15),
    b05006_36_moe decimal(15),
    b05006_37 decimal(15),
    b05006_37_moe decimal(15),
    b05006_38 decimal(15),
    b05006_38_moe decimal(15),
    b05006_39 decimal(15),
    b05006_39_moe decimal(15),
    b05006_40 decimal(15),
    b05006_40_moe decimal(15),
    b05006_41 decimal(15),
    b05006_41_moe decimal(15),
    b05006_42 decimal(15),
    b05006_42_moe decimal(15),
    b05006_43 decimal(15),
    b05006_43_moe decimal(15),
    b05006_44 decimal(15),
    b05006_44_moe decimal(15),
    b05006_45 decimal(15),
    b05006_45_moe decimal(15),
    b05006_46 decimal(15),
    b05006_46_moe decimal(15),
    b05006_47 decimal(15),
    b05006_47_moe decimal(15),
    b05006_48 decimal(15),
    b05006_48_moe decimal(15),
    b05006_49 decimal(15),
    b05006_49_moe decimal(15),
    b05006_50 decimal(15),
    b05006_50_moe decimal(15),
    b05006_51 decimal(15),
    b05006_51_moe decimal(15),
    b05006_52 decimal(15),
    b05006_52_moe decimal(15),
    b05006_53 decimal(15),
    b05006_53_moe decimal(15),
    b05006_54 decimal(15),
    b05006_54_moe decimal(15),
    b05006_55 decimal(15),
    b05006_55_moe decimal(15),
    b05006_56 decimal(15),
    b05006_56_moe decimal(15),
    b05006_57 decimal(15),
    b05006_57_moe decimal(15),
    b05006_58 decimal(15),
    b05006_58_moe decimal(15),
    b05006_59 decimal(15),
    b05006_59_moe decimal(15),
    b05006_60 decimal(15),
    b05006_60_moe decimal(15),
    b05006_61 decimal(15),
    b05006_61_moe decimal(15),
    b05006_62 decimal(15),
    b05006_62_moe decimal(15),
    b05006_63 decimal(15),
    b05006_63_moe decimal(15),
    b05006_64 decimal(15),
    b05006_64_moe decimal(15),
    b05006_65 decimal(15),
    b05006_65_moe decimal(15),
    b05006_66 decimal(15),
    b05006_66_moe decimal(15),
    b05006_67 decimal(15),
    b05006_67_moe decimal(15),
    b05006_68 decimal(15),
    b05006_68_moe decimal(15),
    b05006_69 decimal(15),
    b05006_69_moe decimal(15),
    b05006_70 decimal(15),
    b05006_70_moe decimal(15),
    b05006_71 decimal(15),
    b05006_71_moe decimal(15),
    b05006_72 decimal(15),
    b05006_72_moe decimal(15),
    b05006_73 decimal(15),
    b05006_73_moe decimal(15),
    b05006_74 decimal(15),
    b05006_74_moe decimal(15),
    b05006_75 decimal(15),
    b05006_75_moe decimal(15),
    b05006_76 decimal(15),
    b05006_76_moe decimal(15),
    b05006_77 decimal(15),
    b05006_77_moe decimal(15),
    b05006_78 decimal(15),
    b05006_78_moe decimal(15),
    b05006_79 decimal(15),
    b05006_79_moe decimal(15),
    b05006_80 decimal(15),
    b05006_80_moe decimal(15),
    b05006_81 decimal(15),
    b05006_81_moe decimal(15),
    b05006_82 decimal(15),
    b05006_82_moe decimal(15),
    b05006_83 decimal(15),
    b05006_83_moe decimal(15),
    b05006_84 decimal(15),
    b05006_84_moe decimal(15),
    b05006_85 decimal(15),
    b05006_85_moe decimal(15),
    b05006_86 decimal(15),
    b05006_86_moe decimal(15),
    b05006_87 decimal(15),
    b05006_87_moe decimal(15),
    b05006_88 decimal(15),
    b05006_88_moe decimal(15),
    b05006_89 decimal(15),
    b05006_89_moe decimal(15),
    b05006_90 decimal(15),
    b05006_90_moe decimal(15),
    b05006_91 decimal(15),
    b05006_91_moe decimal(15),
    b05006_92 decimal(15),
    b05006_92_moe decimal(15),
    b05006_93 decimal(15),
    b05006_93_moe decimal(15),
    b05006_94 decimal(15),
    b05006_94_moe decimal(15),
    b05006_95 decimal(15),
    b05006_95_moe decimal(15),
    b05006_96 decimal(15),
    b05006_96_moe decimal(15),
    b05006_97 decimal(15),
    b05006_97_moe decimal(15),
    b05006_98 decimal(15),
    b05006_98_moe decimal(15),
    b05006_99 decimal(15),
    b05006_99_moe decimal(15),
    b05006_100 decimal(15),
    b05006_100_moe decimal(15),
    b05006_101 decimal(15),
    b05006_101_moe decimal(15),
    b05006_102 decimal(15),
    b05006_102_moe decimal(15),
    b05006_103 decimal(15),
    b05006_103_moe decimal(15),
    b05006_104 decimal(15),
    b05006_104_moe decimal(15),
    b05006_105 decimal(15),
    b05006_105_moe decimal(15),
    b05006_106 decimal(15),
    b05006_106_moe decimal(15),
    b05006_107 decimal(15),
    b05006_107_moe decimal(15),
    b05006_108 decimal(15),
    b05006_108_moe decimal(15),
    b05006_109 decimal(15),
    b05006_109_moe decimal(15),
    b05006_110 decimal(15),
    b05006_110_moe decimal(15),
    b05006_111 decimal(15),
    b05006_111_moe decimal(15),
    b05006_112 decimal(15),
    b05006_112_moe decimal(15),
    b05006_113 decimal(15),
    b05006_113_moe decimal(15),
    b05006_114 decimal(15),
    b05006_114_moe decimal(15),
    b05006_115 decimal(15),
    b05006_115_moe decimal(15),
    b05006_116 decimal(15),
    b05006_116_moe decimal(15),
    b05006_117 decimal(15),
    b05006_117_moe decimal(15),
    b05006_118 decimal(15),
    b05006_118_moe decimal(15),
    b05006_119 decimal(15),
    b05006_119_moe decimal(15),
    b05006_120 decimal(15),
    b05006_120_moe decimal(15),
    b05006_121 decimal(15),
    b05006_121_moe decimal(15),
    b05006_122 decimal(15),
    b05006_122_moe decimal(15),
    b05006_123 decimal(15),
    b05006_123_moe decimal(15),
    b05006_124 decimal(15),
    b05006_124_moe decimal(15),
    b05006_125 decimal(15),
    b05006_125_moe decimal(15),
    b05006_126 decimal(15),
    b05006_126_moe decimal(15),
    b05006_127 decimal(15),
    b05006_127_moe decimal(15),
    b05006_128 decimal(15),
    b05006_128_moe decimal(15),
    b05006_129 decimal(15),
    b05006_129_moe decimal(15),
    b05006_130 decimal(15),
    b05006_130_moe decimal(15),
    b05006_131 decimal(15),
    b05006_131_moe decimal(15),
    b05006_132 decimal(15),
    b05006_132_moe decimal(15),
    b05006_133 decimal(15),
    b05006_133_moe decimal(15),
    b05006_134 decimal(15),
    b05006_134_moe decimal(15),
    b05006_135 decimal(15),
    b05006_135_moe decimal(15),
    b05006_136 decimal(15),
    b05006_136_moe decimal(15),
    b05006_137 decimal(15),
    b05006_137_moe decimal(15),
    b05006_138 decimal(15),
    b05006_138_moe decimal(15),
    b05006_139 decimal(15),
    b05006_139_moe decimal(15),
    b05006_140 decimal(15),
    b05006_140_moe decimal(15),
    b05006_141 decimal(15),
    b05006_141_moe decimal(15),
    b05006_142 decimal(15),
    b05006_142_moe decimal(15),
    b05006_143 decimal(15),
    b05006_143_moe decimal(15),
    b05006_144 decimal(15),
    b05006_144_moe decimal(15),
    b05006_145 decimal(15),
    b05006_145_moe decimal(15),
    b05006_146 decimal(15),
    b05006_146_moe decimal(15),
    b05006_147 decimal(15),
    b05006_147_moe decimal(15),
    b05006_148 decimal(15),
    b05006_148_moe decimal(15),
    b05006_149 decimal(15),
    b05006_149_moe decimal(15),
    b05006_150 decimal(15),
    b05006_150_moe decimal(15),
    b05006_151 decimal(15),
    b05006_151_moe decimal(15),
    b05006_152 decimal(15),
    b05006_152_moe decimal(15),
    b05006_153 decimal(15),
    b05006_153_moe decimal(15),
    b05006_154 decimal(15),
    b05006_154_moe decimal(15),
    b05006_155 decimal(15),
    b05006_155_moe decimal(15),
    b05006_156 decimal(15),
    b05006_156_moe decimal(15),
    b05006_157 decimal(15),
    b05006_157_moe decimal(15),
    b05006_158 decimal(15),
    b05006_158_moe decimal(15),
    b05006_159 decimal(15),
    b05006_159_moe decimal(15),
    b05006_160 decimal(15),
    b05006_160_moe decimal(15),
    PRIMARY KEY (year, year_est, geoid, sumlevel)
);
--
-- Add metadata for place of birth column names
--
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_0',  'Total');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_1',  'Europe');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_2',  'Northern Europe');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_3',  'United Kingdom (inc. Crown Dependencies)');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_4',  'United Kingdom, excluding England and Scotland');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_5',  'England');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_6',  'Scotland');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_7',  'Ireland');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_8',  'Denmark');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_9',  'Norway');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_10', 'Sweden');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_11', 'Other Northern Europe');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_12', 'Western Europe');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_13', 'Austria');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_14', 'Belgium');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_15', 'France');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_16', 'Germany');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_17', 'Netherlands');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_18', 'Switzerland');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_19', 'Other Western Europe');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_20', 'Southern Europe');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_21', 'Greece');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_22', 'Italy');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_23', 'Portugal');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_24', 'Spain');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_25', 'Other Southern Europe');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_26', 'Eastern Europe');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_27', 'Albania');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_28', 'Belarus');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_29', 'Bulgaria');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_30', 'Croatia');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_31', 'Czechoslovakia (includes Czech Republic and Slovakia)');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_32', 'Hungary');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_33', 'Latvia');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_34', 'Lithuania');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_35', 'Macedonia');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_36', 'Moldova');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_37', 'Poland');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_38', 'Romania');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_39', 'Russia');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_40', 'Ukraine');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_41', 'Bosnia and Herzegovina');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_42', 'Yugoslavia');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_43', 'Serbia');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_44', 'Other Eastern Europe');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_45', 'Europe, n.e.c.');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_46', 'Asia');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_47', 'Eastern Asia');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_48', 'China');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_49', 'China, excluding Hong Kong and Taiwan');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_50', 'Hong Kong');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_51', 'Taiwan');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_52', 'Japan');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_53', 'Korea');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_54', 'Other Eastern Asia');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_55', 'South Central Asia');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_56', 'Afghanistan');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_57', 'Bangladesh');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_58', 'India');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_59', 'Iran');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_60', 'Kazakhstan');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_61', 'Nepal');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_62', 'Pakistan');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_63', 'Sri Lanka');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_64', 'Uzbekistan');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_65', 'Other South Central Asia');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_66', 'South Eastern Asia');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_67', 'Cambodia');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_68', 'Indonesia');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_69', 'Laos');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_70', 'Malaysia');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_71', 'Burma');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_72', 'Philippines');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_73', 'Singapore');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_74', 'Thailand');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_75', 'Vietnam');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_76', 'Other South Eastern Asia');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_77', 'Western Asia');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_78', 'Iraq');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_79', 'Israel');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_80', 'Jordan');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_81', 'Kuwait');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_82', 'Lebanon');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_83', 'Saudi Arabia');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_84', 'Syria');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_85', 'Yemen');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_86', 'Turkey');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_87', 'Armenia');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_88', 'Other Western Asia');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_89', 'Asia,n.e.c.');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_90', 'Africa');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_91', 'Eastern Africa');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_92', 'Eritrea');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_93', 'Ethiopia');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_94', 'Kenya');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_95', 'Other Eastern Africa');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_96', 'Middle Africa');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_97', 'Cameroon');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_98', 'Other Middle Africa');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_99', 'Northern Africa');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_100','Egypt');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_101','Morocco');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_102','Sudan');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_103','Other Northern Africa');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_104','Southern Africa');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_105','South Africa');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_106','Other Southern Africa');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_107','Western Africa');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_108','Cape Verde');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_109','Ghana');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_110','Liberia');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_111','Nigeria');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_112','Sierra Leone');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_113','Other Western Africa');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_114','Africa, n.e.c.');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_115','Oceania');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_116','Australia and New Zealand Subregion');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_117','Australia');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_118','Other Australian and New Zealand Subregion');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_119','Fiji');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_120','Oceania, n.e.c.');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_121','Americas');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_122','Latin America');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_123','Caribbean');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_124','Bahamas');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_125','Barbados');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_126','Cuba');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_127','Dominica');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_128','Dominican Republic');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_129','Grenada');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_130','Haiti');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_131','Jamaica');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_132','St. Vincent and the Grenadines');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_133','Trinidad and Tobago');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_134','West Indies');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_135','Other Caribbean');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_136','Central America');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_137','Mexico');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_138','Belize');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_139','Costa Rica');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_140','El Salvador');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_141','Guatemala');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_142','Honduras');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_143','Nicaragua');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_144','Panama');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_145','Other Central America');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_146','South America');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_147','Argentina');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_148','Bolivia');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_149','Brazil');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_150','Chile');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_151','Colombia');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_152','Ecuador');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_153','Guyana');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_154','Peru');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_155','Uruguay');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_156','Venezuela');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_157','Other South America');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_158','Northern America');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_159','Canada');
INSERT INTO acs.col_names VALUES ('b05006', 'b05006_160','Other Northern America');

--
-- Data table: Income Per Capita
--
CREATE TABLE IF NOT EXISTS acs.b19301 (
    year smallint,
    year_est smallint,
    sumlevel varchar(16),
    geoid varchar(32),
    b19301_0 decimal(15),
    b19301_0_moe decimal(15),
    PRIMARY KEY (year, year_est, geoid, sumlevel)
);
--
-- Add metadata for income per capita column names
--
INSERT INTO acs.col_names VALUES ('b19301', 'b19301_0', 'Per capita income in the past 12 months (in 2013 inflation-adjusted dollars)');


--
-- Data table: Household Income
--
CREATE TABLE IF NOT EXISTS acs.b19001 (
    year smallint,
    year_est smallint,
    sumlevel varchar(16),
    geoid varchar(32),
    b19001_0 decimal(15),
    b19001_0_moe decimal(15),
    b19001_1 decimal(15),
    b19001_1_moe decimal(15),
    b19001_2 decimal(15),
    b19001_2_moe decimal(15),
    b19001_3 decimal(15),
    b19001_3_moe decimal(15),
    b19001_4 decimal(15),
    b19001_4_moe decimal(15),
    b19001_5 decimal(15),
    b19001_5_moe decimal(15),
    b19001_6 decimal(15),
    b19001_6_moe decimal(15),
    b19001_7 decimal(15),
    b19001_7_moe decimal(15),
    b19001_8 decimal(15),
    b19001_8_moe decimal(15),
    b19001_9 decimal(15),
    b19001_9_moe decimal(15),
    b19001_10 decimal(15),
    b19001_10_moe decimal(15),
    b19001_11 decimal(15),
    b19001_11_moe decimal(15),
    b19001_12 decimal(15),
    b19001_12_moe decimal(15),
    b19001_13 decimal(15),
    b19001_13_moe decimal(15),
    b19001_14 decimal(15),
    b19001_14_moe decimal(15),
    b19001_15 decimal(15),
    b19001_15_moe decimal(15),
    b19001_16 decimal(15),
    b19001_16_moe decimal(15),
    PRIMARY KEY (year, year_est, geoid, sumlevel)
);
--
-- Add metadata for household income column names
--
INSERT INTO acs.col_names VALUES ('b19001', 'b19001_0',  'Total');
INSERT INTO acs.col_names VALUES ('b19001', 'b19001_1',  'Less than $10,000');
INSERT INTO acs.col_names VALUES ('b19001', 'b19001_2',  '$10,000 to $14,999');
INSERT INTO acs.col_names VALUES ('b19001', 'b19001_3',  '$15,000 to $19,999');
INSERT INTO acs.col_names VALUES ('b19001', 'b19001_4',  '$20,000 to $24,999');
INSERT INTO acs.col_names VALUES ('b19001', 'b19001_5',  '$25,000 to $29,999');
INSERT INTO acs.col_names VALUES ('b19001', 'b19001_6',  '$30,000 to $34,999');
INSERT INTO acs.col_names VALUES ('b19001', 'b19001_7',  '$35,000 to $39,999');
INSERT INTO acs.col_names VALUES ('b19001', 'b19001_8',  '$40,000 to $44,999');
INSERT INTO acs.col_names VALUES ('b19001', 'b19001_9',  '$45,000 to $49,999');
INSERT INTO acs.col_names VALUES ('b19001', 'b19001_10', '$50,000 to $59,999');
INSERT INTO acs.col_names VALUES ('b19001', 'b19001_11', '$60,000 to $74,999');
INSERT INTO acs.col_names VALUES ('b19001', 'b19001_12', '$75,000 to $99,999');
INSERT INTO acs.col_names VALUES ('b19001', 'b19001_13', '$100,000 to $124,999');
INSERT INTO acs.col_names VALUES ('b19001', 'b19001_14', '$125,000 to $149,999');
INSERT INTO acs.col_names VALUES ('b19001', 'b19001_15', '$150,000 to $199,999');
INSERT INTO acs.col_names VALUES ('b19001', 'b19001_16', '$200,000 or more');
