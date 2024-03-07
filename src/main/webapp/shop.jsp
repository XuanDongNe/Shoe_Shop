<%@page import="bean.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Minishop - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800"
	rel="stylesheet">

<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">

<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">

<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/ionicons.min.css">

<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">


<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">
</head>

<style>
.hidden {
	display: none;
}
</style>

<body class="goto-here">
	<jsp:include page="header.jsp"></jsp:include>

	<!-- END nav -->

	<div class="hero-wrap hero-bread"
		style="background-image: url('images/bg_6.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="home">Home</a></span> <span>Shop</span>
					</p>
					<h1 class="mb-0 bread">Shop</h1>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-lg-10 order-md-last">
					<form action="search" method="get" class="form-inline"
						style="margin-bottom: 10px;">
						<input class="form-control mr-sm-2" type="search"
							placeholder="Tìm kiếm sản phẩm" aria-label="Search "
							name="search"
							style="border-radius: 7px; height: 40px !important; width: 400px;">
						<button class="btn btn-outline-success my-2 my-sm-0" type="submit"
							style="padding: 9px 12px;">Search</button>
					</form>

					<div class="row">
						<c:forEach items="${listP}" var="p">
							<%
							Product product = (Product) pageContext.getAttribute("p");
							int price = (int) product.getPrice();
							DecimalFormat formatter = new DecimalFormat("###,###,###");
							%>
							<div class="col-sm-12 col-md-12 col-lg-4 ftco-animate d-flex">
								<div class="product d-flex flex-column">
									<a href="singleProduct?pId=${p.pId}" class="img-prod"><img
										class="img-fluid" src="${p.pImage}" alt="Colorlib Template">
										<div class="overlay"></div> </a>
									<div class="text py-3 pb-4 px-3">
										<div class="d-flex">
											<div class="cat"></div>
											<div class="rating">
												<p class="text-right mb-0">
													<a href="#"><span class="ion-ios-star-outline"></span></a>
													<a href="#"><span class="ion-ios-star-outline"></span></a>
													<a href="#"><span class="ion-ios-star-outline"></span></a>
													<a href="#"><span class="ion-ios-star-outline"></span></a>
													<a href="#"><span class="ion-ios-star-outline"></span></a>
												</p>
											</div>
										</div>
										<h3>
											<a href="singleProduct?pId=${p.pId}">${p.pName}</a>
										</h3>
										<div class="pricing">
											<p class="price">
												<span><%=formatter.format(price)%> ₫</span>
											</p>
										</div>
										<p class="bottom-area d-flex px-3">
											<a
												href="addToCart?pId=${p.pId}&quantity=1&price=${p.price}&isShop=true"
												class="add-to-cart text-center py-2 mr-1"><span>Add
													to cart <i class="ion-ios-add ml-1"></i>
											</span></a> <a
												href="buyForward?pId=${p.pId}&quantity=1&price=${p.price}&buyNow=true"
												class="buy-now text-center py-2">Buy now<span><i
													class="ion-ios-cart ml-1"></i></span></a>
										</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>





					<!-- Pagination -->
					<div class="">
						<ul class="pagination pg-orange">
							<li class="page-item"
								style="${currentPage == 1 ? 'display: none;' : ''}"><a
								class="page-link" aria-label="Previous"
								href="${isSelect}indexPage=${currentPage - 1}"> <span
									aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span>
							</a></li>
							<c:forEach begin="1" end="${endPage}" var="i">
								<li class="page-item ${currentPage == i ? 'active' : ''}"
									style="${endPage < 2 ? 'display: none;' : ''}"><a
									class="page-link" href="${isSelect}indexPage=${i}">${i}</a></li>
							</c:forEach>
							<li class="page-item"
								style="${currentPage == endPage ? 'display: none;' : ''}">
								<a class="page-link" aria-label="Next"
								href="${isSelect}indexPage=${currentPage + 1}"> <span
									aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
							</a>
							</li>

						</ul>
					</div>
					<!-- End Pagination -->

				</div>

				<div class="col-md-4 col-lg-2">
					<div class="sidebar">
						<div class="sidebar-box-2">
							<h2 class="heading">Categories</h2>
							<div class="fancy-collapse-panel">
								<div class="panel-group" id="accordion" role="tablist"
									aria-multiselectable="true">
									<div class="panel panel-default">
										<div class="panel-heading" role="tab" id="headingOne">
											<h4 class="panel-title">
												<a href="shop">All </a>
											</h4>
										</div>



										<div class="panel-heading" role="tab" id="headingFour">
											<h4 class="panel-title">
												<a class="collapsed" data-toggle="collapse"
													data-parent="#accordion" href="#collapseFour"
													aria-expanded="false" aria-controls="collapseThree">Brands
												</a>
											</h4>
										</div>
										<div id="collapseFour" class="panel-collapse collapse"
											role="tabpanel" aria-labelledby="headingFour">
											<div class="panel-body">
												<c:forEach items="${listC}" var="c">
													<ul>
														<li><a href="category?cid=${c.category_id}"
															class="${tag == c.category_id ? "active": ""}" >${c.category_name}
														</a></li>

													</ul>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="sidebar-box-2">
							<h2 class="heading">Price Range</h2>
							<div class="row">
								<form action="shop" method="get">
									<div class="col-md-12">
										<div class="form-group">
											<label for="guests">Price from:</label> <input
												class="form-control mr-sm-2" type="search" name="priceFrom"
												style="border-radius: 7px; height: 40px !important; width: 100%;"
												onfocus="showMessage(this)" onblur="hideMessage(this)">
											<div id="priceFromMessage" style="display: none; color: red;">Press
												Enter to confirm</div>
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label for="guests">Price to:</label> <input
												class="form-control mr-sm-2" type="search" name="priceTo"
												style="border-radius: 7px; height: 40px !important; width: 100%;"
												onfocus="showMessage(this)" onblur="hideMessage(this)">
											<div id="priceToMessage" style="display: none; color: red;">Press
												Enter to confirm</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-gallery">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-8 heading-section text-center mb-4 ftco-animate">
					<h2 class="mb-4">Follow Us On Instagram</h2>
					<p>Far far away, behind the word mountains, far from the
						countries Vokalia and Consonantia, there live the blind texts.
						Separated they live in</p>
				</div>
			</div>
		</div>
		<div class="container-fluid px-0">
			<div class="row no-gutters">
				<div class="col-md-4 col-lg-2 ftco-animate">
					<a href="images/gallery-1.jpg"
						class="gallery image-popup img d-flex align-items-center"
						style="background-image: url(images/gallery-1.jpg);">
						<div
							class="icon mb-4 d-flex align-items-center justify-content-center">
							<span class="icon-instagram"></span>
						</div>
					</a>
				</div>
				<div class="col-md-4 col-lg-2 ftco-animate">
					<a href="images/gallery-2.jpg"
						class="gallery image-popup img d-flex align-items-center"
						style="background-image: url(images/gallery-2.jpg);">
						<div
							class="icon mb-4 d-flex align-items-center justify-content-center">
							<span class="icon-instagram"></span>
						</div>
					</a>
				</div>
				<div class="col-md-4 col-lg-2 ftco-animate">
					<a href="images/gallery-3.jpg"
						class="gallery image-popup img d-flex align-items-center"
						style="background-image: url(images/gallery-3.jpg);">
						<div
							class="icon mb-4 d-flex align-items-center justify-content-center">
							<span class="icon-instagram"></span>
						</div>
					</a>
				</div>
				<div class="col-md-4 col-lg-2 ftco-animate">
					<a href="images/gallery-4.jpg"
						class="gallery image-popup img d-flex align-items-center"
						style="background-image: url(images/gallery-4.jpg);">
						<div
							class="icon mb-4 d-flex align-items-center justify-content-center">
							<span class="icon-instagram"></span>
						</div>
					</a>
				</div>
				<div class="col-md-4 col-lg-2 ftco-animate">
					<a href="images/gallery-5.jpg"
						class="gallery image-popup img d-flex align-items-center"
						style="background-image: url(images/gallery-5.jpg);">
						<div
							class="icon mb-4 d-flex align-items-center justify-content-center">
							<span class="icon-instagram"></span>
						</div>
					</a>
				</div>
				<div class="col-md-4 col-lg-2 ftco-animate">
					<a href="images/gallery-6.jpg"
						class="gallery image-popup img d-flex align-items-center"
						style="background-image: url(images/gallery-6.jpg);">
						<div
							class="icon mb-4 d-flex align-items-center justify-content-center">
							<span class="icon-instagram"></span>
						</div>
					</a>
				</div>
			</div>
		</div>
	</section>

	<footer class="ftco-footer ftco-section">
		<div class="container">
			<div class="row">
				<div class="mouse">
					<a href="#" class="mouse-icon">
						<div class="mouse-wheel">
							<span class="ion-ios-arrow-up"></span>
						</div>
					</a>
				</div>
			</div>
			<div class="row mb-5">
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Minishop</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia and Consonantia.</p>
						<ul
							class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
							<li class="ftco-animate"><a href="#"><span
									class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4 ml-md-5">
						<h2 class="ftco-heading-2">Menu</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">Shop</a></li>
							<li><a href="#" class="py-2 d-block">About</a></li>
							<li><a href="#" class="py-2 d-block">Journal</a></li>
							<li><a href="#" class="py-2 d-block">Contact Us</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-4">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Help</h2>
						<div class="d-flex">
							<ul class="list-unstyled mr-l-5 pr-l-3 mr-4">
								<li><a href="#" class="py-2 d-block">Shipping
										Information</a></li>
								<li><a href="#" class="py-2 d-block">Returns &amp;
										Exchange</a></li>
								<li><a href="#" class="py-2 d-block">Terms &amp;
										Conditions</a></li>
								<li><a href="#" class="py-2 d-block">Privacy Policy</a></li>
							</ul>
							<ul class="list-unstyled">
								<li><a href="#" class="py-2 d-block">FAQs</a></li>
								<li><a href="#" class="py-2 d-block">Contact</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Have a Questions?</h2>
						<div class="block-23 mb-3">
							<ul>
								<li><span class="icon icon-map-marker"></span><span
									class="text">203 Fake St. Mountain View, San Francisco,
										California, USA</span></li>
								<li><a href="#"><span class="icon icon-phone"></span><span
										class="text">+2 392 3929 210</span></a></li>
								<li><a href="#"><span class="icon icon-envelope"></span><span
										class="text">info@yourdomain.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="icon-heart color-danger" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	<script>
		function showMessage(input) {
			var messageElement = document
					.getElementById(input.name + "Message");
			if (messageElement) {
				messageElement.style.display = "block";
			}
		}

		function hideMessage(input) {
			var messageElement = document
					.getElementById(input.name + "Message");
			if (messageElement) {
				messageElement.style.display = "none";
			}
		}
	</script>



	<script>
		document
				.addEventListener(
						"DOMContentLoaded",
						function() {
							var priceFromInput = document
									.querySelector('input[name="priceFrom"]');
							var priceToInput = document
									.querySelector('input[name="priceTo"]');

							// Thêm sự kiện "keydown" cho priceFromInput
							priceFromInput.addEventListener('keydown',
									function(event) {
										if (event.keyCode === 13) { // Kiểm tra xem phím Enter đã được nhấn hay chưa
											updatePrices();
										}
									});

							// Thêm sự kiện "keydown" cho priceToInput
							priceToInput.addEventListener('keydown', function(
									event) {
								if (event.keyCode === 13) { // Kiểm tra xem phím Enter đã được nhấn hay chưa
									updatePrices();
								}
							});

							function updatePrices() {
								var priceFrom = parseFloat(priceFromInput.value);
								var priceTo = parseFloat(priceToInput.value);

								// Kiểm tra nếu giá trị của priceFrom bé hơn 0, gán giá trị mặc định là 0
								if (priceFrom < 0 || isNaN(priceFrom)) {
									priceFromInput.value = 0;
									priceFrom = 0;
								}

								// Kiểm tra nếu giá trị của priceTo bé hơn 0, gán giá trị mặc định là 0
								if (priceTo < 0 || isNaN(priceTo)) {
									priceToInput.value = 0;
									priceTo = 0;
								}

								// So sánh giá trị giữa priceFrom và priceTo
								if (priceFrom > priceTo) {
									// Nếu priceFrom lớn hơn priceTo, đổi chỗ giá trị
									var temp = priceFrom;
									priceFrom = priceTo;
									priceTo = temp;
								}

								// lấy categoryId 
								var categoryId = "${requestScope.tag}";

								// gọi servlet Cateogory Controller sử lý
								if (categoryId != null) {
									var cartUrl = '${pageContext.request.contextPath}/category?priceFrom='
											+ priceFrom
											+ '&priceTo='
											+ priceTo
											+ '&cid=' + categoryId;
								}
								// gọi servlet Shop Forward sử lý
								else {
									var cartUrl = '${pageContext.request.contextPath}/shop?priceFrom='
											+ priceFrom + '&priceTo=' + priceTo;

								}

								window.location.href = cartUrl;
							}
						});
	</script>


	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/scrollax.min.js"></script>
	<script src="js/main.js"></script>

</body>
</html>