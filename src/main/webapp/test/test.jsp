<%@ page import="model.DBConnectionManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: koutoimi
  Date: 2022/6/5
  Time: 15:44
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
    <title></title>
</head>
<body>

<table>

    <tr>
        <td colspan="1">宠物编号</td>
        <td colspan="1">宠物姓名</td>
        <td colspan="1">宠物年龄</td>
        <td colspan="1">宠物性别</td>
        <td colspan="2">宠物种类</td>
        <td colspan="1">客户编号</td>
        <td colspan="2">客户姓名</td>
    </tr>
<%
    request.setCharacterEncoding("UTF-8");
    DBConnectionManager dbConnectionManager = new DBConnectionManager();
//    内连接查询
    String sql = "select m.masterId,m.masterName,m.petId,p.petName,p.petAge,p.petSex,p.petType from masterpet m inner join petinfo p on m.petId=p.petId";
    PreparedStatement ps = dbConnectionManager.getPreparedStatement(sql);
    ResultSet rs = ps.executeQuery();
    while (rs.next()) {
%>

    <tr>

        <td colspan="1">
            <%=rs.getString("petId")%>
        </td>
        <td colspan="1">
            <%=rs.getString("petName")%>
        </td>
        <td colspan="1">
            <%=rs.getString("petAge")%>
        </td>
        <td colspan="1">
            <%=rs.getString("petSex")%>
        </td>
        <td colspan="2">
            <%=rs.getString("petType")%>
        </td>
        <td colspan="1">
            <%=rs.getString("masterId")%>
        </td>
        <td colspan="2">
            <%=rs.getString("masterName")%>
        </td>
    </tr>
<br>

<%
    }
    rs.close();
    ps.close();
%>
</table>

</body>
</html>
