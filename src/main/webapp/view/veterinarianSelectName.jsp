<%@ page import="model.DBConnectionManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: koutoimi
  Date: 2022/6/6
  Time: 9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/all_function_show.css">
    <style type="text/css">
        .pet {
            position: relative;
            height: 0;
            right: 400px;
            bottom: 300px;
            clear: both;
        }
    </style>
</head>
<body>
<div class="pet" style="text-align:center">

    <table cellspacing="1" border="1" style="font-size: 30px">

        <tr>
            <th colspan="7">兽医相关信息</th>
        </tr>
        <tr>
            <td colspan="1">姓名</td>
            <td colspan="1">性别</td>
            <td colspan="2">资历</td>
            <td colspan="3">专业特长</td>
        </tr>
        <%
            request.setCharacterEncoding("UTF-8");
            String vName = request.getParameter("vName");
            int intPageSize;//一页显示的记录数
            int intRowCount;//记录总数
            int intPageCount;//总页数
            int intPage;//待显示页码
            String strPage;
            int i;
            intPageSize = 3;//设置一页显示的记录数
            strPage = request.getParameter("page");
            if (strPage == null) {
                intPage = 1;
            } else {
                intPage = java.lang.Integer.parseInt(strPage);
                if (intPage < 1)
                    intPage = 1;
            }
            DBConnectionManager dbConnectionManager = new DBConnectionManager();
//    内连接查询
            String sql = "select * from veterinarian where speciality=? order by serviceAge";
            PreparedStatement ps = dbConnectionManager.getPreparedStatement(sql);
            ps.setString(1, vName);
            ResultSet rs = null;
            try {
                rs = ps.executeQuery();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
//        将游标移动到最后一行
            rs.last();
            intRowCount = rs.getRow();//获取记录总数
            intPageCount = (intRowCount + intPageSize - 1) / intPageSize;
            //计算总页数
            if (intPage > intPageCount)
                intPage = intPageCount;
            if (intPageCount > 0) {
                rs.absolute((intPage - 1) * intPageSize + 1);
                //显示数据
                i = 0;
                while (i < intPageSize && !rs.isAfterLast()) {
        %>

        <tr>
            <td colspan="1">
                <%=rs.getString("name")%>
            </td>
            <td colspan="1">
                <%=rs.getString("sex")%>
            </td>
            <td colspan="2">
                <%=rs.getString("serviceAge")%>
            </td>
            <td colspan="3">
                <%=rs.getString("speciality")%>
            </td>
        </tr>
        <br>

        <%
                    rs.next();
                    i++;
                }
            }
        %>
    </table>

    <br>
    <div class="a">
        第<%=intPage%>页 共<%=intPageCount%>页<br>
        <%
            if (intPage < intPageCount) {
        %>

        <%--        不能有空格，否则会被读入--%>
        <a target="mainFrame" class="a" href="veterinarianSelectName.jsp?page=<%=intPage+1%>">下一页</a>
        <%
            }
            if (intPage > 1) {
        %>
        &nbsp;
        <a target="mainFrame" class="a" href="veterinarianSelectName.jsp?page=<%=intPage-1%>">上一页</a>
        <%
            }
            try {
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        %>
    </div>
    <br>
    <a href="veterinarianPet.jsp"><img src="image/return_login_1.png" alt="返回"></a>
</div>
</body>
</html>
