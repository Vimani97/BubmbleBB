<%@ page import="com.example.bubmblebb.DAO.ProductDAOImpl" %>
<%@ page import="com.example.bubmblebb.DB.DBConnection" %>
<%@ page import="com.example.bubmblebb.entity.ProductDetails" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.bubmblebb.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: viman
  Date: 2/24/2023
  Time: 12:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<html>
<head>
    <link rel="icon" href="logo.png" type="image/x-icon">
    <title>All Recent Products</title>
    <%@include file="all_components/allCSS.jsp"%>

    <style type="text/css">
        .crd-ho:hover{
            background-color: #fcf7f7;
        }


        #toast {
            min-width: 300px;
            position: fixed;
            bottom: 30px;
            left: 50%;
            margin-left: -125px;
            background: #333;
            padding: 10px;
            color: white;
            text-align: center;
            z-index: 1;
            font-size: 18px;
            visibility: hidden;
            box-shadow: 0px 0px 100px #000;
        }

        #toast.display {
            visibility: visible;
            animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
        }

        @keyframes fadeIn {from { bottom:0;
            opacity: 0;
        }

            to {
                bottom: 30px;
                opacity: 1;
            }

        }
        @keyframes fadeOut {form { bottom:30px;
            opacity: 1;
        }

            to {
                bottom: 0;
                opacity: 0;
            }
        }

    </style>


</head>
<body>

<% User u = (User)session.getAttribute("userobj");%>

    <c:if test="${not empty addCart}">
        <div id="toast">${addCart}</div>

        <script type="text/javascript">
            showToast();
            function showToast(content)
            {
                $('#toast').addClass("display");
                $('#toast').html(content);
                setTimeout(()=>{
                    $("#toast").removeClass("display");
                },2000)
            }
        </script>
        
        <c:remove var="addCar" scope="session"/>
    </c:if>


<%@include file="all_components/navbar.jsp"%>
<div class="container-fluid">
    <div class="row p-3">

        <%
            ProductDAOImpl dao = new ProductDAOImpl(DBConnection.getConn());
            List<ProductDetails> list = dao.getAllNewProducts();
            for (ProductDetails p : list){
        %>
        <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="" src="products/<%=p.getPhotoName()%>"
                         style="width: 100px; height: 150px"
                         class="img-thumb-lin">
                    <p><%=p.getProduct_name()%></p>
                    <p><%=p.getProduct_brand()%></p>
                    <p>Categories: <%=p.getProduct_category()%></p>
                    <div class="row">

                        <% if (u==null)
                        {%>
                        <a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add Cart</a>
                        <%
                        } else {
                        %>
                        <a href="CartServlet?pid=<%=p.getProduct_Id()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2">Add Cart</a>
                        <%
                            }
                        %>


                        <a href="view_products.jsp?product_Id=<%=p.getProduct_Id()%>" class="btn btn-success btn-sm ml-2">View Details</a>
                        <a href="" class="btn btn-danger btn-sm ml-1"><%=p.getPrice()%></a>
                    </div>
                </div>
            </div>
        </div>

        <%
            }
        %>



    </div>
</div>
</body>
</html>

