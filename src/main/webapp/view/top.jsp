<%--
  Created by IntelliJ IDEA.
  User: koutoimi
  Date: 2022/5/31
  Time: 21:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--标题--%>
<html>
<head>
    <title>Title</title>
   <style type="text/css">
       /*!*设置图片为圆形*!*/
       img{
           width:77px;    height:77px;    border-radius:50px;
       }

       body{
           background-image: url("image/bj_corner.png");
           align-items: center;
           color: #4ff221;
       }
       /*超链接的样式设置*/
       .a{
           text-decoration:none;  /*清除下划线  */
           font-family: "楷体", serif;/*设置字体种类*/
           color: red;/*设置字体颜色*/
           font-size: 30px;/*设置字体大小*/
       }
       /*设置用户信息在右上角的位置*/
       .topcorner {
           position: absolute;
           top: 16px;
           right: 18px;
       }


       .topcorner_img{
           position: absolute;
           top: -15px;
           right: -15px;
       }
       /*设置一个类似于头像的圆*/
       /*.headPortrait {*/
       /*    border: 1px solid #3db8da;*/
       /*    width: 50px;*/
       /*    height: 50px;*/
       /*    border-radius: 30px;*/
       /*    !*插入图片*!*/
       /*    background-image: url("image/bj_head-image.png");*/
       /*    background-size: 30px 24px;*/

       /*    position: absolute;*/
       /*    top: 4px;*/
       /*    right: 4px;*/
       /*}*/

   </style>
</head>
<body>
<h2 align="center" style="font-size: 40px;font-family: 宋体,serif;">欢迎使用"爱心"宠物诊所系统</h2>

<%
//    获取用户账号
    String  e_user_name = (String) session.getAttribute("e_user_name");
    String  e_user_password = (String) session.getAttribute("e_user_password");
%>

<%--在界面的右上角显示个人信息--%>
<div class="headPortrait">
<%--    在中间界面show.jsp界面中打开--%>
    <a class="topcorner" href="personalInfo.jsp" target="mainFrame" style="text-decoration:none">
<%--        获取从mainPetSystem.jsp界面传的用户名--%>
<%--        形成一个类似于个人头像的对象--%>

       <%=e_user_name%>
<%--    设置一个图片作为头像--%>
    <img src="image/bj_head-image.png" class="topcorner_img">
    </a>
</div>

<%
//    发送给personalInfo.jsp界面
    session.setAttribute("e_name_tmp",e_user_name);
    session.setAttribute("e_password_temp",e_user_password);
%>
</body>
</html>
