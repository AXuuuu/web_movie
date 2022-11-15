<%@ page import="movie.entity.News" %>
<%@ page import="java.util.List" %>
<%@ page import="movie.newsdao.LookDao" %>
<%@ page import="movie.newsdao.LookDaoImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看新闻</title>
    <%--css--%>
    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="usercss/bootstrap.min.css">
    <link rel="stylesheet" href="usercss/animate.css">
    <link rel="stylesheet" href="usercss/style.css">

    <%--    <script charset="utf-8" src="plug/kindeditor/kindeditor-all-min.js"></script>--%>
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

<%--查看新闻--%>
<div style="width: 70%;margin-top: 100px;margin-left: 15%;height: 80%">
    <%
        LookDao lookNewsDao=new LookDaoImpl();
        String title=request.getParameter("title");
        System.out.println(title);
        List<News> list=lookNewsDao.searchNews(title);
    %>
    <div>

        <div style="text-align: center">
            <%
                for (News news : list) {
            %>
            <h1 style="color: black"><%=news.getTitle()%></h1>

        </div>
        <div class="row">
            <div class="col-md-6">新闻类型:<%=news.getType()%></div>
            <div class="col-md-6" style="text-align: right"><%=news.getState()%>时间:<%=news.getTime()%></div>
        </div>
        <div>
            <pre style="border: 0;font-size: 20px;white-space: pre-wrap;word-wrap: break-word;"><%=news.getContent()%></pre>
        </div>

        <%
            }
        %>

    </div>
</div>


<footer class="footer_area clearfix" style="width: 100%;height: 80px;display: flex" >
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

