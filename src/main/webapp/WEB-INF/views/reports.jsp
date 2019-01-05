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
    <title>Reports</title>
</head>
<body>
<%@ include file="header.jsp"%>
<h4 style="padding-left: 2em">Choose report dates and type</h4>
<form method="post" action="reports">
    <div style="padding: 3em">
        <div class="form-group row">
            <label class="col-md-1">Start date:</label>
            <div class="col-md-2">
                <input type="date" class="form-control" name="startDate" required>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-1">End date:</label>
            <div class="col-md-2">
                <input type="date" class="form-control" name="endDate" required>
            </div>
        </div>
        <div class="form-group row">
            <input class="form-check-input" type="radio" name="report" value="workHoursReport">
            <label class="form-check-label">Working hours per employee</label>
        </div>
        <div class="form-group row">
            <input class="form-check-input" type="radio" name="report" value="profitReport">
            <label class="form-check-label">Profits from period
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </div>
</form>

<%@ include file="footer.jsp"%>
</body>
</html>
