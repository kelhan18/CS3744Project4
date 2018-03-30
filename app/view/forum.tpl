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
        <a class="nav-item nav-link" href="<?= BASE_URL ?>/stories">Stories</a>
    </li>
    <li class="nav-item">
        <a class="nav-item nav-link active" href="<?= BASE_URL ?>/forum">Forum</a>
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
        <h1 style="text-align: left;margin-left:7%;">Forum Discussion</h1>
        <ul class="breadcrumb">
            <li>Discussion Topics</li>
            <button class="btn btn-lg btn-primary btn-block" name="submit" value="Login" type="submit">New Discussion</button>
        </ul>
        <div class="row_forum" >
            <div class="col-15" style="text-align:center;border-right: double;margin-top:0;margin-right:7px; width:13%">
                <div class="posts">4</div>
                <p>Responses</p>
            </div>
            <div class="col-85" >
                <h3 style="margin-left:20px;margin-top:8px;">What would have happened if the Japanese had Nukes?</h3>
                <p  style="margin-left:20px;margin-top:8px;">July 25th, 2017</p>
            </div>
        </div>
        <div class="row_forum" >
            <div class="col-15" style="text-align:center;border-right: double;margin-top:0;margin-right:7px; width:13%">
                <div class="posts">4</div>
                <p>Responses</p>
            </div>
            <div class="col-85" >
                <h3 style="margin-left:20px;margin-top:8px;">What would have happened if the Japanese had Nukes?</h3>
                <p  style="margin-left:20px;margin-top:8px;">July 25th, 2017</p>
            </div>
        </div>
        <div class="row_forum" >
            <div class="col-15" style="text-align:center;border-right: double;margin-top:0;margin-right:7px; width:13%">
                <div class="posts">4</div>
                <p>Responses</p>
            </div>
            <div class="col-85" >
                <h3 style="margin-left:20px;margin-top:8px;">What would have happened if the Japanese had Nukes?</h3>
                <p  style="margin-left:20px;margin-top:8px;">July 25th, 2017</p>
            </div>
        </div>
        <!-- END Container -->

</div>