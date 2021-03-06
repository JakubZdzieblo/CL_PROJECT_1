<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.css" rel="stylesheet">
    <title>Index</title>
</head>
<body>
<%@ include file="header.jsp"%>
<div style="padding: 2em">
<table class="table table-striped">
    <thead><h4>Current service jobs:</h4>
    <tr>
        <th>Car in</th>
        <th>Service start</th>
        <th>Problem description</th>
        <th>Service description</th>
        <th>Status</th>
        <th>Employee</th>
        <th>Vehicle</th>
        <th>Cost</th>
        <th>Parts</th>
        <th>Hours</th>
        <th>Details</th>
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
            <td>${order.employeeId}</td>
            <td>${order.vehicleId}</td>
            <td>${order.serviceCost}</td>
            <td>${order.partsCost}</td>
            <td>${order.workHours}</td>
            <td><a class="btn btn-primary btn-sm" href="order-details?id=${order.id}">Details</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>

<%@ include file="footer.jsp"%>
</body>
</html>
