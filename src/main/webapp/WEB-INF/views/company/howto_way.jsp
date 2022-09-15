<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>오시는 길</title>
<meta content="" name="description">
<meta content="" name="keywords">

<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=5fyyk0fdfy&submodules=geocoder"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

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

	<div class="container">

		<div class="container">
			<div class="row justify-content-center">
				<div
					class="col-12 d-flex flex-column align-items-center justify-content-center">

					<div class="d-flex justify-content-center py-4">
						<a href="index.html" class="logo d-flex align-items-center w-auto">
							<img src="assets/img/logo.png" alt=""> <span
							class="d-none d-lg-block">Catch Bug</span>
						</a>
					</div>
					<!-- End Logo -->


					<div class="card col-12">

						<div class="card-body">

							<div class="pt-4 pb-2">
								<h3 class="card-title text-center">| 고객 여러분의 성원에 보답하는
									물류기업으로 성장하겠습니다.</h3>
							</div>

							<div id="map" style="width: 100%; height: 600px;"></div>

							<br />
							<table style="width: 100%">
								<tbody>
									<tr>
										<th scope="row">주소</th>
										<td>서울시 영등포구 당산로 41길 11 SK V1 센터 W동 323호</td>
									</tr>
								
									<tr>
										<th scope="row">자동차</th>
										<td>내비게이션 '당산 SK V1센터' 검색</td>


									</tr>
									<tr>
										<th scope="row">대중교통</th>
										<td>지하철 - 2호선 당산역 11번 출구에서 도보 5분</td>

									</tr>
									<tr>
										<th scope="row"></th>
										<td>버스 - 000 승강장에서 도보 10분</td>
									</tr>
								</tbody>
							</table>
						</div>
						<br />
						<p style="text-align: center;">
							※ 주차 공간이 협소합니다. 가능한 한 대중교통을 이용해 주세요. ※<br />주차가 꼭 필요하신 분은 하루 전에
							연락해 주시기 바랍니다. <br /> (문의: 02-0000-0000)
						</p>
						<br />
					</div>
				</div>

			</div>

		</div>
		<div style="text-align: center;">
			<div class="col-12">
				<p class="small mb-0">
					아직 회원이 아니신가요?<a href="sign_up.do"> 회원가입 하기</a>
				</p>
			</div>
		</div>
	</div>
	</div>
	</main>


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

	<!-- 네이버 API 스크립트 -->
	<script type="text/javascript">
		// 서울 시청 위/경도 좌표 객체
		var CatchBugLoc = new naver.maps.LatLng(37.530842, 126.898282);

		// Map 초기화
		var map = new naver.maps.Map('map', {
			center : CatchBugLoc, // X, Y 값 설정
			scaleControl : false, // 우측 하단 scale 표시
			mapDataControl : false, // 좌측 하단 @ NAVER Corp 표시
			zoom : 18
		// 지도 줌 레벨
		});

		// 서울 시청 마커 설정
		var marker = new naver.maps.Marker({
			position : CatchBugLoc,
			map : map,
			icon : {
				url : "/common/img/marker-target.png"
			}
		});

		// 마커 클릭 이벤트 핸들러 함수
		var makerClickHandler = function() {
			return function(e) {
				alert("Marker of CatchBug Logistics Center");
			}
		}

		// 마커 클릭 이벤트 리스너 추가
		naver.maps.Event.addListener(marker, 'click', makerClickHandler());

		// Geolocation HTML5 API를 통해 얻은 현재 위치 좌표로 지도를 이동합니다.
		if (navigator.geolocation) {
			/**
			 * navigator.geolocation 은 Chrome 50 버젼 이후로 HTTP 환경에서 사용이 Deprecate 되어 HTTPS 환경에서만 사용 가능 합니다.
			 * http://localhost 에서는 사용이 가능하며, 테스트 목적으로, Chrome 의 바로가기를 만들어서 아래와 같이 설정하면 접속은 가능합니다.
			 * chrome.exe --unsafely-treat-insecure-origin-as-secure="http://example.com"
			 */
			navigator.geolocation.getCurrentPosition(onSuccessGeolocation,
					onErrorGeolocation);
		} else {
			console.log("Geolocation Not supported Required");
		}
	</script>


</body>

</html>