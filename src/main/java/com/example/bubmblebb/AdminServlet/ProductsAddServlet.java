package com.example.bubmblebb.AdminServlet;

import com.example.bubmblebb.DAO.ProductDAOImpl;
import com.example.bubmblebb.DB.DBConnection;
import com.example.bubmblebb.entity.ProductDetails;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;

@WebServlet(name = "ProductsAddServlet", value = "/ProductsAddServlet")
@MultipartConfig
public class ProductsAddServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try{
          String product_name = request.getParameter("pname");
          String product_brand = request.getParameter("pbrand");
          String price = request.getParameter("pprice");
          String product_category = request.getParameter("pcategories");
          String status = request.getParameter("pstatus");
          Part part = request.getPart("pimg");
          String fileName = part.getSubmittedFileName();
       //  String email = request.getParameter("email");

            ProductDetails p = new ProductDetails(product_name,product_brand,price,product_category,status,fileName,"admin");

            ProductDAOImpl dao = new ProductDAOImpl(DBConnection.getConn());



          boolean f = dao.addProducts(p);

            HttpSession session = request.getSession();

            if(f){

                String path = getServletContext().getRealPath("")+"products";
                //System.out.println(path);  find path work

                File file = new File(path);

                part.write(path + File.separator + fileName);

                session.setAttribute("succMsg" , "Product Add Successfully");
                response.sendRedirect("admin/add_products.jsp");
            }
            else {
                session.setAttribute("failedMsg" , "Something Wrong On Server");
                response.sendRedirect("admin/add_products.jsp");
            }


           // System.out.println(p);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
