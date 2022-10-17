<%@ page import="controller.MasterDao" %>
<%@ page import="java.sql.Connection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除数据</title>
    <link rel="stylesheet" type="text/css" href="css/all_function_show.css">
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    int masterId = Integer.parseInt(request.getParameter("masterId"));

    MasterDao dao = new MasterDao();
    Connection connection = dao.getConnection();
    if (connection != null) {
       dao.delete(masterId);
%>

<script language="JavaScript">
    var t=<%=masterId%>;
    alert("客户编号为"+t+"的信息删除成功");
    window.location.href="masterPet.jsp"
</script>

<%--<a href="masterPet.jsp?masterId=?">返回</a>--%>
<%
    } else {
        out.println("数据库连接失败");
    }
%>
</body>
</html>