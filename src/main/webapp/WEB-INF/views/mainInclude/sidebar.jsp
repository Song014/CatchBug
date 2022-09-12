
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:choose>
	<c:when test="${member.level1 eq 1 }">
		<!-- 관리자 -->
		<!-- ======= Sidebar ======= -->
		<aside id="sidebar" class="sidebar">

			<!-- ======= Sidebar Nav======= -->
			<ul class="sidebar-nav" id="sidebar-nav">


				<!-- ======= Home ======= -->
				<li class="nav-item"><a class="nav-link collapsed" href="/">
						<i class="bi bi-grid"></i> <span>HOME</span>
				</a></li>
				<!-- ======= Home END======= -->


				<!-- ======= 회사소개 ======= -->
				<li class="nav-item"><a class="nav-link collapsed"
					data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
						<i class="bi bi-menu-button-wide"></i><span>회사소개</span><i
						class="bi bi-chevron-down ms-auto"></i>
				</a>
					<ul id="components-nav" class="nav-content collapse "
						data-bs-parent="#sidebar-nav">
						<li><a href="company_intro.do"> <i class="bi bi-circle"></i><span>CATCBUG</span>
						</a></li>
						<li><a href="howto_way.do"> <i class="bi bi-circle"></i><span>찾아오시는
									길</span>
						</a></li>
					</ul></li>
				<!-- ======= 회사소개 끝 ======= -->

				<!-- ======= 가맹점 관리 ======= -->
				<li class="nav-item"><a class="nav-link collapsed"
					data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
						<i class="bi bi-journal-text"></i><span>가맹점 관리</span><i
						class="bi bi-chevron-down ms-auto"></i>
				</a>
					<ul id="forms-nav" class="nav-content collapse "
						data-bs-parent="#sidebar-nav">
						<li><a href="member_List.do"> <i class="bi bi-circle"></i><span>전체
									가맹점 리스트</span>
						</a></li>
						<li><a href="orderHistory.do"> <i class="bi bi-circle"></i><span>가맹점
									주문내역</span>
						</a></li>
						<li><a href="factory_franc_wait_list.do"> <i
								class="bi bi-circle"></i><span>가입승인 대기 목록</span>
						</a></li>
						<li><a href="unOrderHistory.do"> <i class="bi bi-circle"></i><span>미출고
									주문 현황</span>
						</a></li>
					</ul></li>
				<!-- ======= 가맹점 관리 끝 ======= -->

				<!-- ======= 재고 관리 ======= -->
				<li class="nav-item"><a class="nav-link collapsed"
					data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
						<i class="bi bi-layout-text-window-reverse"></i><span>재고 관리</span><i
						class="bi bi-chevron-down ms-auto"></i>
				</a>
					<ul id="tables-nav" class="nav-content collapse "
						data-bs-parent="#sidebar-nav">
						<li><a href="stockList.do"> <i class="bi bi-circle"></i><span>상품
									리스트</span>
						</a></li>
						<li><a href="productForOrder.do"> <i class="bi bi-circle"></i><span>본사
									발주서 작성</span>
						</a></li>
						<li><a href="factory_Order_History.do"> <i
								class="bi bi-circle"></i><span>본사 발주 내역</span>
						</a></li>
						<li><a href="productRegister.do"> <i class="bi bi-circle"></i><span>상품
									등록</span>
						</a></li>
					</ul></li>
				<!-- ======= 재고 관리 끝 ======= -->



				<!-- ======= 게시판 ======= -->
				<li class="nav-item"><a class="nav-link collapsed"
					data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#">
						<i class="bi bi-bar-chart"></i><span>게시판</span><i
						class="bi bi-chevron-down ms-auto"></i>
				</a>
					<ul id="charts-nav" class="nav-content collapse "
						data-bs-parent="#sidebar-nav">
						<li><a href="notice_Board.do"> <i class="bi bi-circle"></i><span>공지사항</span>
						</a></li>
						<li><a href="freeBoard.do?page=1"> <i class="bi bi-circle"></i><span>자유
									게시판</span>
						</a></li>
						<li><a href="QnABoard.do?page=1"> <i class="bi bi-circle"></i><span>QnA게시판</span>
						</a></li>
						<li><a href="FAQBoard.do"> <i class="bi bi-circle"></i><span>자주
									묻는 질문</span>
						</a></li>
						<li><a href="chatRoom.do"> <i class="bi bi-circle"></i><span>채팅
									상담문의</span>
						</a></li>
					</ul></li>
				<!-- ======= 게시판 끝 ======= -->
				<!-- ====== 채팅방 구현 ====== -->

			</ul>
			<!-- ======= Sidebar Nav======= -->
		</aside>
		<!-- ======= Sidebar End======= -->
	</c:when>
	<c:otherwise>
		<!-- ======= Sidebar ======= -->
		<aside id="sidebar" class="sidebar">

			<!-- ======= Sidebar Nav======= -->
			<ul class="sidebar-nav" id="sidebar-nav">


				<!-- ======= Home ======= -->
				<li class="nav-item"><a class="nav-link " href="/"> <i
						class="bi bi-grid"></i> <span>HOME</span>
				</a></li>
				<!-- ======= Home END======= -->

				<!-- ======= 회사소개 ======= -->
				<li class="nav-item"><a class="nav-link collapsed"
					data-bs-target="#components-nav" data-bs-toggle="collapse"
					href="#회사소개"> <i class="bi bi-menu-button-wide"></i><span>회사소개</span><i
						class="bi bi-chevron-down ms-auto"></i>
				</a>
					<ul id="components-nav" class="nav-content collapse "
						data-bs-parent="#sidebar-nav">
						<li><a href="company_intro.do"> <i class="bi bi-circle"></i><span>CATCBUG</span>
						</a></li>
						<li><a href="howto_way.do"> <i class="bi bi-circle"></i><span>찾아오시는
									길</span>
						</a></li>
					</ul></li>
				<!-- ======= 회사소개 끝 ======= -->


				<!-- ======= 가맹점 관리 ======= -->
				<li class="nav-item"><a class="nav-link collapsed"
					data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
						<i class="bi bi-journal-text"></i><span>가맹점 관리</span><i
						class="bi bi-chevron-down ms-auto"></i>
				</a>
					<ul id="forms-nav" class="nav-content collapse "
						data-bs-parent="#sidebar-nav">
						<li><a href="francStockList.do"> <i class="bi bi-circle"></i><span>상품
									리스트</span>
						</a></li>
						<li><a href="productForOrder.do"> <i class="bi bi-circle"></i>
								<span>발주서 작성</span>
						</a></li>
						<li><a href="francOrderHistory.do"> <i
								class="bi bi-circle"></i><span>발주 내역</span>
						</a></li>
					</ul></li>
				<!-- ======= 가맹점 관리 끝 ======= -->



				<!-- ======= 게시판 ======= -->
				<li class="nav-item"><a class="nav-link collapsed"
					data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#">
						<i class="bi bi-bar-chart"></i><span>게시판</span><i
						class="bi bi-chevron-down ms-auto"></i>
				</a>
					<ul id="charts-nav" class="nav-content collapse "
						data-bs-parent="#sidebar-nav">
						<li><a href="notice_Board.do"> <i class="bi bi-circle"></i><span>공지사항</span>
						</a></li>
						<li><a href="freeBoard.do?page=1"> <i class="bi bi-circle"></i><span>자유
									게시판</span>
						</a></li>
						<li><a href="QnABoard.do?page=1"> <i class="bi bi-circle"></i><span>QnA게시판</span>
						</a></li>
						<li><a href="FAQBoard.do"> <i class="bi bi-circle"></i><span>자주
									묻는 질문</span>
						</a></li>
						<li><a href="chatRoom.do"> <i class="bi bi-circle"></i><span>자유
									채팅</span>
						</a></li>
					</ul></li>
				<!-- ======= 게시판 끝 ======= -->

			</ul>
			<!-- ======= Sidebar Nav======= -->
		</aside>
		<!-- ======= Sidebar End======= -->

	</c:otherwise>
</c:choose>