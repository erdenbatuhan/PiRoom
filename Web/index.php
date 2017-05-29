<?php
session_start();

include "./Model/School.php";
include "./Model/Building.php";
include "./Model/Room.php";
?>

<!DOCTYPE html>
<html>
<head>
    <title> Home | PiRoom </title>

    <!-- ========== META Part ========== !-->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible">
    <meta name="description" content="index">
    <meta name="author" content="Batuhan Erden">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- ========== CSS Part ========== !-->
    <link rel="stylesheet" type="text/css" href="Data/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="Data/css/styleutiful.css">
    <link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Cookie">

    <!-- ========== JavaScript Part ========== !-->
    <script src="Data/js/bootstrap.js"></script>
</head>
<body>
    <?php include "navbar.php"; ?>

    <div id="main" class="container text-center">
        <br><br><br><br><br>
        <button type="button" class="btn btn-primary"> EF <br><i> Engineering Faculty </i></button>
        <br><br>
        <button type="button" class="btn btn-success"> FEAS <br><i> Faculty of Economics and Administrative Sciences </i></button>
        <br><br>
        <button type="button" class="btn btn-info"> LF <br><i> Law Faculty </i></button>
        <br><br>
        <button type="button" class="btn btn-warning"> ScOLa <br><i> School Of Languages </i></button>
        <br><br>
        <button type="button" class="btn btn-danger"> IC <br><i> Innovation Center </i></button>
        <br><br>
    </div>

    <script src="https://www.gstatic.com/firebasejs/4.0.0/firebase.js"></script>
    <script>
        // Initialize Firebase
        var config = {
            apiKey: "AIzaSyBO50phc2VOZXASMumHxgSK6PGSMm4i4Pg",
            authDomain: "piroom-f14c0.firebaseapp.com",
            databaseURL: "https://piroom-f14c0.firebaseio.com",
            projectId: "piroom-f14c0",
            storageBucket: "piroom-f14c0.appspot.com",
            messagingSenderId: "233603120330"
        };

        firebase.initializeApp(config);
        var ref = firebase.database().ref('buildings');

        //ref.on('value', function(snapshot) {
            snapshot.forEach(function(child) {
                var div = document.createElement('div');
                div.className = "button";
                div.innerHTML = "<button>" + child.val().abbreviation + "<hr><br>" + child.val().name + "</button>";

                document.getElementById('main').appendChild(div);
            });
        });
    </script>

    <?php include "footer.php"; ?>
</body>
</html>
