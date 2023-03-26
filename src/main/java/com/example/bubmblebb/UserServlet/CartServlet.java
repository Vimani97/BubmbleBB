package com.example.bubmblebb.UserServlet;

import com.example.bubmblebb.DAO.CartDAOImpl;
import com.example.bubmblebb.DAO.ProductDAOImpl;
import com.example.bubmblebb.DB.DBConnection;
import com.example.bubmblebb.entity.Cart;
import com.example.bubmblebb.entity.ProductDetails;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CartServlet", value = "/CartServlet")
public class CartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        try {

            int pid = Integer.parseInt(request.getParameter( "pid").trim());
            int uid = Integer.parseInt(request.getParameter("uid"));

            ProductDAOImpl dao = new ProductDAOImpl(DBConnection.getConn());
            ProductDetails p = dao.getProductById(pid);

            Cart c = new Cart();
            c.setPid(pid);
            c.setUserId(uid);
            c.setProductName(p.getProduct_name());
            c.setProductBrand(p.getProduct_brand());
            c.setPrice(Double.parseDouble(p.getPrice()));
            c.setTotalPrice(Double.parseDouble(p.getPrice()));

            CartDAOImpl dao2 = new CartDAOImpl(DBConnection.getConn());
            boolean f = dao2.addCart(c);

            HttpSession session = request.getSession();



            if (f) {
                session.setAttribute("addCart", "Product Added to Cart");
                response.sendRedirect("all_new_poduct.jsp");
            //    System.out.println("Add card Successfully");
            } else {
                session.setAttribute("failed", "Something Wrong on server");
                response.sendRedirect("all_new_poduct.jsp");
                // System.out.println("Not added to cart");
            }

        } catch (NumberFormatException e) {
            System.out.println("display " + e.getMessage());
        }

    }

}
