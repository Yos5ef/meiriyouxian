var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var session = require('express-session');

var index = require('./routes/index');
var users = require('./routes/users');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));


// 设置 session
var FileStore = require('session-file-store')(session);

app.use(session({
    secret: 'recommand 128 bytes random string', // 建议使用 128 个字符的随机字符串
    cookie: {maxAge: 6000 * 1000}, //cookie生存周期60秒
    // resave: true,  //cookie之间的请求规则,假设每次登陆，就算会话存在也重新保存一次
    // saveUninitialized: true, //强制保存未初始化的会话到存储器
    resave: false,
    saveUninitialized: false,
    store: new FileStore(),  // 本地存储session（文本文件，也可以选择其他store，比如redis的）

}));  //这些是写在app.js里面的

// 设置session全局访问中间件， 需要在路由定义之前
app.use(function (req, res, next) {

    res.locals.session = req.session;
    next();

});

app.use('/', index);
app.use('/users', users);

// 用户登陆注册
app.use('/user', require('./routes/user'));

//商家产品信息列表
app.use('/products', require('./routes/products'));


// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
