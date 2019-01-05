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
    <title>New vehicle</title>
<body>
<%@ include file="header.jsp"%>
<h4 style="padding-left: 2em">Fill in the details for new vehicle:</h4>
<form method="post" action="vehicle-add">
    <div style="padding: 3em">
        <div class="form-group row">
            <label class="col-md-1">Make:</label>
            <div class="col-md-4">
                <input type="text" class="form-control" name="make" required>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-1">Model:</label>
            <div class="col-md-4">
                <input type="text" class="form-control" name="model" required>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-1">Year:</label>
            <div class="col-md-4">
                <input type="number" class="form-control" name="year" required>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-1">Registration number:</label>
            <div class="col-md-4">
                <input type="text" class="form-control" name="registration" required>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-1">Next inspection date:</label>
            <div class="col-md-4">
                <input type="date" class="form-control" name="nextInspection" required>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-1">Owner:</label>
            <div class="col-md-4">
                <select class="form-control" name="customer_id">
                    <option value="" selected disabled>Please select</option>
                <c:forEach items="${customers}" var="customer">
                    <option value="${customer.id}">${customer.firstName} ${customer.name}</option>
                </c:forEach>
                </select>
            </div>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </div>
</form>

<%@ include file="footer.jsp"%>
</body>
</html>

