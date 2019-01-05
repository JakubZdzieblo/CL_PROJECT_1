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
    <title>Edit vehicle</title>
<body>
<%@ include file="header.jsp"%>
<h4 style="padding-left: 2em">Update the vehicle details:</h4>
<form method="post" action="vehicle-edit">
    <div style="padding: 3em">
        <div class="form-group row">
            <label class="col-md-1">Make:</label>
            <div class="col-md-4">
                <input type="text" class="form-control" name="make" value="${vehicle.make}" required>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-1">Model:</label>
            <div class="col-md-4">
                <input type="text" class="form-control" name="model" value="${vehicle.model}" required>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-1">Year:</label>
            <div class="col-md-4">
                <input type="number" class="form-control" name="year" value="${vehicle.year}" required>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-1">Registration number:</label>
            <div class="col-md-4">
                <input type="text" class="form-control" name="registration" value="${vehicle.registration}" required>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-1">Next inspection date:</label>
            <div class="col-md-4">
                <input type="date" class="form-control" name="nextInspection" value="${vehicle.nextInspection}" required>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-1">Owner:</label>
            <div class="col-md-4">
                <select class="form-control" name="customer_id">
                    <c:forEach items="${customers}" var="customer">
                        <c:choose>
                            <c:when test="${customer.id == vehicle.customer_id}">
                                <option selected="selected" value="${customer.id}">${customer.firstName} ${customer.name}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${customer.id}">${customer.firstName} ${customer.name}</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>
            </div>
        </div>
        <input type="hidden" name="id" value="${vehicle.id}">
        <button type="submit" class="btn btn-primary">Submit</button>
    </div>
</form>

<%@ include file="footer.jsp"%>
</body>
</html>

