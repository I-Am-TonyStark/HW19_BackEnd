<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">

    <link rel="stylesheet" href="../static/bootstrap/css/bootstrap.min.css" crossorigin="anonymous" type="text/css">
    <title>Modify Prescription</title>
</head>
<body>
<h1>Modify Prescription</h1>
<form:form method="post" action="../modify" modelAttribute="prescription">
    <input type="hidden" value="${prescription.uuid}"/>
    <p>code: <input type="number" value="${prescription.code}"/></p>
    <p>Patient Referral Date: <input type="date" value="${prescription.patientReferralDate}"/></p>
    <p>Emission Date: <input type="date" value="${prescription.emissionDate}"/></p>
    <p><input type="submit" value="Update"/> <input type="reset" value="Reset"/></p>
</form:form>
<form>
    <button formaction="/">home</button>
</form>
</body>
</html>