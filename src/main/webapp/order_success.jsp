<%--
  Created by IntelliJ IDEA.
  User: viman
  Date: 3/5/2023
  Time: 11:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" href="logo.png" type="image/x-icon">
    <title>Title</title>
    <%@include file="all_components/allCSS.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
<%@include file="all_components/navbar.jsp"%>

        <div class="container text-center mt-3">
            <i class="fas fa-check-circle fa-5x text-Success"></i>
            <h1> Thank You</h1>
            <h2> Your Order Successfully</h2>
            <h5> With 7 Days your Order will be Delivered In your Address</h5>
            <a href="index.jsp" class="btn btn-primary mt-3">Home</a>
            <a href="order.jsp" class="btn btn-danger mt-3">View Order</a>
        </div>


<%--<%@include file="all_components/footer.jsp"%>--%>
</body>
</html>
