<?php

class Follower {

    const DB_TABLE = 'followers'; // database table name
    // database fields for this table
    public $id = 0;
    public $user = '';
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
            $follower->user      = $row['user'];
            $follower->follower     = $row['follower'];

            return $follower; // return the member
        }
    }

    // return all Followers in an array
    public static function getFollowers() {
        $db = Db::instance();
        $q = "SELECT id FROM `".self::DB_TABLE."`";
        $result = $db->query($q);
        $followers = array();
        if($result->num_rows != 0) {
            while($row = $result->fetch_assoc()) {
                $followers[] = self::getTopic($row['id']);
            }
        }
        return $followers;
    }

    //Saves the new user/follower and adds them to the database
    public function save($follow, $myId){
        return $this->insert($follow, $myId);

    }

    //Inserts the user/follower into the database
    public function insert($follow, $myId) {
        if($this->id != 0)
            return null;

        $db = Db::instance(); // connect to db

        $q = sprintf("UPDATE `profiles` SET
        `number_following`     = `number_following` + 1
        WHERE `profile_id` = $myId");
        $db->query($q);

        $q = sprintf("UPDATE `profiles` SET
        `number_followers`     = `number_followers` + 1
        WHERE `profile_id` = $follow");
        $db->query($q);

        $q = sprintf("INSERT INTO followers (`user`, `follower`)
    VALUES (%s, %s);",
            $db->escape($this->user),
            $db->escape($this->follower)
        );

        $db->query($q); // execute query
        return $db->getInsertID();
    }

    //Updates specified data in the database
    public function update() {
        if($this->id == 0)
            return null; // can't update something without an ID

        $db = Db::instance(); // connect to db
        $q = sprintf("UPDATE `followers` SET
    `user` =   $db->escape($this->user),
    `follower`     = $db->escape($this->follower)
    WHERE `id`     = $db->escape($this->id);");

        $db->query($q); // execute query
        return $db->id; // return this object's ID
    }

}
