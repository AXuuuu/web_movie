<%@ taglib prefix="s" uri="/struts-tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>



    <%--CSS--%>
    <link rel="stylesheet" href="usercss/bootstrap.min.css">
    <link rel="stylesheet" href="usercss/animate.css">
    <link rel="stylesheet" href="usercss/style.css">

    <%--JS--%>
    <script src="userjs/jquery.min.js"></script>
    <script src="userjs/bootstrap.min.js"></script>
    <script src="userjs/jquery.placeholder.min.js"></script>
    <script src="userjs/jquery.waypoints.min.js"></script>
    <script src="userjs/main.js"></script>
    <script>
        function tip() {
            var useraccount=document.getElementById("useraccount");
            var userpassword=document.getElementById("userpassword");
            var userpassword1=document.getElementById("userpassword1");
            if (useraccount==''||userpassword==''||userpassword1==''){
                alert('请输入!');
            }
            if(!userpassword==userpassword1){
                alert('两次密码不一致!')
            }
        }
    </script>
</head>
<body style="background: url(${request.pageContext.contextPath}img/loginbacktwo.jpg);">
    <div class="container"style="width: 60%;height: 60%;margin-top: -55px">
        <div class="row">
<%--            <s:fielderror cssStyle="color: red"/>--%>
            <div class="col-md-6 col-md-offset-3" >
                <%--注册--%>
                <form onsubmit="tip()" action="signAction.action" class="fh5co-form animate-box" data-animate-effect="fadeInRight" method="post" style="background-color: rgba(0,0,0,0.5);border-radius: 30px;">
                    <div class="form-group">
                        <label for="username" class="sr-only">用户姓名</label>
                        <input type="text" class="form-control" id="username" placeholder="用户姓名" autocomplete="off" name="username" style="color: black;border-radius:5px;height: 30px;">
                    </div>
                    <div class="form-group">
                        <label for="useraccount" class="sr-only">用户账号</label>
                        <input type="text" class="form-control" id="useraccount" placeholder="用户账号" autocomplete="off" name="useraccount" style="color: black;border-radius:5px;height: 30px;">
                    </div>
                    <div class="form-group">
                        <label for="usersex" class="sr-only">用户性别</label>
                        <input type="text" class="form-control" id="usersex" placeholder="用户性别" autocomplete="off" name="usersex" style="color: black;border-radius:5px;height: 30px;">
                    </div>
                    <div class="form-group">
                        <label for="usergage" class="sr-only">用户年龄</label>
                        <input type="text" class="form-control" id="usergage" placeholder="用户年龄" autocomplete="off" name="userage" style="color: black;border-radius:5px;height: 30px;">
                    </div>
                    <div class="form-group">
                        <label for="userpassword" class="sr-only">用户密码</label>
                        <input type="password" class="form-control" id="userpassword" placeholder="用户密码" autocomplete="off" name="userpassword" style="color: black;border-radius:5px;height: 30px;">
                    </div>
                    <div class="form-group">
                        <label for="userpassword1" class="sr-only">确认密码</label>
                        <input type="password" class="form-control" id="userpassword1" placeholder="确认密码" autocomplete="off" name="userpassword1" style="color: black;border-radius:5px;height: 30px;">
                    </div>
                    <div class="form-group">
                        <label for="usertell" class="sr-only">用户电话</label>
                        <input type="text" class="form-control" id="usertell" placeholder="用户电话" autocomplete="off" name="usertell" style="color: black;border-radius:5px;height: 30px;">
                    </div>
                    <div class="form-group">
                        <label for="useraddress" class="sr-only">用户地址</label>
                        <input type="text" class="form-control" id="useraddress" placeholder="用户地址" autocomplete="off" name="useraddress" style="color: black;border-radius:5px;height: 30px;">
                    </div>
<%--                    <div class="form-group">--%>
<%--                        <label for="remember"><input type="checkbox" id="remember" style="color: white">记住密码</label>--%>
<%--                    </div>--%>
                    <div class="form-group"style="margin-top: -20px" >
                        <p>已经注册？
                            <a href="login.jsp" style="color: white">登录</a>
                        </p>
                    </div>
                    <div class="form-group" style="margin-left: 40%;margin-top: -20px">
                        <input type="submit" value="注册" class="btn btn-primary">
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
