var express = require('express');
var router = express.Router();

var MySQLClient = require('../utils/MySQLClient.js');
var mysqlClientInstance = new MySQLClient();

var md5 = require('md5');

router.get('/reg', function (req, res, next) {

    res.render('user/reg', {title: '用户注册'});

});

/* GET user login page. */
router.get('/login', function (req, res, next) {

    res.render('user/login', {title: '用户登录'});

});


/* 执行登陆请求 必须是POST请求，因为涉及到密码 */
router.post('/reg', function (request, response, next) {

    var formData = request.body;

    var uname = formData.username;
    var pass = formData.password;

    //var password_md5 = sha('md5', pass);
    var password_md5 = md5(pass);

    //先检查用户名时候存在
    mysqlClientInstance.exec('SELECT * FROM t_user WHERE name=?', [uname], function (err, rows, fields) {

        if (rows.length == 0) { //没有重复用户名

            var sql = "INSERT INTO t_user (name, password) VALUES (?, ?)";

            mysqlClientInstance.exec(sql, [uname, password_md5], function (err, rows, fields) {

                if (err) {

                    console.log(err.stack);

                    var result = {
                        code: 0,
                        message: '注册失败'
                    };

                    response.send(result);

                } else { // 注册成功了

                    //设置 session, 自动登录
                    var userinfo = {id: rows.insertId, name: uname, pass: pass}
                    request.session.userinfo = userinfo;

                    var success = {
                        code: 1,
                        message: '注册成功',
                        userId: rows.insertId
                    };

                    response.send(success);

                }

            });

        } else { //重复用户名

            var result = {
                code: 0,
                message: '该用户名已经被注册过了'
            };

            response.send(result);

        }

    });

});

/* 执行注册请求 必须是POST请求， */
router.post('/login', function (request, response, next) {

    var formData = request.body;

    var password_md5 = md5(formData.password);

    mysqlClientInstance.exec('SELECT * FROM t_user WHERE name=? AND password=?', [formData.username, password_md5], function (err, rows, fields) {

        if (err) {

            console.log(err.stack);

            var error = {
                code: 3,
                message: '服务端异常'
            };

            response.send(error);

        } else {

            if (rows.length == 0) {

                var error = {
                    code: 2,
                    message: '用户名或者密码错误'
                };

                response.send(error);

            } else { // 成功验证

                var userinfo = {id: rows[0].id, name: rows[0].name, pass: rows[0].password};

                // 验证成功
                request.session.userinfo = userinfo;

                var success = {
                    code: 1,
                    message: '登录成功',
                    userId: rows[0].id
                };

                response.send(success);

            }
        }
    });

});


/* GET user 登出. */
router.get('/logout', function (req, res, next) {

    delete req.session.userinfo; // 删除session
    //req.session.destroy()

    var success = {
        code: 0,
        message: '成功',
        data: null
    };

    response.send(success);

    //res.render('user/userlogout', {title: 'user logout'});

});


module.exports = router;

