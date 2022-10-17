<%@ page import="model.DBConnectionManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: koutoimi
  Date: 2022/5/31
  Time: 19:55
  To change this template use File | Settings | File Templates.
--%>
<%--1、内连接(INNER JOIN)使用比较运算符进行表间某(些)列数据的比较操作，并列出这些表中与连接条件相匹配的数据行，组合成新的数据行
⑴也就是说：在内连接查询中，只有满足条件的记录才能出现在结果关系中

2、语法形式：from 表1 [inner] join 表2 on 连接条件 where 过滤条件
⑴内连接通过on条件来筛选出来符合连接条件的数据
⑵关键字“inner”可以省略，但建议写上

3、内连接是应用最广泛的一种连接查询，其本质是根据条件筛选出“有意义的数据”



内连接：等值连接
1、内连接中的等值连接最大的特点是：条件是等量关系

2、等值连接使用的是"="操作符，表示相等关系--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>宠物信息</title>
    <link rel="stylesheet" type="text/css" href="css/all_function_show.css">
    <style type="text/css">
        .pet {
            position: relative;
            height: 0;
            right: 100px;
            bottom: 370px;
            clear: both;
        }
    </style>
</head>
<body>
<div class="pet" style="text-align:center">

    <table cellspacing="1" border="1">

        <tr align="center">
            <td colspan="13">宠物信息表
            </td>
        </tr>
        <tr>
            <td colspan="1">宠物编号</td>
            <td colspan="1">宠物姓名</td>
            <td colspan="1">宠物年龄</td>
            <td colspan="1">宠物性别</td>
            <td colspan="2">宠物种类</td>
            <td colspan="1">客户编号</td>
            <td colspan="2">客户姓名</td>
            <td colspan="2" align="center">操作</td>
            <td colspan="1" align="center">宠物访问历史</td>
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
            String sql = "select m.masterId,m.masterName,p.petId,p.petName,p.petAge,p.petSex,p.petType " +
                    "from masterpet m inner join petinfo p on m.petId=p.petId order by p.petId";
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
                <a href="petImgShow.jsp?petId=<%=rs.getString("petId")%>&petName=<%=rs.getString("petName")%>"><%=rs.getString("petId")%></a>
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
            <td colspan="1" align="center">
                <a href="petVisitInsert.jsp?petId=<%=rs.getString("petId")%>&petName=<%=rs.getString("petName")%>&">访问</a>
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
        <a target="mainFrame" class="a" href="petInfo.jsp?page=<%=intPage+1%>">下一页</a>
        <%
            }
            if (intPage > 1) {
        %>
        &nbsp;
        <a target="mainFrame" class="a" href="petInfo.jsp?page=<%=intPage-1%>">上一页</a>
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
    <form action="petSelectName.jsp" method="post">
        输入姓名：
        <input type="text" name="petName">
        <input type="submit" value="快速查询" class="btn">
    </form>

    <form action="petInsert.jsp" method="post">
        <input type="submit" value="添加宠物" class="btn">
    </form>
</div>
</body>
</html>
