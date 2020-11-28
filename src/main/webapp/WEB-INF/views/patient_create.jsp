<%@ page import="com.mamalimomen.domains.Medicine" %>
<%@ page import="java.util.List" %>
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
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name=viewport content="width=device-width,initial-scale=1">
    <meta http-equiv=X-UA-Compatible content="ie=edge">
    <title>Create Patient</title>
    <link rel=stylesheet href=https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css>
    <link rel=stylesheet href=https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css>
    <link href="../statics/multiple-select/dist/css/multiple-select.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1>Create New Patient</h1>

        <div>
            <h1>${message}</h1>
        </div>
        <hr>
        <form:form method="post" action="./create" modelAttribute="patient">
            <form:label path="firstName">
                Patient firstName:*
            </form:label>
            <form:input type="text" path="firstName" required="required"/>
            <br/>
            <form:label path="lastName">
                Patient lastName:
            </form:label>
            <form:input type="text" path="lastName" required="required"/>
            <br/>
            <form:label path="gender">
                Patient gender:*
            </form:label>
            <form:radiobutton path="gender" label="Male" value="MALE" required="required"/>
            <form:radiobutton path="gender" label="Female" value="FEMALE" required="required"/>
            <br/>
            <br/>

            <hr/>

            <h1>Prescriptions</h1>

            <label for="code">Prescription code:*</label>
            <input type="number" name="code" id="code" placeholder="Code" required>
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
                <% List<Medicine> medicines = (List<Medicine>) request.getAttribute("medicines");
                        for (Medicine medicine : medicines) {%>
                    <option value=<%=medicine.getId()%>><%=medicine.getName()%></option>
                    <%
                        }
                    %>
                </select>
            </div>
            <br/>
            <input type="submit" value="Create">
            <input type="reset" value="Reset">
        </form:form>

        <form>
            <button formaction="./see">See</button>
            <button formaction="../">Home</button>
        </form>
    </div>
<script type="text/javascript" src="../statics/multiple-select/dist/js/multiple-select.js"></script>
<script type="text/javascript" src="../statics/multiple-select/dist/js/app.js"></script>
</body>
</html>