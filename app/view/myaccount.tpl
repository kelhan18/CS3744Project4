<?php
if(isset($_SESSION['username']))
  $profile = Profile::getProfile($_SESSION['profile_id']);
  $profiles = Profile::getProfiles();
?>

<body>

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

<div class="main">
    <div class="main-content">

            <ul class="nav nav-pills nav-justified justify-content-center">
                <!--
                <li class="active"><a href="#home" data-toggle="tab">Profile</a></li>
                <li><a href="#profile" data-toggle="tab">Password</a></li>
                -->
                <li class="nav-item">
                    <a class="nav-item nav-link active" href="#activity-feed" data-toggle="tab">Activity</a>
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

                <?php if($_SESSION['role'] == 'Admin'): ?>
                    <li class="nav-item">
                        <a class="nav-item nav-link" href="#adminpage" data-toggle="tab">Admin Page</a>
                    </li>
                <?php endif; ?>

            </ul>

            <div id="myTabContent" class="tab-content">

                <!--Not sure how to implement yet -->
                <div class="tab-pane fade show active" role="tabpanel" id="activity-feed">
                    <h2>Activity Feed</h2>
                </div>

                <!--Need to populate with following people in database for specific user -->
                <div class="tab-pane fade" id="following" role="tabpanel">
                    <h2>Following</h2>
                    <ul class="list-group">
                        <li class="list-group-item list-group-item-action list-group-item-primary">Keller Han</li>
                        <li class="list-group-item list-group-item-action list-group-item-primary">Tony Medovar</li>
                    </ul>

                    <form method="POST" action="<?= BASE_URL ?>/follow" name="follow">
                        <div class="input-group mb-1">
                            <input type="text" class="form-control" placeholder="Person to Follow" aria-label="Person to Follow" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" name="followButton" type="button">Follow</button>
                            </div>
                        </div>
                    </form>

                    <form method="POST" action="<?= BASE_URL ?>/unfollow" name="unfollow">
                        <div class="input-group mb-1">
                            <input type="text" class="form-control" placeholder="Person to Unfollow" aria-label="Person to Unfollow" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" name="unfollowButton" type="button">Unfollow</button>
                            </div>
                        </div>
                    </form>
                </div>

                <!--Need to populate with followers in database for specific user -->
                <div class="tab-pane fade" role="tabpanel" id="followers">
                    <h2>Followers</h2>
                    <ul class="list-group">
                        <li class="list-group-item list-group-item-action list-group-item-primary">Lebron James</li>
                        <li class="list-group-item list-group-item-action list-group-item-primary">Kevin Durant</li>
                    </ul>
                </div>


                <div class="tab-pane fade" role="tabpanel" id="profile">
                    <h2>Edit Profile Info</h2>
                    <form method="POST" id ="tab" action="<?= BASE_URL ?>/updateInfo" name="updateInfoForm">
                        <div class ="form-group">
                            <label>Username: </label>
                            <input type="text" name="username" value="<?= $profile->username?>" class="input-xlarge" id="input-username">
                        </div>
                        <div class ="form-group">
                            <label>First Name: *</label>
                            <input type="text" name="firstname" value="<?= $profile->firstname?>" class="input-xlarge" required>
                        </div>
                        <div class ="form-group">
                            <label>Last Name: *</label>
                            <input type="text" name="lastname" value="<?= $profile->lastname?>" class="input-xlarge" required>
                        </div>
                        <div class ="form-group">
                            <label>Email: *</label>
                            <input type="email" name="email" value="<?= $profile->email?>" class="input-xlarge" required>
                        </div>
                        <div class ="form-group">
                            <label>Address</label>
                            <input type="text" name="address" value="<?= $profile->address?>" class="input-xlarge">
                        </div>
                        <div class ="form-group">
                            <label>Time Zone: *</label>
                            <select name="timezone" id="DropDownTimezone" class="input-xlarge" required>
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
                            <div>
                                <button name="submit" value="updateProfile" type="submit" class="btn btn-lg btn-primary btn-block">Update</button>
                            </div>
                        </div>
                    </form>
                </div>


                <div class="tab-pane fade" role="tabpanel" id="password">
                    <h2>Change Password</h2>
                    <form method="POST" id="tab2" action="<?= BASE_URL ?>/updatePassword" name="updatePasswordForm">
                        <div class ="form-group">
                            <label>Old Password: *</label>
                            <input type="password" name="oldpassword" class="input-xlarge" required>
                        </div>
                        <div class ="form-group">
                            <label>New Password: *</label>
                            <input type="password" name="newpassword" class="input-xlarge" required>
                        </div>
                        <br>
                        <p>(* detonates required field)</p>
                        <div>
                            <button class="btn btn-lg btn-primary btn-block">Update</button>
                        </div>
                    </form>
                </div>

                <div class="tab-pane fade" role="tabpanel" id="adminpage">
                    <h2>List of Users</h2>
                    <div id="postHolder">


                        <?php foreach($profiles as $profile): ?>
                        <div class="container" style="margin-top: 20px; margin-bottom: 20px;">
                            <div class="row panel">
                                <div class="col-md-8  col-xs-12">
                                    <div class="header">
                                        <form method="POST" action="<?= BASE_URL ?>/changeRole" class="form-inline">
                                        <h4 style="margin-left:20px;margin-top:8px;color: red;"><?= $profile->firstname?> <?= $profile->lastname?></h4>
                                        <h5 style="margin-left:20px;margin-top:8px;"><?= $profile->role?></h5>
                                            <button type="button" class="btn btn-xs btn-outline-danger">Change Role</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <?php endforeach; ?>


                        </div>
                </div>

    </div>
</div>
</div>