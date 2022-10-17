<%@ page import="controller.MasterDao" %>
<%@ page import="java.sql.Connection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改数据</title>
    <link rel="stylesheet" type="text/css" href="css/all_function_show.css">
    <style type="text/css">
        #master_size_pos{
            position: relative;
            height: 0;
            right: 370px;
            bottom: 320px;
            clear: both;
        }

    </style>
</head>
<body>

<%
    request.setCharacterEncoding("UTF-8");
    String masterId = request.getParameter("masterId");
    int ID = Integer.parseInt(masterId);
    String masterName = request.getParameter("masterName");
    String masterAge = request.getParameter("masterAge");
    int age = Integer.parseInt(masterAge);
    String masterSex = request.getParameter("masterSex");
%>
<div id="master_size_pos">
    <form action="masterPetUpdateDealWith.jsp" method="post">
        <%--    不可修改--%>
        <table align="center" border="1" cellspacing="2">

            <tr>
                <td width="130" align="center">客户编号：</td>
                <td width="120"><input type="text" value="<%=ID%>" onfocus="this.blur()" name="masterId"></td>
            </tr>
            <tr>
                <td width="120" align="center">姓 名：</td>
                <td width="120"><input type="text" value="<%=masterName%>" name="masterName"></td>
            </tr>
            <tr>
                <td width="120" align="center"> 年 龄：</td>
                <td width="120"><input type="text" value="<%=age%>" name="masterAge"></td>
            </tr>
            <tr>
                <td width="120" align="center">联系方式：</td>
                <td width="120"><input type="text" value="<%=masterSex%>" name="masterSex"></td>
            </tr>

            <tr>
                <th colspan="2" align="center">
                    <input type="submit" class="btn" value="修改">
                </th>
            </tr>
        </table>

    </form>
</div>
</body>
</html>