<?php

include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a SiteController and route it
$tc = new TopicController();
$tc->route($action);

class TopicController
{
    // route us to the appropriate class method for this action
    public function route($action)
    {
        switch ($action) {
            case 'newTopic':
                $this->newTopic();
                break;
            case 'newPost':
                $topic_id = $_GET['topic_id'];
                $this->newPost($topic_id);
                break;
            case 'topic':
                $this->topic();
                break;
            case 'post':
                $this->post();
                break;
            case 'view':
                $topic_id = $_GET['topic_id'];
                if ($topic_id != 'newpost') {
                  $this->view($topic_id);
                }
                else {
                  $this->addPost();
                }
                break;
        }
    }

    public function newPost($topic_id)
    {
      $post = $_POST['description']; // required
      $profile_id = $_POST['profile_id'];

      if( empty($post) ) {
        header('Location: '.BASE_URL); exit();
      }

      //Censors out curse words from the post name using neutrino api
      function curl_post_request($url, $data)
      {
          $ch = curl_init($url);
          curl_setopt($ch, CURLOPT_POST, 1);
          curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
          curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
          $content = curl_exec($ch);
          curl_close($ch);
          return $content;
      }

      $postData = array(
        "user-id" => "campbel1",
        "api-key" => "DXthaen9oPaCDI7yWykvYfzicRSFsEQY7OfBctf8Ugvwmul0",
        "content" => $post,
        "censor-character" => "*"
      );

      $json = curl_post_request("https://neutrinoapi.com/bad-word-filter", $postData);
      $result = json_decode($json, true);

      $post = $result["censored-content"];

      $topic = Topic::getTopic($topic_id);
      Activity::addActivity($profile_id, 'you added a post in the topic: '.$topic->topic);

  		$mypost = new Post();
  		$mypost->description  = $post;
  		$mypost->date_posted  = date("Y-m-d");
      $mypost->number_posts = 0;
      $mypost->topic_id = $topic_id;
      $mypost->profile_id = $profile_id;

  		$post_id = $mypost->save($profile_id, $topic_id);
      $profile = Profile::getProfile($profile_id);
      if($post_id != 0) {
			$json = array(
				'success' => 'success',
				'post_id' => $post_id,
        'firstname' => $profile->firstname,
        'lastname' => $profile->lastname,
        'date' => $mypost->date_posted,
        'censored' => $post
			);
		} else {
			$json = array('error' => 'Could not save post.');
  		}

  		header('Content-Type: application/json'); // let client know it's Ajax
  		echo json_encode($json); // print the JSON

    }

    public function view($topic_id)
    {
        $pageTitle = 'Topic';
        $posts= Post::getPosts($topic_id);
        $topic = Topic::getTopic($topic_id);
        include_once SYSTEM_PATH . '/view/header.tpl';
        include_once SYSTEM_PATH . '/view/posts.tpl';
        include_once SYSTEM_PATH . '/view/footer.tpl';
    }

    public function newTopic()
    {
        $pageTitle = 'New Topic';
        include_once SYSTEM_PATH . '/view/header.tpl';
        include_once SYSTEM_PATH . '/view/newtopic.tpl';
        include_once SYSTEM_PATH . '/view/footer.tpl';
    }

    public function topic()
    {
      $topic = $_POST['topic']; // required
      $profile_id = $_POST['profile_id'];

  		if( empty($topic) ) {
  			header('Location: '.BASE_URL); exit();
  		}

      //Censors out curse words from the topic name using neutrino api
      function curl_post_request($url, $data)
      {
          $ch = curl_init($url);
          curl_setopt($ch, CURLOPT_POST, 1);
          curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
          curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
          $content = curl_exec($ch);
          curl_close($ch);
          return $content;
      }

      $postData = array(
        "user-id" => "campbel1",
        "api-key" => "DXthaen9oPaCDI7yWykvYfzicRSFsEQY7OfBctf8Ugvwmul0",
        "content" => $topic,
        "censor-character" => "*"
      );

      $json = curl_post_request("https://neutrinoapi.com/bad-word-filter", $postData);
      $result = json_decode($json, true);

      $topic = $result["censored-content"];

      // Adds the activity of the profile creating the topic
      Activity::addActivity($profile_id, 'you created the topic: '.$topic);

  		$mytopic = new Topic();
  		$mytopic->topic        = $topic;
  		$mytopic->date_posted  = date("Y-m-d");
      $mytopic->number_posts = 0;

  		$topic_id = $mytopic->save(0);
  		header('Location: '.BASE_URL.'/forum/'); exit();
    }

    // //Censors out words that might be deemed inappropriate/offensive
      // function curl_post_request($url, $data)
      // {
      //     $ch = curl_init($url);
      //     curl_setopt($ch, CURLOPT_POST, 1);
      //     curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
      //     curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
      //     $content = curl_exec($ch);
      //     curl_close($ch);
      //     return $content;
      // }
      //
      // $postData = array(
      //   "user-id" => "campbel1",
      //   "api-key" => "DXthaen9oPaCDI7yWykvYfzicRSFsEQY7OfBctf8Ugvwmul0",
      //   "content" => $description,
      //   "censor-character" => "*"
      // );
      //
      // $json = curl_post_request("https://neutrinoapi.com/bad-word-filter", $postData);
      // $result = json_decode($json, true);
      //
      // $description = $result["censored-content"];
    // }

}
