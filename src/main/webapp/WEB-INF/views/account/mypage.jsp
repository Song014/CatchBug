<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.catchbug.biz.vo.MemberVO"%>
<%@page import="java.util.List"%>

<%--  <% 
 
 List<MemberVO> member = (List)session.getAttribute("member");
 List<MemberVO> member1 = (List)session.getAttribute("memberLevel1");
 %> --%>
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
	<div class="pagetitle">
		<h1>MyPage</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="index.html">Home</a></li>

				<li class="breadcrumb-item active">MyPage</li>
			</ol>
		</nav>
	</div>
	<section class="section profile">
		<div class="row">
			<div class="col-xl-4">
				<div class="card">
					<div
						class="card-body profile-card pt-4 d-flex flex-column align-items-center">
						<img src="assets/img/mapleStory.jpg" alt="Profile"
							class="rounded-circle">
						<h2>메이플스토리</h2>
						<h3>10년째 메인모델</h3>
						<div class="social-links mt-2">
							<a href="#" class="twitter"><i class="bi bi-twitter"></i></a> <a
								href="#" class="facebook"><i class="bi bi-facebook"></i></a> <a
								href="#" class="instagram"><i class="bi bi-instagram"></i></a> <a
								href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-8">
				<div class="card">
					<div class="card-body pt-3">
						<ul class="nav nav-tabs nav-tabs-bordered" role="tablist">
							<li class="nav-item" role="presentation">
								<button class="nav-link active" data-bs-toggle="tab"
									data-bs-target="#profile-overview" aria-selected="true"
									role="tab">자기소개</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link" data-bs-toggle="tab"
									data-bs-target="#profile-edit" aria-selected="false"
									tabindex="-1" role="tab">MyPage 수정</button>
							</li>
							<!-- <li class="nav-item" role="presentation">
								<button class="nav-link" data-bs-toggle="tab"
									data-bs-target="#profile-settings" aria-selected="false"
									tabindex="-1" role="tab">Settings</button>
							</li> -->
							<li class="nav-item" role="presentation">
								<button class="nav-link" data-bs-toggle="tab"
									data-bs-target="#profile-change-password" aria-selected="false"
									tabindex="-1" role="tab">비밀번호 변경</button>
							</li>
						</ul>
						<div class="tab-content pt-2">
							<div class="tab-pane fade show active profile-overview"
								id="profile-overview" role="tabpanel">
								<!-- 자기소개 이미지 파일 변경 -->
								<form action="mypage.do/1" method="post"
									enctype="multipart/form-data">
									<div class="row mb-3">
										<label for="profileImage"
											class="col-md-4 col-lg-3 col-form-label">Profile
											Image</label>


										<div class="col-md-8 col-lg-9">
											<img id="profileImg" src="assets/img/mapleStory.jpg"
												alt="Profile"> <input type="file" name="uploadImgFile"
												accept=".jpg" />
											<div class="pt-2">

												<button type="reset" class="btn btn-danger btn-sm"
													title="Remove my profile image">
													<i class="bi bi-trash"></i>
												</button>
												<button type="submit" class="btn btn-primary">저장</button>
											</div>

											<!-- <button type="submit" class="class="btn btn-primary btn-sm"" title="Upload new profile image" <i	class="bi bi-upload"></i>></button>
													 -->
											<div id="div-preview"></div>
										</div>
									</div>
								</form>
								<!-- 자기소개 이미지 파일 변경 끝-->
								<h5 class="card-title">Profile Details</h5>
								<div class="row">
									<div class="col-lg-3 col-md-4 label ">아이디</div>

									<div class="col-lg-9 col-md-8">${member.id}</div>
								</div>
								<div class="row">
									<div class="col-lg-3 col-md-4 label">사업자 등록번호</div>
									<div class="col-lg-9 col-md-8">${member.business_no}</div>
								</div>
								<div class="row">
									<div class="col-lg-3 col-md-4 label">법인명</div>
									<div class="col-lg-9 col-md-8">${member.business_name}</div>
								</div>
								<div class="row">
									<div class="col-lg-3 col-md-4 label">대표자</div>
									<div class="col-lg-9 col-md-8">${member.ceo}</div>
								</div>
								<div class="row">
									<div class="col-lg-3 col-md-4 label">연락처</div>
									<div class="col-lg-9 col-md-8">${member.contact}</div>
								</div>
								<div class="row">
									<div class="col-lg-3 col-md-4 label">Email</div>
									<div class="col-lg-9 col-md-8">${member.email}</div>
								</div>
								<div class="row">
									<div class="col-lg-3 col-md-4 label">사업장 주소지</div>
									<div class="col-lg-9 col-md-8">${member.business_address}</div>
								</div>
							</div>


							<div class="tab-pane fade profile-edit pt-3" id="profile-edit"
								role="tabpanel">
								<!-- 마이페이지 자기소개 변경 폼 시작 -->

								<form action="mypage.do/2" method="post">
									<!-- <div class="row mb-3">
										<label for="profileImage"
											class="col-md-4 col-lg-3 col-form-label">Profile
											Image</label>
										<div class="col-md-8 col-lg-9">
											<img src="assets/img/mapleStory.jpg" alt="Profile">
											<div class="pt-2">
												<a href="#" class="btn btn-primary btn-sm"
													title="Upload new profile image"><i
													class="bi bi-upload"></i></a> <a href="#"
													class="btn btn-danger btn-sm"
													title="Remove my profile image"><i class="bi bi-trash"></i></a>
											</div>
										</div>
									</div> -->

									<div class="row mb-3">
										<div class="col-md-8 col-lg-9">
											<input name="id" type="hidden" class="form-control" id="id"
												value="${member.id}">
										</div>
									</div>
									<div class="row mb-3">
										<div class="col-md-8 col-lg-9">
											<input name="pass" type="hidden" class="form-control"
												id="pass" value="${member.pass}">
										</div>
									</div>



									<div class="row mb-3">
										<label for="about" class="col-md-4 col-lg-3 col-form-label">사업자
											등록번호</label>
										<div class="col-md-8 col-lg-9">
											<input name="business_no" type="text" class="form-control"
												id="business_no" value="${member.business_no}">
										</div>
									</div>
									<div class="row mb-3">
										<label for="company" class="col-md-4 col-lg-3 col-form-label">법인명</label>
										<div class="col-md-8 col-lg-9">
											<input name="business_name" type="text" class="form-control"
												id="business_name" value="${member.business_name}">
										</div>
									</div>
									<div class="row mb-3">
										<label for="Job" class="col-md-4 col-lg-3 col-form-label">대표자</label>
										<div class="col-md-8 col-lg-9">
											<input name="ceo" type="text" class="form-control" id="Job"
												value="${member.ceo}">
										</div>
									</div>
									<div class="row mb-3">
										<label for="Country" class="col-md-4 col-lg-3 col-form-label">연락처</label>
										<div class="col-md-8 col-lg-9">
											<input name="contact" type="text" class="form-control"
												id="Country" value="${member.contact}">
										</div>
									</div>
									<div class="row mb-3">
										<label for="Address" class="col-md-4 col-lg-3 col-form-label">Email</label>
										<div class="col-md-8 col-lg-9">
											<input name="email" type="text" class="form-control"
												id="Address" value="${member.email}">
										</div>
									</div>
									<div class="row mb-3">
										<label for="Phone" class="col-md-4 col-lg-3 col-form-label">사업장
											주소지</label>
										<div class="col-md-8 col-lg-9">
											<input name="business_address" type="text"
												class="form-control" id="Phone"
												value="${member.business_address}">
										</div>
									</div>

									<div class="text-center">
										<button type="submit" class="btn btn-primary">Save
											Changes</button>
									</div>
								</form>
							</div>
							<!-- 마이페이지 자기소개 변경 폼 끝 -->

							<!-- <div class="row mb-3">
										<label for="Email" class="col-md-4 col-lg-3 col-form-label">Email</label>
										<div class="col-md-8 col-lg-9">
											<input name="email" type="email" class="form-control"
												id="Email" value="k.anderson@example.com">
										</div>
									</div>
									<div class="row mb-3">
										<label for="Twitter" class="col-md-4 col-lg-3 col-form-label">Twitter
											Profile</label>
										<div class="col-md-8 col-lg-9">
											<input name="twitter" type="text" class="form-control"
												id="Twitter" value="https://twitter.com/#">
										</div>
									</div>
									<div class="row mb-3">
										<label for="Facebook" class="col-md-4 col-lg-3 col-form-label">Facebook
											Profile</label>
										<div class="col-md-8 col-lg-9">
											<input name="facebook" type="text" class="form-control"
												id="Facebook" value="https://facebook.com/#">
										</div>
									</div>
									<div class="row mb-3">
										<label for="Instagram"
											class="col-md-4 col-lg-3 col-form-label">Instagram
											Profile</label>
										<div class="col-md-8 col-lg-9">
											<input name="instagram" type="text" class="form-control"
												id="Instagram" value="https://instagram.com/#">
										</div>
									</div>
									<div class="row mb-3">
										<label for="Linkedin" class="col-md-4 col-lg-3 col-form-label">Linkedin
											Profile</label>
										<div class="col-md-8 col-lg-9">
											<input name="linkedin" type="text" class="form-control"
												id="Linkedin" value="https://linkedin.com/#">
										</div>
									</div>
									-->



							<!-- <div class="tab-pane fade pt-3" id="profile-settings"
								role="tabpanel">
								마이페이지 셋팅 폼 시작
								<form>
									<div class="row mb-3">
										<label for="fullName" class="col-md-4 col-lg-3 col-form-label">Email
											Notifications</label>
										<div class="col-md-8 col-lg-9">
											<div class="form-check">
												<input class="form-check-input" type="checkbox"
													id="changesMade" checked=""> <label
													class="form-check-label" for="changesMade"> Changes
													made to your account </label>
											</div>
											<div class="form-check">
												<input class="form-check-input" type="checkbox"
													id="newProducts" checked=""> <label
													class="form-check-label" for="newProducts">
													Information on new products and services </label>
											</div>
											<div class="form-check">
												<input class="form-check-input" type="checkbox"
													id="proOffers"> <label class="form-check-label"
													for="proOffers"> Marketing and promo offers </label>
											</div>
											<div class="form-check">
												<input class="form-check-input" type="checkbox"
													id="securityNotify" checked="" disabled=""> <label
													class="form-check-label" for="securityNotify">
													Security alerts </label>
											</div>
										</div>
									</div>
									<div class="text-center">
										<button type="submit" class="btn btn-primary">Save
											Changes</button>
									</div>
								</form>
								마이페이지 셋팅 폼 끝
								
							</div> -->
							<div class="tab-pane fade pt-3" id="profile-change-password"
								role="tabpanel">
								<!-- 비밀번호 변경 폼 시작 -->
								<form action="mypage.do/3" method="post">
									<div class="row mb-3">
										<label for="currentPassword"
											class="col-md-4 col-lg-3 col-form-label">현재 비밀번호 </label>
										<div class="col-md-8 col-lg-9">
											<input name="pass" type="password" class="form-control"
												id="currentPassword">
										</div>
									</div>
									<div class="row mb-3">
										<label for="newPassword"
											class="col-md-4 col-lg-3 col-form-label">새 비밀번호</label>
										<div class="col-md-8 col-lg-9">
											<input name="newpassword" type="password"
												class="form-control" id="newPassword">
										</div>
									</div>
									<div class="row mb-3">
										<label for="renewPassword"
											class="col-md-4 col-lg-3 col-form-label">새 비밀번호 확인</label>
										<div class="col-md-8 col-lg-9">
											<input name="renewpassword" type="password"
												class="form-control" id="renewPassword">
										</div>
									</div>
									<div class="text-center">
										<button type="submit" class="btn btn-primary">Change
											Password</button>
									</div>
								</form>
								<!-- 비밀번호 변경 폼 끝 -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
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

	<!-- 이미지 미리보기 기능 -->
	<script type="text/javascript">
		let fileTag = document.querySelector("input[name=uploadImgFile]");
		let divPreview = document.querySelector("#div-preview");
		fileTag.onchange = function() {

			//파일 올렸을 때 : fileTag.files.length > 0
			if (fileTag.files.length > 0) {
				//이미지 src에 들어갈 데이터 구하기
				for (let i = 0; i < fileTag.files.length; i++) {
					let reader = new FileReader();
					reader.onload = function(data) {
						let src = data.target.result;
						//이미지 태그를 만들어서 넣어줄거임
						//1. 이미지 태그 만들기
						let imgTag = document.createElement('img');

						//2. 이미지 태그 속성들 세팅하기
						imgTag.setAttribute('src', src);
						imgTag.setAttribute('width', '100');
						imgTag.setAttribute('height', '100');

						//3. 이미지 태그 div안에 넣기
						divPreview.appendChild(imgTag);
					}
					reader.readAsDataURL(fileTag.files[i]);

				}//for end

			} else {
				//취소 버튼을 눌렀을 때
				//div 안에 싹 다 비우기
				divPreview.innerHTML = "";
			}
		}
	</script>
</body>


</html>