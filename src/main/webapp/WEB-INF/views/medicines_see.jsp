<%@ page import="com.mamalimomen.domains.Medicine" %>
<%@ page import="java.util.List" %>
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
    <link rel="stylesheet" href="../static/css/bootstrap.min.css" crossorigin="anonymous" type="text/css">
    <title>See Medicines</title>
</head>
<body>
<h1>Medicines</h1>

<div>
    <h1>${message}</h1>
</div>

<div class="table-bordered table-responsive">
    <table class="table">
        <thead>
        <tr>
            <th>Medicine Name</th>
            <th>Medicine Code</th>
            <th>Medicine Price</th>
            <th>Medicine Description</th>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <% List<Medicine> medicines = (List<Medicine>) request.getAttribute("medicines");
            if (medicines.isEmpty()) {%>
        <tr>
            <td colspan="6">There is not any Medicine yet!</td>
        </tr>
        <%
            }
            for (Medicine medicine : medicines) {
        %>
        <tr>
            <td><%=medicine.getName()%>
            </td>
            <td><%=medicine.getCode()%>
            </td>
            <td><%=medicine.getPrice()%>
            </td>
            <td><%=medicine.getDescription()%>
            </td>
            <form:form method="get" action="./modify" methodParam="">
                <input name="id" type="hidden" value="<%=medicine.getUuid()%>">
                <td><input type="submit" value="Modify"></td>
            </form:form>
            <form:form method="get" action="./delete">
                <input name="id" type="hidden" value="<%=medicine.getUuid()%>">
                <td><input type="submit" value="Delete"></td>
            </form:form>
        </tr>
        <%}%>
        </tbody>
    </table>
    <form>
        <button formaction="../">home</button>
    </form>
</div>
</body>
</html>