CREATE TABLE IF NOT EXISTS "Department"
(
    "department_id"   serial PRIMARY KEY,
    "department_name" varchar(50),
    "specialization"  text,
    "parent_id"       integer REFERENCES "Department" ("department_id")
);

CREATE TABLE IF NOT EXISTS "Employee"
(
    "employee_id"   serial PRIMARY KEY,
    "first_name"    varchar(50) NOT NULL,
    "last_name"     varchar(50) NOT NULL,
    "birthday"      date,
    "salary"        decimal,
    "position"      text,
    "manager_id"    integer REFERENCES "Employee" ("employee_id"),
    "department_id" integer REFERENCES "Department" ("department_id")
);