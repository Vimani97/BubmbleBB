<%--
  Created by IntelliJ IDEA.
  User: viman
  Date: 2/28/2023
  Time: 11:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" href="logo.png" type="image/x-icon">
    <title> EditUser Address</title>
    <%@include file="all_components/allCSS.jsp"%>
</head>
<body style="background-color: #f0f1f2">
<%@include file="all_components/navbar.jsp"%>

            <div class="container">
                <div class="row p-5">
                    <div class="col-md-6 offset-md-3">
                        <div class="card">
                            <div class="card-body">

                                <h3 class="text-center text-primary p-1">Add your Address</h3>
                                <form action="" method="">

                                    <div class="form-row">

                                        <div class="form-group col-md-6">
                                            <label for="inputPassword5">Address</label>
                                            <input type="text" class="form-control" id="inputPassword5" value="">
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label for="inputPassword6">City</label>
                                            <input type="text" class="form-control" id="inputPassword6" value="">
                                        </div>
                                    </div>

                                    <div class="form-row">

                                        <div class="form-group col-md-6">
                                            <label for="inputPassword4">State</label>
                                            <input type="text" class="form-control" id="inputPassword4" value="">
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label for="inputPassword7">Zip</label>
                                            <input type="email" class="form-control" id="inputPassword7" value="">
                                        </div>
                                    </div>

                                    <div class="text-center">
                                        <button class="btn btn-warning text-white">Add Address</button>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


</body>
</html>
