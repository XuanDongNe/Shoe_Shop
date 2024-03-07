<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="bean.CartLine"%>
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
						<span class="mr-2"><a href="home">Home</a></span> <span>Cart</span>
					</p>
					<h1 class="mb-0 bread">My Wishlist</h1>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section ftco-cart">
		<div class="container">
			<div class="row">
				<div class="col-md-12 ftco-animate">
					<div class="cart-list">
						<table class="table">
							<thead class="thead-primary">
								<tr class="text-center">
									<th>&nbsp;</th>
									<th>&nbsp;</th>
									<th>Product</th>
									<th>Price</th>
									<th>Quantity</th>
									<th>Total</th>
								</tr>
							</thead>
							<%
							// Khởi tạo biến tổng số tiền
							int totalPrice = 0;
							DecimalFormat formatter = new DecimalFormat("###,###,###");
							%>

							<c:forEach items="${listPInCart}" var="c">
								<%
								CartLine product = (CartLine) pageContext.getAttribute("c");
								int price = (int) product.getPrice();
								int total_price = (int) product.getTotal_price();
								formatter = new DecimalFormat("###,###,###");
								totalPrice += total_price;
								%>


								<tbody>
									<tr class="text-center">
										<td class="product-remove"><a
											href="deleteForward?id=${c.product_id}"><span
												class="ion-ios-close"></span></a></td>

										<td class="image-prod"><div class="img"
												style="background-image:url(${c.image})"></div></td>

										<td class="product-name">${c.nameProduct}</td>

										<td class="price"><%=formatter.format(price)%> ₫</td>

										<td class="quantity">
											<div class="input-group mb-3">
												<input type="text" name="quantity"
													class="quantity form-control input-number"
													value="${c.quantity}" min="1" max="100"
													data-product-id="${c.product_id}"
													data-product-price="<%=price%>">
											</div>
										</td>

										<td class="total"><%=formatter.format(total_price)%> ₫</td>
									</tr>
								</tbody>
							</c:forEach>

						</table>
					</div>
				</div>
			</div>
			<div class="row justify-content-start">
				<div class="col col-lg-5 col-md-6 mt-5 cart-wrap ftco-animate">
					<div class="cart-total mb-3">
						<h3>Cart Totals</h3>
						<p class="d-flex">
							<span>Subtotal</span> <span><%=formatter.format(totalPrice)%>
								₫</span>
						</p>
						<p class="d-flex">
							<span>Delivery</span> <span>0 ₫</span>
						</p>
						<span>Discount</span> <span>0</span>
						</p>
						<hr>
						<p class="d-flex total-price">
							<span>Total</span> <span><%=formatter.format(totalPrice)%>
								₫</span>
						</p>
					</div>
					<p class="text-center">
						<a href="checkout.jsp?buyNow=false&price=<%=totalPrice%>"
							class="btn btn-primary py-3 px-4">Proceed to Checkout</a>
					</p>
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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>

	<script>
		$(document).ready(function() {

			var quantitiy = 0;
			$('.quantity-right-plus').click(function(e) {

				// Stop acting like a button
				e.preventDefault();
				// Get the field name
				var quantity = parseInt($('#quantity').val());

				// If is not undefined

				$('#quantity').val(quantity + 1);

				// Increment

			});

			$('.quantity-left-minus').click(function(e) {
				// Stop acting like a button
				e.preventDefault();
				// Get the field name
				var quantity = parseInt($('#quantity').val());

				// If is not undefined

				// Increment
				if (quantity > 0) {
					$('#quantity').val(quantity - 1);
				}
			});

		});
	</script>

	<script>
    // Lấy tất cả các phần tử input có class "quantity"
    var quantityInputs = document.querySelectorAll('.quantity input');

    // Thêm sự kiện "blur" cho mỗi ô input có class "quantity"
    quantityInputs.forEach(function (input) {
        input.addEventListener('blur', function () {
            updateQuantity(input);
        });
    });

    // Thêm sự kiện "enter" cho mỗi ô input có class "quantity"
    quantityInputs.forEach(function (input) {
        input.addEventListener('keydown', function (event) {
            if (event.keyCode === 13) {
                updateQuantity(input);
            }
        });
    });

    function updateQuantity(input) {
        // Khi ô input mất focus (người dùng đã nhập xong)
        var changedValue = input.value;
        var productId = input.getAttribute('data-product-id');
        var price = input.getAttribute('data-product-price');

        // Chặn trường hợp nhập quantity bé hơn 0
        if (changedValue < 0) {
            input.value = 0; // Đặt giá trị mặc định là 0 nếu dưới 0
            changedValue = 0;
        }

        // Kiểm tra nếu giá trị input không rỗng và khác null
        if (changedValue !== "" && changedValue !== null) {
            var cartUrl = '${pageContext.request.contextPath}/updateCart?pId=' +
                productId +
                '&quantity=' +
                changedValue +
                '&price=' +
                price;

            window.location.href = cartUrl;

            // Bạn có thể thực hiện các hành động khác tại đây
        }
    }
</script>


</body>
</html>