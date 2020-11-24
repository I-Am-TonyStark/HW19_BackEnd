<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="icon" href="http://uupload.ir/files/9t45_snake.png">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <link rel="stylesheet" href="../static/bootstrap/css/bootstrap.min.css" crossorigin="anonymous" type="text/css">
    <title>Home</title>
</head>
<body>
<h2>Welcome to my pharmacy!</h2>

<div style="display: flex; justify-content: space-around">

    <form>
        <button formaction="./medicine/create">Create Medicine</button>
        <button formaction="./medicine/see">See Medicines</button>
    </form>

    <form>
        <button formaction="./patient/add">Create Patient</button>
        <button formaction="./patient/see">See Patients</button>
    </form>

    <form>
        <button formaction="./prescription/create">Create Prescription</button>
        <button formaction="./prescription/see">See Prescriptions</button>
    </form>

</div>
</body>
</html>
