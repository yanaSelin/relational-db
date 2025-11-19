-- 1. Create new tables
CREATE TABLE IF NOT EXISTS "Specialization"
(
    "specialization_id"   serial PRIMARY KEY,
    "specialization_name" varchar(50)
);

CREATE TABLE IF NOT EXISTS "Position"
(
    "position_id"   serial PRIMARY KEY,
    "position_name" varchar(50),
    "salary"        decimal
);

-- 2. Add new FK columns to Department and Employee
ALTER TABLE "Department"
    ADD COLUMN IF NOT EXISTS "specialization_id" integer references "Specialization" (specialization_id);
ALTER TABLE "Department"
    ADD COLUMN IF NOT EXISTS "manager_id" integer references "Employee" (employee_id);
ALTER TABLE "Employee"
    ADD COLUMN IF NOT EXISTS "position_id" integer references "Position" (position_id);

-- 3. Drop old columns & their constraints
ALTER TABLE "Employee"
    DROP COLUMN IF EXISTS "manager_id" CASCADE;
ALTER TABLE "Employee"
    DROP COLUMN IF EXISTS "position" CASCADE;
ALTER TABLE "Employee"
    DROP COLUMN IF EXISTS "salary" CASCADE;
ALTER TABLE "Department"
    DROP COLUMN IF EXISTS "specialization" CASCADE;
