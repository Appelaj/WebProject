const express = require('express'); 
const bodyParser = require("body-parser");
const router = express.Router(); 
const { matchesGlob } = require("path");
const db = require('../db');
const md5 = require('md5')
const cookie = require("cookie-parser");
const moment = require('moment');
const { ifError } = require('assert');
// const { pid } = require('process');

// const fileupload = require('express-fileupload');



router.use(cookie());

router.use(bodyParser.urlencoded({ extended: true }));
router.use(bodyParser.json());

// let PID ;
// const query_pid = " SELECT PID FROM post ORDER BY PID DESC LIMIT 1"
// db.query(query_pid,  (err, results) =>{
//     if(err){
//         console.log(err)
//     }else{
//         // console.log(results)
//         PID = parseInt(Object.values(results[0]))
//     }
// })

// console.log(PID)



router.post('/upload', (req, res) => {
    // req.file contains the uploaded file details
    // req.body contains other form data if any
    res.send('File uploaded successfully');
  });


router.get('/login', (req, res) => {
    res.render('member/login')
});

router.get('/register', (req, res) => {
    res.render('member/register')
});

router.get('/create', (req, res) => {
    const username = req.cookies.username;
    res.render('member/create_post', {username : username})
});

router.post('/comment', (req, res) => {
    const {comment} = req.body
    const sql10 = "INSERT INTO comments(PID, body, UID, Comment_Date, Comment_Time) VALUE (?,?,?,?,?)"
    const sql = " SELECT p.PID, p.title, p.UID, p.created_time, p.created_date, p.body_text, u.username FROM post AS p  LEFT JOIN users AS u ON p.UID = u.UID ORDER BY RAND() ; "
    const sql2 = "SELECT p.PID, p.title, p.UID, p.created_time, p.created_date, p.body_text, u.username, m.`path` FROM post AS p   LEFT JOIN users AS u  ON p.UID = u.UID  LEFT JOIN media AS m ON p.PID = m.PID WHERE p.PID = ?"
    const sql3 = "SELECT PID FROM post ORDER BY PID DESC LIMIT 1 ;"
    const sql4 = "SELECT c.PID, c.body, c.Comment_Date, c.Comment_Time, u.username, c.UID FROM comments AS c LEFT JOIN post AS p ON p.PID = c.PID LEFT JOIN users AS u ON c.UID = u.UID WHERE c.PID = ? ;"
    const UID = parseInt(req.query.UID)
    const PID = parseInt(req.query.PID)
    const username = req.cookies.username;
    const DTime = moment().format();
    console.log("comment :",comment)
    console.log('UID :',UID)
    console.log('PID',PID)
    db.query(sql10,[PID, comment, UID, DTime, DTime], (err,results) =>{
        if(err){
            console.log(err)
            res.redirect('/member/member')
        }else{
            db.query(sql, (err, results) =>{
                if(err){
                    console.log(err)
                }else{
                    // console.log(results)
                    // res.render('member/member', {information : results , username: username} )
                    const par1 = results
                    db.query(sql3, (err,results) =>{
                        if(err){
                            console.log(err)
                        }else{
                            const lastest_post = parseInt(Object.values(results[0]))
                            db.query(sql2, PID, (err, results) =>{
                                if(err){
                                    console.log(err)
                                }else{
                                    const Post_results = results
                                db.query(sql4, PID, (err, results) => {
                                    if(err){
                                        console.log(err)
                                        res.redirect('/member/post')
                                    }else{
                                        // console.log(results)
                                        // console.log(results.length)
                                        res.render('member/post', {information : par1 , username: username, post: Post_results
                                            , UID: UID, PID: PID, comment: results} )
                                            
                                    }
                                })
                                }
                            })
                        }
                    })
                    
                }
            })
        }
    })
});

router.get('/password_change', (req, res) => {
    
    // console.log(req.query)   
    console.log(Object.values(req.query))
    res.render('member/change_password', {UID : Object.values(req.query)})
});

router.post('/password_change_verify', (req, res) => {
    const {oldPassword, newPassword} = req.body
    const sql = "UPDATE users SET password = ? WHERE UID = ?;"
    const sql2 = "SELECT * FROM users WHERE UID = ? AND PASSWORD = ?;"
    const UID = Object.values(req.query)
    // console.log("New password :", newPassword)
    // console.log("Old password:", oldPassword)
    console.log(UID[0])
    db.query(sql2,[UID[0], md5(oldPassword)], (err,results) => {
        if(err){
            console.log(err)
            res.render('member/change_password', {UID : Object.values(req.query), msg: 'Error Plese try again'})
        }else{
            if(results.length == 0){
                res.render('member/change_password', {UID : Object.values(req.query), msg: 'Old Password not match'})
            }else{
                db.query(sql, [md5(newPassword), UID[0]], (err,results) =>{
                    if(err){
                        console.log(err)
                        res.render('member/change_password', {UID : Object.values(req.query), msg: 'Error Plese try again'})
                    }else{
                        res.redirect('login')
                    }
                })
            }
        }
    } )
});

