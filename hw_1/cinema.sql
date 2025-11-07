CREATE TABLE IF NOT EXISTS "Theater"
(
    "id"      serial PRIMARY KEY,
    "name"    varchar NOT NULL,
    "address" varchar NOT NULL
);

CREATE TABLE IF NOT EXISTS "Hall"
(
    "id"         serial PRIMARY KEY,
    "name"       varchar NOT NULL,
    "theater_id" integer NOT NULL REFERENCES "Theater" (id)
);

CREATE TABLE IF NOT EXISTS "Genre"
(
    "id"   serial PRIMARY KEY,
    "name" varchar NOT NULL
);

CREATE TABLE IF NOT EXISTS "Film"
(
    "id"       serial PRIMARY KEY,
    "name"     varchar NOT NULL,
    "genre_id" integer REFERENCES "Genre" (id)
);

CREATE TABLE IF NOT EXISTS "Showtime"
(
    "id"      serial PRIMARY KEY,
    "date"    date    NOT NULL,
    "time"    time    NOT NULL,
    "hall_id" integer NOT NULL REFERENCES "Hall" (id),
    "film_id" integer NOT NULL REFERENCES "Film" (id),
    UNIQUE (date, time, hall_id)
);

CREATE TABLE IF NOT EXISTS "Seat"
(
    "id"          serial PRIMARY KEY,
    "seat_number" integer NOT NULL CHECK (seat_number > 0),
    "hall_id"     integer NOT NULL REFERENCES "Hall" (id)
);

CREATE TABLE IF NOT EXISTS "Ticket"
(
    "id"          serial PRIMARY KEY,
    "price"       decimal NOT NULL CHECK (price >= 0),
    "seat_id"     integer NOT NULL REFERENCES "Seat" (id),
    "showtime_id" integer NOT NULL REFERENCES "Showtime" (id),
    UNIQUE (seat_id, showtime_id)
);

CREATE TABLE IF NOT EXISTS "Visitor"
(
    "id"         serial PRIMARY KEY,
    "first_name" varchar,
    "last_name"  varchar
);

CREATE TABLE IF NOT EXISTS "Reservation"
(
    "id"         serial PRIMARY KEY,
    "created_at" timestamp DEFAULT (now()),
    "ticket_id"  integer UNIQUE NOT NULL REFERENCES "Ticket" (id),
    "visitor_id" integer        NOT NULL REFERENCES "Visitor" (id)
);

CREATE TABLE IF NOT EXISTS "Genre_Film"
(
    "genre_id"      integer REFERENCES "Genre" ("id"),
    "film_genre_id" integer REFERENCES "Film" ("id"),
    PRIMARY KEY ("genre_id", "film_genre_id")
);
