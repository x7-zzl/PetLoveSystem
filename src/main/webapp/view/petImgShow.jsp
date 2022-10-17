<%@ page import="model.DBConnectionManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: koutoimi
  Date: 2022/6/7
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/all_function_show.css">
    <style type="text/css">
        body {
            font-family: 华文楷体, serif;
            background-image: url("../view/image/bj_7.png");
            font-size: 40px;
            background-size: cover;
            background-repeat: no-repeat;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #4ff221;
        }
        .a{
            text-decoration:none;  /*清除下划线  */
            font-family: "宋体", serif;/*设置字体种类*/
        }
        #pet_img {
            position: relative;
            height: 0;
            right: 200px;
            bottom: 300px;
            clear: both;
        }

        .box {
            width: 50%;
            margin: 50px auto;
        }

        .img-box {
            width: 100%;
            position: relative;
            z-index: 1;
        }

        .img-box img {
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            width: 100%;
            margin: auto;
            z-index: -1;
            *zoom: 1;
        }

        .img-box:before {
            content: "";
            display: inline-block;
            padding-bottom: 100%;
            width: 0.1px; /*必须要有数值，否则无法把高度撑起来*/
            vertical-align: middle;
        }
    </style>
</head>
<body>
<%
    String petId = request.getParameter("petId");
    String petName = request.getParameter("petName");
    String url_img = "";
    String sql = "select img_src from petimg where petId=?";
    DBConnectionManager dbConn = new DBConnectionManager();
    PreparedStatement ps = dbConn.getPreparedStatement(sql);
    ps.setString(1, petId);
    ResultSet rs = ps.executeQuery();
    while (rs.next()) {
        url_img = rs.getString("img_src");
    }
    if ("".equals(url_img)) {
%>
<script language="JavaScript">
    alert("暂无该宠物图片")
    window.location.href = "petInfo.jsp"
</script>
<%
    }
%>
<div class="box" id="pet_img">
    <a href="petInfo.jsp"><img src="image/return_login_1.png" alt="返回"></a>
    <br><br>
    <a href="petSelectName.jsp?petName=<%=petName%>" class="a" align="center">
        <%=petName%>
    </a>

    <br><br>
    <img src="<%=url_img%>" alt="宠物图片" style="width:450px;height:300px;">
</div>
</body>
</html>
