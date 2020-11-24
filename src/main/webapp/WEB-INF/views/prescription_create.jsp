<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Momen
  Date: 11/19/2020
  Time: 11:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">

    <link rel="stylesheet" href="../static/bootstrap/css/bootstrap.min.css" crossorigin="anonymous" type="text/css">
    <title>Create Prescription</title>
</head>
<body>
<div class="container">
    <h1>Create New Prescription</h1>
    <form:form method="post" action="../create" modelAttribute="prescription">
        <form:label path="code">
            Prescription code:*
        </form:label>
        <form:input path="code"/>
        <br/>
        <form:label path="emissionDate">
            Prescription emissionDate:*
        </form:label>
        <form:input path="emissionDate"/>
        <br/>
        <form:label path="patientReferralDate">
            Prescription patientReferralDate:*
        </form:label>
        <form:input path="patientReferralDate"/>
        <br/>
        <input type="submit" value="Create">
        <input type="reset" value="Reset">
        <button type="button" id="go_home">Cancel</button>
    </form:form>

    <form>
        <button formaction="./prescription/see">See</button>
        <button formaction="./">Home</button>
    </form>
</div>

<script type="text/javascript" src="../statics/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../../../resources/statics/js/main.js"></script>
</body>
</html>