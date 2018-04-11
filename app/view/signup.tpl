<body class="signup-body">
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


<div class="main">
    <div class="main-content forum-background">
<div class = "container">
    <div class="wrapper">
      <form class="navbar-form" method="POST" action="<?= BASE_URL ?>/signup/" name="Sign_Form" class="form-signin">
          <h3 class="form-signin-heading">Please Enter Your Information Below</h3>
          <hr class="colorgraph"><br>

          <!-- Edit personal info -->
          <div class="form-group">
              <label>First Name: *
                  <input type="text" name="firstname" required="required">
          </div>
          <div class="form-group"><label>Last Name: *<input type="text" name="lastname" required="required"></label></div>
          <div class="form-group"><label>Username: *<input type="text"  name="username" required="required"></label></div>
          <div class="form-group"><label>Password: *<input type="password"  name="password" required="required"></label></div>
          <div class="form-group">
              <label for="roleSelect">Site Role: *
              <select id="roleSelect">
                  <option value="Normal User">Normal User</option>
                  <option value="Admin">Admin</option>
              </select>
              <small id="emailHelp" class="form-text text-muted">To Sign up as admin, must know secret passcode</small>
          </div>
          <div class="form-group">
              <label for="isAdmin">Secret Passcode:
                  <input type="text" name="passcode">
          </div>
          <div class="form-group"><label>Email: *<input type="email" name="email" required="required"></label></div>
          <div class="form-group"><label>Address: <input type="text" name="address" ></label></div>

          <label>Time Zone: *
          <select name="timezone" id="DropDownTimezone" required="required">
              <option value="(GMT -12:00) Eniwetok, Kwajalein">(GMT -12:00) Eniwetok, Kwajalein</option>
              <option value="(GMT -11:00) Midway Island, Samoa">(GMT -11:00) Midway Island, Samoa</option>
              <option value="(GMT -10:00) Hawaii">(GMT -10:00) Hawaii</option>
              <option value="(GMT -9:00) Alaska">(GMT -9:00) Alaska</option>
              <option value="(GMT -8:00) Pacific Time (US & Canada)">(GMT -8:00) Pacific Time (US & Canada)</option>
              <option value="(GMT -7:00) Mountain Time (US & Canada)">(GMT -7:00) Mountain Time (US & Canada)</option>
              <option value="(GMT -6:00) Central Time (US & Canada), Mexico City">(GMT -6:00) Central Time (US & Canada), Mexico City</option>
              <option selected="selected" value="(GMT -5:00) Eastern Time (US & Canada), Bogota, Lima">(GMT -5:00) Eastern Time (US & Canada), Bogota, Lima</option>
              <option value="(GMT -4:00) Atlantic Time (Canada), Caracas, La Paz">(GMT -4:00) Atlantic Time (Canada), Caracas, La Paz</option>
              <option value="(GMT -3:30) Newfoundland">(GMT -3:30) Newfoundland</option>
              <option value="(GMT -3:00) Brazil, Buenos Aires, Georgetown">(GMT -3:00) Brazil, Buenos Aires, Georgetown</option>
              <option value="(GMT -2:00) Mid-Atlantic">(GMT -2:00) Mid-Atlantic</option>
              <option value="(GMT -1:00 hour) Azores, Cape Verde Islands">(GMT -1:00 hour) Azores, Cape Verde Islands</option>
              <option value="(GMT) Western Europe Time, London, Lisbon, Casablanca">(GMT) Western Europe Time, London, Lisbon, Casablanca</option>
              <option value="(GMT +1:00 hour) Brussels, Copenhagen, Madrid, Paris">(GMT +1:00 hour) Brussels, Copenhagen, Madrid, Paris</option>
              <option value="(GMT +2:00) Kaliningrad, South Africa">(GMT +2:00) Kaliningrad, South Africa</option>
              <option value="(GMT +3:00) Baghdad, Riyadh, Moscow, St. Petersburg">(GMT +3:00) Baghdad, Riyadh, Moscow, St. Petersburg</option>
              <option value="(GMT +3:30) Tehran">(GMT +3:30) Tehran</option>
              <option value="(GMT +4:00) Abu Dhabi, Muscat, Baku, Tbilisi">(GMT +4:00) Abu Dhabi, Muscat, Baku, Tbilisi</option>
              <option value="(GMT +4:30) Kabul">(GMT +4:30) Kabul</option>
              <option value="(GMT +5:00) Ekaterinburg, Islamabad, Karachi, Tashkent">(GMT +5:00) Ekaterinburg, Islamabad, Karachi, Tashkent</option>
              <option value="(GMT +5:30) Bombay, Calcutta, Madras, New Delhi">(GMT +5:30) Bombay, Calcutta, Madras, New Delhi</option>
              <option value="(GMT +5:45) Kathmandu">(GMT +5:45) Kathmandu</option>
              <option value="(GMT +6:00) Almaty, Dhaka, Colombo">(GMT +6:00) Almaty, Dhaka, Colombo</option>
              <option value="(GMT +7:00) Bangkok, Hanoi, Jakarta">(GMT +7:00) Bangkok, Hanoi, Jakarta</option>
              <option value="(GMT +8:00) Beijing, Perth, Singapore, Hong Kong">(GMT +8:00) Beijing, Perth, Singapore, Hong Kong</option>
              <option value="(GMT +9:00) Tokyo, Seoul, Osaka, Sapporo, Yakutsk">(GMT +9:00) Tokyo, Seoul, Osaka, Sapporo, Yakutsk</option>
              <option value="(GMT +9:30) Adelaide, Darwin">(GMT +9:30) Adelaide, Darwin</option>
              <option value="(GMT +10:00) Eastern Australia, Guam, Vladivostok">(GMT +10:00) Eastern Australia, Guam, Vladivostok</option>
              <option value="(GMT +11:00) Magadan, Solomon Islands, New Caledonia">(GMT +11:00) Magadan, Solomon Islands, New Caledonia</option>
              <option value="(GMT +12:00) Auckland, Wellington, Fiji, Kamchatka">(GMT +12:00) Auckland, Wellington, Fiji, Kamchatka</option>
          </select>
      <br>
            <p>(* detonates required field)</p>
          <button class="btn btn-lg btn-primary btn-block" name="submit" value="Create New Profile" type="submit">Create New Profile</button>
      </form>
  </div>
</div>
    </div>
</div>
