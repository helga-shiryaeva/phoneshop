<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tag body-content="scriptless" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<jsp:useBean id="cart" scope="session" class="com.es.core.cart.Cart" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>
<div class="row">
    <div class="container">
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <div class="container">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand mr-5" href="<c:url value="/productList"/>">Phonify</a>
                <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="<c:url value="/cart"/>"><c:out value="My Cart : "/>
                                <span id="itemsCount">${not empty sessionScope.get("scopedTarget.cart").itemsCount ?
                                        sessionScope.get("scopedTarget.cart").itemsCount : '0'} </span>
                                <c:out value=" items, "/>
                                <span id="cartCost">${not empty sessionScope.get("scopedTarget.cart").cost ?
                                        sessionScope.get("scopedTarget.cart").cost : '0'}</span>
                                <c:out value="$"/>
                            </a>
                        </li>
                    </ul>
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                                <c:choose>
                                    <c:when test="${pageContext.request.userPrincipal.name != null}">
                                    <a class="nav-link"  href="<c:url value="/security_logout" />">
                                        <u>Logout</u>
                                    </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="nav-link" href="<c:url value="/login"/>">
                                            <u>Login</u>
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                        </li>
                        <li class="nav-item">
                            <form class="form-inline my-2 my-lg-0" action="<c:url value="/productList"/>">
                                <input class="form-control mr-sm-2"  placeholder="Search..." aria-label="Search" name="query">
                                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                            </form>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <jsp:doBody/>
    </div>
</div>
</body>
</html>