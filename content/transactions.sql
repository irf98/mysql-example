USE stream_service;
SET AUTOCOMMIT = 0;

START TRANSACTION;
DELETE FROM movies WHERE id_movie = 3;
-- ROLLBACK;
-- COMMIT;

START TRANSACTION;
INSERT INTO shows VALUES
	(NULL, NOW(), 'All In The Family ', 25, 205, 'Sitcom', '1971', 'Norman Lear', 8.4, 1, 'Synopsis', 'show'),
    (NULL, NOW(), 'The Honeymooners', 15, 37, 'Sitcom', '1953', 'Jack Hurdle', 8.6, 0, 'Synopsis', 'show'),
    (NULL, NOW(), 'Alfred Hitchcock Presents', 25, 361, 'Thriller', '1962', 'Alfred Hitchcock', 8.5, 1, 'Synopsis', 'show'),
    (NULL, NOW(), 'The Flintstones', 20, 166, 'Comedy', '1960', 'William Hanna', 7.5, 0, 'Synopsis', 'show');
SAVEPOINT lote_1_4;

INSERT INTO shows VALUES
	(NULL, NOW(), 'All In The Family ', 25, 205, 'Sitcom', '1971', 'Norman Lear', 8.4, 1, 'Synopsis', 'show'),
    (NULL, NOW(), 'The Honeymooners', 15, 37, 'Sitcom', '1953', 'Jack Hurdle', 8.6, 0, 'Synopsis', 'show'),
    (NULL, NOW(), 'Alfred Hitchcock Presents', 25, 361, 'Thriller', '1962', 'Alfred Hitchcock', 8.5, 1, 'Synopsis', 'show'),
    (NULL, NOW(), 'The Flintstones', 20, 166, 'Comedy', '1960', 'William Hanna', 7.5, 0, 'Synopsis', 'show');
SAVEPOINT lote_2_4;

RELEASE SAVEPOINT lote_1_4;
