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
        <div id="person-info">
            <h1 id="name">Maxi Kleber</h1>
            <img id ="portrait" src="<?= BASE_URL ?>/public/img/maxikleber.png" alt="Maxi Kleber"  />
            <!-- https://b.fssta.com/uploads/application/nba/players/1072048.vresize.350.425.medium.2.png -->

            <p><strong>DOB:</strong> January 29, 1992</p>
            <p><strong>Death:</strong> N/A</p>
            <p><strong>Birthplace:</strong> Wurzburg, Germany</p>
            <p><strong>Gender:</strong> Male</p>
            <p><strong>Height:</strong> 6' 11''</p>
            <p><strong>Weight:</strong> 220lbs</p>
            <p><strong>Profession:</strong> NBA Player</p>
            <!--<button type="button" class="my-button" id="add-info">Add/Edit Important Info</button>-->
            <button type="button" class="my-button btn btn-outline-primary" id="add-info">Add/Edit Important Info</button>

            <div class="hide align-input" id="info-form">
                <button id="close-info" style="float: right;">X</button>
                <form>
                    Title:<br>
                    <input type="text" class="text" name="identifier" id="identifier">
                    <br>
                    Description:<br>
                    <input type="text" class="text" name="description" id="description">
                    <br><br>
                    <button type="button" class="my-button" id="submit-basic-info">Submit</button>
                </form>
            </div>


            <div id="check-family">
                <h2>Check Family Geneaology</h2>
                <!--<button type="button" class="my-button" id="check-family-button">Family Geneaology</button>-->
                <button type="button" class="my-button btn btn-outline-primary" id="check-family-button">Family Geneaology</button>

            </div>
        </div>
    </div>
</div>