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

router.get("/material", (req, res) => { 
    var cid = req.query.cid;
    
    if (cid !== undefined) { 
        var sql2 = "select * from cook_detail_material where cid=?";
        pool.query(sql2, [cid], (err, result) => { 
            if (err) throw err;
            res.send({ code: 1, msg: "查询成功", data_m: result})
            console.log(result);
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
            console.log(result);
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
            console.log(result)            
        })
    }
})

router.get("/addcomment", (req, res) => { 
    var uid = req.session.uid;
    if (!uid) { 
        res.send({ code: -1, msg: "未登录" })
        return;
    }
    var uname = req.query.uname;
    var cid = req.query.cid;
    var content = req.query.content;

    // var sql_uid = "select uid from cook_user where cid=${cid}";
    var sql = `insert into cook_discuss values(null,1,${uname},${cid},${content})`
    pool.query(sql, (err, result) => { 
        if (err) throw err;
        if (result.affectedRows > 0) {
            res.send({ code: 1, msg: "评论成功" })
        }    
    })
})
module.exports = router;