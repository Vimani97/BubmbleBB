<%--
  Created by IntelliJ IDEA.
  User: viman
  Date: 2/20/2023
  Time: 1:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <link rel="icon" href="logo.png" type="image/x-icon">
    <title>Bumble Bee: Registration</title>
    <%@include file="all_components/allCSS.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
<%@include file="all_components/navbar.jsp"%>

<div class="container p-2">
    <div class="row">
       <div class="col-md-4 offset-md-4">
        <div class="card">
            <div class="card-body">

                <h4 class="text-center">Registration Page</h4>

                <c:if test="${not empty succMsg}">
                    <p class="text-center text-success">${succMsg}</p>
                    <c:remove var="succMsg" scope="session"/>
                </c:if>

                <c:if test="${not empty failedMsg}">
                    <p class="text-center text-danger">${failedMsg}</p>
                    <c:remove var="failedMsg" scope="session"/>
                </c:if>


                <form action="RegisterServlet" method="post">

                    <div class="form-group">
                        <label for="exampleInputEmail1">Enter Full Name*</label>
                        <input type="text" class="form-control" id="exampleInputName1"
                               aria-describedby="emailHelp"
                               required="required" name="fname">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Email address*</label>
                        <input type="email" class="form-control" id="exampleInputEmail1"
                               aria-describedby="emailHelp"
                               required="required" name="uemail">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">NIC Number</label>
                        <input type="text" class="form-control" id="exampleInputNICNumber1"
                               aria-describedby="emailHelp" placeholder="Enter NIC Number"
                               required="required" name="unic">
                    </div>

                    <div class="form-group">
                        <label for="exampleInputEmail1">Date of Birth*</label>
                        <input type="text" class="form-control" id="exampleInputDOB1"
                               aria-describedby="emailHelp"
                               required="required" name="udob">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Phone Number*</label>
                        <input type="text" class="form-control" id="exampleInputPhone1"
                               aria-describedby="emailHelp"
                               required="required" name="uphone">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Password*</label>
                        <input type="password" class="form-control" id="exampleInputPassword1"
                               required="required" name="upass">
                    </div>
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="exampleCheck1" name="check">
                        <label class="form-check-label" for="exampleCheck1">Are you over 18 years old?</label>
                    </div>
                    <button type="submit" class="btn btn-dark text-warning">Submit</button>
                </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="all_components/footer.jsp"%>
</body>
</html>
