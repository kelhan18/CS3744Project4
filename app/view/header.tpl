<?php

if(isset($_SESSION['username']))
  echo 'Welcome! Logged in as: '.$_SESSION['username'];
else
  echo 'Not logged in, please sign-in!';
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title><?= $pageTitle ?> | The Battle of Peleliu</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/main.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css" integrity="sha384-5SOiIsAziJl6AWe0HWRKTXlfcSHKmYV4RBF18PPJ173Kzn7jzMyFuTtk8JA7QQG1" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/styles2.css">
    <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/style.css">
    <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/bootstrap.css">

    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/myjquery.js"></script>
    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/scripts.js"></script>
    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/scripts-jquery.js"></script>
    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/jquery.scrollex.min.js"></script>
    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/jquery.scrolly.min.js"></script>
    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/skel.min.js"></script>
    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/util.js"></script>
    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/bootstrap.js"></script>
    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/main.js"></script>

</head>

