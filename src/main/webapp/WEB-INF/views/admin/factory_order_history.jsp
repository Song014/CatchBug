<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>본사 발주 내역</title>
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
		<h1>본사 발주 내역</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/">재고 관리</a></li>
				<li class="breadcrumb-item active">본사 발주 내역</li>
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
							<form action="factoryOrderHistory.do">
								<select name="searchTap">
									<option value="1" selected="selected">장바구니번호</option>
									<option value="2">id</option>
								</select> <input class="dataTable-input" type="text" name="searchWord"
									placeholder="검색어를 입력해 주세요.">
								<button class="btn btn-primary" type="submit">검색</button>
							</form>
						</div>
					</div>


					<div class="dataTable-container">
						<table class="table datatable dataTable-table">
							<tr>
								<th scope="col" data-sortable=""><a href="#"
									class="dataTable-sorter">#</a></th>
								<th scope="col" data-sortable=""><a href="#"
									class="dataTable-sorter">주문서 번호</a></th>
								<th scope="col" data-sortable=""><a href="#"
									class="dataTable-sorter">주문자</a></th>
								<th scope="col" data-sortable=""><a href="#"
									class="dataTable-sorter">주문금액</a></th>
								<th scope="col" data-sortable=""><a href="#"
									class="dataTable-sorter">주문일자</a></th>
								<th scope="col" data-sortable=""><a href="#"
									class="dataTable-sorter">배송지</a></th>
								<th scope="col" data-sortable=""><a href="#"
									class="dataTable-sorter">처리 상태</a></th>
								<th scope="col" data-sortable=""><a href="#"
									class="dataTable-sorter">비고</a></th>

							</tr>
							<c:forEach var="orderList" items="${list}" varStatus="status">
								<tr>
									<th scope="row">${status.count}</th>



									<td><a class="primary order_detail_modal2"
										data-bs="${orderList.order_no}" data-bs-toggle="modal"
										data-bs-target="#modal-biz2"> ${orderList.order_no}</a></td>

									<td><a class="primary order_id_modal"
										data-bs="${orderList.id}" data-bs-toggle="modal"
										data-bs-target="#modalIdDetail"> ${orderList.id}님</a></td>

									<td>${orderList.total_price}원</td>
									<td><fmt:formatDate value="${orderList.processing_day}"
											pattern="yyyy-MM-dd" timeZone="Asia/Seoul" /></td>
									<td>${orderList.shipping_address}</td>
									<td>${orderList.order_status}</td>
									<td>${orderList.note}</td>

								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>

	</main>
	<!-- End #main -->
	<!-- 모달1 -->
	<div class="modal fade" id="modal-biz2" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">
						주문서 번호 : <span id="orderModal42"> <!--주문자 id 들어가는곳-->
						</span>
					</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="card">
						<div class="card-body">
							<form>
								<table class="table">
									<thead>
										<tr>
											<th scope="col">주문서 상세</th>
											<th scope="col">주문번호</th>
											<th scope="col">상품 번호</th>
											<th scope="col">상품명</th>
											<th scope="col">구입수량</th>
										</tr>
									</thead>
									<tbody id="orderModal11">


									</tbody>

								</table>
							</form>
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

	<!-- 모달1 끝-->

	<!-- 모달2-->
	<div class="modal fade" id="modalIdDetail" tabindex="-1">
		<div class="modal-dialog modal-md modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">주문자 상세보기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="card">
						<!-- <div class="card-body">
                     <div class="card-title">
                        <h5 style="text-align: right;">총 주문금액</h5>
                        <div style="text-align: right;">
                           <i class="bx bx-won">가격 적어주세요</i>
                        </div>
                     </div> -->
						<table class="table">
							<thead>
								<tr>
									<th scope="col">ID</th>
									<th scope="col">대표자</th>
									<th scope="col">법인명</th>
									<th scope="col">사업자 등록 번호</th>
								</tr>
							</thead>
							<tbody id="orderModal62">
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

	<!-- 모달 끝-->
	<!-- End Main -->




	<!-- ======= Footer ======= -->

	<jsp:include page="../mainInclude/footer.jsp"></jsp:include>

	<!-- End Footer -->

	<script type="text/javascript">
		$.ajax({
			type : "get", //요청 메소드 방식
			url : "/payments/status/all",
			headers : {
				"Content-Type" : "application/json"
			},
			success : function(result) {
				console.log(result)

			},
			error : function(e) {
				//통신 실패시 발생하는 함수(콜백)
				console.log("실패" + e);
			}
		});
	</script>

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

	<script>
	   /* order_detail 모달창 */
	   $(document).on("click",".order_detail_modal2", function (e) {
	         var orderno =$(this).data("bs");
	         console.log("모달 비동기처리 작동  : "+orderno);
	         e.preventDefault();
	         let stx ="";
	         $.ajax({
	                  type : "GET", //요청 메소드 방식
	                  url : "orderFDetail.do?order_no=" + orderno,
	                  success : function(result) {
	                     $("#orderModal11").empty();
	                     $("#orderModal42").empty();

	                       for(var b=0;b<result.length;b++){
	                        stx += `
	                           <tr>
	                              <td>`+result[b].detail_no+`</td>
	                              <td>`+result[b].order_no+`</td>
	                              <td>`+result[b].product_no+`</td>
	                              <td>`+result[b].product_name+`</td>
	                              <td>`+result[b].purchase_amount+`</td>
	                           </tr>
	                              `;
	                       }
	                       console.log(stx)
	                   
	                  			 stb= orderno; 
	                           $("#orderModal11").html(stx);
	                           $("#orderModal42").html(stb); 
	                           
	                     console.log("ajax 성공");
	                       
	                  }, 
	                  error : function(a, b, c) {
	                     //통신 실패시 발생하는 함수(콜백)
	                     console.log("실패" + a, b, c);
	                  }
	         })
	         }); 
	   /* order_detail 모달창 끝 */
   
   /* order_id 모달창 시작 */ 
    
     $(document).on("click", ".order_id_modal", function (e) {
         e.preventDefault();
       var orderId =$(this).data("bs");
         console.log("모달 비동기처리 작동  : "+orderId);
         $.ajax({
                  type : "GET", //요청 메소드 방식
                  url : "orderfId.do?id=" + orderId,
                  success : function(orderId) {
                     $("#orderModal62").empty();
                       console.log(orderId);
                        stz = `
                           <tr>
                              <td>`+orderId.id+`</td>
                              <td>`+orderId.ceo+`</td>
                              <td>`+orderId.business_name+`</td>
                              <td>`+orderId.business_no+`</td>
                           </tr>
                              `;
                              
                     console.log("ajax 성공");
                           $("#orderModal62").html(stz);
                  }, 
                  error : function(a, b, c) {
                     //통신 실패시 발생하는 함수(콜백)
                     console.log("실패" + a, b, c);
                  }
         }) 
     });
   
     /* order_id 모달창 끝 */ 
         
</script>

</body>

</html>
