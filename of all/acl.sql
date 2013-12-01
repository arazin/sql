drop table if exists labos,groups,students;

-- 研究室を改名
create table labos(
	id  INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	department_id INT UNSIGNED ,
	labo_name VARCHAR(50) NOT NULL,
	index(id),
	foreign key(department_id)	references departments(id)
	on update cascade on delete cascade
)ENGINE=InnoDB;

-- 研究室一覧
insert into labos(department_id,labo_name) values
(1,'哲学・思想論分野'),(1,'芸術コミュニケーション分野'),(2,'文化情報論分野'),(2,'社会学分野'),
(3,'心理学分野'),(3,'社会心理学分野'),(4,'西洋史分野'),(4,'東洋史分野'),(4,'日本史分野'),
(5,'比較文学分野'),(5,'中国語学'),(5,'中国文学分野'),(5,'ドイツ語学・ドイツ文学分野'),
(5,'フランス語学・フランス文学分野'),(6,'英語学分野'),(6,'英米文学分野'),
(7,'日本文学分野'),(7,'日本語学分野'),(7,'日本語教育学分野'),
(8,'現代教育コース'),(8,'国語教育コース'),(8,'英語教育コース'),(8,'社会科教育コース'),(8,'数学教育コース'),
(8,'理科教育コース'),(8,'音楽教育コース'),(8,'図画工作・芸術教育コース'),(8,'保健体育コース'),
(8,'ものづくり・技術教育コース'),(8,'家庭科教育コース'),(10,'地域スポーツコース'),(10,'野外教育コース'),
(14,'数理構造講座'),(14,'空間構造講座'),(14,'数理解析講座'),(14,'自然情報学講座'),(14,'テニュアトラック'),
(15,'光物性研究室'),(15,'磁性実験研究室'),(15,'物性理論研究室'),
(15,'宇宙線実験研究室'),(15,'高エネルギー実験研究室'),(15,'素粒子理論研究室'),
(16,'計算分離科学'),(16,'構造無機化学'),(16,'反応有機化学'),(16,'物性物理化学'),
(17,'地層科学講座'),(17,'地球物質科学講座'),
(18,'生体生物学大講座'),(18,'進化生物学大講座'),
(19,'地球システム研究分野'),(19,'生態システム研究分野'),(19,'産地水域環境保全学部門'),
(20,'基礎医学講座'),(20,'臨床医学講座'),
(21,'看護学専攻'),(21,'検査技術科学専攻'),(21,'作業療法学専攻'),
(22,'制御工学研究室'),(22,'超精密メカトロニクス研究室'),(22,'知的センシング研究室'),
(22,'ロボット工学研究室'),(22,'材料加工学研究室（榊研）'),(22,'材料加工学研究室（細野研）'),
(22,'機械材料研究室'),(22,'生産技術研究室'),(22,'固体力学研究室'),(22,'構造力学研究室'),
(22,'精密デバイス設計研究室'),(22,'自律知能システム研究室'),(22,'応用熱工学研究室'),(22,'熱工学研究室'),
(22,'流体工学研究室'),(22,'熱流体解析研究室'),(22,'応用物理学研究室'),
(23,'佐藤・曽根原 研究室'),(23,'林・金 研究室'),(23,'田代 研究室'),(23,'水野・卜 研究室'),
(23,'上村・宮地 研究室'),(23,'阿部 研究室'),(23,'橋本・ミョー 研究室'),(23,'番場 研究室'),
(23,'伊東 研究室'),(23,'伊藤 研究室'),
(26,'生物化学研究室'),(26,'水熱反応工学研究室'),(26,'分子集合体化学研究室'),(26,'有機合成化学研究室'),
(26,'高分子化学研究室'),(26,'分子化学工学研究室'),(26,'無機材料化学研究室'),(26,'機器分析化学研究室'),
(26,'応用電気化学研究室'),(26,'触媒化学研究室'),(26,'界面化学研究室'),
(27,'森迫・劉 研究室'),(27,'榮岩 研究室'),(27,'川原 研究室'),(27,'橋本・香山・大谷 研究室'),
(27,'斉藤・小林 研究室'),(27,'井澤・アサノ 研究室'),(27,'新村・國宗 研究室'),(27,'和崎 研究室'),
(27,'カワモト 研究室'),(27,'師玉・山崎・岡崎 研究室'),(27,'海尻・海谷・小形 研究室'),
(27,'丸山・宮尾 研究室'),(27,'岡本・山本・白井 研究室'),
(28,'大石・手嶋 研究室'),(28,'北澤 研究室'),(28,'中村 研究室'),(28,'飯尾 研究室'),(28,'片岡 研究室'),
(28,'鈴木 研究室'),(28,'光物理科学研究室'),(28,'牛 研究室'),(28,'吉田 研究室'),
(29,'農学コース'),(29,'動物生産学コース'),(30,'森林環境科学コース'),(30,'田園環境工学コース'),
(32,'先進繊維工学課程'),(32,'感性工学課程'),(33,'機能機械学課程'),(33,'バイオエンジニアリング課程'),
(34,'応用化学課程'),(34,'材料化学工学課程'),(34,'機能高分子学課程'),
(35,'生物機能科学課程'),(35,'生物資源・環境科学課程');
insert into labos (department_id,labo_name) values (null,'なし');

