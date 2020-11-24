<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">

    <link rel="stylesheet" href="../static/bootstrap/css/bootstrap.min.css" crossorigin="anonymous" type="text/css">
    <title>Modify Medicine</title>
</head>
<body>
<h1>Modify Patient</h1>
<form:form method="post" action="../modify" modelAttribute="patient">
    <input type="hidden" value="${patient.uuid}"/>
    <p>FirstName: <input type="text" value="${patient.firstName}"/></p>
    <p>LastName: <input type="text" value="${patient.lastName}"/></p>
    <p>Gender: <input list="genders" value="${patient.gender}"/></p>
    <p><input type="submit" value="Update"/> <input type="reset" value="Reset"/></p>
    <datalist id="genders">
        <option value="MALE"/>
        <option value="FEMALE"/>
    </datalist>
</form:form>
<form>
    <button formaction="/">home</button>
</form>
</body>
</html>