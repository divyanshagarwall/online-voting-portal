<?php 
    session_start();
    require_once("config.php");

    if($_SESSION['key'] != "AdminKey")
    {
        echo "<script> location.assign('logout.php'); </script>";
        die;
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adminpanel</title>
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="../assets/css/login.css">

</head>
<body>
    
    <div class="container-fluid">
        <div class="row head123 text-white" style="background: #72cad1 ">
            <div class="col-1"> 
                <img src="../assets/images/logo1.gif" width="80px"/>
            </div>
            <div class="col-11 my-auto " >
                <h3 class="ml-4" style="color:rgb(204, 221, 243)"> ONLINE VOTING SYSTEM  - <small> Welcome  <?php echo $_SESSION['username']; ?></small> </h3>
            </div>
        </div>
    </div>
</body>
</html>
 





