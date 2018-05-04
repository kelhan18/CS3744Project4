
<body class="stories-body">
<ul class="nav nav-pills nav-justified justify-content-center">
    <li class="nav-item">
        <a class="nav-item nav-link" href="<?= BASE_URL ?>">Home</a>
    </li>
    <?php if(isset($_SESSION['username'])): ?>
    <li class="nav-item">
        <a class="nav-item nav-link" href="<?= BASE_URL ?>/timeline">Timeline</a>
    </li>
    <li class="nav-item">
        <a class="nav-item nav-link active" href="<?= BASE_URL ?>/stories">Medal Of Honor</a>
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

<div class="main story-main-background">
    <div class="main-content story-background">
        <br>
        <h1 class="custom-header">Medal Of Honor Recipients</h1>

        <div class="content">

        <div class="row">
            <div class="profile-card">
                <header>

                    <img class="portrait" src="<?= BASE_URL ?>/public/img/portraits/lewis.jpg">

                    <h1>Lewis Kenneth Bausell</h1>
                    <h4>Corporal, U.S. Marine Corps</h4>

                </header>

                <div class="profile-bio">
                    <h4><strong>Place and date: </strong></h4><p>Island of Peleliu in the Palau Group, 15 September 1944. </p>
                    <h4><strong>Born: </strong></h4><p>17 April 1924, Pulaski, Virginia.</p>
                    <h4><strong>Accredited to: </strong></h4><p>District of Columbia.</p>

                </div>
            </div>


            <div class="profile-card">
                <header>

                    <img class="portrait" src="<?= BASE_URL ?>/public/img/portraits/arthur.jpg">

                    <h1>Arthur J. Jackson</h1>
                    <h4>Private First Class, U.S. Marine Corps</h4>

                </header>
                <div class="profile-bio">
                    <h4><strong>Place and date: </strong></h4><p>Island of Peleliu in the Palau group, 18 September 1944. </p>
                    <h4><strong>Born: </strong></h4><p>18 October 1924, Cleveland, Ohio.</p>
                    <h4><strong>Accredited to: </strong></h4><p>Oregon</p>

                </div>
            </div>
        </div>

        <div class="row">
            <div class="profile-card">
                <header>
                    <img class="portrait" src="<?= BASE_URL ?>/public/img/portraits/richard.jpg">
                    <h1>Richard Edward Kraus</h1>
                    <h4>Private First Class, U.S. Marine Corps</h4>
                </header>
                <div class="profile-bio">
                    <h4><strong>Place and date: </strong></h4><p>Island of Peleliu in the Palau group, 5 October 1944.</p>
                    <h4><strong>Born: </strong></h4><p>24 November 1925, Chicago, Illinois.</p>
                    <h4><strong>Accredited to: </strong></h4><p>Minnesota</p>
                </div>
            </div>

            <div class="profile-card">
                <header>
                    <img class="portrait img-fluid" src="<?= BASE_URL ?>/public/img/portraits/john.jpg">
                    <h1>John Dury New</h1>
                    <h4>Private First Class, U.S. Marine Corps</h4>
                </header>
                <div class="profile-bio">
                    <h4><strong>Place and date: </strong></h4><p>Island of Peleliu in the Palau group, 25 September 1944.
                    </p>
                    <h4><strong>Born: </strong></h4><p>12 August 1924, Mobile, Alabama. </p>
                    <h4><strong>Accredited to: </strong></h4><p>Alabama</p>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="profile-card">
                <header>
                    <img class="portrait" src="<?= BASE_URL ?>/public/img/portraits/wesley.jpg">
                    <h1>Wesley Phelps</h1>
                    <h4>Private, U.S. Marine Corps</h4>
                </header>
                <div class="profile-bio">
                    <h4><strong>Place and date: </strong></h4><p>Island of Peleliu in the Palau group, 4 October 1944.
                    </p>
                    <h4><strong>Born: </strong></h4><p>12 June 1923, Neafus, Kentucky. </p>
                    <h4><strong>Accredited to: </strong></h4><p>Kentucky</p>

                </div>
            </div>

            <div class="profile-card">
                <header>
                    <img class="portrait" src="<?= BASE_URL ?>/public/img/portraits/everett.jpg">
                    <h1>Everett Parker Pope</h1>
                    <h4>Captain, U.S. Marine Corps</h4>
                </header>
                <div class="profile-bio">
                    <h4><strong>Place and date: </strong></h4><p>Peleliu Island, Palau group, 19-20 September 1944.
                    </p>
                    <h4><strong>Born: </strong></h4><p>16 July 1919, Milton, Massachusetts.
                    </p>
                    <h4><strong>Accredited to: </strong></h4><p>Massachusetts</p>

                </div>
            </div>
        </div>

        <div class="row">

            <div class="profile-card">
                <header>
                    <img class="portrait" src="<?= BASE_URL ?>/public/img/portraits/charles.jpg">
                    <h1>Charles Howard Roan</h1>
                    <h4>Private First Class, U.S. Marine Corps</h4>
                </header>

                <div class="profile-bio">
                    <h4><strong>Place and date: </strong></h4><p>Peleliu Island, Palau group, 18 September 1944.
                    </p>
                    <h4><strong>Born: </strong></h4><p>16 August 1923, Claude, Texas. </p>
                    <h4><strong>Accredited to: </strong></h4><p>Texas</p>
                </div>
            </div>

            <div class="profile-card">
                <header>
                    <img class="portrait" src="<?= BASE_URL ?>/public/img/portraits/carlton.jpg">
                    <h1>Carlton Robert Rouh</h1>
                    <h4>First Lieutenant, U.S. Marine Corps</h4>
                </header>
                <div class="profile-bio">
                    <h4><strong>Place and date: </strong></h4><p>Peleliu Island, Palau group, 15 September 1944.
                    </p>
                    <h4><strong>Born: </strong></h4><p>11 May 1919, Lindenwold, New Jersey. </p>
                    <h4><strong>Accredited to: </strong></h4><p>New Jersey</p>
                </div>
            </div>
        </div>
        </div>
        <p id="test">Source: http://www.worldwar2history.info/II/Medal-of-Honor/Peleliu-Island.html</p>
    </div>
</div>
