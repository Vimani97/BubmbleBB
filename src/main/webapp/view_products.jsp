<%@ page import="com.example.bubmblebb.DAO.ProductDAOImpl" %>
<%@ page import="com.example.bubmblebb.DB.DBConnection" %>
<%@ page import="com.example.bubmblebb.entity.ProductDetails" %><%--
  Created by IntelliJ IDEA.
  User: viman
  Date: 2/24/2023
  Time: 8:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" href="logo.png" type="image/x-icon">
    <title>View All Products</title>
    <%@include file="all_components/allCSS.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
    <%@include file="all_components/navbar.jsp"%>

    <%
        int product_Id = Integer.parseInt(request.getParameter("product_Id"));
        ProductDAOImpl dao = new ProductDAOImpl(DBConnection.getConn());
        ProductDetails p = dao.getProductById(product_Id);
    %>

    <div class="container p-3">
        <div class="row">
            <div class="col-md-6 text-center p-5 border bg-white">
                <img src="products/<%=p.getPhotoName()%>" style="height: 150px; width: 100px"><br>
                <h4 class="mt-3">Product Name: <span class="text-success"><%=p.getProduct_name()%></span></h4>
                <h4>Brand       : <span class="text-success"><%=p.getProduct_brand()%></span></h4>
                <h4>Category    : <span class="text-success"><%=p.getProduct_category()%></span></h4>

            </div>

            <div class="col-md-6 text-center p-5 border bg-white">
                <h4><%=p.getProduct_name()%></h4>

                <%
                    if ("Old".equals(p.getProduct_category())){
                %>
                <h5 class="text-primary">Contact To Seller</h5>
                <h5 class="text-primary"> <i class="fa-solid fa-envelope"></i> Email:<%=p.getEmail()%> </h5>
                <%
                }
                %>




                <div class="row ">
                    <div class="col-md-4 text-danger text-center p-2">
                        <i class="fas fa-money-bill-wave fa-2x"></i>
                        <p>Cash on Delivery</p>
                    </div>
                    <div class="col-md-4 text-danger text-center p-2">
                        <i class="fas fa-undo-alt fa-2x"></i>
                        <p>Return Available</p>
                    </div>
                    <div class="col-md-4 text-danger text-center p-2">
                        <i class="fas fa-truck-moving fa-2x"></i>
                        <p>Free Shipping</p>
                    </div>
                </div>

                <%
                    if("Old".equals(p.getProduct_category())){
                %>
                <div class="text-center p-3">
                    <a href="index.jsp" class="btn btn-success"><i class="fa-sharp fa-solid fa-cart-plus"></i>Continue Shopping</a>
                    <a href="" class="btn btn-danger"><i class="fa-regular fa-rupee-sign"></i>200</a>
                </div>
                <%
                    } else{%>
                <div class="text-center p-3">
                    <a href="" class="btn btn-primary"><i class="fa-sharp fa-solid fa-cart-plus"></i>Add Cart</a>
                    <a href="" class="btn btn-danger"><i class="fa-regular fa-rupee-sign"></i>200</a>
                </div>

                 <%   }
                %>

            </div>
        </div>
    </div>

</body>
</html>
