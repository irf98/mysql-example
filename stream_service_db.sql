CREATE DATABASE IF NOT EXISTS stream_service;
USE stream_service;

######################### TABLES

CREATE TABLE IF NOT EXISTS users (
	id_user INT NOT NULL AUTO_INCREMENT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255),
    phone VARCHAR(25) UNIQUE,
    favorites VARCHAR(255),
    subscription BOOLEAN,
    PRIMARY KEY (id_user)
);

CREATE TABLE IF NOT EXISTS subscription (
	id_subs INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(255),
	video_quality VARCHAR(10),
	multi_user_accounts VARCHAR(10),
	pricing DECIMAL(4,2) NOT NULL,
    PRIMARY KEY (id_subs)
);

CREATE TABLE IF NOT EXISTS premium_users (
	id_premium_user INT NOT NULL AUTO_INCREMENT,
    payment_data VARCHAR(255) UNIQUE,
    payment_data_code VARCHAR(10),
    last_payment DATETIME NOT NULL,
    expiration DATETIME NOT NULL,
    ads BOOLEAN,
    PRIMARY KEY (id_premium_user),
    id_user INT,
    FOREIGN KEY (id_user) REFERENCES users(id_user),
    subscription_plan INT,
    FOREIGN KEY (subscription_plan) REFERENCES subscription(id_subs)
);

CREATE TABLE IF NOT EXISTS free_users (
	id_free_user INT NOT NULL AUTO_INCREMENT,
    free_minutes VARCHAR(10),
    video_quality VARCHAR(10),
    ads BOOLEAN,
    PRIMARY KEY (id_free_user),
    id_user INT,
    FOREIGN KEY (id_user) REFERENCES users(id_user)
);

CREATE TABLE IF NOT EXISTS staff (
	id_staff INT NOT NULL AUTO_INCREMENT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255),
    phone VARCHAR(25),
    area VARCHAR(25),
    salary DECIMAL(6,2),
    work_days VARCHAR(255),
    PRIMARY KEY (id_staff)
);

CREATE TABLE IF NOT EXISTS ads (
	id_ad INT NOT NULL AUTO_INCREMENT,
    provider VARCHAR(255),
    duration INT,
    target VARCHAR(255),
    expiration DATETIME NOT NULL,
    PRIMARY KEY (id_ad)
);

CREATE TABLE IF NOT EXISTS movies (
	id_movie INT NOT NULL AUTO_INCREMENT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    title VARCHAR(255),
    duration INT,
    genre VARCHAR(255),
    year VARCHAR(10),
    director VARCHAR(255),
    rating DECIMAL(4,2),
    premium BOOLEAN,
    synopsis VARCHAR(255),
    category VARCHAR(10),
    PRIMARY KEY (id_movie)
);

CREATE TABLE IF NOT EXISTS shows (
	id_show INT NOT NULL AUTO_INCREMENT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    title VARCHAR(255),
    duration INT,
    episodes INT,
    genre VARCHAR(255),
    year VARCHAR(10),
    director VARCHAR(255),
    rating DECIMAL(4,2),
    premium BOOLEAN,
    synopsis VARCHAR(255),
    category VARCHAR(10),
    PRIMARY KEY (id_show)
);

######################### INSERT

INSERT INTO movies VALUES 
	(NULL, NOW(), 'Goldfinger', 108, 'Spy', '1965', 'Guy Humilton', 7.7, 1, 'Synopsis', 'movie'),
    (NULL, NOW(), 'Rear Window', 112, 'Suspense', '1954', 'Alfred Hitchcock', 8.5, 1, 'Synopsis', 'movie'),
    (NULL, NOW(), 'Strangers on a Train', 111, 'Suspense', '1957', 'Alfred Hitchcock', 8, 1, 'Synopsis', 'movie'),
    (NULL, NOW(), 'Dial M for Murder', 105, 'Mystery', '1954', 'Alfred Hitchcock', 8.2, 1, 'Synopsis', 'movie'),
    (NULL, NOW(), 'Dr No', 111, 'Spy', '1962', 'Terence Young', 7.2, 1, 'Synopsis', 'movie'),
    (NULL, NOW(), 'Spartacus', 197, 'Epic', '1960', 'Stanley Kubrick', 7.9, 1, 'Synopsis', 'movie'),
    (NULL, NOW(), 'Rosemarys Baby', 138, 'Horror', '1968', 'Roman Polanski', 8, 0, 'Synopsis', 'movie'),
    (NULL, NOW(), 'Lolita', 155, 'Drama', '1962', 'Stanley Kubrick', 7.5, 1, 'Synopsis', 'movie'),
    (NULL, NOW(), 'Easy Rider', 95, 'Drama', '1969', 'Dennis Hopper', 7.3, 0, 'Synopsis', 'movie');

INSERT INTO shows VALUES
	(NULL, NOW(), 'Bonanza', 40, 431, 'Western', '1959', 'David Dortort', 7.3, 0, 'Synopsis', 'show'),
    (NULL, NOW(), 'The Addams Family', 25, 64, 'Sitcom', '1964', 'David Levy', 7.9, 0, 'Synopsis', 'show'),
    (NULL, NOW(), 'Jonny Quest', 20, 26, 'Science-Fiction', '1964', 'William Hanna', 7.8, 1, 'Synopsis', 'show');

INSERT INTO ads VALUES
	(NULL, 'Coke', 1, 'Adults', '2022-07-10 23:59:59'),
    (NULL, 'Oreo', 1, 'Kids', '2022-09-10 10:08:20'),
    (NULL, 'PlayStation', 1, 'Adults', '2022-03-10 21:15:30');
    
