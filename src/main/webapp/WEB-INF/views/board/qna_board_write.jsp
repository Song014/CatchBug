<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Qna-글쓰기</title>
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

	<main id="main" class="main">

	<div class="card">
		<div class="card-body">
			<div class="pagetitle">
				<br>
				<h1>질문 게시판</h1>
				<nav>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.html">게시판</a></li>
						<li class="breadcrumb-item">질문게시판</li>
						<li class="breadcrumb-item active">글쓰기</li>
					</ol>
				</nav>
			</div>
			<form method="POST" action="qnaWrite.do" onsubmit="return qnaSubmit();">
				<input type="hidden" name="id" value="${member.id }">
				<input type="text" hidden="hidden" name="content" value="" />
				<div class="row mb-3">
					<div class="col-sm-2">
						<div class="mb-3">
							<select class="form-select" id="floatingSelect" name="tap"
								required="required">
								<option value="6">주문</option>
								<option value="5">상품</option>
								<option value="2">배송</option>
								<option value="7">회원</option>
								<option value="4">사이트</option>
							</select>
						</div>
					</div>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="title"
							placeholder="제목">
					</div>
				</div>

				<div class="col-md-12">
					<!-- Create the editor container -->
					<div id="editor" style="height: 300px">
					</div>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="checkbox" name="state"
						value="1" id="invalidCheck2"> <label
						class="form-check-label" for="invalidCheck2"> 비공개 </label>
				</div>
				
				
				<div class="mb-3 text-center">
					<button type="submit" class="btn btn-primary" >글쓰기</button>
					<button type="reset" class="btn btn-secondary">취소</button>
				</div>
			</form>
		</div>
	</div>

	</main>
	<!-- End #main -->


	<!-- ======= Footer ======= -->

	<jsp:include page="../mainInclude/footer.jsp"></jsp:include>
	
	</main>
	<script>
	function qnaSubmit() {
		var content = $(".ql-editor").html();
		$('input[name=content]').attr('value', content);
	}
	</script>

	<!-- Include the Quill library -->
	<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>

	<!-- Initialize Quill editor -->
	<script>
		var quill = new Quill('#editor', {
			theme : 'snow'
		});
	</script>
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