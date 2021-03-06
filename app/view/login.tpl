<body class="login-body">
<!-- Add your site or application content here -->
<!--nav bar-->
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
        <a class="nav-item nav-link" href="<?= BASE_URL ?>/myaccount">My Account</a>
    </li>
    <li class="nav-item">
        <a class="nav-item nav-link" href="<?= BASE_URL ?>/logout">Logout</a>
    </li>
    <?php else: ?>
    <li class="nav-item">
        <a class="nav-item nav-link active" href="<?= BASE_URL ?>/login">Login</a>
    </li>
    <?php endif; ?>
</ul>

<div class = "container">
    <div class="wrapper2">
        <form class="navbar-form" method="POST" action="<?= BASE_URL ?>/login/process/" name="Login_Form" class="form-signin">
            <h3 class="form-signin-heading">Please Sign In!</h3>
            <hr class="colorgraph"><br>

            <input class="input-text" type="text" class="form-control" name="user" placeholder="Username"  autofocus="" />
            <input class="input-text" type="password" class="form-control" name="pass" placeholder="Password" />
            <ul id="UserList">

            </ul>

            <button class="btn btn-lg btn-primary btn-block"  name="login" value="Login" type="submit">Login</button>
            <button class="btn btn-lg btn-info btn-block"  name="signup" value="Signup" type="submit">Sign Up</button>
        </form>
        <form class="navbar-form" method="POST" action="<?= BASE_URL ?>/login/findAccount" target="iframe" name="Find_Account_Form" class="form-signin">
            <button class="btn btn-lg btn-secondary btn-block" name="findaccount" type="submit">Find Account</button>
        </form>

        <iframe name="iframe">

        </iframe>
    </div>
</div>
