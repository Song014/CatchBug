<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<c:if test="${member.id ne null }">
	<script type="text/javascript">
		alert("이미 접속중인 사용자 입니다.");
		history.go(-1);
	</script>
</c:if>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>로그인</title>
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
<script type="text/javascript">
var isMessage = true;
</script>
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

	<div class="container">

		<div class="container">
			<div class="row justify-content-center">
				<div
					class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

					<div class="d-flex justify-content-center py-4">
						<a href="/" class="logo d-flex align-items-center w-auto">
							<img src="assets/img/logo.png" alt=""> <span
							class="d-none d-lg-block">Catch Bug</span>
						</a>
					</div>
					<!-- End Logo -->

					<div class="card mb-3">

						<div class="card-body">

							<div class="pt-4 pb-2">
								<h5 class="card-title text-center pb-0 fs-4">Catch Bug
									Login</h5>
									<h3>${msg}</h3>
								<br>
								
								<!-- <div class="checkbox" style="text-align: right;">
                      <label>
                        <input type="radio" name="mode" value="admin"> 관리자
                        &nbsp;&nbsp;
                        <input type="radio" name="mode" value="member" checked> 일반회원
                      </label>
                    </div> -->
							</div>

							<!-- 로그인 폼 시작 -->
							<form class="row g-3 needs-validation" action="login_page.do"
								method="post">
								<div class="col-12">
									<label for="yourUsername" class="form-label">ID</label>
									<div class="input-group has-validation">
										<input type="text" name="id" class="form-control"
											id="yourUsername" <%--  value="${memberVO.id}" --%> required>
										<div class="invalid-feedback">Please enter your
											username.</div>
									</div>
								</div>

								<div class="col-12">
									<label for="yourPassword" class="form-label">Password</label> <input
										type="password" name="pass" class="form-control"
										id="yourPassword" <%-- value="${memberVO.pass}" --%> required>
									<div class="invalid-feedback">Please enter your password!</div>
								</div>

								<!-- <div class="col-12">
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="remember" value="true" id="rememberMe">
                        <label class="form-check-label" for="rememberMe">Remember me</label>
                      </div>
                    </div> -->
								<div class="col-12">
									<button class="btn btn-primary w-100" type="submit">Login</button>
								</div>
								<div style="text-align: center;">
									<div class="col-12">
										<p class="small mb-0">
											아직 회원이 아니신가요?<a href="sign_up.do"> 회원가입 하기</a>
										</p>
									</div>
								</div>
								<div style="text-align: center;" class="col-6">
									<p class="small mb-0">
										<a href="find_id.do"> 아이디 찾기</a>
									</p>
								</div>
								<div style="text-align: center;" class="col-6">
									<p class="small mb-0">
										<a href="find_pw.do"> 비밀번호 찾기</a>
									</p>
								</div>
							</form>
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
	
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
$(document).ready(function(){
	var msg = "${msg}";
	if(msg != null){
		alert(msg);
	}
</script>

</body>

</html>