<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>가입승인 대기 목록</title>
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

<script type="text/javascript">
	
</script>

<body>

	<!-- ======= Header ======= -->

	<jsp:include page="../mainInclude/header.jsp"></jsp:include>


	<!-- End Header -->




<!-- ======= Sidebar ======= --> 
	 
	<jsp:include page="../mainInclude/sidebar.jsp"></jsp:include>
	 
<!-- End Sidebar -->




	<!-- ======= Main ======= -->
	<!-- main start -->
	<main id="main" class="main">
	<div class="pagetitle">
		<h1>가입승인 대기목록</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item">가맹점관리</li>
				<li class="breadcrumb-item active">가입승인 대기 목록</li>
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
						<!--                 <form action="/member_approval.do" id="Form"> -->
						<table class="table datatable dataTable-table ">
							<thead>
								<tr>
									<th scope="col" data-sortable=""><a href="#"
										class="dataTable-sorter">#</a></th>
									<th scope="col" data-sortable=""><a href="#"
										class="dataTable-sorter">사업자명</a></th>
									<th scope="col" data-sortable=""><a href="#"
										class="dataTable-sorter">대표자명</a></th>
									<th scope="col" data-sortable=""><a href="#"
										class="dataTable-sorter">주소</a></th>
									<th scope="col" data-sortable=""><a href="#"
										class="dataTable-sorter">사업자 등록번호</a></th>
									<th scope="col" data-sortable=""><a href="#"
										class="dataTable-sorter">가입신청일</a></th>
									<th scope="col" data-sortable=""><a href="#"
										class="dataTable-sorter">승인 여부</a></th>
								</tr>
							</thead>
							<c:forEach var="list" items="${list }">
								<tbody>
									<tr>
										<td>${list.id }</td>
										<td>${list.business_name }</td>
										<td>${list.ceo }</td>
										<td>${list.business_address }</td>
										<td>${list.business_no }</td>
										<td>${list.regdate }</td>
										<td>
											<button type="button" class="btn btn-outline-dark btn1" value="${list.id}" style="margin:0px 10px 0px 10px">승인</button>
											<button type="button" class="btn btn-outline-dark btn2" value="${list.id}">반려</button>
										</td>
									</tr>
								</tbody>
							</c:forEach>
						</table>
						<!--                 </form> -->
					</div>
				</div>
			</div>

			<script type="text/javascript">
				
			<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
				//오늘 날짜
				document.getElementById('currnetDate').value = new Date()
						.toISOString().slice(0, 10);
				
				$(".btn1").on("click", function(e) {
					if (confirm("승인 하시겠습니까?")) {
						location.href = "/member_approval.do?id=" + e.target.value;
					} else {
						return;
					}
				})
				
				$(".btn2").on("click", function(e) {
					if (confirm("반려 하시겠습니까?")) {
						location.href="/member_refuse.do?id="+e.target.value;
					} else {
						return;
					}
				})
				
			</script>

		</div>
	</section>
	</main>
	<!-- End Main -->




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
