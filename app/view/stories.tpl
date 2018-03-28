
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
        <a class="nav-item nav-link active" href="<?= BASE_URL ?>/stories">Stories</a>
    </li>
    <li class="nav-item">
        <a class="nav-item nav-link" href="<?= BASE_URL ?>/forum">Forum</a>
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

        <!-- Stories Container -->
        <br>
        <br>
        <h1 style="text-align:center"><b>The Untold Stories of the Heroes of Peleliu</b></h1>
        <div class="storyWrapper">
            <div class="row">
                <div class="column">
                    <div class="portrait">
                        <img src="<?= BASE_URL ?>/public/img/portraits/img_avatar.png" alt="Jane" style="width:100%">
                    </div>
                </div>
                <div class="column">
                    <div class="card">
                        <div class="story_container">
                            <h2>Mike Ross</h2>
                            <p class="title">Art Director</p>
                            <p>Mike Ross is an esteemed alumni of the Harver Law School. He is currently
                                working full-time for the law firm Pearson Specter Litt. He specializes in
                                corporate cases including fraud, collusion, and even espionage. Ross is the
                                on track to becoming the youngest partner at his firm.</p>
                            <p><button class="button_contact">Read More</button></p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="column">
                    <div class="portrait">
                        <img src="<?= BASE_URL ?>/public/img/portraits/img_avatar.png" alt="Jane" style="width:100%">
                    </div>
                </div>
                <div class="column">
                    <div class="card">
                        <div class="story_container">
                            <h2>Rodney Erickson</h2>
                            <p class="title">Marketing</p>
                            <p>Rodney Erickson is a content marketing professional at HubSpot, an inbound
                                marketing and sales platform that helps companies attract visitors, convert
                                leads, and close customers. Previously, Rodney worked as a marketing manager
                                for a tech software startup.</p>
                            <p><button class="button_contact">Read More</button></p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="column">
                    <div class="portrait">
                        <img src="<?= BASE_URL ?>/public/img/portraits/img_avatar.png" alt="Jane" style="width:100%">
                    </div>
                </div>
                <div class="column">
                    <div class="card">
                        <div class="story_container">
                            <h2>Michelle Obama</h2>
                            <p class="title">Marketing</p>
                            <p>Rodney Erickson is a content marketing professional at HubSpot, an inbound
                                marketing and sales platform that helps companies attract visitors, convert
                                leads, and close customers. Previously, Rodney worked as a marketing manager
                                for a tech software startup.</p>
                            <p><button class="button_contact">Read More</button></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END Stories Container -->