<?php

include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a SiteController and route it
$tc = new followerController();
$tc->route($action);

class FollowerController
{
    // route us to the appropriate class method for this action
    public function route($action)
    {
        switch ($action) {
            case 'follow':
                $this->follow();
                break;
            case 'unfollow':
                $this->unfollow();
                break;
        }
    }

    public function follow()
    {
        $follow = $_POST['toFollow']; //Username of person to follow
        $myUsername = $_POST['myUsername'];
        $myId   = $_POST['myId'];

        $db = Db::instance();

        #Check if the person you want to follow is in database and the user/follower pair isnt already a thing
        $q = "SELECT profile_id FROM profiles WHERE username ='$follow'";
        $q2 = "SELECT id from followers WHERE username = '$follow' and follower ='$myUsername'";
        $result = $db->query($q);
        $result2 = $db->query($q2);
        $row = $result->fetch_assoc(); // get results as associative array

        $followId = $row['profile_id'];

        // If result matched $username and $password, table row must be 1 row
        if($result->num_rows != 0) {
            if ($result2->num_rows == 0) {
                $follower = new Follower();
                $follower->username    = $follow;
                $follower->follower = $myUsername;

                $follower_id = $follower->save($followId, $myId);

                if ($follower_id == null)
                {
                    header('Location: '.BASE_URL.'/myaccount/'); exit();
                }

                // Add the activity for the follower and for the followee
                Activity::addActivity($myId, 'you followed '.$follow);
                Activity::addActivity($followId, $myUsername.' followed you');

                header('Location: '.BASE_URL.'/myaccount/'); exit();
            }
            else {
                header('Location: '.BASE_URL.'/myaccount/');
            }

        } else {
            header('Location: '.BASE_URL.'/myaccount/');
        }

    }

    public function unfollow()
    {
        $unfollow = $_POST['toUnfollow']; //Username of person to follow
        $myUsername = $_POST['myUsername'];
        $myId   = $_POST['myId'];

        $db = Db::instance();
        #Check if the person you want to unfollow is in database and the user/follower pair is already a thing
        $q = "SELECT profile_id FROM profiles WHERE username ='$unfollow'";
        $q2 = "SELECT id from followers WHERE username = '$unfollow' and follower ='$myUsername'";
        $result = $db->query($q);
        $result2 = $db->query($q2);
        $row = $result->fetch_assoc(); // get results as associative array

        $followId = $row['profile_id'];

        // If result matched $username and $password, table row must be 1 row
        if($result->num_rows != 0) {
            if ($result2->num_rows != 0) {
                $follower = new Follower();
                $follower->username    = $unfollow;
                $follower->follower = $myUsername;

                $follower_id = $follower->saveUnfollow($followId, $myId);

                if ($follower_id == null)
                {
                    header('Location: '.BASE_URL.'/myaccount/'); exit();

                }
                header('Location: '.BASE_URL.'/myaccount/'); exit();
            }
            else {
                header('Location: '.BASE_URL.'/myaccount/');
            }

        } else {
            header('Location: '.BASE_URL.'/myaccount/');
        }
    }

}
