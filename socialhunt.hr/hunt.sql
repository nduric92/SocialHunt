drop database if exists hunt;
create database hunt;
use hunt;

--# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8mb4 < C:\Users\djuki\Documents\GitHub\SocialHunt\socialhunt.hr\hunt.sql
--alter database persefona_proizvodnja charset utf8mb4;(ISPRAVI - za server koji smo koristili)

-- Tablica Korisnika (Users)
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    first_name VARCHAR(70),
    last_name VARCHAR(70255),
    email VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL,
    profile_picture BLOB (255),
    registration_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Tablica Objava (Posts)
CREATE TABLE posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    image BLOB NOT NULL,
    description TEXT NOT NULL,
    post_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    gps_coordinates VARCHAR(255),
    location VARCHAR(255),
    likes INT DEFAULT 0,
    dislikes INT DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES users (id)
);

-- Tablica Prijateljstva (Friendships)
CREATE TABLE friendships (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user1_id INT NOT NULL,
    user2_id INT NOT NULL,
    status VARCHAR(255),
    FOREIGN KEY (user1_id) REFERENCES users (id),
    FOREIGN KEY (user2_id) REFERENCES users (id)
);

-- Tablica Lajkova (Likes)
CREATE TABLE likes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    post_id INT NOT NULL,
    status VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (post_id) REFERENCES posts (id)
);

-- Tablica Komentara (Comments)
CREATE TABLE comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    post_id INT NOT NULL,
    text TEXT NOT NULL,
    comment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (post_id) REFERENCES posts (id)
);

-- Tablica Poruka (Messages)
CREATE TABLE messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,
    text TEXT NOT NULL,
    message_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES users (id),
    FOREIGN KEY (receiver_id) REFERENCES users (id)
);

-- Tablica Obavijesti (Notifications)
CREATE TABLE notifications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    post_id INT, -- Dodajemo stupac za identifikaciju objave
    notification_type VARCHAR(255),
    text TEXT NOT NULL,
    notification_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (post_id) REFERENCES posts (id) -- Vanjski ključ za povezivanje s objavama
);

-- Tablica Grupe (Groups)
CREATE TABLE groups (
    id INT AUTO_INCREMENT PRIMARY KEY,
    group_name VARCHAR(255) NOT NULL,
    group_description TEXT
    -- Dodajte ostale atribute po potrebi
);

-- Tablica Događaja (Events)
CREATE TABLE events (
    id INT AUTO_INCREMENT PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    event_date DATETIME,
    event_location VARCHAR(255),
    event_description TEXT
    -- Dodajte ostale atribute po potrebi
);

-- Tablica Hashtaga (Hashtags)
CREATE TABLE hashtags (
    id INT AUTO_INCREMENT PRIMARY KEY,
    hashtag_text VARCHAR(255) NOT NULL
    -- Dodajte ostale atribute po potrebi
);
