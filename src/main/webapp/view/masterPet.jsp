<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.DBConnectionManager" %>
<html>
<head>
    <title>查询</title>
    <link rel="stylesheet" type="text/css" href="css/all_function_show.css">
</head>
<body>

<div id="master_size" style="text-align:center">

    <table cellspacing="1" border="1" >

        <tr align="center">
            <th colspan="5">客户信息表</th>
        </tr>

        <tr>
            <th width='60'>客户编号</th>
            <th width='100'>姓名</th>
            <th width='60'>年龄</th>
            <th width='60'>联系方式</th>
            <th width='160'>操作</th>
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
            DBConnectionManager dbConnectionManager = new DBConnectionManager();
//    内连接查询
            String sql = "select * from masterpet order by masterId";
            PreparedStatement ps = dbConnectionManager.getPreparedStatement(sql);
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
            <td colspan="1" align="center">
                <%=rs.getString("masterId")%>
            </td>
            <td colspan="1" align="center">
                <%=rs.getString("masterName")%>
            </td>
            <td colspan="1" align="center">
                <%=rs.getString("masterAge")%>
            </td>
            <td colspan="1" align="center">
                <%=rs.getString("masterSex")%>
            </td>

            <td colspan="2" align="center">
                <a href="masterPetDelete.jsp?masterId=<%=rs.getString("masterId")%>&masterName=<%=rs.getString("masterName")%>&masterAge=<%=rs.getString("masterAge")%>&masterSex=<%=rs.getString("masterSex")%>">删除</a>/
                <a href="masterPetUpdate.jsp?masterId=<%=rs.getString("masterId")%>&masterName=<%=rs.getString("masterName")%>&masterAge=<%=rs.getString("masterAge")%>&masterSex=<%=rs.getString("masterSex")%>">修改</a>
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

        第<%=intPage%>页 共<%=intPageCount%>页<br>
        <%
            if (intPage < intPageCount) {
        %>

        <%--        不能有空格，否则会被读入--%>
        <a target="mainFrame" class="a" href="masterPet.jsp?page=<%=intPage+1%>">下一页</a>
        <%
            }
            if (intPage > 1) {
        %>
        &nbsp;
        <a target="mainFrame" class="a" href="masterPet.jsp?page=<%=intPage-1%>">上一页</a>
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



    <br><br>
    <form action="masterPetSelectName.jsp" method="post">
        输入姓名：
            <input type="text" name="masterName">

        <input type="submit" value="快速查询" class="btn">
    </form>

    <form action="masterPetInsert.jsp" method="post">
        <input type="submit" value="增加客户" class="btn">
    </form>

</div>


</body>
</html>