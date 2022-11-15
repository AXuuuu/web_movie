<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>电影后台管理系统</title>

    <%--CSS--%>
    <link rel="stylesheet" href="usercss/bootstrap.min.css">
    <link rel="stylesheet" href="usercss/animate.css">
    <link rel="stylesheet" href="usercss/style.css">

    <script>
        function tip() {
            // Document的方法 getElementById()返回一个匹配特定 ID的元素. 由于元素的 ID 在大部分情况下要求是独一无二的，
            // 这个方法自然而然地成为了一个高效查找特定元素的方法。
            var username=document.getElementById("useraccount").value;
            var password=document.getElementById("userpassword").value;
        if(username==''){
        alert('请输入账号！');
            return false;
        }
        if(password==''){
        alert('请输入密码！');
            return false;
        }
        }
    </script>
</head>
<body style="background: url(${request.pageContext.contextPath}img/loginback.jpg);">
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <h2 align="center" style="color:#848484;">电影后台管理系统</h2>
            </div>
        </div>
        <div class="row" >
            <div class="col-md-4"></div>
            <div class="col-md-4" >
                <form onsubmit="tip()" action="loginAction.action" class="fh5co-form animate-box" data-animate-effect="fadeInRight" method="post" name="form" style="background-color: rgba(0,0,0,0.5);border-radius: 30px;">
                    <h2 style="color: white;margin-left: 40%">登录</h2>
                    <div class="form-group"  style="border-radius:10px;">
                        <label for="useraccount" class="sr-only" >用户账号</label>
                        <input type="text" class="form-control" id="useraccount" placeholder="用户账号" autocomplete="off" name="useraccount" style="color: black;border-radius:5px;height: 30px;">
                    </div>
                    <div class="form-group">
                        <label for="userpassword" class="sr-only">密码</label>
                        <input type="password" class="form-control" id="userpassword" placeholder="密码" autocomplete="off" name="userpassword" style="color:black;border-radius:5px;height: 30px;">
                    </div>
                    <div class="form-group" style="margin-top: -30px">
                        <label for="remeber"><input type="checkbox" id="remeber" style="color: white">记住密码</label>
                    </div>
                    <div class="form-group" style="margin-top: -30px">
                        <p>没有注册?
                            <a href="sign.jsp" style="color: white">注册</a>|<a href="retrieve.jsp" style="color: white">忘记密码</a>
                        </p>
                    </div>
                    <div class="form-group" style="margin-left: 37%;margin-top: -20px">
                        <input type="submit" value="登录" class="btn btn-primary">
                    </div>
<%--                    <s:fielderror cssStyle="color: red"/>--%>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
