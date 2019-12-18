<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!--引用Struts2的标签库-->
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <title>校园实验设备借用系统</title>
    <meta charset="UTF-8">
    <meta name="description" content="loans HTML Template">
    <meta name="keywords" content="loans, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Favicon -->
    <link href="img/favicon.png" rel="shortcut icon"/>

    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&display=swap" rel="stylesheet">

    <!-- Stylesheets -->
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/owl.carousel.min.css"/>
    <link rel="stylesheet" href="css/flaticon.css"/>
    <link rel="stylesheet" href="css/slicknav.min.css"/>

    <!-- Main Stylesheets -->
    <link rel="stylesheet" href="css/style1.css"/>


    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>
<!-- Hero Section  -->
<div class="container">
    <div class="row" style="padding-top:100px">
        <div class="col-lg-7">
            <div class="hs-text">
                <h2>校园实验设备借用系统</h2>
                <!--						<p>欢迎您的使用</p>-->
                <!--						<a href="#" class="site-btn sb-dark">Find out more</a>-->
            </div>
        </div>
        <div class="col-lg-5">
            <s:form action="main" method="POST" role="form" theme="simple" class="hero-form">
                <div class="text-center" style="margin-bottom: 10px">
                    <label style="color: white; font-size: 20px">管理员登陆</label>
                </div>
                <s:textfield class="form-control" id="adm.a_no" name="adm.a_no" placeholder="学工号" style="border-radius: 5px"/>
                <s:password class="form-control" id="adm.a_password" name="adm.a_password" placeholder="密码" style="border-radius: 5px" onchange="encryption(this.id)"/>
                <!--						<button class="btn btn-primary btn-lg site-btn" value="登录"/>-->
                <div class="row" style="vertical-align: center">
                    <div class=" col-md-8">
                        <input type="checkbox" value="" style="height: 15px; width:15px;">
                        <label style="color: white"><a style="font-size: 15px">记住密码</a></label>
                    </div>
                    <div class= "col-md-4" style="font-size: 15px">
                        <a href="forgetPassword.jsp" style="color: white; float: right; text-decoration: underline ">忘记密码？</a>
                    </div>
                </div>

                <button class="site-btn text-center" style="width:160px; margin-left: 100px;background-color:green; font-size: 15px">登陆</button>
            </s:form>

        </div>
    </div>
</div>
<div class="hero-slider owl-carousel">
    <div class="hs-item set-bg" data-setbg="img/hero-slider/3.jpg"></div>
    <div class="hs-item set-bg" data-setbg="img/hero-slider/1.jpg"></div>
    <div class="hs-item set-bg" data-setbg="img/hero-slider/2.jpg"></div>
</div>
<!-- Hero Section end -->

<!--====== Javascripts & Jquery ======-->
<script src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/jQuery.md5.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.slicknav.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/main.js"></script>
<script>
    //加密
    function encryption(x)
    {
        var y=document.getElementById(x).value;
        document.getElementById(x).value=$.md5(y);
    }
</script>
<script type="text/javascript">
    $(function(){
        if(window.history && window.history.pushState){
            $(window).on("popstate", function(){
                window.history.pushState("forward", null, "#");
                window.history.forward(1);
            });
        }
        window.history.pushState("forward", null, "#"); //在IE中必须得有这两行
        window.history.forward(1);
    });
</script>
</body>
</html>
