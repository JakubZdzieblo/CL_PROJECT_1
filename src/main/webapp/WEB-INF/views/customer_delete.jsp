<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="/bootstrap/css/bootstrap-theme.css" rel="stylesheet">
    <title>Remove customer</title>
</head>
<body>
<%@ include file="header.jsp"%>

<form method="post" action="customer-delete">
    <div style="padding: 3em">
            <c:choose>
                <c:when test="${empty vehicles}">
                    <p>Please confirm deletion of employee ${customer.firstName} ${customer.name}</p>
                    <input type="hidden" name="id" value="${customer.id}">
                    <button type="submit" class="btn btn-danger">Delete</button><br><br>
                </c:when>
                <c:otherwise>
                    <p>This customer owns following vehicles in the database:</p>
                    <ul>
                    <c:forEach items="${vehicles}" var="vehicle">
                        <li>${vehicle.make} ${vehicle.model} ${vehicle.registration}</li>
                    </c:forEach>
                    </ul>
                    <p>Please remove the vehicle(s) first.</p>
                </c:otherwise>
            </c:choose>

        <p><a class="btn btn-info" href="customers">Back to customers list</a></p>
    </div>
</form>

<%@ include file="footer.jsp"%>
</body>
</html>
