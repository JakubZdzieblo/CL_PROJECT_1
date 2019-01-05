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
    <title>Order details</title>
</head>
<body>
<%@ include file="header.jsp"%>
<div style="padding: 2em">

    <h4>Order no. ${order.id} details:</h4>
    <br>
    <div class="row">
        <div class="col-lg-2" align="right">Car in date:</div>
        <div class="col-lg-2">${order.acceptanceDate}</div>
    </div>
    <div class="row">
        <div class="col-lg-2" align="right">Planned service start:</div>
        <div class="col-lg-2">${order.plannedServiceStartDate}</div>
    </div>
    <div class="row">
        <div class="col-lg-2" align="right">Actual service start:</div>
        <div class="col-lg-2">${order.actualServiceStartDate}</div>
    </div>
    <div class="row">
        <div class="col-lg-2" align="right">Completion date:</div>
        <div class="col-lg-2">${order.serviceEndDate}</div>
    </div>
    <div class="row">
        <div class="col-lg-2" align="right">Assigned employee:</div>
        <div class="col-lg-2">${employee.firstName} ${employee.name}</div>
    </div>
    <div class="row">
        <div class="col-lg-2" align="right">Problem description:</div>
        <div class="col-lg-3">${order.problemDescription}</div>
    </div>
    <div class="row">
        <div class="col-lg-2" align="right">Service description:</div>
        <div class="col-lg-3">${order.serviceDescription}</div>
    </div>
    <div class="row">
        <div class="col-lg-2" align="right">Current status:</div>
        <div class="col-lg-2">${order.status}</div>
    </div>
    <div class="row">
        <div class="col-lg-2" align="right">Vehicle:</div>
        <div class="col-lg-2">${vehicle.make} ${vehicle.model} ${vehicle.registration}</div>
    </div>
    <div class="row">
        <div class="col-lg-2" align="right">Owner:</div>
        <div class="col-lg-2">${customer.firstName} ${customer.name}</div>
    </div>
    <div class="row">
        <div class="col-lg-2" align="right">Service cost:</div>
        <div class="col-lg-2">${order.serviceCost}</div>
    </div>
    <div class="row">
        <div class="col-lg-2" align="right">Parts cost:</div>
        <div class="col-lg-2">${order.partsCost}</div>
    </div>
    <div class="row">
        <div class="col-lg-2" align="right">Service hours:</div>
        <div class="col-lg-2">${order.workHours}</div>
    </div>
    <div class="row">
        <div class="col-lg-2" align="right">Employee cost per hour:</div>
        <div class="col-lg-2">${employee.hourCost}</div>
    </div>
    <br><br>
    <p><a class="btn btn-info" href="orders">Back to orders list</a></p>
</div>
<%@ include file="footer.jsp"%>
</body>
</html>
