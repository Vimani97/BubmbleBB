package com.example.bubmblebb.UserServlet;

import com.example.bubmblebb.DAO.UserDAOImlp;
import com.example.bubmblebb.DB.DBConnection;
import com.example.bubmblebb.entity.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "RegisterServlet", value = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            String name=request.getParameter("fname");
            String email=request.getParameter("uemail");
            String nic=request.getParameter("unic");
            String dob=request.getParameter("udob");
            String phone=request.getParameter("uphone");
            String password=request.getParameter("upass");
            String check=request.getParameter("check");

            //System.out.println(name+" "+email+" "+nic+" "+dob+" "+phone+" "+password+" "+check);

            HttpSession session = request.getSession();
            User us=new User();
            us.setName(name);
            us.setEmail(email);
            us.setNic(nic);
            us.setDob(dob);
            us.setPhone(phone);
            us.setPassword(password);

            if (check!=null) {
                UserDAOImlp dao = new UserDAOImlp(DBConnection.getConn());

                boolean f2 = dao.checkUser(email);
                if (f2){
                    boolean f = dao.userRegister(us);

                    if (f) {
                        //System.out.println("User register Successfully");
                        session.setAttribute("succMsg" ,"Registration Successfully");
                        response.sendRedirect("register.jsp");

                    } else {
                        session.setAttribute("failedMsg","Something Wrong on Server");
                        response.sendRedirect("register.jsp");
                        // System.out.println("Please Try Again");
                    }
                }else {
                    session.setAttribute("failedMsg","User Already Exist Try Another Email Address");
                    response.sendRedirect("register.jsp");
                }
            }
            else {
                session.setAttribute("failedMsg","Sorry! Persons under the age of 18 cannot register.");
                response.sendRedirect("register.jsp");
                   // System.out.println("Please Check Agree & Terms");
                }



        }
        catch (Exception e){
            e.printStackTrace();
        }

    }
}
