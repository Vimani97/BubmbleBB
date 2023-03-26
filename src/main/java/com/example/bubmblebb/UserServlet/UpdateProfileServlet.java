package com.example.bubmblebb.UserServlet;

import com.example.bubmblebb.DAO.UserDAOImlp;
import com.example.bubmblebb.DB.DBConnection;
import com.example.bubmblebb.entity.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdateProfileServlet", value = "/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try{
            int id = Integer.parseInt(request.getParameter("id"));
            String name =request.getParameter("fname");
            String email=request.getParameter("uemail");
            String nic=request.getParameter("unic");
            String dob=request.getParameter("udob");
            String phone=request.getParameter("uphone");
            String password=request.getParameter("upass");

            User us = new User();
            us.setId(id);
            us.setName(name);
            us.setEmail(email);
            us.setNic(nic);
            us.setDob(dob);
            us.setPhone(phone);

            HttpSession session = request.getSession();
            UserDAOImlp dao = new UserDAOImlp(DBConnection.getConn());
            boolean f = dao.checkPassword(id,password);

            if(f)
            {
                   boolean f2 =  dao.updateProfile(us);
                   if(f2)
                   {
                       session.setAttribute("succMsg" ,"User profile update Successfully");
                       response.sendRedirect("edit_profile.jsp");
                   }else {
                       session.setAttribute("failedMsg" ,"Something wrong on server");
                       response.sendRedirect("edit_profile.jsp");
                   }
            } else {
                session.setAttribute("failedMsg" ,"Your Password is Incorrect");
                response.sendRedirect("edit_profile.jsp");
            }


        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
