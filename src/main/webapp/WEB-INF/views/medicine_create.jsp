<%@ page isELIgnored="false" %>
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
    <meta name="viewport" content="width=device-width,initial-scale=1.0">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Create Medicine</title>
</head>
<body>
<div class="container">
    <h1>Create New Medicine</h1>

    <div>
        <h1>${message}</h1>
    </div>

    <form method="post" action="./create">
        <label for="name">Medicine name:*</label>
        <input type="text" name="name" id="name" required>
        <br/>
        <label for="code">Medicine code:*</label>
        <input type="number" name="code" id="code" required>
        <br/>
        <label for="price">Medicine price:*</label>
        <input type="number" name="price" id="price" required>
        <br/>
        <label for="description">Medicine description:</label>
        <textarea name="description" id="description" cols="20" rows="5" placeholder="description"></textarea>
        <br/>
        <input type="submit" value="Create">
        <input type="reset" value="Reset">
    </form>

    <form>
        <button formaction="./see">See</button>
        <button formaction="../">Home</button>
    </form>
</div>

</body>
</html>