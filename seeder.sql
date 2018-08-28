USE team_db;

DELETE FROM ads_categories;
DELETE FROM categories;
DELETE FROM ads;

INSERT INTO categories (category) VALUES
  ('animals'),
  ('people'),
  ('concepts'),
  ('things'),
  ('places');

INSERT INTO ads (user_id, title, description) VALUES
  (1, 'Beeves', 'More than one beef (note: does not apply to the slang for argument)'), # things
  (2, 'Sphinges', 'More than one sphinx (note: Sphinxes is also acceptable)'), # animal concept people
  (3, 'Niblings', 'Plural Gender neutral term for multiple nieces and nephews'), # people
  (1, 'Aquaria', 'Plural term referencing more than one aquarium'), # places things
  (2, 'Spaghetti', 'Plural term for Spaghetto'), # things
  (3, 'Spaghettoni', 'More than one Spaghettono'), # things
  (1, 'coalition', 'group of cheetas'), #animals, people
  (2, 'murder', 'group of crows'), # concept, animals
  (3, 'shrewdness', 'group of apes'), #animals, concept
  (1, 'pod', 'group of whales'), #things, animals
  (2, 'parliament', 'group of owls'), #concept, animals people places
  (3, 'troop', 'group of monkeys/kangaroos/humans'), # concept, animals, people,
  (1, 'obstinancy', 'group of buffalo'), # concept animals
  (2, 'grumble', 'group of pugs'), # concept animals
  (3, 'conspiracy', 'group of lemurs'), # concepts animals
  (1, 'unkindness', 'group of ravens'), # concept animals
  (2, 'business', 'group of ferrets'), # concept animals
  (3, 'constellation', 'group of stars, and also a group of any like entities'); #animals, people, concepts, things, places

INSERT INTO ads_categories (ad_id, category_id) VALUES
  (1,3),
  (2,1),
  (2,2),
  (2,3),
  (3,2),
  (4,4),
  (4,5),
  (5,4),
  (6,4),
  (7,1),
  (7,2),
  (8,1),
  (8,3),
  (9,1),
  (9,3),
  (10,1),
  (10,1),
  (11,1),
  (11,2),
  (11,3),
  (11,5),
  (12,1),
  (12,2),
  (12,3),
  (13,1),
  (13,3),
  (14,1),
  (14,3),
  (15,1),
  (15,3),
  (16,1),
  (16,3),
  (17,1),
  (17,3),
  (18,1),
  (18,2),
  (18,3),
  (18,4),
  (18,5);