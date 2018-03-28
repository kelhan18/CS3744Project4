
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
        <a class="nav-item nav-link" href="<?= BASE_URL ?>/stories">Stories</a>
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
    <!-- container -->

    <div class="main-content">
        <br>
        <h1 style="text-align: left;margin-left:7%;">Timeline of Events</h1>
        <div class="timeline">
            <div class="tl_container tl_right">
                <div class="tl_content">
                    <h2>September 4th, 1944</h2>
                    <p>On the 4th September, the Marines left their bases at Pavauu. Before they arrived the U.S. Navy bombarded Peleliu with their battleships and cruisers. In addition to this, light aircraft carriers also supported the bombardment. Aside from the Japanese aircraft that were wiped out, the bombardment did not have that much impact.
                </div>
            </div>
            <div class="tl_container tl_right">
                <div class="tl_content">
                    <h2>September 15th, 1944</h2>
                    <p>On the 15th September, the U.S. Marines arrived at Peleliu. Thousands of Marines flooded ashore the beaches of Peleliu. A total of some 17,500 Marines were sent to take Peleliu.
                </div>
            </div>
            <div class="tl_container tl_right">
                <div class="tl_content">
                    <h2>September 16th, 1944</h2>
                    <p>On the second day of the battle, the Marines stormed towards the airfield at Peleliu. Despite the Japanese artillery and pillboxes the airfield was taken and held during this period. Aircraft soon began to land at the airfield during this period to provide the Marines with further aerial reconnaissance. By the 26th September, F4U Corsairs began to land at the airstrip for further dive-bombing missions around Peleliu.
                </div>
            </div>
            <div class="tl_container tl_right">
                <div class="tl_content">
                    <h2>September 28th, 1944</h2>
                    <p>The next target for the Marines was Ngesebus Island which was a hotbed for Japanese artillery. The Marines were supported by Corsairs which dropped their bombs and rockets on Japanese positions around Ngesebus. Several days would be required to defeat the Japanese positions around Ngesebus.
                </div>
            </div>
            <div class="tl_container tl_right">
                <div class="tl_content">
                    <h2>October 15th, 1944</h2>
                    <p>On the 15th October, the 81st Infantry Division arrived to reinforce the Marines. By now the Marines were in action on the ridges of Umurbrogol. It was here that many of the Japanese fortifications had been established within the mountain's mine shafts with mortars, artillery pieces and machines guns. The Battle of Peleliu continued for a number weeks at the Mount Umurbrogol before the the U.S. troops were able to secure Umurbrogol.
                </div>
            </div>
            <div class="tl_container tl_right">
                <div class="tl_content">
                    <h2>November 27th, 1944</h2>
                    <p>The Battle of Peleliu was effectively over on the 27th November. After more than a month, Peleliu was secured by the U.S. Marines and 81st Infantry Division. They had lost approximately 1,794 troops during the battle.
                </div>
            </div>
        </div>
    </div>
    <!-- END Container -->