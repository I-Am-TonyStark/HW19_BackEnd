<%@ page import="com.mamalimomen.domains.Medicine" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Modify Medicine</title>
</head>
<body>
<h1>Modify Patient</h1>

<%!
    String s = "mamad";
    int a = 20;
%>

<div>
    <h1>${message}</h1>
</div>
<hr/>
<form:form method="post" action="./modify" modelAttribute="newPatient">
    <form:hidden path="id" value="${existPatient.id}"/>
    <p>FirstName: <form:input path="firstName" title="${existPatient.firstName}" type="text" value="${existPatient.firstName}"/></p>
    <p>LastName: <form:input path="lastName" title="${existPatient.lastName}" type="text" value="${existPatient.lastName}"/></p>
    <p>Gender: <form:select path="gender" title="${existPatient.lastName}" value="${existPatient.gender}">
         <option value="MALE">Male</option>
         <option value="FEMALE">Female</option>
    </form:select></p>
    <br/>
    <br/>

    <hr/>

    <h1>Create New Prescription</h1>

    <label for="code">Prescription code:*</label>
    <input type="number" name="code" id="code" placeholder="Code">
    <br/>
    <label for="emissionDate">Prescription Emission Date:</label>
    <input type="date" name="emissionDate" id="emissionDate" placeholder="EmissionDate">
    <br/>
    <label for="patientReferralDate">Prescription Referral Date:</label>
    <input type="date" name="patientReferralDate" id="patientReferralDate" placeholder="ReferralDate">
    <br/>
    <div class=form-group style="display: none"><label for=select-language>Single Select</label> <select id=select-language
                                                                                                         onchange=console.log(this.value)>
        <option value=php>PHP</option>
        <option value=javascript>Javascript</option>
        <option value=python>Python</option>
        <option value=java>Java</option>
    </select></div>
    <div class=form-group><label for=select-language>Select Medicines</label> <select id=select-multiple-language
                                                                                     name="medicines" multiple=multiple>
        <option value="" selected>nothing</option>
        <% List<Medicine> medicines = (List<Medicine>) request.getAttribute("medicines");
            for (Medicine medicine : medicines) {%>
        <option value=<%=medicine.getId()%>><%=medicine.getName()%></option>
        <%
            }
        %>
    </select>
    </div>
    <br/>
    <input type="submit" value="Update">
</form:form>

<form>
    <button formaction="../">Home</button>
</form>
</div>
<script type="text/javascript" src="../statics/multiple-select/dist/js/multiple-select.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>../statics/multiple-select/dist/js/app.js"></script>
</body>
</html>