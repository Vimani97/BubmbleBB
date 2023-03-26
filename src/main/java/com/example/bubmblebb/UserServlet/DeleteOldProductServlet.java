package com.example.bubmblebb.UserServlet;

import com.example.bubmblebb.DAO.ProductDAOImpl;
import com.example.bubmblebb.DB.DBConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteOldProductServlet", value = "/DeleteOldProductServlet")
public class DeleteOldProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            String em = request.getParameter("em");
            int id = Integer.parseInt(request.getParameter("id"));

            ProductDAOImpl dao = new ProductDAOImpl(DBConnection.getConn());

            boolean f = dao.oldProductDelete(em,"Old", id);
            HttpSession session = request.getSession();

            if (f)
            {
                session.setAttribute("succMsg", "Old Product Delete Successfully");
                response.sendRedirect("old_product.jsp");
            } else {
                session.setAttribute("failedMsg", "Something wrong on server");
                response.sendRedirect("old_product.jsp");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }


}
