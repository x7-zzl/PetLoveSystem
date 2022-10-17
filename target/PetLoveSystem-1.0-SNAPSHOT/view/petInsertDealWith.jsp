<%@ page import="controller.MasterDao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="model.DBConnectionManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: koutoimi
  Date: 2022/6/5
  Time: 17:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>宠物信息插入处理界面</title>
    <link rel="stylesheet" type="text/css" href="css/all_function_show.css">

</head>
<body>

<%
    request.setCharacterEncoding("utf-8");
    String masterName = request.getParameter("masterName");
    String petId = "";
    //    连接数据库
    DBConnectionManager umr_dbConn = new DBConnectionManager();
    String umr_sql = "select petId from masterpet where masterName=? order by petId limit 1";
    PreparedStatement umr_ps = umr_dbConn.getPreparedStatement(umr_sql);
    umr_ps.setString(1, masterName);
    ResultSet umr_rs = umr_ps.executeQuery();
    while (umr_rs.next()) {
        petId = umr_rs.getString("petId");
    }
    System.out.println(petId);
%>

<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    String petName = request.getParameter("petName");
    String petAge = request.getParameter("petAge");
    String petSex = request.getParameter("petSex");
    String petType = request.getParameter("petType");
    if (masterName.equals("") || petAge.equals("") || petSex.equals("") || petName.equals("") || petType.equals("")) {
%>
<script>
    alert("不能为空，请输入内容");
    window.location.href = "petInfo.jsp"
</script>
<%
} else if (petId.equals("")) {
%>
<script>
    alert("请先添加客户(即宠物主人)的信息");
    window.location.href = "petInfo.jsp"
</script>
<%
} else {
    //    连接数据库
    DBConnectionManager dbConn = new DBConnectionManager();
    String sql = "insert into petinfo values(?,?,?,?,?)";
    PreparedStatement ps = dbConn.getPreparedStatement(sql);
    ps.setString(1, petId);
    ps.setString(2, petName);
    ps.setString(3, petAge);
    ps.setString(4, petSex);
    ps.setString(5, petType);
    ps.executeUpdate();
%>
<script>
    alert("添加成功");
    window.location.href = "petInfo.jsp"
</script>
<%
    }
%>

</body>
</html>
