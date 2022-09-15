<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta http-equiv="X-Frame-Options" content="deny" />
<title>발주 상품 목록</title>
<meta content="" name="description">
<meta content="" name="keywords">


<!-- jQuery -->
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
<style type="text/css">
.hide {
	display: none;
}

.form-input{
	padding: 0.375rem 0.75rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #212529;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: 0.375rem;
}
</style>
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
							<c:set var="total" value="0"></c:set>
							<c:forEach var="list" items="${cartList }">
								<tr>
									<td class="cart_info_td"><input type="checkbox"
										class="cart_checkbox" name="cart_check" checked="checked">
										<input type="hidden" class="individual_product_no_input"
										value=${list.product_no }> <input type="hidden"
										class="individual_product_name_input"
										value=${list.product_name }> <input type="hidden"
										class="individual_purchase_amount_input"
										value="${list.purchase_amount }"> <input type="hidden"
										class="individual_total_input" value=${list.total }></td>
									<td>${list.product_no }</td>
									<td><a class="primary" data-bs-toggle="modal"
										data-bs-target="#modalProduct">${list.product_name }</a></td>
									<td>${list.purchase_amount }개</td>
									<td><fmt:formatNumber value="${list.total }"
											groupingUsed="true" /></td>
									<td><button type="button"
											class="btn btn-primary btn-sm delBucket"
											value="${member.id }">삭제</button></td>
								</tr>
								<c:set var="total" value="${total + list.total }"></c:set>
							</c:forEach>
						</tbody>
					</table>


					<div align="center">
						<h3 id="product_info">
							총 주문금액 :
							<fmt:formatNumber value="${total }" groupingUsed="true" />
						</h3>
						<!-- 이전페이지로 돌아가기 -->
						<input class="btn btn-primary" type="submit"
							onclick="location.href='productForOrder.do'" value="상품 추가"></input>
					</div>

				</div>
				<!-- 배송지 선택 + 메모-->
				<div class="row" style="margin: 10px 20%">

					<!-- 배송지 정보  -->

					<div class="col-lg-8"
						style="border: 1px solid black; padding: 20px;">
						<article>
							<label></label>
							<div>
								<!-- 결제모듈 선택-->
								<strong>결제 수단: </strong> <input type="button"
									class="btn btn-primary order_btn" onclick="requestPay('kcp')"
									value="신용카드 결제"> <a href="#"
									onclick="requestPay('kakaopay.TC0ONETIME')"> <img
									alt="카카오페이 이미지" src="/resources/assets/img/kakao.png">
								</a>
								<!-- 	<input type="button" class="btn btn-primary order_btn"
									onclick="requestPay('kakaopay')"  value="kakaopay 결제"> -->
							</div>
						</article>
						<hr>
						<article>
							<p>
								<strong>배송지 정보</strong>
							</p>
							<div>
								<label>배송지 선택 </label>: <input type="radio"
									class="radio_adrress_input" name="address"
									value="defaultAddress" checked="checked"> 기본배송지 <input
									type="radio" class="radio_adrress_input" name="address"
									value="optionAddress"> 신규배송지

							</div>

							<!-- 주문신청시 사용되는 폼 -->
							<form class="order_form" action="submitOrder.do">
								<input type="hidden" name="id" value="${member.id }">

								<table>
									<tr>
										<th>이름:</th>
										<td><input type="hidden" name="ceo"
											value="${member.ceo }">${member.ceo }</td>
									</tr>
									<tr>
										<th>번호:</th>
										<td><input type="hidden" name="contact"
											value="${member.contact }">${member.contact }</td>
									</tr>
									<tr>
										<th>우편번호:</th>
										<td><input type="hidden" name="shipping_address"
											value="${member.postcode }">${member.postcode }</td>
									</tr>
									<tr>
										<th>주소:</th>
										<td><input type="hidden" name="shipping_address"
											value="${member.business_address }">${member.business_address }</td>
									</tr>
									<tr>
										<th>상세주소:</th>
										<td><input type="hidden" name="shipping_address"
											value="${member.detailAddress }">${member.detailAddress }</td>
									</tr>
								</table>
							</form>
						</article>

					</div>
					<!-- 주문자 정보 -->
					<div class="col-lg-4"
						style="border: 1px solid black; padding: 20px;">
						<p>
							<strong>주문자 정보</strong>
						</p>
						<table>
							<tr>
								<th>주문자명:</th>
								<td>${member.ceo }</td>
							</tr>
							<tr>
								<th>번호:</th>
								<td>${member.contact }</td>
							</tr>
							<tr>
								<th>이메일:</th>
								<td>${member.email }</td>
							</tr>
						</table>
					</div>

				</div>


			</div>
		</div>
	</section>

	</main>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }


                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("shipping_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>

	<script type="text/javascript">
					// 배송지
					$(".radio_adrress_input").on("change",function(e){
						e.preventDefault();
						console.log(e.target.value)
						let str ="";
						if(e.target.value=="optionAddress"){
							str = `
								<input type="text" id="ceo" class="form-input" name="ceo" placeholder="이름" > <br>
								<input type="text" id="contact" class="form-input" name="contact" placeholder="연락처" > <br>
								<input type="text" id="postcode" class="form-input" name="postcode" placeholder="우편번호" >
								<input type="button"  onclick="execDaumPostcode()" value="우편번호 찾기" ><br>
								<input type="text" id="shipping_address" class="form-input" name="shipping_address" placeholder="주소" >
								<input type="text" id="detailAddress" class="form-input" name="detailAddress" placeholder="상세주소" >
						 	`;
						} else if(e.target.value=="defaultAddress"){
							str = `
								<tr>
									<th>이름:</th>
									<td><input type="hidden" id="ceo" name="ceo" value="${member.ceo }">${member.ceo }</td>
								</tr>
								<tr>
									<th>번호:</th>
									<td><input type="hidden" id="contact" name="contact" value="${member.contact }">${member.contact }</td>
								</tr>
								<tr>
								<th>우편번호:</th>
								<td><input type="hidden" name="shipping_address"
									value="${member.postcode }">${member.postcode }</td>
								</tr>
								<tr>
									<th>주소:</th>
									<td><input type="hidden" name="shipping_address"
										value="${member.business_address }">${member.business_address }</td>
								</tr>
								<tr>
									<th>상세주소:</th>
									<td><input type="hidden" name="shipping_address"
										value="${member.detailAddress }">${member.detailAddress }</td>
								</tr>
							`
						}
						 	$(".order_form table").html(str); 
					})
					
					// 체크박스
					$('input[type="checkbox"]').change(
						function () {
							let total_price = 0;

							$(".cart_info_td").each(
								function (index, element) {

									if ($(element).find(".cart_checkbox").is(
										":checked") === true) { //체크여부
										total_price += Number($(element).find(
											".individual_total_input").val());
									}
								})
							$("#product_info").html(
								"총 구매 금액 : " + total_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')  + " 원")
						});

					$("#bucket").on("click", ".delBucket", function (e) {
						const $tr = $(this).parent().parent();
						const $td = $tr.children();
						const no = $td.eq(1).text();
						const member_id = e.target.value;
						console.log("asd"+member_id)
						$.ajax({
							type: "DELETE", //요청 메소드 방식
							url: "deleteCartAjax.do?product_no="+no+"&id="+member_id,
							dataType: "text", //서버가 요청 URL을 통해서 응답하는 내용의 타입
							success: function (result) {
								if (result == "true") {
									$tr.remove();
									cartVaild();
								} else if(result == "false"){
									alert("다시시도해주세요");
								} else{
									alert("관리자에게 문의해주세요");
								}
							},
							error: function (e) {
								//통신 실패시 발생하는 함수(콜백)
								console.log("실패" + e);
							}
						});

					});

					/* 체크박스 전체 선택 */
					$(".all_check_input").on("click", function () {
						/* 체크박스 체크/해제 */
						if ($(".all_check_input").is(":checked"))
							$("input[name='cart_check']").prop("checked", true); 
						 else
							$("input[name='cart_check']").prop("checked", false); 
					});

					/* $(".order_btn").on("click", function() {
			
					}); */
				</script>

	<!-- iamport.payment.js -->
	<script type="text/javascript"
		src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<!-- 결제 모듈 -->
	<script>
			
					var IMP = window.IMP;
					IMP.init("imp45408430");

					// 결제 버튼 눌렀을때 실행함수
					function requestPay(e) {
						// 기본으로 들어가는 데이터 
						const pgs = e; 
						const id = '${member.id }';
						const member_name = $(".order_form").find("input[id=ceo]").val();
						const member_email = '${member.email }';
						const member_tel = $(".order_form").find("input[id=contact]").val();
						const member_postcode = $(".order_form").find("input[id=postcode]").val();
						const member_addr = $(".order_form").find("input[id=shipping_address]").val();
						const member_detail_addr = $(".order_form").find("input[id=detailAddress]").val();
						
						//ceo contact postcode shipping_address detailAddress
						if(member_name==""){
							alert("이름을 입력해주세요")
							return false;
						} else if(member_tel==""){
							alert("전화번호를 입력해주세요")
							return false;
						} else if(member_postcode==""){
							alert("우편본호를 입력해주세요")
							return false;
						} else if(member_addr==""){
							alert("주소를 입력해주세요")
							return false;
						} else if(member_detail_addr==""){
							alert("상세주소를 입력해주세요")
							return false;
						 }
						

						// 주문번호 생성
						const now = new Date();
						const order_no = id + '_'
							+ now.toISOString().substring(0, 16).replace(/[^0-9]/g , '');
						console.log(order_no)
						// 첫번째 상품 이름, 상품 개수  (상품 외 2개)형식으로 나타냄
						const $num = $('input[name=cart_check]:checked').length;
						const $name = $(".cart_checkbox:checked").parent().find(
							".individual_product_name_input").val();
						console.log($num);

						let form_contents = "<input name='order_no' type='hidden' value='" + order_no + "'>";
						let orderNumber = 0;
						let total_price = 0;
						$(".cart_info_td")
							.each(
								function (index, element) {

									if ($(element).find(".cart_checkbox").is(
										":checked") === true) { //체크여부

										let product_no = $(element).find(
											".individual_product_no_input")
											.val();
										let product_amount = $(element)
											.find(
												".individual_purchase_amount_input")
											.val();

										// 서버에 보내줄 데이터 (주문번호, 상품번호, 수량)
										

										let product_no_input = "<input name='orders[" + orderNumber + "].product_no' type='hidden' value='" + product_no + "'>";
										form_contents += product_no_input;

										let product_amount_input = "<input name='orders[" + orderNumber + "].purchase_amount' type='hidden' value='" + product_amount + "'>";
										form_contents += product_amount_input;

										let total = $(element).find(
											".individual_total_input").val();
										total_price += Number(total);
										orderNumber += 1;

									}
								});
						
						

						// 아이엠포트 결제모듈 
						IMP
							.request_pay(
								{
									pg: pgs,
									pay_method: 'card',
									merchant_uid: order_no,
									name: $num > 1 ? $name + ' 외 ' + ($num - 1)
										+ "개" : $name,
									amount: total_price,
									buyer_email: member_email,
									buyer_name: member_name,
									buyer_tel: member_tel,
									buyer_addr: member_addr+" "+member_detail_addr,
									buyer_postcode: member_postcode
								},
								function (rsp) { // callback
									if (rsp.success) {
										console.log(rsp);

										jQuery
											.ajax(
												{
													url: "/verifyIamport/" + rsp.imp_uid,
													method: "POST",
													headers: {
														"Content-Type": "application/json"
													},
													data: {
														imp_uid: rsp.imp_uid, //결제 고유번호     
														merchant_uid: rsp.merchant_uid
														//주문번호
													}
												})
											.done(
												function (data) {
													// 가맹점 서버 결제 API 성공시 로직
													console.log(data);
													if (rsp.paid_amount == data.response.amount) {
														console.log("결제 및 결제검증완료");

														$(".order_form")
															.append(
																form_contents);
														/* $(".address_form").submit(); */
														$(".order_form")
															.submit();
														
													} else {
														alert("결제 실패");
													}

												})


									} else {
										console.log(rsp);
									}
								});
					}
					
					function cartVaild(){
						if($.trim($("#bucket tbody").html())==''){
							alert("상품 추가페이지로 돌아갑니다.");
							location.href="productForOrder.do";
						}
					}
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