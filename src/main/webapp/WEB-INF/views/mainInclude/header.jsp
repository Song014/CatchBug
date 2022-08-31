
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- ======= Header ======= -->

<!-- Logo -->

<header id="header" class="header fixed-top d-flex align-items-center">

	<div class="d-flex align-items-center justify-content-between">
		<a href="/" class="logo d-flex align-items-center">
			<div class="icon" style="width: 50px;">
				<i class="bi bi-bug" style="zoom: 2.0;"> </i>
			</div> <span class="d-none d-lg-block">CATCHBUG</span>
		</a> <i class="bi bi-list toggle-sidebar-btn"></i>
	</div>

	<!-- End Logo -->



	<!-- messages -->

	<nav class="header-nav ms-auto">
		<ul class="d-flex align-items-center">
			<li class="nav-item dropdown"></li>

			<!-- End Messages Dropdown Items -->
			<!-- End Messages Nav -->

			<!-- login info -->


			<li class="nav-item dropdown pe-3"><a
				class="nav-link nav-profile d-flex align-items-center pe-0" href="#"
				data-bs-toggle="dropdown" aria-expanded="false"> <img
					src="assets/img/profile-img.jpg" alt="Profile"
					class="rounded-circle"> <c:choose>
						<c:when test="${member.level1 eq 1 }">
							<span class="d-none d-md-block dropdown-toggle ps-2">${member.business_name }관리자님
								안녕하세요</span>
						</c:when>
						<c:when test="${member.level1 eq 2 }">
							<span class="d-none d-md-block dropdown-toggle ps-2">${member.business_name }가맹점님
								안녕하세요</span>
						</c:when>
						<c:otherwise>
							<span class="d-none d-md-block dropdown-toggle ps-2">로그인이
								필요합니다</span>
						</c:otherwise>
					</c:choose>
			</a> <!-- End Profile Iamge Icon --> <!-- info drop down -->


				<ul
					class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile"
					style="">
					<li class="dropdown-header"><c:choose>
							<c:when test="${member.level1 eq 1 }">
								<h6>${member.business_name }님</h6></li>
					<li>
						<hr class="dropdown-divider">
					</li>

					<li><a class="dropdown-item d-flex align-items-center"
						href="users-profile.html"> <i class="bi bi-person"></i> <span>내
								정보</span>
					</a></li>
					<li>
						<hr class="dropdown-divider">
					</li>

					<li><a class="dropdown-item d-flex align-items-center"
						href="logout.do"> <i class="bi bi-box-arrow-right"></i> <span>로그아웃</span>
					</a></li>
					</c:when>
					<c:when test="${member.level1 eq 2 }">
						<h6>${member.business_name }가맹점</h6></li>
			<li>
				<hr class="dropdown-divider">
			</li>

			<li><a class="dropdown-item d-flex align-items-center"
				href="users-profile.html"> <i class="bi bi-person"></i> <span>내
						정보</span>
			</a></li>
			<li>
				<hr class="dropdown-divider">
			</li>

			<li><a class="dropdown-item d-flex align-items-center"
				href="logout.do"> <i class="bi bi-box-arrow-right"></i> <span>로그아웃</span>
			</a></li>
			</c:when>
			<c:otherwise>
				<h6>로그인이 필요합니다.</h6>
				</li>
				<li>
					<hr class="dropdown-divider">
				</li>

				<li><a class="dropdown-item d-flex align-items-center"
					href="login_page.do"> <i class="bi bi-person"></i> <span>로그인</span>
				</a></li>
				<li>
					<hr class="dropdown-divider">
				</li>
				<li><a class="dropdown-item d-flex align-items-center"
					href="sign_up.do"> <i class="bi bi-person"></i> <span>회원가입</span>
				</a></li>
			</c:otherwise>
			</c:choose>



		</ul>
		</li>

		</ul>


	</nav>
	<!-- info drop down end -->


</header>