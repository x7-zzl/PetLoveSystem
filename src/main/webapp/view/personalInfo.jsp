<%@ page import="model.Account" %><%--
  Created by IntelliJ IDEA.
  User: koutoimi
  Date: 2022/5/31
  Time: 20:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人信息界面</title>
    <link rel="stylesheet" type="text/css" href="css/all_function_show.css">
    <style type="text/css">
        .in_css {
            outline-style: hidden;
            border: 1px red;
            border-radius: 3px;
            padding: 13px 14px;
        }

        .sty_table {
            position: relative;
            height: 0;
            right: 400px;
            bottom: 450px;
            clear: both;
            align-self: center;
        }
    </style>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String eName = (String) session.getAttribute("e_name_tmp");
    String ePassword = (String) session.getAttribute("e_password_temp");
%>

<div class="sty_table" >

    <%--    提交处理--%>
    <form action="../view/updatePassword.jsp" method="post">
        <table align="center" border="1" style="font-size: 30px">

            <tr>
                <td align="center" colspan="2">个人信息栏</td>
            </tr>
            <tr>
                <td align="center">
                    你的账号为:
                </td>
                <td align="center">
                    <%=eName%>
                </td>
            </tr>

            <br>
            <tr>
                <td colspan="2" align="center">
                    如果你想修改密码,需先输入原密码
                </td>

            </tr>

            <br>

            <%--        隐藏，用来存放原来的账号--%>
            <input type="hidden" name="out_user_name" value="<%=eName%>">
            <%--        隐藏，用来存放原来的密码--%>
            <input type="hidden" name="out_pass" value="<%=ePassword%>">

            <tr>
                <td align="center">
                    原来密码:
                </td>
                <td>
                    &nbsp;<input type="password" name="pass_prev" class="in_css" size="30">
                </td>
            </tr>


            <br>
            <tr>
                <td align="center">
                    修改密码:
                </td>
                <td>
                    &nbsp;<input type="password" name="pass_now" class="in_css" size="30">
                </td>
            </tr>
            <br>
            <tr>
                <td align="center" colspan="2">
                    <input type="submit" name="" value="确认修改" class="btn" align="center"
                           style="color: #f21f19;font-size: 28px">
                </td>
            </tr>


            <br>
            <tr>
                <td colspan="2" align="center">
                    <a href="loginPet.jsp" target="_top" class="a"
                       align="center" style="color: #f21f19;font-size: 28px">注销登录，返回登录界面</a>
                </td>
            </tr>
            
        </table>
    </form>

</div>

</body>
</html>
