const express=require("express");
//引入连接池模块
const pool=require("../pool");
//创建路由器对象
var router=express.Router();
//引入md5-node 模块, 用于密码加密
var md5=require("md5-node");
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

// 注册
router.get('/reg',(req,res)=>{
    //获取post请求数据
    var obj=req.query;
    //将密码通过md5进行加密
    obj.upwd=md5(obj.upwd);
    console.log(obj)
    //判断账号是否已注册过.
   var sql="SELECT uid FROM cook_user WHERE uname=?"
    pool.query(sql,[obj.uname],(err,result)=>{
        if(err) throw err;
        //账号已存在返回提示
        if(result!=0){
           res.send({code:-1,msg:"账号已注册"})
        }else{
            //账号未注册过,开始注册账号
            var reg_sql="INSERT INTO cook_user SET ?"
            pool.query(reg_sql,[obj],(err,result)=>{
                if(err) throw err;
                // console.log(result);
                if(result.affectedRows>0){
                    res.send({code:1,msg:"账号注册成功!"})
                }else{
                    res.send({code:0,msg:"账号注册失败,请重试"})
                }
            })
        }
    })
    
})



module.exports=router;