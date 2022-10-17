<%@ page import="model.DBConnectionManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: koutoimi
  Date: 2022/6/5
  Time: 17:44
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
            right: 200px;
            bottom: 300px;
            clear: both;
        }
    </style>
</head>
<body>
<div class="pet" style="text-align:center">

    <table cellspacing="1" border="1">

        <tr>
            <td colspan="1">宠物编号</td>
            <td colspan="1">宠物姓名</td>
            <td colspan="1">宠物年龄</td>
            <td colspan="1">宠物性别</td>
            <td colspan="2">宠物种类</td>
            <td colspan="1">客户编号</td>
            <td colspan="2">客户姓名</td>
            <td colspan="2" align="center">操作</td>
        </tr>
        <%
            request.setCharacterEncoding("UTF-8");
            String petName = request.getParameter("petName");
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
            String sql = "select m.masterId,m.masterName,p.petId,p.petName,p.petAge,p.petSex,p.petType from masterpet m inner join petinfo p on m.petId=p.petId where p.petName=? order by p.petId";
            PreparedStatement ps = dbConnectionManager.getPreparedStatement(sql);
            ps.setString(1, petName);
            System.out.println("select m.masterId,m.masterName,p.petId,p.petName,p.petAge,p.petSex,p.petType" +
                    " from masterpet m inner join petinfo p on m.petId=p.petId order by p.petId where p.petName=" + petName);
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
            <td colspan="1" align="center">
                <a href="petImgShow.jsp?petId=<%=rs.getString("petId")%>&petName=<%=rs.getString("petName")%>"><%=rs.getString("petId")%>

            </td>
            <td colspan="1" align="center">
                <%=rs.getString("petName")%>
            </td>
            <td colspan="1" align="center">
                <%=rs.getString("petAge")%>
            </td>
            <td colspan="1" align="center">
                <%=rs.getString("petSex")%>
            </td>
            <td colspan="2" align="center">
                <%=rs.getString("petType")%>
            </td>
            <td colspan="1" align="center">
                <%--                转到客户信息--%>
                <a href="petGetMaster.jsp?masterId=<%=rs.getString("masterId")%>">
                    <%=rs.getString("masterId")%>
                </a>
            </td>
            <td colspan="2" align="center">
                <%=rs.getString("masterName")%>
            </td>
            <td colspan="2" align="center">
                <a href="petDelete.jsp?petId=<%=rs.getString("petId")%>&petName=<%=rs.getString("petName")%>&petAge=<%=rs.getString("petAge")%>&petSex=<%=rs.getString("petSex")%>&petType=<%=rs.getString("petType")%>&masterId=<%=rs.getString("masterId")%>&masterName=<%=rs.getString("masterName")%>">删除</a>/
                <a href="petUpdate.jsp?petId=<%=rs.getString("petId")%>&petName=<%=rs.getString("petName")%>&petAge=<%=rs.getString("petAge")%>&petSex=<%=rs.getString("petSex")%>&petType=<%=rs.getString("petType")%>&masterId=<%=rs.getString("masterId")%>&masterName=<%=rs.getString("masterName")%>">修改</a>
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
        <a target="mainFrame" class="a" href="petSelectName.jsp?page=<%=intPage+1%>">下一页</a>
        <%
            }
            if (intPage > 1) {
        %>
        &nbsp;
        <a target="mainFrame" class="a" href="petSelectName.jsp?page=<%=intPage-1%>">上一页</a>
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

    <a href="petInfo.jsp"><img src="image/return_login_1.png" alt="返回"></a>
</div>
</body>
</html>
