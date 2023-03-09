<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApp.Default" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Bronx Upload Manager</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
<!-- Powered by IIS -->

 <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
   <link href="assets/vendor/css/animate.min.css" rel="stylesheet">
  <link href="assets/vendor/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/css/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/css/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/css/swiper-bundle.min.css" rel="stylesheet">
<link href="assets/vendor/css/style.css" rel="stylesheet">

</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center">
    <div class="container d-flex align-items-center">

      <h1 class="logo me-auto"><a href="index.html">Bronx Uploader</a></h1>
    
      <nav id="navbar" class="navbar">
        <ul>
          <li><a href="index.html" class="active">Home</a></li>
          <li><a href="/Default.aspx" class="getstarted">Uploader</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero">
    <div id="heroCarousel" data-bs-interval="5000" class="carousel slide carousel-fade" data-bs-ride="carousel">

      <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

      <div class="carousel-inner" role="listbox">

        <div class="carousel-item active" style="background-image: url(assets/vendor/img/slide-2.jpg)">
          <div class="carousel-container">
            <div class="container">
              <h2 class="animate__animated animate__fadeInDown">Welcome to <span>Bronx Uploader Site</span></h2>
              <p class="animate__animated animate__fadeInUp">In this site, users will be able to upload all documents which will be handle by our Complaince Team.</p>
            <form id="form1" runat="server">
        <div>
            <asp:FileUpload ID="FileUpload1" runat="server" /><br/>
            <asp:Button ID="Button1" runat="server" Text="Upload File" OnClick="UploadFile" /><br/>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </div>
    </form>
            </div>
          </div>
        </div>

      </div>


    </div>
  </section><!-- End Hero -->

  

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/js/glightbox.min.js"></script>
  <script src="assets/vendor/js/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/js/swiper-bundle.min.js"></script>
  <script src="assets/vendor/js/noframework.waypoints.js"></script>
<script src="assets/vendor/js/main.js"></script>

</body>

</html>
