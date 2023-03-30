<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.bubmblebb.DAO.ProductDAOImpl" %>
<%@ page import="com.example.bubmblebb.DB.DBConnection" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.bubmblebb.entity.ProductDetails" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <link rel="icon" href="logo.png" type="image/x-icon">
    <title>Add Products</title>
    <%@include file="allCSS.jsp"%>

</head>
<body>
<%@include file="navbar.jsp"%>

<c:if test="${empty userobj}">
    <c:redirect url="../login.jsp"/>
</c:if>

<h3 class="text-center">Hello Admin</h3>

<c:if test="${not empty succMsg}">
    <h5 class="text-center text-success">${succMsg}</h5>
    <c:remove var="succMsg" scope="session"/>
</c:if>

<c:if test="${not empty failedMsg}">
    <h5 class="text-center text-danger">${failedMsg}</h5>
    <c:remove var="failedMsg" scope="session"/>
</c:if>

<table class="table table-striped table-hover table-bordered">
    <thead class="bg-info">
    <tr class="text-center bg-dark text-warning">

        <th scope="col">ID</th>
        <th scope="col">Image</th>
        <th scope="col">Product Name</th>
        <th scope="col">Product Brand</th>
        <th scope="col">Price</th>
        <th scope="col">Category</th>
        <th scope="col">Status</th>
        <th scope="col">Action</th>
    </tr>
    </thead>
    <tbody>

    <%
        ProductDAOImpl dao = new ProductDAOImpl(DBConnection.getConn());
        List<ProductDetails> list = dao.getAllProducts();
        for(ProductDetails p:list){
    %>


    <tr>
        <td><%=p.getProduct_Id()%></td>
        <td><img src="../products/<%=p.getPhotoName()%>"
        style="width: 50px; height: 50px;"></td>
        <td><%=p.getProduct_name()%></td>
        <td><%=p.getProduct_brand()%></td>
        <td><%=p.getPrice()%></td>
        <td><%=p.getProduct_category()%></td>
        <td><%=p.getStatus()%></td>
        <td class="text-center">
            <a href="edit_products.jsp?product_Id=<%=p.getProduct_Id()%> " class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i> Edite </a> |
           <a href="../ProductDeleteServlet?product_Id=<%=p.getProduct_Id()%>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash-can"></i> Delete</a>


        </td>
    </tr>
    <%
        }
    %>

    </tbody>
</table>


<div style="margin-top: 260px;">
    <%@include file="footer.jsp"%>
</body>
</html>
