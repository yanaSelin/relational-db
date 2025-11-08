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
    "name"     varchar  NOT NULL,
    "year"     integer NOT NULL CHECK (year > 0 AND year < 3000),
    "duration" interval NOT NULL CHECK (duration >= interval '0')
);

CREATE TABLE IF NOT EXISTS "Showtime"
(
    "id"      serial PRIMARY KEY,
    "date"    date    NOT NULL,
    "time"    time    NOT NULL,
    "hall_id" integer NOT NULL REFERENCES "Hall" (id),
    "film_id" integer NOT NULL REFERENCES "Film" (id),
    -- Prevents identical start times in a Hall
    UNIQUE (date, time, hall_id)
);

CREATE TABLE IF NOT EXISTS "Seat"
(
    "id"          serial PRIMARY KEY,
    "seat_number" integer NOT NULL CHECK (seat_number > 0),
    "hall_id"     integer NOT NULL REFERENCES "Hall" (id),
    -- Prevent duplicated seats in Hall
    UNIQUE (seat_number, hall_id)
);

CREATE TABLE IF NOT EXISTS "Ticket"
(
    "id"          serial PRIMARY KEY,
    "price"       numeric(8, 2) NOT NULL CHECK (price >= 0),
    "seat_id"     integer       NOT NULL REFERENCES "Seat" (id),
    "showtime_id" integer       NOT NULL REFERENCES "Showtime" (id),
    -- Ensures exclusivity of seat allocation per showtime,
    -- guarding against double selling
    UNIQUE (seat_id, showtime_id)
);

CREATE TABLE IF NOT EXISTS "Visitor"
(
    "id"         serial PRIMARY KEY,
    "email"      varchar UNIQUE NOT NULL,
    "first_name" varchar,
    "last_name"  varchar
);

CREATE TABLE IF NOT EXISTS "Reservation"
(
    "id"         serial PRIMARY KEY,
    "created_at" timestamp DEFAULT (now()),
    -- Guarantees each ticket is associated with at most one reservation.
    "ticket_id"  integer UNIQUE NOT NULL REFERENCES "Ticket" (id),
    "visitor_id" integer        NOT NULL REFERENCES "Visitor" (id)
);

CREATE TABLE IF NOT EXISTS "Genre_Film"
(
    "genre_id" integer REFERENCES "Genre" ("id"),
    "film_id"  integer REFERENCES "Film" ("id"),
    PRIMARY KEY ("genre_id", "film_id")
);
