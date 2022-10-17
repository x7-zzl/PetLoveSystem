<%@ page import="model.DBConnectionManager" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: koutoimi
  Date: 2022/6/5
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>宠物更新信息处理界面</title>
    <link rel="stylesheet" type="text/css" href="css/all_function_show.css">
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
//    获取信息
    String petId = request.getParameter("petId");
    String petName = request.getParameter("petName");
    String petAge = request.getParameter("petAge");
    String petSex = request.getParameter("petSex");
    String petType = request.getParameter("petType");

    String masterName = request.getParameter("masterName");
    String masterId = request.getParameter("masterId");
    if (masterName.equals("") || petAge.equals("") || petSex.equals("") || petName.equals("") || petType.equals("")||petId.equals("")) {
%>
<script>
    alert("不能为空，请输入内容");
    window.location.href = "petInfo.jsp"
</script>
<%
    }
    DBConnectionManager dbConn = new DBConnectionManager();
    String umr_sql = "update petinfo set petName=?,petAge=?,petSex=?,petType=? where petId=?";
    PreparedStatement ps = dbConn.getPreparedStatement(umr_sql);
    ps.setString(1, petName);
    ps.setString(2, petAge);
    ps.setString(3, petSex);
    ps.setString(4, petType);
    ps.setString(5, petId);
    ps.executeUpdate();
%>

<script>
    alert("修改成功");
    window.location.href = "petInfo.jsp"
</script>
</body>
</html>
