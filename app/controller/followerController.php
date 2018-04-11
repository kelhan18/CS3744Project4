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

        #Check if the person you want to follow is in database
        $q = "SELECT profile_id FROM profiles WHERE username ='$follow'";
        $result = $db->query($q);

        // If result matched $username and $password, table row must be 1 row
        if($result->num_rows != 0) {
            $follower = new Follower();
            $follower->user    = $follow;
            $follower->follower = $myId;

            $follower_id = $follower->save($follow, $myId);

            #if ($follower_id == null)
            #{
            #    ob_start();
            #    echo "Error occured. Follow request not processed";
            #    header('Location: '.BASE_URL.'/myaccount/'); exit();
            #    ob_end_flush();
            #}
            #header('Location: '.BASE_URL.'/myaccount/'); exit();

        } else {
            ob_start();
            echo "That person is not a valid user!";
            #header('Location: '.BASE_URL.'/myaccount/');
            ob_end_flush();
        }



    }

    public function unfollow()
    {
        $unfollow = $_POST['toUnfollow'];
        $profiles = Profile::getProfiles();
    }

}
