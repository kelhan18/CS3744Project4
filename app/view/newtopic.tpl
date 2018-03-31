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
      <form method="POST" action="<?= BASE_URL ?>/topic/" name="Topic_Form" class="form-signin">
          <h3 class="form-signin-heading">Please Enter Your Topic Below</h3>
          <hr class="colorgraph"><br>

          <!-- Edit topic info -->
          <label>New topic: <input type="text" name="topic" required="required"></input></label></br>
          <button class="btn btn-lg btn-primary btn-block"  name="submit" value="Create New Profile" type="submit">Create New Topic</button>

        </form>
  </div>
</div>
