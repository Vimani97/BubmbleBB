<%@ page import="com.example.bubmblebb.DAO.ProductDAOImpl" %>
<%@ page import="com.example.bubmblebb.DB.DBConnection" %>
<%@ page import="com.example.bubmblebb.entity.ProductDetails" %><%--
  Created by IntelliJ IDEA.
  User: viman
  Date: 2/21/2023
  Time: 2:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<html>
<head>
    <link rel="icon" href="logo.png" type="image/x-icon">
    <title>Edit Products</title>
    <%@include file="allCSS.jsp"%>
</head>
<body style="background-color: #f0f2f2;">
<%@include file="navbar.jsp"%>

<div class="container p-2">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">

                    <h4 class="text-center">Edit Products</h4>



                    <%
                        int product_Id = Integer.parseInt(request.getParameter("product_Id"));
                        ProductDAOImpl dao = new ProductDAOImpl(DBConnection.getConn());
                        ProductDetails p = dao.getProductById(product_Id);
                    %>


                    <form action="../ProductEditServlet" method="post">
                        <input type="hidden" name="id" value="<%=p.getProduct_Id()%>">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Product Name</label>
                            <input  name="pname" type="text" class="form-control"
                                    id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=p.getProduct_name()%>" >
                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmail2">Product Brand</label>
                            <input  name="pbrand" type="text" class="form-control"
                                    id="exampleInputEmail2" aria-describedby="emailHelp" value="<%=p.getProduct_brand()%>">
                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmail3">Price</label>
                            <input  name="pprice" type="number" class="form-control"
                                    id="exampleInputEmail3" aria-describedby="emailHelp" value="<%=p.getPrice()%>">
                        </div>


                        <div class="form-group">
                            <label for="inputState1">Product States</label>
                            <select
                                    name="pstatus" class="form-control" id="inputState1">
                                <%
                                    if ("Active".equals(p.getStatus())){
                                %>
                                <option value="Active">Active</option>
                                <option value="Inactive">Inactive</option>
                                <%
                                } else {
                                %>
                                <option value="Inactive">Inactive</option>
                                <option value="Active">Active</option>
                                <%
                                    }
                                %>

                            </select>
                        </div>



                        <button type="submit" class="btn btn-dark text-warning">Update Product</button>


                    </form>

                </div>
            </div>
        </div>
    </div>

</div>

<div style="margin-top: 260px;">
    <%@include file="footer.jsp"%>
</body>
</html>
