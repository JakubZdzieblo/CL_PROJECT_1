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
    <title>Remove vehicle</title>
</head>
<body>
<%@ include file="header.jsp"%>

<form method="post" action="vehicle-delete">
    <div style="padding: 3em">
        <c:choose>
            <c:when test="${empty orders}">
                <p>Please confirm deletion of ${vehicle.make} ${vehicle.model} ${vehicle.registration}</p>
                <input type="hidden" name="id" value="${vehicle.id}">
                <button type="submit" class="btn btn-danger">Delete</button><br><br>
            </c:when>
            <c:otherwise>
                <p>This vehicle has following orders in the database:</p>
                <ul>
                    <c:forEach items="${orders}" var="order">
                        <li>No. ${order.id} from ${order.acceptanceDate}: ${order.problemDescription}</li>
                    </c:forEach>
                </ul>
                <p>Please remove the order(s) first.</p>
            </c:otherwise>
        </c:choose>
        <p><a class="btn btn-info" href="vehicles">Back to vehicles list</a></p>

    </div>
</form>

<%@ include file="footer.jsp"%>
</body>
</html>
