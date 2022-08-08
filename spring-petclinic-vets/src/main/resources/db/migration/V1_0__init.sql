CREATE TABLE IF NOT EXISTS vets (
  id BIGINT not null,
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS specialties (
  id BIGINT not null,
  name VARCHAR(80),
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS vet_specialties (
  vet_id BIGINT NOT NULL,
  specialty_id BIGINT NOT NULL,
  CONSTRAINT fk_vet_specialties_vet FOREIGN KEY (vet_id) REFERENCES vets(id),
  CONSTRAINT fk_vet_specialties_specialty FOREIGN KEY (specialty_id) REFERENCES specialties(id),
  CONSTRAINT unique_vet_specialty UNIQUE (vet_id, specialty_id)
);

CREATE INDEX idx_vet_lastname ON vets(last_name);
CREATE INDEX idx_specialty_name ON specialties(name);

INSERT INTO vets VALUES (1, 'James', 'Carter');
INSERT INTO vets VALUES (2, 'Helen', 'Leary');
INSERT INTO vets VALUES (3, 'Linda', 'Douglas');
INSERT INTO vets VALUES (4, 'Rafael', 'Ortega');
INSERT INTO vets VALUES (5, 'Henry', 'Stevens');
INSERT INTO vets VALUES (6, 'Sharon', 'Jenkins');

INSERT INTO specialties VALUES (1, 'radiology');
INSERT INTO specialties VALUES (2, 'surgery');
INSERT INTO specialties VALUES (3, 'dentistry');

INSERT INTO vet_specialties VALUES (2, 1);
INSERT INTO vet_specialties VALUES (3, 2);
INSERT INTO vet_specialties VALUES (3, 3);
INSERT INTO vet_specialties VALUES (4, 2);
INSERT INTO vet_specialties VALUES (5, 1);
