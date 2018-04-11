<?php

class Follower {

    const DB_TABLE = 'followers'; // database table name
    // database fields for this table
    public $id = 0;
    public $username = '';
    public $follower = '';

    //Deletes a profile with a specific id
    public static function delete($id) {
        $db = Db::instance(); // create db connection
        $q = sprintf("DELETE FROM followers WHERE `id` = %d;",
            $id
        );
        $result = $db->query($q); // execute query
    }

    // return a profile object by ID
    public static function getFollower($id) {
        $db = Db::instance(); // create db connection
        // build query
        $q = sprintf("SELECT * FROM `%s` WHERE `id` = %d;",
            self::DB_TABLE,
            $id
        );
        $result = $db->query($q); // execute query
        if($result->num_rows == 0) {
            return null;
        } else {
            $row = $result->fetch_assoc(); // get results as associative array

            $follower = new Follower(); // instantiate
            $follower->id   = $row['id'];
            $follower->username      = $row['username'];
            $follower->follower     = $row['follower'];

            return $follower; // return the member
        }
    }

    // return all Followers in an array
    public static function getFollowers() {
        $db = Db::instance();
        $q = "SELECT * FROM `".self::DB_TABLE."`";
        $result = $db->query($q);

        $followers = array();
        if($result->num_rows != 0) {
            while($row = $result->fetch_assoc()) {
                $followers[] = self::getFollower($row['id']);
            }
        }
        return $followers;
    }

    //Saves the new user/follower and adds them to the database
    public function save($followId, $myId){
        return $this->insert($followId, $myId);
    }

    public function saveUnfollow($followId, $myId) {
        return $this->remove($followId, $myId);
    }

    //Inserts the user/follower into the database
    public function insert($followId, $myId) {
        if($this->id != 0)
            return null;

        $db = Db::instance(); // connect to db

        $q = sprintf("UPDATE `profiles` SET
        `number_following`     = `number_following` + 1
        WHERE `profile_id` = $myId");
        $db->query($q);

        $q1 = sprintf("UPDATE `profiles` SET
        `number_followers`     = `number_followers` + 1
        WHERE `profile_id` = $followId");
        $db->query($q1);

        $q2 = sprintf("INSERT INTO followers (`username`, `follower`)
    VALUES (%s, %s);",
            $db->escape($this->username),
            $db->escape($this->follower)
        );

        $db->query($q2); // execute query
        return $db->getInsertID();
    }

    public function remove($followId, $myId) {
        if($this->id != 0)
            return null;

        $db = Db::instance(); // connect to db

        $q = sprintf("UPDATE `profiles` SET
        `number_following`     = `number_following` - 1
        WHERE `profile_id` = $myId");
        $db->query($q);

        $q1 = sprintf("UPDATE `profiles` SET
        `number_followers`     = `number_followers` - 1
        WHERE `profile_id` = $followId");
        $db->query($q1);
        $q2 = sprintf("DELETE FROM followers WHERE `username` = %s, `follower` = %s;",
            $db->escape($this->username),
            $db->escape($this->follower)
        );

        $db->query($q2); // execute query
        return $db->getInsertID();
    }




    //Updates specified data in the database
    public function update() {
        if($this->id == 0)
            return null; // can't update something without an ID

        $db = Db::instance(); // connect to db
        $q = sprintf("UPDATE `followers` SET
    `username` =   $db->escape($this->user),
    `follower`     = $db->escape($this->follower)
    WHERE `id`     = $db->escape($this->id);");

        $db->query($q); // execute query
        return $db->id; // return this object's ID
    }

}
