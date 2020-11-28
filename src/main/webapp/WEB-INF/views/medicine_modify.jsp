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

<h1>Modify Medicine</h1>

<div>
    <h1>${message}</h1>
</div>

<form:form method="post" action="./modify" modelAttribute="newMedicine">
    <form:hidden path="id" value="${existMedicine.id}"/>
    <p>Name: <form:input title="${existMedicine.name}" type="text" value="${existMedicine.name}" path="name"/></p>
    <p>Code: <form:input title="${existMedicine.code}" type="number" value="${existMedicine.code}" path="code"/></p>
    <p>Price: <form:input title="${existMedicine.price}" type="number" value="${existMedicine.price}" path="price"/></p>
    <p>Description: <form:textarea title="${existMedicine.description}" value="${existMedicine.price}"
                                   path="description"></form:textarea></p>
    <p><input type="submit" value="Update"/></p>
</form:form>
<form>
    <button formaction="../">home</button>
</form>
</body>
</html>