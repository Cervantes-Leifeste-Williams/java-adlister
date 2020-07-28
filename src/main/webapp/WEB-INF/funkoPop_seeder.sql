USE adlister_db;

# TRUNCATE TABLE ...all tables? review
# OR USE DELETE?
# DELETE FROM users WHERE TRUE;
# DELETE FROM ada WHERE TRUE;
# and so on

INSERT INTO users (id, userName, email, password)
VALUES  (1, 'user', 'useremail@email.com', 'password'),
        (2, 'user2', 'user2email@email.com', 'password2'),
        (3, 'user3', 'user3email@email.com', 'password3');

INSERT INTO ads (id, user_id, title, description)
VALUES  (1, 3, 'ad1', 'description1'),
        (2, 1, 'ad2', 'description2'),
        (3, 2, 'ad3', 'description3');

# Table not yet added to migration file:
# INSERT INTO tags (id, name)
# VALUES (1, 'CAPS FOR ONE TYPE OF TAG'),
#       (2, 'smalls for minor category tags');

