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


<div class="main">
    <div class="main-content">
        <div class="well">
            <ul class="nav nav-pills nav-justified justify-content-center">
                <!--
                <li class="active"><a href="#home" data-toggle="tab">Profile</a></li>
                <li><a href="#profile" data-toggle="tab">Password</a></li>
                -->
                <li class="nav-item">
                    <a class="nav-item nav-link active" href="#activity-feed" data-toggle="tab">Activity Feed</a>
                </li>
                <li class="nav-item">
                    <a class="nav-item nav-link" href="#following" data-toggle="tab">Following</a>
                </li>
                <li class="nav-item">
                    <a class="nav-item nav-link" href="#followers" data-toggle="tab">Followers</a>
                </li>
                <li class="nav-item">
                    <a class="nav-item nav-link" href="#profile" data-toggle="tab">Profile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-item nav-link" href="#password" data-toggle="tab">Password</a>
                </li>
            </ul>

            <div id="myTabContent" class="tab-content">

                <!--Not sure how to implement yet -->
                <div class="tab-pane active in" id="activity-feed">
                    <h2>Activity Feed</h2>
                </div>

                <!--Need to populate with following people in database for specific user -->
                <div class="tab-pane fade" id="following">
                    <h2>Following</h2>
                    <p>Keller Han</p>
                    <p>Tony Medovar</p>


                    <form method="POST" action="<?= BASE_URL ?>/follow" name="follow">
                        <button class="btn btn-lg btn-primary" name="followButton">Follow</button>
                    </form>
                    <form method="POST" action="<?= BASE_URL ?>/unfollow" name="unfollow">
                        <button class="btn btn-lg btn-primary" name="unfollowButton">Unfollow</button>
                    </form>

                </div>

                <!--Need to populate with followers in database for specific user -->
                <div class="tab-pane fade" id="followers">
                    <h2>Followers</h2>
                    <p>Lebron James</p>
                    <p>Kevin Durant</p>

                </div>



                <div class="tab-pane fade" id="profile">
                    <h2>Edit Profile Info</h2>
                    <form method="POST" id ="tab" action="<?= BASE_URL ?>/updateInfo" name="updateInfoForm">
                        <label>Username: </label>
                        <input type="text" value="kelhan18" class="input-xlarge" id="input-username">
                        <label>First Name: *</label>
                        <input type="text" value="Keller" class="input-xlarge" required>
                        <label>Last Name: *</label>
                        <input type="text" value="Han" class="input-xlarge" required>
                        <label>Email: *</label>
                        <input type="text" value="kelhan18@vt.edu" class="input-xlarge" required>
                        <label>Address</label>
                        <input type="text" value="2877 Main Street, Blacksburg VA" class="input-xlarge">
                        <label>Time Zone: *</label>
                        <select name="DropDownTimezone" id="DropDownTimezone" class="input-xlarge" required>
                            <option value="-12.0">(GMT -12:00) Eniwetok, Kwajalein</option>
                            <option value="-11.0">(GMT -11:00) Midway Island, Samoa</option>
                            <option value="-10.0">(GMT -10:00) Hawaii</option>
                            <option value="-9.0">(GMT -9:00) Alaska</option>
                            <option value="-8.0">(GMT -8:00) Pacific Time (US & Canada)</option>
                            <option value="-7.0">(GMT -7:00) Mountain Time (US & Canada)</option>
                            <option value="-6.0">(GMT -6:00) Central Time (US & Canada), Mexico City</option>
                            <option selected="selected" value="-5.0">(GMT -5:00) Eastern Time (US & Canada), Bogota, Lima</option>
                            <option value="-4.0">(GMT -4:00) Atlantic Time (Canada), Caracas, La Paz</option>
                            <option value="-3.5">(GMT -3:30) Newfoundland</option>
                            <option value="-3.0">(GMT -3:00) Brazil, Buenos Aires, Georgetown</option>
                            <option value="-2.0">(GMT -2:00) Mid-Atlantic</option>
                            <option value="-1.0">(GMT -1:00 hour) Azores, Cape Verde Islands</option>
                            <option value="0.0">(GMT) Western Europe Time, London, Lisbon, Casablanca</option>
                            <option value="1.0">(GMT +1:00 hour) Brussels, Copenhagen, Madrid, Paris</option>
                            <option value="2.0">(GMT +2:00) Kaliningrad, South Africa</option>
                            <option value="3.0">(GMT +3:00) Baghdad, Riyadh, Moscow, St. Petersburg</option>
                            <option value="3.5">(GMT +3:30) Tehran</option>
                            <option value="4.0">(GMT +4:00) Abu Dhabi, Muscat, Baku, Tbilisi</option>
                            <option value="4.5">(GMT +4:30) Kabul</option>
                            <option value="5.0">(GMT +5:00) Ekaterinburg, Islamabad, Karachi, Tashkent</option>
                            <option value="5.5">(GMT +5:30) Bombay, Calcutta, Madras, New Delhi</option>
                            <option value="5.75">(GMT +5:45) Kathmandu</option>
                            <option value="6.0">(GMT +6:00) Almaty, Dhaka, Colombo</option>
                            <option value="7.0">(GMT +7:00) Bangkok, Hanoi, Jakarta</option>
                            <option value="8.0">(GMT +8:00) Beijing, Perth, Singapore, Hong Kong</option>
                            <option value="9.0">(GMT +9:00) Tokyo, Seoul, Osaka, Sapporo, Yakutsk</option>
                            <option value="9.5">(GMT +9:30) Adelaide, Darwin</option>
                            <option value="10.0">(GMT +10:00) Eastern Australia, Guam, Vladivostok</option>
                            <option value="11.0">(GMT +11:00) Magadan, Solomon Islands, New Caledonia</option>
                            <option value="12.0">(GMT +12:00) Auckland, Wellington, Fiji, Kamchatka</option>
                        </select>
                        <br>
                        <p>(* detonates required field)</p>
                        <div>
                            <button class="btn btn-lg btn-primary btn-block">Update</button>
                        </div>
                    </form>
                </div>


                <div class="tab-pane fade" id="password">
                    <h2>Change Password</h2>
                    <form method="POST" id="tab2" action="<?= BASE_URL ?>/updatePassword" name="updatePasswordForm">
                        <label>New Password: *</label>
                        <input type="password" class="input-xlarge" required>
                        <br>
                        <p>(* detonates required field)</p>
                        <div>
                            <button class="btn btn-lg btn-primary btn-block">Update</button>
                        </div>
                    </form>
                </div>
            </div>
    </div>
</div>
</div>