router.get('/change', (req, res) => {
    
    // console.log(req.query)
    // console.log(Object.values(req.query))
    res.render('member/change_username', {UID : Object.values(req.query)})
});

router.post('/change_verify', (req, res) => {
    const {username, password} = req.body
    const sql = "UPDATE users SET username = ? WHERE UID = ?;"
    const sql2 = "SELECT * FROM users WHERE UID = ? AND PASSWORD = ?;"
    const UID = Object.values(req.query)
    console.log("New Username :", username)
    console.log("password:", password)
    console.log(UID[0])
    db.query(sql2,[UID[0], md5(password)], (err,results) => {
        if(err){
            console.log(err)
            res.render('member/change_username', {UID : Object.values(req.query), msg: 'Error Plese try again'})
        }else{
            if(results.length == 0){
                res.render('member/change_username', {UID : Object.values(req.query), msg: 'Password not match'})
            }else{
                db.query(sql, [username, UID[0]], (err,results) =>{
                    if(err){
                        console.log(err)
                        res.render('member/change_username', {UID : Object.values(req.query), msg: 'Error Plese try again'})
                    }else{
                        res.clearCookie('username')
                        res.cookie('username', username)
                        res.redirect('member')
                    }
                })
            }
        }
    } )
});

router.post('/verify', (req, res) => {
    const {username, password} = req.body
    const sql = "SELECT * FROM users WHERE username = ? and password  = ? "

    db.query(sql, [username, md5(password)], (err,results) => {
        if(err){
            console.log(err)
            res.render('member/login')
        }else{
            if(results.length == 0){
                res.render('member/login', {msg : 'Wrong Username or Password'})
            }else{
                // res.cookie('username', username, { maxAge: 900000});
                res.cookie('username', username)
                res.cookie('UID', results[0].UID)
                console.log('UID :',results[0].UID)
                res.redirect('member')
            }
        }
    })
});

router.post('/registering', (req, res) => {
    const {username, password, re_password} = req.body
    const sql = " INSERT INTO users(username, password) VALUES(? , ?) "
    if (password == re_password){
        db.query(sql, [username, md5(password)], (err,results) => {
            if(err){
                console.log(err)
                res.render('member/register')
            }else{
                res.render('member/login')
            }
        })
    }else{
        res.render('member/register', {msg : 'your password not match'})
    }


});


