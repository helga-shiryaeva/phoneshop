<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<template:page>
    <c:if test="${outOfStock ne null}">
        <div class="alert alert-danger">
            <strong><c:out value = "${outOfStock}"/></strong>
                <c:forEach var="phone" items="${rejectedPhones}">
                    <div class="row">
                    <div class="col">${phone.model}</div>
                    <div class="col">${phone.brand}</div>
                    </div>
                </c:forEach>
        </div>
    </c:if>
    <c:choose>
        <c:when test="${cart ne null and cart.items.size() ne 0 }">
            <div class="container">
                <div class="row">
                    <div class="col-md-auto">
                        <div class="display-4">Order</div>
                    </div>
                    <div class="col-md-auto">
                        <div class="container" style="padding-top: 10px">
                            <a href="<c:url value="/cart"/>">
                                <button class="btn btn-dark btn-lg">Back to Cart</button>
                            </a>
                        </div>
                    </div>
                </div>
                    <div class="container">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>Image</th>
                                <th>Brand</th>
                                <th>Model</th>
                                <th>Color</th>
                                <th>Display</th>
                                <th>Quantity</th>
                                <th>Price</th>
                            </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="orderItem" items="${cart.items}" varStatus="status">
                                    <tr>
                                        <c:set var="phone" value="${orderItem.phone}" />
                                        <td>
                                            <a href="<c:url value="/productDetails/${phone.id}"/>">
                                                <img src="https://raw.githubusercontent.com/andrewosipenko/phoneshop-ext-images/master/${phone.imageUrl}">
                                            </a>
                                        </td>
                                        <td>${phone.brand}</td>
                                        <td>${phone.model}</td>
                                        <td>
                                            <c:forEach var="color" items="${phone.colors}">
                                                <p><c:out value="${color.code}"/></p>
                                            </c:forEach>
                                        </td>
                                        <td>${phone.displaySizeInches}"</td>
                                        <td>${orderItem.quantity}</td>
                                        <td>${phone.price}$</td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><p class="lead">Subtotal</p></td>
                                    <td><p class="lead">${cart.cost}$</p></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><p class="lead">Delivery Price</p></td>
                                    <td><p class="lead">${cart.deliveryPrice}$</p></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><p class="lead">Total Price</p></td>
                                    <td><p class="lead">${total}$</p></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
            </div>
            <div class="jumbotron">
                <div class="lead">
                    <form:form method="post" modelAttribute="orderForm">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-group">
                                            <label for="firstName"><span>First Name</span></label>
                                            <form:input path="firstName" class="form-control"/>
                                            <form:errors cssClass="errors" cssStyle="color: red" path="firstName"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="lastName"><span>Last Name</span></label>
                                            <form:input path="lastName" class="form-control"/>
                                            <form:errors cssClass="errors" cssStyle="color: red" path="lastName"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="additionalInfo"><span>Additional Information</span></label>
                                            <form:input path="additionalInfo" class="form-control"/>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group">
                                            <label for="contactPhoneNo"><span>Contact Phone Number</span></label>
                                            <form:input path="contactPhoneNo" class="form-control"/>
                                            <form:errors cssClass="errors" cssStyle="color: red" path="contactPhoneNo"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="deliveryAddress"><span>Delivery Address</span></label>
                                            <form:input path="deliveryAddress" class="form-control"/>
                                            <form:errors cssClass="errors" cssStyle="color: red" path="deliveryAddress"/>
                                        </div>
                                        <div class="form-group" style="padding-top: 27px">
                                            <button type="submit" class="btn btn-success btn-lg">Order</button>
                                        </div>
                                    </div>
                                </div>
                            </form:form>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="container">
                <div class="jumbotron">
                    <p class="lead">Your cart is empty, click here to shop for phones</p>
                    <a href="<c:url value="/productList"/>">
                        <p class="lead">Go to main page</p>
                    </a>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
</template:page>
