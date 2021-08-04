
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;
PRAGMA foreign_keys = ON;


CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);


CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT,
    user_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    q_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (q_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE replies(
    id INTEGER PRIMARY KEY,
    pr_id INTEGER,
    q_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    body TEXT,

    FOREIGN KEY (q_id) REFERENCES questions(id),
    FOREIGN KEY (pr_id) REFERENCES replies(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_likes(
    id INTEGER PRIMARY KEY,
    q_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (q_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO 
    users (fname, lname)
VALUES
    ('Minh', 'Nguyen'),
    ('Yu Huan', 'Wu');

INSERT INTO 
    questions(title, body, user_id)
VALUES
    ('Why is the sky blue?', 'Why the sky is red sometimes', (SELECT id FROM users WHERE fname = 'Minh' AND lname = 'Nguyen')),

    ('What is the answer to life', 'is it 42? I do not know', (SELECT id FROM users WHERE fname = 'Minh' AND lname = 'Nguyen')),
    
    ('Why do SQL so weird', 'I wish coding was easier', (SELECT id FROM users WHERE fname = 'Yu Huan' AND lname = 'Wu'));

INSERT INTO
    question_follows(q_id, user_id)
VALUES
    ((SELECT id FROM questions WHERE title = 'Why is the sky blue?'), (SELECT id FROM users WHERE fname = 'Minh' AND lname = 'Nguyen')),

    ((SELECT id FROM questions WHERE title = 'Why do SQL so weird' ), (SELECT id FROM users WHERE fname = 'Minh' AND lname = 'Nguyen'));


INSERT INTO
    replies(pr_id, q_id, user_id, body)
VALUES
    (NULL, (SELECT id FROM questions WHERE title = 'Why do SQL so weird'), (SELECT id FROM users WHERE fname = 'Minh' AND lname = 'Nguyen'), 'SQL is one of the most popular languages, it is not weird at all, perhaps you are the weird one.');

INSERT INTO
    replies(pr_id, q_id, user_id, body)
VALUES
    ((SELECT id FROM replies WHERE body = 'SQL is one of the most popular languages, it is not weird at all, perhaps you are the weird one.') , (SELECT id FROM questions WHERE title = 'Why do SQL so weird' ), (SELECT id FROM users WHERE fname = 'Yu Huan' AND lname = 'Wu'), 'Wow i did not ask for this.');

INSERT INTO
    replies(pr_id, q_id, user_id, body)
VALUES
    ((SELECT id FROM replies WHERE body = 'Wow i did not ask for this.') , (SELECT id FROM questions WHERE title = 'Why do SQL so weird' ), (SELECT id FROM users WHERE fname = 'Minh' AND lname = 'Nguyen'), 'Hope you learned your lesson');

INSERT INTO
    question_likes(q_id, user_id)
VALUES
    ((SELECT id FROM questions WHERE title = 'Why is the sky blue?' ), (SELECT id FROM users WHERE fname = 'Yu Huan' AND lname = 'Wu'));

