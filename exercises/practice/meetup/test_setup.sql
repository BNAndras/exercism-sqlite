-- Create database:
.read ./create_fixture.sql

-- Read user student solution and save any output as markdown in user_output.md:
.mode markdown
.output user_output.md
.read ./meetup.sql
.output

-- Create a clean testing environment:
DROP TABLE IF EXISTS tests;
CREATE TABLE IF NOT EXISTS tests (
    -- uuid and name are taken from the test.toml file
    uuid TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    -- The following section is needed by the online test-runner
    status TEXT DEFAULT 'fail',
    message TEXT,
    output TEXT,
    test_code TEXT,
    task_id INTEGER DEFAULT NULL,
    -- Here are columns for the actual tests
    year INT NOT NULL,
    month INT NOT NULL,
    week TEXT NOT NULL,
    dayofweek TEXT NOT NULL,
    expected TEXT NOT NULL
);
