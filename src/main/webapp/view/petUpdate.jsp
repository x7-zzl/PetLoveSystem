<%@ page import="model.DBConnectionManager" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: koutoimi
  Date: 2022/6/5
  Time: 17:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>宠物信息更新界面</title>
    <link rel="stylesheet" type="text/css" href="css/all_function_show.css">
    <style type="text/css">
        .petUpdate{
            position: relative;
            height: 0;
            right: 400px;
            bottom: 310px;
            clear: both;
        }
    </style>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
//    获取信息
    String petId = request.getParameter("petId");
    String petName = request.getParameter("petName");
    String petAge = request.getParameter("petAge");
    String petSex = request.getParameter("petSex");
    String petType = request.getParameter("petType");

    String masterName = request.getParameter("masterName");
    String masterId = request.getParameter("masterId");

%>

<div class="petUpdate">
    <form action="petUpdateDealWith.jsp" method="post">

        <table align="center" border="1" cellspacing="2">
            <tr>
                <th colspan="2">修改宠物信息</th>
            </tr>

            <tr>
                <td width="180" align="center">宠物主人姓名：</td>
                <td width="120"><input type="text" value="<%=masterName%>" name="masterName" onfocus="this.blur()"></td>
            </tr>
            <tr>
                <td width="120" align="center">宠物姓名：</td>
                <td width="120"><input type="text" value="<%=petName%>" name="petName"></td>
            </tr>
            <tr>
                <td width="120" align="center">宠物年龄：</td>
                <td width="120"><input type="text" value="<%=petAge%>" name="petAge"></td>
            </tr>
            <tr>
                <td width="120" align="center">宠物性别：</td>
                <td width="120"><input type="text" value="<%=petSex%>" name="petSex"></td>
            </tr>
            <tr>
                <td width="120" align="center">宠物类型：</td>
                <td width="120"><input type="text" value="<%=petType%>" name="petType"></td>
            </tr>
            <tr>
<%--                隐藏按钮，发送参数信息--%>
                <input type="hidden" value="<%=petId%>" name="petId">
                <input type="hidden" value="<%=masterId%>" name="masterId">

                <th width="120" colspan="2"><input type="submit" value="提交" class="btn"></th>
            </tr>
        </table>
    </form>
</div>

</body>
</html>
