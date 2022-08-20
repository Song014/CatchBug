<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ page session="false" %>
		<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

			<!DOCTYPE html>
			<html lang="en">

			<head>
				<meta charset="utf-8">
				<meta content="width=device-width, initial-scale=1.0" name="viewport">

				<title>Dashboard - NiceAdmin Bootstrap Template</title>
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
				<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
				<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
				<link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
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

	<%-- <c:set var="user" value="${user }"/>
	 
	 <c:when test="${user.level != 2}">
	 	<jsp:include page="sidebar(master).jsp"></jsp:include>
	 </c:when> --%>

	<%-- 	 <c:otherwise> --%>
	<jsp:include page="../mainInclude/sidebar_master.jsp"></jsp:include>

	<%--  		<jsp:include page="sidebar_master.jsp"></jsp:include> --%>
	<%-- 	 </c:otherwise> --%>

	<!-- End Sidebar -->
	<!-- End Header -->

	<!-- ======= Sidebar ======= -->

	<%-- <c:set var="user" value="${user }"/>
	 
	 <c:when test="${user.level != 2}">
	 	<jsp:include page="sidebar(master).jsp"></jsp:include>
	 </c:when> --%>

	<%-- 	 <c:otherwise> --%>
	<jsp:include page="../mainInclude/sidebar_master.jsp"></jsp:include>

	<%--  		<jsp:include page="sidebar_master.jsp"></jsp:include> --%>
	<%-- 	 </c:otherwise> --%>

	<!-- End Sidebar -->
				<main id="main" class="main">
					<div class="pagetitle">
						<h1>본사 발주 내역 조회</h1>
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html">재고관리</a></li>
								<li class="breadcrumb-item active">본사발주 내역</li>
							</ol>
						</nav>
					</div>
					<section class="section">
						<div class="row">
							<div class="col-lg-12">
								<div class="card">
									<div class="card-body">
										<h5 class="card-title"><code>본사</code> 발주 전체 리스트</h5>


										<div
											class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
											<div class="dataTable-top">
												<div class="dataTable-dropdown"><label>
														<select class="dataTable-selector">
															<option value="5">5</option>
															<option value="10" selected="">10</option>
															<option value="15">15</option>
															<option value="20">20</option>
															<option value="25">25</option>
														</select> entries per page</label></div>
												<div class="dataTable-search">

													<input type="date" class="dataTable-input" name="startDate"
														id="inputSearchDate">
													<input type="date" class="dataTable-input" name="endDate">
													<input class="dataTable-input" placeholder="검색어를 입력해 주세요."
														type="text">
													<input type="submit" class="btn btn-sm btn-primary dataTable-input"
														value="검색" />
													</form>
												</div>
											</div>
										</div>

										<div class="dataTable-container">
											<table class="table datatable dataTable-table">
												<thead>
													<tr>
														<th scope="col" data-sortable="" style="width: 5%;">
															<a href="#" class="dataTable-sorter">#</a>
														</th>
														<th scope="col" data-sortable="" style="width: 8%;">
															<a href="#" class="dataTable-sorter">주문번호</a>
														</th>
														<th scope="col" data-sortable="" style="width: 8%;">
															<a href="#" class="dataTable-sorter">주문일자</a>
														</th>
														<th scope="col" data-sortable="" style="width: 55%;"><a href="#"
																class="dataTable-sorter">내용</a></th>
														<th scope="col" data-sortable="" style="width: 8%;">
															<a href="#" class="dataTable-sorter">가격</a>
														</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th scope="row">1</th>
														<td>1234567</td>
														<td>08월21일</td>
														<td>
															<!-- 주문서 모달부분 코드 -->
															<a class="primary" data-bs-toggle="modal"
																data-bs-target="#modalDialogScrollable">
																상세보기 모달띄우기
															</a>
															<div class="modal fade" id="modalDialogScrollable"
																tabindex="-1">
																<div class="modal-dialog modal-dialog-scrollable">
																	<div class="modal-content">
																		<div class="modal-header">
																			<h5 class="modal-title">주문서
																			</h5>
																			<button type="button" class="btn-close"
																				data-bs-dismiss="modal"
																				aria-label="Close"></button>
																		</div>
																		<div class="modal-body">
																			주문서 상세내용 작성하기
																			<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
																			This content should appear at the bottom
																			after
																			you scroll.
																		</div>
																		<div class="modal-footer">
																			<button type="button"
																				class="btn btn-secondary"
																				data-bs-dismiss="modal">Close</button>
																		</div>
																	</div>
																</div>
															</div><!-- End Modal Dialog Scrollable-->
														</td>
														<td>총금액</td>
													</tr>



												</tbody>
											</table>
										</div>
										<div class="dataTable-bottom">
											<div class="dataTable-info">Showing 1 to 5 of 5 entries</div>
											<nav class="dataTable-pagination">
												<ul class="dataTable-pagination-list"></ul>
											</nav>
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
				<footer id="footer" class="footer">
					<div class="copyright">
						&copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights
						Reserved
					</div>
					<div class="credits">
						<!-- All the links in the footer should remain intact. -->
						<!-- You can delete the links only if you purchased the pro version. -->
						<!-- Licensing information: https://bootstrapmade.com/license/ -->
						<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
						Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
					</div>
				</footer>
				<!-- End Footer -->

				<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
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
				<script>document.getElementById('inputSearchDate').valueAsDate = new Date();</script>


			</body>

			</html>