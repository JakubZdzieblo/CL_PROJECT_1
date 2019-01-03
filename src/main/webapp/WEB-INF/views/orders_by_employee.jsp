<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../../bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="../../bootstrap/css/bootstrap-theme.css" rel="stylesheet">
    <title>Orders By Employee</title>
</head>
<body>
<%@ include file="header.jsp"%>
<table class="table table-striped">
    <thead><h4>Orders by employee ${employee.firstName} ${employee.name}:</h4>
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
            <td>${order.vehicleId}</td>
            <td>${order.serviceCost}</td>
            <td>${order.partsCost}</td>
            <td>${order.workHours}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>


<%@ include file="footer.jsp"%>
</body>
</html>
