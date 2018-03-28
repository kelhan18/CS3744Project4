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
    <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/style.css">
    <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/styles2.css">
    <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/bootstrap.css">
    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/myjquery.js"></script>
    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/scripts.js"></script>
    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/scripts-jquery.js"></script>
    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/bootstrap.js"></script>
</head>
<body>
