//vue_server_00/app.js node程序
//1:加载第三方模块
//web服务器
const express = require("express");
//mysql驱动
const mysql = require("mysql");
//跨域
const cors = require("cors");
//session
const session = require("express-session");


//  引入

                                          //  引入
const home=require("./routes/home");//首页热门菜系
const carousel=require("./routes/carousel");//首页轮播图
const addcollect=require("./routes/addcollect");

const userRouter=require("./routes/user");//引入登录/注册的路由器

const sort=require("./routes/sort"); //引入分类路由器
const collect=require("./routes/collect"); //引入分类路由器




//2:配置数据库连接池:提高数据效率
// var pool = mysql.createPool({
//    host:"127.0.0.1",  //数据库地址
//    user:"root",       //数据库用户名
//    password:"",       //数据库密码
//    port:3306,         //数据库端口
//    database:"cook_shaking",     //数据库名称
//    connectionLimit:15 //连接数量
// });

var server = express();
//3:配置跨域模块 50
server.use(cors({
//   //允许跨域访问程序地址列表
   origin:["http://127.0.0.1:8080",
   "http://localhost:8080"],
   credentials:true //请求验证
}))
//4:配置session模块
server.use(session({
 secret:"128位字符串",  //安全字符串
 resave:true,          //请求时更新数据
 saveUninitialized:true//保存初始数据
}));
//4.1:配置项目静态目录
server.use(express.static("public"));
//http://127.0.0.1:3000/01.jpg
//5:启动监听3000
server.listen(3000);


/*使用路由器来管理路由*/

                              /*使用路由器来管理路由*/
server.use("/home",home);//首页热门菜系路由
server.use("/carousel",carousel);//首页轮播图路由
server.use("/addcollect",addcollect);

server.use("/user",userRouter);  //使用登录/注册的路由器

server.use("/sort",sort); //分类路由
server.use("/collect",collect); //收藏路由




