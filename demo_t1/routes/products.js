var express = require('express');
var router = express.Router();

var common = require('../utils/common.js');
var ArrayList = require('../utils/ArrayList.js');
var Map = require('../utils/Map.js');
var map = new Map();
var MySQLClient = require('../utils/MySQLClient.js');
var mysqlClientInstance = new MySQLClient();

/* 获取商品列表 */
router.get('/list/:shopId', function (request, response, next) {

    var shopId = request.param('shopId');

    // 把某个店铺的信息查询出来，传递到模板中
    mysqlClientInstance.exec('SELECT * FROM t_shop WHERE id=?', [shopId], function (err, shops, fields) {

        if (err) {
            common.handleError(err, response)
        } else {

            if (!shops || shops.length == 0) {
                common.handleError(err, response);
            } else {

                //某个店铺下面的产品信息查询出来
                mysqlClientInstance.exec('SELECT * FROM t_products WHERE shop_id=?', [shopId], function (err, products, fields) {

                    if (err) {
                        common.handleError(err, response)
                    } else {

                        if (!products) {
                            common.handleError(err, response);
                        } else {

                            var map = new Map();

                            var classfies = shops[0].classifies.split('|');

                            //console.log('classfies = ' + JSON.stringify(classfies));

                            classfies.forEach(function (classfy) {

                                map.put(classfy, new ArrayList());

                            });

                            //console.log('map_keys = ' + JSON.stringify(map));

                            products.forEach(function (product) {

                                map.get(product.classify).add(product);

                            });

                            //console.log('map_keyValues = ' + JSON.stringify(map));

                            var products = [];
                            var keySet = map.keySet();

                            //console.log('keySet = ' + JSON.stringify(keySet));

                            for (var i = 0; i < keySet.length; i++) {

                                var item = keySet[i];

                                var value = map.get(item).asArray(); // 作为数组赋值

                                products[i] = value;

                                //console.log('products[i] = ' + JSON.stringify(products[i]));

                            }

                            //console.log('products = ' + JSON.stringify(products));

                            var body = {'shop': shops[0], 'products': products};

                            response.render('products/list', body);

                        }
                    }
                });
            }
        }
    });
});

module.exports = router;
