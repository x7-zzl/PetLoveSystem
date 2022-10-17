<%@ page import="model.DBConnectionManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: koutoimi
  Date: 2022/6/5
  Time: 17:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>宠物信息删除界面</title>
    <link rel="stylesheet" type="text/css" href="css/all_function_show.css">
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    int petId = Integer.parseInt(request.getParameter("petId"));

    DBConnectionManager dbConnectionManager = new DBConnectionManager();
    String sql = "delete from petinfo where petId=?";
    PreparedStatement ps = dbConnectionManager.getPreparedStatement(sql);
    ps.setInt(1, petId);
    ps.executeUpdate();
    System.out.println("delete from petinfo where petId=" + petId);
%>
<script language="JavaScript">
    var t =<%=petId%>;
    alert("宠物编号为" + t + "的信息删除成功");
    window.location.href = "petInfo.jsp"
</script>
<%
    if (ps != null) {
        ps.close();
    }
%>
</body>
</html>
