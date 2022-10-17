<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="model.DBConnectionManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: koutoimi
  Date: 2022/5/31
  Time: 19:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>兽医信息界面</title>
    <link rel="stylesheet" type="text/css" href="css/all_function_show.css">
<style type="text/css">
    #veterina{
        position: relative;
        height: 0;
        right: 250px;
        bottom: 300px;
        clear: both;
    }

</style>
</head>
<body>
<%--兽医:姓名,性别,资历,专业特长--%>
<%--专业特长:腹泻,掉毛,厌食,外伤,手术,护理,中毒--%>
<div id="veterina" style="text-align:center">
    <table align="center" border="1" style="font-size: 30px">
        <tr>
            <th colspan="11">兽医相关信息</th>
        </tr>
        <tr>
            <td colspan="1">姓名</td>
            <td colspan="1">性别</td>
            <td colspan="2">资历</td>
            <td colspan="3">专业特长</td>
            <td colspan="4">联系电话</td>
        </tr>

        <%
            request.setCharacterEncoding("UTF-8");

            int intPageSize;//一页显示的记录数
            int intRowCount;//记录总数
            int intPageCount;//总页数
            int intPage;//待显示页码
            String strPage;
            int i;
            intPageSize = 4;//设置一页显示的记录数
            strPage = request.getParameter("page");
            if (strPage == null) {
                intPage = 1;
            } else {
                intPage = java.lang.Integer.parseInt(strPage);
                if (intPage < 1)
                    intPage = 1;
            }

            //生成user对象
            DBConnectionManager user = new DBConnectionManager();

            String sql = "select * from veterinarian  order by name";
            PreparedStatement ps = user.getPreparedStatement(sql);

            ResultSet rs = null;
            try {
                rs = ps.executeQuery(sql);
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
            <td colspan="4">
                <%=rs.getString("phone")%>
            </td>
        </tr>
        <%
                    rs.next();
                    i++;
                }
            }
        %>

    </table>

    <br>
    <div  class="a">
        第<%=intPage%>页 共<%=intPageCount%>页<br>
        <%
            if (intPage < intPageCount) {
        %>

        <%--        不能有空格，否则会被读入--%>
        <a target="mainFrame" class="a" href="veterinarianPet.jsp?page=<%=intPage+1%>">下一页</a>
        <%
            }
            if (intPage > 1) {
        %>
        &nbsp;
        <a target="mainFrame" class="a" href="veterinarianPet.jsp?page=<%=intPage-1%>">上一页</a>
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

    <form action="veterinarianSelectName.jsp" method="post">
        专业特长：
        <input type="text" name="vName">
        <input type="submit" value="快速查询" class="btn">
    </form>
</div>

</body>
</html>
