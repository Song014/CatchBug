<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>전체 상품 조회페이지</title>
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

	<!-- ======= Main ======= -->
	<!-- main start -->
	
	<main id="main" class="main">
		<div class="pagetitle">
			<h1>전체 상품리스트</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/">재고 관리</a></li>
					<li class="breadcrumb-item active">상품리스트</li>
				</ol>
			</nav>
		</div>
			<section class="section dashboard">
			<div class="card">
				<div class="card-body">
					<div class="row">
						<!-- 카테고리  -->
						<div class="col-lg-2">
							<c:forEach var="m" items="${mainCategory }" varStatus="status">
								<div class="accordion" id="accordionExample">
									<!-- ToDo 대분류 1,2,3, 일때 해당하는 카테고리 이름 -->

									<div class="accordion-item">
										<h2 class="accordion-header" id="headingOne">
											<button class="accordion-button collapsed" type="button"
												data-bs-toggle="collapse"
												data-bs-target="#collapse${status.count }"
												aria-expanded="false"
												aria-controls="collapse${status.count }">
												${m.main_name}</button>
										</h2>
										<div id="collapse${status.count }"
											class="accordion-collapse collapse"
											aria-labelledby="headingOne"
											data-bs-parent="#accordionExample" style="">
											<!-- ToDo 대분류 1 , 2 , 3 에 해당하는 서브카테고리 이름 -->
											<div class="accordion-body" style="padding: 1px">
												<c:forEach var="s" items="${subCategory}">
													<c:if test="${m.main_category eq s.main_category}">
														<div class="list-group">
															<input type="hidden" class="subCategoryNo"
																value="${s.sub_category }">
															<button type="button"
																class="list-group-item list-group-item-action getCategory">
																${s.sub_name }</button>
														</div>
													</c:if>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<div class="col-lg-10">
							<!-- 카테고리 선택창 -->
							<div>
								<div align="right" class="dataTable-top">
									<div class="dataTable-dropdown">
										<label><select class="dataTable-selector"><option
													value="5">5</option>
												<option value="10" selected="">10</option>
												<option value="15">15</option>
												<option value="20">20</option>
												<option value="25">25</option></select> entries per page</label>
									</div>
									<div class="dataTable-search">
										<form>
											<input type="date" name="beforeDate"> <input
												type="date" name="afterDate" id='currnetDate'> <select
												name="searchOption">
												<option value="orderNumber" selected="selected">상품번호</option>
												<option value="content">상품명</option>
												<option value="remarks">등록일자</option>
											</select> <input type="text" name="input" placeholder="검색어를 입력해 주세요.">
											<!-- <input type="button" name="inputBtn" value="검색"> -->
											<button>검색</button>
										</form>
									</div>
								</div>
								<!-- 상품 리스트 -->
								<table class="table table-borderless top-selling" id="category">
									<thead>
										<tr>
											<th scope="col">번호</th>
											<th scope="col">이미지</th>
											<th scope="col">상품 번호</th>
											<th scope="col">상품 명</th>
											<th scope="col">재고 수량</th>
											<th scope="col">개당 가격</th>
											<th scope="col">등록일</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="list" items="${product }" varStatus="status">
											<tr>
												<td>${status.count }</td>
												<th scope="row"><a href="#"><img
														src="https://via.placeholder.com/60" alt=""></a></th>
												<td>${list.product_no }</td>
												<td><a class="primary" data-bs-toggle="modal"
													data-bs-target="#modalProduct">상품 모달띄우기 </a></td>
												<td>재고량1</td>
												<td>${list.price }</td>
												<td>${list.add_day }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<!-- 상품 리스트 -->
							</div>
						</div>
					</div>
				</div>


			</div>
		</section>

	</main>
	<!-- End #main -->

		<!-- 모달창 -->
	<div class="modal fade" id="modalProduct" tabindex="-1">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">주문번호 : 123456789</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="card">
						<div class="card-body">
							<div class="card-title" style="text-align: right;">
								<h5>총 주문금액</h5>
								<div>
									<i class="bx bx-won">가격 적어주세요</i>
								</div>
							</div>
							<table class="table">
								<thead>
									<tr>
										<th scope="col" style="width: 20%;">상품코드</th>
										<th scope="col" style="width: 52%;">품목명</th>
										<th scope="col" style="width: 13%;">수량</th>
										<th scope="col" style="width: 15%;">가격</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">00001</th>
										<td>무선 마우스 GB110</td>
										<td>5</td>
										<td>10000123123</td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
				let trArr = new Array();
				// 하위 카테고리 클릭시 해당하는 품목 비동기 처리
				$(".getCategory").on("click", function(e) {
					e.preventDefault();
					
					const no = $(this).parent().find(".subCategoryNo").val();
					
					$.ajax({
						type : "GET", //요청 메소드 방식
						url : "orderAjax.do?sub_category="+no,
						dataType : "json", //서버가 요청 URL을 통해서 응답하는 내용의 타입
						success : function(result) {
							$("#category tbody tr").remove(); // 기존 존재하는 테이블 삭제
							result.forEach(function(result) {
								const str =`
									<tr>
										<td>1</td>
										<th scope="row"><a href="#"><img
												src="https://via.placeholder.com/60" alt=""></a></th>
										<td>`+result.product_no+`</td>
										<td><a class="primary" data-bs-toggle="modal"
											data-bs-target="#modalProduct">`+result.product_name+`</a></td>
										<td>재고량나올곳</td>
										<td>`+result.price+`</td>
										<td>`+result.add_day+`</td>
									</tr>
									`;
									
									$("#category tbody").append(str);
							});
							
							console.log("ajax 성공");
						},
						error : function(a, b, c) {
							//통신 실패시 발생하는 함수(콜백)
							console.log("실패" + a, b, c);
						}
					});
				})
				
				
				$("#category").on("click",".addBucket",function() {
					
					
					const $tr = $(this).parent().parent();
					const $td = $tr.children();
					console.log("클릭한 Row의 모든 데이터 : " + $tr.text());
					
					
					const no = $td.eq(2).text();
					const name = $td.eq(3).text();
					const quantity = $td.eq(4).text();
					const price = $td.eq(6).text();
					
					const str =`
					<tr>
						<td><input type="checkbox" name="checkBox"></td>
						<td><input type="hidden" value=`+no+` >`+no+`</td>
						<td><input type="hidden" value=`+name+`><a class="primary" data-bs-toggle="modal" data-bs-target="#modalProduct">`+name+`</a></td>
						<td><input type="number" value="1"></td>
						<td><input type="hidden" value=`+price+`>`+price+`</td>
						<td><button type="button" class="btn btn-primary btn-sm delBucket">삭제</button></td>
					</tr>
					`;
					
					
					
					if(trArr.indexOf(no)!=-1){
						alert(no+"과 같은 상품이 있습니다")
					} else {
						trArr.push(no);
						$("#bucket tbody").append(str);
						$.ajax({
							type : "GET", //요청 메소드 방식
							url : "orderInsertAjax.do?product_no="+no,
							dataType : "text", //서버가 요청 URL을 통해서 응답하는 내용의 타입
							success : function(result) {
								console.log(result+" 성공");
							},
							error : function(a, b, c) {
								//통신 실패시 발생하는 함수(콜백)
								console.log("실패" + a, b, c);
							}
						});
					}
				})
				
				
				 $("#bucket").on("click", ".delBucket", function() {
					 const $tr = $(this).parent().parent();
					 const $td = $tr.children();
					 const no = $td.eq(1).text();
					 if(trArr.indexOf(no)!=-1){
						 trArr.splice(no,1);
						 $.ajax({
								type : "GET", //요청 메소드 방식
								url : "orderDeleteAjax.do?product_no="+no,
								dataType : "text", //서버가 요청 URL을 통해서 응답하는 내용의 타입
								success : function(result) {
									console.log(result+" 성공");
								},
								error : function(a, b, c) {
									//통신 실패시 발생하는 함수(콜백)
									console.log("실패" + a, b, c);
								}
							});
						}
					 $tr.remove();
			    });
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

	<!-- 날짜 검색시 오늘로 셋팅해주는 스크립트-->
	<script>
		document.getElementById('inputSearchDate').valueAsDate = new Date();
	</script>


</body>

</html>