INSERT INTO staff VALUES
	(NULL, NOW(), 'John Doe', 'john@staff.com', 'test1', '333555777', 'Managment', 23.7, 'Monday-Tuesday-Wednesday-Thursday-Friday'),
    (NULL, NOW(), 'James Martin', 'james@staff.com', 'test2', '555888111', 'Developer', 21.9, 'Monday-Tuesday-Thursday-Friday'),
    (NULL, NOW(), 'Anne Williams', 'anne@staff.com', 'test3', '888222666', 'Developer', 21.9, 'Tuesday-Wednesday-Thursday-Friday'),
    (NULL, NOW(), 'Jennifer Brown', 'jennifer@staff.com', 'test4', '999333666', 'Community Managment', 15.2, 'Monday-Tuesday-Wednesday-Thursday-Friday'),
    (NULL, NOW(), 'William Evans', 'william@staff.com', 'test5', '333555111', 'Junior Marketing', 11.5, 'Monday-Wednesday-Friday');

INSERT INTO users VALUES
	(NULL, NOW(), 'Otis Francis', 'otis@mail.com', 'test', '333555111', 'Drama', 1),
    (NULL, NOW(), 'Drake Chambers', 'drake@mail.com', 'test', '777444111', 'Mystery', 1),
    (NULL, NOW(), 'Pearl Porter', 'pearl@mail.com', 'test', '222000555', 'Mystery', 0),
    (NULL, NOW(), 'Irene Burke', 'irene@mail.com', 'test', '555222111', 'Horror', 0),
    (NULL, NOW(), 'Willette Holmes', 'willete@mail.com', 'test', '666555000', 'Epic', 1),
    (NULL, NOW(), 'Frederick Hayes', 'fred@mail.com', 'test', '222555222', 'Suspense', 0),
    (NULL, NOW(), 'Theo Bowen', 'theo@mail.com', 'test', '111222111', 'Suspense', 1),
    (NULL, NOW(), 'Eileen Cunningham', 'eileen@mail.com', 'test', '999888999', 'Horror', 1),
    (NULL, NOW(), 'Guinevere Sims', 'guinevere@mail.com', 'test', '000444111', 'Drama', 1),
    (NULL, NOW(), 'Mortimer Lamb', 'mortimer@mail.com', 'test', '444111000', 'Epic', 0);

INSERT INTO subscription VALUES
	(NULL, 'Basic', '1080p', '2 users', 9.9),
    (NULL, 'Family', '2K', '4 users', 19.9),
    (NULL, 'Full', '4K', '2 users', 19.9),
    (NULL, 'Family Full', '4K', '4 users', 27.9),
    (NULL, 'Ultra', '8K', '2 users', 34.9);

INSERT INTO premium_users VALUES
	(NULL, '145236524589', '112', '2021-11-10 23:45:00', '2021-12-10 23:59:59', 0, 1, 3),
    (NULL, '252541003636', '541', '2021-11-25 09:01:45', '2021-12-25 23:59:59', 0, 2, 3),
    (NULL, '787855526664', '998', '2021-12-27 03:49:46', '2022-01-27 23:59:59', 0, 5, 2),
    (NULL, '989855551124', '336', '2021-11-19 20:58:27', '2021-12-19 23:59:59', 0, 7, 1),
    (NULL, '323297771145', '001', '2022-01-07 13:19:20', '2022-02-07 23:59:59', 0, 8, 5),
    (NULL, '212033335654', '784', '2022-01-03 16:08:27', '2022-02-03 23:59:59', 0, 9, 4);
    
INSERT INTO free_users VALUES
	(NULL, '200', '720p', 1, 3),
    (NULL, '50', '720p', 1, 4),
    (NULL, '180', '720p', 1, 6),
    (NULL, '67', '720p', 1, 10);

######################### VIEWS

# Lista solo el contenido premium de la plataforma:
CREATE OR REPLACE VIEW premium_content AS
	SELECT id_movie AS product_id, title, genre, year, director, rating, category FROM movies WHERE premium = TRUE
    UNION
    SELECT id_show AS product_id, title, genre, year, director, rating, category FROM shows WHERE premium = TRUE;

# Lista solo el contenido free de la plataforma:
CREATE OR REPLACE VIEW free_content AS
	SELECT id_movie AS product_id, title, genre, year, director, rating, category FROM movies WHERE premium = FALSE
    UNION
    SELECT id_show AS product_id, title, genre, year, director, rating, category FROM shows WHERE premium = FALSE;

# Lista el contenido con mayor puntuación de la plataforma (premium y free):
CREATE OR REPLACE VIEW top_content AS
	SELECT id_movie AS product_id, title, rating, category, premium FROM movies WHERE rating > 8
	UNION
	SELECT id_show AS product_id, title, rating, category, premium FROM shows WHERE rating > 8;

# Lista contenido de corta duración, "Quick watch". En caso de películas que duren menos de 100 minutos y en las series
# que duren menos de 30 minutos:
CREATE OR REPLACE VIEW quick_watch AS
	SELECT id_movie, title, genre, year, director, duration, rating, premium, category FROM movies WHERE duration < 100
    UNION
    SELECT id_show, title, genre, year, director, duration, rating, premium, category FROM shows WHERE duration < 30;

# Lista los usuarios en deuda, que todavía no pagaron:
CREATE OR REPLACE VIEW users_in_debt AS
	SELECT id_premium_user, expiration, last_payment
    FROM premium_users 
    WHERE expiration < '2022-01-01 00:00:00';
