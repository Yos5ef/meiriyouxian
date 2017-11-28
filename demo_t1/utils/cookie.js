/**
 * 获取Cookie值
 *
 */
function getCookieValue(request, key) {

    var cookies = request.headers.cookie;

    if (cookies) {
        cookies = cookies.split(';');
        for (var i in cookies) {

            var index = cookies[i].replace(" ", "").indexOf(key);

            if (index > -1) {
                var kv = cookies[i].split('=');

                if (kv[0] == key) {

                    return kv[1];

                } else if (kv[0] == ' ' + key) {

                    return kv[1];
                }
            }
        }
    }

    return null;
}

module.exports = getCookieValue;