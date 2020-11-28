<%@ page import="java.util.List" %>
<%@ page import="com.mamalimomen.domains.Patient" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>See Patients</title>
</head>
<body>
<h1>Patients</h1>

<div>
    <h1>${message}</h1>
</div>

<div class="table-bordered table-responsive">
    <table class="table">
        <thead>
        <tr>
            <th>Patient FirstName</th>
            <th>Patient LastName</th>
            <th>Patient Gender</th>
            <th></th>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <% List<Patient> patients = (List<Patient>) request.getAttribute("patients");
            if (patients.isEmpty()) {%>
        <tr>
            <td colspan="6">There is not any Patient yet!</td>
        </tr>
        <%
            }
            for (Patient patient : patients) {
        %>
        <tr>
            <td><%=patient.getFirstName()%>
            </td>
            <td><%=patient.getLastName()%>
            </td>
            <td><%=patient.getGender()%>
            </td>
            <form:form method="get" action="./modify">
                <input type="hidden" name="id" value="<%=patient.getId()%>">
                <td><input type="submit" value="Modify"></td>
            </form:form>
            <form:form method="get" action="./details">
                <input type="hidden" name="id" value="<%=patient.getId()%>">
                <td><input type="submit" value="Details"></td>
            </form:form>
            <form:form method="get" action="./delete">
                <input type="hidden" name="id" value="<%=patient.getId()%>">
                <td><input type="submit" value="Delete"></td>
            </form:form>
        </tr>
        <%}%>
        <form>
            <button formaction="../">home</button>
        </form>
        </tbody>
    </table>
</div>

</body>
</html>