<%@ page import="movie.entity.Movie" %>
<%@ page import="movie.moviedao.LookMovieDao" %>
<%@ page import="java.util.List" %>
<%@ page import="movie.moviedao.LookMovieDaoImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>电影后台管理系统</title>
    <%--css--%>
    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" href="css/style.css">

    <style type="text/css">
        .card {
            cursor: pointer;
            margin-top: 20px;
            margin-left: 200px;
            /*margin: 0 auto;*/
            width: 70%;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            text-align: center;
            transition: all 0.25s;
        }

        .card:hover {
            margin-top: 10px;
            box-shadow: 5px 8px 5px #778899;
        }

        .header {
            border-left: 5px solid #4d4d4d;
            margin: 0 auto;
            padding: 5px;
            margin-left: 0px;
            height: 70px;
        }

        .body {
            padding: 5px;
            text-align: left;
        }

        .card img {
            width: 280px;
            height: 411px;
        }
        #left{
            float: left;
            width: 50%;
            text-align: center;
        }
        #right{
            float: right;
            width: 50%;
        }
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

<div style="width:70%;margin-left: 15%">
    <div class="col-md-12 text-center">
        <h1>电影</h1>
    </div>
    <%
        LookMovieDao lookMovieDao=new LookMovieDaoImpl();
        List<Movie> list=lookMovieDao.look();
        for (Movie movie : list) {
    %>
    <div class="card">
        <div class="header">
            <p id="title" name="title" style="font-size: 25px;color: #696969;display:block;height: 25px;margin-left: 20px"><%=movie.getTitle()%>
            </p>
        </div>
        <div class="body">
            <hr/>
            <p>类型：<%=movie.getType()%></p>
            <hr/>
            <div id="left">
                <img src="<%=movie.getImg()%>">
            </div>
            <div id="right">
                <h5>电影简介</h5>
                <pre style="font-size: 17px;white-space: pre-wrap;word-wrap: break-word;font-family: 楷体"><%=movie.getIntroduction()%></pre>
            </div>
        </div>

        <div style="text-align: left;font-size: 20px;font-family: 华文隶书">观看链接:&nbsp;&nbsp;&nbsp;<a href="<%=movie.getSrc()%>" target="_blank" style="color: black;font-size: 15px"><%=movie.getSrc()%></a></div>

        <div class="cart-button" style="text-align: center">
            <button class="btn btn-primary"><a href="updateMovie.jsp?title=<%=movie.getTitle()%>">修改</a></button>
            <button class="btn btn-danger"><a href="deleteMovieAction.action?title=<%=movie.getId()%>">删除</a></button>
        </div>

        <div>
            <br/>
        </div>
    </div>
    <%
        }
    %>
</div>
    <footer class="footer_area clearfix" style="width: 100%;height: 80px;margin-top: 30px" >
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-6">
                    <div class="single_widget_area d-flex mb-30">
                        <div class="footer_menu">
                        </div>
                    </div>
                </div>
            </div>
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

