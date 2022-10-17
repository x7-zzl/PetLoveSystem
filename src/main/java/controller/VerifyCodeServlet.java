package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.awt.image.BufferedImage;
import java.io.IOException;

//用来把验证码响应到各户端和保存验证码的内容
@WebServlet(name = "VerifyCodeServlet", value = "/VerifyCodeServlet")
public class VerifyCodeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //创建验证码类
        VerifyCode vc = new VerifyCode();
        // 获取随机图片
        BufferedImage image = vc.getImage();
        //保存图片上的文本到session域中
        request.getSession().setAttribute("vCode", vc.getText());
        //把图片响应给客户端
        VerifyCode.output(image, response.getOutputStream());
    }

}
