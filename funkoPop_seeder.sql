USE adlister_db;

DROP TABLE IF EXISTS ads;
DROP TABLE IF EXISTS users;

# TRUNCATE TABLE ads;
# OR USE DELETE?
# DELETE FROM users WHERE TRUE;
# DELETE FROM ads WHERE TRUE;
# and so on


CREATE TABLE users (
                       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                       username VARCHAR(240) NOT NULL,
                       email VARCHAR(240) NOT NULL,
                       password VARCHAR(255) NOT NULL,
                       PRIMARY KEY (id)
);

CREATE TABLE ads (
                     id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                     user_id INT UNSIGNED NOT NULL,
                     title VARCHAR(240) NOT NULL,
                     description TEXT NOT NULL,
                     PRIMARY KEY (id),
                     FOREIGN KEY (user_id) REFERENCES users(id)
                         ON DELETE CASCADE
);
# CREATE TABLE users (
#                        id INT UNSIGNED NOT NULL AUTO_INCREMENT,
#                        username VARCHAR(240) NOT NULL,
#                        email VARCHAR(240) NOT NULL,
#                        password VARCHAR(255) NOT NULL,
#                        PRIMARY KEY (id)
# );
#
# CREATE TABLE ads (
#                      id INT UNSIGNED NOT NULL AUTO_INCREMENT,
#                      user_id INT UNSIGNED NOT NULL,
#                      title VARCHAR(240) NOT NULL,
#                      description TEXT NOT NULL,
#                      tag
#                      PRIMARY KEY (id),
#                      FOREIGN KEY (user_id) REFERENCES users(id)
#                          ON DELETE CASCADE
# );


# CREATE TABLE tags(
#                      id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
#                      name VARCHAR(200),
#                      ad_id INT UNSIGNED NOT NULL,
#                      FOREIGN KEY (ad_id) REFERENCES ads (id)
# );
#
# CREATE TABLE ad_tab (
#                         id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
#                         ad_id INT UNSIGNED NOT NULL ,
#                         tag_id INT UNSIGNED NOT NULL ,
#                         FOREIGN KEY (ad_id) REFERENCES ads (id),
#                         FOREIGN KEY (tag_id) REFERENCES tags (id)
# );

INSERT INTO users (id, username, email, password)
VALUES  (1, 'user1', 'user1@email.com', 'password');

INSERT INTO ads (id, user_id, title, description)
VALUES  (1, 1, 'Deadpool Playtime - Bob Ross', 'Funko POP! Marvel: Deadpool Playtime - Bob Ross'),
        (2, 1, 'Pokemon - Squirtle', 'Funko Pop!: Pokemon - Squirtle, Multicolor'),
        (3, 1, 'Tupac - Rocks', 'Funko POP! Rocks: Tupac - Vest with Bandana, Multicolour,3.75 inches'),
        (4, 1, 'Stan Lee - Icons', 'Funko Pop! Icons: Stan Lee - Stan Lee in Ragnarok Outfit, Multicolor'),
        (5, 1, 'Kool-Aid Man - Icons', 'Funko Pop! Ad Icons: Kool-Aid Kool-Aid Man'),
        (6, 1, 'The Child - The Mandalorian - Star Wars', 'Funko Pop! Star Wars: The Mandalorian - The Child with Frog, Multicolor'),
        (7, 1, 'Pokemon - Pikachu', 'Funko Pop! Pokemon - Pikachu (Waving)'),
        (8, 1, 'Dwight Schrute - The Office - TV', 'Funko Pop! TV: The Office - Dwight Schrute'),
        (9, 1, 'Steve Irwin - Crocodile Hunter - TV', 'Funko Pop! TV: Crocodile Hunter - Steve Irwin (Styles May Vary), Multicolor'),
        (10, 1, 'Luke Skywalker - With Yoda - Star Wars', 'Funko Pop! Star Wars: Star Wars - Training Luke with Yoda,Multicolor,3.75 inches');

# Table not yet added to migration file:
# INSERT INTO tags (id, name)
# VALUES (1, 'marvel'),
#       (2, 'pokemon'),
#       (3, 'music'),
#       (4, 'cartoon'),
#       (5, 'star-wars');

