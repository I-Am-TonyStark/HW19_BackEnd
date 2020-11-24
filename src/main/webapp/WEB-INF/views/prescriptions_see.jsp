<%@ page import="com.mamalimomen.domains.Medicine" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mamalimomen.domains.Prescription" %>
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
    <title>See Prescriptions</title>
</head>
<body>
<h1>Prescriptions</h1>

<div>
    <h1>${message}</h1>
</div>

<div class="table-bordered table-responsive">
    <table class="table">
        <thead>
        <tr>
            <th>Prescription Code</th>
            <th>Prescription Patient ReferralDate</th>
            <th>Prescription EmissionDate</th>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <% List<Prescription> prescriptions = (List<Prescription>) request.getAttribute("prescriptions");
            if(prescriptions.isEmpty()){%>
        <tr>
            <td colspan="6">There is not any Prescription yet!</td>
        </tr>
        <%}
            for (Prescription prescription : prescriptions) { %>
        <tr>
            <td><%=prescription.getCode()%></td>
            <td><%=prescription.getPatientReferralDate()%></td>
            <td><%=prescription.getEmissionDate()%></td>
            <form:form method="get" action="../delete" methodParam="<%=prescription.getUuid()%>">
                <td><input type="submit" value="Delete"></td>
            </form:form>
        </tr>
        <%}%>
        <form><button formaction="/">home</button> </form>
        </tbody>
    </table>
</div>
</body>
</html>