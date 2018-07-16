
Drop TABLE pride_fc;
CREATE TABLE pride_fc;

\c pride_fc;

Drop TABLE Events, Fights CASCADE;
CREATE TABLE Events
(
    id SERIAL PRIMARY KEY,
    event_name VARCHAR NOT NULL,
    event_alias VARCHAR,
    no_bouts INT,
    date VARCHAR,
    venue VARCHAR,
    city VARCHAR,
    attendence INT
);
COPY Events
(event_name,event_alias,no_bouts,date ,venue ,city ,attendence) 
FROM '/Users/c4q/Documents/prideFCApi/db/Events.csv' DELIMITER ',' CSV HEADER;

Drop TABLE Fights;
CREATE TABLE Fights
(
    id SERIAL PRIMARY KEY,
    event_id INT,
    weight_class VARCHAR,
    fighter_1 VARCHAR NOT NULL,
    fighter_2 VARCHAR NOT NULL,
    winner VARCHAR,
    method VARCHAR NOT NULL,
    "round" INT,
    "time" VARCHAR,
    notes VARCHAR,
    FOREIGN KEY(event_id) REFERENCES Events(id)
);
COPY Fights
(event_id,weight_class,fighter_1,fighter_2,winner ,method ,"round" ,"time", notes) 
FROM '/Users/c4q/Documents/prideFCApi/db/Fights.csv' DELIMITER ',' CSV HEADER;


CREATE TABLE Fighters
(
    id SERIAL PRIMARY KEY,
    debut_year INT,
    name VARCHAR NOT NULL,
    alias VARCHAR ,
    "from" VARCHAR,
    fighting_out_of VARCHAR,
    height VARCHAR NOT NULL,
    weight VARCHAR NOT NULL,
    record INT,
    wins INT,
    loss INT,
    draw INT,
    wko INT,
    wsubmission INT,
    wdecision INT,
    lkO INT,
    lsubmission INT,
    ldecision INT,
    notes VARCHAR
);
-- COPY Fights
-- (debut_year,name,alias,"from",fighting_out_of,height ,weight ,record ,wins, loss,draw,wko,wsubmission,wdecision,
-- lkO,lsubmission,ldecision,notes) 
-- FROM '/Users/c4q/Documents/prideFCApi/db/Fighters.csv' DELIMITER ',' CSV HEADER;


CREATE TABLE Title_Holders
(
    name VARCHAR NOT NULL,
    division VARCHAR NOT NULL,
    date DATE,
    no_defenses INT

);

CREATE TABLE Tournaments
(
    event_id INT,
    division VARCHAR NOT NULL,
    winner VARCHAR,
    runner_up VARCHAR,
    FOREIGN Key(event_id) REFERENCES Events(id)
);