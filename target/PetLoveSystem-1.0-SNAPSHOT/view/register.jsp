<%--
  Created by IntelliJ IDEA.
  User: koutoimi
  Date: 2022/5/31
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册界面</title>
    <link rel="stylesheet" type="text/css" href="css/all_background.css">
    <style type="text/css">
        .in_css {
            outline-style: hidden;
            border: 1px red;
            border-radius: 0;
            padding: 8px 12px;
        }

    </style>
</head>
<body>


<script type="text/javascript">
    // 通过时间来输出不重复的验证码图片
    function _change() {
        var imgEle = document.getElementById("vCode");
        imgEle.src = "/PetLoveSystem_war_exploded/VerifyCodeServlet?" + new Date().getTime();
    }

/*    //判断用户名格式
    function regName() {
        userName = document.getElementById("userName").value;
        var var1 = /^\w{5,16}$/;//用户名
        if (var1.test(userName)) {
            //用户名
            document.getElementById("regName").innerText = "正确";
            document.getElementById("regName").style.color = "green";
        } else {
            alert("用户名格式错误,应当输入5-16个字符，请重新输入");
            window.location.href="register.jsp";
        }
    }

    function regPwd() {
        pwd = document.getElementById("pwd").value;
        var var2 = /^\w{5,16}$/;//密码
        if (var2.test(pwd)) {
            //密码
            document.getElementById("regPwd").innerText = "正确";
            document.getElementById("regPwd").style.color = "green";
        } else {
            alert("密码格式错误，应当输入5-16个字符，请重新输入");
            window.location.href="register.jsp";
        }
    }

    function varReg() {
        regName();
        regPwd();
    }*/
</script>

<div class="loginBox" style="color: #f21f19;font-size: 16px;font-family: 宋体,serif">

    <form action="/PetLoveSystem_war_exploded/RegisterServlet" method="post">

        用户名:&nbsp;<input type="text" name="create_username" id="userName" class="in_css" placeholder="5-16个字符"/><br/><br/>
        <span id="regName"></span><br/>
        密 码:&nbsp;<input type="text" name="create_password" id="pwd" class="in_css" placeholder="5-16个字符"/><br/><br>
        <span id="regPwd"></span><br/>
        验证码:&nbsp;<input type="text" name="code" size="4" class="in_css"/>

        <%--    插入图片--%>
        <img id="vCode" src="/PetLoveSystem_war_exploded/VerifyCodeServlet"/>
        <a class="a" href="javascript:_change()" style="color: #47dc11;font-size: 16px">
            看不清?
        </a>
        <br/><br/>
        <input type="submit" value="注册" class="btn" onclick="varReg()"/>
    </form>
    <%--   返回登录界面--%>
    <br>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <a href="loginPet.jsp"><img src="image/return_login_1.png" alt="返回"></a>

</div>
</body>
</html>
