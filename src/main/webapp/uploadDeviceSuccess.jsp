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
    <link href="https://cdn.bootcss.com/bootstrap-fileinput/5.0.6/css/fileinput.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/theme.min.css">
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
            <div class="navbar-header" style="line-height: 54px">
                <a class="navbar-brand" href="">
                    <p style="font-size:20px;margin-top:10px;">校园实验设备借用系统</p>
                </a>
            </div>
            <!-- ============================================================== -->
            <!-- End Logo -->
            <!-- ============================================================== -->
            <div class="navbar-collapse" style="vertical-align: center">
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
                    <h3 class="text-themecolor m-b-0 m-t-0">设备信息</h3>
                </div>
            </div>

            <div class="row" style="margin-left:0;margin-bottom: 10px">
                <button onclick="operatebtn()" type="button" class="btn btn-info" style="margin-right: 5px">编辑</button>
                <button type="button" class="btn btn-info" style="margin-right: 5px" data-toggle="modal" data-target="#entryDevice">录入设备</button>
                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#inputDevice">批量导入</button>
                <button id="cancelEdit" type="button" class="btn btn-info" style="margin-left: 560px; display: none" onclick="cancelbtn()">取消编辑</button>
                <button id="modifyD" type="button" class="btn btn-info" style="margin-left: 5px;display: none" data-toggle="modal" data-target="#modifyDevice">修改设备</button>
                <button id="deleteD" type="button" class="btn btn-info" style="margin-left: 5px; display: none" data-toggle="modal" data-target="#deleteDevice">删除设备</button>
            </div>
            <!--录入设备模态框-->
            <div class="modal fade" id="entryDevice" tabindex="-1" role="dialog" aria-labelledby="entryTitle" aria-hidden="false">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalTitle">
                                录入设备
                            </h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <s:form action="enterdevice" method="POST" role="form" theme="simple" >
                            <div class="modal-body" style="margin-bottom: -35px">
                                <div class="form-group">
                                    <label class="col-md-12">设备编号</label>
                                    <div class="col-md-12">
                                        <input type="text" placeholder="" name="device.d_no" class="form-control form-control-line" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">设备名称</label>
                                    <div class="col-md-12">
                                        <input type="text" placeholder="" name="device.d_name" class="form-control form-control-line">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">设备型号</label>
                                    <div class="col-md-12">
                                        <input type="text" value="" name="device.d_model" class="form-control form-control-line">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">设备场地</label>
                                    <div class="col-md-12">
                                        <input type="text" placeholder="" name="device.d_saveSite" class="form-control form-control-line">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">设备出厂号</label>
                                    <div class="col-md-12">
                                        <input type="text" placeholder="" name="device.d_factoryNo" class="form-control form-control-line">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-12">设备状态</label>
                                    <div class="col-md-12">
                                        <select class="form-control" name="device.d_state">
                                            <option>在库</option>
                                            <option>外借</option>
                                            <option>维修</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">入库日期</label>
                                    <input class="form-control" type="date">
                                    <div class="input-append date form_date col-md-12" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                                        <input class="form-control col-md-12" type="text" value="点击选择日期">
                                        <span class="add-on"><i class="icon-remove"></i></span>
                                        <span class="add-on"><i class="icon-th"></i></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">设备图片</label>
                                    <div class="col-md-12">
                                        <s:file type="file" class="file"  data-show-preview="false" data-show-upload="flase"
                                                data-browse-label="浏览" data-show-remove="false" />
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <s:submit type="button" class="btn btn-primary">确认录入</s:submit>
                            </div>
                        </s:form>
                    </div>
                </div>
            </div>
            <!--修改设备模态框-->
            <div class="modal fade" id="modifyDevice" tabindex="-1" role="dialog" aria-labelledby="modifyTitle" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="modifyTitle">
                                修改设备状态
                            </h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body" style="margin-bottom: -35px">
                            <div class="form-group">
                                <label class="col-md-12">修改设备状态</label>
                                <div class="col-md-12">
                                    <select class="form-control">
                                        <option>在库</option>
                                        <option>外借</option>
                                        <option>维修</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal">确认修改</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--删除设备模态框-->
            <div class="modal fade" id="deleteDevice" tabindex="-1" role="dialog" aria-labelledby="deleteTitle" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="deleteTitle">
                                删除设备
                            </h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p>是否确认删除所选设备？</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal">确认删除</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--批量导入设备模态框-->
            <div class="modal fade" id="inputDevice" tabindex="-1" role="dialog" aria-labelledby="inputTitle" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="inputTitle">
                                批量导入设备
                            </h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <s:form action="upload" method="POST" enctype="multipart/form-data" theme="simple">
                            <div class="modal-body">
                                <s:file name="upload" id="f_upload" type="file" class="file" data-show-preview="false" data-show-upload="false"
                                        data-browse-label="浏览" data-remove-label="移除" />
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <s:submit type="button" class="btn btn-primary">确认导入</s:submit>
                            </div>
                        </s:form>
                    </div>
                </div>
            </div>
            <!--设备批量导入成功提示模态框-->
            <div class="modal fade" data-backdrop="static" id="inputDeviceSuccess" tabindex="-1" role="dialog" aria-labelledby="inputSuccessTitle" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">
                            </h4>
                            <button type="button" class="close" aria-label="Close">
                                <span aria-hidden="true"><a href="device.action?page=1">×</a></span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p>设备批量导入成功！</p>
                        </div>
                    </div>
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
                                        <th scope="col">仪器标号</th>
                                        <th scope="col">仪器名称</th>
                                        <th scope="col">型号</th>
                                        <th scope="col">存放地</th>
                                        <th scope="col">出厂号</th>
                                        <th scope="col">状态</th>
                                        <th scope="col">入库日期</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <s:iterator value="#session.devices" var="d">
                                        <tr>
                                            <td><s:property value="#d.d_no"/> </td>
                                            <td><s:property value="#d.d_name"/> </td>
                                            <td><s:property value="#d.d_model"/> </td>
                                            <td><s:property value="#d.d_saveSite"/> </td>
                                            <td><s:property value="#d.d_factoryNo"/> </td>
                                            <td><s:property value="#d.d_state"/> </td>
                                            <td><s:property value="#d.d_storeDate"/> </td>
                                        </tr>
                                    </s:iterator>
                                    </tbody>
                                </table>
                                <nav aria-label="Page navigation example" class="text-center" >
                                    <ul class="pagination justify-content-center" id="mytab">
                                        <%
                                            int startpage=(int)session.getAttribute("startpage");
                                            int endpage=(int)session.getAttribute("endpage");
                                            int pages=(int)session.getAttribute("page");
                                            int maxpage=(int)session.getAttribute("maxpage");
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
                                            <a class="page-link" href="device?page=<%=pages%>&sp=<%=startpage-1%>" >&laquo;</a>
                                        </li>
                                        <%
                                            }
                                            for(i=startpage;i<=endpage;i++)
                                            {
                                                if(i==pages)
                                                {
                                        %>
                                        <li class="active page-item" aria-current="page">
                                            <a class="page-link" href="device?page=<%=i%>"><%=i%></a>
                                        </li>
                                        <%
                                        }
                                        else
                                        {
                                        %>
                                        <li class="page-item">
                                            <a class="page-link" href="device?page=<%=i%>"><%=i%></a>
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
                                            <a class="page-link" href="device?page=<%=pages%>&sp=<%=startpage+1%>">&raquo;</a>
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
        </div>
        <footer class="footer text-center">
            © 2019 Admin by Shankupaolu
        </footer>
        <!-- ============================================================== -->
        <!-- End Container fluid  -->
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

<script src="js/piexif.min.js"></script>
<script src="js/purify.min.js"></script>
<script src="js/fileinput.min.js"></script>
<script src="js/zh.js"></script>
<script src="js/theme.min.js"></script>

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
<script type="text/javascript">
    function operatebtn(){
        box.style.display="";
        box1.style.display="";
        modifyD.style.display="";
        deleteD.style.display="";
        cancelEdit.style.display="";
    };
    function cancelbtn(){
        box.style.display="none";
        box1.style.display="none";
        modifyD.style.display="none";
        deleteD.style.display="none";
        cancelEdit.style.display="none";
    };
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
    window.onload=function(){
        $("#inputDeviceSuccess").modal();
    }
</script>
</body>
</html>
