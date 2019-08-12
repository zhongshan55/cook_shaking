const mysql = require('mysql');
var pool = mysql.createPool({
   host:"127.0.0.1",  //数据库地址
   user:"root",       //数据库用户名
   password:"",       //数据库密码
   port:3306,         //数据库端口
   database:"cook_shaking",     //数据库名称
   connectionLimit:15 //连接数量
});
//把创建好的连接池导出
module.exports = pool;