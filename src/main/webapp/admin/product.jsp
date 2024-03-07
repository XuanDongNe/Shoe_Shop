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
.table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	padding: 12px;
	text-align: left;
	font-size: 16px;
}

thead th {
	background-color: #f2f2f2;
	text-align: center;
}

tbody td {
	text-align: center;
}

.img-fluid {
	display: block;
	margin: auto;
	width: 40%;
	height: 25%;
}
</style>


<style>
body {
	color: #566787;
	background: #f5f5f5;
	font-family: 'Varela Round', sans-serif;
	font-size: 13px;
}

.table-responsive {
	margin: 30px 0;
}

.table-wrapper {
	background: #fff;
	padding: 20px 25px;
	border-radius: 3px;
	min-width: 1000px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.table-title {
	padding-bottom: 15px;
	background: #435d7d;
	color: #fff;
	padding: 16px 30px;
	min-width: 100%;
	margin: -20px -25px 10px;
	border-radius: 3px 3px 0 0;
}

.table-title h2 {
	margin: 5px 0 0;
	font-size: 24px;
}

.table-title .btn-group {
	float: right;
}

.table-title .btn {
	color: #fff;
	float: right;
	font-size: 13px;
	border: none;
	min-width: 50px;
	border-radius: 2px;
	border: none;
	outline: none !important;
	margin-left: 10px;
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

table.table tr th, table.table tr td {
	border-color: #e9e9e9;
	padding: 12px 15px;
	vertical-align: middle;
}

table.table tr th:first-child {
	width: 60px;
}

table.table tr th:last-child {
	width: 100px;
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

table.table td:last-child i {
	opacity: 0.9;
	font-size: 22px;
	margin: 0 5px;
}

table.table td a {
	font-weight: bold;
	color: #566787;
	display: inline-block;
	text-decoration: none;
	outline: none !important;
}

table.table td a:hover {
	color: #2196F3;
}

table.table td a.edit {
	color: #FFC107;
}

table.table td a.delete {
	color: #F44336;
}

table.table td i {
	font-size: 19px;
}

table.table .avatar {
	border-radius: 50%;
	vertical-align: middle;
	margin-right: 10px;
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

.pagination li.active a, .pagination li.active a.page-link {
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

/* Custom checkbox */
.custom-checkbox {
	position: relative;
}

.custom-checkbox input[type="checkbox"] {
	opacity: 0;
	position: absolute;
	margin: 5px 0 0 3px;
	z-index: 9;
}

.custom-checkbox label:before {
	width: 18px;
	height: 18px;
}

.custom-checkbox label:before {
	content: '';
	margin-right: 10px;
	display: inline-block;
	vertical-align: text-top;
	background: white;
	border: 1px solid #bbb;
	border-radius: 2px;
	box-sizing: border-box;
	z-index: 2;
}

.custom-checkbox input[type="checkbox"]:checked+label:after {
	content: '';
	position: absolute;
	left: 6px;
	top: 3px;
	width: 6px;
	height: 11px;
	border: solid #000;
	border-width: 0 3px 3px 0;
	transform: inherit;
	z-index: 3;
	transform: rotateZ(45deg);
}

.custom-checkbox input[type="checkbox"]:checked+label:before {
	border-color: #03A9F4;
	background: #03A9F4;
}

.custom-checkbox input[type="checkbox"]:checked+label:after {
	border-color: #fff;
}

.custom-checkbox input[type="checkbox"]:disabled+label:before {
	color: #b8b8b8;
	cursor: auto;
	box-shadow: none;
	background: #ddd;
}

/* Modal styles */
.modal .modal-dialog {
	max-width: 400px;
}

.modal .modal-header, .modal .modal-body, .modal .modal-footer {
	padding: 20px 30px;
}

.modal .modal-content {
	border-radius: 3px;
	font-size: 14px;
}

.modal .modal-footer {
	background: #ecf0f1;
	border-radius: 0 0 3px 3px;
}

.modal .modal-title {
	display: inline-block;
}

.modal .form-control {
	border-radius: 2px;
	box-shadow: none;
	border-color: #dddddd;
}

.modal textarea.form-control {
	resize: vertical;
}

.modal .btn {
	border-radius: 2px;
	min-width: 100px;
}

.modal form label {
	font-weight: normal;
}
</style>

<style>
.hidden {
	display: none;
}
</style>


<body class="products-page">
	<jsp:include page="header.jsp"></jsp:include>
	<!-- End Navbar -->
	<div class="panel-header panel-header-sm"></div>

	<div class="container-xl">
		<div class="table-responsive">
			<div class="table-wrapper">
				<div class="table-title">
					<div class="row">
						<div class="col-sm-6">
							<h2>
								Manage <b>Products</b>
							</h2>
						</div>
						<div class="col-sm-6">
							<a href="#addCategoryModal" class="btn btn-success"
								data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add
									New Category</span></a> <a href="#addEmployeeModal"
								class="btn btn-success" data-toggle="modal"><i
								class="material-icons">&#xE147;</i> <span>Add New Product</span></a>
							<a href="#deleteEmployeeModal" class="btn btn-danger"
								data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete All </span></a>
						</div>
					</div>
				</div>
				<table class="table table-striped table-hover"
					style="width: 100%; border-collapse: collapse; margin-top: 20px;">
					<thead>
						<tr>

							</span>
							</th>
							<th>Name</th>
							<th>Category</th>
							<th>Image</th>
							<th>Price</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${listProduct}" var="p">
							<%
							Product product = (Product) pageContext.getAttribute("p");
							int price = (int) product.getPrice();
							DecimalFormat formatter = new DecimalFormat("###,###,###");

							String nameProduct = product.getpName();
							Category category = new CategoryDao().getNameCategory(nameProduct);
							String nameCategory = category.getCategory_name();
							%>

							<tr>

								<td style="width: 180px">${p.pName}</td>
								<td><%=nameCategory%></td>
								<td><img class="img-fluid" src="${p.pImage}"
									alt="Colorlib Template" style="width: 40%; height: 25%;"></td>
								<td style="width: 20%"><%=formatter.format(price)%> ₫</td>
								<td><a href="#editEmployeeModal" data-toggle="modal"
									data-product_id="${p.pId}" data-product_name="${p.pName}"
									data-category_name="<%=nameCategory%>"
									data-product_price="${p.price}"
									data-product_image="${p.pImage}"
									data-product_description="${p.description}" class="edit"><i
										class="material-icons" title="Edit">&#xE254;</i></a> <a
									href="deleteProduct?pid=${p.pId}" class="delete"><i
										class="material-icons" title="Delete">&#xE872;</i></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- Paginatio -->
			<div class="" style="margin-top: 2%">
				<ul class="pagination pg-orange">
					<li class="page-item"
						style="${currentPage == 1 ? 'display: none;' : ''}"><a
						class="page-link" aria-label="Previous"
						href="product?indexPage=${currentPage - 1}"> <span
							aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span>
					</a></li>
					<c:forEach begin="1" end="${endPage}" var="i">
						<li class="page-item ${currentPage == i ? 'active' : ''}"><a
							class="page-link" href="product?indexPage=${i}">${i}</a></li>
					</c:forEach>
					<li class="page-item"
						style="${currentPage == endPage ? 'display: none;' : ''}"><a
						class="page-link" aria-label="Next"
						href="product?indexPage=${currentPage + 1}"> <span
							aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
					</a></li>
				</ul>
			</div>
			<!-- End Paginatio -->
		</div>
	</div>


	<!--Add Category  -->
	<div id="addCategoryModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="addCategory" method="get">
					<div class="modal-header">
						<h4 class="modal-title">Add Category</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Name</label> <input type="text" class="form-control"
								required name="name">
						</div>

					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel"> <input type="submit"
							class="btn btn-success" value="Add">
					</div>
				</form>
			</div>
		</div>
	</div>

	<!--Add Product  -->
	<div id="addEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="addProduct" method="get">
					<div class="modal-header">
						<h4 class="modal-title">Add Product</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Name</label> <input type="text" class="form-control"
								required name="name">
						</div>
						<div class="form-group">
							<label>Category</label> <select
								class="custom-select custom-select-sm" name="category">
								<option disabled selected hidden>Select Categories</option>
								<c:forEach items="${listC}" var="c">
									<option value="${c.category_id}">${c.category_name}</option>
								</c:forEach>
							</select>

						</div>

						<div class="form-group">
							<label>Image (link)</label> <input type="text"
								class="form-control" required name="image">
						</div>

						<div class="form-group">
							<label>Price</label> <input type="text" class="form-control"
								required name="price">
						</div>

						<div class="form-group">
							<label>Description</label>
							<textarea class="form-control" name="description"></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel"> <input type="submit"
							class="btn btn-success" value="Add">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Edit Modal HTML -->
	<div id="editEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="editProduct" method="get">
					<div class="modal-header">
						<h4 class="modal-title">Edit Product</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<!-- Id Product -->
						<input id="product_id" type="text" class="form-control" required
							name="id" hidden="true">

						<div class="form-group">
							<label>Name</label> <input id="product_name" type="text"
								class="form-control" required name="name">
						</div>
						<div class="form-group">
							<label>Category</label> <select
								class="custom-select custom-select-sm" name="category">
								<c:forEach items="${listC}" var="c">
									<option value="${c.category_id}">${c.category_name}</option>
								</c:forEach>
							</select>


						</div>

						<div class="form-group">
							<label>Image (link)</label> <input id="product_image" type="text"
								class="form-control" required name="image">
						</div>

						<div class="form-group">
							<label>Price</label> <input id="product_price" type="text"
								class="form-control" required name="price">
						</div>

						<div class="form-group">
							<label>Description</label>
							<textarea class="form-control" id="product_description"
								name="description"></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel"> <input type="submit" class="btn btn-info"
							value="Save">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Delete Modal HTML -->
	<div id="deleteEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form>
					<div class="modal-header">
						<h4 class="modal-title">Delete Product</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<p>Are you sure you want to delete these Records?</p>
						<p class="text-warning">
							<small>This action cannot be undone.</small>
						</p>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel"> <input type="submit"
							class="btn btn-danger" value="Delete">
					</div>
				</form>
			</div>
		</div>
	</div>


	</div>
	</div>
	<!--   Core JS Files   -->
	<script src="admin/js/core/jquery.min.js"></script>
	<script>
		$(document).ready(function() {
			// Activate tooltip
			$('[data-toggle="tooltip"]').tooltip();

			// Select/Deselect checkboxes
			var checkbox = $('table tbody input[type="checkbox"]');
			$("#selectAll").click(function() {
				if (this.checked) {
					checkbox.each(function() {
						this.checked = true;
					});
				} else {
					checkbox.each(function() {
						this.checked = false;
					});
				}
			});
			checkbox.click(function() {
				if (!this.checked) {
					$("#selectAll").prop("checked", false);
				}
			});
		});
		$(document).on('click', '.edit', function() {
			const product = $(this).data('product');

			const product_id = $(this).data('product_id');
			const product_name = $(this).data('product_name');
			const category_name = $(this).data('category_name');
			const product_image = $(this).data('product_image');
			const product_price = $(this).data('product_price');
			const product_description = $(this).data('product_description');
			// Fetch product details using AJAX or other methods based on your server-side approach
			// Assuming a successful AJAX call that retrieves product details and stores them in a variable called 'productData'

			$('#product_id').val(product_id);
			$('#product_name').val(product_name);
			$('#category_name').val(category_name);
			$('#product_image').val(product_image);
			$('#product_price').val(product_price);
			$('#product_description').val(product_description);
			// Populate other form fields based on productData
		});
	</script>

	<script>
			
			
			const classes = document.body.classList;
		/* 	const navItems = document.querySelectorAll('.nav li'); */
			const navItems = document.querySelectorAll('.nav li a'); 
			navItems.forEach(item => {
			 const dataPage = item.classList  ; // Get data-page using dataset property
			 if (dataPage === classes) { // Ensure dataPage exists and matches (ignoring hyphens)
			 item.classList.add('active');
			 } else {
			 item.classList.remove('active'); // Remove any existing 'active' class
			 }
			}); 
			
			</script>



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
</body>

</html>