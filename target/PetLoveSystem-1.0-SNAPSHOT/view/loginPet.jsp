<%--
  “爱心”宠物诊所的职员需要使用系统提供的如下功能：
①浏览诊所的兽医以及他们的专业特长；
②浏览宠物的主人（即诊所的客户）的相关信息；
③更新宠物的主人的相关信息；
④向系统中增加一个新客户；
⑤浏览宠物的相关信息；
⑥更新宠物的相关信息；
⑦向系统中增加一个新宠物；
⑧浏览宠物的访问历史记录；
⑨向宠物的访问历史记录添加一次访问；
⑩此外，诊所的职员在使用系统提供的上述功能之前需要进行登录。当职员不需要使用系统的上述功能时，也可退出系统。
“爱心”宠物诊所的职员需要使用系统提供的如下功能：
①浏览诊所的兽医以及他们的专业特长；
②浏览宠物的主人（即诊所的客户）的相关信息；
③更新宠物的主人的相关信息；
④向系统中增加一个新客户；
⑤浏览宠物的相关信息；
⑥更新宠物的相关信息；
⑦向系统中增加一个新宠物；
⑧浏览宠物的访问历史记录；
⑨向宠物的访问历史记录添加一次访问；
⑩此外，诊所的职员在使用系统提供的上述功能之前需要进行登录。当职员不需要使用系统的上述功能时，也可退出系统。

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录界面</title>
    <link rel="stylesheet" type="text/css" href="css/all_background.css">
    <link rel="stylesheet" type="text/css" href="css/iconfont.css"/>
</head>
<body>

<div class="loginBox">

    <h2>"爱心"宠物诊所系统</h2>

    <form action="loginPetCheck.jsp" method="post" name="form1">
        &nbsp;&nbsp;&nbsp;
        <i class="iconfont">&#xe609;</i>
        <input type="text" name="e_name" placeholder="用户名" size="30" class="input_style" required>

        <br>
        &nbsp;&nbsp;&nbsp;
        <i class="iconfont">&#xe605;</i>&nbsp;

        <input type="password" name="e_password" placeholder="密码" size="30" class="input_style" required>
        <br>
        <%--        设置点击确定按钮也可以提交--%>
        <button type="submit" class="btn" onkeydown="if(event.keyCode==13){form1.submit.focus();}">登录</button>&nbsp;&nbsp;
        <button type="reset" class="btn">清空</button>
        <br>

        <p style="font-size:1px; text-align:center"><%--消除超链接的下划线--%>
            <a align="center" href="forgetPassword.jsp" style="text-decoration:none;">忘记密码？</a>
        </p>
    </form>

    <p style="font-size:20px"><%--消除超链接的下划线--%>
        <a href="register.jsp" class="topcorner" style="text-decoration:none;">没有账号?点击注册</a>
    </p>
    <%--    返回错误信息--%>
    <%
        //防止出现乱码
        request.setCharacterEncoding("UTF-8");
        String errorLoginMessage = request.getParameter("errorLoginMessage");
        if (errorLoginMessage != null) {
    %>

    <%--    通过JavaScript弹出返回错误信息的对话框--%>
    <script language="JavaScript">
        var temp = "<%=errorLoginMessage%>"
        alert(temp);
    </script>
    <% }%>

</div>


</body>
</html>
