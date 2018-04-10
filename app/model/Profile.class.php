<?php

class Profile {

  const DB_TABLE = 'profiles'; // database table name
  // database fields for this table
  public $profile_id = 0;
  public $firstname = '';
  public $lastname = '';
  public $username = '';
  public $password = '';
  public $email = '';
  public $address = '';
  public $timezone = '';
  public $number_posts = 0;

  //Deletes a profile with a specific id
  public static function delete($profile_id) {
        $db = Db::instance(); // create db connection
        $q = sprintf("DELETE FROM members WHERE `profile_id` = %d;",
          $profile_id
          );
        $result = $db->query($q); // execute query
  }

  // return a profile object by ID
  public static function getProfile($profile_id) {
      $db = Db::instance(); // create db connection
      // build query
      $q = sprintf("SELECT * FROM `%s` WHERE `profile_id` = %d;",
        self::DB_TABLE,
        $profile_id
        );
      $result = $db->query($q); // execute query
      if($result->num_rows == 0) {
        return null;
      } else {
        $row = $result->fetch_assoc(); // get results as associative array

        $profile = new Profile(); // instantiate
        $profile->profile_id   = $row['profile_id'];
        $profile->firstname    = $row['firstname'];
        $profile->lastname     = $row['lastname'];
        $profile->username     = $row['username'];
        $profile->password     = $row['password'];
        $profile->email        = $row['email'];
        $profile->address      = $row['address'];
        $profile->timezone     = $row['timezone'];
        $profile->number_posts = $row['number_posts'];

        return $profile; // return the member
      }
  }

  // return all Family Members in an array
  public static function getProfiles() {
    $db = Db::instance();
    $q = "SELECT * FROM `".self::DB_TABLE."`";
    $result = $db->query($q);

    $profiles = array();
    if($result->num_rows != 0) {
      while($row = $result->fetch_assoc()) {
        $profiles[] = self::getProfile($row['profile_id']);
      }
    }
    return $profiles;
  }

  //Saves the new family member and adds them to the database
  public function save($profile_id){
    if($profile_id == 0) {
        echo 'Insert';
        echo 'Profile ID: '.$this->profile_id;
      return $this->insert();
    }
    else {
        echo 'Update';
        echo 'Profile ID: '.$this->profile_id;
      return $this->update();
    }
  }

  //Inserts the family member into the database
  public function insert() {
    if($this->topic_id != 0)
      return null;

    $db = Db::instance(); // connect to db
    $q = sprintf("INSERT INTO profiles (`firstname`, `lastname`, `username`, `password`, `email`, `address`, `timezone`, `number_posts`)
    VALUES (%s, %s, %s, %s, %s, %s, %s, %d);",
      $db->escape($this->firstname),
      $db->escape($this->lastname),
      $db->escape($this->username),
      $db->escape($this->password),
      $db->escape($this->email),
      $db->escape($this->address),
      $db->escape($this->timezone),
      $db->escape($this->number_posts)
      );

    $db->query($q); // execute query
    return $db->getInsertID();
  }

  //Updates specified data in the database
  public function update() {
      echo 'Update Profile ID: '.$this->profile_id;
    if($this->profile_id == 0)
      return null; // can't update something without an ID

      echo 'Profile ID: '.$this->profile_id;
    $db = Db::instance(); // connect to db
    $q = sprintf("UPDATE `profiles` SET
    `firstname` = %s,
    `lastname`  = %s,
    `username`  =   %s,
    `password`  =   %s,
    `email`     =   %s,
    `address`   =  %s,
    `timezone`    =  %s
    WHERE `profile_id` = %d;",
        $db->escape($this->firstname),
        $db->escape($this->lastname),
        $db->escape($this->username),
        $db->escape($this->password),
        $db->escape($this->email),
        $db->escape($this->address),
        $db->escape($this->timezone),
        $db->escape($this->profile_id)
  );

    $db->query($q); // execute query
      echo 'Final DB Profile ID: '.$this->profile_id;
    return $this->profile_id; // return this object's ID
  }


}
