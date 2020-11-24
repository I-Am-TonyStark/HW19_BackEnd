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
<h1>Modify Medicine</h1>
<form:form method="post" action="../modify" modelAttribute="medicine">
    <input type="hidden" value="${medicine.uuid}"/>
    <p>Name: <input type="text" value="${medicine.name}"/></p>
    <p>Code: <input type="number" value="${medicine.code}"/></p>
    <p>Price: <input type="number" value="${medicine.price}"/></p>
    <p>Description: <textarea>${medicine.description}</textarea></p>
    <p><input type="submit" value="Update"/> <input type="reset" value="Reset"/></p>
</form:form>
<form>
    <button formaction="/">home</button>
</form>
</body>
</html>