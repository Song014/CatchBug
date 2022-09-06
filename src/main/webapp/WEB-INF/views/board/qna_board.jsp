<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>QnA 게시판</title>
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

	<!-- ======= Sidebar ======= -->
	<main id="main" class="main">

	<div class="pagetitle">
		<h1>질문 게시판</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/">Home</a></li>
				<li class="breadcrumb-item active">질문 게시판</li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->
	<section class="section dashboard">
		<div class="card">
			<div class="card-body" style="padding-top: 20px;">
				<div class="col-md-12" style="text-align: right;">
					<form action="QnABoard.do?page=1" method="post" id="search">
						<select name="searchTap">
							<option value="1">작성자</option>
							<option value="2">제목</option>
						</select> <input class="dataTable-input" placeholder="검색어를 입력해 주세요."
							type="text" name="searchWord" value="">
						<button class="btn btn-primary" type="submit">검색</button>
					</form>
				</div>
				<table class="table table-bordered" style="text-align: center">
					<thead>
						<tr class="table-primary">
							<th scope="col" style="width: 5%;">#</th>
							<th scope="col" style="width: 8%;">탭</th>
							<th scope="col" style="width: 10%;">이름</th>
							<th scope="col" style="width: 57%;">제목</th>
							<th scope="col" style="width: 5%;">조회수</th>
							<th scope="col" style="width: 15%;">작성일</th>
						</tr>
					</thead>
					<tbody id="tablea">
						<c:forEach var="list" items="${qna_list }">
							<tr>
								<th scope="row">${list.qna_no }</th>
								<td>${list.name }</td>
								<td>${list.id }</td>
								<!-- 1 비밀글 -->
								<c:choose>
									<c:when test="${list.state eq 1 }">
										<c:choose>
											<c:when test="${member.level1 eq 1 || member.id eq list.id}">
												<td><i class="bi bi-lock"><a
														href="QnABoardDetail.do?qna_no=${list.qna_no }">${list.title }</a></i></td>
											</c:when>
											<c:otherwise>
												<td><i class="bi bi-lock"><a href="#"
														onclick="javascript:alert('비공개 게시글입니다.')">${list.title }</a></i></td>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<td><a href="QnABoardDetail.do?qna_no=${list.qna_no }">${list.title }</a></td>
									</c:otherwise>
								</c:choose>
								<td>${list.cnt }</td>
								<td><fmt:formatDate value="${list.day }"
										pattern="yyyy-MM-dd" timeZone="Asia/Seoul" /></td>
							</tr>
						</c:forEach>
					</tbody>
					<tbody>
						<tr>
							<th colspan="6">
								<ul class="pagination justify-content-center">
									<c:forEach begin="${page.startPageNum }" end="${page.endPageNum }" var="i"
										varStatus="status">
										<c:choose>
											<c:when test="${page.page == status.count }">
												<li class="paginate_button previous active"><a
													class="page-link" href="QnABoard.do?page=${i }&searchTap=${search.searchTap }&searchWord=${search.searchWord }">${i }</a></li>
											</c:when>
											<c:otherwise>
												<li class="paginate_button previous "><a
													class="page-link" href="QnABoard.do?page=${i }&searchTap=${search.searchTap }&searchWord=${search.searchWord }">${i }</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>

								</ul>
							</th>
						</tr>
					</tbody>
				</table>
				<div style="text-align: right;">
					<button type="button" class="btn btn-primary col-lg-1"
						onClick="location.href='QnA_Board_Write.do'">
						<i class="bi bi-pencil">글쓰기</i>
					</button>
				</div>
			</div>
		</div>
	</section>

	</main>
	<script type="text/javascript">
		/* function paging(e){
			onclick="javascript:paging(${status.count });
			const sel = $(".dataTable-selector  option:selected").val();
			location.href="QnABoard.do?page="+e+"&pageCount="+sel;
		} */
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