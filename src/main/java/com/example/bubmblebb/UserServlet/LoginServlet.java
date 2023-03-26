package com.example.bubmblebb.UserServlet;

import com.example.bubmblebb.DAO.UserDAOImlp;
import com.example.bubmblebb.DB.DBConnection;
import com.example.bubmblebb.entity.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            UserDAOImlp dao = new UserDAOImlp(DBConnection.getConn());

            HttpSession session = request.getSession();

            String email = request.getParameter("email");
            String password = request.getParameter("password");

            //System.out.println(email+" "+password);

            if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
                User us = new User();
                us.setName("Admin");
                session.setAttribute("userobj", us);
                response.sendRedirect("admin/home.jsp");

            } else {

                User us = dao.login(email, password);

                if (us != null) {
                    session.setAttribute("userobj", us);
                    response.sendRedirect("index.jsp");
                } else {
                    session.setAttribute("failedMsg", "Email & Password is invalid");
                    response.sendRedirect("login.jsp");
                }



            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
