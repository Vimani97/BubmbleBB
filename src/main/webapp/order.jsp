<%@ page import="com.example.bubmblebb.entity.User" %>
<%@ page import="com.example.bubmblebb.DAO.Product_OrderDAOImpl" %>
<%@ page import="com.example.bubmblebb.DB.DBConnection" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.bubmblebb.entity.Product_order" %><%--
  Created by IntelliJ IDEA.
  User: viman
  Date: 2/28/2023
  Time: 12:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <link rel="icon" href="logo.png" type="image/x-icon">
    <title>Order Products</title>
    <%@include file="all_components/allCSS.jsp"%>
</head>
<body style="background-color: #f0f1f2;">

<c:if test="${empty userobj}">
    <c:redirect url="login.jsp">
    </c:redirect>
</c:if>
<%@include file="all_components/navbar.jsp"%>

        <h5 class="text-center text-primary mt-2"> Your Order</h5>
        <div class="container p-1">
            <table class="table table-striped mt-3">
                <thead class="bg-primary text-white">
                <tr>
                    <th scope="col">Order Id</th>
                    <th scope="col">Name</th>
                    <th scope="col">Product Name</th>
                    <th scope="col">Product Brand</th>
                    <th scope="col">Price</th>
                    <th scope="col">Payment Type</th>
                </tr>
                </thead>
                <tbody>
                <%
                  User us = (User) session.getAttribute("userobj");
                  Product_OrderDAOImpl dao = new Product_OrderDAOImpl(DBConnection.getConn());
                  List<Product_order> plist= dao.getProduct(us.getEmail());

                  for (Product_order p:plist)
                  {%>
                        <tr>
                            <th scope="row"><%=p.getOrder_id()%></th>
                            <td><%=p.getUserName()%></td>
                            <td><%=p.getProductName()%></td>
                            <td><%=p.getBrandName()%></td>
                            <td><%=p.getPrice()%></td>
                            <td><%=p.getPaymentType()%></td>
                        </tr>

                <%  }
                %>
                </tbody>
            </table>
        </div>
</body>
</html>
