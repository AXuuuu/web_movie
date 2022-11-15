<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>
<%@ page import="movie.entity.MovieType" %>
<%@ page import="movie.movieTypedao.LookMovieTypeDaoImpl" %>
<%@ page import="movie.movieTypedao.LookMovieTypeDao" %>
<html>
<head>
    <title>添加电影</title>

    <%--css--%>
    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="usercss/bootstrap.min.css">
    <link rel="stylesheet" href="usercss/animate.css">
    <link rel="stylesheet" href="usercss/style.css">

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


    <%--添加电影--%>
    <section class="row" style="width: 100%;margin: 0 auto;height: 80%">
        <div class="col-md-12 text-center">
            <br/>
            <br/>
            <h1>添加电影</h1>
        </div>
        <%
            LookMovieTypeDao lookDao = new LookMovieTypeDaoImpl();
            List<MovieType> list=lookDao.look();
        %>
        <div class="col-md-8 col-md-offset-2">
            <form action="AddMovieAction.action" class="fh5co-form animate-box" data-animate-effect="fadeInRight" method="post" enctype="multipart/form-data" style="border-radius: 20px;margin-top: 20px;">
                <div class="form-group">
                    <label for="title" class="sr-only">电影标题</label>
                    <input type="text" class="form-control" id="title" placeholder="电影标题" name="title">
                </div>
                <div class="form-group">
                    <label for="type" class="sr-only">电影类别</label>
                    <select type="text" class="form-control" id="type" placeholder="电影类别" name="type">
                        <%
                            for (MovieType movieType : list) {
                        %>
                        <option><%=movieType.getType()%></option>
                        <%
                            }
                        %>
                    </select>
                </div>

                <div class="form-group">
                    <label for="img" class="sr-only">电影海报</label>
                    <input type="file" class="form-control" id="img" placeholder="电影海报(最大10M)" name="uploadImage">
                </div>

                <div class="form-group">
                    <div id="kindeditor">
                        <label for="kindedito" class="sr-only">电影简介</label>
                        <textarea id="kindedito"  placeholder="电影简介" name="kindedito" rows="5" cols="80"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label for="uploadMovie" class="sr-only">上传电影</label>
                    <input type="text" id="uploadMovie" name="uploadMovie" placeholder="观看地址" class="form-control">
                </div>
<%--                <div class="form-group">--%>
<%--                    <label for="uploadMovie" class="sr-only">上传电影</label>--%>
<%--                    <input type="file" id="uploadMovie" name="uploadMovie" placeholder="电影上传" class="form-control">--%>
<%--                </div>--%>
                <div class="form-group" style="margin-left: 46%">
                    <input type="submit" value="提交" class="btn btn-primary" onclick="getText()">
                </div>
            </form>
        </div>
    </section>

    <%--js--%>
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/plugins.js"></script>
    <script src="js/classy-nav.min.js"></script>
    <script src="js/active.js"></script>
</body>
</html>
