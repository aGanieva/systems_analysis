-- 1 задание
update users
SET
	`created_at` = now(),
	`updated_at` = now()
;

-- 2 задание
ALTER TABLE `users` modify `created_at` varchar(25)
;
ALTER TABLE `users` change `created_at` `created_at` datetime;

-- 3 задание:
select * from `storehouses_products` order by IF (value > 0, 0, 1), value;

-- 4 задание
select id, name, monthname(birthday_at) bday_month from users
where monthname(birthday_at) in ('May', 'August');

-- Агрегация данных

-- 1 задание
select avg(timestampdiff(year, birthday_at, now())) `avg_age` from users;

-- 2 задание
select count(*), date_format(concat_ws('-', year(now()), month(birthday_at), day(birthday_at)), '%W') as bday from users group by bday;




















