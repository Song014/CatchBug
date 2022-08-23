<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Dashboard - NiceAdmin Bootstrap Template</title>
<meta content="" name="description">
<meta content="" name="keywords">

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

	<%-- <c:set var="user" value="${user }"/>
	 
	 <c:when test="${user.level != 2}">
	 	<jsp:include page="sidebar(master).jsp"></jsp:include>
	 </c:when> --%>

	<%-- 	 <c:otherwise> --%>
	<jsp:include page="../mainInclude/sidebar_user.jsp"></jsp:include>

	<%--  		<jsp:include page="sidebar_master.jsp"></jsp:include> --%>
	<%-- 	 </c:otherwise> --%>

	<!-- End Sidebar -->


	<!-- ======= Main ======= -->
	<!-- main start -->
	<main id="main" class="main">
	<div class="pagetitle">
		<h1>상품 리스트</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="index.html">Home</a></li>
				<li class="breadcrumb-item">재고관리</li>
				<li class="breadcrumb-item active">상품 리스트</li>
			</ol>
		</nav>
	</div>
	<div class="dataTable-top">

		<div class="dataTable-search">
			<input class="dataTable-input" placeholder="Search..." type="text">
		</div>
	</div>
	<div class="dataTable-container">
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col" data-sortable="" style="width: 5%;"><a
						href="#" class="dataTable-sorter">NO.</a></th>
					<th scope="col" data-sortable="" style="width: 12%;"><a
						href="#" class="dataTable-sorter">상품 번호</a></th>
					<th scope="col" data-sortable="" style="width: 20%;"><a
						href="#" class="dataTable-sorter">브랜드 / 제조사</a></th>
					<th scope="col" data-sortable="" style="width: 30%;"><a
						href="#" class="dataTable-sorter">상품명</a></th>
					<th scope="col" data-sortable="" style="width: 16%;"><a
						href="#" class="dataTable-sorter">전체 수량</a></th>
					<th scope="col" data-sortable="" style="width: 16%;"><a
						href="#" class="dataTable-sorter">개당 가격</a></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>15-27363</td>
					<td>AMD</td>
					<td><a href="franc_Detail.html">라이젠5 4세대 5600x</a></td>
					<td>15</td>
					<td>300,000</td>
				</tr>
				<tr>
					<th scope="row">2</th>
					<td>15-27363</td>
					<td>AMD</td>
					<td><a href="franc_Detail.html">라이젠5 4세대 5600x</a></td>
					<td>15</td>
					<td>300,000</td>
				</tr>
				<tr>
					<th scope="row">3</th>
					<td>15-27363</td>
					<td>AMD</td>
					<td><a href="franc_Detail.html">라이젠5 4세대 5600x</a></td>
					<td>15</td>
					<td>300,000</td>
				</tr>
				<tr>
					<th scope="row">4</th>
					<td>15-27363</td>
					<td>AMD</td>
					<td><a href="franc_Detail.html">라이젠5 4세대 5600x</a></td>
					<td>15</td>
					<td>300,000</td>
				</tr>
				<tr>
					<th scope="row">5</th>
					<td>15-27363</td>
					<td>AMD</td>
					<td><a href="franc_Detail.html">라이젠5 4세대 5600x</a></td>
					<td>15</td>
					<td>300,000</td>
				</tr>
				<tr>
					<th scope="row">6</th>
					<td>15-27363</td>
					<td>AMD</td>
					<td><a href="franc_Detail.html">라이젠5 4세대 5600x</a></td>
					<td>15</td>
					<td>300,000</td>
				</tr>
				<tr>
					<th scope="row">7</th>
					<td>15-27363</td>
					<td>AMD</td>
					<td><a href="franc_Detail.html">라이젠5 4세대 5600x</a></td>
					<td>15</td>
					<td>300,000</td>
				</tr>
			</tbody>
		</table>
	</div>

	</main>
	
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
	<script>
		document.getElementById('inputSearchDate').valueAsDate = new Date();
	</script>


</body>

</html>