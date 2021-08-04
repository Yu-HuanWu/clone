PRAGMA foreign_keys = ON;
CREATE TABLE users (
    user_id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

CREATE TABLE questions (
    q_id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT,
    user_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE question_follows (
    qf_id INTEGER PRIMARY KEY,
    q_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (q_id) REFERENCES questions(q_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE replies(
    r_id INTEGER PRIMARY KEY,
    pr_id INTEGER,
    q_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    body TEXT,

    FOREIGN KEY (q_id) REFERENCES questions(q_id),
    FOREIGN KEY (pr_id) REFERENCES replies(r_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE question_likes(
    ql_id INTEGER PRIMARY KEY,
    q_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (q_id) REFERENCES questions(q_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO 
    users (fname, lname)
VALUES
    ('Minh', 'Nguyen'),
    ('Yu Huan', 'Wu');

INSERT INTO 
    questions(title, body, user_id)
VALUES
    ('Why is the sky blue?', 'Why the sky is red sometimes', (SELECT user_id FROM users WHERE fname = 'Minh' AND lname = 'Nguyen')),
    ('Why do SQL so weird', 'I wish coding was easier', (SELECT user_id FROM users WHERE fname = 'Yu Huan' AND lname = 'Wu'));

INSERT INTO
    question_follows(q_id, user_id)
VALUES
    ((SELECT q_id FROM questions WHERE title = 'Why is the sky blue?' ), (SELECT user_id FROM users WHERE fname = 'Minh' AND lname = 'Nguyen')),
    ((SELECT q_id FROM questions WHERE title = 'Why do SQL so weird' ), (SELECT user_id FROM users WHERE fname = 'Minh' AND lname = 'Nguyen'));


