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
    <title>New order</title>
<body>
<%@ include file="header.jsp"%>
<h4 style="padding-left: 2em">Fill in the details for new order:</h4>
<form method="post" action="order-add">
    <div style="padding: 3em">
        <div class="form-group row">
            <label class="col-md-1">Car acceptance date:</label>
            <div class="col-md-2">
                <input type="date" class="form-control" name="acceptanceDate" required>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-1">Planned service start:</label>
            <div class="col-md-2">
                <input type="date" class="form-control" name="plannedServiceStartDate" required>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-1">Assigned employee:</label>
            <div class="col-md-2">
                <select class="form-control" name="employeeId" required>
                    <option value="" selected disabled>Please select</option>
                    <c:forEach items="${employees}" var="employee">
                        <option value="${employee.id}">${employee.firstName} ${employee.name} ${employee.hourCost}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-1">Vehicle:</label>
            <div class="col-md-2">
                <select class="form-control" name="vehicleId" required>
                    <option value="" selected disabled>Please select</option>
                    <c:forEach items="${vehicles}" var="vehicle">
                        <option value="${vehicle.id}">${vehicle.make} ${vehicle.model} ${vehicle.registration}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-1">Problem description:</label>
            <div class="col-md-4">
                <input type="text" class="form-control" name="problemDescription" required>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-1">Service cost:</label>
            <div class="col-md-1">
                <input type="number" step="0.01" class="form-control" name="serviceCost" required>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-1">Parts cost:</label>
            <div class="col-md-1">
                <input type="number" step="0.01" class="form-control" name="partsCost" required>
            </div>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </div>
</form>

<%@ include file="footer.jsp"%>
</body>
</html>

