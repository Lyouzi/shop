SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS goods;
DROP TABLE IF EXISTS users;




/* Create Tables */

CREATE TABLE goods
(
	goods_id int NOT NULL AUTO_INCREMENT,
	goods_class varchar(10) NOT NULL,
	goods_brand varchar(10) NOT NULL,
	goods_name varchar(20) NOT NULL,
	goods_unitprice float NOT NULL,
	goods_store int NOT NULL,
	goods_des text,
	goods_imgid varchar(100),
	goods_person int NOT NULL,
	PRIMARY KEY (goods_id),
	UNIQUE (goods_id)
);


CREATE TABLE users
(
	account varchar(20) NOT NULL,
	name varchar(10),
	password varchar(35) DEFAULT '123456' NOT NULL,
	introduce text,
	headimg varchar(30),
	sex int,
	birthday varchar(12),
	PRIMARY KEY (account),
	UNIQUE (account)
);



