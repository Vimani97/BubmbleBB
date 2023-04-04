<%--
  Created by IntelliJ IDEA.
  User: viman
  Date: 2/28/2023
  Time: 10:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <link rel="icon" href="logo.png" type="image/x-icon">
    <title>Sell Products</title>
  <%@include file="all_components/allCSS.jsp"%>
</head>
<body style="background-color: #f0f1f2;">

  <c:if test="${empty userobj}">
      <c:redirect url="login.jsp"/>
  </c:if>
<%@include file="all_components/navbar.jsp"%>

        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">

                            <h5 class="text-center text-primary p-1">Sell Products</h5>

                            <c:if test="${not empty succMsg}">
                                <p class="text-center text-success">${succMsg}</p>
                                <c:remove var="succMsg" scope="session"/>
                            </c:if>

                            <c:if test="${not empty failedMsg}">
                                <p class="text-center text-danger">${failedMsg}</p>
                                <c:remove var="failedMsg" scope="session"/>
                            </c:if>


                            <form action="AddOldProductsServlet" method="post" enctype="multipart/form-data">



                                <input type="hidden" value="${userobj.email}" name="user">

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
                                    <label for="exampleFormControlFiled1">Upload Photo</label>
                                    <input name="pimg" type="file" class="form-control-file"
                                           id="exampleFormControlFiled1">
                                </div>

                                <button type="submit" class="btn btn-warning">Sell</button>


                            </form>


                        </div>
                    </div>
                </div>
            </div>
        </div>

<%@include file="all_components/footer.jsp"%>
</body>
</html>
