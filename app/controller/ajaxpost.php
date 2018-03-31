<?php
  include_once '../global.php';

  $description = $_POST['description']; // required
  $profile_id = $_POST['profile_id']; // required
  $topic_id = $_POST['topic_id']; // required

  $mypost = new Post();
  $mypost->description  = $description;
  $mypost->date_posted  = date("Y-m-d");
  $mypost->number_posts = 0;
  $mypost->topic_id = $topic_id;
  $mypost->profile_id = $profile_id;

  $post_id = $mypost->save($profile_id, $topic_id);
