<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>자유게시판 상세보기</title>
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



	<main id="main" class="main">

	<div class="card">
		<div class="card-body">
			<div class="pagetitle">
				<br>
				<h1>자유게시판</h1>
				<nav>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.html">게시판</a></li>
						<li class="breadcrumb-item">자유게시판</li>
						<li class="breadcrumb-item active">상세보기</li>
					</ol>
				</nav>
			</div>
			<div class="card">
				<div class="card-header">
					<h3>${board.title }</h3>
				</div>
				<div class="card-body">${board.content }</div>
				<div class="card-footer">
					<div class="mb-3 text-center">
						<input type="hidden" value="${board.id }" id="id" /> <input
							type="hidden" value="${board.board_no }" id="board_no" />
						<button type="button" class="btn btn-primary" onclick="change();">수정하기</button>
						<button type="button" class="btn btn-secondary"
							onclick="location.href='freeBoard.do?page=1'">뒤로가기</button>
						<button type="button" class="btn btn-sm btn-danger"
							onclick="deleted();">삭제</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	</main>


	<script type="text/javascript">
		var id = $("#id").val();
		var board_no = $("#board_no").val()
		console.log(id);
		function deleted(e) {
			if (id == "${member.id}") {
				if(confirm("정말 삭제하시겠습니까?")){
					location.href="/deleteFreeBoard.do?board_no=" + board_no;	
				}
			} else {
				alert("본인만 삭제할 수 있습니다.");
			}
		}

		function change(e) {
			if (id == "${member.id}") {
				if(confirm("정말 수정하시겠습니까?")){
					location.href="/updateFreeBoard.do?board_no=" + board_no;	
				}
			} else {
				alert("본인만 수정할 수 있습니다.");
			}
		}
	</script>



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