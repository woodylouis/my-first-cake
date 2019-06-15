CREATE TABLE
IF NOT EXISTS users
(
    id INT PRIMARY KEY,
    email VARCHAR NOT NULL,
    password VARCHAR NOT NULL,
    created DATETIME,
    modified DATETIME
);

CREATE TABLE
IF NOT EXISTS articles
(
    id INT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR NOT NULL,
    slug VARCHAR NOT NULL,
    body TEXT,
    published BOOLEAN DEFAULT FALSE,
    created DATETIME,
    modified DATETIME,
    FOREIGN KEY
(user_id) REFERENCES users
(id) 
);

CREATE TABLE
IF NOT EXISTS tags
(
    id INT PRIMARY KEY,
    title VARCHAR,
    created DATETIME,
    modified DATETIME
);

CREATE TABLE
IF NOT EXISTS articles_tags
(
    article_id INT NOT NULL,
    tag_id INT NOT NULL,
    PRIMARY KEY
(article_id, tag_id),
    FOREIGN KEY
(tag_id) REFERENCES tags
(id),
    FOREIGN KEY
(article_id) REFERENCES articles
(id)
);

INSERT INTO users
    (email, password, created, modified)
VALUES
    ('cakephp@example.com', 'secret', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO articles
    (user_id, title, slug, body, published, created, modified)
VALUES
    (1, 'First Post', 'first-post', 'This is the first post.', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);