-- Users Table

CREATE TABLE IF NOT EXISTS USERS(
    name varchar(100),
    email varchar(254) UNIQUE CONSTRAINT proper_email CHECK (email ~* '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$')
)
