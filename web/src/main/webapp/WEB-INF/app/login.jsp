<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/js/jquery-2.1.4.js" var="jquery" />
<spring:url value="/resources/css/login.css" var="loginCss" />
<!DOCTYPE html>
<html manifest="">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>演示项目登陆</title>
    <script type="text/javascript" src="${jquery}"></script>
    <link type="text/css" rel="stylesheet" href="${loginCss}">

</head>
<body class="small login">
<script language="javascript">
    $(window).load(function() {
        $("#password").keydown(function(e){
            var code = e.keyCode || e.which;
            if(code == 13) { //Enter keycode
                login();
            }

        });
    })

    function login(){
        var name=$("#username").val();
        var pwd=$("#password").val();
        if(name=='' || name==null){
            alert("用户名不能为空");
            return
        }
        if(pwd=='' || pwd==null){
            alert("密码不能为空");
            return
        }
        $.post("login.do",
                {
                    "username":name,
                    "password":pwd
                },
                function(data,status){
                    if(status=="success"){
                        var dataObj= $.parseJSON(data)
                        if(dataObj.success){
                            window.location.replace("home");
                        }else{
                            alert(dataObj.msg)
                        }
                    }else{
                        alert("登陆失败")
                    }
                }
        );
    }
</script>
<div id="header">
    <div class="wrapper">
        <img src="/resources/img/yu.jpg"/>
    </div>
</div>
<div id="container">
    <div id="content">
        <div class="wrapper">
            <form name="f_0_11_1_3_1" method="post" action="">
                <input value="false" name="returning" id="returning" type="hidden">
                <table class="login" style="margin-left: auto; margin-right: auto;">
                    <tbody>
                    <tr>
                        <td>
                            <p class="mtop0 mbottom025"><strong><label for="username">用户名</label></strong></p>
                            <input id="username" tabindex="1" class="inputtext" name="email" type="text"></td>
                    </tr>
                    <tr>
                        <td>
                            <p class="mtop05 mbottom025"><strong><label for="password">密码</label></strong></p>
                            <input tabindex="2" class="inputtext" name="password" id="password" type="password"></td>
                    </tr>

                    <tr>
                        <td>
                            <p class="mtop025 mbottom0 smalltxt"><a href="">忘记密码？</a>
                            </p>
                        </td>
                    </tr>

                    <tr>
                        <td style="padding-top: 10px;"><input class="public-button" tabindex="4" value="登录" type="button" accessKey="Enter" onclick="login()"></td>
                    </tr>
                    </tbody></table>
            </form>



        </div> <!-- wrapper -->
    </div> <!-- content -->
</div> <!-- container -->

<div id="footer">
    <div class="wrapper">
        <p id="copyright">
            Copyright © 2015 <a href="http://www.enoughpepper.com/">peter</a>. All rights reserved.
        </p>
    </div>
</div>
</body>
</html>