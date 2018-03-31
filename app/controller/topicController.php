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
                $this->view($topic_id);
                break;
        }
    }


    public function newPost($topic_id)
    {
      $post = $_POST['post']; // required
      $profile_id = $_POST['profile_id'];

  		if( empty($post) ) {
  			header('Location: '.BASE_URL); exit();
  		}

  		$mypost = new Post();
  		$mypost->description  = $post;
  		$mypost->date_posted  = date("Y-m-d");
      $mypost->number_posts = 0;
      $mypost->topic_id = $topic_id;
      $mypost->profile_id = $profile_id;

  		$post_id = $mypost->save($profile_id, $topic_id);
  		header('Location: '.BASE_URL.'/topic/view/'.$topic_id); exit();
    }

    public function view($topic_id)
    {
        $pageTitle = 'New Topic';
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

}
