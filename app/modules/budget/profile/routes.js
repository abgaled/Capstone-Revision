var express = require('express');
var router = express.Router();
var authMiddleware = require('../../auth/middlewares/auth');
var db = require('../../../lib/database')();

router.get('/',(req, res) => {
    console.log('=================================');
    console.log('BUDGET: PROFILE');
    console.log('=================================');

    var queryString = `SELECT * FROM tbl_user 
    WHERE tbl_user.int_userID=${req.session.budget.int_userID}`

    db.query(queryString,(err, results1) => {

        var queryString2 = `SELECT * FROM tbl_city
        WHERE int_cityID= 1`

        db.query(queryString2,(err, results2) => {

            res.render('budget/profile/views/profile',{
                budget_info:results1,
                city_info:results2});
        }); 
    });
});

router.post('/', (req, res) => {
    console.log('=================================');
    console.log('BUDGET: PROFILE - UPDATE PROFILE INFO');
    console.log('=================================');

    var queryString1 = `UPDATE tbl_user SET
    varchar_userEmailAddress = "${req.body.barangay_email}",
    varchar_userPassword = "${req.body.barangay_password}"
    WHERE tbl_user.int_userID = ${req.session.budget.int_userID}`;
    
    db.query(queryString1, (err, results1, fields) => {        
        if (err) throw err;

        res.redirect('/budget/profile');

    });
});

module.exports = router;