var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});


router.post('/message', function(req, res, next){
  req.pool.getConnection(function(err, connection){
    if(err){
      res.sendStatus(500);

    }

    let getName = req.body.selectedItem;
    let getContent = req.body.message;
    var query = "INSERT INTO Messages (book_name, content) VALUES (?, ?);";
    connection.query(query, [getName, getContent], function(err2, rows, fields){
      connection.release();
      if(err2){
        res.sendStatus(500);
        return;
      }
      // console.log(JSON.stringify(rows));
      // console.log("message stored successfully.");
      res.sendStatus(200);
    });
  });
});


router.get('/messageList', function(req, res, next){
  req.pool.getConnection(function(err, connection){
    if(err){
      res.sendStatus(500);
    }
    var query = "SELECT book_name, content FROM Messages;";
    connection.query(query, function(err2, rows, fields){
      connection.release();
      if(err2){
        res.sendStatus(500);
        return;
      }
      // console.log("message sent successfully.");
      res.send(rows);
    });
  });
});


module.exports = router;
