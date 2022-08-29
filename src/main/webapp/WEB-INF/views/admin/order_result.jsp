<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Dashboard - NiceAdmin Bootstrap Template</title>
<meta content="" name="description">
<meta content="" name="keywords">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: NiceAdmin - v2.3.1
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

	<!-- ======= Header ======= -->

	<jsp:include page="../mainInclude/header.jsp"></jsp:include>

	<!-- End Header -->




	<!-- ======= Sidebar ======= -->

	<jsp:include page="../mainInclude/sidebar.jsp"></jsp:include>

	<!-- End Sidebar -->
	<!-- End Header -->
	<!-- End Sidebar -->
	<!-- main start -->
	<main id="main" class="main">
	<div class="pagetitle">
		<h1>주문/결제</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/">Home</a></li>
				<li class="breadcrumb-item active">주문/결제</li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->
	<section class="section dashboard">
		<div class="card">
			<div class="card-body">
				<div class="row">
					<!-- 상품정보 -->
					<table class="table">
							<thead>
								<tr>
									<th></th>
									<th>상품 번호</th>
									<th>상품 명</th>
									<th>구매 수량</th>
									<th>개당 가격</th>
									<th>버튼</th>
								</tr>
							</thead>
						</table>
						<form action="factoryOrder.do">
							<div style="height: 250px; overflow: scroll;">
								<table class="table" id="bucket">
									<tbody>
									<c:forEach var="list" items="${cartList }">
									<tr>
										<td><input type="checkbox" name="checkBox"></td>
										<td><input type="hidden" name="product_no" value=${list.product_no } >${list.product_no }</td>
										<td><input type="hidden" value=${list.product_name }><a class="primary" data-bs-toggle="modal" data-bs-target="#modalProduct">${list.product_name }</a></td>
										<td><input type="number" name="purchase_amount" value=${list.purchase_amount } min="1" max=`+quantity+` style="width:50px;"><button type="button" class="updateBtn">변경</button></td>
										<td><input type="hidden"  value=${list.price }>${list.price }</td>
										<td><button type="button" class="btn btn-primary btn-sm delBucket">삭제</button></td>
									</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="d-grid gap-2 mt-3">
								<!-- 이전페이지로 돌아가기 -->
								<input class="btn btn-primary" type="submit" value="주문 수정"></input>
							</div>
						</form>
					<!-- 배송지 선택 + 메모-->
					
					<!-- 결제모듈 i am port-->
					
					
				</div>
			</div>
		</div>
	</section>

	</main>
	<!-- End #main -->

	<!-- End #main -->

	<!-- ======= Footer ======= -->

	<jsp:include page="../mainInclude/footer.jsp"></jsp:include>

	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/chart.js/chart.min.js"></script>
	<script src="assets/vendor/echarts/echarts.min.js"></script>
	<script src="assets/vendor/quill/quill.min.js"></script>
	<script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
	<script src="assets/vendor/tinymce/tinymce.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>

	<!-- 날짜 검색시 오늘로 셋팅해주는 스크립트-->
	<script>document.getElementById('inputSearchDate').valueAsDate = new Date();</script>


</body>

</html>