<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>자유게시판 상세보기</title>
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

<!-- Jquery 선언 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

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



	<main id="main" class="main">

	<div class="card">
		<div class="card-body">
			<div class="pagetitle">
				<br>
				<h1>자유게시판</h1>
				<nav>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.html">게시판</a></li>
						<li class="breadcrumb-item">자유게시판</li>
						<li class="breadcrumb-item active">상세보기</li>
					</ol>
				</nav>
			</div>
			<div class="card">
				<div class="card-header" style="text-align: center;">
					<h1>${board.title }</h1>
				</div>
				<div class="card-body">
					<div>${board.content }</div>
					<br>
					<hr>
					<div class="card">
						<div class="card-body">
							<div class="row">
								<c:forEach items="${reply}" var="reply">
									<div class="col-lg-1 col-md-2 label ">${ reply.ceo}</div>
									<div class="col-lg-9 col-md-7">${reply.reply_text}</div>
									<div class="col-lg-2 col-md-3" style="text-align: right;">
										<fmt:formatDate value="${reply.reply_day }"
											pattern="yyyy-MM-dd" />
										<input type="text" hidden="hidden" value="${reply.board_no }" />
										<input type="text" hidden="hidden" value="${reply.id }" />
										<button type="button" class="btn btn-sm btn-danger"
											value="${reply.reply_no }" name="change">수정</button>
										<button type="button" class="btn btn-sm btn-danger"
											value="${reply.reply_no }" name="delete">삭제</button>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<hr>
					<div class="card">
						<div class="card-body">
							<form action="writeFreeBoardReply.do?board_no=${board.board_no}"
								method="post">
								<label for="reply_text" style="background-color: lightGray;"><strong>${member.ceo }</strong></label>
								<input class="dataTable-input" placeholder="댓글내용을 입력해 주세요."
									style="width: 90%" type="text" name="reply_text"> <input
									type="text" hidden="hidden" value="${board.board_no }"
									name="board_no" /> <input type="text" hidden="hidden"
									value="${member.id }" name="id" /> <input type="text"
									hidden="hidden" value="${member.ceo }" name="ceo" />
								<button class="btn btn-primary" type="submit">글쓰기</button>
							</form>
						</div>
					</div>
				</div>
				<div class="card-footer">
					<div class="mb-3 text-center">
						<input type="hidden" value="${board.id }" id="id" /> <input
							type="hidden" value="${board.board_no }" id="board_no" />
						<button type="button" class="btn btn-primary" onclick="change();">수정하기</button>
						<button type="button" class="btn btn-secondary"
							onclick="location.href='freeBoard.do?page=1'">뒤로가기</button>
						<button type="button" class="btn btn-sm btn-danger"
							onclick="deleted();">삭제</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	</main>


	<script type="text/javascript">
		$(document).ready(function () {
		  $(document).on("click", "button[name='delete']", function () {
		    var reply_no = $(this).val();
		    var id = $(this).prev().prev().val();
		    var board_no = $(this).prev().prev().prev().val();
		    if(id == "${member.id}"){
		    	if(confirm("정말 삭제하시겠습니까?")){
					location.href="/deleteBoardReply.do?reply_no=" + reply_no + "&board_no="+ board_no;
		    	}
		    }else{
	    		alert("본인만 삭제할 수 있습니다.");
	    	}
		  });
		  
		  //댓글 수정 버튼클릭시 작동되는 메소드
		  $(document).on("click", "button[name='change']", function () {
			  var id = $(this).prev().val();
			  if(id == "${member.id}"){
				  var reply_text = $(this).parent().prev();
				  var text = reply_text.text();
				  var reply_no = $(this).val();
				  const str = `
				  	<input type="text" value="`+text+`" style="width:70%"/>
				  	<button type="button" class="btn btn-primary" name="updateReply" value="`+reply_no+`">작성</button>
				  `
				  reply_text.html(str);
			  }else{
				  alert("본인만 수정할 수 있습니다.");
			  }
			 
			  
		  });
		  
		  $(document).on("click","button[name='updateReply']",function(){
			  var reply_no = $(this).val();
			  var reply_text = $(this).prev().val();
			  var board_no = $(this).parent().next().children(":first").val();
			  if(confirm("댓글을 수정하시겠습니까?")){
				  location.href="/updateBoardReply.do?reply_no=" + reply_no + "&reply_text=" + reply_text + "&board_no=" + board_no;
			  }
			  
		  })
		});
		
		
		var id = $("#id").val();
		var board_no = $("#board_no").val()
		
		function deleted(e) {
			if (id == "${member.id}") {
				if(confirm("정말 삭제하시겠습니까?")){
					location.href="/deleteFreeBoard.do?board_no=" + board_no;	
				}
			}else if('${member.level1}' == '1'){
				if(confirm("관리자 권한으로 삭제하시겠습니까?")){
					location.href="/deleteFreeBoard.do?board_no=" + board_no;
				}
			} else {
				alert("본인만 삭제할 수 있습니다.");
			}
		}

		function change(e) {
			if (id == "${member.id}") {
				if(confirm("정말 수정하시겠습니까?")){
					location.href="/updateFreeBoard.do?board_no=" + board_no;	
				}
			} else {
				alert("본인만 수정할 수 있습니다.");
			}
		}
	</script>



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

</body>

</html>