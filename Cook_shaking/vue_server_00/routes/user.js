const express=require("express");
//引入连接池模块
const pool=require("../pool");
//创建路由器对象
var router=express.Router();
//引入md5-node 模块, 用于密码加密
var md5=require("md5-node");
//
const captcha=require("svg-captcha")
//添加路由器



//登录 
router.get('/login',(req,res)=>{
    var uname=req.query.uname;
    var upwd=req.query.upwd;
    //查询sql语句
    var sql="SELECT uid,user_name FROM cook_user WHERE uname=? AND upwd=md5(?)";
   //json:{code:1,msg:"登录成功"}
   pool.query(sql,[uname,upwd],(err,result)=>{
       if(err) throw err;
        if(result.length==0){
            res.send({code:-1,msg:"用户名或密码有误"})
        }else{
             // //登录成功
            // 1.登录成功的凭据保存session  
            req.session.uid=result[0].uid;
            // console.log(req.session);//打印查看session
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


//查看当前登录账号个人详情
router.get("/person",(req,res)=>{
    var uid=req.session.uid;
    console.log(uid);
    if(!uid){
        res.send({code:-1,msg:"请登录"})
    }else{
        var sql=`SELECT * FROM cook_user WHERE uid=${uid}`;
        pool.query(sql,(err,result)=>{
            if(err)  throw err;
            console.log(result);
            var data=result[0]
            res.send({code:1,msg:"查询用户信息成功",data:data});
        })
    }
})


//退出登录
router.get("/logout",(req,res)=>{
    req.session.uid=null;
    res.send({code:1,msg:"退出登录成功"}); 
})


//获取验证码
router.get('/captcha',(req,res)=>{
    const cap = captcha.create({
        size:4,    //验证码长度
        noise:1,   //干扰线条的数量
        color:"true",  //验证码的字符是否有颜色,默认没有.设置了背景颜色,默认有
        background:"#8a8a8a" ,//验证码背景颜色
        ignoreChars:'0o1i'   //验证码中忽略(排除)的字符
    });
    req.session.captcha = cap.text; // session 存储
    //console.log(cap.text);      //text:验证码文字
    // console.log(cap.data);     //data:  svg 路径(html片段)
    res.type('svg'); // 响应的类型
    res.send({img:cap.data,captcha:cap.text});
  });

module.exports=router;