
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
INSERT INTO cook_index_detail VALUES(null,01,1,"排骨","骨头软，肉多","豉汁蒸排骨用的是肋排，这个部分的骨头一般比较软，肉多","01.jpg","cook_details?cid=1","collect_active.png","collect.png",0);
INSERT INTO cook_index_detail VALUES(null,08,1,"豉汁蒸排骨","骨头软，肉多","豉汁蒸排骨用的是肋排，这个部分的骨头一般比较软，肉多","paigu.png","cook_details?cid=8","collect_active.png","collect.png",0);
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
INSERT INTO cook_detail VALUES(09,1,"南京盐水鸭","盐水鸭鸭皮白肉嫩、肥而不腻、香鲜味美","南京盐水鸭制作历史悠久，积累了丰富的制作经验。生产的盐水鸭鸭皮白肉嫩、肥而不腻、香鲜味美，具有香、酥、嫩的特点。而以中秋前后，桂花盛开季节制作的的盐水鸭色味最佳，名为桂花鸭","doufu.png","cook_details?cid=4",0);
INSERT INTO cook_detail VALUES(05,3,"家常豆腐","富有较高的蛋白质，有营养价值并具有医药功能的美味食品","家常豆腐，是一道以豆腐、猪肉作为主要食材，以豆瓣酱、白糖和酱油作为调料制作而成的老少皆宜的美味食品，酸甜苦辣皆宜，味道浓郁。其中含有铁、钙、磷、镁等人体必需的多种微量元素，还含有糖类、植物油和丰富的优质蛋白。菜品没有特别强的季节性，四季可食","05.jpg","cook_details?cid=5",0);
INSERT INTO cook_detail VALUES(10,1,"家常豆腐","富有较高的蛋白质，有营养价值并具有医药功能的美味食品","家常豆腐，是一道以豆腐、猪肉作为主要食材，以豆瓣酱、白糖和酱油作为调料制作而成的老少皆宜的美味食品，酸甜苦辣皆宜，味道浓郁。其中含有铁、钙、磷、镁等人体必需的多种微量元素，还含有糖类、植物油和丰富的优质蛋白。菜品没有特别强的季节性，四季可食","ya.png","cook_details?cid=5",0);
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

INSERT INTO cook_detail_material VALUES(null,2,"草鱼","一条4-5斤");
INSERT INTO cook_detail_material VALUES(null,2,"花椒","适量");
INSERT INTO cook_detail_material VALUES(null,2,"酸菜","2棵");
INSERT INTO cook_detail_material VALUES(null,2,"料酒","适量");
INSERT INTO cook_detail_material VALUES(null,2,"盐","适量");
INSERT INTO cook_detail_material VALUES(null,2,"胡椒粉","适量");
INSERT INTO cook_detail_material VALUES(null,2,"蛋清","2个");
INSERT INTO cook_detail_material VALUES(null,2,"白砂糖","适量");
INSERT INTO cook_detail_material VALUES(null,2,"红辣子","适量");
INSERT INTO cook_detail_material VALUES(null,2,"姜末","适量");
INSERT INTO cook_detail_material VALUES(null,2,"蒜蓉","适量");
INSERT INTO cook_detail_material VALUES(null,2,"玉米油","适量");

INSERT INTO cook_detail_material VALUES(null,3,"乳猪","1只");
INSERT INTO cook_detail_material VALUES(null,3,"五香粉","适量");
INSERT INTO cook_detail_material VALUES(null,3,"食盐","适量");
INSERT INTO cook_detail_material VALUES(null,3,"白砂糖","适量");
INSERT INTO cook_detail_material VALUES(null,3,"花生油","适量");
INSERT INTO cook_detail_material VALUES(null,3,"醋","适量");
INSERT INTO cook_detail_material VALUES(null,3,"葱","适量");
INSERT INTO cook_detail_material VALUES(null,3,"蒜泥","适量");
INSERT INTO cook_detail_material VALUES(null,3,"甜面酱","适量");
INSERT INTO cook_detail_material VALUES(null,3,"麦芽糖","适量");
INSERT INTO cook_detail_material VALUES(null,3,"白醋","适量");
INSERT INTO cook_detail_material VALUES(null,3,"江米酒","适量");
INSERT INTO cook_detail_material VALUES(null,3,"绵白糖","适量");
INSERT INTO cook_detail_material VALUES(null,3,"黄酱","适量");
INSERT INTO cook_detail_material VALUES(null,3,"腐乳","适量");
INSERT INTO cook_detail_material VALUES(null,3,"芝麻酱","适量");
INSERT INTO cook_detail_material VALUES(null,3,"甜菜根","适量");
INSERT INTO cook_detail_material VALUES(null,3,"白酒","适量");