router.post('/creating', (req, res) =>{
    const {title, body} = req.body
    const username = req.cookies.username;
    const DTime = moment().format();
    const query = " SELECT UID FROM users WHERE username = ?"
    const sql = " INSERT INTO post (PID, title, UID, created_time,created_date, body_text) VALUES (NULL, ?, ?, ?,?,?)"
    
    const directory = [];
    if(req.files){
        const input = req.files.file
        // console.log(input)
        if(input.length > 1){

            for(let i = 0 ; i < input.length; i++){
                const time = new Date(moment().format())
                const date = time.getDate()
                const month = time.getMonth()+1
                const year = time.getFullYear()
                const time_string = time.getTime()
                const Filename = `static/upload/${month}_${date}_${year}_${time_string}_${input[i].name}`
                const address = `../upload/${month}_${date}_${year}_${time_string}_${input[i].name}`
                directory[i] = address;
                // console.log(Filename)
                input[i].mv(Filename, function (err){

                    if(err){

                        res.send(err);

                    }else{
                        console.log('upload file is sucessfuly')
                    }

                })
            }
        }else{
            const file = req.files.file 
            const Name = req.files.file.name 
            const time = new Date(DTime)
            const date = time.getDate()
            const month = time.getMonth()+1
            const year = time.getFullYear()
            const time_string = time.getTime()
            const Filename = `static/upload/${month}_${date}_${year}_${time_string}_${Name}`
            const address = `../upload/${month}_${date}_${year}_${time_string}_${Name}`
            directory[0] = address;
            // console.log(Filename)
            file.mv(Filename, err =>{
                if (err){
                    console.log(err)
                }else{
                    console.log('upload file is sucessfuly')
                }
            })

        }
    }else{
        console.log('no file upload')
    }

    console.log(directory)

    db.query(query, [username], (err, results) => {
        if(err){
            console.log(err)
            res.redirect('/member/create')
        }else{
            // console.log(results)
            const UID = Object.values(results[0])
            // console.log(UID)
            db.query(sql, [title, UID, DTime, DTime, body], (err, results) =>{
                if(err){
                    console.log(err)
                }else{
                    // console.log('succeed')
                    if(directory){
                        const query_pid = " SELECT PID FROM post ORDER BY PID DESC LIMIT 1"
                    
                        db.query(query_pid,  (err, results) => {
                            if(err){
                                console.log(err)
                            
                            }else{
                                const pid = parseInt(Object.values(results[0]))
                                console.log('pid = ',pid)
                                // console.log(typeof(pid))
                                const insert_path = " INSERT INTO media (PID, path) VALUES (?,?)"
                
                                for(let i = 0; i < directory.length; i++){
                                    db.query(insert_path, [pid , directory[i]],  (err, results) => {
                                        if(err){
                                            console.log(err)
                                        
                                        }else{
                                            // console.log(results)
                                            
                                        }
                                    })
                                }
                            }
                        })
                    }
                    res.redirect('member')
                }
            })
        }
    })

    // if(directory){
    //     const query_pid = " SELECT PID FROM post ORDER BY PID DESC LIMIT 1"
    
    //     db.query(query_pid,  (err, results) => {
    //         if(err){
    //             console.log(err)
            
    //         }else{
    //             const pid = parseInt(Object.values(results[0]))
    //             console.log('pid = ',pid)
    //             console.log(typeof(pid))
    //             const insert_path = " INSERT INTO media (PID, path) VALUES (?,?)"

    //             for(let i = 0; i < directory.length; i++){
    //                 db.query(insert_path, [pid , directory[0]],  (err, results) => {
    //                     if(err){
    //                         console.log(err)
                        
    //                     }else{
    //                         // console.log(results)
                            
    //                     }
    //                 })
    //             }
    //         }
    //     })
    // }


});

// router.get('/member', (req, res) =>{
//     const username = req.cookies.username;
//     if(username){
//         res.render('member/member', {username: username})

//     }else{
//         res.redirect('/member/login')
//     }
// });

router.get('/your_post', (req, res) =>{
    const username = req.cookies.username;
    const UID = req.cookies.UID;
    const sql1 = " SELECT p.PID, p.title, p.UID, p.created_time, p.created_date, p.body_text, u.username FROM post AS p  LEFT JOIN users AS u ON p.UID = u.UID ORDER BY RAND() ; "
    const sql2 = " SELECT p.PID, p.title, p.UID, p.created_time, p.created_date, p.body_text, u.username FROM post AS p  LEFT JOIN users AS u ON p.UID = u.UID WHERE p.UID = ? ; "
    if(username){

        db.query(sql1, (err, results) =>{
            if(err){
                console.log(err)
            }else{
                // console.log(results)
                const par1 = results
                
                db.query(sql2, UID, (err,results ) =>{
                    if(err){
                        console.log(err)
                    }else{
                        // console.log(results)
                        res.render('member/your_post', {information : par1 , username: username, UID: UID, yourpost: results});
                    }
                })
            }
        })
        // res.render('member/member', {username: username} )

    }else{
        res.redirect('/member/login')
    }
    
})

router.get('/member', (req, res) =>{
    const username = req.cookies.username;
    const UID = req.cookies.UID;
    const sql = " SELECT p.PID, p.title, p.UID, p.created_time, p.created_date, p.body_text, u.username FROM post AS p  LEFT JOIN users AS u ON p.UID = u.UID ORDER BY RAND() ; "
    
    if(username){

        db.query(sql, (err, results) =>{
            if(err){
                console.log(err)
            }else{
                // console.log(results)
                const par1 = results
                 res.render('member/member', {information : par1 , username: username, UID: UID} )
            }
        })
        // res.render('member/member', {username: username} )

    }else{
        res.redirect('/member/login')
    }
});

