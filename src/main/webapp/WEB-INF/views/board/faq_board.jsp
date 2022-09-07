<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>FAQ 게시판</title>
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

	<jsp:include page="../mainInclude/sidebar.jsp"></jsp:include>

	<!-- End Sidebar -->
	<!-- End Header -->

	<!-- ======= Sidebar ======= -->

	<jsp:include page="../mainInclude/sidebar.jsp"></jsp:include>

	<!-- End Sidebar -->

	<main id="main" class="main">
	<div class="pagetitle">
		<h1>Frequently Asked Questions</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="index.html">게시판</a></li>
				<li class="breadcrumb-item active">자주 묻는 질문</li>
			</ol>
		</nav>
	</div>
	<section class="section faq">
		<div class="row" >
			<div align="center" style ="width: 50%; margin:0% auto;">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">자주 묻는 질문</h5>
						<div class="accordion accordion-flush" id="faq-group-2">
							<div class="accordion-item">
								<h2 class="accordion-header">
									<button class="accordion-button collapsed"
										data-bs-target="#faqsTwo-1" type="button"
										data-bs-toggle="collapse">회원가입 승인이 되지 않고 있습니다.</button>
								</h2>
								<div id="faqsTwo-1" class="accordion-collapse collapse"
									data-bs-parent="#faq-group-2">
									<div class="accordion-body">고객센터로 문의 바랍니다.</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header">
									<button class="accordion-button collapsed"
										data-bs-target="#faqsTwo-2" type="button"
										data-bs-toggle="collapse">결제방법을 변경할 수 있나요?</button>
								</h2>
								<div id="faqsTwo-2" class="accordion-collapse collapse"
									data-bs-parent="#faq-group-2">
									<div class="accordion-body">네, 주문 후 결제를 완료하기 전이시라면 결제방법을
										직접 변경할 수 있습니다.</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header">
									<button class="accordion-button collapsed"
										data-bs-target="#faqsTwo-3" type="button"
										data-bs-toggle="collapse">배송방법은 어떤게 있나요?</button>
								</h2>
								<div id="faqsTwo-3" class="accordion-collapse collapse"
									data-bs-parent="#faq-group-2">
									<div class="accordion-body">일반택배, 당일택배, 퀵서비스, 경동화물, 방문수령
										서비스를 제공하고 있습니다.</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header">
									<button class="accordion-button collapsed"
										data-bs-target="#faqsTwo-4" type="button"
										data-bs-toggle="collapse">결제서비스 일시중단 안내</button>
								</h2>
								<div id="faqsTwo-4" class="accordion-collapse collapse"
									data-bs-parent="#faq-group-2">
									<div class="accordion-body">결제시스템 업데이트 및 모바일 결제 편의 개선을 위해
										부득이하게 결제서비스가 일시적으로 중단될 예정입니다.</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header">
									<button class="accordion-button collapsed"
										data-bs-target="#faqsTwo-5" type="button"
										data-bs-toggle="collapse">제품이 파손되어 배송된 경우 어떻게 하나요?</button>
								</h2>
								<div id="faqsTwo-5" class="accordion-collapse collapse"
									data-bs-parent="#faq-group-2">
									<div class="accordion-body">배송 과정 중 제품이 파손되어 배송 된 경우 파손
										상태 확인 후 즉시 새 제품으로 출고해드리고 있습니다.</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</section>

	</main>
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

</body>

</html>