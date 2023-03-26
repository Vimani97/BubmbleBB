package com.example.bubmblebb.UserServlet;

import com.example.bubmblebb.DAO.CartDAOImpl;
import com.example.bubmblebb.DB.DBConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "RemoveProductsServlet", value = "/RemoveProductsServlet")
public class RemoveProductsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int pid = Integer.parseInt(request.getParameter("bid").trim());
        int uid = Integer.parseInt(request.getParameter("uid"));
        int cid = Integer.parseInt(request.getParameter("cid"));

        CartDAOImpl dao = new CartDAOImpl(DBConnection.getConn());
        boolean f = dao.deleteProduct(pid,uid,cid);
        HttpSession session = request.getSession();

        if (f)
        {
            session.setAttribute("succMsg", "Product Removed from Cart");
            response.sendRedirect("checkout.jsp");
        } else {
            session.setAttribute("failedMsg", "Something wrong on server");
            response.sendRedirect("checkout.jsp");
        }

    }

}
