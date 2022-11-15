<%@ page import="movie.moviedao.LookMovieDao" %>
<%@ page import="movie.moviedao.LookMovieDaoImpl" %>
<%@ page import="movie.entity.Movie" %>
<%@ page import="java.util.List" %>
<%@ page import="movie.movieTypedao.LookMovieTypeDao" %>
<%@ page import="movie.movieTypedao.LookMovieTypeDaoImpl" %>
<%@ page import="movie.entity.MovieType" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>电影后台管理系统</title>

    <%--css--%>
    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" href="css/style.css">
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        .container1{
            margin: 100px auto;
            width: 1000px;
            height: 400px;
            overflow: hidden;
        }
        .container1 ul{
            display: flex;
        }
        .container1 li{
            width: 200px;
            height: 400px;
            list-style: none;
            box-shadow: 0 0 25px #000;
            transition: all 0.5s;
        }
        .container1 li img{
            display: block;
            width: 1000px;
            height: 400px;
        }
        .container1 ul:hover li{
            width: 40px;
        }
        .container1 ul li:hover{
            width: 860px;
        }
    </style>
</head>
<body>
    <!-- ##### Header Area Start ##### -->
    <header class="header_area">
        <div class="classy-nav-container breakpoint-off d-flex align-items-center justify-content-between" style="height: 40px">
            <!-- Classy Menu -->
            <nav class="classy-navbar" id="essenceNav" style="margin-left: 61% ">
                <div class="classy-navbar-toggler">
                    <span class="navbarToggler"></span>
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

                </div>
            </nav>

        </div>
    </header>

<%--    百叶窗效果--%>
    <div class="container1">
        <ul>
            <li><a href="https://www.bilibili.com/bangumi/play/ss25568?theme=movie&from_spmid=666.7.operation.2" target="_blank"><img src="movieImg/阿甘正传.jpg" title="阿甘正传"></a></li>
            <li><a href="https://www.bilibili.com/bangumi/play/ep415760?theme=movie&spm_id_from=333.337.0.0" target="_blank"><img src="movieImg/恋恋笔记本.jpg" title="恋恋笔记本"></a></li>
            <li><a href="https://www.bilibili.com/bangumi/play/ss28585?theme=movie&from_spmid=666.7.operation.4" target="_blank"><img src="movieImg/星际穿越.jpg" title="星际穿越"></a></li>
            <li><a href="https://www.bilibili.com/bangumi/play/ss12548?theme=movie&spm_id_from=333.337.0.0" target="_blank"><img src="movieImg/让子弹飞.jpg" title="让子弹飞"></a></li>
            <li><a href="https://www.bilibili.com/bangumi/play/ss28274?theme=movie&from_spmid=666.7.operation.1" target="_blank"><img src="movieImg/肖申克的救赎.jpg" title="肖申克的救赎"></a></li>
        </ul>
    </div>


    <div style="width: 60%; margin-left: 20%">

        <%
            LookMovieDao lookMovieDao=new LookMovieDaoImpl();
            LookMovieTypeDao lookMovieTypeDao=new LookMovieTypeDaoImpl();
            List<MovieType> type=lookMovieTypeDao.look();

            for(MovieType movieType:type){
        %>

            <div class="title">
                <p style="font-size: 25px ;background-color: #13151b;color: white"><%=movieType.getType()%><a href="showMovie.jsp?type=<%=movieType.getType()%>" style="float: right;font-size: 25px">更多>></a></p>
                <div class="row">
        <%
            List<Movie> listType=lookMovieDao.lookType(movieType.getType());
            for (Movie movie : listType) {
        %>

            <div class="col-sm-6 col-md-3">
                <div class="img-thumbnail" style="border: 0">
                    <a href="<%=movie.getSrc()%>" target="_blank">
                        <img src="<%=movie.getImg()%>" title="<%=movie.getTitle()%>" style="border: 0">
                    </a>
                    <div class="figure-caption" style="text-align: center;size: 20px">
                        <a href="<%=movie.getSrc()%>" target="_blank" style="font-size: 20px;color:#000;"><%=movie.getTitle()%></a>
                    </div>
                </div>
            </div>
        <%
        }

        %>
                </div>
            </div>
        <%
            }
        %>

    </div>




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