router.get('/post', (req, res) =>{
    const username = req.cookies.username;
    const UID = req.cookies.UID;
    const sql = " SELECT p.PID, p.title, p.UID, p.created_time, p.created_date, p.body_text, u.username FROM post AS p  LEFT JOIN users AS u ON p.UID = u.UID ORDER BY RAND() ; "
    const sql2 = "SELECT p.PID, p.title, p.UID, p.created_time, p.created_date, p.body_text, u.username, m.`path` FROM post AS p   LEFT JOIN users AS u  ON p.UID = u.UID  LEFT JOIN media AS m ON p.PID = m.PID WHERE p.PID = ? ;"
    const sql4 = "SELECT c.PID, c.body, c.Comment_Date, c.Comment_Time, u.username, c.UID FROM comments AS c LEFT JOIN post AS p ON p.PID = c.PID LEFT JOIN users AS u ON c.UID = u.UID WHERE c.PID = ? ;"
    console.log(req.query)
    if(username){

        db.query(sql, (err, results) =>{
            if(err){
                console.log(err)
            }else{
                // console.log(results)
                // res.render('member/member', {information : results , username: username} )
                const par1 = results
            
                    db.query(sql2, [Object.values(req.query)], (err, results) =>{
                        if(err){
                            console.log(err)
                            console.log("here")
                        }else{
                            // console.log(results[3].PID)
                            
                            const Post_results = results
                            db.query(sql4, Object.values(req.query), (err, results) => {
                                if(err){
                                    console.log(err)
                                    res.redirect('/member/post')
                                }else{
                                    // console.log(results)
                                    // console.log(results.length)
                                    res.render('member/post', {information : par1 , username: username, post: Post_results
                                        , UID: UID, PID: Object.values(req.query), comment: results} )
                                        
                                }
                            })
                            // console.log(results)
                            // res.render('member/post', {information : par1 , username: username, post: results, UID: UID, PID: Object.values(req.query)} )
                            
                        }
                    })
                 
                
            }
        })
        // res.render('member/member', {username: username} )

    }else{
        res.redirect('/member/login')
    }
});


router.get('/edit', (req, res) =>{
    const username = req.cookies.username;
    const UID = req.cookies.UID;
    const sql = " SELECT p.PID, p.title, p.UID, p.created_time, p.created_date, p.body_text, u.username FROM post AS p  LEFT JOIN users AS u ON p.UID = u.UID ORDER BY RAND() ; "
    const sql2 = "SELECT p.PID, p.title, p.UID, p.created_time, p.created_date, p.body_text, u.username, m.`path` FROM post AS p   LEFT JOIN users AS u  ON p.UID = u.UID  LEFT JOIN media AS m ON p.PID = m.PID WHERE p.PID = ? ;"
    const sql4 = "SELECT c.PID, c.body, c.Comment_Date, c.Comment_Time, u.username, c.UID FROM comments AS c LEFT JOIN post AS p ON p.PID = c.PID LEFT JOIN users AS u ON c.UID = u.UID WHERE c.PID = ? ;"
    console.log(req.query)
    if(username){

        db.query(sql, (err, results) =>{
            if(err){
                console.log(err)
            }else{
                
                const par1 = results
            
                    db.query(sql2, [Object.values(req.query)], (err, results) =>{
                        if(err){
                            console.log(err)
                            console.log("here")
                        }else{
                          
                            
                            const Post_results = results
                            db.query(sql4, Object.values(req.query), (err, results) => {
                                if(err){
                                    console.log(err)
                                    res.redirect('/member/edit_post')
                                }else{
                                    
                                    res.render('member/edit_post', {information : par1 , username: username, post: Post_results
                                        , UID: UID, PID: Object.values(req.query), comment: results} )
                                        
                                }
                            })
                            
                        }
                    })
                 
                
            }
        })
    }else{
        res.redirect('/member/login')
    }
});


router.get('/edit_post', (req, res) =>{
    const username = req.cookies.username;
    const UID = req.cookies.UID;
    const sql = " SELECT p.PID, p.title, p.UID, p.created_time, p.created_date, p.body_text, u.username FROM post AS p  LEFT JOIN users AS u ON p.UID = u.UID ORDER BY RAND() ; "
    const sql2 = "SELECT p.PID, p.title, p.UID, p.created_time, p.created_date, p.body_text, u.username, m.`path` FROM post AS p   LEFT JOIN users AS u  ON p.UID = u.UID  LEFT JOIN media AS m ON p.PID = m.PID WHERE p.PID = ? ;"
    const sql4 = "SELECT c.PID, c.body, c.Comment_Date, c.Comment_Time, u.username, c.UID FROM comments AS c LEFT JOIN post AS p ON p.PID = c.PID LEFT JOIN users AS u ON c.UID = u.UID WHERE c.PID = ? ;"
    console.log(req.query)
    if(username){

        db.query(sql, (err, results) =>{
            if(err){
                console.log(err)
            }else{
                
                const par1 = results
            
                    db.query(sql2, [Object.values(req.query)], (err, results) =>{
                        if(err){
                            console.log(err)
                            console.log("here")
                        }else{
                          
                            
                            const Post_results = results
                            db.query(sql4, Object.values(req.query), (err, results) => {
                                if(err){
                                    console.log(err)
                                    res.redirect('/member/edit_post')
                                }else{
                                    
                                    res.render('member/edit_post_main', {information : par1 , username: username, post: Post_results
                                        , UID: UID, PID: Object.values(req.query), comment: results} )
                                        
                                }
                            })
                            
                        }
                    })
                 
                
            }
        })
    }else{
        res.redirect('/member/login')
    }
});

