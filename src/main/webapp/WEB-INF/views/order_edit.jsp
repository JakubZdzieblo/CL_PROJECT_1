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
    <title>Edit order</title>
<body>
<%@ include file="header.jsp"%>
<h4 style="padding-left: 2em">Update the details for order no. ${order.id}:</h4>
<form method="post" action="order-edit">
    <div style="padding: 3em">
        <div class="form-group row">
            <label class="col-md-1">Car acceptance date:</label>
            <div class="col-md-2">
                <input type="date" class="form-control" name="acceptanceDate" value="${order.acceptanceDate}" required>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-1">Planned service start:</label>
            <div class="col-md-2">
                <input type="date" class="form-control" name="plannedServiceStartDate" value="${order.plannedServiceStartDate}" required>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-1">Actual service start date:</label>
            <div class="col-md-2">
                <input type="date" class="form-control" name="actualServiceStartDate" value="${order.actualServiceStartDate}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-1">Service end date:</label>
            <div class="col-md-2">
                <input type="date" class="form-control" name="serviceEndDate" value="${order.serviceEndDate}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-1">Assigned employee:</label>
            <div class="col-md-2">
                <select class="form-control" name="employeeId" required>
                    <c:forEach items="${employees}" var="employee">
                        <c:choose>
                            <c:when test="${employee.id == order.employeeId}">
                                <option selected="selected" value="${employee.id}">${employee.firstName} ${employee.name} ${employee.hourCost}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${employee.id}">${employee.firstName} ${employee.name} ${employee.hourCost}</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                  </select>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-1">Vehicle:</label>
            <div class="col-md-2">
                <select class="form-control" name="vehicleId" required>
                    <c:forEach items="${vehicles}" var="vehicle">
                        <c:choose>
                            <c:when test="${vehicle.id == order.vehicleId}">
                                <option selected="selected" value="${vehicle.id}">${vehicle.make} ${vehicle.model} ${vehicle.registration}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${vehicle.id}">${vehicle.make} ${vehicle.model} ${vehicle.registration}</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-1">Problem description:</label>
            <div class="col-md-4">
                <input type="text" class="form-control" name="problemDescription" value="${order.problemDescription}" required>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-1">Service description:</label>
            <div class="col-md-4">
                <input type="text" class="form-control" name="serviceDescription" value="${order.serviceDescription}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-1">Status:</label>
            <div class="col-md-2">
                <select class="form-control" name="status" required>
                <c:forEach items="${statuses}" var="status">
                    <c:choose>
                        <c:when test="${status == order.status}">
                            <option selected="selected" value="${status}">${status}</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${status}">${status}</option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                </select>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-1">Service cost:</label>
            <div class="col-md-1">
                <input type="number" step="0.01" class="form-control" name="serviceCost" value="${order.serviceCost}" required>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-1">Parts cost:</label>
            <div class="col-md-1">
                <input type="number" step="0.01" class="form-control" name="partsCost" value="${order.partsCost}" required>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-1">Work hours:</label>
            <div class="col-md-1">
                <input type="number" step="0.01" class="form-control" name="workHours" value="${order.workHours}" >
            </div>
        </div>
        <input type="hidden" name="id" value="${order.id}">
        <button type="submit" class="btn btn-primary">Submit</button>
    </div>
</form>

<%@ include file="footer.jsp"%>
</body>
</html>

