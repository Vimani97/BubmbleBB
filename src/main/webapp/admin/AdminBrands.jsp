<%--
  Created by IntelliJ IDEA.
  User: viman
  Date: 3/26/2023
  Time: 12:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<%@include file="navbar.jsp"%>

<div class="wrapper">



  <div class="main_content">
    <div class="header">Brands</div>
    <div class="info">

      <!-- Show brands list load from table and show text box and button to add new brand -->
      <div>


        <!--Form to add new brand -->
        <form action="insertBrand" method="post">
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
              <td> <a href="deleteBrand?id=${id}" onclick="return confirm('Are you sure you want to delete the brand \'${brand.name}\' ?');" ><img src="img/delete.png" height="16" alt="Delete"></a> </td>
            </tr>


          </c:forEach>

        </table>
        <!-- End of View Brands Table -->

      </div>
      <!-- Show brands list load from table and show text box and button to add new brand -->

    </div>
  </div>

</div>




</body>
</html>
