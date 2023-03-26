<%@ page import="com.example.bubmblebb.DAO.Product_OrderDAOImpl" %>
<%@ page import="com.example.bubmblebb.DB.DBConnection" %>
<%@ page import="com.example.bubmblebb.entity.Product_order" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: viman
  Date: 2/21/2023
  Time: 3:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<html>
<head>
    <link rel="icon" href="logo.png" type="image/x-icon">
    <title>Admin Order</title>
    <%@include file="allCSS.jsp"%>

</head>
<body>
<c:if test="${empty userobj}">
    <c:redirect url="../login.jsp"/>
</c:if>

<%@include file="navbar.jsp"%>
<h3 class="text-center">Hello Admin</h3>

<table class="table table-striped table-hover table-bordered">
    <thead class="bg-info">
    <tr class="text-center text-white">
        <th scope="col">Oder Id</th>
        <th scope="col">Name</th>
        <th scope="col">Email</th>
        <th scope="col">Address</th>
        <th scope="col">Phone Number</th>
        <th scope="col">Product Name</th>
        <th scope="col">Product Brand</th>
        <th scope="col">Price</th>
        <th scope="col">Payment Type</th>
    </tr>
    </thead>
    <tbody>

    <%
        Product_OrderDAOImpl dao = new Product_OrderDAOImpl(DBConnection.getConn());
        List<Product_order> plist = dao.getAllOrder();
        for(Product_order p:plist)
        {%>
    <tr>
        <th scope="row"><%=p.getOrder_id()%></th>
        <td><%=p.getUserName()%></td>
        <td><%=p.getEmail()%></td>
        <td><%=p.getFulladd()%></td>
        <td><%=p.getPhone()%></td>
        <td><%=p.getProductName()%></td>
        <td><%=p.getBrandName()%></td>
        <td><%=p.getPrice()%></td>
        <td><%=p.getPaymentType()%></td>

    </tr>
      <%  }
    %>

    </tbody>
</table>



<div style="margin-top: 260px;">
    <%@include file="footer.jsp"%>
</body>
</html>
