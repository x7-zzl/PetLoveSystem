<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="model.DBConnectionManager" %><%--
  Created by IntelliJ IDEA.
  User: koutoimi
  Date: 2022/6/5
  Time: 17:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>宠物信息插入界面</title>
    <link rel="stylesheet" type="text/css" href="css/all_function_show.css">
    <style type="text/css">
        .petUpdate{
            position: relative;
            height: 0;
            right: 400px;
            bottom: 330px;
            clear: both;
        }
    </style>
</head>
<body>

<div class="petUpdate">
    <form action="petInsertDealWith.jsp" method="post">

        <table align="center" border="1" cellspacing="2">
            <tr>
                <th colspan="2">添加宠物信息</th>
            </tr>
            <tr>
                <td width="180" align="center">宠物主人姓名：</td>
                <td width="120"><input type="text" name="masterName"></td>
            </tr>
            <tr>
                <td width="120" align="center">宠物姓名：</td>
                <td width="120"><input type="text" name="petName"></td>
            </tr>
            <tr>
                <td width="120" align="center">宠物年龄：</td>
                <td width="120"><input type="text" name="petAge"></td>
            </tr>
            <tr>
                <td width="120" align="center">宠物性别：</td>
                <td width="120"><input type="text" name="petSex"></td>
            </tr>
            <tr>
                <td width="120" align="center">宠物类型：</td>
                <td width="120"><input type="text" name="petType"></td>
            </tr>
            <tr>
                <th width="120" colspan="2"><input type="submit" value="提交" class="btn"></th>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
