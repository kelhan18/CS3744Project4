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
            <div class="image"><img src="<?= BASE_URL ?>/public/img/Icons/battle.jpg" alt="" /></div>
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
            <div class="image"><img src="<?= BASE_URL ?>/public/img/Icons/american.jpg" alt="" /></div>
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
            <div class="image"><img src="<?= BASE_URL ?>/public/img/Icons/japan.jpg" alt="" /></div><div class="content">
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
                <header class="major">
                    <h2>Activity Feed</h2>
                    <p>Your and Your Friend's Activites</p>
                </header>
                <ul class="features">
                    <li class="icon fa-paper-plane-o">
                        <h3>Arcu accumsan</h3>
                        <p>Augue consectetur sed interdum imperdiet et ipsum. Mauris lorem tincidunt nullam amet leo Aenean ligula consequat consequat.</p>
                    </li>
                    <li class="icon fa-laptop">
                        <h3>Ac Augue Eget</h3>
                        <p>Augue consectetur sed interdum imperdiet et ipsum. Mauris lorem tincidunt nullam amet leo Aenean ligula consequat consequat.</p>
                    </li>
                    <li class="icon fa-code">
                        <h3>Mus Scelerisque</h3>
                        <p>Augue consectetur sed interdum imperdiet et ipsum. Mauris lorem tincidunt nullam amet leo Aenean ligula consequat consequat.</p>
                    </li>
                    <li class="icon fa-headphones">
                        <h3>Mauris Imperdiet</h3>
                        <p>Augue consectetur sed interdum imperdiet et ipsum. Mauris lorem tincidunt nullam amet leo Aenean ligula consequat consequat.</p>
                    </li>
                    <li class="icon fa-heart-o">
                        <h3>Aenean Primis</h3>
                        <p>Augue consectetur sed interdum imperdiet et ipsum. Mauris lorem tincidunt nullam amet leo Aenean ligula consequat consequat.</p>
                    </li>
                    <li class="icon fa-flag-o">
                        <h3>Tortor Ut</h3>
                        <p>Augue consectetur sed interdum imperdiet et ipsum. Mauris lorem tincidunt nullam amet leo Aenean ligula consequat consequat.</p>
                    </li>
                </ul>
            </div>
        </section>

