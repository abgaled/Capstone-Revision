var express = require('express');
var router = express.Router();
var authMiddleware = require('../../auth/middlewares/auth');
var db = require('../../../lib/database')();
var moment = require('moment');
var cityID;


//- SCRIPT FOR CURRENT DATE
var n =  new Date();
var y = n.getFullYear();
var m = n.getMonth() + 1;
var d = n.getDate();
var hr = n.getHours();
var min = n.getMinutes();
var sec = n.getSeconds();
var now = y +"-"+ m +"-"+ d; 

router.get('/',(req, res) => {
    console.log('=================================');
    console.log('OFFICE: REPORTS');
    console.log('=================================');
    console.log(y);
    var years=[];
    var yearcount=y+10;
    for(var i = 1; i<=10;i++){
        years.push({y:yearcount-i});
    }
    yearcount=y;
    for(var i = 1; i<39;i++){
        years.push({y:yearcount-i});
    }
    var yearnow=[];
    yearnow.push(y);
    console.log(years);
    var queryString1 =`SELECT *
            FROM tbl_projectdetail WHERE enum_projectStatus="Finished"`
    db.query(queryString1, (err, results1, fields) => {
        console.log(results1);
        if (err) console.log(err);

        return res.render('office/reports/views/reports',
        {
            tbl_project:results1,
            years:years,
            yearnow:yearnow
        });
    });
});

router.post('/reportquery',(req,res) => {
    console.log('=================================');
    console.log('OFFICE: REPORT-AJAX GET DETAILS (POST)');
    console.log('=================================');
    var rType= req.body.rtype;
    var rmonth= req.body.rmonth;
    var ryear= req.body.ryear;
    var rstatus= req.body.rstatus;
    console.log(rType);
    console.log(rmonth);
    console.log(ryear);
    console.log(rstatus);
    var projectList = [];
    if(rType==1)
    {
        if(rstatus=="Ongoing")
        {
            var queryString1 =`SELECT *
            FROM tbl_projectdetail
            WHERE year(date_actualStartApp) = "${ryear}" AND (month(date_actualStartApp) = "${rmonth}" OR month(date_actualEndApp) = "${rmonth}" ) `
            db.query(queryString1, (err, results1, fields) => {
            console.log(results1);
            if (err) console.log(err);
                return res.send({tbl_project:results1});

            });
        }
        else if(rstatus=="Releasing")
        {
            var queryString1 =`SELECT *
            FROM tbl_projectdetail
            WHERE year(date_startReleasing) = "${ryear}" AND (month(date_startReleasing) = "${rmonth}" OR month(date_endReleasing) = "${rmonth}" ) `
            db.query(queryString1, (err, results1, fields) => {
            console.log(results1);
            if (err) console.log(err);
                return res.send({tbl_project:results1});

            });
        }
        if(rstatus=="Finished")
        {
            var queryString1 =`SELECT *
            FROM tbl_projectdetail
            WHERE year(date_actualClosing) = "${ryear}" AND month(date_actualClosing) = "${rmonth}" `
            db.query(queryString1, (err, results1, fields) => {
            console.log(results1);
            if (err) console.log(err);
                return res.send({tbl_project:results1});

            });
        }
        
    }
});

router.post('/liqreportquery',(req, res) => {
    console.log('=================================');
    console.log('OFFICE: REPORTS');
    console.log('=================================');
    var rProject= req.body.rProject;
    var queryString1 =`SELECT *
            FROM tbl_projectdetail WHERE int_projectID = "${rProject}"`
            
    db.query(queryString1, (err, results1, fields) => {
        console.log(results1);
        if (err) console.log(err);

        var queryString2 =`SELECT * FROM tbl_expense ex
        WHERE ex.int_projectID = "${rProject}"
        AND ex.int_sponsorID IS NULL`
        db.query(queryString2, (err, results2, fields) => {
            console.log(results2);
            if (err) console.log(err);
            
            var queryStringSPONSOR =`SELECT * FROM tbl_expense ex
                                    JOIN tbl_projectsponsor ps ON ex.int_sponsorID = ps.int_sponsorID
                                    JOIN tbl_sponsordetail sd ON ex.int_sponsorID = sd.int_sponsorID
                                    WHERE ex.int_projectID = "${rProject}"
                                    AND ex.int_sponsorID IS NOT NULL`
            db.query(queryStringSPONSOR, (err, results3, fields) => {
                console.log(results3);
                if (err) console.log(err);
            
                var expense = [results1,results2,results3];
                return res.send({tbl_project:expense});
            });
        });
    });
});

router.post('/budreportquery',(req, res) => {
    console.log('=================================');
    console.log('OFFICE: REPORTS');
    console.log('=================================');
    var rYear= req.body.rYear;

    var queryString1 =`SELECT *
            FROM tbl_annualbudget WHERE date_budgetYear = "${rYear}"`
    db.query(queryString1, (err, results1, fields) => {
        console.log(results1);
        if (err) console.log(err);
        var bud=results1;
        var queryString2 =`SELECT *
        FROM tbl_categorybudget cb
        JOIN tbl_category c ON c.int_categoryID = cb.int_categoryID
        WHERE cb.int_budgetID = "${bud[0].int_budgetID}"`
        db.query(queryString2, (err, results2, fields) => {
            console.log(results2);
            if (err) console.log(err);

            var queryString3 =`SELECT (SUM(cb.decimal_categBudget)-sum(cb.decimal_categRemaining)) AS totalCat
            FROM tbl_categorybudget cb
            JOIN tbl_category c ON c.int_categoryID = cb.int_categoryID
            WHERE cb.int_budgetID = "${bud[0].int_budgetID}"`
            db.query(queryString3, (err, results3, fields) => {
                console.log(results3);
                if (err) console.log(err);
                var queryString4 =`SELECT *
                FROM tbl_projectcategory cb
                JOIN tbl_category c ON c.int_categoryID = cb.int_categoryID
                JOIN tbl_projectdetail pd ON pd.int_projectID = cb.int_projectID
                WHERE YEAR(pd.date_createdDate) = "${rYear}"`
                db.query(queryString4, (err, results4, fields) => {
                    console.log(results4);
                    if (err) console.log(err);

                    var queryString5 =`SELECT DISTINCT(pd.int_projectID), pd.varchar_projectName, pd.enum_projectStatus, decimal_appropriatedBudget
                    FROM tbl_projectcategory cb
                    JOIN tbl_category c ON c.int_categoryID = cb.int_categoryID
                    JOIN tbl_projectdetail pd ON pd.int_projectID = cb.int_projectID
                    WHERE YEAR(pd.date_createdDate) = "${rYear}"`
                    db.query(queryString5, (err, results5, fields) => {
                        console.log(results5);
                        if (err) console.log(err);
                

                        var expense = [results1,results2,results3,results4,results5];
                        return res.send({tbl_budget:expense});
                    });
                });
            });
        });
    });
});



module.exports = router;