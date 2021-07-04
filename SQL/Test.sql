CREATE TABLE guy (
  id INT NOT NULL,
  name VARCHAR(20)
);

INSERT INTO guy
VALUES(22, 'Betanir');
SELECT id,name FROM guy
WHERE id = 22;
