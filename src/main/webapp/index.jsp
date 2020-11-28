<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="icon" href="./WEB-INF/statics/css/icon1.png">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <title>Home Page</title>
</head>
<body style="background-image: url('./WEB-INF/statics/css/background1.jpg'); background-repeat: no-repeat; background-position: center; background-size: 150%;">
<h1 style="text-align: center; padding-top: 1%;  -webkit-text-stroke: 2px #6d6d6d; color: #000000">Welcome to my
    pharmacy!</h1>

<div style="display:flex; justify-content: space-around ; padding-top: 30px">

    <div class="card" style="width: 18rem;">
        <img src="./WEB-INF/statics/css/medicines.jpg"
             class="card-img-top" alt="...">
        <div class="card-body">
            <h5 class="card-title">Medicine</h5>
            <p class="card-text">Menu for add/see/modify medicines.</p>
            <form>
                <button class="btn btn-primary" formaction="./medicine/add">Create Medicine</button>
                <button class="btn btn-primary" formaction="./medicine/see">See Medicines</button>
            </form>
        </div>
    </div>
    <div class="card" style="width: 18rem;">
        <img src="./WEB-INF/statics/css/patients.jpg"
             class="card-img-top" alt="...">
        <div class="card-body">
            <h5 class="card-title">Patients</h5>
            <p class="card-text">Menu for add/see/modify patients.</p>
            <form>
                <button class="btn btn-primary" formaction="./patient/add">Create Patient</button>
                <button class="btn btn-primary" formaction="./patient/see">See Patients</button>
            </form>
        </div>
    </div>

</div>
</body>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
</html>
