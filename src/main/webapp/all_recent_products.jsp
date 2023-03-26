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
<html>
<head>
    <link rel="icon" href="logo.png" type="image/x-icon">
    <title>All Recent Products</title>
    <%@include file="all_components/allCSS.jsp"%>

    <style type="text/css">
        .crd-ho:hover{
            background-color: #fcf7f7;
        }
    </style>


</head>
<body>
<% User u = (User)session.getAttribute("userobj");%>
<%@include file="all_components/navbar.jsp"%>
        <div class="container-fluid">
            <div class="row p-3">
                    <%
                        ProductDAOImpl dao2 = new ProductDAOImpl(DBConnection.getConn());
                        List<ProductDetails> list2 = dao2.getAllRecentProducts();
                        for (ProductDetails p : list2){
                    %>
                    <div class="col-md-3">
                        <div class="card crd-ho mt-3">
                            <div class="card-body text-center">
                                <img alt="" src="products/<%=p.getPhotoName()%>"
                                     style="width: 100px; height: 200px"
                                     class="img-thumb-lin">
                                <p><%=p.getProduct_name()%></p>
                                <p><%=p.getProduct_brand()%></p>

                                <%
                                    if(p.getProduct_category().equals("Old"))
                                    {%>

                                <p>Categories:<%=p.getProduct_category()%></p>
                                <div class="row">
                                    <a href="view_products.jsp?product_Id=<%=p.getProduct_Id()%>" class="btn btn-success btn-sm ml-2">View Details</a>
                                    <a href="" class="btn btn-danger btn-sm ml-1"><%=p.getPrice()%></a>
                                </div>
                                <% }else{%>
                                <p>Categories:<%=p.getProduct_category()%></p>
                                <div class="row">
                                    <% if (u==null)
                                    {%>
                                    <a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add Cart</a>
                                    <%
                                    } else {
                                    %>
                                    <a href="CartServlet?pid=<%=p.getProduct_Id()%> &&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2">Add Cart</a>
                                    <%
                                        }
                                    %>
                                    <a href="view_products.jsp?product_Id=<%=p.getProduct_Id()%>" class="btn btn-success btn-sm ml-2">View Details</a>
                                    <a href="" class="btn btn-danger btn-sm ml-1"><%=p.getPrice()%></a>
                                </div>
                                <%  }

                                %>

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
