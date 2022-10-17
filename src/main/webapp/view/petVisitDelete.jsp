<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="model.DBConnectionManager" %><%--
  Created by IntelliJ IDEA.
  User: koutoimi
  Date: 2022/6/6
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>宠物访问历史删除界面</title>
    <link rel="stylesheet" type="text/css" href="css/all_function_show.css">
</head>
<body>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String petId = request.getParameter("petId");
    String petHistoryVisitDate = request.getParameter("petHistoryVisitDate");

    DBConnectionManager dbConnectionManager = new DBConnectionManager();
    String sql = "delete from pethistoryvisit where petId=? and petHistoryVisitDate=?";
    PreparedStatement ps = dbConnectionManager.getPreparedStatement(sql);
    ps.setString(1, petId);
    ps.setString(2, petHistoryVisitDate);
    ps.executeUpdate();
    System.out.println(sql);
%>
<script language="JavaScript">
    alert("删除成功");
    window.location.href = "petVisit.jsp"
</script>
<%
    if (ps != null) {
        ps.close();
    }
%>
</body>
</body>
</html>
