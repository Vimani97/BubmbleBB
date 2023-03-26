<%@ page import="com.example.bubmblebb.entity.ProductDetails" %>
<%@ page import="com.example.bubmblebb.DAO.ProductDAOImpl" %>
<%@ page import="com.example.bubmblebb.DB.DBConnection" %>
<%@ page import="com.example.bubmblebb.entity.User" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: viman
  Date: 3/1/2023
  Time: 8:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<html>
<head>
    <link rel="icon" href="logo.png" type="image/x-icon">
    <title>User: Old Product</title>
    <%@include file="all_components/allCSS.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
<%@include file="all_components/navbar.jsp"%>

<c:if test="${not empty succMsg}">
    <div class="alert alert-success text-center">
       ${succMsg}
    </div>
    <c:remove var="succMsg" scope="session"/>
</c:if>


<div class="container p-5">
            <table class="table table-striped">
                <thead class="bg-primary text-white">
                <tr>
                    <th scope="col">Product Name</th>
                    <th scope="col">Brand Name</th>
                    <th scope="col">Price</th>
                    <th scope="col">Category</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>

                <%
                    User u = (User) session.getAttribute("userobj");
                    String email = u.getEmail();


                    ProductDAOImpl dao = new ProductDAOImpl(DBConnection.getConn());
                    List<ProductDetails> list = dao.getProductByOld(email, "Old");
                    for(ProductDetails p:list)
                    {%>
                <tr>
                    <td><%=p.getProduct_name()%></td>
                    <td><%=p.getProduct_brand()%></td>
                    <td><%=p.getPrice()%></td>
                    <td><%=p.getProduct_category()%></td>
                    <td><a href="DeleteOldProductServlet?em=<%=email%>&&id=<%=p.getProduct_Id()%>"
                           class="btn btn-sm btn-danger">Delete</a></td>
                </tr>
                <%}
                %>

                </tbody>
            </table>

        </div>
</body>
</html>
