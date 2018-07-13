
Drop DATABASE pride_fc;
CREATE DATABASE pride_fc;

\c pride_fc;


CREATE TABLE Events
(
    id SERIAL PRIMARY KEY,
    event_name VARCHAR NOT NULL,
    no_fights INT,
    date VARCHAR,
    venue VARCHAR,
    city VARCHAR,
    attendence INT
);
COPY Events
(event_name ,no_fights ,date ,venue ,city ,attendence) 
FROM '/Users/c4q/Documents/prideFCApi/db/Events.csv' DELIMITER ',' CSV HEADER;


CREATE TABLE Fights
(
    id SERIAL PRIMARY KEY,
    event_id INT,
    winner VARCHAR NOT NULL,
    loser INT,
    method VARCHAR,
    round VARCHAR,
    time INT,
    notes INT,
    FOREIGN KEY(event_id) REFERENCES Events(id)
);

CREATE TABLE Fighters
(
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    alias VARCHAR ,
    born VARCHAR,
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

CREATE TABLE Title_Holders
(
    Name VARCHAR NOT NULL,
    Division VARCHAR NOT NULL,
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