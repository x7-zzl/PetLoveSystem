<%@ page import="controller.MasterDao" %>
<%@ page import="java.sql.Connection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>提示页</title>
    <link rel="stylesheet" type="text/css" href="css/all_function_show.css">
</head>
<body>

<%
    request.setCharacterEncoding("UTF-8");
    String name = request.getParameter("masterName");
    int age = Integer.parseInt(request.getParameter("masterAge"));
    String sex = request.getParameter("masterSex");
    int ID = Integer.parseInt(request.getParameter("masterId"));

    MasterDao dao = new MasterDao();
    Connection connection = dao.getConnection();
    if (connection != null) {
        dao.update(name, age, sex, ID);
%>
<script language="JavaScript">
    var t=<%=ID%>;
    alert("客户编号为"+t+"的信息更新成功");
    window.location.href="masterPet.jsp"
</script>
<%
    } else {
        System.out.println("数据库连接失败");
    }
%>
</body>
</html>