<%@ page import="movie.moviedao.LookMovieDao" %>
<%@ page import="movie.moviedao.LookMovieDaoImpl" %>
<%@ page import="movie.entity.Movie" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除电影</title>

    <%--css--%>
    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="usercss/bootstrap.min.css">
    <link rel="stylesheet" href="usercss/animate.css">
    <link rel="stylesheet" href="usercss/style.css">


    <style>
        #td {
            overflow:hidden;
            text-overflow:ellipsis;
        }
        h1{
            color: #848484;
            font-family: 宋体;
            text-align: center;
        }
    </style>

</head>
<body style="background-color: white">
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
                                    <li><a href="updateNews.jsp">修改新闻</a></li>
                                    <li><a href="deleteNews.jsp">删除新闻</a></li>
                                </ul>
                            </li>
                            <li><a href="newstype.jsp">新闻类型</a>
                                <ul class="dropdown">
                                    <li><a href="addnewstype.jsp">添加类型</a></li>
                                    <li><a href="updatenewstype.jsp">修改类型</a></li>
                                    <li><a href="deletenewstype.jsp">删除类型</a></li>
                                </ul>
                            </li>
                            <li><a href="movie.jsp">电影</a>
                                <ul class="dropdown">
                                    <li><a href="addMovie.jsp">添加电影</a></li>
                                    <li><a href="updateMovie.jsp">修改电影</a></li>
                                    <li><a href="deleteMovie.jsp">删除电影</a></li>
                                </ul>
                            </li>

                            <li><a href="movietype.jsp">电影类型</a>
                                <ul class="dropdown">
                                    <li><a href="addmovietype.jsp">添加类型</a></li>
                                    <li><a href="updatemovietype.jsp">修改类型</a></li>
                                    <li><a href="deletemovietype.jsp">删除类型</a></li>
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



    <%--删除电影--%>
    <section class="row" style="width: 100%;margin: 0 auto;background-color: white">
        <div class="col-md-12 text-center">
            <br/>
            <br/>
            <h3>电影列表</h3>
        </div>


        <div>
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>
        </div>


        <div style="margin:0 auto;width: 80%;height: auto">
            <table class="table table-border table-bordered table-bg table-hover table-sort dataTable no-footer"
                   id="DataTables_Table_0" role="grid" aria-describedby="DataTables_Table_0_info" action="lookNewsAction"
                   width="100%" border="1" cellpadding="2" cellspacing="2" bordercolor="#CCCCCC" style="table-layout:fixed">
                <thead>
                <tr >
                    <th width="80" >ID</th>
                    <th width="100">电影标题</th>
                    <th width="100">电影海报</th>
                    <th width="100">电影类型</th>
                    <th width="100">电影简介</th>
                    <th width="100">电影位置</th>
                    <th width="100">操作</th>
                </tr>
                </thead>
                <tbody>
                <%
                    LookMovieDao lookMovieDao = new LookMovieDaoImpl();
                    List<Movie> list = lookMovieDao.look();
                    for (Movie movie : list) {
                %>
                <tr>
                    <td><%=movie.getId()%></td>
                    <td><%=movie.getTitle()%></td>
                    <td><img src="<%=movie.getImg()%>" style="width: 100px;height: 100px;"/></td>
                    <td><%=movie.getType()%></td>
                    <td><%=movie.getIntroduction()%></td>
                    <td id="td"><%=movie.getSrc()%></td>
                    <td><a href="deleteMovieAction.action?title=<%=movie.getTitle()%>" style="color: red">删除</a></td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>

    </section>


    <div style="background-color: white">
        <br/>
        <br/>
        <br/>
    </div>

    <%--js--%>
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/plugins.js"></script>
    <script src="js/classy-nav.min.js"></script>
    <script src="js/active.js"></script>
    </body>
</html>
