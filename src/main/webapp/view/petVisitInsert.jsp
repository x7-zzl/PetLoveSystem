<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="model.DBConnectionManager" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: koutoimi
  Date: 2022/6/6
  Time: 18:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    //    获取访问时间
    Calendar c = Calendar.getInstance();
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    String format = simpleDateFormat.format(c.getTime());
    System.out.println(format);
    String petId = request.getParameter("petId");
    String petName = request.getParameter("petName");
%>

<%
    //    连接数据库
    DBConnectionManager dbConn = new DBConnectionManager();
    String sql = "insert into pethistoryvisit values(?,?,?)";
    PreparedStatement ps = dbConn.getPreparedStatement(sql);
    ps.setString(1, petId);
    ps.setString(2, petName);
    ps.setString(3, format);
    int i = ps.executeUpdate();
    if (i == 1) {
%>
<script language="JavaScript">
    alert("访问成功,可在宠物访问记录中查看")
    window.location.href = "petInfo.jsp";
</script>

<%
    } else {
        out.println("插入数据失败");
        response.sendRedirect("loginPet.jsp");
    }
%>
</body>
</html>
