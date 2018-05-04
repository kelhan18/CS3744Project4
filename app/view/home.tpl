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

    <?php if(isset($_SESSION['username'])):
    <section id="one" class="wrapper style1 special">
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
        <script>

            $(document).ready(function() {
                drawCollapsibleTree('<?= BASE_URL ?>/json/');     //Handle this
                $('#changeBox').hide();

                $('#unfollowButton').click(function() {

                    var toUnfollow = $('#toUnfollow').val();
                    var myusername = $('#myUsername').val();
                    var myID = $('#myId').val();

                    //debugging
                    console.log("unfollowButton clicked" + toUnfollow + myusername + myID);

                    $.post(
                        '<?= BASE_URL ?>/tree/unfollow/' + myID,
                        {
                            to_unfollow: toUnfollow,
                            my_username: myusername
                        },
                        function(data) {
                            console.log(data);
                            if(data.success == 'success') {
                                $('#changeBox').hide();
                            }
                            else {
                                alert('Server error: ' + data.error);
                            }
                        })
                        .fail(function() {
                            alert("Ajax call failed");
                        });
                });
            });

            function editFollowing(name, id) {
                var username = name
                $('#changeBox').show();
                $('#toUnfollow').val(username);

            }
            function drawCollapsibleTree(jsonUrl) {
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

                d3.json(jsonUrl, function(error, flare) {
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
                        .on("click", click)

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
                        editFollowing(d.id, d.item_id);
                        d.children = d._children;
                        d._children = null;
                    }
                    update(d);
                }
            }
        </script>
        </section>
    <?php endif; ?>
</div>

