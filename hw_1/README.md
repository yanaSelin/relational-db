# Cinema Database Schema

## 1. Purpose

This schema models a simplified cinema management system: theaters, halls, films, genres, scheduled showtimes, seats, tickets, visitors, and reservations. The goal is to demonstrate sound relational design and constraint rationale in an academic context.

## 2. Design Philosophy

- Integrity first: rely on PRIMARY KEY, FOREIGN KEY, UNIQUE, and CHECK constraints for core correctness.
- Omitted SQL comments intentionally: all columns and constraints are created inline at table definition time; names are self‑descriptive and extra comments would be redundant here (for a larger production schema I would add domain explanations).
- Demonstrate several relationship types: one‑to‑many, optional attributes, uniqueness rules, and many‑to‑many via a bridge table.
- Prefer minimal, comprehensible structure that can be safely extended later.

## 3. Entity Overview (described verbally, no DDL code)

- Theater: A physical cinema location (name, address).
- Hall: A screening room belonging to a Theater (foreign key to Theater).
- Genre: A classification label (e.g., Comedy, Drama).
- Film: A film with a name,year and a positive duration (interval). Can have multiple genres (many‑to‑many through bridge table).
- Showtime: A scheduled start (date + time) of a Film in a Hall.
- Seat: A numbered seat within a Hall (positive seat_number enforced).
- Ticket: A purchasable right to occupy a specific Seat for a specific Showtime (with a non‑negative price).
- Visitor: A person identified by a unique email who may acquire tickets.
- Reservation: A record associating a Visitor with a Ticket (timestamped).
- Genre_Film: Bridge table implementing many‑to‑many between Film and Genre.
