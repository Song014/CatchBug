<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>공 지 사 항</title>
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

	<!-- ======= Sidebar ======= -->

	<main id="main" class="main">

	<div class="pagetitle">
		<h1>공지사항</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/">HOME</a></li>
				<li class="breadcrumb-item active">공지 사항</li>
			</ol>
		</nav>
	</div>
	<section class="section dashboard">
		<div class="card">
			<div class="card-body">
				<div class="row">
					<div align="right" class="dataTable-top">
						<div class="dataTable-search">
							<form action="/notice_Board.do">
								<select name="searchType">
									<option value="1" selected="selected">제목</option>
								</select> 
									<input type="text" name="searchName" placeholder="검색어를 입력해 주세요.">
								<button>검색</button>
							</form>
						</div>
					</div>
					<table class="table table-bordered">
						<thead>
							<tr class="table-primary">
								<th scope="col">#</th>
								<th scope="col">이름</th>
								<th scope="col">제목</th>
								<th scope="col">조회수</th>
								<th scope="col">작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${list }" varStatus="status">
								<tr>

									<th class="col-lg-1" scope="row">${list.noti_no }</th>
									<td class="col-lg-2">관리자</td>
									<td class="col-lg-6"><a href="noti_detail.do?noti_no=${list.noti_no }">${list.noti_title }</a></td>
									<td class="col-lg-1">${list.cnt }</td>
									<td class="col-lg-2">${list.noti_day }</td>
								</tr>
							</c:forEach>
						</tbody>
						<tbody>
							<tr>
								<th colspan="5">

									<ul class="pagination justify-content-center">
										<!-- 페이지 인덱스를 처리한다. -->
										<c:if test="${pageMaker.prev}">
											<li><a
												href="notice_Board.do${pageMaker.makeQuery(pageMaker.startPage-1)}">&laquo;</a></li>
										</c:if>

										<c:forEach begin="${pageMaker.startPage}"
											end="${pageMaker.endPage}" var="idx">
											<li
												<c:out value="${pageMaker.cri.page == idx? 'class=active':''}"/>>
												<a class="paginate_button previous" href="/notice_Board.do${pageMaker.makeQuery(idx) }&searchType=${searchType }&searchName=${searchName }">[${idx}]</a></li>
										</c:forEach>

										<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
											<li><a
												href="notice_Board.do${pageMaker.makeQuery(pageMaker.endPage+1)}">&raquo;</a></li>
										</c:if>
									</ul> 
									<!-- <ul class="pagination justify-content-center">
										<li class="page-item"><a class="page-link" href="#"tabindex="-1" aria-disabled="true">Previous</a></li>
										<li class="page-item"><a class="page-link" href="#">1</a></li>
										<li class="page-item active" aria-current="page"><a
											class="page-link" href="#">2</a></li>
										<li class="page-item"><a class="page-link" href="#">3</a></li>
										<li class="page-item"><a class="page-link" href="#">Next</a></li>
									</ul> -->

								</th>
							</tr>
						</tbody>
					</table>
					<div style="text-align: right;">
						<c:choose>
							<c:when test="${member.level1 eq 1 }">
								<button type="button" class="btn btn-primary col-lg-1"
									onClick="location.href='notice_Board_Write.do'">
									<i class="bi bi-pencil">글쓰기</i>
								</button>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
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