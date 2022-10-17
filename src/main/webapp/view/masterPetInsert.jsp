<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>插入数据</title>
    <link rel="stylesheet" type="text/css" href="css/all_function_show.css">
    <style type="text/css">
        #m_s_insert{
            position: relative;
            height: 0;
            right: 350px;
            bottom: 320px;
            clear: both;
        }
    </style>
</head>
<body>
<div id="m_s_insert">
    <form action="masterPetInsertDealWith.jsp" method="post">

        <table align="center" border="1" cellspacing="2">
            <tr>
               <th colspan="2">添加客户信息</th>
            </tr>
            <tr>
                <td width="130" align="center">客户编号：</td>
                <td width="120"><input type="text" name="masterId"></td>
            </tr>
            <tr>
                <td width="120" align="center">姓 名：</td>
                <td width="120"><input type="text" name="masterName"></td>
            </tr>
            <tr>
                <td width="120" align="center">年 龄：</td>
                <td width="120"><input type="text" name="masterAge"></td>
            </tr>
            <tr>
                <td width="120" align="center">联系方式：</td>
                <td width="120"><input type="text" name="masterSex"></td>
            </tr>
            <tr>
                <th width="120" colspan="2"><input type="submit" value="提交" class="btn"></th>
            </tr>
        </table>
    </form>
</div>

</body>
</html>