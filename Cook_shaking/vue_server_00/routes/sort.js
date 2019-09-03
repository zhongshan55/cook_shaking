const express=require("express");
const router=express.Router();
const pool=require("../pool");







// 1.接收请求的方式GET 请求地址 /sichuan
router.get("/sichuan",(req,res)=>{
   var fid=req.query.fid;
  //  console.log("fid1:"+fid);
 // 用promise方法封装第一步查询
 function pool1(){
  return new Promise( 
      function (resolve,reject){
     var sql="SELECT * FROM cook_detail WHERE fid=?";
     var list=[];
    //  console.log("fid:"+fid)
     pool.query(sql,[fid],(err,result)=>{
       if(err) {
           // throw err;
           reject(err);
       }
          list=result;
       resolve(list);
   });
   })
   }

// 2.接收客户端两个参数
  var uid=req.session.uid;
// 6.创建sql语句
if(uid==undefined){
  var sql ="SELECT * FROM cook_detail WHERE fid=? "

  // 7.通过连接池发送sql语句
  pool.query(sql,[fid], (err,result)=>{
      if(err) throw err;
      if(result.length>0){
          res.send({code:1,msg:"未登录,查询的菜谱收藏状态都为0",data:result})
      };
  })
}else{
  //用户已登录是,获取第一步查询后的结果list,再进行第二步查询
    pool1().then(function (list){
       //  console.log(uid);
       //查询当前用户收藏列表中的所有菜谱id
          var sql="SELECT cid from cook_collect WHERE fid=? and uid=?";
          pool.query(sql,[fid,uid],(err,result)=>{
           if(err) throw err;
      
             var ids=result;
           //   console.log(ids);
             for(var i=0;i<list.length;i++){  //循环遍历首页的每个菜谱
                for(var j=0; j<ids.length;j++){    //与收藏中的每一个菜谱id进行比较
                  if(list[i].cid==ids[j].cid){  //如果存在想等,将i.collect_status改为1
                     list[i].collect_status=1;
                   //    console.log(list[i].collect_status);
                     }
                   }
               }
               console.log("分类list"+list);
              res.send({code:2,msg:"被当前用户收藏的菜谱的收藏状态为1",data:list})
              
          })
        
    }
    )
}


})

// 2.接收请求的方式GET 请求地址 /yuecai
router.get("/yuecai",(req,res)=>{
  function pool1(){
    return new Promise( 
        function (resolve,reject){
       var sql="SELECT * FROM cook_detail WHERE fid=1";
       var list=[];
       pool.query(sql,[],(err,result)=>{
         if(err) {
             // throw err;
             reject(err);
         }
            list=result;
         resolve(list);
     });
     })
     }



})



// router.get("/yuecai",(req,res)=>{
//   // 2.接收客户端两个参数
//     //   pno  页码   pageSize 页大小
//     var p=req.query.pno;
//     var ps=req.query.pageSize;
//   // 3.设置参数默认值  pno:1  pageSize:4
//     if(!p){p=1}
//     if(!ps){ps=4}
//   // 4.创建变量 offset 计算数据库偏移量
//     var offset=(p-1)*ps;
//   // 5.对pageSize转换整型? nodejs 报错
//     ps=parseInt(ps);
//   // 6.创建sql语句
//       var sql ="SELECT * FROM cook_detail WHERE fid=2 limit ?,?";
//       // 7.通过连接池发送sql语句
//       pool.query(sql,[offset,ps],(err,result)=>{
//           if(err) throw err;
//           if(result.length>0){
//               res.send(result)
//           };
//       })
//   })

module.exports=router;