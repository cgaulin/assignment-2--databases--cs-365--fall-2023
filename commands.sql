-- Create a new entry in database
INSERT INTO pass_word_manager (website_name, website_URL, first_name, last_name, username, email, p_word, comment) VALUES 
('UHART', 'https://www.hartford.edu/', 'Test', 'User', 'tuser', 'test@gmail.com', 
AES_ENCRYPT('uhart', @key_str, @init_vector), 'school password');

-- Get password associated with URL
SELECT CAST(AES_DECRYPT(p_word, @key_str, @init_vector) AS CHAR) AS 'Plain Text Password' FROM pass_word_manager WHERE website_URL = 'https://www.google.com/';

-- Get all password-related data including password associated with URLs that have https in it
SELECT * FROM pass_word_manager WHERE website_URL LIKE 'https://%';

-- Change a URL associated with one of the passwords in your 10 entries
UPDATE pass_word_manager SET website_URL = 'https://www.discord.com/' WHERE website_URL = 'https://www.google.com/';

-- Change any password
UPDATE pass_word_manager SET p_word = AES_ENCRYPT('password123', @key_str, @init_vector) WHERE website_URL = 'https://www.facebook.com/';

-- Remove an entry by URL
DELETE FROM pass_word_manager WHERE website_URL = 'https://www.youtube.com/';

-- Remove an entry by password
DELETE FROM pass_word_manager WHERE p_word = AES_ENCRYPT('redditpassword', @key_str, @init_vector);