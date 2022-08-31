<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Dashboard - NiceAdmin Bootstrap Template</title>
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
	<!-- End Sidebar -->
	<!-- main start -->
	<main id="main" class="main">
	<div class="pagetitle">
		<h1>주문/결제</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/">Home</a></li>
				<li class="breadcrumb-item active">주문/결제</li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->
	<section class="section dashboard">
		<div class="container">
			<div class="card">
				<div class="card-body">
					<div class="row">
						<!-- 상품정보 -->


						<!-- 주문확인  주문내용 확인 및 장바구니에서 빼기 , 발주서 작성페이지로 이동-->

						<table class="table" id="bucket">
							<thead>
								<tr>
									<th><input type="checkbox" class="all_check_input"
										name="checkBox" checked="checked"></th>
									<th>상품 번호</th>
									<th>상품 명</th>
									<th>구매 수량</th>
									<th>개당 가격</th>
									<th>버튼</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${cartList }">
									<tr>
										<td class="cart_info_td"><input type="checkbox" class="cart_checkbox"
											name="checkBox" checked="checked"> <input
											type="hidden" class="individual_product_no_input" value=${list.product_no }> <input
											type="hidden" class="individual_product_name_input" value=${list.product_name }> 
											<input type="hidden" class="individual_purchase_amount_input" value="${list.purchase_amount }">
											<input
											type="hidden" class="individual_total_input" value=${list.total }></td>
										<td>${list.product_no }</td>
										<td><a class="primary" data-bs-toggle="modal"
											data-bs-target="#modalProduct">${list.product_name }</a></td>
										<td>${list.purchase_amount }개</td>
										<td>${list.total }</td>
										<td><button type="button"
												class="btn btn-primary btn-sm delBucket">삭제</button></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<!-- 주문신청시 사용되는 폼 -->
						<form class="order_form" action="submitOrder.do">
							<input type="hidden" name="shipping_address" value=${memberId.business_address } >
							<input type="hidden" name="id" value=${memberId.id } >
						</form>
						<!-- 이전페이지로 돌아가기 -->
						<div align="center">
							<input class="btn btn-primary" type="submit" onclick="location.href='productForOrder.do'" value="상품 추가"></input>
						</div>

					</div>
					<!-- 배송지 선택 + 메모-->
					<div class="row">
						<div class="col-lg-2"></div>
						<!-- 배송지 정보  -->

						<div class="col-lg-4" style="border: 1px solid black;">
							<p>
								<strong>배송지 정보</strong>
							</p>
							<!-- ToDo 배송지 변경& 신규배송지 선택시 ajax로 ul 제거후 폼 생성 -->
							<div>
								<label>배송지 선택 </label>: <input type="radio" name="address"
									value="defaultAddress" checked="checked"> 기본배송지 <input
									type="radio" name="address" value="optionAddress">
								신규배송지
							</div>

							<ul>
								<li>${memberId.ceo }(${memberId.business_name })</li>
								<li>${memberId.contact }</li>
								<li>${memberId.business_address }</li>
								<li>
							</ul>
						</div>
						<!-- 주문자 정보 -->
						<div class="col-lg-4" style="border: 1px solid black;">
							<p>
								<strong>주문자 정보</strong>
							</p>
							<div>
								<ul>
									<li>${memberId.ceo }</li>
									<li>${memberId.contact }</li>
									<li>${memberId.email }</li>
								</ul>
							</div>
						</div>
						<div class="col-lg-2"></div>
					</div>
					<!-- 결제 상세 -->
					<div class="col-lg-12">
						<h3>총 주문금액 :</h3>
					</div>
					<!-- 결제모듈 선택-->
					<input type="button" class="btn btn-primary order_btn" value="결제하기">
				</div>
			</div>
		</div>
	</section>

	</main>

	<script type="text/javascript">
		$("#bucket").on("click", ".delBucket", function() {
			const $tr = $(this).parent().parent();
			const $td = $tr.children();
			const no = $td.eq(1).text();

			$.ajax({
				type : "POST", //요청 메소드 방식
				url : "deleteCartAjax.do",
				data : {
					"product_no" : no
				},
				dataType : "text", //서버가 요청 URL을 통해서 응답하는 내용의 타입
				success : function(result) {
					if (result == "ok") {
						$tr.remove();
					} else {
						alert("다시시도해주세요");
					}
				},
				error : function(e) {
					//통신 실패시 발생하는 함수(콜백)
					console.log("실패" + e);
				}
			});

		});

		/* 체크박스 전체 선택 */
		$(".all_check_input").on("click", function() {

			/* 체크박스 체크/해제 */
			if ($(".all_check_input").prop("checked")) {
				$(".cart_checkbox").attr("checked", true);
			} else {
				$(".cart_checkbox").attr("checked", false);
			}

		});

		$(".order_btn")
				.on(
						"click",
						function() {

							let form_contents = '';
							let orderNumber = 0;

							$(".cart_info_td")
									.each(
											function(index, element) {

												if ($(element).find(
														".cart_checkbox").is(
														":checked") === true) { //체크여부

													let product_no = $(element)
															.find(
																	".individual_product_no_input")
															.val();
													let product_amount = $(element)
															.find(
																	".individual_purchase_amount_input")
															.val();

													let product_no_input = "<input name='orders[" + orderNumber + "].product_no' type='hidden' value='" + product_no + "'>";
													form_contents += product_no_input;

													let product_amount_input = "<input name='orders[" + orderNumber + "].purchase_amount' type='hidden' value='" + product_amount + "'>";
													form_contents += product_amount_input;

													orderNumber += 1;

												}
											});

							$(".order_form").append(form_contents);
							$(".order_form").submit();

						});
	</script>
	<!-- End #main -->

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