router.post('/editting', (req, res) => {
    const {title, body} = req.body
    const sql1 = "UPDATE post SET title = ?, body_text = ? WHERE PID = ?;"
    const sql2 = "DELETE FROM media WHERE PID = ? ;"
    const DTime = moment().format();
    // console.log(Object.keys(req.query).length)
    if(Object.keys(req.query).length != 1){
        const choice = parseInt(Object.values(req.query.choice))
        var PID = parseInt(req.query.PID)
        console.log('title :',title)
        console.log('body :',body)
        console.log('choice :', choice)
        console.log('PID :', PID)

        if(choice == 1){
            db.query(sql1, [title, body, PID], (err, results) => {
                if(err){
                    console.log(err)
                }else{
                    res.redirect('/member/your_post')
                }
            })
        }else if(choice == 2){
            db.query(sql1, [title, body, PID], (err, results) => {
                if(err){
                    console.log(err)
                }else{
                    
                    db.query(sql2, PID, (err, results) => {
                        if(err){
                            console.log(err)
                        }else{
                            res.redirect('/member/your_post')
                        }
                    })
                }
            })
        }else if(choice == 3){
            db.query(sql1, [title, body, PID], (err, results) => {
                if(err){
                    console.log(err)
                }else{

                    const directory = [];
                    if(req.files){
                        const input = req.files.file
                        // console.log(input)
                        if(input.length > 1){

                            for(let i = 0 ; i < input.length; i++){
                                const time = new Date(moment().format())
                                const date = time.getDate()
                                const month = time.getMonth()+1
                                const year = time.getFullYear()
                                const time_string = time.getTime()
                                const Filename = `static/upload/${month}_${date}_${year}_${time_string}_${input[i].name}`
                                const address = `../upload/${month}_${date}_${year}_${time_string}_${input[i].name}`
                                directory[i] = address;
                                // console.log(Filename)
                                input[i].mv(Filename, function (err){

                                    if(err){

                                        res.send(err);

                                    }else{
                                        console.log('upload file is sucessfuly')
                                    }

                                })
                            }
                        }else{
                            const file = req.files.file 
                            const Name = req.files.file.name 
                            const time = new Date(DTime)
                            const date = time.getDate()
                            const month = time.getMonth()+1
                            const year = time.getFullYear()
                            const time_string = time.getTime()
                            const Filename = `static/upload/${month}_${date}_${year}_${time_string}_${Name}`
                            const address = `../upload/${month}_${date}_${year}_${time_string}_${Name}`
                            directory[0] = address;
                            // console.log(Filename)
                            file.mv(Filename, err =>{
                                if (err){
                                    console.log(err)
                                }else{
                                    console.log('upload file is sucessfuly')
                                }
                            })

                        }
                    }else{
                        console.log('no file upload')
                        res.redirect('/member/your_post')
                    }

                    if(directory){

                        // console.log(typeof(pid))
                        const insert_path = " INSERT INTO media (PID, path) VALUES (?,?)"
        
                        for(let i = 0; i < directory.length; i++){
                            db.query(insert_path, [PID , directory[i]],  (err, results) => {
                                if(err){
                                    console.log(err)
                                
                                }else{
                                    // console.log(results)
                                    
                                    
                                }
                            })
                        }
                          
                     }
                     res.redirect('/member/your_post')

                }
            })
        }


        
    }else{
        var PID = parseInt(req.query.PID)
        console.log('title :',title)
        console.log('body :',body)
        console.log('PID :', PID)

        db.query(sql1, [title, body, PID], (err, results) => {
            if(err){
                console.log(err)
            }else{
                res.redirect('/member/your_post')
            }
        })
        // console.log(req.query)
    }

    // console.log('title :',title)
    // console.log('body :',body)
    // console.log('choice :', choice)
    // console.log('PID :', PID)
    // console.log(req.query)
    // db.query(sql1,[title, body, UID])
});

router.get('/logout', (req, res) =>{
    const username = req.cookies.username;
    if(username){
        res.clearCookie('username')
        res.clearCookie('UID')
    }
    res.redirect('/member/login')
});


module.exports = router;