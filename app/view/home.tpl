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
                was fought between the U.S. and Japan during WWII, from September to November 1944
                on the island of Peleliu in the Pacific.</h2>
            </header>
            <ul class="icons major">
                <li><span class="icon fa-diamond major style1"><span class="label">Lorem</span></span></li>
                <li><span class="icon fa-heart-o major style2"><span class="label">Ipsum</span></span></li>
                <li><span class="icon fa-code major style3"><span class="label">Dolor</span></span></li>
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


<!--
<div class="main">
  <br>

  <div class="main-content">

    <h2 style="text-align: left;margin-left:7%;">The Battle of Peleliu: A Controversial Attack</h2>
    <div class="videoWrapper">
      <iframe width="560" height="349" src="https://www.youtube.com/embed/iEZCNTedeEk" allowfullscreen></iframe>
    </div>
    <p class="videoComment">The Battle of Peleliu, codenamed Operation Stalemate II by the United States military, was fought between the U.S. and Japan during the Mariana and Palau Campaign of World War II, from September
      to November 1944, on the island of Peleliu. U.S. Marines of the 1st Marine Division, and later soldiers of the U.S. Army's 81st Infantry Division, fought to capture an airstrip on the small coral island.</p>

    <div class="homeContent">
      <div class="row">
        <div class="col-85">
          <h2>Background</h2>
          <p>
            By 1944, American victories in the Southwest and Central Pacific had brought the war closer to Japan, with American bombers able to strike at the Japanese main islands from air bases secured during the Mariana Islands campaign (June–August 1944). There was disagreement among the U.S. Joint Chiefs over two proposed strategies to defeat the Japanese Empire. The strategy proposed by General Douglas MacArthur called for the recapture of the Philippines, followed by the capture of Okinawa, then an attack on the Japanese mainland. Admiral Chester Nimitz favored a more direct strategy of bypassing the Philippines, but seizing Okinawa and Taiwan as staging areas to an attack on the Japanese mainland, followed by the future invasion of Japan's southernmost islands. Both strategies included the invasion of Peleliu, but for different reasons.
          </p>
        </div>
        <div class="col-15" style="padding-top:60px">
          <div class="homeContent_photo">
            <img src="<?= BASE_URL ?>/public/img/portraits/img_avatar.png" alt="Jane" style="width:100%;">
          </div>
        </div>
      </div>

      <div class="row" >
        <p>After their losses in the Solomons, Gilberts, Marshalls and Marianas, the Imperial Army assembled a research team to develop new island-defense tactics. They chose to abandon the old strategy of stopping the enemy at the beach. The new tactics would only disrupt the landings at the water's edge and depend on an in-depth defense farther inland. Colonel Nakagawa used the rough terrain to his advantage, by constructing a system of heavily fortified bunkers, caves and underground positions all interlocked into a "honeycomb" system. The old "banzai charge" attack was also discontinued as being both wasteful of men and ineffective. These changes would force the Americans into a war of attrition requiring increasingly more resources.</p>
      </div>

      <div class="row" >
        <p>
          Cave entrances were built slanted as a defense against grenade and flamethrower attacks. The caves and bunkers were connected to a vast system throughout central Peleliu, which allowed the Japanese to evacuate or reoccupy positions as needed, and to take advantage of shrinking interior lines.
        </p>
      </div>

      <div class="row">
        <h2>Rising Tension</h2>
        <p>
          By 1944, American victories in the Southwest and Central Pacific had brought the war closer to Japan, with American bombers able to strike at the Japanese main islands from air bases secured during the Mariana Islands campaign (June–August 1944). There was disagreement among the U.S. Joint Chiefs over two proposed strategies to defeat the Japanese Empire. The strategy proposed by General Douglas MacArthur called for the recapture of the Philippines, followed by the capture of Okinawa, then an attack on the Japanese mainland. Admiral Chester Nimitz favored a more direct strategy of bypassing the Philippines, but seizing Okinawa and Taiwan as staging areas to an attack on the Japanese mainland, followed by the future invasion of Japan's southernmost islands. Both strategies included the invasion of Peleliu, but for different reasons.
        </p>
      </div>

      <div class="row">
        <div class="col-85">
          <p>
            By 1944, American victories in the Southwest and Central Pacific had brought the war closer to Japan, with American bombers able to strike at the Japanese main islands from air bases secured during the Mariana Islands campaign (June–August 1944). There was disagreement among the U.S. Joint Chiefs over two proposed strategies to defeat the Japanese Empire. The strategy proposed by General Douglas MacArthur called for the recapture of the Philippines, followed by the capture of Okinawa, then an attack on the Japanese mainland. The strategy proposed by General Douglas MacArthur called for the recapture of the Philippines, followed by the capture of Okinawa, then an attack on the Japanese mainland. There was disagreement among the U.S. Joint Chiefs over two proposed strategies to defeat the Japanese Empire.
          </p>
        </div>
        <div class="col-15">
          <div class="homeContent_photo">
            <img src="<?= BASE_URL ?>/public/img/portraits/img_avatar.png" alt="Jane" style="width:100%;">
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col-15">
          <h2>The Battle</h2>
          <div class="homeContent_photo">
            <img src="<?= BASE_URL ?>/public/img/portraits/img_avatar.png" alt="Jane" style="width:100%;">
          </div>
        </div>
        <div class="col-85">
          <p style="padding-left:8px;padding-top:60px;">
            By 1944, American victories in the Southwest and Central Pacific had brought the war closer to Japan, with American bombers able to strike at the Japanese main islands from air bases secured during the Mariana Islands campaign (June–August 1944). There was disagreement among the U.S. Joint Chiefs over two proposed strategies to defeat the Japanese Empire. The strategy proposed by General Douglas MacArthur called for the recapture of the Philippines, followed by the capture of Okinawa, then an attack on the Japanese mainland. Admiral Chester Nimitz favored a more direct strategy of bypassing the Philippines, but seizing Okinawa and Taiwan as staging areas to an attack on the Japanese mainland, followed by the future invasion of Japan's southernmost islands. Both strategies included the invasion of Peleliu, but for different reasons.
          </p>
        </div>
      </div>

    </div>
-->