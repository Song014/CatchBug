<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>가맹점 리스트</title>
<meta content="" name="description">
<meta content="" name="keywords">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

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

	<!-- main start -->
	<!-- main start -->
	<main id="main" class="main">
	<div class="pagetitle">
		<h1>가맹점 리스트</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item">가맹점관리</li>
				<li class="breadcrumb-item active">가맹점 리스트</li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->

	<section class="section dashboard">
		<div class="row">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">| 전체 가맹점 리스트</h5>
					<div class="search" align="right">
						<form>
							<select name="searchOption">
								<option value="content" selected="selected">대표자</option>
								<option value="remarks">법인명</option>
							</select> <input type="text" name="input" placeholder="검색어를 입력해 주세요.">
							<!-- <input type="button" name="inputBtn" value="검색"> -->
							<button>검색</button>
						</form>
					</div>

					<!-- Table with hoverable rows -->
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">법인명</th>
								<th scope="col">대표자</th>
								<th scope="col">사업자 등록 번호</th>
								<th scope="col">연락처</th>
								<th scope="col">사업장 주소지</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="member" items="${list}" varStatus="status">
								<tr>
									<th scope="row">${status.count}</th>
									<td><a class="primary" data-bs-toggle="modal"
										data-bs-target="#modal-biz"> ${member.business_name} </a></td>
									<td>${member.ceo}</td>
									<td>${member.business_no}</td>
									<td>${member.contact}</td>
									<td>${member.business_address}</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
					<!-- End Table with hoverable rows -->




				</div>
			</div>
		</div>
	</section>
	</main>
	<!-- End Main -->


	<!-- 모달부 -->
	<div class="modal fade" id="modal-biz" tabindex="-1">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">사업자 상세보기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="card">
						<div class="card-body">
							<table class="table">
								<tr>
									<th>사업자명</th>
									<td>늑대와여우</td>
								</tr>
								<tr>
									<th>대표자</th>
									<td>홍길동</td>
								</tr>
								<tr>
									<th>가입일</th>
									<td>2022.09.05</td>
								</tr>
								<tr>
									<th>사업자등록번호</th>
									<td>125-12-51251</td>
								</tr>
								<tr>
									<th>연락처</th>
									<td>010-2312-1231</td>
								</tr>
								<tr>
									<th>사업장주소지</th>
									<td>서울시 용산구</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달끝 -->


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


</body>

</html>