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
            case 'addPost':
                $this->addPost();
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

    public function addPost()
    {
        $description = $_POST['description']; // required
        $profile_id = $_POST['profile_id']; // required
        $topic_id = $_POST['topic_id']; // required

        $mypost = new Post();
        $mypost->description  = $description;
        $mypost->date_posted  = date("Y-m-d");
        $mypost->number_posts = 0;
        $mypost->topic_id = $topic_id;
        $mypost->profile_id = $profile_id;

        $post_id = $mypost->save($profile_id, $topic_id);
    }

    public function newPost($topic_id)
    {
      $post = $_POST['post']; // required
      $profile_id = $_POST['profile_id'];

  		if( empty($post) ) {
  			header('Location: '.BASE_URL); exit();
  		}

  		$mypost = new Post();
  		$mypost->description  = censor($post);
  		$mypost->date_posted  = date("Y-m-d");
      $mypost->number_posts = 0;
      $mypost->topic_id = $topic_id;
      $mypost->profile_id = $profile_id;

  		$post_id = $mypost->save($profile_id, $topic_id);
  		header('Location: '.BASE_URL.'/topic/view/'.$topic_id); exit();

      if($mypost->post_id != 0) {
			$json = array(
				'success' => 'success',
				'post_id' => $mypost->post_id
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
        echo(censor('shit'));
        $pageTitle = 'New Topic';
        include_once SYSTEM_PATH . '/view/header.tpl';
        include_once SYSTEM_PATH . '/view/newtopic.tpl';
        include_once SYSTEM_PATH . '/view/footer.tpl';
    }

    public function topic()
    {
      $topic = $_POST['topic']; // required

  		if( empty($topic) ) {
  			header('Location: '.BASE_URL); exit();
  		}

  		$mytopic = new Topic();
  		$mytopic->topic        = $topic;
  		$mytopic->date_posted  = date("Y-m-d");
      $mytopic->number_posts = 0;

  		$topic_id = $mytopic->save(0);
  		header('Location: '.BASE_URL.'/forum/'); exit();
    }

    //Censors out words that might be deemed inappropriate/offensive
    function censor($input)
    {
      $data = array(
        "user-id" => "campbel1",
        "api-key" => "DXthaen9oPaCDI7yWykvYfzicRSFsEQY7OfBctf8Ugvwmul0",
        "content" => $input,
        "censor-character" => "*"
      );

      $ch = curl_init("https://neutrinoapi.com/bad-word-filter");
      curl_setopt($ch, CURLOPT_POST, 1);
      curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
      curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
      $result = curl_exec($ch);
      curl_close($ch);

      $result = json_decode($json, true);

      $final = $result["censored-content"];
      return $final;
    }

}
