<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

	<main id="main" class="main">
	<div class="pagetitle">
		<h1>본사 재고 현황</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="index.html">Home</a></li>
				<li class="breadcrumb-item">재고관리</li>
				<li class="breadcrumb-item active">상품 등록</li>
			</ol>
		</nav>
	</div>
	<div class="tab-pane fade profile-edit pt-3 active show"
		id="profile-edit" role="tabpanel">
		<form>
			<div class="row mb-3">
				<label for="profileImage" class="col-md-4 col-lg-3 col-form-label">상품
					Image</label>
				<div class="col-md-8 col-lg-9">
					<img src="resources/img/profile-img.jpg" alt="Profile">
					<div class="pt-2">
						<a href="#" class="btn btn-primary btn-sm"
							title="Upload new profile image"><i class="bi bi-upload"></i></a>
						<a href="#" class="btn btn-danger btn-sm"
							title="Remove my profile image"><i class="bi bi-trash"></i></a>
					</div>
				</div>
			</div>

			<div class="row mb-3">
				<label class="col-md-4 col-lg-3 col-form-label">카테고리</label>
				<div class="col-md-8 col-lg-9">
					<select class="form-select" aria-label="Default select example">
						<option selected="">카테고리</option>
						<option value="1">cpu</option>
						<option value="2">그래픽 카드</option>
						<option value="3">RAM</option>
						<option value="4">파워</option>
						<option value="5">메인보드</option>
					</select>
				</div>
			</div>

			<div class="row mb-3">
				<label for="Number" class="col-md-4 col-lg-3 col-form-label">상품
					번호</label>
				<div class="col-md-8 col-lg-9">
					<input name="Number" type="text" class="form-control" id="number"
						value="" placeholder="상품번호">
				</div>
			</div>

			<div class="row mb-3">
				<label for="brand" class="col-md-4 col-lg-3 col-form-label">브랜드
					/ 제조사</label>
				<div class="col-md-8 col-lg-9">
					<input name="brand" type="text" class="form-control" id="brand"
						value="" placeholder="브랜드 / 제조사">
				</div>
			</div>

			<div class="row mb-3">
				<label for="production" class="col-md-4 col-lg-3 col-form-label">상품명</label>
				<div class="col-md-8 col-lg-9">
					<input name="production" type="text" class="form-control"
						id="production" value="" placeholder="상품명">
				</div>
			</div>


			<div class="row mb-3">
				<label for="production" class="col-md-4 col-lg-3 col-form-label">수량</label>
				<div class="col-md-8 col-lg-9">
					<input name="production" type="text" class="form-control"
						id="production" value="" placeholder="수량 (갯수)">
				</div>
			</div>

			<div class="row mb-3">
				<label for="production" class="col-md-4 col-lg-3 col-form-label">개당
					가격</label>
				<div class="col-md-8 col-lg-9">
					<input name="production" type="text" class="form-control"
						id="production" value="" placeholder="개당 가격 (원)">
				</div>
			</div>

			<div class="col-sm-10">
				<button type="submit" class="btn btn-primary">상품 등록</button>
			</div>


		</form>
	</div>
	<!-- <div class="card-body">
        <h5 class="card-title">상품 등록</h5>
        <form>
         <div class="col-md-4 col-lg-3"> <img src="resources/img/profile-img.jpg" alt="Profile">
                <div class="pt-2"> <a href="#" class="btn btn-primary btn-sm" title="Upload new profile image"><i
                            class="bi bi-upload"></i></a> <a href="#" class="btn btn-danger btn-sm"
                        title="Remove my profile image"><i class="bi bi-trash"></i></a></div>
            </div>
            <div class="row mb-3"> <label for="inputNumber" class="col-sm-2 col-form-label">이미지 등록</label>
                <div class="col-sm-10"> <input class="form-control" type="file" id="formFile"></div>
            </div>
                <div class="row mb-3"> <label class="col-sm-2 col-form-label">Select</label>
                    <div class="col-sm-10"> <select class="form-select" aria-label="Default select example">
                            <option selected="">카테고리</option>
                            <option value="1">cpu</option>
                            <option value="2">그래픽 카드</option>
                            <option value="3">RAM</option>
                            <option value="4">파워</option>
                            <option value="5">메인보드</option>
                        </select></div>
                </div>

            <div class="row mb-3"> <label for="inputText" class="col-sm-2 col-form-label">상품 번호</label>
                <div class="col-sm-10"> <input type="text" class="form-control"></div>
            </div>
            
            <div class="row mb-3"> <label for="inputText" class="col-sm-2 col-form-label">브랜드 / 제조사</label>
                <div class="col-sm-10"> <input type="text" class="form-control"></div>
            </div>
            
            <div class="row mb-3"> <label for="inputText" class="col-sm-2 col-form-label">상품명</label>
                <div class="col-sm-10"> <input type="text" class="form-control"></div>
            </div>
            
            <div class="row mb-3"> <label for="inputText" class="col-sm-2 col-form-label">수량</label>
                <div class="col-sm-10"> <input type="number" class="form-control"></div>
            </div>
            
             <div class="row mb-3"> <label for="inputNumber" class="col-sm-2 col-form-label">개당 가격</label>
                <div class="col-sm-10"> <input type="number" class="form-control"></div>
            
            <div class="row mb-3"> <label class="col-sm-2 col-form-label"></label>
            </div>
            
             <div class="col-sm-10"> <button type="submit" class="btn btn-primary">상품 등록</button></div>


            
            
        </form>
    </div> --> </main>

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