<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
    <title>校园实验设备借用系统</title>
    <!-- Bootstrap Core CSS -->
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/style.css" rel="stylesheet">
    <!-- You can change the theme colors from here -->
    <link href="css/colors/blue.css" id="theme" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body class="fix-header card-no-border">
<!-- ============================================================== -->
<!-- Main wrapper - style you can find in pages.scss -->
<!-- ============================================================== -->
<div id="main-wrapper">
    <!-- ============================================================== -->
    <!-- Topbar header - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <header class="topbar">
        <nav class="navbar top-navbar navbar-toggleable-sm navbar-light">
            <!-- ============================================================== -->
            <!-- Logo -->
            <!-- ============================================================== -->
            <div class="navbar-header">
                <a class="navbar-brand" href="">
                    <p style="font-size:20px;margin-top:10px;">校园实验设备借用系统</p>
                </a>
            </div>
            <!-- ============================================================== -->
            <!-- End Logo -->
            <!-- ============================================================== -->
            <div class="navbar-collapse">
                <!-- ============================================================== -->
                <!-- toggle and nav items -->
                <!-- ============================================================== -->
                <ul class="navbar-nav mr-auto mt-md-0 ">
                    <!-- This is  -->
                    <li class="nav-item"> <a class="nav-link nav-toggler hidden-md-up text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="ti-menu"></i></a> </li>
                    <li class="nav-item hidden-sm-down">
                        <form class="app-search p-l-20">
                            <input type="text" class="form-control" placeholder="Search for..."> <a class="srh-btn"><i class="ti-search"></i></a>
                        </form>
                    </li>
                </ul>
                <!-- ============================================================== -->
                <!-- User profile and search -->
                <!-- ============================================================== -->
                <ul class="navbar-nav my-lg-0">
                    <li class="nav-item row">
                        <a class="nav-link">
                            <img src="assets/images/users/管理员认证.png" alt="user" class="profile-pic m-r-10"/>
                            <span id="userDisplay">
                        <s:set var="adm" value="#session.adm"/>
                        <s:property value="#adm.a_name"/>
                        <s:property value="#adm.a_type"/>
                    </span>
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <!-- ============================================================== -->
    <!-- End Topbar header -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Left Sidebar - style you can find in sidebar.scss  -->
    <!-- ============================================================== -->
    <aside class="left-sidebar">
        <!-- Sidebar scroll-->
        <div class="scroll-sidebar">
            <!-- Sidebar navigation-->
            <nav class="sidebar-nav">
                <ul id="sidebarnav">
                    <li>
                        <a href="PersonalData.jsp" class="waves-effect"><i class="fa fa-user m-r-10" aria-hidden="true"></i>个人资料</a>
                    </li>
                    <li>
                        <a href="returned.action" class="waves-effect"><i class="fa fa-table m-r-10" aria-hidden="true"></i>设备归还</a>
                    </li>
                    <li>
                        <a href="findrsrv.action" class="waves-effect"><i class="fa fa-font m-r-10" aria-hidden="true"></i>设备预约</a>
                    </li>
                    <li>
                        <a href="feedback.action?page=1" class="waves-effect"><i class="fa fa-globe m-r-10" aria-hidden="true"></i>用户反馈</a>
                    </li>
                    <li>
                        <a href="device.action?page=1" class="waves-effect"><i class="fa fa-columns m-r-10" aria-hidden="true"></i>管理设备</a>
                    </li>
                    <li>
                        <a href="overdue.action" class="waves-effect"><i class="fa fa-columns m-r-10" aria-hidden="true"></i>逾期未还记录</a>
                    </li>
                </ul>
                <div class="text-center m-t-30">
                    <a href="login.jsp" class="btn btn-danger">退出登录</a>
                </div>
            </nav>
            <!-- End Sidebar navigation -->
        </div>
        <!-- End Sidebar scroll-->
    </aside>
    <!-- ============================================================== -->
    <!-- End Left Sidebar - style you can find in sidebar.scss  -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Page wrapper  -->
    <!-- ============================================================== -->
    <div class="page-wrapper">
        <!-- ============================================================== -->
        <!-- Container fluid  -->
        <!-- ============================================================== -->
        <div class="container-fluid">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="row page-titles">
                <div class="col-md-6 col-8 align-self-center">
                    <h3 class="text-themecolor m-b-0 m-t-0">反馈信息</h3>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Start Page Content -->
            <!-- ============================================================== -->
            <div class="row">
                <!-- column -->
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-block">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <style>
                                        .table th,.table td{
                                            text-align: center;
                                            vertical-align: middle;
                                        }
                                    </style>
                                    <thead>
                                    <tr>
                                        <th>信息编号</th>
                                        <th>学工号</th>
                                        <th>姓名</th>
                                        <th>反馈内容</th>
                                        <th>反馈日期</th>
                                        <th>回复</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <s:iterator value="#session.feedbacks" var="fb">
                                        <tr>
                                            <td><s:property value="#fb.f_no"/></td>
                                            <td><s:property value="#fb.u_no"/> </td>
                                            <td><s:property value="#fb.u_name"/> </td>
                                            <td><s:property value="#fb.f_content"/></td>
                                            <td><s:property value="#fb.f_date"/></td>
                                            <td>
                                                <button type="button" class="btn btn-custom" data-toggle="modal" data-target="#<s:property value="#fb.f_no"/>">回复</button>
                                            </td>
                                        </tr>
                                        <!--  回复模态框-->
                                        <div class="modal fade" id="<s:property value="#fb.f_no"/>" tabindex="-1" role="dialog" aria-labelledby="replyTitle" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h4 class="modal-title" id="replyTitle">
                                                            回复
                                                        </h4>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">×</span>
                                                        </button>
                                                    </div>
                                                    <s:form theme="simple" action="reply" method="POST" role="form">
                                                        <div class="modal-body">
                                                            <textarea class="form-control" name="m_content" rows="10" placeholder="请输入回复的具体内容"></textarea>
                                                        </div>
                                                        <s:hidden name="f_no" value="%{#fb.f_no}"/>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                                            <button type="submit" class="btn btn-primary">回复</button>
                                                        </div>
                                                    </s:form>
                                                </div>
                                            </div>
                                        </div>
                                    </s:iterator>
                                    </tbody>
                                </table>
                                <nav aria-label="Page navigation example" class="text-center" >
                                    <ul class="pagination justify-content-center" id="mytab">
                                        <%
                                            int startpage=(Integer)session.getAttribute("startpage");
                                            int endpage=(Integer)session.getAttribute("endpage");
                                            int pages=(Integer)session.getAttribute("page");
                                            int maxpage=(Integer)session.getAttribute("maxpage");
                                            int i;
                                            if(startpage==1)
                                            {
                                        %>
                                        <!--向前-->
                                        <li class="page-item disabled">
                                            <a class="page-link" href="#" aria-disabled="true">&laquo;</a>
                                        </li>
                                        <%
                                        }
                                        else
                                        {
                                        %>
                                        <li class="page-item">
                                            <a class="page-link" href="feedback?page=<%=pages%>&sp=<%=startpage-1%>" >&laquo;</a>
                                        </li>
                                        <%
                                            }
                                            for(i=startpage;i<=endpage;i++)
                                            {
                                                if(i==pages)
                                                {
                                        %>
                                        <li class="active page-item" aria-current="page">
                                            <a class="page-link" href="feedback?page=<%=i%>"><%=i%></a>
                                        </li>
                                        <%
                                        }
                                        else
                                        {
                                        %>
                                        <li class="page-item">
                                            <a class="page-link" href="feedback?page=<%=i%>"><%=i%></a>
                                        </li>
                                        <%
                                                }
                                            }
                                            if(endpage==maxpage)
                                            {
                                        %>
                                        <li class="page-item disabled">
                                            <a class="page-link" href="#" aria-disabled="true">&raquo;</a>
                                        </li>
                                        <%
                                        }
                                        else
                                        {
                                        %>
                                        <li class="page-item">
                                            <a class="page-link" href="feedback?page=<%=pages%>&sp=<%=startpage+1%>">&raquo;</a>
                                        </li>
                                        <%
                                            }
                                        %>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End PAge Content -->
            <!-- ============================================================== -->
            <!--回复成功模态框-->
            <div class="modal fade" id="replySuccess" tabindex="-1" role="dialog" aria-labelledby="replySuccessTitle" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id=" ">
                            </h4>
                            <button type="button" class="close" aria-label="Close">
                                <span aria-hidden="true"><a href="feedback.action?page=1">×</a></span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p>回复成功！</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- End Container fluid  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- footer -->
        <!-- ============================================================== -->
        <footer class="footer text-center">
            © 2019 Admin by Shankupaolu
        </footer>
        <!-- ============================================================== -->
        <!-- End footer -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Page wrapper  -->
    <!-- ============================================================== -->
</div>
<!-- ============================================================== -->
<!-- End Wrapper -->
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- All Jquery -->
<!-- ============================================================== -->
<script src="assets/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="assets/plugins/bootstrap/js/tether.min.js"></script>
<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- slimscrollbar scrollbar JavaScript -->
<script src="js/jquery.slimscroll.js"></script>
<!--Wave Effects -->
<script src="js/waves.js"></script>
<!--Menu sidebar -->
<script src="js/sidebarmenu.js"></script>
<!--stickey kit -->
<script src="assets/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
<!--Custom JavaScript -->
<script src="js/custom.min.js"></script>
<!-- ============================================================== -->
<!-- Style switcher -->
<!-- ============================================================== -->
<script src="assets/plugins/styleswitcher/jQuery.style.switcher.js"></script>
<script>
    window.onload=function(){
        $("#replySuccess").modal();
    }
</script>
</body>

</html>
