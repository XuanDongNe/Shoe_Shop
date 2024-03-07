<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="bean.Order"%>
<%@page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="admin/img/apple-icon.png">
<link rel="icon" type="image/png" href="../admin/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Minishop - Free Bootstrap 4 Template by Colorlib</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.1/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">
<!-- CSS Files -->
<link href="admin/css/bootstrap.min.css" rel="stylesheet" />
<link href="admin/css/now-ui-dashboard.css?v=1.5.0" rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="admin/demo/demo.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
.table-responsive {
	margin: 30px 0;
}

.table-wrapper {
	min-width: 1000px;
	background: #fff;
	padding: 20px 25px;
	border-radius: 3px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.table-wrapper .btn {
	float: right;
	color: #333;
	background-color: #fff;
	border-radius: 3px;
	border: none;
	outline: none !important;
	margin-left: 10px;
}

.table-wrapper .btn:hover {
	color: #333;
	background: #f2f2f2;
}

.table-wrapper .btn.btn-primary {
	color: #fff;
	background: #03A9F4;
}

.table-wrapper .btn.btn-primary:hover {
	background: #03a3e7;
}

.table-title .btn {
	font-size: 13px;
	border: none;
}

.table-title .btn i {
	float: left;
	font-size: 21px;
	margin-right: 5px;
}

.table-title .btn span {
	float: left;
	margin-top: 2px;
}

.table-title {
	color: #fff;
	background: #435d7d;
	padding: 16px 25px;
	margin: -20px -25px 10px;
	border-radius: 3px 3px 0 0;
}

.table-title h2 {
	margin: 5px 0 0;
	font-size: 24px;
}

.show-entries select.form-control {
	width: 60px;
	margin: 0 5px;
}

.table-filter .filter-group {
	float: right;
	margin-left: 15px;
}

.table-filter input, .table-filter select {
	height: 34px;
	border-radius: 3px;
	border-color: #ddd;
	box-shadow: none;
}

.table-filter {
	padding: 5px 0 15px;
	border-bottom: 1px solid #e9e9e9;
	margin-bottom: 5px;
}

.table-filter .btn {
	height: 34px;
}

.table-filter label {
	font-weight: normal;
	margin-left: 10px;
}

.table-filter select, .table-filter input {
	display: inline-block;
	margin-left: 5px;
}

.table-filter input {
	width: 200px;
	display: inline-block;
}

.filter-group select.form-control {
	width: 110px;
}

.filter-icon {
	float: right;
	margin-top: 7px;
}

.filter-icon i {
	font-size: 18px;
	opacity: 0.7;
}

table.table tr th, table.table tr td {
	border-color: #e9e9e9;
	padding: 12px 15px;
	vertical-align: middle;
}

table.table tr th:first-child {
	width: 60px;
}

table.table tr th:last-child {
	width: 80px;
}

table.table-striped tbody tr:nth-of-type(odd) {
	background-color: #fcfcfc;
}

table.table-striped.table-hover tbody tr:hover {
	background: #f5f5f5;
}

table.table th i {
	font-size: 13px;
	margin: 0 5px;
	cursor: pointer;
}

table.table td a {
	font-weight: bold;
	color: #566787;
	display: inline-block;
	text-decoration: none;
}

table.table td a:hover {
	color: #2196F3;
}

table.table td a.view {
	width: 30px;
	height: 30px;
	color: #2196F3;
	border: 2px solid;
	border-radius: 30px;
	text-align: center;
}

table.table td a.view i {
	font-size: 22px;
	margin: 2px 0 0 1px;
}

table.table .avatar {
	border-radius: 50%;
	vertical-align: middle;
	margin-right: 10px;
}

.status {
	font-size: 30px;
	margin: 2px 2px 0 0;
	display: inline-block;
	vertical-align: middle;
	line-height: 10px;
}

.text-success {
	color: #10c469;
}

.text-info {
	color: #62c9e8;
}

.text-warning {
	color: #FFC107;
}

.text-danger {
	color: #ff5b5b;
}

.pagination {
	float: right;
	margin: 0 0 5px;
}

.pagination li a {
	border: none;
	font-size: 13px;
	min-width: 30px;
	min-height: 30px;
	color: #999;
	margin: 0 2px;
	line-height: 30px;
	border-radius: 2px !important;
	text-align: center;
	padding: 0 6px;
}

.pagination li a:hover {
	color: #666;
}

.pagination li.active a {
	background: #03A9F4;
}

.pagination li.active a:hover {
	background: #0397d6;
}

.pagination li.disabled i {
	color: #ccc;
}

.pagination li i {
	font-size: 16px;
	padding-top: 6px
}

.hint-text {
	float: left;
	margin-top: 10px;
	font-size: 13px;
}
</style>
<script>
	$(document).ready(function() {
		$('[data-toggle="tooltip"]').tooltip();
	});
</script>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	<!-- End Navbar -->
	<div class="panel-header panel-header-sm"></div>
	<div class="container-xl">
		<div class="table-responsive">
			<div class="table-wrapper">
				<div class="table-title">
					<div class="row">
						<div class="col-sm-4">
							<h2>
								Order <b></b>
							</h2>
						</div>
						<div class="col-sm-8">
							<a href="#" class="btn btn-primary"><i class="material-icons">&#xE863;</i>
								<span>Refresh List</span></a> <a href="#" class="btn btn-secondary"><i
								class="material-icons">&#xE24D;</i> <span>Export to Excel</span></a>
						</div>
					</div>
				</div>

				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>Id</th>
							<th>Customer</th>
							<th>Order Date</th>
							<th>Net Amount</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listOrder}" var="o">
							<%
							Order order = (Order) pageContext.getAttribute("o");
							int totalPrice = (int) order.getTotalPrice();
							DecimalFormat formatter = new DecimalFormat("###,###,###");
							%>
							<tr>
								<td>${o.id}</td>
								<td><a href="#">${o.userName}</a></td>
								<td>${ o.orderDate}</td>
								<td><%=formatter.format(totalPrice)%> ₫</td>
								<td><a href="orderDetail?orderId=${o.id}" class="view"
									title="View Details" data-toggle="tooltip"><i
										class="material-icons">&#xE5C8;</i></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<!--Pagination  -->
			<div class="" style="margin-top: 2%">
				<ul class="pagination pg-orange">
					<li class="page-item"
						style="${currentPage == 1 ? 'display: none;' : ''}"><a
						class="page-link" aria-label="Previous"
						href="order?indexPage=${currentPage - 1}"> <span
							aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span>
					</a></li>
					<c:forEach begin="1" end="${endPage}" var="i">

						<li class="page-item ${currentPage == i ? 'active' : ''}"><a
							class="page-link" href="order?indexPage=${i}">${i}</a></li>
					</c:forEach>
					<li class="page-item"
						style="${currentPage == endPage ? 'display: none;' : ''}"><a
						class="page-link" aria-label="Previous"
						href="order?indexPage=${currentPage + 1}"> <span
							aria-hidden="true">&laquo;</span> <span class="sr-only">Next</span>
					</a></li>
				</ul>
			</div>
			<!-- End Pagination  -->
		</div>
	</div>

	<!--   Core JS Files   -->
	<script src="admin/js/core/jquery.min.js"></script>
	<script src="admin/js/core/popper.min.js"></script>
	<script src="admin/js/core/bootstrap.min.js"></script>
	<script src="admin/js/plugins/perfect-scrollbar.jquery.min.js"></script>
	<!--  Google Maps Plugin    -->
	<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
	<!-- Chart JS -->
	<script src="admin/js/plugins/chartjs.min.js"></script>
	<!--  Notifications Plugin    -->
	<script src="admin/js/plugins/bootstrap-notify.js"></script>
	<!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="admin/js/now-ui-dashboard.min.js?v=1.5.0"
		type="text/javascript"></script>
	<!-- Now Ui Dashboard DEMO methods, don't include it in your project! -->
	<script>
		$(document).ready(function() {
			// Javascript method's body can be found in assets/js/demos.js
			demo.initDashboardPageCharts();

		});
	</script>
</body>
</html>