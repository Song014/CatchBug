<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Dashboard - NiceAdmin Bootstrap Template</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
<script   src="https://code.jquery.com/jquery-3.6.0.min.js"   integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="   crossorigin="anonymous"></script>

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
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

              <div class="d-flex justify-content-center py-4">
                <a href="index.html" class="logo d-flex align-items-center w-auto">
                  <img src="assets/img/logo.png" alt="">
                  <span class="d-none d-lg-block">Catch Bug</span>
                </a>
              </div><!-- End Logo -->
                  <div class="card mb-3">

                <div class="card-body">

                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center">| 캐치버그 물류센터 회원가입 페이지</h5>
                    <p class="text-center small" style="color: red;">* 항목은 필수로 작성해야 합니다.</p>
                  </div>

						<!-- 회원가입 폼 시작 -->
                  <form class="row g-3 needs-validation" action="sign_up.do" method="post" >
                  
                  	<div class="col-12">
                      <label for="yourName" class="form-label">* 아이디</label>
                      <input type="text" name="id" class="form-control" id="yourId" placeholder="catchbug쨩" autofocus>
                      <div class="invalid-feedback">Please, enter your Id!</div>
                    </div>
                    
                    <div class="col-12">
                    
                    
                      <label for="yourName" class="form-label">* 비밀번호</label>
                      <input type="password" name="pass" class="form-control" id="yourPassword"  required>
                      <div class="invalid-feedback">Please, enter your Password!</div>
                    </div>
                    
                    <!-- <div class="col-12">
                      <label for="yourName" class="form-label">* Your Password Check</label>
                      <input type="password" name="passchk" class="form-control" id="yourPasswordchk" required>
                      <div class="invalid-feedback">Please, Do your Password Check!</div>
                    </div> -->
                  
                  <div class="col-12">
                      <label for="yourName" class="form-label">* 사업자 등록번호</label>
                      <input type="text" name="business_no" class="form-control" id="yourBusinessno" placeholder="123-45-00000"  required>
                      <div class="invalid-feedback">Please, enter your Business Number!</div>
                    </div>
                    
                    <div class="col-12">
                      <label for="yourName" class="form-label">* 사업자명</label>
                      <input type="text" name="business_name" class="form-control" id="yourBusinessname" placeholder="123-45-00000"  required>
                      <div class="invalid-feedback">Please, enter your Business Number!</div>
                    </div>
                  
                    <div class="col-12">
                      <label for="yourName" class="form-label">* 대표자</label>
                      <input type="text" name="ceo" class="form-control" id="yourCeo" placeholder="대표자명"  required>
                      <div class="invalid-feedback">Please, enter your name!</div>
                    </div>
                    
                    <div class="col-12">
                      <label for="yourName" class="form-label">* 연락처</label>
                      <input type="text" name="contact" class="form-control" id="yourContact" placeholder="010-0000-0000" required>
                      <div class="invalid-feedback">Please, enter your name!</div>
                    </div>
                    
                    <div class="col-12">
                      <label for="yourName" class="form-label">* email</label>
                      <input type="text" name="email" class="form-control" id="yourEmail" placeholder="peace@naver.com" required>
                      <div class="invalid-feedback">Please, enter your name!</div>
                    </div>
                    
                  
                    
                    

                    <!-- <div class="col-12">
                      <label for="yourEmail" class="form-label">* 이메일</label>
                      <div class="input-group has-validation">
                        <input type="text" name="emailid" class="form-control" id="yourUsername" placeholder="email"required>
                        <span class="input-group-text" id="inputGroupPrepend">@</span>
                        <input type="text" name="emaildomain" class="form-control" id="yourUsername" required>
                        <select	class="select" title="이메일 도메인 주소 선택"	onclick="setEmailDomain(this.value);return false;">
								<option value="">-선택-</option>
								<option value="naver.com">naver.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="hotmail.com">hotmail.com</option>
								<option value="korea.com">korea.com</option>
								<option value="nate.com">nate.com</option>
								<option value="yahoo.com">yahoo.com</option>
							</select>
                        <div class="invalid-feedback">Please enter a valid Email address!</div>
                      </div>
                    </div> -->
                    
                      <div class="col-12">
                      <label for="yourName" class="form-label">* 사업장 주소지</label>
                      <input type="text" name="business_address" class="form-control" id="yourbusiness_address" placeholder="도로명 + 상세주소" required>
                      <div class="invalid-feedback">Please, enter your Business Address!</div>
                    </div>
                    
                    <!-- <div class="col-12">
                      <label for="yourName" class="form-label"></label>
                      <input type="hidden" name="regdate" class="form-control" id="yourregdate" required>
                    </div>
                    
                     <div class="col-12">
                      <label for="yourName" class="form-label"></label>
                      <input type="hidden" name="level1" class="form-control" id="yourlevel" required>
                    </div>  -->

                    <div class="col-12">
                      <div class="form-check">
                        <input class="form-check-input" name="terms" type="checkbox" value="" id="acceptTerms" required>
                        <label class="form-check-label" for="acceptTerms">I agree and accept the <a href="#">terms and conditions</a></label>
                        <div class="invalid-feedback">You must agree before submitting.</div>
                      </div>
                    </div>
                    <div class="col-12">
                      <button class="btn btn-primary w-100" type="submit">Create Account</button>
                    </div>
                    <div class="col-12">
                      <p class="small mb-0">Already have an account? <a href="login_page.do">Log in</a></p>
                    </div>
                  </form>

                </div>
              </div>
                
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
		
	<!-- Daum Address API -->
<!-- 	<script>
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	        }
	    }).open();
	</script> -->


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