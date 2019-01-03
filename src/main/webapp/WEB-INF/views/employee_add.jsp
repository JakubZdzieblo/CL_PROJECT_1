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
    <title>New employee</title>
</head>
<body>
<%@ include file="header.jsp"%>
<h4 style="padding-left: 2em">Fill in the details for new employee:</h4>
<form method="post" action="employee-add">
    <div style="padding: 3em">
        <div class="form-group row">
            <label class="col-md-1">First Name</label>
            <div class="col-md-4">
                <input type="text" class="form-control" name="firstName">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-1">Surname</label>
            <div class="col-md-4">
                <input type="text" class="form-control" name="name">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-1">Address</label>
            <div class="col-md-4">
                <input type="text" class="form-control" name="address">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-1">Phone</label>
            <div class="col-md-4">
                <input type="text" class="form-control" name="phone">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-1">Note</label>
            <div class="col-md-4">
                <input type="text" class="form-control" name="note">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-1">Hour rate</label>
            <div class="col-md-4">
                <input type="number" step="0.01" class="form-control" name="hourCost">
            </div>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </div>
</form>

<%@ include file="footer.jsp"%>
</body>
</html>
