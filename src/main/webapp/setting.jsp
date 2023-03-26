<%--
  Created by IntelliJ IDEA.
  User: viman
  Date: 2/28/2023
  Time: 9:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<html>
<head>
    <link rel="icon" href="logo.png" type="image/x-icon">
    <title>Title</title>
    <%@include file="all_components/allCSS.jsp"%>

    <style>
        a{
            text-decoration: none;
            color: black;
        }
        a:hover{
            text-decoration: none;
        }
    </style>

</head>
<body style="background-color: #f7f7f7;">

        <c:if test="${empty userobj}">
            <c:redirect url="login.jsp"/>
        </c:if>



<%@include file="all_components/navbar.jsp"%> 

        <div class="container">
            <h3 class="text-center">Hello! ${userobj.name}</h3>
            <div class="row p-5">

                <div class="col-md-4">
                    <a href="sell_products.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                    <i class="fa-solid fa-clipboard fa-3x"></i>
                                </div>
                                <h4>Sell Old Products</h4>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-4">
                    <a href="old_product.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                    <i class="fa-solid fa-clipboard fa-3x"></i>
                                </div>
                                <h4>Sell Old Products</h4>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-4">
                    <a href="edit_profile.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                    <i class="fas fa-edit fa-3x"></i>
                                </div>
                                <h4>Edit Profile</h4>
                            </div>
                        </div>
                    </a>
                </div>



                <div class="col-md-6 mt-3">
                    <a href="order.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-danger">
                                    <i class="fa-solid fa-box-open fa-3x"></i>
                                </div>
                                <h4>My Order</h4>
                                <p>Track Your Order</p>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-6 mt-3">
                    <a href="helpLine.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-success">
                                    <i class="fa-solid fa-hand-holding-hand fa-3x"></i>
                                </div>
                                <h4>Help Center</h4>
                                <p>24 hours</p>
                            </div>
                        </div>
                    </a>
                </div>

            </div>
        </div>
<br><br>
<%@include file="all_components/footer.jsp"%>
</body>
</html>
