const express=require("express");
const router=express.Router();
const pool=require("../pool");

router.get("/",(req,res)=>{
    // 参数
    // 当前用户登录id
    var uid=req.session.uid;
    if(!uid){
        res.send({code:-1,msg:"请先登录"})
        return;
    }
    // 获取参数
    var fid=req.query.fid;
    var cid=req.query.cid;
    var title=req.query.title;
    var subtitle=req.query.subtitle;
    var detail=req.query.detail;
    var pic=req.query.pic;
    var href=req.query.href;
    //查询指定菜系用户是否收藏过
    var sql ="SELECT id FROM cook_collect Where uid=? and cid=?"
    pool.query(sql,[uid,cid],(err,result)=>{
        if(err) throw err;
        //如果没有收藏过
        var sql=""
        if(result.length==0){//未收藏过 插入
            sql=`INSERT INTO cook_collect VALUES(null,${uid},${fid},${cid},${title},${subtitle},${detail},${pic},${href},)`;
            pool.query(sql,(err,result)=>{
                if(err) throw err;
                console.log(result)
                res.send.send({code:1,msg:"收藏成功"})
            })
        }
    })
})





module.exports=router;