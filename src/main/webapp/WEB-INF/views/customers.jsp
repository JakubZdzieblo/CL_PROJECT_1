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
    <title>Customers</title>
</head>
<body>
<%@ include file="header.jsp"%>
<div style="padding: 2em">
    <table class="table table-striped">
        <h4>Customers:</h4>
        <thead>
        <tr>
            <th>First Name</th>
            <th>Surname</th>
            <th>Birth Date</th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${customers}" var="customer">
            <tr>
                <td>${customer.firstName}</td>
                <td>${customer.name}</td>
                <td>${customer.birthdate}</td>
                <td><a class="btn btn-primary btn-sm" href="customer-orders?id=${customer.id}">Orders</a></td>
                <td><a class="btn btn-primary btn-sm" href="customer-vehicles?id=${customer.id}">Vehicles</a></td>
                <td><a class="btn btn-warning btn-sm" href="customer-edit?id=${customer.id}">Edit</a></td>
                <td><a class="btn btn-danger btn-sm" href="customer-delete?id=${customer.id}">Delete</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <p><a class="btn btn-primary" href="customer-add">Add new customer</a></p>
</div>
<%@ include file="footer.jsp"%>
</body>
</html>
