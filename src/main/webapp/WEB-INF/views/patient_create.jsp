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
    <title>Create Patient</title>
</head>
<body>
<div class="container">
    <h1>Create New Patient</h1>
    <form:form method="POST" action="./create" modelAttribute="patient">
        <form:label path="firstName">
            Patient firstName:*
        </form:label>
        <form:input path="firstName"/>
        <br/>
        <form:label path="lastName">
            Patient lastName:*
        </form:label>
        <form:input path="lastName"/>
        <br/>
        <form:label path="gender">
            Patient gender:*
        </form:label>
        <form:radiobutton path="gender" label="Male" value="MALE"/>
        <form:radiobutton path="gender" label="Female" value="FEMALE"/>
        <br/>
        <br/>

        <h1>Add One Prescription</h1>

        <label for="code">Prescription code:*</label>
        <input type="number" name="code" id="code" placeholder="Code" required>
        <br/>
        <label for="emissionDate">Prescription Emission Date:*</label>
        <input type="date" name="emissionDate" id="emissionDate" placeholder="EmissionDate" required>
        <br/>
        <label for="patientReferralDate">Prescription Referral Date:*</label>
        <input type="date" name="patientReferralDate" id="patientReferralDate" placeholder="ReferralDate" required>
        <br/>
        <input type="submit" value="Create">
        <input type="reset" value="Reset">
        <button type="button" id="go_home">Cancel</button>
    </form:form>

    <form>
        <button formaction="./patient/see">See</button>
        <button formaction="./">Home</button>
    </form>
</div>

<script type="text/javascript" src="../statics/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../../../resources/statics/js/main.js"></script>
</body>
</html>