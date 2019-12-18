<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
                        <a href="overdue.action" class="waves-effect"><i class="fa fa-calendar-minus-o m-r-10" aria-hidden="true"></i>逾期未还记录</a>
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
                    <h3 class="text-themecolor m-b-0 m-t-0">详细预约信息</h3>
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
                                        <th>预约者姓名</th>
                                        <th>预约者学工号</th>
                                        <th>身份类型</th>
                                        <th>借用起始日期</th>
                                        <th>借用归还日期</th>
                                        <th>信用分</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        int x=0,y=0,z=0;
                                    %>
                                    <s:iterator value="#session.rsrvlist" var="rl">
                                        <%
                                            x++;y++;z++;
                                        %>
                                        <tr>
                                            <td><s:property value="#rl.u_name"/> </td>
                                            <td><s:property value="#rl.u_no"/> </td>
                                            <td><s:property value="#rl.u_type"/> </td>
                                            <td><s:property value="#rl.r_startDate"/> </td>
                                            <td><s:property value="#rl.r_returnDate"/> </td>
                                            <td><s:property value="#rl.u_creditGrade"/> </td>
                                            <td>
                                                <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#refuse">拒绝</button>
                                                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#<%=x%>">同意</button>
                                                <button type="button" class="btn btn-custom" data-toggle="modal" data-target="#modifyTime">调整时间</button>
                                            </td>
                                        </tr>
                                        <!--同意模态框-->
                                        <div class="modal fade" id="<%=x%>" tabindex="-1" role="dialog" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h4 class="modal-title" id="agreeTitle">
                                                            同意申请
                                                        </h4>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">×</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p>是否确认同意该预约申请</p>
                                                    </div>
                                                    <s:form method="POST" action="agreersrv" theme="simple" role="form">
                                                        <s:hidden name="r_no" value="%{#rl.r_no}"/>
                                                        <div class="modal-footer">
                                                            <button type="submit" class="btn btn-custom">确认</button>
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                                        </div>
                                                    </s:form>
                                                </div>
                                            </div>
                                        </div>
                                    </s:iterator>
                                    </tbody>
                                </table>
                                <!--拒绝模态框-->
                                <div class="modal fade" id="refuse" tabindex="-1" role="dialog" aria-labelledby="refuseTitle" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title" id="refuseTitle">
                                                    拒绝申请
                                                </h4>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">×</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <select class="form-control">
                                                    <option>选择的借用时间段有教师借用中</option>
                                                    <option>选择的借用时间段内设备定期维修中</option>
                                                    <option>其他</option>
                                                </select>
                                                <textarea class="form-control" rows="5" placeholder="请输入具体的拒绝理由" style="margin-top: 10px"></textarea>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                                <button type="button" class="btn btn-primary" data-dismiss="modal">确认拒绝</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--调整时间模态框-->
                                <div class="modal fade" id="modifyTime" tabindex="-1" role="dialog" aria-labelledby="modifyTimeTitle" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title" id="modifyTimeTitle">
                                                    调整借用时间段
                                                </h4>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">×</span>
                                                </button>
                                            </div>
                                            <div class="modal-body" style="margin-bottom: -20px">
                                                <div class="form-group">
                                                    <label class="col-md-12">调整时间理由</label>
                                                    <div class="col-md-12">
                                                        <textarea class="form-control" rows="5" placeholder="请输入调整时间的具体理由"></textarea>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-12">借用起始日期</label>
                                                    <div class="input-append date form_date col-md-12" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                                                        <input class="form-control col-md-12" type="text" value="点击选择借用起始日期">
                                                        <span class="add-on"><i class="icon-remove"></i></span>
                                                        <span class="add-on"><i class="icon-th"></i></span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-12">借用结束日期</label>
                                                    <div class="input-append date form_date col-md-12" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                                                        <input class="form-control col-md-12" type="text" value="点击选择借用结束日期">
                                                        <span class="add-on"><i class="icon-remove"></i></span>
                                                        <span class="add-on"><i class="icon-th"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                                <button type="button" class="btn btn-primary" data-dismiss="modal">确认</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!--操作成功提示框-->
                                <div class="modal fade" data-backdrop="static" id="operateSuccess" tabindex="-1" role="dialog" aria-labelledby="operateSuccessTitle" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title" id=" ">
                                                </h4>
                                                <button type="button" class="close" aria-label="Close">
                                                    <span aria-hidden="true"><a href="findrsrv.action">×</a> </span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <p>操作失败！该预约设备已报废</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End PAge Content -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Container fluid  -->
        <footer class="footer text-center">
            © 2019 Admin by Shankupaolu
        </footer>
        <!-- End footer -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Page wrapper  -->
    <!-- ============================================================== -->
</div>
<!-- End Wrapper -->
<!-- All Jquery -->
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
    $('.form_date').datetimepicker({
        language : 'zh-CN',
        format : 'yyyy-mm-dd',//日期格式
        //language:  'fr',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });
</script>
<script>
    window.onload=function()
    {
        $("#operateSuccess").modal();
    }
</script>
</body>

</html>
