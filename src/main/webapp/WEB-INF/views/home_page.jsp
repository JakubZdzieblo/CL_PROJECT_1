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

    <title>Home Page</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-8">.col-lg-8</div>
        <div class="col-lg-4">.col-lg-4</div>
    </div>
    <div class="row">
        <div class="col-lg-4">.col-lg-4</div>
        <div class="col-lg-4">.col-lg-4</div>
        <div class="col-lg-4">.col-lg-4</div>
    </div>
    <div class="row">
        <div class="col-lg-6">.col-lg-6</div>
        <div class="col-lg-6">.col-lg-6</div>
    </div>
</div>
<h1>h1, Nagłówek H1 <small>Dopisek</small></h1>
<h2>h2, Nagłówek H2 <small>Dopisek</small></h2>
<h3>h3, Nagłówek H3 <small>Dopisek</small></h3>
<p class="text-left">Tekst wyrównany do lewej.</p>
<p class="text-center">Tekst wyrównany do środka.</p>
<p class="text-right">Tekst wyrównany do prawej</p>
<p class="text-justify">Tekst wyjustowany</p>
<p>Tutaj znajduje sie tekst na którego końcu jest
    <abbr title="Rozwinięcie skrótu">Skrót</abbr></p>
<address>
    <strong>Kursbootstrap.pl</strong><br>
    Ulica Sezamkowa 7<br>
    Internet, Polska<br>
    <abbr title="Telefon">Tel:</abbr> (123) 456-7890
</address>

<table class="table table-striped">
    <thead>
    <tr>
        <th>ID</th>
        <th>First Name</th>
        <th>Surname</th>
        <th>Birth Date</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${customers}" var="customer">
    <tr>
        <td>${customer.id}</td>
        <td>${customer.firstName}</td>
        <td>${customer.name}</td>
        <td>${customer.birthdate}</td>
    </tr>
    </c:forEach>
    </tbody>
</table>



</body>
</html>
