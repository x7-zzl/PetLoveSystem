<%--主界面左侧的功能模块按钮--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        /*超链接的样式设置*/
        .a{
            text-decoration:none;  /*清除下划线  */
            font-family: "楷体", serif;/*设置字体种类*/
            color: #0066ff;/*设置字体颜色*/
            font-size: 30px;/*设置字体大小*/
        }
        .btn {
            padding: 10px 20px;
            color: #03e9f4;
            position: relative;
            overflow: hidden;
            text-transform: uppercase;
            letter-spacing: 2px;
            left: 10%;
        }

        /*按钮动态效果*/
        .btn:hover {
            border-radius: 5px;
            color: #fff;
            background: #03e9f4;
            box-shadow: 0 0 5px 0 #03e9f4,
            0 0 25px 0 #03e9f4,
            0 0 50px 0 #03e9f4,
            0 0 100px 0 #03e9f4;
            transition: all 1s linear;
        }

        input,
        button {
            background: transparent;
            border: 0;
            outline: none;
        }

        body{
            background-image: url("image/bj_corner.png");
            align-items: center;
            color: #4ff221;
        }
    </style>
</head>
<body>
<div align="left">
<%--    在框架空白处界面打开--%>
    <button class="btn"><a href="veterinarianPet.jsp" target="mainFrame" class="a">浏览兽医信息</a></button>

    <br><br>
    <button class="btn"><a href="masterPet.jsp" target="mainFrame" class="a">宠物主人信息</a></button>
    <br><br>
    <button class="btn"><a href="petInfo.jsp" target="mainFrame" class="a" > 宠物相关信息</a></button>

    <br><br>
    <button class="btn"><a href="petVisit.jsp" target="mainFrame" class="a">宠物历史访问</a></button>

    <br><br>
<%--    清除当前窗口所有被包含的框架并将目标文档载入整个浏览器窗口中--%>
    <button class="btn"><a href="loginPet.jsp" target="_top" class="a">注销用户登录</a></button>

</div>
</body>
</html>
