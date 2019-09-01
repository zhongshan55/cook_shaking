
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
     
    id         INT PRIMARY KEY AUTO_INCREMENT,
    cid         INT,
    fid         INT,
    title       VARCHAR(128),
    subtitle    VARCHAR(128),
    detail	VARCHAR(128),
    pic		VARCHAR(128),
    href	VARCHAR(128),
    pic_collect_active VARCHAR(128),
    pic_collect VARCHAR(128),
    collect_status   INT
);
INSERT INTO cook_index_detail VALUES(null,08,1,"豉汁蒸排骨","骨头软，肉多","豉汁蒸排骨用的是肋排，这个部分的骨头一般比较软，肉多","paigu.png","cook_details?cid=8","collect_active.png","collect.png",0);
INSERT INTO cook_index_detail VALUES(null,01,1,"排骨","骨头软，肉多","豉汁蒸排骨用的是肋排，这个部分的骨头一般比较软，肉多","01.jpg","cook_details?cid=1","collect_active.png","collect.png",0);
INSERT INTO cook_index_detail VALUES(null,02,2,"酸菜鱼","鱼肉鲜嫩，酸辣可口","酸菜鱼的主材鱼含丰富优质蛋白，人体消化吸收率可达96%，并能供给人体必需的氨基酸、矿物质、维生素A和维生素D；鱼的脂肪多为不饱和脂肪酸，能很好的降低胆固醇，可以防治动脉硬化、冠心病，因此，多吃鱼可以健康长寿","02.jpg","cook_details?cid=2","collect_active.png","collect.png",0);
INSERT INTO cook_index_detail VALUES(null,03,2,"乳猪","色泽红润，皮酥肉嫩，肥而不腻，又鲜又嫩","色泽红润，形态完整，皮酥肉嫩，肥而不腻，又鲜又嫩，入口奇香。其烤制方法早在公元前成书的《礼记》中就有记载，周朝时烤猪(炮豚)是“八珍”之一。直到清朝灭亡前，烤全猪还是宫廷宴席中的“上上品","03.jpg","cook_details?cid=3","collect_active.png","collect.png",0);
INSERT INTO cook_index_detail VALUES(null,04,3,"南京盐水鸭","盐水鸭鸭皮白肉嫩、肥而不腻、香鲜味美","南京盐水鸭制作历史悠久，积累了丰富的制作经验。生产的盐水鸭鸭皮白肉嫩、肥而不腻、香鲜味美，具有香、酥、嫩的特点。而以中秋前后，桂花盛开季节制作的的盐水鸭色味最佳，名为桂花鸭","04.jpg","cook_details?cid=4","collect_active.png","collect.png",0);
INSERT INTO cook_index_detail VALUES(null,05,3,"家常豆腐","富有较高的蛋白质，有营养价值并具有医药功能的美味食品","家常豆腐，是一道以豆腐、猪肉作为主要食材，以豆瓣酱、白糖和酱油作为调料制作而成的老少皆宜的美味食品，酸甜苦辣皆宜，味道浓郁。其中含有铁、钙、磷、镁等人体必需的多种微量元素，还含有糖类、植物油和丰富的优质蛋白。菜品没有特别强的季节性，四季可食","05.jpg","cook_details?cid=5","collect_active.png","collect.png",0);
INSERT INTO cook_index_detail VALUES(null,06,4,"佛跳墙","骨头软，肉多","吃起来软嫩柔润，浓郁荤香，又荤而不腻；各料互为渗透，味中有味","06.jpg","cook_details?cid=6","collect_active.png","collect.png",0);
INSERT INTO cook_index_detail VALUES(null,07,4,"烤鱼","骨头软，肉多","吃起来软嫩柔润，浓郁荤香，又荤而不腻；各料互为渗透，味中有味","zhe.jpg","cook_details?cid=7","collect_active.png","collect.png",0);

/*首页轮播图表*/
CREATE TABLE cook_index_carousel(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    cid         INT,
    fid         INT,
    title       VARCHAR(128),
    pic		    VARCHAR(128),
    href	    VARCHAR(128)
);
INSERT INTO cook_index_carousel VALUES(null,03,2,"烤乳猪","pig.jpg","cook_details?cid=3");
INSERT INTO cook_index_carousel VALUES(null,02,2,"酸菜鱼","suancaiyu.jpg","cook_details?cid=2");
INSERT INTO cook_index_carousel VALUES(null,07,4,"烤鱼","zhe.jpg","cook_details?cid=7");
INSERT INTO cook_index_carousel VALUES(null,01,1,"排骨","paigu.png","cook_details?cid=1");


