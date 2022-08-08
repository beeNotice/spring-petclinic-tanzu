CREATE TABLE IF NOT EXISTS visits (
  id BIGINT NOT NULL,
  pet_id BIGINT NOT NULL,
  visit_date DATE,
  description VARCHAR(8192),
  PRIMARY KEY (id)
);

INSERT INTO visits VALUES (1, 7, '2021-03-05', 'rabies shot');
INSERT INTO visits VALUES (2, 8, '2022-03-04', 'rabies shot');
INSERT INTO visits VALUES (3, 8, '2022-06-04', 'neutered');
INSERT INTO visits VALUES (4, 7, '2022-09-04', 'spayed');