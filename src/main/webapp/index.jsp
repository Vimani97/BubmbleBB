<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.bubmblebb.DB.DBConnection" %>
<%@ page import="com.example.bubmblebb.DAO.ProductDAOImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.bubmblebb.entity.ProductDetails" %>
<%@ page import="com.example.bubmblebb.entity.User" %>
<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="logo.png" type="image/x-icon">
    <title>Customer Home page</title>
    <%@include file="all_components/allCSS.jsp"%>
    <style type="text/css">
        .back-img{
            background: url("img/2.png");
            height: 70vh;
            width: 100%;
            background-size: cover;
            background-repeat: no-repeat;
        }
       .crd-ho:hover{
           background-color: #fcf7f7;
       }
    </style>
</head>

<body style="background-color: #fcf7f7;">

<% User u = (User)session.getAttribute("userobj");%>

<%@include file="all_components/navbar.jsp"%>
<div class="container-fluid back-img">
    <br><br><br>
    <h2 class="text-center text-danger">Bumble Bee Online Loan Offering System</h2>
</div>

<!-- Start Recent Products -->
<hr>
<div class="container">
    <h3 class="text-center">Recent Product</h3>
    <div class="row">
    <%
        ProductDAOImpl dao2 = new ProductDAOImpl(DBConnection.getConn());
        List<ProductDetails> list2 = dao2.getRecentProducts();
        for (ProductDetails p : list2){
    %>
        <div class="col-md-4">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="" src="products/<%=p.getPhotoName()%>"
                         style="width: 150px; height: 200px"
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

                        <a href="view_products.jsp?product_Id=<%=p.getProduct_Id()%>" class="btn btn-success btn-sm ">View Details</a>
                        <a href="" class="btn btn-danger btn-sm "><%=p.getPrice()%></a>
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
         <div class="text-center mt-2">
             <a href="all_recent_products.jsp" class="btn btn-danger btn-sm text-white">View All</a>
         </div>

</div>
<
<!-- End Recent Products -->

<hr>

<!-- Start New Products -->

<div class="container">
<h3 class="text-center mt-1">New Products</h3>
<div class="row">


        <%
           ProductDAOImpl dao = new ProductDAOImpl(DBConnection.getConn());
           List<ProductDetails> list = dao.getNewProduct();
           for (ProductDetails p : list){
        %>
    <div class="col-md-4">
        <div class="card crd-ho">
            <div class="card-body text-center">
                <img alt="" src="products/<%=p.getPhotoName()%>"
                     style="width: 150px; height: 200px"
                     class="img-thumb-lin">
                <p><%=p.getProduct_name()%></p>
                <p><%=p.getProduct_brand()%></p>
                <p>Categories: <%=p.getProduct_category()%></p>

                <div class="row text-center">
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
            </div>
        </div>
    </div>

        <%
        }
        %>

</div>

<div class="text-center mt-2">
    <a href="all_new_poduct.jsp" class="btn btn-danger btn-sm text-white">View All</a>
</div>
</div>

<!-- End new products-->




<hr>

<div class="container">
<h3 class="text-center">Old Products</h3>
<div class="row">


    <%
        ProductDAOImpl dao3 = new ProductDAOImpl(DBConnection.getConn());
        List<ProductDetails> list3 = dao3.getOldProducts();
        for (ProductDetails p : list3){
    %>
    <div class="col-md-4">
        <div class="card crd-ho">
            <div class="card-body text-center">
                <img alt="" src="products/<%=p.getPhotoName()%>"
                     style="width: 150px; height: 200px"
                     class="img-thumb-lin">
                <p><%=p.getProduct_name()%></p>
                <p><%=p.getProduct_brand()%></p>
                <p><%=p.getProduct_category()%></p>
                <div class="row">

                    <a href="view_products.jsp?product_Id=<%=p.getProduct_Id()%>" class="btn btn-success btn-sm ml-1">View Details</a>
                    <a href="" class="btn btn-danger btn-sm ml-1"><%=p.getPrice()%></a>
                </div>

            </div>
        </div>
    </div>

    <%
        }
    %>

</div>
<div class="text-center mt-2">
    <a href="all_old_products.jsp" class="btn btn-danger btn-sm text-white">View All</a>
</div>
</div>


<%@include file="all_components/footer.jsp"%>
</body>
</html>