CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE users
(-- id uuid DEFAULT uuid_generate_v4() PRIMARY KEY,
 email VARCHAR(30) PRIMARY KEY,
 first_name VARCHAR(30),
 last_name VARCHAR(30),
 pass VARCHAR(300));

