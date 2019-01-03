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
    <title>Edit customer</title>
</head>
<body>
<%@ include file="header.jsp"%>
<h4 style="padding-left: 2em">Fill in the details for the customer:</h4>
<form method="post" action="customer-edit">
    <div style="padding: 3em">
        <div class="form-group row">
            <label class="col-md-1">First Name</label>
            <div class="col-md-4">
                <input type="text" class="form-control" name="firstName" value="${customer.firstName}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-1">Surname</label>
            <div class="col-md-4">
                <input type="text" class="form-control" name="name" value="${customer.name}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-1">Birth date</label>
            <div class="col-md-4">
                <input type="date" class="form-control" name="birthdate"  value="${customer.birthdate}">
            </div>
        </div>
        <input type="hidden" name="id" value="${customer.id}">
        <button type="submit" class="btn btn-primary">Submit</button>
    </div>
</form>

<%@ include file="footer.jsp"%>
</body>
</html>
