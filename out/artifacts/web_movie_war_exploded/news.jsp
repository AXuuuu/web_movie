<%@ page import="java.util.List" %>
<%@ page import="movie.entity.News" %>
<%@ page import="movie.newsdao.LookDao" %>
<%@ page import="movie.newsdao.LookDaoImpl" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
            height: auto;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            transition: all 0.25s;
            margin-top: 20px;
        }
        .card:hover {
            box-shadow: 5px 8px 5px #778899;
        }
        .header {
            border-left: 5px solid #4d4d4d;
            /*background-color: #2e6da4;*/
            padding: 5px;
            max-height: 300px;
            overflow: hidden;
        }
        .body {
            padding: 5px;
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


    <div>
        <br/>
        <br/>
        <br/>
    </div>



    <div style="width:50%;margin-left: 25%;margin-top: -50px">
        <h1>新闻</h1>
        <div>
            <br/>
            <br/>
            <br/>
        </div>
        <div style="margin-top: -50px">
        <%
            LookDao lookDao = new LookDaoImpl();
            List<News> list=lookDao.look();
            for (News news : list) {
        %>

            <div class="card">
                <a href="showNews.jsp?title=<%=news.getTitle()%>">
                    <div class="body" style="text-align: center">
                        <p id="title" name="title" style="font-size: 20px;color: #696969;display:block;height: 25px;margin-left: 20px"><%=news.getTitle()%>
                        </p>
                    </div>
                    <hr/>
                    <div class="header">
                        <pre style="font-size: 20px;white-space: pre-wrap;word-wrap: break-word;"><%=news.getContent()%></pre>
                    </div>
                </a>

                <div class="cart-button" style="text-align: center">
                    <button class="btn btn-primary"><a href="updateNews.jsp?title=<%=news.getTitle()%>">修改</a></button>
                    <button class="btn btn-danger"><a href="deleteNewsAction.action?id=<%=news.getId()%>">删除</a></button>
                </div>
                <div>
                    <br/>
                    <br/>
                    <br/>
                </div>
            </div>




        <%
            }
        %>
        </div>
    </div>
<%--底部黑框--%>
    <footer class="footer_area clearfix" style="width: 100%;height: 80px;display: flex;margin-top: 30px" >
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
