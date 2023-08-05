var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var session = require('express-session');

var mysql = require('mysql');
var dbConnectionPool = mysql.createPool({ host: 'localhost', database: 'dbtask1_7' });

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');

var app = express();

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());

app.use(function(req, res, next){
    req.pool = dbConnectionPool;
    next();
});

app.use(session({
    resave: false,
    saveUninitialized: true,
    secret: "secret",
    secure: false
}));

app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/users', usersRouter);

module.exports = app;
