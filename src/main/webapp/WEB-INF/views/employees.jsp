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
    <title>Employees</title>
</head>
<body>
<%@ include file="header.jsp"%>
<table class="table table-striped">
    <h4>Employees:</h4>
    <thead>
    <tr>
        <th>First Name</th>
        <th>Surname</th>
        <th>Address</th>
        <th>Phone</th>
        <th>Note</th>
        <th>Cost</th>
        <th></th>
        <th></th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${employees}" var="employee">
        <tr>
            <td>${employee.firstName}</td>
            <td>${employee.name}</td>
            <td>${employee.address}</td>
            <td>${employee.phone}</td>
            <td>${employee.note}</td>
            <td>${employee.hourCost}</td>
            <td><a class="btn btn-primary btn-sm" href="employee-orders?id=${employee.id}">Orders</a></td>
            <td><a class="btn btn-warning btn-sm" href="employee-edit?id=${employee.id}">Edit</a></td>
            <td><a class="btn btn-danger btn-sm" href="employee-delete?id=${employee.id}">Delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<p><a class="btn btn-primary" href="employee-add">Add new employee</a></p>
<%@ include file="footer.jsp"%>
</body>
</html>
