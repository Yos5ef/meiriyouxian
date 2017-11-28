var express = require('express');
var router = express.Router();

var MySQLClient = require('../utils/MySQLClient.js');
var mysqlClientInstance = new MySQLClient();

function indexHandler(request, response, next) {

    if (request.session.userinfo) { // 登录用户

        mysqlClientInstance.exec('SELECT * FROM t_shop limit 0, 10', null, function (err, rows, fieds) {

            if (err) {

                common.handleError(err, request);

            } else {

                response.render('shop/list', {'rows': rows});
            }
        });


    } else {

        response.redirect('/user/login');

    }

}

router.get('/', indexHandler);

router.get('/index', indexHandler);

module.exports = router;
