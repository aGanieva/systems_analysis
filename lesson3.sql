DROP TABLE IF EXISTS `photos`;
CREATE TABLE `photos` (
	id SERIAL PRIMARY KEY,
	`album_id` BIGINT unsigned NOT NULL,
	`media_id` BIGINT unsigned NOT NULL,
    user_id BIGINT UNSIGNED NOT NULL,

    INDEX (user_id), -- добавила индекс
	FOREIGN KEY (album_id) REFERENCES photo_albums(id),
    FOREIGN KEY (media_id) REFERENCES media(id),
    FOREIGN KEY (user_id) REFERENCES users(id) -- добавила связь фото с пользователем
);

DROP TABLE IF EXISTS likes_photos;
CREATE TABLE likes_photos(
	user_id BIGINT UNSIGNED NOT NULL,
    photo_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT NOW(),
    PRIMARY KEY (user_id, photo_id),
FOREIGN KEY (user_id) REFERENCES users(id),
FOREIGN KEY (photo_id) REFERENCES photos(id)
);

DROP TABLE IF EXISTS likes_users;
CREATE TABLE likes_users( -- не уверена, что в этом есть смысл, но в задании сказано добавить лайки пользователям )
	user_liked_id BIGINT UNSIGNED NOT NULL,
    user_gotlike_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT NOW(),
    PRIMARY KEY (user_liked_id, user_gotlike_id),
FOREIGN KEY (user_liked_id) REFERENCES users(id),
FOREIGN KEY (user_gotlike_id) REFERENCES users(id)
);