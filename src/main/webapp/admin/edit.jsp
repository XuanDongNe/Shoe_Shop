<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="bean.Product"%>
<%@page import="bean.Category"%>
<%@page import="dao.CategoryDao"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="admin/img/apple-icon.png">
<link rel="icon" type="image/png" href="admin/img/favicon.png">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Minishop - Free Bootstrap 4 Template by Colorlib</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
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
<link rel="stylesheet" href="admin/css/bootstrap.min.css">
<!-- CSS Just for demo purpose, don't include it in your project -->
</head>
<style>
body {
	font-size: 16px;
}

.modal-dialog {
	max-width: 500px;
	margin: 100px auto;
}

.modal-content {
	border-radius: 5px;
}

.modal-header {
	background: #435d7d;
	color: white;
	border-bottom: none;
	padding: 15px;
	text-align: center;
	border-radius: 5px 5px 0 0;
}

.modal-body {
	padding: 22px;
}

.modal-title {
	font-size: 24px;
}

.modal-footer {
	background-color: #f4f3ef;
	padding: 10px;
	border-radius: 0 0 5px 5px;
}

.form-group {
	margin-bottom: 20px;
}

.form-control {
	width: 100%;
	padding: 10px 0px 10px 10px;
	border-radius: 5px;
	border: 1px solid #ccc;
	margin-top: 6px;
}

.btn-default {
	background-color: #ccc;
	color: #fff;
}

.btn-info {
	background-color: #5e72e4;
	color: #fff;
}

.modal-content {
	border-radius: 5px;
	box-shadow: 0 1px 6px rgba(0, 7, 6, 11.0);
}

.modal-header {
	background: #435d7d;
	color: white;
	border-bottom: 2px solid #5e72e4;
	/* Màu sắc và độ dày của đường viền */
	padding: 15px;
	text-align: center;
	border-radius: 5px 5px 0 0;
}

.modal-footer {
	background-color: #435d7d;
	padding: 10px;
	border-radius: 0 0 5px 5px;
}

button {
	padding: 5px;
}

button:hover {
	cursor: pointer;
	background: green;
}
</style>
</head>

<body>

	 <jsp:include page="header.jsp"></jsp:include>
	<!-- End Navbar -->
	<div class="panel-header panel-header-sm"></div>

	 <div id="editEmployeeModal" class="modal fade show" aria-modal="true" style="display: block;">
		<div class="modal-dialog">
			<div class="modal-content">
				<form>
					<div class="modal-header">
						<h4 class="modal-title">Edit Product</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Name</label> <input type="text" class="form-control"
								required value="${detailProduct.pName}">
						</div>
						<div class="form-group">
							<label>Image</label> <input type="email" class="form-control"
								required value="${detailProduct.pImage}">
						</div>
						<div class="form-group">
							<label>Address</label>
							<textarea class="form-control" required></textarea>
						</div>
						<div class="form-group">
							<label>Phone</label> <input type="text" class="form-control"
								required>
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel"> <input type="submit"
							class="btn btn-success" value="Add">
					</div>
			</div>
		</div>
	</div>

	<!--   Core JS Files   -->
	<script src="admin/js/core/jquery.min.js"></script>
	<script src="admin/js/core/popper.min.js"></script>
	<script src="admin/js/core/bootstrap.min.js"></script>
	<script src="admin/js/plugins/perfect-scrollbar.jquery.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
	<script src="admin/js/plugins/chartjs.min.js"></script>
	<script src="admin/js/plugins/bootstrap-notify.js"></script>
	<!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="admin/js/now-ui-dashboard.min.js?v=1.5.0"
		type="text/javascript"></script>
</body>
</html>

