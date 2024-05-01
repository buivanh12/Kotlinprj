<?php
include '../config/action.php';
if (isset($_SESSION["member"])) {
    header("Location:../client/");
}
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
                            <div class="card card-default">
                                <div class="card-header card-header-border-bottom">
                                    <h2>Thêm/Sửa sản phẩm Hóa Đơn</h2>
                                </div>

                                <div class="card-body">
                                    <form action="" enctype="multipart/form-data" method="post">

                                        <div class="form-row">

                                            <div class="col-md-12 mb-12">
                                                <input type="hidden" name="id_HD" value="<?php echo $_GET['id_HD'] ?>" <label>Sản phẩm</label>
                                                <?php $query = 'SELECT * FROM products';
                                                $stmt = $conn->prepare($query);
                                                $stmt->execute();
                                                $result = $stmt->get_result();
                                                ?>

                                                <select class="form-control" name="id_sanpham" id="exampleFormControlSelect3">
                                                    <?php while ($row = $result->fetch_assoc()) { ?>
                                                        <option value="<?= $row['id_product'] ?>"><?php echo $row['id_product'] . '_' . $row['name_product'] ?></option>
                                                    <?php } ?>
                                                </select>
                                            </div>
                                            <div class="valid-feedback">
                                            </div>
                                            <label>Số lượng</label>
                                            <input type="number" class="form-control" name="Soluong" placeholder="Nhập Số Lượng" value="<?= $sdt_HD; ?>" required="">
                                            <div class="valid-feedback">
                                            </div>

                                        </div>



                                </div>




                                <?php if ($update_brand == true) { ?>
                                    <input type="submit" name="updateSP_HD" class="btn btn-success btn-block" value="Xác Nhận Cập Nhật">
                                <?php } else { ?>
                                    <input type="submit" name="insertSP_HD" class="btn btn-primary btn-block" value="Thêm sản phẩm">
                                <?php } ?>
                                </form>

                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <?php
                        $id = $_GET['id_HD'];

                        $query = "SELECT MaHD,name_product as Ten,Soluong,chitiet_hd.id_product FROM chitiet_hd, products WHERE chitiet_hd.id_product=products.id_product and MaHD=$id order by MaHD";
                        $stmt = $conn->prepare($query);
                        $stmt->execute();
                        $result = $stmt->get_result();
                        ?>
                        <div class="col-lg-12">
                            <div class="card card-default">
                                <div class="card-header card-header-border-bottom">
                                    <h2>Quản Lý Chi Tiết Hóa đơn</h2>
                                </div>
                                <div class="card-body">



                                    <table class="table " id="showAllUser">
                                        <thead>
                                            <tr>
                                                <th scope="col">Mã hóa đơn</th>
                                                <th scope="col">Sản phẩm</th>
                                                <th scope="col">Số lượng</th>
                                                <th scope="col">Thao Tác</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php while ($row = $result->fetch_assoc()) { ?>

                                                <tr>
                                                    <td><?php echo $row['MaHD'] ?></td>
                                                    <td><?php echo $row['Ten'] ?></td>
                                                    <td><?php echo $row['Soluong'] ?></td>


                                                    <td>
                                                        <a href="../config/action.php?deleteCT_HD=<?= $row['MaHD']; ?>&&id_sp=<?= $row['id_product'] ?>" class="badge badge-danger p-2" onclick="return confirm('Do you want delete this record?');">Xóa</a>


                                                    </td>
                                                </tr>
                                            <?php } ?>
                                        </tbody>
                                    </table>
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