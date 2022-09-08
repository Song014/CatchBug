<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>발주서 작성</title>
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
		<h1>발주서 작성</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/">Home</a></li>
				<li class="breadcrumb-item active">발주서 작성</li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->

	<section class="section dashboard ">


		<div class="card">
			<div class="card-body">
				<div class="row">
					<!-- 카테고리  -->
					<div class="col-lg-2" style="padding-top: 46px">
						<div class="accordion" id="accordionExample">
							<c:forEach var="m" items="${mainCategory }" varStatus="status">
								<!-- ToDo 대분류 1,2,3, 일때 해당하는 카테고리 이름 -->

								<div class="accordion-item">
									<h2 class="accordion-header" id="heading${status.count }">
										<button class="accordion-button collapsed" type="button"
											data-bs-toggle="collapse"
											data-bs-target="#collapse${status.count }"
											aria-expanded="false"
											aria-controls="collapse${status.count }">
											${m.main_name}</button>
									</h2>
									<div id="collapse${status.count }"
										class="accordion-collapse collapse"
										aria-labelledby="heading${status.count }"
										data-bs-parent="#accordionExample">
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
							</c:forEach>
						</div>
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
							<div style="border: 1px solid #dee2e6;">
								<table class="table top-selling " style="margin: 0px;">
									<thead>
										<tr>
											<th scope="col" style="width: 5%;">번호</th>
											<th scope="col" style="width: 5%;">이미지</th>
											<th scope="col" style="width: 7%;">상품 번호</th>
											<th scope="col" style="width: 35%; text-align: center;">상품
												명</th>
											<th scope="col" style="width: 10%;">등록 일자</th>
											<th scope="col" style="width: 5%;">전체 수량</th>
											<th scope="col" style="width: 5%;">개당 가격</th>
											<th scope="col" style="width: 7%;"></th>
										</tr>
									</thead>
								</table>
								<div
									style="height: 230px; overflow: scroll; overflow-x: hidden;">
									<table class="table  top-selling " id="category">
										<tbody>
											<c:forEach var="list" items="${product }" varStatus="status">
												<tr>
													<td style="width: 5%;">${status.count }</td>
													<th scope="row" style="width: 5%;"><a href="#"><img
															src="/resources/productImg/<fmt:formatDate value="${list.add_day }"
													pattern="yyyy-MM-dd" />/${list.uuid}"
															alt=""></a></th>
													<td style="width: 7%;">${list.product_no }</td>
													<td style="width: 40%; text-align: center;"><a
														class="primary product_modal" data-bs-toggle="modal"
														data-bs-target="#modalProduct" id=${list.product_no }>${list.product_name
														}
													</a></td>
													<td style="width: 10%;"><fmt:formatDate
															value="${list.add_day }" pattern="yyyy-MM-dd" /></td>
													<td style="width: 5%;">${list.product_quantily }</td>
													<td style="width: 5%;"><input type="hidden"
														class="hidden_price" value=${list.price }>
														<fmt:formatNumber value="${list.price }" groupingUsed="true"/></td>
													<td style="width: 5%;">
														<button type="button"
															class="btn btn-primary btn-sm addBucket">추가</button>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<!-- 상품 리스트 -->
						</div>
						<!-- 장바구니 -->
						<hr>
						<div style="border: 1px solid #dee2e6;">
							<table class="table" style="margin: 0px;">
								<thead>
									<tr style="text-align: center;">
										<th style="width: 8%;">상품 번호</th>
										<th style="width: 40%;">상품 명</th>
										<th style="width: 10%;">구매 수량</th>
										<th style="width: 10%;">총 가격</th>
										<th style="width: 5%;">버튼</th>
									</tr>
								</thead>
							</table>
							<div style="height: 230px; overflow: scroll; overflow-x: hidden;">
								<table class="table" id="bucket">
									<tbody>
										<c:forEach var="list" items="${cartList }">
											<tr style="text-align: center;">
												<td style="width: 9%;">${list.product_no }</td>
												<td style="width: 41%;"><a
													class="primary product_modal" data-bs-toggle="modal"
													data-bs-target="#modalProduct" id=${list.product_no }>${list.product_name
														}</a></td>
												<td style="width: 11.7%;"><input type="number"
													name="purchase_amount" value=${list.purchase_amount }
													min="1" style="width: 50px;">
													<button type="button" class="updateBtn"
														value="${list.total }">변경</button></td>
												<td style="width: 10%;"><input type="hidden"
													class="hidden_price" value=${list.price }><fmt:formatNumber value="${list.total }" groupingUsed="true"/></td>
												<td style="width: 5%;"><button type="button"
														class="btn btn-primary btn-sm delBucket">삭제</button></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>


						<div class="d-grid gap-2 mt-3">
							<input class="btn btn-primary" id="orderBtn" type="button"
								onclick="location.href='orderPage.do'" value="주문 확인"></input>
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
					<button type="button" class="btn btn-danger"  id="addCart">상품담기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 해당상품 모달 끝 -->

	<script type="text/javascript">
		// 장바구니 검증 비어있는지
		cartVaild();
	
		// 검색버튼을 클릭시 테이블 비동기처리
		$("#searchButton").on("click",function(e){
			e.preventDefault();
			const searchWord = $("#searchWord").val();
	
			$.ajax({
				type: "GET",
				url: "searchAjax.do?product_name=" + searchWord, //검색값을 담아서 컨트롤러로 전달
				dataType : "json",
				success : function(result){
					let str="";
					result.forEach(function(result, index){
						console.log(result)
						const price = (result.price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
						
						str +=`
							<tr style="text-align:center;">
							<td style="width: 5%;">`+(index+1)+`</td>
							<th scope="row" style="width: 5%;" ><a href="#"><img src="/resources/productImg/`+result.add_day+`/`+result.uuid+`"
							alt=""></a></th>
							<td style="width: 7%;">`+ result.product_no + `</td>
							<td style="width: 40%;"><a class="primary product_modal" data-bs-toggle="modal"
								data-bs-target="#modalProduct" id="`+result.product_no+`">`+ result.product_name + `</a></td>
							<td style="width: 10%;">`+ result.add_day + `</td>
							<td style="width: 5%;">10</td>
							<td style="width: 5%;"><input type="hidden" class="hidden_price" value=`+ result.price + `>`+ price + `</td>
							<td style="width: 5%;"><button type="button"
									class="btn btn-primary btn-sm addBucket">추가</button></td>
						</tr>
							`;
					})
					$("#category tbody").html(str);
				}
			})
		});
	// 모달창 비동기처리
		$(document).on("click",".product_modal",function(e){
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
		})
	
		// 하위 카테고리 클릭시 해당하는 품목 비동기 처리
		$(".getCategory").on("click", function (e) {
			e.preventDefault();
			const no = $(this).parent().find(".subCategoryNo").val();
			$.ajax({
				type: "GET",
				url: "getProductAjax.do?sub_category=" + no,
				dataType: "json",
				success: function (result) {
					// 기존 존재하는 테이블 삭제
					let str = "";
					// 서브카테고리에 해당하는 상품 목록 get
					console.log(result)
					result.forEach(function (result, index) {
						const price = (result.price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
						str += ` 
							<tr style="text-align:center;">
							<td style="width: 5%;">`+(index+1)+`</td>
							<th scope="row" style="width: 5%;" ><a href="#"><img src="/resources/productImg/`+result.add_day+`/`+result.uuid+`"
							alt=""></a></th>
							<td style="width: 7%;">`+ result.product_no + `</td>
							<td style="width: 40%;"><a class="primary product_modal" data-bs-toggle="modal"
								data-bs-target="#modalProduct" id="`+result.product_no+`">`+ result.product_name + `</a></td>
							<td style="width: 10%;">`+ result.add_day + `</td>
							<td style="width: 5%;">`+result.product_quantily+`</td>
							<td style="width: 5%;"><input type="hidden" class="hidden_price" value=`+ result.price + `>`+ price + `</td>
							<td style="width: 5%;"><button type="button"
									class="btn btn-primary btn-sm addBucket">추가</button></td>
						</tr>
						`;
					});
					$("#category tbody").html(str);
					console.log("ajax 성공");
				},
				error: function (a, b, c) {
					console.log("실패" + a, b, c);
				}
			});
		})

		// 상품 목록 테이블의 추가 버튼 클릭시 이벤트
		$("#category").on("click", ".addBucket", function () {
			const $tr = $(this).parent().parent();
			const $td = $tr.children();
			console.log("클릭한 Row의 모든 데이터 : " + $tr.text());

			const no = $td.eq(2).text();
			const name = $td.eq(3).text();
			const quantity = $td.eq(5).text();
			const price = $tr.find(".hidden_price").val();
			const priceStr = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','); 
			/* const total = price * Number(quantity); */

			const str = `
			<tr style="text-align:center;">
				<td style="width: 9%;"><input type="hidden" name="product_no" value=`+ no + ` >` + no + `</td>
				<td style="width: 41%;"><input type="hidden" value=`+ name + `><a class="primary product_modal" data-bs-toggle="modal" data-bs-target="#modalProduct" id="`+no+`">` + name + `</a></td>
				<td style="width: 11.7%;"><input type="number" name="purchase_amount" value="1" min="1"  style="width:50px;"><button type="button" class="updateBtn">변경</button></td>
				<td style="width: 10%;"><input type="hidden" class="hidden_price" value=`+ price + `>`+priceStr+`</td>
				<td style="width: 5%;"><button type="button" class="btn btn-primary btn-sm delBucket">삭제</button></td>
			</tr>
			`;
			// DB 요청 - 삽입 성공시 장바구니 테이블에 추가 실패시 경고창 
			$.ajax({
				type: "POST",
				url: "insertCartAjax.do",
				data: { "product_no": no },
				dataType: "text",
				success: function (result) {
					if (result == "ok") {
						console.log(result);
						$("#bucket tbody").append(str);
						cartVaild();
					} else if (result == "false") {
						// db에 
						alert("이미 추가된 상품입니다.")
					}
				},
				error: function (a, b, c) {
					console.log("실패" + a, b, c);
				}
			});
		})

		// 상품 수량 변경 이벤트
		$("#bucket").on("click", ".updateBtn", function (e) {
			
			const $tr = $(this).parent().parent();
			const price = $tr.find(".hidden_price").val();
			const no = $tr.children().eq(0).text();
			const amount = $(this).parent().find('input[type=number]').val();
			const total = price*amount;
			/* const JSONObject = `{ "purchase_amount": amount, "product_no": no }`; */
			console.log(total+"버튼밸류");
			console.log(amount, no);
			$.ajax({
				type: "PUT",
				url: "updateCartAjax.do?purchase_amount="+amount+"&product_no="+no,
				dataType: "text",
				success: function (result) {
					// 업데이트 버튼 클릭시 해당상품 가격 수정
					
					$tr.children().eq(3).html(`<input type="hidden" class="hidden_price" value=`+ price + `>`+total);

				},
				error: function (a, b, c) {
					console.log("실패" + a, b, c);
				}
			});
		})

		//  상품 삭제 이벤트
		$("#bucket").on("click", ".delBucket", function () {
			const $tr = $(this).parent().parent();
			const $td = $tr.children();
			const no = $td.eq(0).text();
			const member_id = '${member.id }';
			console.log(typeof(member_id)+member_id+no)
			// db 하나 삭제
			$.ajax({
				type: "DELETE",
				url: "deleteCartAjax.do?product_no="+no+"&id="+member_id,
				dataType: "text",
				success: function (result) {
					console.log("delete"+result)
					if (result == "true") {
						$tr.remove();
						cartVaild();
					} else {
						alert("다시시도해주세요");
					}
				},
				error: function (e) {
					console.log("실패" + e);
				}
			});
			console.log(typeof(member_id)+member_id)

		});
		
		
		/* 검증코드 */
		function cartVaild(){
			if($.trim($("#bucket tbody").html())==''){
				$("#orderBtn").attr("disabled","disabled");
			} else{
				$("#orderBtn").removeAttr("disabled");
			}
		}
		
	</script>
	<!-- 		<script>
	$(document).ready(function(){

        const username = '${member.ceo}';
        const level = '${member.level1}';
        if(username == ""){
        	alert("로그인한 유저만 이용가능합니다.");
        	location.href="login_page.do";
        }else{
        	if(level != 1){
        		alert("승인된 유저만 이용가능합니다.");
            	location.href="company_intro.do";
        	}
        }
	});
	</script> -->

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
	<script>document.getElementById('inputSearchDate').valueAsDate = new Date();</script>


</body>

</html>