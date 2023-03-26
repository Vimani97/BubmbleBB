package com.example.bubmblebb.AdminServlet;

import com.example.bubmblebb.DAO.ProductDAOImpl;
import com.example.bubmblebb.DB.DBConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ProductDeleteServlet", value = "/ProductDeleteServlet")
public class ProductDeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            int product_Id = Integer.parseInt(request.getParameter("product_Id"));

            ProductDAOImpl dao = new ProductDAOImpl(DBConnection.getConn());
            boolean f = dao.deleteProducts(product_Id);
            HttpSession session = request.getSession();


            if(f){
                session.setAttribute("succMsg","Product Delete Successfully");
                response.sendRedirect("admin/all_products.jsp");
            }else{
                session.setAttribute("FailedMsg","Something Wrong on server");
                response.sendRedirect("admin/all_products.jsp");
            }
        } catch (Exception e){
            e.printStackTrace();
        }
    }

}
