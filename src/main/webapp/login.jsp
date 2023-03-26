<%--
  Created by IntelliJ IDEA.
  User: viman
  Date: 2/20/2023
  Time: 2:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<html>
<head>
  <link rel="icon" href="logo.png" type="image/x-icon">
    <title>Bumble Bee Login</title>
  <%@include file="all_components/allCSS.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
<%@include file="all_components/navbar.jsp"%>

<div class="container p-4">
  <div class="row">
    <div class="col-md-4 offset-md-4">
      <div class="card">
        <div class="card-body">
          <h4 class="text-center">Login Page</h4>

          <c:if test="${not empty failedMsg}">
            <h5 class="text-center text-danger">${failedMsg}</h5>
            <c:remove var="failedMsg" scope="session"/>
          </c:if>

          <c:if test="${not empty succMsg}">
            <h5 class="text-center text-success">${succMsg}</h5>
            <c:remove var="succMsg" scope="session"/>
          </c:if>





          <form action="LoginServlet" method="post">
            <div class="form-group">
              <label for="exampleInputEmail1">Email address</label>
              <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email"
              required="required" name="email">
            </div>
            <div class="form-group">
              <label for="exampleInputPassword1">Password</label>
              <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password"
              required="required" name="password">
            </div>

            <div class="text-center">
              <button type="submit" class="btn  btn-dark text-warning">Login</button><br>
              <a href="register.jsp">Create Account</a>
            </div>
         </form>
        </div>
      </div>
    </div>
  </div>
</div><br><br><br><br><br>
<%@include file="all_components/footer.jsp"%>
</body>
</html>
