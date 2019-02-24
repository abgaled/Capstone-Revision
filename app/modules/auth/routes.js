var express = require('express');
var homepage = express.Router();
var signup = express.Router();
var logoutRouter = express.Router();
var authMiddleware = require('./middlewares/auth');
var db = require('../../lib/database')();

//- SCRIPT FOR CURRENT DATE
var n =  new Date();
var y = n.getFullYear();
var m = n.getMonth() + 1;
var d = n.getDate();
var hr = n.getHours();
var min = n.getMinutes();
var sec = n.getSeconds();
var now = y +"-"+ m +"-"+ d; 

homepage.get('/',authMiddleware.noAuthed,(req, res) => {
    db.query(`SELECT * FROM tbl_city WHERE int_cityID = 1`, (err, cityinfo) => {
        console.log("==========city info")
        console.log(cityinfo[0])
        db.query(`SELECT * FROM tbl_projectdetail WHERE enum_projectStatus="Ongoing" ORDER BY int_projectID DESC`, (err, ongoingproj) => {
            
            if(ongoingproj.length === 0){
                var ongoingproj = 0;    
            }

            db.query(`SELECT * FROM tbl_projectdetail WHERE enum_projectStatus="Finished" ORDER BY int_projectID DESC`, (err, finishedproj) => {
                
                if(finishedproj.length === 0){
                    var finishedproj = 0;
                }
                
                    res.render('auth/views/index',{
                        cityinfo:cityinfo,
                        ongoingproj:ongoingproj,
                        finishedproj:finishedproj});
            });
        });
    });
});

homepage.post('/', (req, res) =>{
    console.log('POST: Home Modal');

    var db = require('../../lib/database')();
    db.query(`SELECT * FROM tbl_user WHERE varchar_userEmailAddress="${req.body.user_email}"`, (err, results, fields) => {
        if (err) throw err;
        if (results.length === 0) return res.redirect('/login?incorrect');

        var user = results[0];
        
        if (user.varchar_userPassword !== req.body.user_password) return res.redirect('/login?incorrect');
    
        if(user.enum_userType == "Office Staff"){
            delete user.varchar_userPassword;
            req.session.office = user;
            console.log('Office Staff User:');
            return res.redirect('/office/home');
        }

        if(user.enum_userType == "Barangay Staff"){
            delete user.varchar_userPassword;
            req.session.barangay = user;
            console.log('Barangay Staff User:');
            return res.redirect('/barangay/home');
        }

        if(user.enum_userType == "Budget Office Staff"){
            delete user.varchar_userPassword;
            req.session.budget = user;
            console.log('Budget Staff User:');
            return res.redirect('/budget/home');
        }

    });

});
// ----End login student


logoutRouter.get('/', (req, res) => {
    req.session.destroy(err => {
        if (err) throw err;
        console.log("===========================");
        console.log("Router: LOG OUT");
        console.log("===========================");
        res.redirect('/home');
    });
});



exports.home = homepage;
exports.signup = signup;
exports.logout = logoutRouter;