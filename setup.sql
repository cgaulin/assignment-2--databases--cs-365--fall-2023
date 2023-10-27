/* mysql -u root -p < setup.sql */

DROP DATABASE IF EXISTS passwords;

CREATE DATABASE passwords;

SET time_zone = '+00:00';

SET block_encryption_mode = 'aes-256-cbc';
SET @key_str = UNHEX(SHA2('password123', 512));
SET @init_vector = RANDOM_BYTES(16);

USE passwords;

CREATE TABLE pass_word_manager (
    id_number AUTO_INCREMENT,
    website_name VARCHAR(128) NOT NULL,
    website_URL VARCHAR(128) NOT NULL,
    first_name VARCHAR(64) NOT NULL,
    last_name VARCHAR(64) NOT NULL,
    username VARCHAR(64) NOT NULL,
    email VARCHAR(128) NOT NULL,
    p_word VARBINARY(128) NOT NULL,
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_number) 
);

INSERT INTO pass_word_manager (website_name, website_URL, first_name, last_name, username, email p_word, comment) VALUES
('Youtube', 'https://www.youtube.com', 'Cameron', 'Gaulin', 'cgaulin', 'cam@gmail.com', AES_ENCRYPT('youtubepassword', @key_str, @init_vector),
'This is definitely not my youtube password');
