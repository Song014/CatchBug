<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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

	<!-- ======= Main ======= -->
	<!-- main start -->
	<main id="main" class="main">
	<div class="pagetitle">
		<h1>상품 리스트 조회</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/">가맹점 관리</a></li>
				<li class="breadcrumb-item active">상품리스트</li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->

	<section class="section dashboard">


		<div class="card">
			<div class="card-body">
				<div class="row">
					<!-- 카테고리  -->
					<div class="col-lg-2" style="margin-top: 3em;">
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
							<div align="right" class="dataTable-top col-md-12">
								<div class="col-md-12">
									<input class="dataTable-input" placeholder="상품명을 입력해 주세요."
										type="text" id="searchWord">
									<button class="btn btn-primary" type="submit" id="searchButton">검색</button>
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
										<th scope="col">개당 가격</th>
										<th scope="col">재고량</th>
										<th scope="col">비 고</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="list" items="${product }" varStatus="status">
										<tr>
											<td>${status.count }</td>
											<th scope="row"><a href="#"><img
													src="https://via.placeholder.com/60" alt=""></a></th>
											<td>${list.product_no }</td>
											<td><a class="primary product_modal"
												data-bs-toggle="modal" data-bs-target="#modalProduct"
												id="${list.product_no}">${list.product_name }</a></td>
											<td>${list.price }</td>
											<td>${list.product_quantily }</td>
											<td><fmt:formatDate value="${list.add_day }"
													pattern="yyyy-MM-dd" /></td>
											<td><button type="button" id="productEdit"
													class="btn btn-primary btn-sm"
													onclick="location.href='product_edit?product_no=${list.product_no}'">상품수정</button></td>
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
					<h5 class="modal-title">상품 상세정보 보기페이지</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="card">
						<div class="card-body">
							<div class="card-title" id="modal-product-name">
								<h5>상품이름 이거입니다.</h5>
							</div>
							<table class="table" id="productModal">
								<thead>
									<tr>
										<th scope="col" style="width: 20%;">상품코드</th>
										<th scope="col" style="width: 26%;">제조사</th>
										<th scope="col" style="width: 13%;">가격</th>
										<th scope="col" style="width: 15%;">등록일</th>
									</tr>
								</thead>
								<tbody>
									<tr id="select-modal">
										<th scope="row">00001</th>
										<td>마우스</td>
										<td>삼성전자</td>
										<td>15000</td>
										<td>날짜입력</td>
									</tr>
								</tbody>
							</table>

							<div id="productModalImg"></div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-danger" id="addCart">상품담기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 해당상품 모달 끝 -->


	<script type="text/javascript">
	// 상품 목록 테이블의 추가 버튼 클릭시 이벤트
	$("#addCart").on("click", function () {
		
		const no = $("#cartNo").text();
		console.log(no);
		// DB 요청 - 삽입 성공시 장바구니 테이블에 추가 실패시 경고창 
		   $.ajax({
			type: "POST",
			url: "insertCartAjax.do",
			data: { "product_no": no },
			dataType: "text",
			success: function (result) {
				if (result == "ok") {
					alert("장바구니에 추가되었습니다.");
				} else if (result == "false") {
					// db에 
					alert("이미 추가된 상품입니다.")
				}
			},
			error: function (a, b, c) {
				alert("로그인 후 이용 가능합니다.");
			}
		});
	})

	
	// 검색버튼을 클릭시 테이블 비동기처리
	$("#searchButton").on("click",function(e){
		e.preventDefault();
		
		const searchWord = $("#searchWord").val();
		
		$.ajax({
			type: "GET",
			url: "searchAjax.do?product_name=" + searchWord, //검색값을 담아서 컨트롤러로 전달
			dataType : "json",
			success : function(result){
				$("#category tbody tr").remove();
				result.forEach(function(result){
					console.log(result)
					const str =`
						<tr>
							<td>1</td>
							<th scope="row"><a href="#"><img
									src="https://via.placeholder.com/60" alt=""></a></th>
							<td>`+result.product_no+`</td>
							<td><a class="primary product_modal" data-bs-toggle="modal"
								data-bs-target="#modalProduct" id="`+result.product_no+`">`+result.product_name+`</a></td>
							<td>`+result.price+`</td>
							<td>`+result.product_quantily+`</td>
							<td>`+result.add_day+`</td>
						</tr>
						`;
						
						$("#category tbody").append(str);
				})
			}
		})
		
	});
	</script>


	<script type="text/javascript">
	
	let trArr = new Array();
	// 하위 카테고리 클릭시 해당하는 품목 비동기 처리
	$(".getCategory").on("click", function(e) {
		e.preventDefault();
		
		const no = $(this).parent().find(".subCategoryNo").val();
		
		$.ajax({
			type : "GET", //요청 메소드 방식
			url: "getProductAjax.do?sub_category=" + no,
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
							<td><a class="primary product_modal" data-bs-toggle="modal"
								data-bs-target="#modalProduct" id="`+result.product_no+`">`+result.product_name+`</a></td>
							<td>`+result.add_day+`</td>
							<td>`+result.product_quantily+`</td>
							<td>`+result.price+`</td>
							<td><button type="button" id="productEdit" class="btn btn-primary btn-sm" onclick="location.href='product_edit?product_no=`+result.product_no+`'">상품수정</button></td>
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
	
	</script>

	<script type="text/javascript">
	// 모달창 비동기처리
	$(document).on("click", ".product_modal", function (e) {
		console.log("모달 비동기처리 작동");
		e.preventDefault();
		var tagId = e.target.id;
		
		
		$.ajax({
			type: "GET",
			url: "/modalAjax.do?product_no=" + tagId, //선택 태그의 아이디값을 찾아서 전달
			dataType : "json",
			success : function(result){
				$("#productModal tbody tr").remove();
				$("#productModalImg img").remove();
				$("#modal-product-name h5").remove();
				result.forEach(function(result){
					console.log(result);
					const str = `
						<tr id="select-modal">
							<th scope="row" id="cartNo">`+result.product_no+`</th>
							<td>`+result.product_name+`</td>
							<td>`+result.price+`</td>
							<td>`+result.add_day+`</td>
						</tr>
					`;
					const title = `<h5>`+result.product_name+`</h5>`;
					console.log(title);
					const imgPath = "/resources/productImg/" + result.add_day + "/" + result.uuid;
					console.log(imgPath);
					const imgStr = `<img src="`+imgPath +`"/>`
					$("#modal-product-name").append(title);
					$("#productModalImg").append(imgStr);
					$("#productModal tbody").append(str);
				})
			}
		})
		
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