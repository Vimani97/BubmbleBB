<%--
  Created by IntelliJ IDEA.
  User: viman
  Date: 2/21/2023
  Time: 12:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <link rel="icon" href="logo.png" type="image/x-icon">
    <title>Admin: Home</title>
    <%@include file="allCSS.jsp"%>
    <style type="text/css">
        a{
            text-decoration: none;
            color: black;
        }

        a:hover{
            text-decoration: none;
            color: black;
        }
    </style>
</head>
<body>
<%@include file="navbar.jsp"%>

    <c:if test="${empty userobj}">
        <c:redirect url="../login.jsp"/>
    </c:if>
        <div class="container">
            <div class="row p-5">
                <div class="col-md-3">
                    <a href="add_products.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fas fa-square-plus fa-3x text-primary"></i><br>
                                <h4>Add Products</h4>
                                 ----------------
                        </div>
                    </div>
                    </a>
                </div>

                <div class="col-md-3">
                    <a href="all_products.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fa-solid fa-clipboard fa-3x text-danger"></i><br>
                            <h4>All Products</h4>
                            ----------------
                        </div>
                    </div>
                    </a>
                </div>

                <div class="col-md-3">
                    <a href="order.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fas fa-box-open fa-3x text-warning"></i><br>
                            <h4>Order</h4>
                            ----------------
                        </div>
                    </div>
                    </a>
                </div>

                <div class="col-md-3">
                    <a data-toggle="modal" data-target="#exampleModalCenter">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fas fa-sign-out-alt fa-3x text-primary"></i><br>
                            <h4>Logout</h4>
                            ----------------
                        </div>
                    </div>
                    </a>
                </div>

                <%--2nd row--%>
                <div class="col-md-12 mt-3">
                    <a href="AdminBrands.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-success">
                                    <i class="fa-solid fa-tag fa-3x"></i>
                                </div>
                                <h4>Brands</h4>
                                ----------------
                            </div>
                        </div>
                    </a>
                </div>


                <%--2nd row--%>

            </div>
        </div>

<!-- logout modal-->
<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="text-center">
                    <h4>Do You Want to Logout</h4>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <a href="../LogoutServlet" type="button" class="btn btn-primary text-white">Logout</a>
                </div>

            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>

<!-- end logout modal-->




<div style="margin-top: 260px;">
<%@include file="footer.jsp"%>
</div>
</body>
</html>
