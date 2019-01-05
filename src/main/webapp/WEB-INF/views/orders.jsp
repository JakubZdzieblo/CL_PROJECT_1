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
    <title>Orders</title>
</head>
<body>
<%@ include file="header.jsp"%>
<div style="padding: 2em">
    <table class="table table-striped">
        <thead><h4>All orders:</h4>
        <tr>
            <th>Car in</th>
            <th>Service end</th>
            <th>Problem description</th>
            <th>Service description</th>
            <th>Status</th>
            <th>Employee id</th>
            <th>Vehicle id</th>
            <th>Details</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${orders}" var="order">
            <tr>
                <td>${order.acceptanceDate}</td>
                <td>${order.serviceEndDate}</td>
                <td>${order.problemDescription}</td>
                <td>${order.serviceDescription}</td>
                <td>${order.status}</td>
                <td>${order.employeeId}</td>
                <td>${order.vehicleId}</td>
                <td><a class="btn btn-primary btn-sm" href="order-details?id=${order.id}">Details</a></td>
                <td><a class="btn btn-warning btn-sm" href="order-edit?id=${order.id}">Edit</a></td>
                <td><a class="btn btn-danger btn-sm" href="order-delete?id=${order.id}">Delete</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <p><a class="btn btn-primary" href="order-add">Add new order</a></p>
</div>
<%@ include file="footer.jsp"%>
</body>
</html>
