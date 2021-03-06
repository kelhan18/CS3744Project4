<?php
if(isset($_SESSION['username']))
  $profile = Profile::getProfile($_SESSION['profile_id']);
?>

<body class="landing">

<ul class="nav nav-pills nav-justified justify-content-center">
    <li class="nav-item">
        <a class="nav-item nav-link active" href="<?= BASE_URL ?>">Home</a>
    </li>
    <?php if(isset($_SESSION['username'])): ?>
    <li class="nav-item">
        <a class="nav-item nav-link" href="<?= BASE_URL ?>/timeline">Timeline</a>
    </li>
    <li class="nav-item">
        <a class="nav-item nav-link" href="<?= BASE_URL ?>/stories">Medal of Honor</a>
    </li>
    <li class="nav-item">
        <a class="nav-item nav-link" href="<?= BASE_URL ?>/forum">Forum</a>
    </li>
    <li class="nav-item">
        <a class="nav-item nav-link" href="<?= BASE_URL ?>/myaccount">My Account</a>
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

<div id="page-wrapper">

    <!-- Banner -->

    <section id="banner">
        <div class="inner">
            <h2>The Battle Of Peleliu</h2>
        </div>
    </section>

    <!-- One -->
    <section id="one" class="wrapper style1 special">
        <div class="inner">
            <header class="major">
                <h2>The Battle of Peleliu, codenamed Operation Stalemate II by the US military,
                was fought between the U.S. and Japan during WWII.</h2>
                <p>
                    It occured from September to November 1944 on the island of Peleliu in the Pacific.
                </p>
            </header>
            <ul class="icons major">
                <li><span class="icon major style1"><i class="fab fa-hotjar"></i></span></li>
                <li><span class="icon major style2"><i class="fas fa-chess-king"></i></span></li>
                <li><span class="icon major style3"><i class="fas fa-bolt"></i></span></li>
            </ul>
        </div>
    </section>
    <!-- Two -->
    <section id="two" class="wrapper alt style2">
        <section class="spotlight">
            <div class="image"><img src="<?= BASE_URL ?>/public/img/Icons/battle.jpg" class="img-thumbnail" alt="" /></div>
            <div class="content">
                <h2>The Never-ending Battle</h2>
                <p>Major General William Rupertus, Commander of the 1st Marine Division, predicted that
                    the island would be secured in 4 days. However, Japan had adapted from previous defeats
                    and developed new island-defense tactics and well-crafted fortifications that allowed
                    stiff resistance, extending the battle for more than 2 months.
                </p>
            </div>
        </section>
        <section class="spotlight">
            <div class="image"><img src="<?= BASE_URL ?>/public/img/Icons/american.jpg" class="img-thumbnail" alt="" /></div>
            <div class="content">
                <h2>American Casualties</h2>
                <ul>
                    <li>47,561 Americans participated</li>
                    <li>2,336 killed</li>
                    <li>8,450 wounded</li>
                </ul>
            </div>
        </section>
        <section class="spotlight">
            <div class="image"><img src="<?= BASE_URL ?>/public/img/Icons/japan.jpg" class="img-thumbnail" alt="" /></div><div class="content">
                <h2>Japanese Casualties</h2>
                <ul>
                    <li>10,900 Japanese participated</li>
                    <li>10,695 killed</li>
                    <li>202 captured</li>
                        <ul>
                            <li>183 foreign laborers</li>
                            <li>19 Japanese soldiers</li>
                        </ul>
                    <li>17 tanks lost</li>
                </ul>
            </div>
        </section>
    </section>

    <section id="three" class="wrapper style3 special">
            <div class="inner">
              <?php if(isset($_SESSION['username'])):
                 $followers = Follower::getFollowers();
                 $followings = array($_SESSION['profile_id']);
                 foreach($followers as $follower):
                    if($follower->follower == $_SESSION['username']):
                         $userProfile = Profile::getProfileByUsername($follower->username);
                         $followings[] = $userProfile->profile_id;
                    endif;
                  endforeach;
                  $activities = Activity::getAllActivities($followings); ?>

                  <h1>Activity Feed</h1>
                  <?php foreach($activities as $activity): ?>
                      <li> <?= $activity ?> </li>
                  <?php endforeach; ?>

              <?php else: ?>
                <h1>Log In To See Personalized Activity Feed</h1>
              <?php endif; ?>
            </div>
        </section>

    <section id="one" class="wrapper style1 special">

        <?php if(isset($_SESSION['username'])): ?>
        <div class="input-group mb-3" id="changeBox">
            <h3>Person to Unfollow</h3>
            <br>
            <input type="text" class="form-control" id="toUnfollow" placeholder="Person to Unfollow" aria-label="Person to Unfollow" aria-describedby="basic-addon2">
            <div class="input-group-append">
                <input type="hidden" id="myUsername" value="<?= $profile->username?>"/>
                <input type="hidden" id="myId" value="<?= $profile->profile_id?>"/>
                <button class="btn btn-outline-primary" id="unfollowButton" name="unfollowButton" type="submit">Unfollow</button>
            </div>
        </div>

        <script src="//d3js.org/d3.v3.min.js"></script>
        <script type="text/javascript">var url = '<?php echo BASE_URL ?>' ;</script>
        <script type="text/javascript" src="<?= BASE_URL ?>/public/js/tree.js"></script>

        <?php endif; ?>
      </section>
</div>
