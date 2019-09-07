const express = require("express");
const router = express.Router();
const pool = require("../pool");

router.get("/", (req, res) => {
    var cid = req.query.cid;
    if (cid !== undefined) { 
        var sql1 = "select * from cook_detail where cid=? ";
        pool.query(sql1,[cid], (err, result) => { 
            if (err) throw err;
            res.send({ code: 1, msg: "查询成功", data: result[0] });
            console.log(result)
        })
    }
})        

router.get("/family", (req, res) => { 
    var cid = req.query.cid;
    if (cid !== undefined) { 
        var sql1 = "select * from cook_detail where cid=? ";
        pool.query(sql1,[cid], (err, result) => { 
            if (err) throw err;
            
            console.log(result)
            var fid = result[0].fid;
            console.log(fid)
            var sql = "select *from cook_family where fid=?";
            pool.query(sql, [fid], (err, result) => { 
                if (err) throw err;
                res.send({ code: 1, msg: "查询成功", data: result[0] });
                var fname = result[0].fname;
                console.log(fname);
            })
        })
    }
})

router.get("/material", (req, res) => { 
    var cid = req.query.cid;
    
    if (cid !== undefined) { 
        var sql2 = "select * from cook_detail_material where cid=?";
        pool.query(sql2, [cid], (err, result) => { 
            if (err) throw err;
            res.send({ code: 1, msg: "查询成功", data_m: result})
            // console.log(result);`    
            
        })
    }
})

router.get("/step", (req, res) => { 
    var cid = req.query.cid;
    if (cid !== undefined) { 
        var sql3 = "select * from cook_detail_step where cid=?";
        pool.query(sql3, [cid], (err, result) => { 
            if (err) throw err;
            res.send({ code: 1, msg: "查询成功", data_s: result })
            // console.log(result);
        })
    }
})

router.get("/comment", (req, res) => { 
    var cid = req.query.cid;
    if (cid !== undefined) { 
        var sql4 = "select * from cook_discuss where cid=?";
        pool.query(sql4, [cid], (err, result) => { 
            if (err) throw err;
            res.send({ code: 1, msg: "查询成功", data_c: result })
            // console.log(result)            
        })
    }
})

router.get("/addcomment", (req, res) => { 
    // console.log(session)
    var uid = req.session.uid;
    var uname = req.session.uname;
    // if (!uid) { 
    //     res.send({ code: -1, msg: "未登录" })
    //     return;
    // }
    // var uname = req.query.uname;
    var cid = req.query.cid;
    var content = req.query.content;
    console.log(uid);
    console.log(uname);
    console.log(cid);
    console.log(content);


    
    
    var sql = `insert into cook_discuss values (null,?,?,?,?)`;
    pool.query(sql,[uid,uname,cid,content] ,(err, result) => { 
        if (err) throw err;
        if (result.affectedRows > 0) {
            res.send({ code: 1, msg: "评论成功" })
        }    
    })
})

router.get("/collect", (req, res) => { 
    var uid = req.session.uid;
    var cid = req.query.cid;
    console.log(cid);
    if (uid != undefined) {
        var sql = "select * from cook_collect where uid=? and cid=?";
        pool.query(sql, [uid, cid], (err, result) => {
            if (err) throw err;
            if (result.length > 0) {
                res.send({ code: 1, msg: "已收藏" })
            } else {
                res.send({ code: -1, msg: "未收藏" })
            }
        })
    } else { 
        res.send({code:0,msg:"未登录"})
    }
})
module.exports=router;