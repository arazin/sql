drop table if exists gevents;

create table gevents(
	id int unsigned auto_increment primary key,
	title varchar(100) NOT NULL,
	gevent_date date,
	place text,
	detail text,
	created DATETIME,
	modified DATETIME
)ENGINE=InnoDB;

drop table if exists careers;
create table careers(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	graduate_id INT UNSIGNED NOT NULL,
	belong VARCHAR(100) NOT NULL,
	posit VARCHAR(50) NOT NULL,
	industry_id INT UNSIGNED NOT NULL,
	special_report TEXT,
	created DATETIME,
	modified DATETIME,
	foreign key(graduate_id) references graduates(user_id)
	on update cascade on delete cascade,
	foreign key(industry_id) references industries(id)
	on update cascade on delete cascade
)ENGINE=InnoDB;

