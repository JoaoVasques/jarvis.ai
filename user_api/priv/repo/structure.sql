--CREATE TYPE oauth_provider as ENUM ('twitter', 'facebook');

CREATE TABLE users (
  id UUID PRIMARY KEY,
  name VARCHAR(256),
  user_id VARCHAR(256),
  oauth_user_secret VARCHAR(256),
  oauth_token varchar(512)
);
