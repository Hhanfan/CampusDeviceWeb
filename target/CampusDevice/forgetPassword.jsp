<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
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

<div class="container">
    <div class="row">
        <div class="col-lg-7"  style="padding-top:100px">
            <div class="hs-text">
                <h2>校园实验设备借用系统</h2>
            </div>
        </div>
        <div class="col-lg-5" style="padding-top: 20px">
            <form class="hero-form">
                <div class="text-center" style="margin-bottom: 10px">
                    <label style="color: white; font-size: 20px">重置密码</label>
                </div>
                <input type="text" placeholder="手机号" style="border-radius: 5px">
                <div class="row">
                    <input type="text" placeholder="验证码" style="border-radius: 5px; width:250px; margin-left: 15px">
                    <button class="btn" style="margin-left: 10px; width: 120px; height: 50px; background-color:darkblue;color: white; font-size: 15px;font-weight: bold">获取验证码</button>
                </div>
                <input type="text" placeholder="新密码" style="border-radius: 5px">
                <input type="text" placeholder="确认密码" style="border-radius: 5px">
                <button class="site-btn text-center" style="background-color:green; font-size: 15px;align-content: center;width: 160px;margin-left: 120px">提交</button>
                <div class="row">
                    <div class= "col-md-4" style="font-size: 15px;">
                        <a href="login.jsp" style="color: white; float: left;margin-left: 10px;text-decoration:underline">返  回</a>
                    </div>
                </div>
            </form>

        </div>
    </div>
</div>
<div class="hero-slider owl-carousel">
    <div class="hs-item set-bg" data-setbg="img/hero-slider/1.jpg"></div>
    <div class="hs-item set-bg" data-setbg="img/hero-slider/2.jpg"></div>
    <div class="hs-item set-bg" data-setbg="img/hero-slider/3.jpg"></div>
</div>
<!-- Hero Section end -->

<!--====== Javascripts & Jquery ======-->
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.slicknav.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/main.js"></script>

</body>
</html>
