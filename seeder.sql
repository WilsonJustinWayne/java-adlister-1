USE team_db;

# BEFORE YOU RUN THIS SEEDER
# Make sure you have three users in your users table.

DELETE FROM ads_categories;
DELETE FROM categories;
DELETE FROM ads;

INSERT INTO categories (category) VALUES
  ('animals'),
  ('people'),
  ('concepts'),
  ('food'),
  ('places');

INSERT INTO ads (user_id, title, description) VALUES
  (1, 'Beeves', 'More than one beef. Notably, the term beeves cannot be applied to the slang for argument.'), # things
  (2, 'Sphinges', 'A collective noun for more than one Sphinx. Notably, Sphinxes is also an acceptable term.)'), # animal concept people
  (3, 'Niblings', 'An outdated, gender neutral, term that refers to multiple nieces and/or nephews.'), # people
  (1, 'Aquaria', 'The collective noun for more than one aquarium.'), # places things
  (2, 'Spaghetti', 'The collective noun that refers to multiple Spaghetto.'), # things
  (2, 'Spaghettoni', 'The collective noun that refers to multiple Spaghettono.'), # things
  (1, 'Coalition', 'The collective noun for a group of cheetahs. Notably, female cheetahs are solitary.'), #animals, people
  (2, 'Murder', 'The collective noun for a group of crows, as well as the concept of unlawful premeditated killing.'), # concept, animals
  (3, 'Shrewdness', 'The collective noun for a group of apes, as well as the quality of demonstrating good judgement.'), #animals, concept
  (1, 'Pod', 'A collective noun that refers to a group of marine mammals. Commonly used for whales or dolphins.'), #things, animals
  (2, 'Parliament', 'A term that can refer to a group of representatives, a physical or abstract government structure, or a large group of owls.'), #concept animals people places
  (3, 'Troop', 'A collective noun that can refer to most groups of mammals, but commonly humans, monkeys, and kangaroos.'), # concept, animals, people,
  (1, 'Obstinacy', 'Originating in the late middle ages (more than 500 years ago), the term obstinacy can be used to refer to a group of buffalo.'), # concept animals
  (3, 'Conspiracy', 'The collective noun for a group of lemurs. Notably, groups of lemurs can also be referred to as a congress, a plot, or a troop.'), # concepts animals
  (1, 'Unkindness', 'The collective noun for a group of ravens. Notably, Unkindness of Ravens is also the name of a novel by Ruth Rendell, as well as an active Irish metal band.'), # concept animals
  (2, 'Business', 'A group of ferrets is known as a business or, historically, a busyness.'), # concept animals
  (3, 'Constellation',
   'While commonly used to refer to stars, the word constellation refers to any group of similar things.'); #animals, people, concepts, things, places

INSERT INTO ads_categories (ad_id, category_id) VALUES
  (1, 4), (2, 1), (2, 2), (2, 3), (3, 2), (4, 4), (4, 5), (5, 4), (6, 4), (7, 1), (7, 2), (8, 1), (8, 3), (9, 1),
  (9, 3), (10, 1), (11, 1), (11, 2), (11, 3), (11, 5), (12, 1), (12, 2), (12, 3), (13, 1), (13, 3), (14, 1), (14, 3), (15, 1), (15, 2), (15, 3), (16, 1), (16, 3), (17, 1), (17, 2), (17, 3), (17, 5);