<%@ page import="com.example.bubmblebb.entity.Cart" %>
<%@ page import="com.example.bubmblebb.DAO.CartDAOImpl" %>
<%@ page import="com.example.bubmblebb.DB.DBConnection" %>
<%@ page import="com.example.bubmblebb.entity.User" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: viman
  Date: 2/27/2023
  Time: 11:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <link rel="icon" href="logo.png" type="image/x-icon">
    <title>Cart Page</title>
  <%@include file="all_components/allCSS.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
<%@include file="all_components/navbar.jsp"%>

        <c:if test="${empty userobj}">
            <c:redirect url="login.jsp">
            </c:redirect>
        </c:if>

        <c:if test="${not empty succMsg}">
            <div class="alert alert-success" role="alert">
                ${succMsg}
            </div>
            <c:remove var="succMsg" scope="session"/>
        </c:if>

        <c:if test="${not empty failedMsg}">
            <div class="alert alert-danger text-center" role="alert">
                ${failedMsg}
            </div>
            <c:remove var="failedMsg" scope="session"/>
        </c:if>

          <div class="container">
            <div class="row p-2">
              <div class="col-md-6">
                  <div class="card bg-white">

                      <div class="card-body">
                          <h3 class="text-center text-success">Your Selected Product</h3>
                          <table class="table table-striped">
                              <thead>
                              <tr>
                                  <th scope="col">Product Name</th>
                                  <th scope="col">Brand Name</th>
                                  <th scope="col">Price</th>
                                  <th scope="col">Action</th>
                              </tr>
                              </thead>
                              <tbody>

                              <%

                                 User u = (User) session.getAttribute("userobj");
                                  CartDAOImpl dao = new CartDAOImpl(DBConnection.getConn());
                                  List<Cart> cart = dao.getProductByUser(u.getId());
                                  Double totalPrice = 0.00;

                                  for (Cart c : cart) {
                                      totalPrice=c.getTotalPrice();

                              %>
                              <tr>
                                  <th scope="row"><%=c.getProductName()%></th>
                                  <td><%=c.getProductBrand()%></td>
                                  <td><%=c.getPrice()%></td>
                                  <td>
                                     <a href="RemoveProductsServlet?bid=<%=c.getPid()%>&&uid=<%=c.getUserId()%>&&cid=<%=c.getCid()%>"
                                        class="btn btn-sm btn-danger">Remove</a>
                                  </td>
                              </tr>
                                  <%
                                  }
                              %>

                              <tr>
                                  <td>Total Price</td>
                                  <td></td>
                                  <td></td>
                                  <td><%=totalPrice%></td>
                              </tr>
                              </tbody>
                          </table>
                      </div>
                  </div>
              </div>

                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center text-success">Your Details for Order</h3>

                            <form action="OrderServlet" method="post">
                            <input type="hidden" value="${userobj.id}" name="id">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputName4">Name</label>
                                        <input type="text" class="form-control" id="inputName4" value="${userobj.name}" required
                                        name="username">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Email</label>
                                        <input type="email" class="form-control" id="inputEmail4" value="${userobj.email}" required
                                        name="email">
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword5">Phone Number</label>
                                        <input type="number" class="form-control" id="inputEmail5" value="${userobj.phone}" required
                                        name="phone">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword5">Address</label>
                                        <input type="text" class="form-control" id="inputPassword5" value="" required
                                        name="address">
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail6">City</label>
                                        <input type="text" class="form-control" id="inputEmail6" required
                                        name="city">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">State</label>
                                        <input type="text" class="form-control" id="inputPassword4" required
                                        name="state">
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail7">Zip</label>
                                        <input type="number" class="form-control" id="inputEmail7" value="" required
                                        name="zip">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label>Payment Method</label>
                                    <select class="form-control" name="payment">
                                        <option value="noSelect">--Select--</option>
                                        <option value="COD">Cash on Delivery</option>
                                    </select>
                                </div>

                                <div class="text-center">
                                    <button class="btn btn-warning">Order</button>
                                    <a href="index.jsp" class="btn btn-success">Continue Shopping</a>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>

            </div>
          </div>
</body>
</html>
