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
      <form method="POST" action="<?= BASE_URL ?>/signup/" name="Sign_Form" class="form-signin">
          <h3 class="form-signin-heading">Please Enter Your Information Below</h3>
          <hr class="colorgraph"><br>

          <!-- Edit personal info -->
          <label>First Name: <input type="text" name="firstname" required="required"></input></label></br>
          <label>Last Name: <input type="text" name="lastname" required="required"></input></label></br>
          <label>Username: <input type="text" name="username" required="required"></input></label></br>
          <label>Password: <input type="text" name="password" required="required"></input></label></br>
          <label>Name of Photo: <input type="text" name="photo" ></input></label></br>


          <button class="btn btn-lg btn-primary btn-block"  name="submit" value="Create New Profile" type="submit">Create New Profile</button>
      </form>
  </div>
</div>
