<%@ page import="java.util.List" %>
<%@ page import="movie.entity.NewsType" %>
<%@ page import="movie.newsTypedao.LookNewsTypeDaoImpl" %>
<%@ page import="movie.newsTypedao.LookNewsTypeDao" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>电影后台管理系统</title>

    <%--css--%>
    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/button.css">

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

<div>
    <br/>
    <br/>
    <h1 style="margin-top: -30px">查看新闻类型</h1>
    <br/>
    <br/>
</div>

<div style="width: 70%;margin-left: 15%;height:80%">
    <br/>
    <table class="table table-condensed">
        <thead>
        <tr>
            <th>编号</th>
            <th>名称</th>
            <th>操作</th></tr>
        </thead>
        <tbody>
        <%
            LookNewsTypeDao lookNewsTypeDao=new LookNewsTypeDaoImpl();
            List<NewsType> list=lookNewsTypeDao.look();
            for(NewsType type:list){
        %>

        <tr>
            <td><%=type.getId()%></td>
            <td><%=type.getType()%></td>
            <td>
                <div class="btn-group">
                    <button class="btn btn-primary"><a href="updatenewstype.jsp?type=<%=type.getType()%>">修改</a></button>
                    <button class="btn btn-danger"><a href="deleteNewsTypeAction.action?id=<%=type.getId()%>">删除</a> </button>
                </div>
            </td>
        </tr>
        <%
            }
        %>
        </tbody>

    </table>

</div>


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

