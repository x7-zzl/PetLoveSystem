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
    request.setCharacterEncoding("utf-8");
    String masterId = request.getParameter("masterId");
    String Name = request.getParameter("masterName");
    int masterAge = Integer.parseInt(request.getParameter("masterAge"));
    String masterSex = request.getParameter("masterSex");
    int ID = Integer.parseInt(masterId);
    if(masterId.equals("")||masterAge==0||masterSex.equals("")||Name.equals("")){
%>
<script>
    alert("不能为空，请输入内容");
    window.location.href="masterPetInsert.jsp"
</script>
<%}
    request.setCharacterEncoding("UTF-8");
    MasterDao dao = new MasterDao();
    Connection connection = dao.getConnection();
    if (connection != null) {
        int i = dao.insert(ID, Name, masterAge, masterSex);
%>
<script>
    alert("添加成功");
    window.location.href="masterPet.jsp"
</script>
<%
    } else {
        out.print("数据库连接数据失败");
    }
%>
</body>
</html>