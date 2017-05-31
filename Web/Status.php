<!DOCTYPE html>
<html>
<head>
    <title> Status | PiRoom </title>

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
    <?php
    include "./navbar.php";
    $buildingId = $_GET['buildingId'];
    ?>

    <br><br><br><br>
    <div class="container">
        <div class="media">
            <div class="media-left">
                <a href="#">
                    <img class="media-object" src="http://sahinleryapi.com/insaat/photos/projeler/tamamlanan/ozyegin-universitesi/buyuk/23.jpg" width="64px" height="64px">
                </a>
            </div>
            <div class="media-body">
                <h4 id="title"> Loading... </h4>
                <p id="para"></p>
            </div>
        </div>
        <br><br>
        <div id="section" class="text-center"></div>
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

        var buildingId = "<?php echo $buildingId ?>";

        var ref1 = firebase.database().ref('buildings');
        var ref2 = firebase.database().ref('rooms');

        var capacity = 0;
        var occupancy = 0;
        var count = 0;

        ref1.on('value', function(snapshot) {
            snapshot.forEach(function(child) {
                if (buildingId ==  child.val().id) {
                    capacity = child.val().capacity;

                    var title = document.getElementById("title");
                    title.innerText = child.val().name;

                    var element = document.getElementById("para");
                    element.innerText = occupancy + " / " + capacity;
                }
            });
        });

        ref2.on('value', function(snapshot) {
            for (var i = 0; i < count; i++)
                document.getElementById("room" + i).remove();

            occupancy = 0;
            count = 0;

            snapshot.forEach(function(child) {
                if (buildingId == child.val().building) {
                    if (child.val().status != 0)
                        occupancy++;

                    var element = document.getElementById("para");
                    element.innerText = occupancy + " / " + capacity;

                    var room = document.createElement("div");

                    var room_name = child.val().name;
                    var room_status = "Full";
                    var room_class = "panel panel-danger";

                    if (child.val().status == 0) {
                        room_status = "Empty";
                        room_class = "panel panel-success";
                    } else if (child.val().status == 1) {
                        room_class = "panel panel-warning";
                    }

                    room.id = "room" + (count++);
                    room.className = room_class;
                    room.innerHTML = "" +
                        "   <div class='panel-heading'>" +
                        "       <h3 class='panel-title'> " + room_status + " </h3>" +
                        "   </div>" +
                        "   <div class='panel-body'> " + room_name + " </div> ";

                    document.getElementById('section').appendChild(room);
                }
            });
        });
    </script>

    <?php include "./footer.php"; ?>
</body>
</html>
