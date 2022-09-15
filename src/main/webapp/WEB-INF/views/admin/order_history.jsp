<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@page import="com.catchbug.biz.vo.OrderVO"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>${member.business_name } 발주 내역</title>
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
a {
	text-align: center;
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


	<!-- ======= Main ======= -->
	<!-- main start -->
	<main id="main" class="main">
	<div class="pagetitle">
		<h1>가맹점 발주 내역</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/">Home</a></li>
				<li class="breadcrumb-item active">전체 가맹점 발주 내역</li>
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
							<form action="orderHistory.do">
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
						<form>
							<table class="table datatable dataTable-table"
								style="text-align: center;">
								<tr>
									<th scope="col" data-sortable=""><a href="#"
										class="dataTable-sorter">No</a></th>
									<th scope="col" data-sortable=""><a href="#"
										class="dataTable-sorter">장바구니 번호</a></th>
									<th scope="col" data-sortable=""><a href="#"
										class="dataTable-sorter">법인명</a></th>
									<th scope="col" data-sortable=""><a href="#"
										class="dataTable-sorter">ID</a></th>
									<th scope="col" data-sortable=""><a href="#"
										class="dataTable-sorter">장바구니 총 가격</a></th>
									<th scope="col" data-sortable=""><a href="#"
										class="dataTable-sorter">배송지</a></th>
									<th scope="col" data-sortable=""><a href="#"
										class="dataTable-sorter">상태</a></th>

								</tr>
								<c:forEach items="${olist}" var="olist" varStatus="status">
									<tr>
										<td>${status.count}</td>
										
										<td><a class="primary order_detail_modal"
											data-bs="${olist.id}" data-bs-toggle="modal"
											data-bs-target="#modal-biz"> ${olist.order_no}</a></td>
											
										<td>${olist.ceo}</td>
										
										<td><a class="primary order_id_modal"
											data-bs="${olist.id}" data-bs-toggle="modal"
											data-bs-target="#modalDialogScrollable"> ${olist.id}</a></td>
											
										<td><fmt:formatNumber value="${olist.total_price}"
												groupingUsed="true" />원</td>
										<td>${olist.shipping_address}</td>
										<td><c:if test="${olist.order_status eq 0}">
                                                본사 결제건
                                            </c:if> <c:if
												test="${olist.order_status eq 1}">
                                                관리자 승인전
                                            </c:if> <c:if
												test="${olist.order_status eq 2}">
                                                가맹점 결제 완료(관리자 승인)
                                            </c:if> <c:if
												test="${olist.order_status eq 3}">
                                                가맹점 결제 취소
                                            </c:if></td>
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
	<!-- End #main -->

	<!-- 모달 -->
	<!-- 모달1 -->
	<div class="modal fade" id="modal-biz" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">
						주문자 아이디 : <span id="orderModal4">
							<!--주문자 id 들어가는곳-->
						</span>
					</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="card">
						<div class="card-body">
							<div class="card-title">
								<div style="text-align: right;" id="orderModal3">
									<!-- 가격 들어갈 곳 -->
								</div>
							</div>
							<form>
								<table class="table">
									<thead>
										<tr style="text-align: center">
											<th scope="col" style="width: 10%;">No</th>
											<th scope="col" style="width: 15%;">상품번호</th>
											<th scope="col" style="width: 50%;">상품 이름</th>
											<th scope="col" style="width: 15%;">구입수량</th>
											<th scope="col" style="width: 10%;">가격</th>
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
	<div class="modal fade" id="modalDialogScrollable" tabindex="-1">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">ceo 상세보기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="card">
						<table class="table" tex>
							<thead>
								<tr>
									<th scope="col" style="width: 20%;">ID</th>
									<th scope="col" style="width: 30%;">사업자 등록번호</th>
									<th scope="col" style="width: 30%;">법인명</th>
									<th scope="col" style="width: 20%;">ceo</th>
								</tr>
							</thead>
							<tbody id="orderModal6">


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
    $(document).on("click", ".order_detail_modal", function (e) {
        var orderId = $(this).data("bs");
        e.preventDefault();
        let str = "";
        $.ajax({
            type   : "GET", //요청 메소드 방식
            url    : "orderDetailid.do?id=" + orderId,
            success: function (result) {
                $("#orderModal1").empty();
                $("#orderModal3").empty();
                $("#orderModal4").empty();

                let tprice = 0;
                for (var j = 0; j < result.length; j++) {
                    tprice += result[j].total_price;
                    const price = (result[j].price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
                    str += `
                           <tr style="text-align: center">
                              <td>` + (j+1) + `</td>
                              <td>` + result[j].product_no + `</td>
                              <td>` + result[j].product_name + `</td>
                              <td>` + result[j].purchase_amount + `</td>
                              <td id=orderModal2>` + price + `</td>
                           </tr>

                              `;
                }

                sta = tprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
                stb = orderId;
                $("#orderModal1").html(str);
                $("#orderModal3").html("<h3> 총 가격 : <i class = 'bx bx-won'>" + sta + "</i></h3>");
                $("#orderModal4").html(stb);

                console.log("ajax 성공");
            },
            error  : function (a, b, c) {
                //통신 실패시 발생하는 함수(콜백)
                console.log("실패" + a, b, c);
            }
        })
    });
    /* order_detail 모달창 끝 */

    /* order_id 모달창 끝 */

    $(document).on("click", ".order_id_modal", function (e) {
        e.preventDefault();
        var orderId = $(this).data("bs");
        console.log("모달 비동기처리 작동  : " + orderId);
        $.ajax({
            type   : "GET", //요청 메소드 방식
            url    : "orderId.do?id=" + orderId,
            success: function (orderId) {
                $("#orderModal6").empty();
                console.log(orderId);

                sti = `
                           <tr>
                              <td>` + orderId.id + `</td>
                              <td>` + orderId.business_no + `</td>
                              <td>` + orderId.business_name + `</td>
                              <td>` + orderId.ceo + `</td>
                           </tr>
                              `;
                $("#orderModal6").html(sti);
                console.log("ajax 성공");
            },
            error  : function (a, b, c) {
                //통신 실패시 발생하는 함수(콜백)
                console.log("실패" + a, b, c);
            }
        })
    });

</script>


</body>

</html>