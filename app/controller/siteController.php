<?php

include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a SiteController and route it
$sc = new SiteController();
$sc->route($action);

class SiteController
{
    // route us to the appropriate class method for this action
    public function route($action)
    {
        switch ($action) {
            case 'home':
                $this->home();
                break;
            case 'timeline':
                $this->timeline();
                break;
            case 'stories':
                $this->stories();
                break;
            case 'forum':
                $this->forum();
                break;
            case 'myAccount':
                $this->myAccount();
                break;
            case 'findAccount':
                $this->findAccount();
                break;
            case 'login':
                $this->login();
                break;
            case 'signupProcess':
                $this->signupProcess();
                break;
            case 'logout':
                $this->logout();
                break;
            case 'topic':
                $this->topic();
                break;

            case 'updateInfo':
                $this->updateInfo();
                break;
            case 'updatePassword':
                $this->updatePassword();
                break;
            case 'follow':
                $this->follow();
                break;
            case 'unfollow':
                $this->unfollow();
                break;
            case 'changeRole':
                $this->changeRole();
                break;
            case 'loginProcess':
                if (isset($_POST['login'])) {
                    $user = $_POST['user'];
                    $pass = $_POST['pass'];
                    $this->loginProcess($user, $pass);
                } else if (isset($_POST['signup'])) {
                    $this->signup();
                }
                break;
        }
    }

    public function findAccount() {
      $profiles = array();
      $profiles = Profile::getProfiles();
      $usernames = array();
      foreach($profiles as $profile) {
        array_push($usernames, $profile->username);
      }
      $json = array('Registered Users:' => $usernames);
      header('Content-Type: application/json'); // let client know it's Ajax
        $output = print_r(json_encode($json)); // print the JSON
        dumpArray($output);
    }

    public function dumpArray($json) {
        echo '<pre>';
        print_r(json_encode($json)); // print the JSON
        echo '</pre>';
    }

//Runs the login process to gain access to the website
    public function loginProcess($un, $pw)
    {
      $correctUser = 'tony';
      $correctPass = 'gui';
      $db = Db::instance();
      $q = "SELECT * FROM profiles WHERE username='$un' and password='$pw'";
      $result = $db->query($q);

      $row = $result->fetch_assoc(); // get results as associative array
      $profile = new Profile();
      $profile->profile_id   = $row['profile_id'];
      $profile->username   = $row['username'];
      $profile->number_posts = $row['number_posts'];
      $profile->password     = $row['password'];
      $profile->role         = $row['role'];

      // If result matched $username and $password, table row must be 1 row
      if($result->num_rows != 0) {
        $_SESSION['username'] = $profile->username;
        $_SESSION['profile_id'] = $profile->profile_id;
        $_SESSION['number_posts'] = $profile->number_posts;
        $_SESSION['password'] = $profile->password;
        $_SESSION['role'] = $profile->role;
        header('Location: '.BASE_URL); exit();
      } else {
        header('Location: '.BASE_URL);
      }

    }

    //Runs the signup process to gain access to the website
    public function signup()
    {
        $pageTitle = 'Home';
        include_once SYSTEM_PATH . '/view/header.tpl';
        include_once SYSTEM_PATH . '/view/signup.tpl';
        include_once SYSTEM_PATH . '/view/footer.tpl';
    }

    public function signupProcess() {
        $correctcode = 'cookie123';
        $adminRole = 'Admin';
        $normalRole = 'Normal User';
        $noAddress = 'N/A';

        $username  	 = $_POST['username'];  // required
		$firstname 	 = $_POST['firstname']; // required
		$lastname 	 = $_POST['lastname'];  // required
		$password  	 = $_POST['password'];  // required
        $role        = $_POST['role'];      // required
        $passcode    = $_POST['passcode'];
		$email       = $_POST['email'];     // required
        $address 	 = $_POST['address'];
        $timezone 	 = $_POST['timezone'];  // required

        if( empty($firstname) || empty($lastname) || empty($username) || empty($password)  || empty($email) || empty($timezone)) {
            header('Location: '.BASE_URL); exit();
		}

		$profile = new Profile();
		$profile->firstname    = $firstname;
		$profile->lastname     = $lastname;
		$profile->username    	= $username;
		$profile->password    	= $password;

		if ($correctcode != $passcode) {
            $profile->role = $normalRole;
        }
        else {
		    $profile->role = $adminRole;
        }

		$profile->email        = $email;

		if ($address != "") {
            $profile->address = $address;
        }
        else {
		    $profile->address = $noAddress;
        }

		$profile->timezone     = $timezone;
        $profile->number_posts  = 0;

        $_SESSION['role'] = $profile->role;
		$profile_id = $profile->save(0);


        if ($profile_id == null)
        {
          header('Location: '.BASE_URL); exit();
        }
        header('Location: '.BASE_URL.'/login/'); exit();

    }


