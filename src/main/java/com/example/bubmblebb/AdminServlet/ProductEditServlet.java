package com.example.bubmblebb.AdminServlet;

import com.example.bubmblebb.DAO.ProductDAOImpl;
import com.example.bubmblebb.DB.DBConnection;
import com.example.bubmblebb.entity.ProductDetails;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ProductEditServlet", value = "/ProductEditServlet")
public class ProductEditServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try{
            int product_Id = Integer.parseInt(request.getParameter("id"));
            String product_name = request.getParameter("pname");
            String product_brand = request.getParameter("pbrand");
            String price = request.getParameter("pprice");
            String status = request.getParameter("pstatus");

            ProductDetails  p = new ProductDetails();
            p.setProduct_Id(product_Id);
            p.setProduct_name(product_name);
            p.setProduct_brand(product_brand);
            p.setPrice(price);
            p.setStatus(status);

            ProductDAOImpl dao = new ProductDAOImpl(DBConnection.getConn());
            boolean f = dao.updateEditProduct(p);

            HttpSession session = request.getSession();


            if(f){
                session.setAttribute("succMsg","Product Update Successfully");
                response.sendRedirect("admin/all_products.jsp");
            }else{
                session.setAttribute("FailedMsg","Something Wrong on server");
                response.sendRedirect("admin/all_products.jsp");
            }



        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
