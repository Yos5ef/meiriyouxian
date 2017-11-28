$(document).ready(function () {

    $('#regBtn').click(function () {

        var userName = $('#username').val();

        if (!userName) {
            showAlert('请输入用户名，最多16位字符');
            return;
        }

        var password = $('#password').val();

        if (password) {
            if (password.length < 6) {
                showAlert('请至少输入6位密码');
                return;
            }
        } else {
            showAlert('请输入6~16位密码');
            return;
        }

        asyncPost('/user/reg', {'username': userName, 'password': password}, function (response) {//请求成功时处理

            var errMsg = '注册失败';

            if (response) {

                if (response.code == 1 && response.userId) { //注册成功

                    location.href = '/';
                    
                    return;
                }

                if (response.message) {
                    errMsg = response.message;
                }

            }

            showAlert(errMsg);

        });

    });
});