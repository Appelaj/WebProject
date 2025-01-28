const express = require('express'); 
const bodyParser = require("body-parser");
const router = express.Router(); 
const { matchesGlob } = require("path");
const db = require('../db');
const md5 = require('md5')
const cookie = require("cookie-parser");

router.use(cookie());

router.use(bodyParser.urlencoded({ extended: true }));
router.use(bodyParser.json());

router.get('/main', (req, res) => {
    
    const sql = "SELECT * FROM post AS p left JOIN users AS u ON p.UID = u.UID"


    db.query(sql, (err,results) => {
        if(err){
            console.log(err)
    
        }else{
            res.render('database/main', {'Information': results});
            console.log(results);
        }
    })

});



module.exports = router;