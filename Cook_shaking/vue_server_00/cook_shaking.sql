
SET NAMES UTF8;

DROP DATABASE IF EXISTS cook_shaking;

CREATE DATABASE cook_shaking CHARSET=UTF8;

USE cook_shaking;

/*用户表*/
CREATE TABLE cook_user(
    uid      INT PRIMARY KEY AUTO_INCREMENT,
    uname   VARCHAR(50),
    upwd    VARCHAR(32),
    email   VARCHAR(32),
    phone   VARCHAR(32),
    user_name   VARCHAR(32)
);
INSERT INTO cook_user VALUES(null,'tom',md5('123'),'blank@qq.com','13712354799','张三');
INSERT INTO cook_user VALUES(null,'blank',md5('123'),'blank@qq.com','13721247991','小李');


/*菜系类型表*/
CREATE TABLE cook_family(
    fid     INT PRIMARY KEY AUTO_INCREMENT,
    fname   VARCHAR(32)
);
INSERT INTO cook_family VALUES(null,"粤菜");
INSERT INTO cook_family VALUES(null,'川菜');
INSERT INTO cook_family VALUES(null,'湘菜');
INSERT INTO cook_family VALUES(null,'浙菜');
INSERT INTO cook_family VALUES(null,'闽菜');
INSERT INTO cook_family VALUES(null,'徽菜');
INSERT INTO cook_family VALUES(null,'鲁菜');
INSERT INTO cook_family VALUES(null,'苏菜');

/*首页菜系详情表*/
CREATE TABLE cook_index_detail(
    cid         INT PRIMARY KEY AUTO_INCREMENT,
    fid         INT,
    title       VARCHAR(128),
    subtitle    VARCHAR(128),
    pic		VARCHAR(128),
    href	VARCHAR(128)
);

/*菜系详情表*/
CREATE TABLE cook_detail(
    cid         INT PRIMARY KEY AUTO_INCREMENT,
    fid         INT,
    title       VARCHAR(128),
    subtitle    VARCHAR(128),
    detail	VARCHAR(128),
    href	VARCHAR(128),
    pic		VARCHAR(128)
);

/*菜系详情表_用料*/
CREATE TABLE cook_detail_material(
    mid         INT PRIMARY KEY AUTO_INCREMENT,
    cid         INT,
    material	VARCHAR(128),
    amount	VARCHAR(128)
);
/*菜系详情表_步骤*/
CREATE TABLE cook_detail_step(
    sid         INT PRIMARY KEY AUTO_INCREMENT,
    cid         INT,
    step_detail	VARCHAR(128),
    step_pic	VARCHAR(128),
    step_order	INT
);
/*粤菜列表*/
CREATE TABLE cook_guangdong(
    gdid        INT PRIMARY KEY AUTO_INCREMENT,
    title       VARCHAR(128),
    subtitle    VARCHAR(128),
    pic		VARCHAR(128),	
    href	VARCHAR(128)
);
/*川菜列表*/
CREATE TABLE cook_sichuan(
    scid        INT PRIMARY KEY AUTO_INCREMENT,
    title       VARCHAR(128),
    subtitle    VARCHAR(128),
    pic		VARCHAR(128),	
    href	VARCHAR(128)
);

/*收藏表*/
CREATE TABLE cook_collect(
    id INT PRIMARY KEY AUTO_INCREMENT,
    uid		INT,
    fid		INT,
    cid		INT,
    title       VARCHAR(128),
    subtitle    VARCHAR(128),
    detail	VARCHAR(128),
    pic		VARCHAR(128),
    href	VARCHAR(128)
);




/*用户评论表*/
CREATE TABLE cook_discuss(
    id		INT PRIMARY KEY AUTO_INCREMENT,
    uid		INT,
    cid		INT,
    data	VARCHAR(128),
    content	VARCHAR(128)
);

