
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
        <a class="nav-item nav-link active" href="<?= BASE_URL ?>/forum">Forum</a>
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
            <form method="POST" action="<?= BASE_URL ?>/topic/new/">
              <h3 class="form-signin-heading">Forum Discussion</h3>
              <hr class="colorgraph"><br>
              <button class="btn btn-lg btn-primary btn-block" name="submit" type="submit">New Discussion</button>
          </form>
        <?php foreach($topics as $mytopic): ?>

        <div class="container" style="margin-top: 20px; margin-bottom: 20px;">
            <div class="row panel">
                <p>Responses</p>
                <div class="posts">
                    <?= $mytopic->number_posts?>
                </div>
                <div class="col-md-8  col-xs-12">
                    <div class="header">
                        <h3 style="margin-left:20px;margin-top:8px;"><a href="<?= BASE_URL ?>/topic/view/<?= $mytopic->topic_id?>" style"color: black;text-decoration: none;"><?= $mytopic->topic?></a></h3>
                        <p  style="margin-left:20px;margin-top:8px;"><?= $mytopic->date_posted?></p>
                    </div>
                </div>
            </div>
            <!--
              <div id="forum-post">
                  <header>
                    <h3 style="margin-left:20px;margin-top:8px;"><a href="<?= BASE_URL ?>/topic/view/<?= $mytopic->topic_id?>" style"color: black;text-decoration: none;"><?= $mytopic->topic?></a></h3>
                    <p  style="margin-left:20px;margin-top:8px;"><?= $mytopic->date_posted?></p>
                  </header>
                  <div class="outer">
                      <p>Responses</p>
                    <div class="posts inner">
                        <?= $mytopic->number_posts?>
                    </div>
                  </div>
              </div>
              -->
        <?php endforeach; ?>
        <!-- END Container -->

</div>
