<?php

class Profile {

  const DB_TABLE = 'profiles'; // database table name
  // database fields for this table
  public $profile_id = 0;
  public $firstname = '';
  public $lastname = '';
  public $username = '';
  public $password = '';
  public $role = '';
  public $email = '';
  public $address = '';
  public $timezone = '';
  public $number_posts = 0;
  public $number_following = 0;
  public $number_followers = 0;

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
        $profile->role         = $row['role'];
        $profile->email        = $row['email'];
        $profile->address      = $row['address'];
        $profile->timezone     = $row['timezone'];
        $profile->number_posts = $row['number_posts'];
        $profile->number_following = $row['number_following'];
        $profile->number_followers = $row['number_followers'];

        return $profile; // return the member
      }
  }
    //Get profile by username
    public static function getProfileByUsername($user_name) {
        $db = Db::instance(); // create db connection
        // build query
        $q = sprintf("SELECT * FROM `profiles` WHERE `username` = %s;",
            $db->escape($user_name)
        );
        $result = $db->query($q); // execute query

        if($result->num_rows == 0) {
            echo " Username is: ".$user_name;
            echo " ERROR";
            #return null;
        } else {
            $row = $result->fetch_assoc(); // get results as associative array

            $profile = new Profile(); // instantiate
            $profile->profile_id   = $row['profile_id'];
            $profile->firstname    = $row['firstname'];
            $profile->lastname     = $row['lastname'];
            $profile->username     = $row['username'];
            $profile->password     = $row['password'];
            $profile->role         = $row['role'];
            $profile->email        = $row['email'];
            $profile->address      = $row['address'];
            $profile->timezone     = $row['timezone'];
            $profile->number_posts = $row['number_posts'];
            $profile->number_following = $row['number_following'];
            $profile->number_followers = $row['number_followers'];

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
      return $this->insert();
    }
    else {
      return $this->update();
    }
  }

  public function passwordSave($profile_id){
      if($profile_id != 0) {
          return $this->updatePassword();
      }
  }

    public function saveRole($profile_id){
        if($profile_id != 0) {
            return $this->updateRole();
        }
    }

  //Inserts the family member into the database
  public function insert() {
    if($this->profile_id != 0)
      return null;

    $db = Db::instance(); // connect to db
    $q = sprintf("INSERT INTO profiles (`firstname`, `lastname`, `username`, `password`, `role`, `email`, `address`,
        `timezone`, `number_posts`, `number_following`, `number_followers`)
    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %d, %d, %d);",
      $db->escape($this->firstname),
      $db->escape($this->lastname),
      $db->escape($this->username),
      $db->escape($this->password),
      $db->escape($this->role),
      $db->escape($this->email),
      $db->escape($this->address),
      $db->escape($this->timezone),
      $db->escape($this->number_posts),
      $db->escape($this->number_following),
      $db->escape($this->number_followers)


      );

    $db->query($q); // execute query
    return $db->getInsertID();
  }

  //Updates specified data in the database
  //Doesnt handle password because password is on a seperate form
  public function update() {
    if($this->profile_id == 0)
      return null; // can't update something without an ID

    $db = Db::instance(); // connect to db
    $q = sprintf("UPDATE profiles SET
    `firstname` = %s,
    `lastname`  = %s,
    `username`  =   %s,
    `email`     =   %s,
    `address`   =  %s,
    `timezone`    =  %s,
    `number_posts`    =  %s,
    `number_following`    =  %s,
    `number_followers`    =  %s
    WHERE `profile_id` = $this->profile_id",
        $db->escape($this->firstname),
        $db->escape($this->lastname),
        $db->escape($this->username),
        $db->escape($this->email),
        $db->escape($this->address),
        $db->escape($this->timezone),
        $db->escape($this->number_posts),
        $db->escape($this->number_following),
        $db->escape($this->number_followers)
  );

    $query = $db->query($q); // execute query
    return $this->profile_id; // return this object's ID
  }

  //Update password
    public function updatePassword() {
        if($this->profile_id == 0)
            return null; // can't update something without an ID

        $db = Db::instance(); // connect to db
        $q = sprintf("UPDATE profiles SET
        `password`    =  %s
        WHERE `profile_id` = $this->profile_id",

            $db->escape($this->password)
        );

        $query = $db->query($q); // execute query
        return $this->profile_id; // return this object's ID
    }

    //Update Role
    public function updateRole() {
        if($this->profile_id == 0)
            return null; // can't update something without an ID

        $db = Db::instance(); // connect to db
        $q = sprintf("UPDATE profiles SET
        `role`    =  %s
        WHERE `profile_id` = $this->profile_id",

            $db->escape($this->role)
        );

        $query = $db->query($q); // execute query
        return $this->profile_id; // return this object's ID
    }

}
