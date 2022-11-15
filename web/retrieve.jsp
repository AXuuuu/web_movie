<%@ taglib prefix="s" uri="/struts-tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>密码找回</title>


    <%--CSS--%>
    <link rel="stylesheet" href="usercss/bootstrap.min.css">
    <link rel="stylesheet" href="usercss/animate.css">
    <link rel="stylesheet" href="usercss/style.css">

    <%--JS--%>
    <script src="userjs/modernizr-2.6.2.min.js"></script>
    <script src="userjs/respond.min.js"></script>
    <script src="userjs/jquery.min.js"></script>
    <script src="userjs/bootstrap.min.js"></script>
    <script src="userjs/jquery.placeholder.min.js"></script>
    <script src="userjs/jquery.waypoints.min.js"></script>
    <script src="userjs/main.js"></script>


    <%--验证码--%>
    <script>
        /*刷新验证码*/
        function changeVerification() {
            document.getElementById("checkcode_img").src = "checkcode.jsp?" + new Date().getTime();
        }
        function tip() {
            var useraccount=document.getElementById("useraccount");
            var userpassword=document.getElementById("userpassword");
            var userCode=document.getElementById("userCode")
            if (useraccount==''||userpassword==''||userCode==''){
                alert('请输入!');
            }
        }
    </script>

</head>
<body style="background: url(${request.pageContext.contextPath}img/loginback.jpg);">
    <div class="container" >
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <form onsubmit="tip()" action="retrieveAction" class="fh5co-form animate-box" data-animate-effect="fadeInRight" name="form1" method="post" style="background-color: rgba(0,0,0,0.5);border-radius: 30px;">
                    <h2 style="color: white;margin-left: 35%">找回密码</h2>


                    <div class="form-group">
                        <label for="useraccount" class="sr-only">用户账号</label>
                        <input type="text" class="form-control" id="useraccount" placeholder="用户账号" autocomplete="off" name="useraccount" style="color:black;border-radius:5px;height: 30px;">
                    </div>
                    <div class="form-group">
                        <label for="userpassword" class="sr-only">新密码</label>
                        <input type="password" class="form-control" id="userpassword" placeholder="新密码" autocomplete="off" name="userpassword" style="color:black;border-radius:5px;height: 30px;">
                    </div>
                    <%--验证码--%>
<%--                    <div class="form-group">--%>
<%--                        <img alt="点击刷新" src="checkcode.jsp" border="0" id="checkcode_img" onclick="changeVerification()"/>--%>
<%--                        <br/>--%>
<%--                        <label for="userCode" class="sr-only">验证码</label>--%>
<%--                        <input type="text" class="form-control" id="userCode" placeholder="请输入验证码" autocomplete="off" name="userCode" style="color:black;border-radius:5px;height: 30px;">--%>
<%--                    </div>--%>
<%--                    <div class="form-group">--%>
<%--                        <p><a href="login.jsp" style="color: white">登录</a> 或 <a href="sign.jsp" style="color: white">注册</a></p>--%>
<%--                    </div>--%>
                    <div class="form-group" style="margin-left: 37%;margin-top: -20px">
                        <input type="submit" value="提交" class="btn btn-primary">
                    </div>
                    <s:fielderror cssStyle="color: red"/>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
