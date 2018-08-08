
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

Drop TABLE Fighters;
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
    draw INT
);
COPY Fighters
(debut_year,name,alias,"from",fighting_out_of,height,weight,wins,loss,draw) 
FROM '/Users/c4q/Documents/prideFCApi/db/Fighters.csv' DELIMITER ',' CSV HEADER;


Drop TABLE Title_Holders;
CREATE TABLE Title_Holders
(
    name VARCHAR NOT NULL,
    division VARCHAR NOT NULL,
    event_title_won INT NOT NULL,
    event_title_loss INT,
    num_defenses INT,
    FOREIGN Key(event_title_won) REFERENCES Events(id),
    FOREIGN Key(event_title_loss) REFERENCES Events(id)
);
COPY Title_Holders
(name,division,event_title_won,event_title_loss,num_defenses) 
FROM '/Users/c4q/Documents/prideFCApi/db/TitleHolders.csv' DELIMITER ',' CSV HEADER;


Drop TABLE Tournaments;
CREATE TABLE Tournaments
(
    year INT,
    division VARCHAR NOT NULL,
    champion VARCHAR,
    runner_up VARCHAR,
    final_eventid INT,
    semis_eventid INT,
    quarter_eventid INT,
    opening_eventid INT,
    FOREIGN Key(final_eventid) REFERENCES Events(id),
    FOREIGN Key(semis_eventid) REFERENCES Events(id),
    FOREIGN Key(quarter_eventid) REFERENCES Events(id),
    FOREIGN Key(opening_eventid) REFERENCES Events(id)
);
COPY Tournaments 
(year,division,champion,runner_up,final_eventid,semis_eventid,quarter_eventid,opening_eventid) 
FROM '/Users/c4q/Documents/prideFCApi/db/Tournaments.csv' DELIMITER ',' CSV HEADER;
