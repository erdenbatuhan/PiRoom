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
    <link rel="stylesheet" type="text/css" href="./Data/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="./Data/css/styleutiful.css">
    <link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Cookie">

    <!-- ========== JavaScript Part ========== !-->
    <script src="./Data/js/bootstrap.js"></script>
    <script src="https://www.gstatic.com/firebasejs/4.0.0/firebase.js"></script>
</head>
<body>
    <?php include "./navbar.php"; ?>

    <div id="main" class="container text-center">
        <br><br><br><br><br>
        <a href="./Status.php?buildingId=1" type="button" class="btn btn-primary"><span id="b1">... / ...</span><br> EF <br><i> Engineering Faculty </i></a>
        <br><br>
        <a href="./Status.php?buildingId=2" type="button" class="btn btn-success"><span id="b2">... / ...</span><br> FEAS <br><i> Faculty of Economics and Administrative Sciences </i></a>
        <br><br>
        <a href="./Status.php?buildingId=3" type="button" class="btn btn-info"><span id="b3">... / ...</span><br> LF <br><i> Law Faculty </i></a>
        <br><br>
        <a href="./Status.php?buildingId=4" type="button" class="btn btn-warning"><span id="b4">... / ...</span><br> ScOLa <br><i> School of Languages </i></a>
        <br><br>
        <a href="./Status.php?buildingId=5" type="button" class="btn btn-danger"><span id="b5">... / ...</span><br> IC <br><i> Innovation Center </i></a>
        <br><br>
    </div>

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

        var ref1 = firebase.database().ref('buildings');
        var ref2 = firebase.database().ref('rooms');

        var capacities = [];
        var occupancies = [];

        ref1.on('value', function(snapshot) {
            snapshot.forEach(function(child) {
                var building = child.val().id;
                capacities[building] = child.val().capacity;

                if (occupancies[building] == null)
                    occupancies[building] = 0;

                var element = document.getElementById("b" + building);
                element.innerText = occupancies[building] + " / " + capacities[building];
            });
        });

        ref2.on('value', function(snapshot) {
            occupancies = [];

            snapshot.forEach(function(child) {
                var building = child.val().building;

                if (occupancies[building] == null)
                    occupancies[building] = 0;

                if (child.val().status != 0)
                    occupancies[building]++;

                var element = document.getElementById("b" + building);
                element.innerText = occupancies[building] + " / " + capacities[building];
            });
        });
    </script>

    <?php include "./footer.php"; ?>
</body>
</html>
