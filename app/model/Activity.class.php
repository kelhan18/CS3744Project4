<?php

class Activity {

  const DB_TABLE = 'activity'; // database table name
  // database fields for this table
  public $id = 0;
  public $profile_id = 0;
  public $description = '';

  // // return all activities for a given profile id in an array
  // public function getActivities($profile_id) {
  //   $db = Db::instance();
  //   $q = "SELECT * FROM `".self::DB_TABLE."` WHERE `profile_id` = ".$profile_id;
  //   $result = $db->query($q);
  //
  //   $activities = array();
  //   if($result->num_rows != 0) {
  //     while($row = $result->fetch_assoc()) {
  //       $activities[] = $row['description'];
  //     }
  //   }
  //   return $activities;
  // }
  //
  // // adds a new activity
  // public function addActivity($profile_id, $description) {
  //   $db = Db::instance();
  //   $q = sprintf("INSERT INTO `activity` (`profile_id`, `description`)
  //   VALUES (%d, %s);",
  //     $profile_id,
  //     $db->escape($description)
  //   );
  //
  //   $result = $db->query($q); // execute query
  //   return $db->getInsertID();
  // }

  // returns returnZero
  public function returnZero() {
    return "<script>console.log('PHP: In ACtivity');</script>";
  }
}