/*菜系详情表*/
CREATE TABLE cook_detail(
    cid         INT PRIMARY KEY AUTO_INCREMENT,
    fid         INT,
    title       VARCHAR(128),
    subtitle    VARCHAR(128),
    detail	VARCHAR(128),
    pic		VARCHAR(128),
    href	VARCHAR(128),
    collect_status   INT
);

INSERT INTO cook_detail VALUES(08,1,"豉汁蒸排骨","骨头软，肉多","豉汁蒸排骨用的是肋排，这个部分的骨头一般比较软，肉多","paigu.png","cook_details?cid=8",0);
INSERT INTO cook_detail VALUES(01,1,"排骨","骨头软，肉多","豉汁蒸排骨用的是肋排，这个部分的骨头一般比较软，肉多","01.jpg","cook_details?cid=1",0);
INSERT INTO cook_detail VALUES(02,2,"酸菜鱼","鱼肉鲜嫩，酸辣可口","酸菜鱼的主材鱼含丰富优质蛋白，人体消化吸收率可达96%，并能供给人体必需的氨基酸、矿物质、维生素A和维生素D；鱼的脂肪多为不饱和脂肪酸，能很好的降低胆固醇，可以防治动脉硬化、冠心病，因此，多吃鱼可以健康长寿","02.jpg","cook_details?cid=2",0);
INSERT INTO cook_detail VALUES(03,2,"乳猪","色泽红润，皮酥肉嫩，肥而不腻，又鲜又嫩","色泽红润，形态完整，皮酥肉嫩，肥而不腻，又鲜又嫩，入口奇香。其烤制方法早在公元前成书的《礼记》中就有记载，周朝时烤猪(炮豚)是“八珍”之一。直到清朝灭亡前，烤全猪还是宫廷宴席中的“上上品","03.jpg","cook_details?cid=3",0);
INSERT INTO cook_detail VALUES(04,3,"南京盐水鸭","盐水鸭鸭皮白肉嫩、肥而不腻、香鲜味美","南京盐水鸭制作历史悠久，积累了丰富的制作经验。生产的盐水鸭鸭皮白肉嫩、肥而不腻、香鲜味美，具有香、酥、嫩的特点。而以中秋前后，桂花盛开季节制作的的盐水鸭色味最佳，名为桂花鸭","04.jpg","cook_details?cid=4",0);
INSERT INTO cook_detail VALUES(05,3,"家常豆腐","富有较高的蛋白质，有营养价值并具有医药功能的美味食品","家常豆腐，是一道以豆腐、猪肉作为主要食材，以豆瓣酱、白糖和酱油作为调料制作而成的老少皆宜的美味食品，酸甜苦辣皆宜，味道浓郁。其中含有铁、钙、磷、镁等人体必需的多种微量元素，还含有糖类、植物油和丰富的优质蛋白。菜品没有特别强的季节性，四季可食","05.jpg","cook_details?cid=5",0);
INSERT INTO cook_detail VALUES(06,4,"佛跳墙","骨头软，肉多","吃起来软嫩柔润，浓郁荤香，又荤而不腻；各料互为渗透，味中有味","06.jpg","cook_details?cid=6",0);
INSERT INTO cook_detail VALUES(07,4,"烤鱼","骨头软，肉多","吃起来软嫩柔润，浓郁荤香，又荤而不腻；各料互为渗透，味中有味","zhe.jpg","cook_details?cid=7",0);

