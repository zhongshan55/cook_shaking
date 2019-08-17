const express=require("express");
const router=express.Router();
const pool=require("../pool");

router.get("/",(req,res)=>{
    var sql="SELECT fid,pic,href FROM cook_index_carousel";
    pool.query(sql,[],(err,result)=>{
        if(err) throw err;
        if(result.length>0) {
            res.send({code:1,data:result})
        }
    })
})

module.exports=router;