<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加新闻类型</title>

    <%--css--%>
    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="usercss/bootstrap.min.css">
    <link rel="stylesheet" href="usercss/animate.css">
    <link rel="stylesheet" href="usercss/style.css">
    <style type="text/css">
        h1{
            color: #848484;
            font-family: 宋体;
            text-align: center;
        }
    </style>
</head>
<body>
<!-- ##### Header Area Start ##### -->
<header class="header_area">
    <div class="classy-nav-container breakpoint-off d-flex align-items-center justify-content-between" style="height: 40px">
        <!-- Classy Menu -->
        <nav class="classy-navbar" id="essenceNav" style="margin-left: 61%">
            <!-- Navbar Toggler -->
            <div class="classy-navbar-toggler">
                <span class="navbarToggler"><span></span><span></span><span></span></span>
            </div>
            <!-- Menu -->
            <div class="classy-menu">
                <!-- close btn -->
                <div class="classycloseIcon">
                    <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                </div>
                <!-- Nav Start -->
                <div class="classynav">
                    <ul>
                        <li><a href="main.jsp">主页</a></li>
                        <li><a href="news.jsp">新闻</a>
                            <ul class="dropdown">
                                <li><a href="addNews.jsp">添加新闻</a></li>
                            </ul>
                        </li>
                        <li><a href="newstype.jsp">新闻类型</a>
                            <ul class="dropdown">
                                <li><a href="addnewstype.jsp">添加类型</a></li>
                            </ul>
                        </li>
                        <li><a href="movie.jsp">电影</a>
                            <ul class="dropdown">
                                <li><a href="addMovie.jsp">添加电影</a></li>
                            </ul>
                        </li>

                        <li><a href="movietype.jsp">电影类型</a>
                            <ul class="dropdown">
                                <li><a href="addmovietype.jsp">添加类型</a></li>
                            </ul>
                        </li>
                        <li><a href="login.jsp">退出</a></li>
                    </ul>
                </div>
                <!-- Nav End -->
            </div>
        </nav>
    </div>
</header>

<%--添加新闻--%>
<section class="row" style="width: 60%;margin: 0 auto;height: 80%">
    <div class="col-md-12 text-center">
        <br/>
        <br/>
        <h1>添加新闻类型</h1>
    </div>


    <div class="col-md-8 col-md-offset-2" style="margin-top: -300px">
        <form action="AddNewsTypeAction.action" class="fh5co-form animate-box" data-animate-effect="fadeInRight" method="post" style="border-radius: 20px">
            <div class="form-group">
                <label for="type" class="sr-only">新闻类型</label>
                <input type="text" class="form-control" id="type" placeholder="新闻类型" name="type">
            </div>
            <div class="form-group" style="margin-left: 45%">
                <input type="submit" value="提交" class="btn btn-primary" onclick="getText()">
            </div>
        </form>
    </div>
</section>




<footer class="footer_area clearfix" style="width: 100%;height: 80px;margin-top: 10%;display: flex" >
    <div class="container">
    </div>
</footer>

<%--js--%>
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/plugins.js"></script>
<script src="js/classy-nav.min.js"></script>
<script src="js/active.js"></script>
</body>
</html>

