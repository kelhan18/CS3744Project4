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
        <a class="nav-item nav-link" href="<?= BASE_URL ?>/stories">Stories</a>
    </li>
    <li class="nav-item">
        <a class="nav-item nav-link" href="<?= BASE_URL ?>/forum">Forum</a>
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
    <div class="wrapper">
        <form method="POST" action="<?= BASE_URL ?>/login/process/" name="Login_Form" class="form-signin">
            <h3 class="form-signin-heading">Please Sign In!</h3>
            <hr class="colorgraph"><br>

            <input type="text" class="form-control" name="user" placeholder="Username" required="" autofocus="" />
            <input type="password" class="form-control" name="pass" placeholder="Password" required=""/>

            <button class="btn btn-lg btn-primary btn-block"  name="submit" value="Login" type="submit">Login</button>
        </form>
    </div>
</div>
