<%@ page import="java.util.List" %>
<%@ page import="movie.entity.MovieType" %>
<%@ page import="movie.movieTypedao.LookMovieTypeDaoImpl" %>
<%@ page import="movie.movieTypedao.LookMovieTypeDao" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>电影后台管理系统</title>

    <%--css--%>
    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/button.css">

    <style type="text/css">
        .card {
            cursor: pointer;
            margin-top: 10px;
            margin-left: 300px;
            width: 600px;
            height: auto;
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
            /*background-color: #2e6da4;*/
            margin: 0 auto;
            padding: 5px;
            margin-left: 0px;
            height: 70px;
        }

        .body {
            padding: 5px;
        }

        .card img {
            width: 100%;
        }

        h1{
            color: #848484;
            font-family: 宋体;
            text-align: center;
        }
    </style>

</head>
<%--<body  style="background:url(img/newbacktwo.jpg)">--%>
<body  style="background-color: white">
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

<div>
    <br/>
    <br/>
    <h1 style="margin-top: -30px">查看电影类型</h1>
    <br/>
    <br/>
</div>

<div style="width: 70%;margin-left: 15%;height:80%">
    <table class="table table-condensed">
        <thead>
        <tr>
            <th>编号</th>
            <th>名称</th>
            <th>操作</th></tr>
        </thead>
        <tbody>
        <%
            LookMovieTypeDao lookMovieTypeDao=new LookMovieTypeDaoImpl();
            List<MovieType> list=lookMovieTypeDao.look();
            for(MovieType type:list){
        %>

        <tr>
            <td><%=type.getId()%></td>
            <td><%=type.getType()%></td>
            <td>
                <div class="btn-group">
                    <button class="btn btn-primary"><a href="updatemovietype.jsp?type=<%=type.getType()%>">修改</a></button>
                    <button class="btn btn-danger"><a href="deleteMovieTypeAction.action?id=<%=type.getId()%>">删除</a> </button>
                </div>
            </td>
        </tr>
        <%
            }
        %>
        </tbody>

    </table>
</div>




<footer class="footer_area clearfix" style="width: 100%;height: 80px;margin-top: 10%;display: flex">
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
