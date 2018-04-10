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
            case 'updateInfo':
                $this->updateInfo();
                break;
            case 'updatePassword':
                $this->updatePassword();
                break;
            case 'login':
                $this->login();
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
            case 'signupProcess':
    				    $this->signupProcess();
                break;
            case 'logout':
                $this->logout();
                break;
            case 'topic':
                $this->topic();
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
      $json = array('usernames' => $usernames);
      header('Content-Type: application/json'); // let client know it's Ajax
      echo json_encode($json); // print the JSON
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
      $profile->firstname    = $row['firstname'];

      // If result matched $username and $password, table row must be 1 row
      if($result->num_rows != 0) {
        $_SESSION['username'] = $profile->firstname;
        $_SESSION['profile_id'] = $profile->profile_id;
        header('Location: '.BASE_URL); exit();
      } else {
        header('Location: '.BASE_URL);
      }
      else {
        header('Location: '.BASE_URL.'/login');

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
        $username  	 = $_POST['username'];  // required
		$firstname 	 = $_POST['firstname']; // required
		$lastname 	 = $_POST['lastname'];  // required
		$password  	 = $_POST['password'];  // required
		$email       = $_POST['email'];     // required
        $address 	 = $_POST['address'];
        $timezone 	 = $_POST['timezone'];  // required


        if( empty($firstname) || empty($lastname) || empty($username) || empty($password) || empty($email) || empty($timezone)) {
			header('Location: '.BASE_URL); exit();
		}

		$profile = new Profile();
		$profile->firstname    = $firstname;
		$profile->lastname     = $lastname;
		$profile->username    	= $username;
		$profile->password    	= $password;
		$profile->email        = $email;
		$profile->address      = $address;
		$profile->timezone     = $timezone;
        $profile->number_posts        = 0;

		$profile_id = $profile->save(0);
    if ($profile_id == null)
    {
      header('Location: '.BASE_URL); exit();
    }
		header('Location: '.BASE_URL.'/login/'); exit();
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

    public function updateInfo()
    {
        //When user updates info in profile page
    }

    public function updatePassword()
    {
        //When user updates password in profile page
    }
}
