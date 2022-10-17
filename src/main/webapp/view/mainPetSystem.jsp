<%-- “爱心”宠物诊所的职员需要使用系统提供的如下功能：
①浏览诊所的兽医以及他们的专业特长；
②浏览宠物的主人（即诊所的客户）的相关信息；
③更新宠物的主人的相关信息；
④向系统中增加一个新客户；
⑤浏览宠物的相关信息；
⑥更新宠物的相关信息；
⑦向系统中增加一个新宠物；
⑧浏览宠物的访问历史记录；
⑨向宠物的访问历史记录添加一次访问；
⑩此外，诊所的职员在使用系统提供的上述功能之前需要进行登录。当职员不需要使用系统的上述功能时，也可退出系统。
“爱心”宠物诊所的职员需要使用系统提供的如下功能：
①浏览诊所的兽医以及他们的专业特长；
②浏览宠物的主人（即诊所的客户）的相关信息；
③更新宠物的主人的相关信息；
④向系统中增加一个新客户；
⑤浏览宠物的相关信息；
⑥更新宠物的相关信息；
⑦向系统中增加一个新宠物；
⑧浏览宠物的访问历史记录；
⑨向宠物的访问历史记录添加一次访问；
⑩此外，诊所的职员在使用系统提供的上述功能之前需要进行登录。当职员不需要使用系统的上述功能时，也可退出系统。

--%>
<%--此界面为系统主界面,界面的功能是将系统的其他功能整合在一个界面上--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>主界面</title>
    <link rel="stylesheet" type="text/css" href="css/all_background.css">
</head>

<%
    request.setCharacterEncoding("UTF-8");
    String userName = request.getParameter("userName");
    String password = request.getParameter("password");
//    if("".equals(userName)||"".equals(password)){
%>
<%--<script language="JavaScript">
    alert("请先登录");
    window.location.href="loginPet.jsp";
</script>
<%
    }
%>--%>

<%--设置用户的账号和密码保存到JavaBean中--%>
<jsp:useBean id="account" class="model.Account" scope="session">
    <jsp:setProperty name="account" property="userName" value="<%=userName%>"/>
    <jsp:setProperty name="account" property="password" value="<%=password%>"/>
</jsp:useBean>

<%--<jsp:forward page="../view/top.jsp">
    <jsp:param value="<%=account.getUserName()%>" name="e_user_name"/>
    <jsp:param value="<%=account.getPassword()%>" name="e_user_password"/>
</jsp:forward>--%>
<%--设置框架--%>
<frameset rows="10%,*">
    <frame src="../view/top.jsp" name="topFrame" scrolling="no" border="1"/>

    <frameset cols="12%,*" border="1">
        <frame src="../view/left.jsp" name="leftFrame" scrolling="no"/>
        <frame src="../view/show.jsp" name="mainFrame" scrolling="yes"/>
    </frameset>
</frameset>

<%
         /*传递参数值,发送到top.jsp界面???*/
    session.setAttribute("e_user_name", account.getUserName());
    session.setAttribute("e_user_password", account.getPassword());
%>

</html>
