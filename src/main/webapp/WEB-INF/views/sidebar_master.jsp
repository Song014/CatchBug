<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

  <!-- 관리자 -->
  
<!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

<!-- ======= Sidebar Nav======= -->
    <ul class="sidebar-nav" id="sidebar-nav">

<!-- ======= Home ======= -->
      <li class="nav-item">
        <a class="nav-link " href="index.html">
          <i class="bi bi-grid"></i>
          <span>HOME</span>
        </a>
      </li>
<!-- ======= Home END======= -->

<!-- ======= 회사소개 ======= -->
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-menu-button-wide"></i><span>회사소개</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="components-alerts.html">
              <i class="bi bi-circle"></i><span>CATCBUG</span>
            </a>
          </li>
          <li>
            <a href="components-accordion.html">
              <i class="bi bi-circle"></i><span>찾아오시는 길</span>
            </a>
          </li>
        </ul>
      </li>
<!-- ======= 회사소개 끝 ======= -->

<!-- ======= 가맹점 관리 ======= -->
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-journal-text"></i><span>가맹점 관리</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="forms-elements.html">
              <i class="bi bi-circle"></i><span>전체 가맹점 리스트</span>
            </a>
          </li>
          <li>
            <a href="forms-layouts.html">
              <i class="bi bi-circle"></i><span>가맹점 주문내역</span>
            </a>
          </li>
          <li>
            <a href="franc_WaitList.do">
              <i class="bi bi-circle"></i><span>가입승인 대기 목록</span>
            </a>
          </li>
          <li>
            <a href="forms-layouts.html">
              <i class="bi bi-circle"></i><span>미출고 주문 현황</span>
            </a>
          </li>
        </ul>
      </li>
<!-- ======= 가맹점 관리 끝 ======= -->


<!-- ======= 재고 관리 ======= -->
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-layout-text-window-reverse"></i><span>재고 관리</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="tables-general.html">
              <i class="bi bi-circle"></i><span>상품 리스트</span>
            </a>
          </li>
          <li>
            <a href="tables-general.html">
              <i class="bi bi-circle"></i><span>본사 재고현황</span>
            </a>
          </li>
          <li>
            <a href="tables-general.html">
              <i class="bi bi-circle"></i><span>본사 발주서 작성</span>
            </a>
          </li>
          <li>
            <a href="tables-general.html">
              <i class="bi bi-circle"></i><span>본사 발주 내역</span>
            </a>
          </li>
          <li>
            <a href="tables-general.html">
              <i class="bi bi-circle"></i><span>상품 등록</span>
            </a>
          </li>
        </ul>
      </li>
<!-- ======= 재고 관리 끝 ======= -->


<!-- ======= 게시판 ======= -->
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-bar-chart"></i><span>게시판</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="charts-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="charts-chartjs.html">
              <i class="bi bi-circle"></i><span>공지사항</span>
            </a>
          </li>
          <li>
            <a href="charts-apexcharts.html">
              <i class="bi bi-circle"></i><span>자유 게시판</span>
            </a>
          </li>
          <li>
            <a href="charts-echarts.html">
              <i class="bi bi-circle"></i><span>QnA게시판</span>
            </a>
          </li>
          <li>
            <a href="charts-echarts.html">
              <i class="bi bi-circle"></i><span>자주 묻는 질문</span>
            </a>
          </li>
        </ul>
      </li>
<!-- ======= 게시판 끝 ======= -->
	
<!-- ======= 로그아웃 ======= -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-login.html">
          <i class="bi bi-box-arrow-in-right"></i>
          <span>로그아웃</span>
        </a>
      </li>
<!-- ======= 로그아웃 ======= -->
    </ul>
<!-- ======= Sidebar Nav======= -->
  </aside>
<!-- ======= Sidebar End======= -->

</body>
</html>