INSERT INTO cook_detail_material VALUES(null,4,"鸭肉","1500克");
INSERT INTO cook_detail_material VALUES(null,4,"食盐","适量");
INSERT INTO cook_detail_material VALUES(null,4,"葱","适量");
INSERT INTO cook_detail_material VALUES(null,4,"姜","适量");
INSERT INTO cook_detail_material VALUES(null,4,"八角","适量");
INSERT INTO cook_detail_material VALUES(null,4,"花椒","适量");
INSERT INTO cook_detail_material VALUES(null,4,"料酒","适量");
INSERT INTO cook_detail_material VALUES(null,4,"植物油","适量");

INSERT INTO cook_detail_material VALUES(null,5,"水豆腐","3块");
INSERT INTO cook_detail_material VALUES(null,5,"泡发木耳","50克");
INSERT INTO cook_detail_material VALUES(null,5,"辣椒","4个");
INSERT INTO cook_detail_material VALUES(null,5,"蒜苗","1根");
INSERT INTO cook_detail_material VALUES(null,5,"花生油","适量");
INSERT INTO cook_detail_material VALUES(null,5,"盐","适量");
INSERT INTO cook_detail_material VALUES(null,5,"生抽","适量");
INSERT INTO cook_detail_material VALUES(null,5,"老抽","适量");
INSERT INTO cook_detail_material VALUES(null,5,"香醋","适量");
INSERT INTO cook_detail_material VALUES(null,5,"白砂糖","适量");
INSERT INTO cook_detail_material VALUES(null,5,"蚝油","适量");
INSERT INTO cook_detail_material VALUES(null,5,"清水","适量");


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

INSERT INTO cook_detail_step VALUES(null,2,"备料:草鱼, 4-5斤左右,买鱼时让鱼贩顺便杀鱼起肉(图一) ,鱼头开两边,鱼骨鱼腹切段,你说要做水煮鱼他们就知道怎么杀,最好让他们将鱼腹的黑膜也去掉,不然回来自己也要将黑膜刮掉。","suancaiyu_step1.jpeg",1);
INSERT INTO cook_detail_step VALUES(null,2,"配料：酸菜切块,蒜蓉,姜末,香菜碎,绿色花椒,红辣子段,泡椒","suancaiyu_step2.jpeg",2);
INSERT INTO cook_detail_step VALUES(null,2,"鱼肉切片,鱼肉两面都擦干水","suancaiyu_step3.jpeg",3);
INSERT INTO cook_detail_step VALUES(null,2,"腌制：鱼头鱼骨鱼腹装一盆,加盐,少许胡椒粉和料酒拌匀;鱼片装一盆,加盐,少许胡椒粉,两个蛋清,都要更嫩点,加点淀粉水,搅匀","suancaiyu_step4.jpeg",4);
INSERT INTO cook_detail_step VALUES(null,2,"鱼头鱼骨腌15分钟后,锅里下油,将鱼头鱼骨鱼尾煎至两面金黄色,上锅备用,如图五。","suancaiyu_step5.jpeg",5);
INSERT INTO cook_detail_step VALUES(null,2,"用一半的姜末和蒜蓉爆香,油尽量多放,倒入酸菜,炒出;香味,将泡椒放入翻炒,然后再将煎好的鱼头鱼骨之类倒进去,倒入泡椒水,再加大量清水,加1/3碗料酒,加入剩下的姜蒜的一半,盖上锅盖,如图6。","suancaiyu_step6.jpeg",6);
INSERT INTO cook_detail_step VALUES(null,2,"大火煮开,小火炖20分钟左右","suancaiyu_step7.jpeg",7);
INSERT INTO cook_detail_step VALUES(null,2,"鱼肉表面铺上剩下的姜末蒜蓉香菜末,大火烧锅,加大量的油,油温能让筷子起大泡泡时加入花椒和红辣子,炸一下, 10来秒左右(图八) ,立刻整锅均匀淋上鱼肉表面,即可。","suancaiyu_step8.jpeg",8);
INSERT INTO cook_detail_step VALUES(null,2,"加点香菜叶子装饰,然后就可以准备几碗白饭了。","suancaiyu_step9.jpeg",9);

