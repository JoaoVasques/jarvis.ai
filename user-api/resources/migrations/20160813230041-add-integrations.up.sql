CREATE TABLE integrations(
  id SERIAL PRIMARY KEY,
  name VARCHAR(30),
  system VARCHAR(30),
  user_id VARCHAR(30),
  active BOOLEAN,
  token VARCHAR(256)
);
