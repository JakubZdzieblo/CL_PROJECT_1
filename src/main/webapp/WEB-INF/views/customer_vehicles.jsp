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
    <title>Customer's Vehicles</title>
</head>
<body>
<%@ include file="header.jsp"%>
<div style="padding: 2em">
    <table class="table table-striped">
        <thead><h4>Vehicles owned by ${customer.firstName} ${customer.name}:</h4>
        <tr>
            <th>Make</th>
            <th>Model</th>
            <th>Year</th>
            <th>Reg Number</th>
            <th>Next Inspection</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${vehicles}" var="vehicle">
            <tr>
                <td>${vehicle.make}</td>
                <td>${vehicle.model}</td>
                <td>${vehicle.year}</td>
                <td>${vehicle.registration}</td>
                <td>${vehicle.nextInspection}</td>
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
