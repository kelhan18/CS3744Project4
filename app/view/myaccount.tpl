<?php
if(isset($_SESSION['username']))
  $profile = Profile::getProfile($_SESSION['profile_id']);
  $profiles = Profile::getProfiles();
  $followers = Follower::getFollowers();
  $activities = Activity::getActivities($_SESSION['profile_id']);
?>

<body class="myaccount-body">

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

<div class="main account-main-background">
    <div class="main-content account-background">

        <ul class="nav nav-pills nav-justified justify-content-center">
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

            <?php if($_SESSION['role'] == 'Owner'): ?>
            <li class="nav-item">
                <a class="nav-item nav-link" href="#ownerpage" data-toggle="tab">Owner Page</a>
            </li>
            <?php endif; ?>

        </ul>

        <div class="tab-content">

            <!--Not sure how to implement yet -->
            <div class="tab-pane fade show in active" role="tabpanel" id="activity-feed">
                <br>
                <div class="container">
                    <div class="row">
                        <h1 class="account-h1">Activity Feed</h1>
                        <?php foreach($activities as $activity): ?>
                            <li class="list-group-item list-group-item-action d-flex justify-content-between">
                                <?= $activity ?>
                            </li>
                        <?php endforeach; ?>
                    </div>
                </div>
            </div>

            <!--Need to populate with following people in database for specific user -->
            <div class="tab-pane fade" id="following" role="tabpanel">
                <br>
                <div class="container">
                    <div class="row">
                        <h1 class="account-h1">Following</h1>
                    </div>


                    <ul class="list-group">

                        <?php foreach($followers as $follower): ?>
                            <?php if($follower->follower == $profile->username): ?>
                                <?php $userProfile = Profile::getProfileByUsername($follower->username)?>

                            <li class="list-group-item list-group-item-action d-flex justify-content-between">
                                <?= $follower->username?>
                                <span class="badge badge-primary badge-pill">
                                            Following: <?= $userProfile->number_following?>
                                            Followers: <?= $userProfile->number_followers?>
                                        </span>
                            </li>
                            <?php endif; ?>
                        <?php endforeach; ?>

                    </ul>


                    <div class="row">
                        <div class="col-md-6">

                            <form class="navbar-form" method="POST" action="<?= BASE_URL ?>/follow" name="follow">
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control" name="toFollow" placeholder="Person to Follow" aria-label="Person to Follow" aria-describedby="basic-addon2">
                                    <div class="input-group-append">
                                        <input type="hidden" name="myUsername" value="<?= $profile->username?>"/>
                                        <input type="hidden" name="myId" value="<?= $profile->profile_id?>"/>
                                        <button class="btn btn-outline-primary" name="followButton" type="submit">Follow</button>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <div class="col-md-6">
                            <form class="navbar-form" method="POST" action="<?= BASE_URL ?>/unfollow" name="unfollow">
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control" name="toUnfollow" placeholder="Person to Unfollow" aria-label="Person to Unfollow" aria-describedby="basic-addon2">
                                    <div class="input-group-append">
                                        <input type="hidden" name="myUsername" value="<?= $profile->username?>"/>
                                        <input type="hidden" name="myId" value="<?= $profile->profile_id?>"/>
                                        <button class="btn btn-outline-primary" name="unfollowButton" type="submit">Unfollow</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-8">
                            <form class="navbar-form" method="POST" action="<?= BASE_URL ?>/login/findAccount" target="iframe" name="Find_Account_Form" class="form-signin">
                                <button class="btn btn-secondary btn-block" name="findaccount" type="submit">Find Users</button>
                            </form>
                        </div>
                        <div class="col-md-4">
                            <iframe name="iframe">

                            </iframe>
                        </div>
                    </div>
                </div>
            </div>




            <!--Need to populate with followers in database for specific user -->
            <div class="tab-pane fade" role="tabpanel" id="followers">
                <br>
                <div class="container">
                    <div class="row">
                        <h1 class="account-h1">My Followers</h1>
                    </div>

                    <!--for each make them in a row-->
                    <ul class="list-group">

                        <?php foreach($followers as $follower): ?>
                        <?php if($follower->username== $profile->username): ?>
                        <?php $userProfile = Profile::getProfileByUsername($follower->follower)?>

                        <li class="list-group-item list-group-item-action d-flex justify-content-between">
                            <?= $follower->follower?>
                            <span class="badge badge-primary badge-pill">
                                            Following: <?= $userProfile->number_following?>
                                            Followers: <?= $userProfile->number_followers?>
                                        </span>
                        </li>
                        <?php endif; ?>
                        <?php endforeach; ?>

                    </ul>

                </div>
            </div>


            <div class="tab-pane fade" role="tabpanel" id="profile">
                <br>
                <div class="container">
                    <div class="row">
                        <h1 class="account-h1">Edit Profile Info</h1>
                    </div>

                    <div class="row">

                        <form class="navbar-form" method="POST" id ="tab" action="<?= BASE_URL ?>/updateInfo" name="updateInfoForm">
                            <div class ="form-group">
                                <h3>Username: </h3>
                                <input type="text" name="username" value="<?= $profile->username?>" class="input-xlarge" id="input-username">
                            </div>
                            <div class ="form-group">
                                <h3>First Name: *</h3>
                                <input type="text" name="firstname" value="<?= $profile->firstname?>" class="input-xlarge" required>
                            </div>
                            <div class ="form-group">
                                <h3>Last Name: *</h3>
                                <input type="text" name="lastname" value="<?= $profile->lastname?>" class="input-xlarge" required>
                            </div>
                            <div class ="form-group">
                                <h3>Email: *</h3>
                                <input type="email" name="email" value="<?= $profile->email?>" class="input-xlarge" required>
                            </div>
                            <div class ="form-group">
                                <h3>Address</h3>
                                <input type="text" name="address" value="<?= $profile->address?>" class="input-xlarge">
                            </div>
                            <div class ="form-group">
                                <h3>Time Zone: *</h3>
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
                                <h5>(* detonates required field)</h5>
                                <div>
                                    <button name="submit" value="updateProfile" type="submit" class="btn btn-lg btn-primary btn-block">Update</button>
                                </div>
                            </div>
                        </form>
                    </div>


                    <style>

                        .node {
                            cursor: pointer;
                        }

                        .node circle {
                            fill: #fff;
                            stroke: steelblue;
                            stroke-width: 1.5px;
                        }

                        .node text {
                            font: 10px sans-serif;
                        }

                        .link {
                            fill: none;
                            stroke: #ccc;
                            stroke-width: 1.5px;
                        }

                    </style>
                    <script src="//d3js.org/d3.v3.min.js"></script>
                    <script>

                        var margin = {top: 20, right: 120, bottom: 20, left: 120},
                            width = 960 - margin.right - margin.left,
                            height = 800 - margin.top - margin.bottom;

                        var i = 0,
                            duration = 750,
                            root;

                        var tree = d3.layout.tree()
                            .size([height, width]);

                        var diagonal = d3.svg.diagonal()
                            .projection(function(d) { return [d.y, d.x]; });

                        var svg = d3.select("body").append("svg")
                            .attr("width", width + margin.right + margin.left)
                            .attr("height", height + margin.top + margin.bottom)
                            .append("g")
                            .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

                        d3.json("<?= BASE_URL ?>/app/view/flare.json", function(error, flare) {
                            if (error) throw error;

                            root = flare;
                            root.x0 = height / 2;
                            root.y0 = 0;

                            function collapse(d) {
                                if (d.children) {
                                    d._children = d.children;
                                    d._children.forEach(collapse);
                                    d.children = null;
                                }
                            }

                            root.children.forEach(collapse);
                            update(root);
                        });

                        d3.select(self.frameElement).style("height", "800px");

                        function update(source) {

                            // Compute the new tree layout.
                            var nodes = tree.nodes(root).reverse(),
                                links = tree.links(nodes);

                            // Normalize for fixed-depth.
                            nodes.forEach(function(d) { d.y = d.depth * 180; });

                            // Update the nodes…
                            var node = svg.selectAll("g.node")
                                .data(nodes, function(d) { return d.id || (d.id = ++i); });

                            // Enter any new nodes at the parent's previous position.
                            var nodeEnter = node.enter().append("g")
                                .attr("class", "node")
                                .attr("transform", function(d) { return "translate(" + source.y0 + "," + source.x0 + ")"; })
                                .on("click", click);

                            nodeEnter.append("circle")
                                .attr("r", 1e-6)
                                .style("fill", function(d) { return d._children ? "lightsteelblue" : "#fff"; });

                            nodeEnter.append("text")
                                .attr("x", function(d) { return d.children || d._children ? -10 : 10; })
                                .attr("dy", ".35em")
                                .attr("text-anchor", function(d) { return d.children || d._children ? "end" : "start"; })
                                .text(function(d) { return d.name; })
                                .style("fill-opacity", 1e-6);

                            // Transition nodes to their new position.
                            var nodeUpdate = node.transition()
                                .duration(duration)
                                .attr("transform", function(d) { return "translate(" + d.y + "," + d.x + ")"; });

                            nodeUpdate.select("circle")
                                .attr("r", 4.5)
                                .style("fill", function(d) { return d._children ? "lightsteelblue" : "#fff"; });

                            nodeUpdate.select("text")
                                .style("fill-opacity", 1);

                            // Transition exiting nodes to the parent's new position.
                            var nodeExit = node.exit().transition()
                                .duration(duration)
                                .attr("transform", function(d) { return "translate(" + source.y + "," + source.x + ")"; })
                                .remove();

                            nodeExit.select("circle")
                                .attr("r", 1e-6);

                            nodeExit.select("text")
                                .style("fill-opacity", 1e-6);

                            // Update the links…
                            var link = svg.selectAll("path.link")
                                .data(links, function(d) { return d.target.id; });

                            // Enter any new links at the parent's previous position.
                            link.enter().insert("path", "g")
                                .attr("class", "link")
                                .attr("d", function(d) {
                                    var o = {x: source.x0, y: source.y0};
                                    return diagonal({source: o, target: o});
                                });

                            // Transition links to their new position.
                            link.transition()
                                .duration(duration)
                                .attr("d", diagonal);

                            // Transition exiting nodes to the parent's new position.
                            link.exit().transition()
                                .duration(duration)
                                .attr("d", function(d) {
                                    var o = {x: source.x, y: source.y};
                                    return diagonal({source: o, target: o});
                                })
                                .remove();

                            // Stash the old positions for transition.
                            nodes.forEach(function(d) {
                                d.x0 = d.x;
                                d.y0 = d.y;
                            });
                        }

                        // Toggle children on click.
                        function click(d) {
                            if (d.children) {
                                d._children = d.children;
                                d.children = null;
                            } else {
                                d.children = d._children;
                                d._children = null;
                            }
                            update(d);
                        }

                    </script>


                </div>
            </div>


            <div class="tab-pane fade" role="tabpanel" id="password">
                <br>
                <div class="container">
                    <div class="row">
                        <h1 class="account-h1">Change Password</h1>
                        <form class="navbar-form" method="POST" id="tab2" action="<?= BASE_URL ?>/updatePassword" name="updatePasswordForm">
                            <div class ="form-group">
                                <h3>Old Password: *</h3>
                                <input type="password" name="oldpassword" class="input-xlarge" required>
                            </div>
                            <div class ="form-group">
                                <h3>New Password: *</h3>
                                <input type="password" name="newpassword" class="input-xlarge" required>
                            </div>
                            <br>
                            <h5>(* detonates required field)</h5>
                            <div>
                                <button class="btn btn-lg btn-primary btn-block">Update</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>

            <div class="tab-pane fade" role="tabpanel" id="adminpage">
                <br>
                <div class="container">
                    <div class="row">
                        <h1 class="account-h1">List of Users</h1>
                    </div>

                    <div class="row">
                        <div class="col-md-5">
                            <h1 style="color: royalblue">
                                <u>Name</u>
                            </h1>
                        </div>
                        <div class="col-md-3">
                            <h1 style="margin-left:20px; color: royalblue">
                                <u>Role</u>
                            </h1>
                        </div>
                        <div class="col-md-4">
                            <h1 style="color: royalblue;">
                                <u>Change Role</u>
                            </h1>
                        </div>
                    </div>



                    <?php foreach($profiles as $profile): ?>
                    <div class="row">
                        <div class="col-md-5">
                            <h3 style="color: dodgerblue;">
                                <?= $profile->firstname?> <?= $profile->lastname?>
                            </h3>
                        </div>
                        <div class="col-md-3">
                            <h5 style="margin-left:20px;margin-top:8px;"><?= $profile->role?></h5>
                        </div>
                        <div class="col-md-4">
                            <?php if($profile->role == "Normal User"): ?>
                            <form method="POST" action="<?= BASE_URL ?>/changeRole" class="form-inline">

                                <!--Store the profile id if they are normal user in profile_id-->
                                <input type="hidden" name="profile_id" value="<?= $profile->profile_id?>"/>
                                <button type="submit" class="btn btn-xs btn-outline-danger">Make Admin</button>

                            </form>
                            <?php endif; ?>
                        </div>
                    </div>


                    <?php endforeach; ?>
                </div>
            </div>


            <div class="tab-pane fade" role="tabpanel" id="ownerpage">
                <br>
                <div class="container">
                    <div class="row">
                        <h1 class="account-h1">List of Users</h1>
                    </div>

                    <div class="row">
                        <div class="col-md-5">
                            <h1 style="color: royalblue">
                                <u>Name</u>
                            </h1>
                        </div>
                        <div class="col-md-3">
                            <h1 style="margin-left:20px; color: royalblue">
                                <u>Role</u>
                            </h1>
                        </div>
                        <div class="col-md-4">
                            <h1 style="color: royalblue;">
                                <u>Change Role</u>
                            </h1>
                        </div>
                    </div>

                    <?php foreach($profiles as $profile): ?>

                    <div class="row">
                        <div class="col-md-5">
                            <h3 style="color: dodgerblue;">
                                <?= $profile->firstname?> <?= $profile->lastname?>
                            </h3>
                        </div>
                        <div class="col-md-3">
                            <h5 style="margin-left:20px;margin-top:8px;"><?= $profile->role?></h5>
                        </div>
                        <div class="col-md-4">
                            <?php if($profile->role == "Normal User"): ?>
                            <form method="POST" action="<?= BASE_URL ?>/changeRole" class="form-inline">

                                <!--Store the profile id if they are normal user in profile_id-->
                                <input type="hidden" name="profile_id" value="<?= $profile->profile_id?>"/>
                                <input type="hidden" name="target_role" value="<?= $profile->role?>"/>
                                <button type="submit" class="btn btn-xs btn-outline-danger">Make Admin</button>

                            </form>
                            <?php endif; ?>
                            <?php if($profile->role == "Admin"): ?>
                            <form method="POST" action="<?= BASE_URL ?>/changeRole" class="form-inline">

                                <!--Store the profile id if they are normal user in profile_id-->
                                <input type="hidden" name="profile_id" value="<?= $profile->profile_id?>"/>
                                <input type="hidden" name="target_role" value="<?= $profile->role?>"/>
                                <button type="submit" class="btn btn-xs btn-outline-danger">Make Normal User</button>

                            </form>
                            <?php endif; ?>
                        </div>
                    </div>
                    <?php endforeach; ?>
                </div>



            </div>


        </div>
    </div>
