<?php include '../config/action.php';

?>
<header>
    <!-- TOP HEADER -->
    <div id="top-header">
        <div class="container">


            <ul class="header-links pull-left">

                <li><a href="#"><i class="fa fa-phone"></i> 0348521001</a></li>
                <li><a href="#"><i class="fa fa-envelope-o"></i>admin@gmail.com</a></li>
                <li><a href="#"><i class="fa fa-map-marker"></i>Bắc giang</a></li>


            </ul>
            <ul class="header-links pull-right">
                <?php if (isset($_SESSION["loged"]) && isset($_SESSION['member'])) { ?>
                    <li><a href="../user/"><i class="fa fa-user-o"></i> <?php echo $_SESSION['name'] ?></a>
                    <li><a href=""><i class="fa fa-plus-circle"></i> Điểm tích lũy: <?= $_SESSION["tichdiem"] ?> </a>
                    <li><a href="../client/logout.php"><i class="fa fa-user-o"></i> Đăng Xuất</a>

                    <?php } elseif (isset($_SESSION["loged"]) && isset($_SESSION['admin'])) {
                    ?>

                    <li><a href="../admin/index.php"><i class="fa fa-user-o"></i> <?php echo $_SESSION['name'] ?></a>
                    <li><a href=""><i class="fa fa-plus-circle"></i> Điểm tích lũy: <?= $_SESSION["tichdiem"] ?> </a>
                    <li><a href="../client/logout.php"><i class="fa fa-user-o"></i> Đăng Xuất</a>
                    <?php
                } else {
                    ?>
                    <li><a href="../client/login.php"><i class="fa fa-user-o"></i> Tài Khoản</a>
                    <?php

                } ?>
                    </li>
            </ul>
        </div>
    </div>


    <!-- /TOP HEADER -->

    <!-- MAIN HEADER -->
    <div id="header">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- LOGO -->
                <div class="col-md-3">
                    <div class="header-logo">


                    </div>
                </div>
                <!-- /LOGO -->

                <!-- SEARCH BAR -->
                <div class="col-md-6">
                    <div class="header-search">
                        <form action="" method="post">
                            <select class="input-select">
                                <option value="0">Tất Cả</option>
                            </select>
                            <input class="input" name="searchProduct" placeholder="Nhập Sản Phẩm muốn tìm">
                            <button class="search-btn" type="submit" name="submitSearchProduct">Tìm Kiếm</button>
                        </form>
                    </div>
                </div>
                <!-- /SEARCH BAR -->

                <!-- ACCOUNT -->
                <div class="col-md-3 clearfix">
                    <div class="header-ctn">
                        <!-- Wishlist -->

                    </div>
                    <!-- /Cart -->


                    <!-- /Menu Toogle -->
                </div>
            </div>
            <!-- /ACCOUNT -->
        </div>
        <!-- row -->
    </div>
    <!-- container -->
    </div>
    <!-- /MAIN HEADER -->
</header>
<!-- /HEADER -->
<!-- NAVIGATION -->
<nav id="navigation">
    <!-- container -->
    <div class="container">
        <!-- responsive-nav -->
        <div id="responsive-nav">
            <!-- NAV -->

            <ul class="main-nav nav navbar-nav">
                <li class="active"><a href="../client">Trang Chủ</a></li>
                <?php $query2 = 'SELECT * FROM brand';
                $stmt2 = $conn->prepare($query2);
                $stmt2->execute();
                $result2 = $stmt2->get_result();
                ?>
                <?php while ($row2 = $result2->fetch_assoc()) { ?>
                    <li>
                        <a href="../client/store.php?detailsBrand=<?= $row2['id_brand']; ?>"><?= $row2['name_brand'] ?></a>
                    </li>
                <?php } ?>
                <li><a href="../client/store.php">Tất Cả Sản Phẩm</a></li>
            </ul>

            <!-- /NAV -->
        </div>
        <!-- /responsive-nav -->
    </div>
    <!-- /container -->
</nav>
<!-- /NAVIGATION -->