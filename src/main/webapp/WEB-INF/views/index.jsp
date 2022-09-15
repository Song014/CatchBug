<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>대쉬보드</title>
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
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: NiceAdmin - v2.3.1
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  
  <style type="text/css">
  	.cards:hover{
  		background: #808080 ;
  		opacity: 0.5;
  		
  	}
  	a{
  		color:#012970;
  	}
  </style>
</head>

<body>





	<!-- ======= Header ======= -->

	<jsp:include page="mainInclude/header.jsp"></jsp:include>

	<!-- End Header -->




	<!-- ======= Sidebar ======= -->

	<jsp:include page="mainInclude/sidebar.jsp"></jsp:include>
	<!-- End Sidebar -->




	<!-- ======= Main ======= -->
	<!-- main start -->
	<main id="main" class="main">
	<div class="pagetitle">
		<h1>대쉬보드</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/">Home</a></li>
				<li class="breadcrumb-item active">대쉬보드</li>
			</ol>
		</nav>
	</div>
	<section class="section dashboard">
		<div class="row">
			<div class="col-lg-8">
				<div class="row">
					<div class="col-12">
						<div class="card top-selling overflow-auto">
							<div class="card-body pb-0">
								<h5 class="card-title">
									Top 5 주문 <span>|</span>
								</h5>
								<table class="table table-borderless">
									<thead>
										<tr>
											<th scope="col">Preview</th>
											<th scope="col">Product</th>
											<th scope="col">Price</th>
											<th scope="col">Amount</th>
											<th scope="col">Total</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach begin="0" end="4" var="list" items="${topOrder }">
										<tr> 
											<th scope="row"><a href="#"><img
													src="/resources/productImg/<fmt:formatDate value="${list.add_day }" pattern="yyyy-MM-dd"/>/${list.uuid}" alt=""></a></th>
											<td><a href="#" class="text-primary fw-bold">${list.product_name }</a></td>
											<td>&#8361;<fmt:formatNumber groupingUsed="true">${list.price }</fmt:formatNumber></td>
											<td class="fw-bold">${list.purchase_amount }</td>
											<td>&#8361;<fmt:formatNumber groupingUsed="true">${list.total }</fmt:formatNumber></td>
										</tr>
										</c:forEach>								
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 hover">
				<div class="col-12">
					<div class="card info-card sales-card">
						<div class="card-body">
							<h5 class="card-title">
								미 승인 주문 현황 <span>|</span>
							</h5>
							<div class="d-flex align-items-center">
								<div
									class="card-icon rounded-circle d-flex align-items-center justify-content-center">
									<i class="bi bi-cart"></i>
								</div>
								<div class="ps-3">
									<c:choose>
									<c:when test="${member.level1 eq 1}">
									<h6><a href="unOrderHistory.do">${count } 건</a></h6>
									</c:when>
									<c:otherwise>
									<h6><a href="francOrderHistory.do">${count } 건</a></h6>
									</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-12">
					<div class="card info-card revenue-card">
						<div class="card-body">
							<h5 class="card-title">
								${member.level1 eq 2? "사용 금액":"매출"} <span>|</span>
							</h5>
							<div class="d-flex align-items-center">
								<div
									class="card-icon rounded-circle d-flex align-items-center justify-content-center">
									<i class='fa fa-krw'></i>
								</div>
								<div class="ps-3">
									<h6> <fmt:formatNumber groupingUsed="true">${total }</fmt:formatNumber></h6>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-12">
					<div class="card info-card customers-card">
						<div class="card-body">
							<h5 class="card-title">
								1대1 채팅상담 <span>|</span>
							</h5>
							<div class="d-flex align-items-center">
								<div
									class="card-icon rounded-circle d-flex align-items-center justify-content-center">
									<i class="bi bi-people"></i>
								</div>
								<div class="ps-3">
									<h6><a href="chatRoom.do">상담 바로가기</a></h6>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
	</div>
	</section>
	</main>
	<!-- End Main -->



	<!-- ======= Footer ======= -->

	<jsp:include page="mainInclude/footer.jsp"></jsp:include>

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
