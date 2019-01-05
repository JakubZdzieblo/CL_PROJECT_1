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
    <title>Vehicles</title>
</head>
<body>
<%@ include file="header.jsp"%>
<div style="padding: 2em">
    <table class="table table-striped">
        <h4>Vehicles:</h4>
        <thead>
        <tr>
            <th>make</th>
            <th>model</th>
            <th>year</th>
            <th>registration</th>
            <th>details</th>
            <th>edit</th>
            <th>delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${vehicles}" var="vehicle">
            <tr>
                <td>${vehicle.make}</td>
                <td>${vehicle.model}</td>
                <td>${vehicle.year}</td>
                <td>${vehicle.registration}</td>
                <td><a class="btn btn-primary btn-sm" href="vehicle-details?id=${vehicle.id}">Details</a></td>
                <td><a class="btn btn-warning btn-sm" href="vehicle-edit?id=${vehicle.id}">Edit</a></td>
                <td><a class="btn btn-danger btn-sm" href="vehicle-delete?id=${vehicle.id}">Delete</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <p><a class="btn btn-primary" href="vehicle-add">Add new vehicle</a></p>
</div>
<%@ include file="footer.jsp"%>
</body>
</html>
