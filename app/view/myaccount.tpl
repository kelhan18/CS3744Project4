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
        <a class="nav-item nav-link active" href="<?= BASE_URL ?>/myaccount">My Account</a>
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

<body>
<div id="todo">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <img id = "twitter-logo" src="twitterlogo.png" alt="Twitter Logo" style="width:64px; height:64px;">
                <h1 id ="Twitter">Twitter</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 col-md-offset-1">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <h4 id="current-user-header"></h4>
                            <hr />
                            <div class="form-group">
                                <input id="switch-user-input" class="form-control" type="text" placeholder="User" />
                            </div>
                            <div class="form-group">
                                <button class="btn btn-default" id="switch-user-button">Switch User</button>
                            </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">Following</div>
                    <div class="panel-body">
                        <ul id="following-list">
                        </ul>
                        <hr />
                        <div class="form-group">
                            <input id="follow-input" class="form-control" type="text" placeholder="Username" />
                        </div>
                        <button id="follow-button" class="btn btn-default">Follow</button>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">Followers</div>
                    <div class="panel-body">
                        <ul id="follower-list">
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-7">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="form-group">
                            <textarea id="tweet-input" class="form-control" rows="3" placeholder="What's Happening?"></textarea>
                        </div>
                        <div class="form-group">
                            <button id="tweet-button" class="btn btn-primary">Tweet</button>
                        </div>
                    </div>
                </div>
                <ul id="tweet-list" class="list-group">
                </ul>
            </div>
        </div>
    </div>
</div>
