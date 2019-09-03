const express=require("express");
const router=express.Router();
const pool=require("../pool");

router.get("/",(req,res)=>{
  // 用promise方法封装第一步查询
    function pool1(){
   return new Promise( 
       function (resolve,reject){
      var sql="SELECT * FROM cook_index_detail";
      var list=[];
      pool.query(sql,[],(err,result)=>{
        if(err) {
            // throw err;
            reject(err);
        }
        if(result.length>0){
           list=result;
        //    results = JSON.stringify(result);//把result对象转为字符串，去掉RowDataPacket
        //    list = JSON.parse(results);//把results字符串转为json对象
        }   
        resolve(list);
    });
    })
    }

    var uid = req.session.uid;
    console.log(uid);
    // 当未登录时,查询出菜谱列表
    if(uid==undefined){
     var sql ="SELECT * FROM cook_index_detail";
      pool.query(sql,[],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:1,msg:"未登录,查询的菜谱收藏状态都为0",data:result}) }   
    });
 }else{
   //用户已登录是,获取第一步查询后的结果list,再进行第二步查询
     pool1().then(function (list){
        //  console.log(uid);
        //查询当前用户收藏列表中的所有菜谱id
           var sql="SELECT cid from cook_collect WHERE uid=?";
           pool.query(sql,[uid],(err,result)=>{
            if(err) throw err;
             if(result.length>0){
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
                console.log(list);
               res.send({code:2,msg:"被当前用户收藏的菜谱的收藏状态为1",data:list})
                }
           })
         
     }
     )
 }
     

})

module.exports=router;