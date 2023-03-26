<%--
  Created by IntelliJ IDEA.
  User: viman
  Date: 2/21/2023
  Time: 2:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<html>
<head>
    <link rel="icon" href="logo.png" type="image/x-icon">
    <title>Add Products</title>
    <%@include file="allCSS.jsp"%>
</head>
<body style="background-color: #f0f2f2;">
<%@include file="navbar.jsp"%>

<c:if test="${empty userobj}">
    <c:redirect url="../login.jsp"/>
</c:if>

        <div class="container p-2">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">

                            <h4 class="text-center">Add Products</h4>

                            <c:if test="${not empty succMsg}">
                                <p class="text-center text-success">${succMsg}</p>
                                <c:remove var="succMsg" scope="session"/>
                            </c:if>

                            <c:if test="${not empty failedMsg}">
                                <p class="text-center text-danger">${failedMsg}</p>
                                <c:remove var="failedMsg" scope="session"/>
                            </c:if>



                            <form action="../ProductsAddServlet" method="post" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Product Name</label>
                                        <input  name="pname" type="text" class="form-control"
                                        id="exampleInputEmail1" aria-describedby="emailHelp">
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Product Brand</label>

                                        <select
                                                name="pbrand" class="form-control" id="inputbrand">
                                            <option selected>--- Select ---</option>
                                            <option value="Samsung">Samsung</option>
                                            <option value="Apple">Apple</option>
                                            <option value="HUAWEI">HUAWEI</option>
                                        </select>
                                    </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Price</label>
                                    <input  name="pprice" type="number" class="form-control"
                                            id="exampleInputEmail3" aria-describedby="emailHelp">
                                </div>

                                <div class="form-group">
                                   <label for="inputState">Product Category</label>
                                    <select
                                     name="pcategories" class="form-control" id="inputState">
                                        <option selected>--- Select ---</option>
                                        <option value="New">New</option>
                                        <option value="Old">Old</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="inputState1">Product States</label>
                                    <select
                                            name="pstatus" class="form-control" id="inputState1">
                                        <option selected>--- Select ---</option>
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="exampleFormControlFiled1">Upload Photo</label>
                                    <input name="pimg" type="file" class="form-control-file"
                                    id="exampleFormControlFiled1">
                                </div>

                                    <button type="submit" class="btn btn-primary">Add Product</button>


                            </form>

                        </div>
                    </div>
                </div>
            </div>

        </div>

<div style="margin-top: 260px;">
    <%@include file="footer.jsp"%>
</body>
</html>
