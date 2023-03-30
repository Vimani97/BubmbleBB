<%--
  Created by IntelliJ IDEA.
  User: viman
  Date: 2/28/2023
  Time: 11:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<html>
<head>
  <link rel="icon" href="logo.png" type="image/x-icon">
    <title>Edit Profile</title>
  <%@include file="all_components/allCSS.jsp"%>
</head>
<body style="background-color: #f0f1f2">
<%@include file="all_components/navbar.jsp"%>

          <div class="container">
            <div class="row">
              <div class="col-md-4 offset-md-4">
                <div class="card">
                  <div class="card-body">
                    <h5 class="text-center text-primary p-1">Edit Profile</h5>

                    <c:if test="${not empty failedMsg}">
                      <h5 class="text-center text-danger">${failedMsg}</h5>
                      <c:remove var="failedMsg" scope="session"/>
                    </c:if>

                    <c:if test="${not empty succMsg}">
                      <h5 class="text-center text-success">${succMsg}</h5>
                      <c:remove var="succMsg" scope="session"/>
                    </c:if>



                    <form action="UpdateProfileServlet" method="post">
                        <input type="hidden" value="${userobj.id}" name="id">
                      <div class="form-group">
                        <label for="exampleInputEmail1">Enter Full Name</label>
                        <input type="text" class="form-control" id="exampleInputName1"
                               aria-describedby="emailHelp"
                               required="required" name="fname" value="${userobj.name}">
                      </div>
                      <div class="form-group">
                        <label for="exampleInputEmail1">Email address</label>
                        <input type="email" class="form-control" id="exampleInputEmail1"
                               aria-describedby="emailHelp"
                               required="required" name="uemail" value="${userobj.email}">
                      </div>
                      <div class="form-group">
                        <label for="exampleInputEmail1">NIC Number</label>
                        <input type="text" class="form-control" id="exampleInputNICNumber1"
                               aria-describedby="emailHelp"
                               required="required" name="unic" value="${userobj.nic}">
                      </div>

                      <div class="form-group">
                        <label for="exampleInputEmail1">Date of Birth</label>
                        <input type="text" class="form-control" id="exampleInputDOB1"
                               aria-describedby="emailHelp"
                               required="required" name="udob" value="${userobj.dob}">
                      </div>
                      <div class="form-group">
                        <label for="exampleInputEmail1">Phone Number</label>
                        <input type="text" class="form-control" id="exampleInputPhone1"
                               aria-describedby="emailHelp"
                               required="required" name="uphone" value="${userobj.phone}">
                      </div>
                      <div class="form-group">
                        <label for="exampleInputPassword1">Password</label>
                        <input type="password" class="form-control" id="exampleInputPassword1"
                               required="required" name="upass">
                      </div>

                      <button type="submit" class="btn btn-warning">Update</button>
                    </form>

                  </div>
                </div>
              </div>
            </div>
          </div>
</body>
</html>
