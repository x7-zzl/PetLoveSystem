<%@ page import="model.DBConnectionManager" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: koutoimi
  Date: 2022/6/2
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码界面</title>
    <link rel="stylesheet" type="text/css" href="css/all_background.css">
</head>
<body>

<%
    request.setCharacterEncoding("utf-8");

    String out_user_name = request.getParameter("out_user_name");//账号
    String out_pass = request.getParameter("out_pass");//原密码

    String pass_prev = request.getParameter("pass_prev");//用户输入的原密码
    String pass_now = request.getParameter("pass_now");//修改的密码

    if ("".equals(pass_prev) || "".equals(pass_now)) {
%>

<script language="JavaScript">
    alert("请输入密码");
    window.location = "personalInfo.jsp";
</script>


<%
} else if (!out_pass.equals(pass_prev)) {
%>
<script language="JavaScript">
    alert("你输入的密码与原密码不一致");
    window.location = "personalInfo.jsp";
</script>

<%
} else {
    DBConnectionManager dbConnectionManager = new DBConnectionManager();
    String sql = "update employeeAccount set password=? where userName=?";
    PreparedStatement ps = dbConnectionManager.getPreparedStatement(sql);
    ps.setString(1, pass_now);
    ps.setString(2, out_user_name);
    ps.executeUpdate();

%>
<script language="JavaScript">
    alert("密码修改成功，请重新登录");
</script>

<%--自动触发超链接--%>
<script type="text/javascript">
    function aClick() {
        setTimeout(function () {
            // IE
            if (document.all) {
                document.getElementById("clickMe").click();
            }
            // 其它浏览器
            else {
                var e = document.createEvent("MouseEvents");
                e.initEvent("click", true, true);
                document.getElementById("clickMe").dispatchEvent(e);
            }
        }, 500);
    }

    window.onload = aClick();
</script>
<a href="loginPet.jsp" target="_top" class="a" id="clickMe"></a>

<%
    }
%>
</body>
</html>
