
<body>
<ul class="nav nav-pills nav-justified justify-content-center">
    <li class="nav-item">
        <a class="nav-item nav-link" href="<?= BASE_URL ?>">Home</a>
    </li>
    <?php if(isset($_SESSION['username'])): ?>
    <li class="nav-item">
        <a class="nav-item nav-link active" href="<?= BASE_URL ?>/timeline">Timeline</a>
    </li>
    <li class="nav-item">
        <a class="nav-item nav-link" href="<?= BASE_URL ?>/stories">Medal Of Honor</a>
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

<h1 id="timeline-header">Timeline of Events</h1>
<section class="cd-timeline js-cd-timeline">
    <div class="cd-timeline__container">
        <div class="cd-timeline__block js-cd-block">
            <div class="cd-timeline__img cd-timeline__img--picture js-cd-img">
                <img src="<?= BASE_URL ?>/public/img/Icons/location.png" alt="Picture">
            </div> <!-- cd-timeline__img -->

            <div class="cd-timeline__content js-cd-content">
                <h2>The First Strike</h2>
                <p>
                    On the 4th September, the Marines left their bases at Pavauu. Before they arrived the U.S. Navy bombarded Peleliu with their battleships and cruisers. In addition to this, light aircraft carriers also supported the bombardment. Aside from the Japanese aircraft that were wiped out, the bombardment did not have that much impact.
                </p>
                <span id = "date" class="cd-timeline__date">Sep 4th, 1944</span>
            </div> <!-- cd-timeline__content -->
        </div> <!-- cd-timeline__block -->

        <div class="cd-timeline__block js-cd-block">
            <div class="cd-timeline__img cd-timeline__img--movie js-cd-img">
                <img src="<?= BASE_URL ?>/public/img/Icons/location.png" alt="Movie">
            </div> <!-- cd-timeline__img -->

            <div class="cd-timeline__content js-cd-content">
                <h2>Reckoning Day</h2>
                <p>
                    On the 15th September, the U.S. Marines arrived at Peleliu. Thousands of Marines flooded ashore the beaches of Peleliu. A total of some 17,500 Marines were sent to take Peleliu.
                </p>
                <span id = "date" class="cd-timeline__date">Sep 15th, 1944</span>
            </div> <!-- cd-timeline__content -->
        </div> <!-- cd-timeline__block -->

        <div class="cd-timeline__block js-cd-block">
            <div class="cd-timeline__img cd-timeline__img--picture js-cd-img">
                <img src="<?= BASE_URL ?>/public/img/Icons/location.png" alt="Picture">
            </div> <!-- cd-timeline__img -->

            <div class="cd-timeline__content js-cd-content">
                <h2>Day 2</h2>
                <p>
                    On the second day of the battle, the Marines stormed towards the airfield at Peleliu. Despite the Japanese artillery and pillboxes the airfield was taken and held during this period. Aircraft soon began to land at the airfield during this period to provide the Marines with further aerial reconnaissance. By the 26th September, F4U Corsairs began to land at the airstrip for further dive-bombing missions around Peleliu.
                </p>
                <span cid = "date" lass="cd-timeline__date">Sep 16th, 1944</span>
            </div> <!-- cd-timeline__content -->
        </div> <!-- cd-timeline__block -->

        <div class="cd-timeline__block js-cd-block">
            <div class="cd-timeline__img cd-timeline__img--location js-cd-img">
                <img src="<?= BASE_URL ?>/public/img/Icons/location.png" alt="Location">
            </div> <!-- cd-timeline__img -->

            <div class="cd-timeline__content js-cd-content">
                <h2>Invading Ngesebus Island</h2>
                <p>
                    The next target for the Marines was Ngesebus Island which was a hotbed for Japanese artillery. The Marines were supported by Corsairs which dropped their bombs and rockets on Japanese positions around Ngesebus. Several days would be required to defeat the Japanese positions around Ngesebus.
                </p>
                <span id = "date" class="cd-timeline__date">Sep 28th, 1944</span>
            </div> <!-- cd-timeline__content -->
        </div> <!-- cd-timeline__block -->

        <div class="cd-timeline__block js-cd-block">
            <div class="cd-timeline__img cd-timeline__img--location js-cd-img">
                <img src="<?= BASE_URL ?>/public/img/Icons/location.png" alt="Location">
            </div> <!-- cd-timeline__img -->

            <div class="cd-timeline__content js-cd-content">
                <h2>Back and Forth</h2>
                <p>
                    On the 15th October, the 81st Infantry Division arrived to reinforce the Marines. By now the Marines were in action on the ridges of Umurbrogol. It was here that many of the Japanese fortifications had been established within the mountain's mine shafts with mortars, artillery pieces and machines guns. The Battle of Peleliu continued for a number weeks at the Mount Umurbrogol before the the U.S. troops were able to secure Umurbrogol.
                </p>
                <span id = "date" class="cd-timeline__date">Oct 15th, 1944</span>
            </div> <!-- cd-timeline__content -->
        </div> <!-- cd-timeline__block -->

        <div class="cd-timeline__block js-cd-block">
            <div class="cd-timeline__img cd-timeline__img--movie js-cd-img">
                <img src="<?= BASE_URL ?>/public/img/Icons/location.png" alt="Movie">
            </div> <!-- cd-timeline__img -->

            <div class="cd-timeline__content js-cd-content">
                <h2>The Conclusion</h2>
                <p>
                    The Battle of Peleliu was effectively over on the 27th November. After more than a month, Peleliu was secured by the U.S. Marines and 81st Infantry Division. They had lost approximately 1,794 troops during the battle.
                </p>
                <span id = "date" class="cd-timeline__date">Nov 27th, 1944</span>
            </div> <!-- cd-timeline__content -->
        </div> <!-- cd-timeline__block -->
    </div>
</section> <!-- cd-timeline -->