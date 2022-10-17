<%@ page import="model.DBConnectionManager" %>
<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: koutoimi
  Date: 2022/5/30
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登录数据处理界面</title>
    <%
        //防止出现乱码
        request.setCharacterEncoding("UTF-8");
        //获取用户输入的用户名和密码
        String userName = request.getParameter("e_name");
        String password = request.getParameter("e_password");
    %>

    <%--    使用JavaBean类生成user对象--%>
    <jsp:useBean id="user" class="model.DBConnectionManager" scope="session">
        <jsp:setProperty name="user" property="*"/>
    </jsp:useBean>

    <%
        //获取JavaBean类中getStatement方法返回值
        Statement stmt = user.getStatement();
        String sql = "select userName,password from employeeAccount";
        ResultSet rs = null;
        try {
            rs = stmt.executeQuery(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        boolean flag = false;
        while (true) {
            try {
                assert rs != null;
                if (!rs.next()) break;
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            //在数据库中找到该用户名和密码
            try {
                if (rs.getString("userName").equals(userName) && rs.getString("password").equals(password)) {
                    flag = true;
                    break;
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
//    关闭连接
        try {
            rs.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        try {
            stmt.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
//        connection.close();

        if (flag) {//进入系统主界面,并传递用户名和密码
    %>
<%--      记录用户名和密码--%>
    <jsp:forward page="../view/mainPetSystem.jsp">
        <jsp:param value="<%=userName%>" name="userName"/>
        <jsp:param value="<%=password%>" name="password"/>
    </jsp:forward>

    <%
        response.sendRedirect("mainPetSystem.jsp");
//        response.sendRedirect("mainPetSystem.jsp?userName=" + userName + "&password=" + password);
    } else {//错误返回登录界面
    %>

    <jsp:forward page="../view/loginPet.jsp">
        <jsp:param value="用户名或密码错误，请检查后重试" name="errorLoginMessage"/>
    </jsp:forward>

    <%}%>

</head>
<body>

</body>
</html>
