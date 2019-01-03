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
    <title>Remove employee</title>
</head>
<body>
<%@ include file="header.jsp"%>

<form method="post" action="employee-delete">
    <div style="padding: 3em">
        <p>Please confirm deletion of employee ${employee.firstName} ${employee.name}</p>
        <input type="hidden" name="id" value="${employee.id}">
        <button type="submit" class="btn btn-danger">Delete</button><br><br>
        <p><a class="btn btn-info" href="employees">Back to employee list</a></p>
    </div>
</form>

<%@ include file="footer.jsp"%>
</body>
</html>