    public function updateInfo()
    {
        $firstname 	 = $_POST['firstname']; // required
        $lastname 	 = $_POST['lastname'];  // required
        $username  	 = $_POST['username'];  // required
        $email       = $_POST['email'];     // required
        $address 	 = $_POST['address'];
        $timezone 	 = $_POST['timezone'];  // required
        $number_posts = $_SESSION['number_posts'];

        $profile = new Profile();

        $profile->firstname    = $firstname;
        $profile->lastname     = $lastname;
        $profile->username     = $username;
        $profile->email        = $email;
        $profile->address      = $address;
        $profile->timezone     = $timezone;
        $profile->number_posts = $number_posts;
        $profile->profile_id = $_SESSION['profile_id'];
        $_SESSION['number_posts'] = $profile->number_posts;

        $profile_id = $profile->save($profile->profile_id);

        if ($profile_id == null)
        {
            header('Location: '.BASE_URL); exit();
        }
        header('Location: '.BASE_URL.'/myaccount/'); exit();

    }


    public function updatePassword()
    {
        $oldpassword     = $_POST['oldpassword'];
        $newpassword  	 = $_POST['newpassword'];  // required

        if($oldpassword == $_SESSION['password']) {

            $profile = new Profile();

            $profile->password     = $newpassword;

            //Adjust session password to the new one
            $_SESSION['password'] = $profile->password;

            $profile->profile_id = $_SESSION['profile_id'];
            $profile_id = $profile->passwordSave($profile->profile_id);

        }

        if ($profile_id == null)
        {
            header('Location: '.BASE_URL); exit();
        }
        header('Location: '.BASE_URL.'/myaccount/'); exit();

    }

    public function changeRole()
    {

        $normal = "Normal User";
        $admin = "Admin";

        $targetRole = $_POST['target_role'];
        $profID = $_POST['profile_id'];

        $profile = new Profile();

        if ($targetRole == $normal) {
            $profile->role  = $admin;
        }
        elseif ($targetRole == $admin) {
            $profile->role = $normal;
        }

        $profile->profile_id = $profID;
        $profile_id = $profile->saveRole($profile->profile_id);

        if ($profile_id == null)
        {
            header('Location: '.BASE_URL); exit();
        }
        header('Location: '.BASE_URL.'/myaccount/'); exit();
    }

    public function follow()
    {

    }

    public function unfollow()
    {

    }


    //Brings the user to the home page
    public function home()
    {
        $pageTitle = 'Home';
        include_once SYSTEM_PATH . '/view/header.tpl';
        include_once SYSTEM_PATH . '/view/home.tpl';
        include_once SYSTEM_PATH . '/view/footer.tpl';
    }
    public function timeline()
    {
        $pageTitle = 'Timeline';
        include_once SYSTEM_PATH . '/view/header.tpl';
        include_once SYSTEM_PATH . '/view/timeline.tpl';
        include_once SYSTEM_PATH . '/view/footer.tpl';
    }
    public function stories()
    {
        $pageTitle = 'Stories';
        include_once SYSTEM_PATH . '/view/header.tpl';
        include_once SYSTEM_PATH . '/view/stories.tpl';
        include_once SYSTEM_PATH . '/view/footer.tpl';
    }
    public function forum()
    {
        $pageTitle = 'Forum';
        $topics= Topic::getTopics();
        include_once SYSTEM_PATH . '/view/header.tpl';
        include_once SYSTEM_PATH . '/view/forum.tpl';
        include_once SYSTEM_PATH . '/view/footer.tpl';
    }
    public function myAccount()
    {
        $pageTitle = 'My Account';
        include_once SYSTEM_PATH . '/view/header.tpl';
        include_once SYSTEM_PATH . '/view/myaccount.tpl';
        include_once SYSTEM_PATH . '/view/footer.tpl';
    }
    // Brings the user to the login page
    public function login()
    {
        $pageTitle = 'Login';
        include_once SYSTEM_PATH . '/view/header.tpl';
        include_once SYSTEM_PATH . '/view/login.tpl';
        include_once SYSTEM_PATH . '/view/footer.tpl';
    }
    //Logs the user out and sends them to hte unregistered home page
    public function logout()
    {
        unset($_SESSION['username']);
        session_destroy();
        header('Location: ' . BASE_URL);
        exit(); // sends to home page
    }


}