/*菜系详情表_用料*/
CREATE TABLE cook_detail_material(
    mid         INT PRIMARY KEY AUTO_INCREMENT,
    cid         INT,
    material	VARCHAR(128),
    amount	VARCHAR(128)
);
INSERT INTO cook_detail_material VALUES(null,1,"排骨","500克");
INSERT INTO cook_detail_material VALUES(null,1,"蒜","适量");
INSERT INTO cook_detail_material VALUES(null,1,"姜","适量");
INSERT INTO cook_detail_material VALUES(null,1,"红椒","适量");
INSERT INTO cook_detail_material VALUES(null,1,"葱","少许");
INSERT INTO cook_detail_material VALUES(null,1,"黑豆豉","1汤匙(15g)");
INSERT INTO cook_detail_material VALUES(null,1,"料酒","1茶匙(5ml)");
INSERT INTO cook_detail_material VALUES(null,1,"生抽","1汤匙(15ml)");
INSERT INTO cook_detail_material VALUES(null,1,"盐","适量");
INSERT INTO cook_detail_material VALUES(null,1,"淀粉","一勺");
INSERT INTO cook_detail_material VALUES(null,1,"白糖","1汤匙(15g)");
INSERT INTO cook_detail_material VALUES(null,1,"油","1汤匙(15ml)");
/*菜系详情表_步骤*/
CREATE TABLE cook_detail_step(
    sid         INT PRIMARY KEY AUTO_INCREMENT,
    cid         INT,
    step_detail	VARCHAR(128),
    step_pic	VARCHAR(128),
    step_order	INT
);
INSERT INTO cook_detail_step VALUES(null,1,"用温水洗净,放盆中用冷水浸泡半小时。","paigu_step1.jpeg",1);
INSERT INTO cook_detail_step VALUES(null,1,"同时准备蒜末、姜末、葱花、黑豆豉碎、红椒切粒","paigu_step2.jpeg",2);
INSERT INTO cook_detail_step VALUES(null,1,"肋排捞出沥干水,再用厨房纸吸一下水分,放入搅拌用的大碗中。","paigu_step3.jpeg",3);
INSERT INTO cook_detail_step VALUES(null,1,"加料酒,生抽,白糖,盐","paigu_step4.jpeg",4);
INSERT INTO cook_detail_step VALUES(null,1,"加蚝油,陈皮丝","paigu_step5.jpeg",5);
INSERT INTO cook_detail_step VALUES(null,1,"加蒜末,姜末,白胡椒粉,豆豉碎","paigu_step6.jpeg",6);
INSERT INTO cook_detail_step VALUES(null,1,"用手抓匀,然后放冰箱冷藏腌制40分钟","paigu_step7.jpeg",7);
INSERT INTO cook_detail_step VALUES(null,1,"时间到取出肋排,放红椒粒,加淀粉和少许香油用手抓匀","paigu_step8.jpeg",8);
INSERT INTO cook_detail_step VALUES(null,1,"一定要让每一块排骨上都均匀的薄薄的裹上淀粉","paigu_step9.jpeg",9);
INSERT INTO cook_detail_step VALUES(null,1,"均匀放在在整蒸盘上，以免成熟度不一致","paigu_step10.jpeg",10);
INSERT INTO cook_detail_step VALUES(null,1,"蒸锅水烧开上汽,肋排放入,中火蒸45分钟","paigu_step11.jpeg",11);
INSERT INTO cook_detail_step VALUES(null,1,"出锅撒葱花","paigu_step12.jpeg",12);
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
    href	VARCHAR(128),
    display int
);
INSERT INTO cook_collect VALUES(null,01,01,01,"豉汁蒸排骨","骨头软，肉多","豉汁蒸排骨用的是肋排，这个部分的骨头一般比较软，肉多","01.jpg","cook_details?cid=1",1);
INSERT INTO cook_collect VALUES(null,02,02,02,"酸菜鱼","鱼肉鲜嫩，酸辣可口","酸菜鱼的主材鱼含丰富优质蛋白，人体消化吸收率可达96%，并能供给人体必需的氨基酸、矿物质、维生素A和维生素D；鱼的脂肪多为不饱和脂肪酸，能很好的降低胆固醇，可以防治动脉硬化、冠心病，因此，多吃鱼可以健康长寿","02.jpg","cook_details?cid=2",1);


/*用户评论表*/
CREATE TABLE cook_discuss(
    id		INT PRIMARY KEY AUTO_INCREMENT,
    uid		INT,
    cid		INT,
    date	VARCHAR(128) default "2019-8-28 19:59:58" ,
    content	VARCHAR(128)
);
INSERT INTO cook_discuss(id,uid,cid,content) VALUES(null,1,1,"这家常菜做得真好,步骤很详细,图片也拍得很诱人")
