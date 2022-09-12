<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.catchbug.biz.vo.OrderVO"%>
<%@page import="java.util.List"%>

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
<!-- Jquery 선언 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
   integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
   crossorigin="anonymous"></script>

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: NiceAdmin - v2.3.1
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
<style>
</style>
</head>

<body>

	<!-- ======= Header ======= -->

	<jsp:include page="../mainInclude/header.jsp"></jsp:include>

	<!-- End Header -->




	<!-- ======= Sidebar ======= -->

	<jsp:include page="../mainInclude/sidebar.jsp"></jsp:include>

	<!-- End Sidebar -->

	<main id="main" class="main">
	<div class="pagetitle">
		<h1>가맹점 발주 내역</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/">Home</a></li>
				<li class="breadcrumb-item active">가맹점 발주 내역</li>
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
							<form>
								<select name="searchOption">
									<option value="order_no" selected="selected">주문서 번호</option>
									<option value="product_name">상품명</option>
								</select> <input type="text" name="input" placeholder="검색하세요">
								<button>검색</button>
							</form>
						</div>
					</div>

					<div class="dataTable-container">
						<form>
							<table class="table datatable dataTable-table">
								<tr>
									<th scope="col" data-sortable=""><a href="#"
										class="dataTable-sorter">#</a></th>
									<th scope="col" data-sortable=""><a href="#"
										class="dataTable-sorter">주문서 번호</a></th>
									<th scope="col" data-sortable=""><a href="#"
										class="dataTable-sorter">ID</a></th>
									<th scope="col" data-sortable=""><a href="#"
										class="dataTable-sorter">총 가격</a></th>
									<th scope="col" data-sortable=""><a href="#"
										class="dataTable-sorter">처리상태</a></th>
									<th scope="col" data-sortable=""><a href="#"
										class="dataTable-sorter">배송지</a></th>
									<th scope="col" data-sortable=""><a href="#"
										class="dataTable-sorter">메모</a></th>

								</tr>
								<c:forEach items="${olist}" var="olist">
									<tr>
										<td>#</td>
										<td><a class="primary order_detail_modal2"
											data-bs="${olist.order_no}" data-bs-toggle="modal"
											data-bs-target="#modal-biz2"> ${olist.order_no}</a></td>

										<td><a class="primary order_id_modal2"
											data-bs="${olist.id}" data-bs-toggle="modal"
											data-bs-target="#modalDialogScrollable2"> ${olist.id}님</a></td>
										<td>${olist.total_price}원</td>
										<td>${olist.order_status}번</td>
										<td>${olist.shipping_address}</td>
										<td>${olist.note}</td>
									</tr>
								</c:forEach>
							</table>
						</form>
					</div>
				</div>
			</div>
			

		</div>
	</section>

	</main>
	<!-- 모달1 -->
	<div class="modal fade" id="modal-biz2" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">
						주문서 번호 : <span id="orderModal41"> <!--주문자 id 들어가는곳-->
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
											<th scope="col" style="width: 20%;">주문서 상세</th>
											<th scope="col" style="width: 30%;">주문번호</th>
											<th scope="col" style="width: 20%;">상품 번호</th>
											<th scope="col" style="width: 20%;">상품명</th>
											<th scope="col" style="width: 15%;">구입수량</th>
										</tr>
									</thead>
									<tbody id="orderModal1">


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

	<!-- 모달2 주문내용 전체품목-->
	<div class="modal fade" id="modalDialogScrollable2" tabindex="-1">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">ceo 상세보기</h5>
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
						<table class="table" tex>
							<thead>
								<tr>
									<th scope="col" style="width: 20%;">ID</th>
									<th scope="col" style="width: 30%;">사업자 등록번호</th>
									<th scope="col" style="width: 30%;">법인명</th>
									<th scope="col" style="width: 20%;">ceo</th>
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
	</div>
	<!-- 모달 끝-->
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
                     $("#orderModal1").empty();
                     $("#orderModal41").empty();
                       
                       console.log(orderno)
                       for(var j=0;j<result.length;j++){
                        stx += ` 
                           <tr>
                              <td>`+result[j].detail_no+`</td>
                              <td>`+result[j].order_no+`</td>
                              <td>`+result[j].product_no+`</td>
                              <td>`+result[j].product_name+`</td>
                              <td>`+result[j].purchase_amount+`</td>
                           </tr>

                              `;
                       }
                  stb= orderno;
                           $("orderModal1").html(stx);
                           $("#orderModal41").html(stb);
                           
                     console.log("ajax 성공");
                       
                  }, 
                  error : function(a, b, c) {
                     //통신 실패시 발생하는 함수(콜백)
                     console.log("실패" + a, b, c);
                  }
         })
         }); 
   /* order_detail 모달창 끝 */
   
    /* order_id 모달창 끝 */ 
    
     $(document).on("click", ".order_id_modal2", function (e) {
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
                              <td>`+orderId.business_no+`</td>
                              <td>`+orderId.business_name+`</td>
                              <td>`+orderId.ceo+`</td>
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
         
</script>


</body>

</html>