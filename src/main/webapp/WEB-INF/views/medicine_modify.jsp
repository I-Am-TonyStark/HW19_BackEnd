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

<div>
    <h1>${message}</h1>
</div>

<form:form method="post" action="./modify" modelAttribute="newMedicine">
    <input type="hidden" value="${existMedicine.uuid}"/>
    <p>Name: <input type="text" value="${existMedicine.name}"/></p>
    <p>Code: <input type="number" value="${existMedicine.code}"/></p>
    <p>Price: <input type="number" value="${existMedicine.price}"/></p>
    <p>Description: <textarea>${existMedicine.description}</textarea></p>
    <p><input type="submit" value="Update"/> <input type="reset" value="Reset"/></p>
</form:form>
<form>
    <button formaction="../">home</button>
</form>
</body>
</html>