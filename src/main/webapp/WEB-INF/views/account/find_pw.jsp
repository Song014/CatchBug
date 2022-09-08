<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>캐치버그 - 비밀번호 찾기</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->


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


<!-- Jquery 선언 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

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

	<!-- main start -->
	<main id="main" class="main">

	<div class="container">

		<div class="container">
			<div class="row justify-content-center">
				<div
					class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

					<div class="d-flex justify-content-center py-4">
						<a href="index.html" class="logo d-flex align-items-center w-auto">
							<img src="assets/img/logo.png" alt=""> <span
							class="d-none d-lg-block">Catch Bug</span>
						</a>
					</div>
					<!-- End Logo -->
					<div class="card mb-3">

						<div class="card-body">

							<div class="pt-4 pb-2">
								<h5 class="card-title text-center">| 비밀번호 찾기 페이지</h5>
							</div>

							<label>
								<h5>비밀번호 찾기</h5>
							</label>

							<form class="row g-3 needs-validation" action="/findPW.do"
								method="post" onsubmit="return findPW()">

								<div class="col-12">
									<br> <label for="yourName" class="form-label">*
										아이디</label> <input type="text" name="id" class="form-control"
										id="id" required>
								</div>

								<div class="col-12">
									<label for="yourName" class="form-label">* 이메일</label> <input
										type="text" name="email" class="form-control" id="email"
										required>
								</div>
								<div class="col-12">
									<button class="btn btn-primary w-100" type="submit">비밀번호
										찾기</button>
								</div>
								<div class="col-12" style="text-align: center;">
									<p>
										<Strong>※ 고객님의 이메일로 임시비밀번호가 전송됩니다. ※</Strong>
									</p>
								</div>
							</form>

							<hr>
							<p>
								※ 위 방법으로 비밀번호를 찾을수 없는 경우 <a href="#" target="_blank">고객센터</a>에
								문의해주세요. ※
							</p>

						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->

	<jsp:include page="../mainInclude/footer.jsp"></jsp:include>

	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<script type="text/javascript">
	
	$(document).ready(function(){
		$("form").on("submit", function() {
			var find = ${find};
			var id = $("#id").val();
			var email = $("#email").val();
			
			for(var i = 0; i< find.length; i++){
				if(id == find[i].id && email == find[i].email){
					return true;
				}
			}
			alert("아이디랑 이메일을 확인해 주세요.");
			return false;
		})
	});
	</script>


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