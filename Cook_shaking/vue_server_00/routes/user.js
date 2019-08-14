const express=require("express");
//引入连接池模块
const pool=require("../pool");
//创建路由器对象
var router=express.Router();
//添加路由器

//登录 
router.get('/login',(req,res)=>{
    var uname=req.query.uname;
    var upwd=req.query.upwd;
    //查询sql语句
    var sql="SELECT uid FROM cook_user WHERE uname=? AND upwd=md5(?)";
   //json:{code:1,msg:"登录成功"}
   pool.query(sql,[uname,upwd],(err,result)=>{
       if(err) throw err;
        if(result.length==0){
            res.send({code:-1,msg:"用户名或密码有误"})
        }else{
             // //登录成功
            // 1.登录成功的凭据保存session  
            req.session.sessionid=result[0].uid;
            console.log(req.session);//打印查看session
            res.send({code:1,msg:"登录成功"})
        }
   })

});

module.exports=router;