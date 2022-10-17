<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="model.DBConnectionManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>宠物历史访问记录</title>
    <link rel="stylesheet" type="text/css" href="css/all_function_show.css">
    <style type="text/css">
        .pet_his {
            position: relative;
            height: 0;
            right: 350px;
            bottom: 430px;
            clear: both;
        }
    </style>
</head>
<body>
<%
    //    获取访问时间
    Calendar c = Calendar.getInstance();
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    String format = simpleDateFormat.format(c.getTime());
%>
<div class="pet_his" style="text-align:center">

    <table cellspacing="1" border="1">

        <tr align="center">
            <td colspan="7">宠物访问历史记录表</td>
        </tr>
        <tr>
            <td colspan="1">序号</td>
            <td colspan="1">宠物编号</td>
            <td colspan="1">宠物姓名</td>
            <td colspan="3" align="center">访问时间</td>
            <td colspan="1" align="center">操作</td>
        </tr>
        <%
            request.setCharacterEncoding("UTF-8");

            int intPageSize;//一页显示的记录数
            int intRowCount;//记录总数
            int intPageCount;//总页数
            int intPage;//待显示页码
            String strPage;
            int i;
            int count = 1;
            intPageSize = 5;//设置一页显示的记录数
            strPage = request.getParameter("page");
            if (strPage == null) {
                intPage = 1;
            } else {
                intPage = java.lang.Integer.parseInt(strPage);
                if (intPage < 1)
                    intPage = 1;
            }
            DBConnectionManager dbConnectionManager = new DBConnectionManager();
            String sql = "select * from pethistoryvisit order by petHistoryVisitDate desc";
            System.out.println(sql);
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
                <%=(count++)%>
            </td>
            <td colspan="1" align="center">
                <a href="petVisPetInfo.jsp?petId=<%=rs.getString("petId")%>"><%=rs.getString("petId")%>
                </a>
            </td>
            <td colspan="1" align="center">
                <%=rs.getString("petName")%>
            </td>

            <td colspan="3" align="center">
                <%=rs.getString("petHistoryVisitDate")%>
            </td>

            <td colspan="1" align="center">
                <a href="petVisitDelete.jsp?petId=<%=rs.getString("petId")%>&petHistoryVisitDate=<%=rs.getString("petHistoryVisitDate")%>">删除</a>
            </td>
        </tr>
        <br>

        <%
                    rs.next();
                    i++;
                }
            }
        %>
    </table cellspacing="1">
    <br>
    <div class="a">
        第<%=intPage%>页 共<%=intPageCount%>页<br>
        <%
            if (intPage < intPageCount) {
        %>

        <%--        不能有空格，否则会被读入--%>
        <a target="mainFrame" class="a" href="petVisit.jsp?page=<%=intPage+1%>">下一页</a>
        <%
            }
            if (intPage > 1) {
        %>
        &nbsp;
        <a target="mainFrame" class="a" href="petVisit.jsp?page=<%=intPage-1%>">上一页</a>
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

</div>


</body>
</html>
