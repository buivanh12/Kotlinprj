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
                                    <h2>Thêm/Sửa Hóa Đơn</h2>
                                </div>

                                <div class="card-body">
                                    <form action="" enctype="multipart/form-data" method="POST">

                                        <div class="form-row">

                                            <div class="col-md-12 mb-12">
                                                <label>Khách hàng</label>

                                                <?php $query = 'SELECT * FROM users';
                                                $stmt = $conn->prepare($query);
                                                $stmt->execute();
                                                $result = $stmt->get_result();
                                                ?>

                                                <select class="form-control" name="id_KH" id="exampleFormControlSelect3">
                                                    <?php while ($row = $result->fetch_assoc()) { ?>
                                                        <option value="<?= $row['id_user'] . '-' . $row['name'] ?>"><?php echo $row['id_user'] . '_' . $row['name'] ?></option>
                                                    <?php } ?>
                                                </select>

                                                <div class="valid-feedback">
                                                </div>
                                                <label>Số điện thoại</label>
                                                <input type="number" class="form-control" name="sdt_HD" placeholder="Nhập Số Điện Thoại" value="<?= $sdt_HD; ?>" required="">
                                                <div class="valid-feedback">
                                                </div>
                                                <label>Ngày</label>
                                                <input type="date" class="form-control" name="ngay_HD" placeholder="Nhập " value="<?= $ngay_HD; ?>" required="">
                                                <div class="valid-feedback">
                                                </div>
                                                <label>Mã giảm giá</label>

                                                <?php $query = 'SELECT * FROM giamgia';
                                                $stmt = $conn->prepare($query);
                                                $stmt->execute();
                                                $result = $stmt->get_result();
                                                ?>

                                                <select class="form-control" name="id_gg" id="exampleFormControlSelect3">
                                                    <?php while ($row = $result->fetch_assoc()) { ?>
                                                        <option value="<?= $row['ID'] ?>"><?php echo $row['ID'] . '_' . $row['Ten'] ?></option>
                                                    <?php } ?>
                                                </select>
                                                <div class="valid-feedback">
                                                </div>
                                            </div>



                                        </div>




                                        <?php if ($update_brand == true) { ?>
                                            <input type="submit" name="updateHD" class="btn btn-success btn-block" value="Xác Nhận Cập Nhật">
                                        <?php } else { ?>
                                            <input type="submit" name="insertHD" class="btn btn-primary btn-block" value="Thêm Hóa Đơn">
                                        <?php } ?>
                                    </form>

                                </div>
                            </div>


                            <div class="row">
                                <?php $query = 'SELECT * FROM HoaDon,giamgia where hoadon.id_gg=giamgia.ID';
                                $stmt = $conn->prepare($query);
                                $stmt->execute();
                                $result = $stmt->get_result();
                                ?>
                                <div class="col-lg-12">
                                    <div class="card card-default">
                                        <div class="card-header card-header-border-bottom">
                                            <h2>Quản Lý Hóa đơn</h2>
                                        </div>
                                        <div class="card-body">
                                            <table class="table table-striped" id="showAllUser">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">Mã hóa đơn</th>
                                                        <th scope="col">Tên Khách hàng</th>
                                                        <th scope="col">Số điện thoại</th>
                                                        <th scope="col">Giá trị giảm giá</th>
                                                        <th scope="col">Ngày mua</th>
                                                        <th scope="col">Thao Tác</th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php while ($row = $result->fetch_assoc()) { ?>

                                                        <tr>
                                                            <td><?php echo $row['MaHD'] ?></td>
                                                            <td><?php echo $row['TenKhacHang'] ?></td>
                                                            <td><?php echo $row['SDT'] ?></td>
                                                            <td><?php echo $row['GiaTriGiamGia'] ?></td>
                                                            <td><?php echo date('d-m-Y', strtotime($row['Ngay'])); ?></td>

                                                            <td>
                                                                <a href="../config/action.php?deleteHD=<?= $row['MaHD']; ?>" class="badge badge-danger p-2" onclick="return confirm('Do you want delete this record?');">Xóa</a>
                                                                <a href="HD.php?editHD=<?= $row['MaHD']; ?>" class="badge badge-success p-2">Sửa</a>
                                                                <a href="themHD.php?id_HD=<?= $row['MaHD']; ?>" class="badge badge-success p-2">Thêm sản phẩm</a>
                                                                <a href="xemchitietHD.php?xemHD=<?= $row['MaHD']; ?>" class="badge badge-success p-2">Xem chi tiết</a>
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