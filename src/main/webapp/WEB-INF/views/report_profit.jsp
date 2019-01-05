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
    <title>Profit & Loss Report</title>
</head>
<body>
<%@ include file="header.jsp"%>
<div style="padding: 2em">
            <table class="table table-striped">
                <h4>Profit & loss between ${startDate} and ${endDate}</h4>
                <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Completion date</th>
                    <th>Service price</th>
                    <th>Parts cost</th>
                    <th>Work hours</th>
                    <th>Employee cost per hour</th>
                    <th>Profit</th>
                    <th>Balance</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${result}" var="row">
                    <tr>
                        <td>${row[0]}</td>
                        <td>${row[1]}</td>
                        <td>${row[2]}</td>
                        <td>${row[3]}</td>
                        <td>${row[4]}</td>
                        <td>${row[5]}</td>
                        <td>${row[6]}</td>
                        <td>${row[7]}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
</div>
<%@ include file="footer.jsp"%>
</body>
</html>


