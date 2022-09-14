<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>가맹점 리스트</title>
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

	<!-- ======= Header ======= -->

	<jsp:include page="../mainInclude/header.jsp"></jsp:include>

	<!-- End Header -->




	<!-- ======= Sidebar ======= -->

	<jsp:include page="../mainInclude/sidebar.jsp"></jsp:include>

	<!-- main start -->
	<!-- main start -->
	<main id="main" class="main">
	<div class="pagetitle">
		<h1>가맹점 리스트</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item">가맹점관리</li>
				<li class="breadcrumb-item active">가맹점 리스트</li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->
	<section class="section dashboard">
		<div class="row">
			<div class="card">
				<div class="card-body">
					<div align="right" class="dataTable-top">
						<div>
							<form action="member_List.do">
								<select name="searchType">
									<option value="1" selected="selected">법인명</option>
									<option value="2">id</option>
								</select> <input class="dataTable-input" type="text" name="searchName"
									placeholder="검색어를 입력해 주세요.">
								<button class="btn btn-primary" type="submit">검색</button>
							</form>
						</div>
					</div>

					<!-- Table with hoverable rows -->
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">ID</th>
								<th scope="col">대표자</th>
								<th scope="col">연락처</th>
								<th scope="col">이메일</th>
								<th scope="col">법인명</th>
								<th scope="col">사업자 등록 번호</th>
								<th scope="col">사업장 주소지</th>
								<th scope="col">회원 가입일</th>
								<!-- <th scope="col">회원관리</th> -->
							</tr>
						</thead>
						<tbody>
							<c:forEach var="member" items="${list}" varStatus="status">
								<tr>
									<th scope="row">${status.count}</th>
									<td>${member.id}</td>
									<td>${member.ceo}</td>
									<td>${member.contact}</td>
									<td>${member.email}</td>
									<td>${member.business_name}</td>
									<td>${member.business_no}</td>
									<td>${member.business_address}</td>
									<td><fmt:formatDate value="${member.regdate}"
											pattern="yyyy-MM-dd" timeZone="Asia/Seoul" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<ul class="pagination justify-content-center">
						<!-- 페이지 인덱스를 처리한다. -->
						<c:if test="${pageMaker.prev}">
							<li><a
								href="/member_List.do${pageMaker.makeQuery(pageMaker.startPage-1)}">&laquo;</a></li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}" var="idx">
							<li
								<c:out value="${pageMaker.cri.page == idx? 'class=active':''}"/>>
								<a class="page-link"
								href="/member_List.do${pageMaker.makeQuery(idx) }&searchType=${searchType }&searchName=${searchName } ">${idx}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a
								href="/member_List.do${pageMaker.makeQuery(pageMaker.endPage+1)}">&raquo;</a></li>
						</c:if>
					</ul>
					<!-- End Table with hoverable rows -->
					<script type="text/javascript">
						
					<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
						//오늘 날짜
						document.getElementById('currentDate').value = new Date()
								.toISOString().slice(0, 10);
					</script>

				</div>
			</div>
		</div>
	</section>
	</main>
	<!-- End Main -->


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

</body>

</html>