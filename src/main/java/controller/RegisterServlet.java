package controller;

import model.DBConnectionManager;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "RegisterServlet", value = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置编码
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        //获取用户输入的用户名、密码和验证码
        String username = request.getParameter("create_username");
        String password = request.getParameter("create_password");
        String vCode = request.getParameter("code");

        String sessionVerifyCode = (String) request.getSession().getAttribute("vCode");

        PrintWriter printWriter = response.getWriter();

        //为空时的处理
        if (username.equals("")) {
            printWriter.println("<script language=\"JavaScript\">\n" +
                    "    alert(\"用户名为空\");\n" +
                    "    window.location = \"../PetLoveSystem_war_exploded/view/register.jsp\";\n" +
                    "</script>");
        } else if (password.equals("")) {
            printWriter.println("<script language=\"JavaScript\">\n" +
                    "    alert(\"密码为空\");\n" +
                    "    window.location = \"../PetLoveSystem_war_exploded/view/register.jsp\";\n" +
                    "</script>");
        } else if (vCode.equals("")) {
            printWriter.println("<script language=\"JavaScript\">\n" +
                    "    alert(\"验证码为空\");\n" +
                    "    window.location = \"../PetLoveSystem_war_exploded/view/register.jsp\";\n" +
                    "</script>");
        }else if(username.length()<5||username.length()>16){
            printWriter.println("<script language=\"JavaScript\">\n" +
                    "    alert(\"用户名格式错误，应当输入5-16个字符，请重新输入\");\n" +
                    "    window.location = \"../PetLoveSystem_war_exploded/view/register.jsp\";\n" +
                    "</script>");
        }else if(password.length()<5||password.length()>16){
            printWriter.println("<script language=\"JavaScript\">\n" +
                    "    alert(\"密码格式错误，应当输入5-16个字符，请重新输入\");\n" +
                    "    window.location = \"../PetLoveSystem_war_exploded/view/register.jsp\";\n" +
                    "</script>");
        }//判断用户输入的用户名和验证码和用户输入的用户名和验证码是否一致
        else if (vCode.equalsIgnoreCase(sessionVerifyCode)) {
            DBConnectionManager dbConnectionManager = new DBConnectionManager();

            String sql = "select userName from employeeAccount";
            PreparedStatement ps = dbConnectionManager.getPreparedStatement(sql);
//            先查询用户名是否重复
            ResultSet rs = null;
            try {
                rs = ps.executeQuery();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

            boolean flag = false;//判断用户名是否重复的标记
            while (true) {//查询用户名
                try {
                    if (!rs.next()) break;
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }

                try {//用户名重复
                    if (rs.getString("userName").equals(username)) {
                        flag = true;

                    }
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }

            if (flag) {//用户名重复
                printWriter.println("<script language=\"JavaScript\">\n" +
                        "    alert(\"用户名已存在\");\n" +
                        "    window.location = \"../PetLoveSystem_war_exploded/view/register.jsp\";\n" +
                        "</script>");
            } else {//不重复,进行插入
                String sql_1 = "insert into employeeAccount values(?,?)";
                PreparedStatement ps_1 = dbConnectionManager.getPreparedStatement(sql_1);
                try {
                    ps_1.setString(1, username);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                try {
                    ps_1.setString(2, password);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }

                try {
                    ps_1.executeUpdate();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                printWriter.println("<script language=\"JavaScript\">\n" +
                        "    alert(\"注册成功,请登录\");\n" +
                        "    window.location = \"../PetLoveSystem_war_exploded/view/loginPet.jsp\";\n" +
                        "</script>");

            }

        } else {
//            写在同一个JavaScript下，有序进行
            printWriter.println("<script language=\"JavaScript\">\n" +
                    "    alert(\"验证码错误\");\n" +
                    "    window.location = \"../PetLoveSystem_war_exploded/view/register.jsp\";\n" +
                    "</script>");
        }


        //        servlet跳转到jsp界面
//        response.sendRedirect("http://localhost:8080/PetLoveSystem_war_exploded/view/loginPet.jsp");
//        request.getRequestDispatcher("/loginPet.jsp").forward(request,response);
    }
}
