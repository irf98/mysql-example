USE stream_service;

######################### LOG TABLES

CREATE TABLE IF NOT EXISTS content_logs (
	id_log INT NOT NULL AUTO_INCREMENT,
	created_at DATETIME NOT NULL,
    product_id INT,
    product_category VARCHAR(40),
    modified_by VARCHAR(40),
    PRIMARY KEY (id_log)
);

CREATE TABLE IF NOT EXISTS request_logs (
	id_log INT NOT NULL AUTO_INCREMENT,
    created_at DATETIME NOT NULL,
    product_id INT,
    product_category VARCHAR(40),
    modified_by VARCHAR(40),
    PRIMARY KEY (id_log)
);

CREATE TABLE IF NOT EXISTS payments_logs (
	id_log INT NOT NULL AUTO_INCREMENT,
    created_at DATETIME NOT NULL,
	user_id INT,
    last_payment DATETIME NOT NULL,
    next_expiration DATETIME NOT NULL,
    modified_by VARCHAR(40),
    PRIMARY KEY (id_log)
);

CREATE TABLE IF NOT EXISTS request_payments_logs (
	id_log INT NOT NULL AUTO_INCREMENT,
    created_at DATETIME NOT NULL,
    user_id INT,
    modified_by VARCHAR(40),
    PRIMARY KEY (id_log)
);

######################### MOVIES TRIGGERS

CREATE TRIGGER `added_movie`
AFTER INSERT ON `movies`
FOR EACH ROW
INSERT INTO `content_logs` (id_log, created_at, product_id, product_category, modified_by)
VALUES (NULL, NOW(), NEW.id_movie, NEW.category, SESSION_USER());

CREATE TRIGGER `delete_movie`
AFTER DELETE ON `movies`
FOR EACH ROW
INSERT INTO `content_logs` (id_log, created_at, product_id, product_category, modified_by)
VALUES (NULL, NOW(), id_movie, category, SESSION_USER());

CREATE TRIGGER `request_add_movie`
BEFORE INSERT ON `movies`
FOR EACH ROW
INSERT INTO `request_logs` (id_log, created_at, product_id, product_category, modified_by)
VALUES (NULL, NOW(), NEW.id_movie, category, SESSION_USER());

CREATE TRIGGER `request_delete_movie`
BEFORE DELETE ON `movies`
FOR EACH ROW
INSERT INTO `request_logs` (id_log, created_at, product_id, product_category, modified_by)
VALUES (NULL, NOW(), id_movie, category, SESSION_USER());

######################### SHOWS TRIGGERS

CREATE TRIGGER `added_show`
AFTER INSERT ON `shows`
FOR EACH ROW
INSERT INTO `content_logs` (id_log, created_at, product_id, product_category, modified_by)
VALUES (NULL, NOW(), NEW.id_show, NEW.category, SESSION_USER());

CREATE TRIGGER `delete_show`
AFTER DELETE ON `shows`
FOR EACH ROW
INSERT INTO `content_logs` (id_log, created_at, product_id, product_category, modified_by)
VALUES (NULL, NOW(), id_show, category, SESSION_USER());

CREATE TRIGGER `request_add_show`
BEFORE INSERT ON `shows`
FOR EACH ROW
INSERT INTO `request_logs` (id_log, created_at, product_id, product_category, modified_by)
VALUES (NULL, NOW(), NEW.id_show, category, SESSION_USER());

CREATE TRIGGER `request_delete_show`
BEFORE INSERT ON `shows`
FOR EACH ROW
INSERT INTO `request_logs` (id_log, created_at, product_id, product_category, modified_by)
VALUES (NULL, NOW(), id_show, category, SESSION_USER());

######################### PAYMENTS TRIGGERS

CREATE TRIGGER `payments_updates`
AFTER UPDATE ON `premium_users`
FOR EACH ROW
INSERT INTO `payments_logs` (id_log, created_at, user_id, last_payment, next_expiration, modified_by)
VALUES (NULL, NOW(), NEW.id_premium_user, NEW.last_payment, NEW.expiration, SESSION_USER());

CREATE TRIGGER `request_payment_update`
BEFORE UPDATE ON `premium_users`
FOR EACH ROW
INSERT INTO `request_payments_logs` (id_log, created_at, user_id, modified_by)
VALUES (NULL, NOW(), NEW.id_premium_user, SESSION_USER());
