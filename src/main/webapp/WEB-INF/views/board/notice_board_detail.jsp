<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>공지사항 상세보기</title>
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
				<h1>공지사항</h1>
				<nav>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.html">게시판</a></li>
						<li class="breadcrumb-item">공지사항</li>
						<li class="breadcrumb-item active">글쓰기</li>
					</ol>
				</nav>
			</div>
			<form action="updateNoti.do" method="post">
				<div class="row mb-3">
					<div class="col-sm-12">
						<input type="text" class="form-control" name="noti_title" value="${notiInfo.noti_title }" >
					</div>
				</div>
						
						<input type="hidden" name="id" value="${memberId.id }">
						<input type="hidden" name="writer" value="관리자">
						<input type="hidden" name="noti_no" value="${notiInfo.noti_no }">
						
				<div class="col-md-12">
					<textarea class="form-control" name="noti_content" rows="6"
						placeholder="Message" required="">${notiInfo.noti_content }</textarea>
				</div>
				<c:choose>
					<c:when test="${memberId.level1 eq 1 }">
						<div class="mb-3 text-center">
							<button type="submit" class="btn btn-primary">수정하기</button>
							<button type="reset" class="btn btn-secondary">취소</button>
							<button type="button" value="${notiInfo.noti_no }" class="btn btn-primary btn1">삭제</button>
							<input type="button" class="btn btn-secondary" value="공지 목록"
								onclick="location.href='notice_Board.do'" />
						</div>
					</c:when>
					<c:otherwise>
							<input type="button" class="btn btn-secondary" value="공지 목록"
								onclick="location.href='notice_Board.do'" />
					</c:otherwise>
				</c:choose>
			</form>
		</div>
	</div>
	
	<script type="text/javascript">
	$(".btn1").on("click", function(e) {
		if (confirm("삭제 하시겠습니까?")) {
			location.href="/delete_noti.do?noti_no="+e.target.value;
		} else {
			return;
		}
	})
	</script>

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