INSERT INTO cook_detail_step VALUES(null,3,"五香精盐涂猪腔（乳猪） 腌30分钟，豆酱、腐乳、麻酱、汾酒、蒜泥、白糖25克拌匀涂猪腔20分钟，用烧叉从臂部插入至腮部，上叉后将猪头向上斜放，清水冲洗油污后沸水淋遍猪皮，涂糖醋；","ruzhu_step.jpg",1);
INSERT INTO cook_detail_step VALUES(null,3,"将木炭放入烤炉点燃，乳猪上炉用小火烤15分钟，至猪皮呈大红时离火；将烤好的乳猪皮去片，放在盘中，把猪皮放在猪身上，涮上熟花生油，千层饼、酸甜菜、葱球、甜面酱和白糖分盛两碟上桌。","ruzhu_step.jpg",2);

INSERT INTO cook_detail_step VALUES(null,4,"将嫩光鸭斩去小翅和鸭脚掌，再在右翅窝下开约3厘米长的小口，从刀口处取出内脏、拉出气管和食管，用清水冲净，滤干备用。","04.jpg",1);
INSERT INTO cook_detail_step VALUES(null,4,"将炒锅放在火上放入盐、花椒炒热后备用。","04.jpg",2);
INSERT INTO cook_detail_step VALUES(null,4,"用1/2炒热的椒盐从翅下刀口处塞入鸭腹，晃匀，用剩下椒盐的1/2热椒盐擦遍鸭身，再用余下的热椒盐从颈部刀口和鸭嘴塞入鸭颈，然后将鸭放入缸中腌制(夏天2小时，春秋季4小时，冬季6小时)。然后取出挂在通风凉处吹干，用12厘米长的空心芦管插入鸭子肛门内，在翅窝下刀口处放入姜1片、葱结1个、八角1只。","04.jpg",3);
INSERT INTO cook_detail_step VALUES(null,4,"烧滚6杯清水，放入生姜2片、葱结1个、八角1只和料酒，将鸭腿朝上，鸭头朝下放入锅内，盖上锅盖，放在小火上焖20分钟。","04.jpg",4);
INSERT INTO cook_detail_step VALUES(null,4,"将鸭拎起，使鸭腹内的汤汁从刀口处漏出，滤干倒入锅内。","04.jpg",5);
INSERT INTO cook_detail_step VALUES(null,4,"将鸭放入汤中，使鸭腹内灌入热汤，再放在小火上焖20分钟取出，抽出芦管，放入容器内冷却后。装碟即可。","04.jpg",6);

INSERT INTO cook_detail_step VALUES(null,5,"食材准备，豆腐放盐水里浸泡半小时","doufu_step1.jpg",1);
INSERT INTO cook_detail_step VALUES(null,5,"每块豆腐切四刀，呈米字状","doufu_step2.jpg",2);
INSERT INTO cook_detail_step VALUES(null,5,"辣椒切碎，蒜苗切段","doufu_step3.jpg",3);
INSERT INTO cook_detail_step VALUES(null,5,"碗里放入盐、白糖、生抽、老抽、蚝油、香醋、清水，搅拌均匀，调成料汁","doufu_step4.jpg",4);
INSERT INTO cook_detail_step VALUES(null,5,"
起油锅，倒入豆腐块，中火煎至表面微黄","doufu_step5.jpg",5);
INSERT INTO cook_detail_step VALUES(null,5,"放入大蒜梗、辣椒碎煸香","doufu_step6.jpg",6);
INSERT INTO cook_detail_step VALUES(null,5,"放入木耳炒匀","doufu_step7.jpg",7);
INSERT INTO cook_detail_step VALUES(null,5,"
淋入料汁烧入味","doufu_step8.jpg",8);
INSERT INTO cook_detail_step VALUES(null,5,"放入大蒜叶子炒至断生，即可出锅","doufu_step9.jpg",9);

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
    uname   VARCHAR(50),	
    cid		INT,
    content	VARCHAR(128)
);
INSERT INTO cook_discuss VALUES(null,1,"tom",1,"这家常菜做得真好,步骤很详细,图片也拍得很诱人")
