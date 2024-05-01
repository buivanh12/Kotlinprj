<?php
include '../config/action.php';

?>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Sleek - Admin Dashboard Template</title>

    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500|Poppins:400,500,600,700|Roboto:400,500" rel="stylesheet" />
    <link href="https://cdn.materialdesignicons.com/3.0.39/css/materialdesignicons.min.css" rel="stylesheet" />


    <!-- PLUGINS CSS STYLE -->


    <link href="assets/plugins/toaster/toastr.min.css" rel="stylesheet" />
    <link href="assets/plugins/nprogress/nprogress.css" rel="stylesheet" />
    <link href="assets/plugins/flag-icons/css/flag-icon.min.css" rel="stylesheet" />
    <link href="assets/plugins/jvectormap/jquery-jvectormap-2.0.3.css" rel="stylesheet" />
    <link href="assets/plugins/ladda/ladda.min.css" rel="stylesheet" />
    <link href="assets/plugins/select2/css/select2.min.css" rel="stylesheet" />
    <link href="assets/plugins/daterangepicker/daterangepicker.css" rel="stylesheet" />
    <!-- Thư viện FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <!-- SLEEK CSS -->
    <link id="sleek-css" rel="stylesheet" href="assets/css/sleek.css" />


    <!-- FAVICON -->
    <link href="assets/img/favicon.png" rel="shortcut icon" />

    <!--
      HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries
    -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="assets/plugins/nprogress/nprogress.js"></script>
</head>


<body class="sidebar-fixed sidebar-dark header-light header-fixed" id="body">
    <script>
        NProgress.configure({
            showSpinner: false
        });
        NProgress.start();
    </script>

    <div class="mobile-sticky-body-overlay"></div>

    <div class="wrapper">

        <!--
====================================
——— LEFT SIDEBAR WITH FOOTER
=====================================
-->
        <?php include_once './nav.php' ?>


        <div class="page-wrapper">
            <!-- Header -->
            <?php include_once './header.php' ?>



            <div class="content-wrapper">
                <div class="content">
                    <!-- Top Statistics -->
                    <div class="row">

                        <div class="col-lg-12">



                            <div class="row">

                                <?php
                                $id = $_GET['xemHD'];
                                $query = "SELECT
    hd.MaHD,
    hd.TenKhacHang,
    hd.id_user,
    ct.id_product,
    ct.Soluong,
    p.name_product,
    p.price,
    (p.price * ct.Soluong) AS tien,
    SUM(p.price * ct.Soluong) OVER (PARTITION BY hd.MaHD) AS tongtien
FROM
    chitiet_hd as ct
    JOIN hoadon as hd ON ct.MaHD = hd.MaHD
    JOIN products as p ON ct.id_product = p.id_product
WHERE hd.MaHD=$id";
                                $stmt = $conn->prepare($query);
                                $stmt->execute();
                                $result = $stmt->get_result();
                                $stmt1 = $conn->prepare($query);
                                $stmt1->execute();
                                $result1 = $stmt1->get_result();
                                $row1 = $result1->fetch_assoc();
                                ?>
                                <div class="col-lg-12">
                                    <div class="card card-default">
                                        <div class="card-header card-header-border-bottom">
                                            <h2>XEM CHI TIẾT HÓA ĐƠN SỐ <?= $_GET['xemHD'] ?> - KHÁCH HÀNG: <?= $row1['id_user'] ?> - <?= $row1['TenKhacHang'] ?> </h2>
                                        </div>
                                        <div class="card-body">
                                            <table class="table table-striped" id="showAllUser">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">Sản phẩm</th>
                                                        <th scope="col">Số lượng</th>
                                                        <th scope="col">Giá</th>
                                                        <th scope="col">Thành tiền</th>


                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php while ($row = $result->fetch_assoc()) { ?>

                                                        <tr>
                                                            <td><?php echo $row['name_product'] ?></td>
                                                            <td><?php echo $row['Soluong'] ?></td>
                                                            <td><?php echo $row['price'] ?></td>
                                                            <td><?php echo $row['tien'] ?></td>


                                                        </tr>
                                                    <?php } ?>
                                                </tbody>

                                            </table>
                                            <div class="card-header border-bottom">
                                                <h2>TỔNG TIỀN: <?= number_format($row1['tongtien'], 0, ',', '.') ?> đ</h2>

                                                <button onclick="printData()" style="margin-left: 10px;" type="button" class="btn btn-success">
                                                    <i class="fas fa-print"></i> In
                                                </button>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </div>

                        </div>

                        <footer class="footer mt-auto">
                            <div class="copyright bg-white">
                                <p>
                                    &copy; <span id="copy-year">2019</span> Copyright Sleek Dashboard Bootstrap Template by
                                    <a class="text-primary" href="http://www.iamabdus.com/" target="_blank">Abdus</a>.
                                </p>
                            </div>
                            <script>
                                var d = new Date();
                                var year = d.getFullYear();
                                document.getElementById("copy-year").innerHTML = year;
                            </script>


                            <script>
                                function printData() {

                                    window.print();

                                }
                            </script>
                        </footer>

                    </div>
                </div>
            </div>


            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDCn8TFXGg17HAUcNpkwtxxyT9Io9B_NcM" defer></script>
            <script src="assets/plugins/jquery/jquery.min.js"></script>
            <script src="assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script src="assets/plugins/toaster/toastr.min.js"></script>
            <script src="assets/plugins/slimscrollbar/jquery.slimscroll.min.js"></script>
            <script src="assets/plugins/charts/Chart.min.js"></script>
            <script src="assets/plugins/ladda/spin.min.js"></script>
            <script src="assets/plugins/ladda/ladda.min.js"></script>
            <script src="assets/plugins/jquery-mask-input/jquery.mask.min.js"></script>
            <script src="assets/plugins/select2/js/select2.min.js"></script>
            <script src="assets/plugins/jvectormap/jquery-jvectormap-2.0.3.min.js"></script>
            <script src="assets/plugins/jvectormap/jquery-jvectormap-world-mill.js"></script>
            <script src="assets/plugins/daterangepicker/moment.min.js"></script>
            <script src="assets/plugins/daterangepicker/daterangepicker.js"></script>
            <script src="assets/plugins/jekyll-search.min.js"></script>
            <script src="assets/js/sleek.js"></script>
            <script src="assets/js/chart.js"></script>
            <script src="assets/js/date-range.js"></script>
            <script src="assets/js/map.js"></script>
            <script src="assets/js/custom.js"></script>


            <script>
                $(document).ready(function() {

                    $('#showAllUser').dataTable({});
                });
            </script>


            <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.22/datatables.min.css" />

            <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.22/datatables.min.js"></script>


</body>

</html>