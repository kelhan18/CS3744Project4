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
            <!--<img id ="portrait" src="<?= BASE_URL ?>/public/img/maxikleber.png" alt="Maxi Kleber"  /> -->
            <!-- https://b.fssta.com/uploads/application/nba/players/1072048.vresize.350.425.medium.2.png -->

            <p><strong>Username:</strong> kelhan18</p>
            <p><strong>First Name:</strong> Keller</p>
            <p><strong>Last Name:</strong> Han</p>
            <p><strong>Email:</strong> kelhan18@vt.edu</p>
            <p><strong>Password:</strong> gui</p>
            <p><strong>DOB:</strong> July 11th, 1997</p>
            <p><strong>Profession:</strong> Student</p>
            <form>
                <p><strong>Favorite Food:</strong> (Security Question)</p>
                <div>
                    <input type="radio" id="choice1"
                           name="contact" value="pizza">
                    <label class="custom-label" for="choice1">Pizza</label>

                    <input type="radio" id="choice2"
                           name="contact" value="taco">
                    <label class="custom-label" for="choice2">Tacos</label>

                    <input type="radio" id="choice3"
                           name="contact" value="sushi">
                    <label class="custom-label" for="choice3">Sushi</label>
                </div>
            </form>


        </div>
            <!--<button type="button" class="my-button" id="add-info">Add/Edit Important Info</button>-->

        </div>
    </div>
</div>