<%@ page import="com.mamalimomen.domains.Medicine" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mamalimomen.domains.Patient" %>
<%@ page import="com.mamalimomen.domains.Prescription" %>
<%@ page import="java.util.Set" %>
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../static/bootstrap/css/bootstrap.min.css" crossorigin="anonymous" type="text/css">
    <title>Patient Details</title>
</head>
<body>
<h1>Patient</h1>

<div>
    <h1>${message}</h1>
</div>

<div class="table-bordered table-responsive">
    <table class="table">
        <thead>
        <tr>
            <th>Patient ID</th>
            <th>Patient FirstName</th>
            <th>Patient LastName</th>
            <th>Patient Gender</th>
        </tr>
        </thead>
        <tbody>
        <% Patient patient = (Patient) request.getAttribute("existPatient");%>
        <tr>
            <td>${existPatient.uuid}
            </td>
            <td>${existPatient.firstName}
            </td>
            <td>${existPatient.lastName}
            </td>
            <td>${existPatient.gender}
            </td>
        </tr>
        </tbody>
    </table>
</div>

<h1>Prescriptions</h1>

<div class="table-bordered table-responsive">
    <table class="table">
        <thead>
        <tr>
            <th>Prescription Code</th>
            <th>Prescription Patient ReferralDate</th>
            <th>Prescription EmissionDate</th>
            <th colspan="2">Prescription Medicines</th>
        </tr>
        </thead>
        <tbody>
        <% Set<Prescription> prescriptions = patient.getPrescriptions();
            if (prescriptions.isEmpty()) {%>
        <tr>
            <td colspan="5">You have not any Prescription yet!</td>
        </tr>
        <%
            }
            for (Prescription prescription : prescriptions) {
        %>
        <tr>
            <td><%=prescription.getCode()%>
            </td>
            <td><%=prescription.getPatientReferralDate()%>
            </td>
            <td><%=prescription.getEmissionDate()%>
            </td>
            <td colspan="2"><%=prescription.printMedicines()%></td>
        </tr>
        <%}%>
        <form>
            <button formaction="/">home</button>
        </form>
        </tbody>
    </table>
</div>
</body>
</html>