create table students(
  user_id INT UNSIGNED PRIMARY KEY,
  grade INT NOT NULL,
	faculty_id INT UNSIGNED NOT NULL,
	department_id INT UNSIGNED NOT NULL,
	labo_id INT UNSIGNED ,
	student_id VARCHAR(30) NOT NULL,
	guarantor_name VARCHAR(100),
	guarantor_address TEXT NOT NULL,
	guarantor_contact VARCHAR(20) NOT NULL,
	entrance_date DATE NOT NULL,
  foreign key(user_id)	references users(id)
	on update cascade on delete cascade,
	foreign key(faculty_id) references faculties(id)
	on update cascade on delete cascade,
	foreign key(department_id) references departments(id)
	on update cascade on delete cascade,
	foreign key(labo_id) references labos(id)
	on update cascade on delete cascade
)ENGINE=InnoDB;

-- ACL用
create table groups(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(100) NOT NULL UNIQUE,
	created DATETIME,
	modified DATETIME,
	index(id)
)ENGINE=InnoDB;

delete from users;
drop table if exists users,acos,aros_acos,aros;

create table users(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(50) NOT NULL,
	group_id INT UNSIGNED NOT NULL,
	created DATETIME,
	modified DATETIME,
  name VARCHAR(100) NOT NULL,
  nationarity VARCHAR(50) NOT NULL,
  prefecture VARCHAR(50) NOT NULL,
  remain VARCHAR(100) NOT NULL,
  postcord VARCHAR(20) NOT NULL,
  phonenumber VARCHAR(25) NOT NULL,
  job VARCHAR(50) NOT NULL,
  industry_id INT UNSIGNED NOT NULL,
  birthday DATE NOT NULL,
  sex TINYINT NOT NULL,					-- 性別:0->女,1->男??
	index(id),
	foreign key(industry_id)	references industries(id)
	on update cascade on delete cascade,
	foreign key(group_id)	references groups(id)
	on update cascade on delete cascade
)engine=InnoDB;


CREATE TABLE acos (
  id INTEGER(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  parent_id INTEGER(10) DEFAULT NULL,
  model VARCHAR(255) DEFAULT '',
  foreign_key INTEGER(10) UNSIGNED DEFAULT NULL,
  alias VARCHAR(255) DEFAULT '',
  lft INTEGER(10) DEFAULT NULL,
  rght INTEGER(10) DEFAULT NULL,
  PRIMARY KEY  (id)
)ENGINE=InnoDB;

CREATE TABLE aros_acos (
  id INTEGER(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  aro_id INTEGER(10) UNSIGNED NOT NULL,
  aco_id INTEGER(10) UNSIGNED NOT NULL,
  _create CHAR(2) NOT NULL DEFAULT 0,
  _read CHAR(2) NOT NULL DEFAULT 0,
  _update CHAR(2) NOT NULL DEFAULT 0,
  _delete CHAR(2) NOT NULL DEFAULT 0,
  PRIMARY KEY(id)
)ENGINE=InnoDB;

CREATE TABLE aros (
  id INTEGER(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  parent_id INTEGER(10) DEFAULT NULL,
  model VARCHAR(255) DEFAULT '',
  foreign_key INTEGER(10) UNSIGNED DEFAULT NULL,
  alias VARCHAR(255) DEFAULT '',
  lft INTEGER(10) DEFAULT NULL,
  rght INTEGER(10) DEFAULT NULL,
  PRIMARY KEY  (id)
)ENGINE=InnoDB;

