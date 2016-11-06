--CREATE TYPE oauth_provider as ENUM ('twitter', 'facebook');

CREATE TABLE users (
  id UUID PRIMARY KEY,
  first_ keyname VARCHAR(256),
  last_name VARCHAR(256),
  oauth_token varchar(512)
);
