
<ul class="nav nav-pills nav-justified justify-content-center">
    <li class="nav-item">
        <a class="nav-item nav-link" href="<?= BASE_URL ?>">Home</a>
    </li>
    <?php if(isset($_SESSION['username'])): ?>
    <li class="nav-item">
        <a class="nav-item nav-link" href="<?= BASE_URL ?>/timeline">Timeline</a>
    </li>
    <li class="nav-item">
        <a class="nav-item nav-link" href="<?= BASE_URL ?>/stories">Medal Of Honor</a>
    </li>
    <li class="nav-item">
        <a class="nav-item nav-link" href="<?= BASE_URL ?>/forum">Forum</a>
    </li>
    <li class="nav-item">
        <a class="nav-item nav-link" href="<?= BASE_URL ?>/logout">Logout</a>
    </li>
    <?php else: ?>
    <li class="nav-item">
        <a class="nav-item nav-link" href="<?= BASE_URL ?>/login">Login</a>
    </li>
    <?php endif; ?>
</ul>

<div class="main">
    <!-- container -->

    <div class="main-content">
        <br>
        <h1 style="text-align: left;margin-left:7%;"><?= $topic->topic?></h1>
        <ul class="breadcrumb">
            <li>Discusson</li>
            <form method="POST" action="<?= BASE_URL ?>/topic/newpost/<?= $topic->topic_id?>/" name="Post_Form" class="form-signin">
                <h3 class="form-signin-heading">Please Enter Your Post Below</h3>
                <hr class="colorgraph"><br>

                <!-- Edit topic info -->
                <label>New Post: <input type="text" name="post" required="required"></input></label></br>
                <input type='hidden' name="profile_id" value="<?PHP if(isset($_SESSION['profile_id'])){echo $_SESSION['profile_id'];}?>"></input>
                <button class="btn btn-lg btn-primary btn-block" name="submit" type="submit">New Post</button>
                </form>
        </ul>
        <?php foreach($posts as $post): ?>
        <?php $profile = Profile::getProfile($post->profile_id)?>
        <div class="row_forum" >
          <div class="profile-card">
              <header>
                <h4 style="margin-left:20px;margin-top:8px;color: red;"><?= $profile->firstname?> <?= $profile->lastname?></h4>
                <h5 style="margin-left:20px;margin-top:8px;"><?= $post->description?></h5>
                <p  style="margin-left:20px;margin-top:8px;"><?= $post->date_posted?></p>
              </header>

              <div class="profile-bio">
                <div class="posts"><?= $profile->number_posts?></div>
                <p>Posts</p>
              </div>
          </div>
        </div>
        <?php endforeach; ?>
        <!-- END Container -->

</div>
