
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
    question_id INTEGER NOT NULL
);

CREATE TABLE questions (
    q_id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT,
    user_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    q_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
)

