CREATE SCHEMA IF NOT EXISTS attrs;
DROP TABLE IF EXISTS attrs.geo_names;
CREATE TABLE attrs.geo_names (
    full_geoid varchar(40) primary key,
    display_name varchar,
    simple_name varchar,
    prefix_match_name varchar,
    sumlevel varchar(3),
    geoid varchar,
    priority smallint,
    aland decimal(15),
    awater decimal(15)
);

-- STATES
INSERT INTO attrs.geo_names
    SELECT
        '04000US' || state.geoid,
        state.name,
        state.name,
        state.name,
        '040',
        state.geoid,
        10,
        state.aland,
        state.awater
    FROM tiger2012.state
    WHERE state.geoid NOT IN ('60', '66', '69', '78');
-- PLACES
INSERT INTO attrs.geo_names
    SELECT
        '16000US' || place.geoid,
        place.name || ', ' || state.stusps,
        place.name,
        place.name || ' ' || state.stusps,
        '160',
        place.geoid,
        20,
        place.aland,
        place.awater
    FROM tiger2012.place JOIN tiger2012.state USING (statefp)
    WHERE state.geoid NOT IN ('60', '66', '69', '78');
-- COUNTIES
INSERT INTO attrs.geo_names
    SELECT
        '05000US' || county.geoid,
        county.namelsad || ', ' || state.stusps,
        county.namelsad,
        county.namelsad || ' ' || state.stusps,
        '050',
        county.geoid,
        30,
        county.aland,
        county.awater
    FROM tiger2012.county JOIN tiger2012.state USING (statefp)
    WHERE state.geoid NOT IN ('60', '66', '69', '78');
-- ZIP CODES
INSERT INTO attrs.geo_names
    SELECT
        '86000US' || zcta5.geoid10,
        zcta5.zcta5ce10,
        zcta5.zcta5ce10,
        zcta5.zcta5ce10,
        '860',
        zcta5.geoid10,
        50,
        zcta5.aland10,
        zcta5.awater10
    FROM tiger2012.zcta5;
-- CBSA
INSERT INTO attrs.geo_names
    SELECT
        '31000US' || cbsa.geoid,
        cbsa.namelsad,
        cbsa.name,
        cbsa.name,
        '310',
        cbsa.geoid,
        60,
        cbsa.aland,
        cbsa.awater
    FROM tiger2012.cbsa;
-- PUMAS
INSERT INTO attrs.geo_names
    SELECT
        '79500US' || puma.geoid10,
        puma.namelsad10 || ', ' || state.stusps,
        puma.namelsad10,
        puma.namelsad10,
        '795',
        puma.geoid10,
        110,
        puma.aland10,
        puma.awater10
    FROM tiger2012.puma JOIN tiger2012.state ON (puma.statefp10=state.statefp)
    WHERE statefp NOT IN ('60', '66', '69', '78');
-- TRACTS
INSERT INTO attrs.geo_names
    SELECT
        '14000US' || tract.geoid,
        tract.namelsad || ', ' || county.name || ', ' || state.stusps,
        tract.namelsad,
        null,
        '140',
        tract.geoid,
        270,
        tract.aland,
        tract.awater
    FROM tiger2012.tract JOIN tiger2012.county USING (statefp, countyfp) JOIN tiger2012.state USING (statefp)
    WHERE statefp NOT IN ('60', '66', '69', '78');
-- NATION (USA)
INSERT INTO attrs.geo_names
    SELECT
        '01000US',
        'United States',
        'United States',
        'united states',
        '010',
        '',
        5,
        (SELECT SUM(aland) FROM tiger2012.state),
        (SELECT SUM(awater) FROM tiger2012.state);