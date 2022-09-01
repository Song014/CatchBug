<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	int startPage = (Integer) request.getAttribute("startPage");
	int endPage = (Integer) request.getAttribute("endPage");
	int nowPage = (Integer) request.getAttribute("page");
%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>게시판 - 자유게시판</title>
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

	<main id="main" class="main">

	<div class="card">
		<div class="card-body">
			<h1 class="card-title">자유 게시판</h1>
			<div class="row g-3">
				<div class="col-md-12" style="text-align: right;">
					<form action="freeBoard.do?page=1" method="post">
						<select name="searchTap">
							<option value="1">작성자</option>
							<option value="2">제목</option>
						</select> <input class="dataTable-input" placeholder="검색어를 입력해 주세요."
							type="text" name="searchWord">
						<button class="btn btn-primary" type="submit">검색</button>
					</form>
				</div>
			</div>
			<table class="table table-bordered" style="text-align: center">
				<thead>
					<tr class="table-primary">
						<th scope="col" style="width: 5%;">#</th>
						<th scope="col" style="width: 5%;">탭</th>
						<th scope="col" style="width: 10%;">법인명</th>
						<th scope="col" style="width: 57%;">제목</th>
						<th scope="col" style="width: 10%;">조회수</th>
						<th scope="col" style="width: 13%;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${boardList }" varStatus="status">
						<tr>
							<td>${list.board_no }</td>
							<c:choose>
								<c:when test="${list.tap eq 1}">
									<th scope="row">잡담</th>
								</c:when>
								<c:when test="${list.tap eq 2}">
									<th scope="row">정보</th>
								</c:when>
								<c:when test="${list.tap eq 3}">
									<th scope="row">유머</th>
								</c:when>
							</c:choose>
							<td>${list.business_name }</td>
							<td><a class="primary product_modal"
								href="freeBoardDetail.do?board_no=${list.board_no }">${list.title }</a></td>
							<td>${list.cnt }</td>
							<td><fmt:formatDate value="${list.created_day }"
									pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
				</tbody>
				<tbody>
					<tr>
						<th colspan="6">
							<ul class="pagination justify-content-center">
								<%
									for (int i = startPage; i <= endPage; i++) {
										if(i == nowPage){
										%>
											<li class="paginate_button previous active"><a class="page-link" href="freeBoard.do?page=<%=i%>"><%=i%></a></li>
										<%
										}else{
											%>
											<li class="paginate_button previous"><a class="page-link" href="freeBoard.do?page=<%=i%>"><%=i%></a></li>
										<%
										}
									}
								%>

							</ul>
						</th>
					</tr>
				</tbody>
			</table>
			<div style="text-align: right;">
				<button type="button" class="btn btn-primary col-lg-1"
					onClick="location.href='free_Board_Write.do'">
					<i class="bi bi-pencil">글쓰기</i>
				</button>
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

</body>

</html>