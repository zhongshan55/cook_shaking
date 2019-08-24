const express=require("express");
const router=express.Router();
const pool=require("../pool");

// 1.接收请求的方式GET 请求地址 /sichuan
router.get("/sichuan",(req,res)=>{
// 2.接收客户端两个参数
  //   pno  页码   pageSize 页大小
  var p=req.query.pno;
  var ps=req.query.pageSize;
// 3.设置参数默认值  pno:1  pageSize:4
  if(!p){p=1}
  if(!ps){ps=4}
// 4.创建变量 offset 计算数据库偏移量
  var offset=(p-1)*ps;
// 5.对pageSize转换整型? nodejs 报错
  ps=parseInt(ps);
// 6.创建sql语句
    var sql ="SELECT * FROM cook_detail WHERE fid=1 limit ?,?";
    // 7.通过连接池发送sql语句
    pool.query(sql,[offset,ps],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send(result)
        };
    })
})

// 2.接收请求的方式GET 请求地址 /yuecai
router.get("/yuecai",(req,res)=>{
  // 2.接收客户端两个参数
    //   pno  页码   pageSize 页大小
    var p=req.query.pno;
    var ps=req.query.pageSize;
  // 3.设置参数默认值  pno:1  pageSize:4
    if(!p){p=1}
    if(!ps){ps=4}
  // 4.创建变量 offset 计算数据库偏移量
    var offset=(p-1)*ps;
  // 5.对pageSize转换整型? nodejs 报错
    ps=parseInt(ps);
  // 6.创建sql语句
      var sql ="SELECT * FROM cook_detail WHERE fid=2 limit ?,?";
      // 7.通过连接池发送sql语句
      pool.query(sql,[offset,ps],(err,result)=>{
          if(err) throw err;
          if(result.length>0){
              res.send(result)
          };
      })
  })

module.exports=router;