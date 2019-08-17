const express=require("express");
const router=express.Router();
const pool=require("../pool");

router.get("/",(req,res)=>{
    // 参数
    // 当前用户登录id
    var uid=req.session.uid;
    if(!uid){
        // uid = 1;
        res.send({code:-1,msg:"请先登录"})
        return;
    }
    // console.log(uid)
    // 获取参数
    var fid=parseInt(req.query.fid);
    var cid=parseInt(req.query.cid);
    var title=req.query.title;
    var subtitle=req.query.subtitle;
    var detail=req.query.detail;
    var pic=req.query.pic;
    var href=req.query.href;
    // console.log(req.query)
    //查询指定菜系用户是否收藏过
    var sql ="SELECT id FROM cook_collect Where uid=? AND cid=?";
    pool.query(sql,[uid,cid],(err,result)=>{
        if(err) throw err;
        // console.log(result);
        //如果没有收藏过
        if(result.length==0){//未收藏过 插入
            sql=`INSERT INTO cook_collect VALUES(null,${uid},${fid},${cid},'${title}','${subtitle}','${detail}','${pic}','${href}')`;
            pool.query(sql,(err,result)=>{
                if(err) throw err;
                res.send({code:1,msg:"收藏成功"})
            })
        }else{  //已收藏
            res.send({code:-2,msg:"已在收藏夹里"})
        }
        
        
    })
})

//http://127.0.0.1:3000/addcollect?uid=01%fid=02&cid=02&title=yu&subtitle=hahah&detail=xixixi&pic=01.jpg&href=hadfsd



module.exports=router;