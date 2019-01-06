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
    <title>Orders By Customer</title>
</head>
<body>
<%@ include file="header.jsp"%>
<div style="padding: 2em">
    <table class="table table-striped">
        <thead><h4>Orders by ${customer.firstName} ${customer.name}:</h4>
        <tr>
            <th>Car in</th>
            <th>Service start</th>
            <th>Problem description</th>
            <th>Service description</th>
            <th>Status</th>
            <th>Vehicle</th>
            <th>Cost</th>
            <th>Parts</th>
            <th>Hours</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${orders}" var="order">
            <tr>
                <td>${order.acceptanceDate}</td>
                <td>${order.actualServiceStartDate}</td>
                <td>${order.problemDescription}</td>
                <td>${order.serviceDescription}</td>
                <td>${order.status}</td>
                <%--<td>${order.vehicleId}</td>--%>
                <td><c:forEach items="${vehicles}" var="vehicle">
                    <c:if test="${vehicle.id == order.vehicleId}">
                        ${vehicle.make} ${vehicle.model}
                    </c:if>
                </c:forEach></td>
                <td>${order.serviceCost}</td>
                <td>${order.partsCost}</td>
                <td>${order.workHours}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a class="btn btn-info" href="customers">Customers list</a>
    <a class="btn btn-info" href="index">Home page</a>
</div>

<%@ include file="footer.jsp"%>
</body>
</html>
