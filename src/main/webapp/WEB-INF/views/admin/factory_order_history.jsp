<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Dashboard - NiceAdmin Bootstrap Template</title>
<meta content="" name="description">
<meta content="" name="keywords">
<!-- jQuery -->
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




	<!-- ======= Main ======= -->
	<!-- main start -->
	<main id="main" class="main">

	<div class="pagetitle">
		<h1>본사 발주 내역 조회</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/">재고 관리</a></li>
				<li class="breadcrumb-item active">본사 발주 내역</li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->

	<section class="section dashboard">
		<div class="row">
			<div class="card">
				<div class="card-body">

					<div align="right" class="dataTable-top">
						<div class="dataTable-dropdown">
							<label><select class="dataTable-selector"><option
										value="5">5</option>
									<option value="10" selected="">10</option>
									<option value="15">15</option>
									<option value="20">20</option>
									<option value="25">25</option></select> entries per page</label>
						</div>
						<div class="dataTable-search">
							<form>
								<input type="date" name="beforeDate"> <input type="date"
									name="afterDate" id='currnetDate'> <select
									name="searchOption">
									<option value="orderNumber" selected="selected">주문번호</option>
									<option value="content">내용</option>
									<option value="remarks">비고</option>
								</select> <input type="text" name="input" placeholder="검색어를 입력해 주세요.">
								<!-- <input type="button" name="inputBtn" value="검색"> -->
								<button>검색</button>
							</form>
						</div>
					</div>
					<div class="dataTable-container">
						<table class="table datatable dataTable-table">
							<tr>
								<th scope="col" data-sortable=""><a href="#"
									class="dataTable-sorter">#</a></th>
								<th scope="col" data-sortable=""><a href="#"
									class="dataTable-sorter">주문번호</a></th>
								<th scope="col" data-sortable=""><a href="#"
									class="dataTable-sorter">주문일자</a></th>
								<th scope="col" data-sortable=""><a href="#"
									class="dataTable-sorter">내용</a></th>
								<th scope="col" data-sortable=""><a href="#"
									class="dataTable-sorter">비고</a></th>
								<th scope="col" data-sortable=""><a href="#"
									class="dataTable-sorter">상태</a></th>
								<th scope="col">결제</th>
							</tr>
							<tr>
								<td>1</td>
								<td>주문번호넣어주세요</td>
								<td>22.08.12</td>
								<td><a class="primary" data-bs-toggle="modal"
									data-bs-target="#modalDialogScrollable"> 주문 상세보기 모달띄우기 </a></td>
								<td></td>
								<td>대기</td>
								<td><input type="button" name="no" value="취소"></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<script>
				// 오늘 날짜
				document.getElementById('currnetDate').value = new Date()
						.toISOString().slice(0, 10);
			</script>

		</div>
	</section>

	</main>
	<!-- End #main -->


	<!-- 모달1 -->
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
									<td>2022.01.01</td>
								</tr>
								<tr>
									<th>사업자등록번호</th>
									<td>110-123-45678</td>
								</tr>
								<tr>
									<th>사업장주소지</th>
									<td>영등포</td>
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

	<!-- 모달2 -->
	<div class="modal fade" id="modalDialogScrollable" tabindex="-1">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">주문번호 : 123456789</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="card">
						<div class="card-body">
							<div class="card-title">
								<h5 style="text-align: right;">총 주문금액</h5>
								<div style="text-align: right;">
									<i class="bx bx-won">가격 적어주세요</i>

								</div>

							</div>

							<table class="table" tex>
								<thead>
									<tr>
										<th scope=" col" style="width: 20%;">상품코드</th>
										<th scope="col" style="width: 52%;">품목명</th>
										<th scope="col" style="width: 13%;">수량</th>
										<th scope="col" style="width: 15%;">가격</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">00001</th>
										<td>무선 마우스 GB110</td>
										<td>5</td>
										<td>10000123123</td>
									</tr>

								</tbody>
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
	<!-- 모달 끝-->
	<!-- End Main -->




	<!-- ======= Footer ======= -->

	<jsp:include page="../mainInclude/footer.jsp"></jsp:include>

	<!-- End Footer -->

	<script type="text/javascript">
		$.ajax({
			type : "get", //요청 메소드 방식
			url : "/payments/status/all",
			headers : {
				"Content-Type" : "application/json"
			},
			success : function(result) {
				console.log(result)
				
			},
			error : function(e) {
				//통신 실패시 발생하는 함수(콜백)
				console.log("실패" + e);
			}
		});
	</script>

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
