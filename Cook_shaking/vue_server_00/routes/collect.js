const express=require("express");
const router=express.Router();
const pool=require("../pool");

// 1.接收请求的方式GET 请求地址 /collect
router.get("/",(req,res)=>{
    var uid=req.session.uid;
  // 2.创建sql语句
      var sql ="SELECT * FROM cook_collect WHERE uid=?";
      // 3.通过连接池发送sql语句
      pool.query(sql,[uid],(err,result)=>{
          if(err) throw err;
        //   if(result.length>0){
              res.send(result)
        //   };
      })
  })

  module.exports=router;
