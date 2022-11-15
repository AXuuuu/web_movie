<%@ page import="java.util.List" %>
<%@ page import="movie.entity.Movie" %>
<%@ page import="movie.moviedao.LookMovieDao" %>
<%@ page import="movie.moviedao.LookMovieDaoImpl" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2022/11/21
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看电影</title>
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

<div style="width: 60%;margin-top: 100px;margin-left: 20%;height: 80%">
    <%
        LookMovieDao lookMovieDao=new LookMovieDaoImpl();
        String type=request.getParameter("type");
        System.out.println(type);
        List<Movie> list=lookMovieDao.lookType(type);
    %>

    <div style="text-align: center">
        <h1><%=type%></h1>
    </div>
    <div class="row">


    <%
        for (Movie movie : list) {
    %>
        <div class="col-sm-6 col-md-3">
            <div class="img-thumbnail" style="border: 0">
                <a href="<%=movie.getSrc()%>" target="_blank">
                    <img src="<%=movie.getImg()%>" title="<%=movie.getTitle()%>" style="border: 0">
                </a>
                <div class="figure-caption" style="text-align: center;size: 20px">
                    <a href="<%=movie.getSrc()%>" target="_blank" style="font-size: 20px;color:#000;text-decoration: none"><%=movie.getTitle()%></a>
                </div>
            </div>
        </div>
    <%
        }
    %>

    </div>
</div>

<footer class="footer_area clearfix" style="width: 100%;height: 10%;display: flex;" >
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
