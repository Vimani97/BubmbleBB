<%--
  Created by IntelliJ IDEA.
  User: viman
  Date: 3/26/2023
  Time: 12:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>

  <link rel="icon" href="logo.png" type="image/x-icon">
  <title>Brands</title>
  <%@include file="allCSS.jsp"%>

  <style>
    #brands {
      font-family: Arial, Helvetica, sans-serif;
      border-collapse: collapse;
      width: 100%;
    }

    #brands td, #brands th {
      border: 1px solid #ddd;
      padding: 8px;
    }

    #brands tr:nth-child(even){background-color: #f2f2f2;}

    #brands tr:hover {background-color: #ddd;}

    #brands th {
      padding-top: 12px;
      padding-bottom: 12px;
      text-align: left;
      background-color: #fcdc49;
      color: black;
    }

    <!-- -->

    label {
      font-weight: bold;
    }

    input[type=text] {
      width: 20%;
      padding: 12px 20px;
      margin: 8px 4px;
      display: inline-block;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box;
    }

    input[type=submit] {
      width: 10%;
      background-color: black;
      color: #fbd31c;
      font-weight: bold;
      padding: 14px 20px;
      margin: 8px 0;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    input[type=submit]:hover {
      background-color: #171717;
     color: white;

    }


  </style>



</head>
<body style="background-color: #f0f2f2;">
<%--<%@include file="navbar.jsp"%>--%>

    <%--Navigation--%>

<div class="container-fluid" style="height: 10px; background-color: black">

</div>

<div class="container-fluid p-3 bg-light" >
  <div class="row">
    <div class="col-md-3 text-success">
      <h3>Bumble Bee</h3>
    </div>



    <div class="cal-md-3">

      <c:if test="${not empty userobj}">
        <a  class="btn btn-dark text-warning">
          <i class="fas fa-user"></i> ${userobj.name}</a>
        <a data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-dark text-warning">
          <i class="fas fa-sign-in-alt"></i> Logout</a>
      </c:if>
      <c:if test="${empty userobj}">
        <a href="../LoginServlet" class="btn btn-dark text-warning">
          <i class="fas fa-sign-in-alt"></i> Login</a>
        <a href="../RegisterServlet" class="btn btn-dark text-warning">
          <i class="fas fa-user-plus"></i> Register</a>
      </c:if>

    </div>

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
          <button type="button" class="btn btn-primary text-white" data-dismiss="modal">Close</button>
          <a href="../LogoutServlet" type="button" class="btn btn-primary text-white">Logout</a>
        </div>

      </div>
      <div class="modal-footer">

      </div>
    </div>
  </div>
</div>

<!-- end logout modal-->

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
  <a class="navbar-brand" href="#"><i class="fas fa-home"></i> </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto ">
      <li class="nav-item active bg-dark text-warning">
        <a class="nav-link bg-dark text-warning " href="admin/home.jsp"> Home
          <span class="sr-only">(current)</span></a>
      </li>
    </ul>
    </form>
  </div>
</nav>

    <%--Navigation end--%>



<c:if test="${empty userobj}">
  <c:redirect url="../login.jsp"/>
</c:if>


<h3 class="text-center">Hello Admin</h3>

<%--<c:if test="${not empty succMsg}">
  <h5 class="text-center text-success">${succMsg}</h5>
  <c:remove var="succMsg" scope="session"/>
</c:if>

<c:if test="${not empty failedMsg}">
  <h5 class="text-center text-danger">${failedMsg}</h5>
  <c:remove var="failedMsg" scope="session"/>
</c:if>--%>

<div class="wrapper">



  <div class="main_content">
    <div class="header"></div>
    <div class="info">

      <!-- Show brands list load from table and show text box and button to add new brand -->
      <div>

        <%----%>

          <c:if test="${not empty succMsg}">
            <p class="text-center text-success">${succMsg}</p>
            <c:remove var="succMsg" scope="session"/>
          </c:if>

          <c:if test="${not empty failedMsg}">
            <p class="text-center text-danger">${failedMsg}</p>
            <c:remove var="failedMsg" scope="session"/>
          </c:if>

        <%----%>



        <!--Form to add new brand -->
        <form action="../insertBrand" method="post">
          <label for="brandName">Brand Name</label>
          <input type="text" id="brandName" name="brandName" placeholder="Enter new brand name here.." required maxlength="45" >

          <input type="submit" value="Add">
        </form>
        <!--End of Form to add new brand -->


        <!-- View Brands Table here -->
        <table id="brands">

          <tr>
            <th>ID</th>
            <th>Name</th>
            <th> </th>
          </tr>

          <c:forEach var = "brand" items="${brandList}">


            <c:set var="id" value="${brand.ID}"/>
            <c:set var="name" value="${brand.name}"/>


            <tr>
              <td>${id}</td>
              <td>${name}</td>
              <td> <a href="deleteBrand?id=${id} " class="btn btn-sm btn-dark text-warning" onclick="return confirm('Are you sure you want to delete the brand \'${brand.name}\' ?');" ><i class="fa-solid fa-trash-can"></i>  DELETE</a> </td>
            </tr>


          </c:forEach>

        </table>
        <!-- End of View Brands Table -->

      </div>
      <!-- Show brands list load from table and show text box and button to add new brand -->

    </div>
  </div>

</div>


<div style="margin-top: 260px;">
  <%@include file="footer.jsp"%>
</div>

</body>
</html>
