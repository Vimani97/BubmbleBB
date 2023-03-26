package com.example.bubmblebb.UserServlet;

import com.example.bubmblebb.DAO.CartDAOImpl;
import com.example.bubmblebb.DAO.Product_OrderDAOImpl;
import com.example.bubmblebb.DB.DBConnection;
import com.example.bubmblebb.entity.Cart;
import com.example.bubmblebb.entity.ProductDetails;
import com.example.bubmblebb.entity.Product_order;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@WebServlet(name = "OrderServlet", value = "/OrderServlet")
public class OrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try{

            HttpSession session = request.getSession();

           int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("username");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String zip = request.getParameter("zip");
            String paymentType = request.getParameter("payment");

            String fullAddress = address+","+city+","+state+","+zip;
            CartDAOImpl dao = new CartDAOImpl(DBConnection.getConn());

            List<Cart> plist = dao.getProductByUser(id);

           if(plist.isEmpty())
           {
                session.setAttribute("failedMsg", "Add Item");
                response.sendRedirect("checkout.jsp");

           } else {
               Product_OrderDAOImpl dao2 = new Product_OrderDAOImpl(DBConnection.getConn());
               Product_order o = null;

               ArrayList<Product_order> orderList = new ArrayList<Product_order>();
               Random r = new Random();
               for (Cart c:plist)
               {
                   o = new Product_order();
                   //  i++;
                   o.setOrder_id("BOOK-ORD-00"+ r.nextInt(1000));
                   o.setUserName(name);
                   o.setEmail(email);
                   o.setPhone(phone);
                   o.setFulladd(fullAddress);
                   o.setProductName(c.getProductName());
                   o.setBrandName(c.getProductBrand());
                   o.setPrice(c.getPrice()+"");
                   o.setPaymentType(paymentType);
                   orderList.add(o);

               }

               if ("noSelect".equals(paymentType)){
                   session.setAttribute("failedMsg", "Choose payment method");
                   response.sendRedirect("checkout.jsp");
               }else {
                   boolean f = dao2.saveOrder(orderList);
                   if (f)
                   {
                       response.sendRedirect("order_success.jsp");

                   } else {
                       session.setAttribute("failedMsg", "Sorry Your order failed");
                       response.sendRedirect("checkout.jsp");
                   }
               }

           }

        }catch (Exception e){
            e.printStackTrace();
        }


    }
}
