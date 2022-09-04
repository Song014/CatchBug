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

	<jsp:include page="../mainInclude/sidebar.jsp"></jsp:include>

	<!-- End Sidebar -->
	<!-- End Header -->

	<!-- ======= Sidebar ======= -->

	<jsp:include page="../mainInclude/sidebar.jsp"></jsp:include>

	<!-- End Sidebar -->

	<main id="main" class="main">
	<div class="pagetitle">
		<h1>Frequently Asked Questions</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="index.html">게시판</a></li>
				<li class="breadcrumb-item active">자주 묻는 질문</li>
			</ol>
		</nav>
	</div>
	<section class="section faq">
		<div class="row">
			<div class="col-lg-6">
				<div class="card basic">
					<div class="card-body">
						<h5 class="card-title">기본적인 질문 모음</h5>
						<div>
							<h6>1. + 1은 귀요미</h6>
							<p>여기에 뭐라고 써야할지 존나 난감하다</p>
						</div>
						<div class="pt-2">
							<h6>2. Reiciendis dolores repudiandae?</h6>
							<p>Id ipsam non ut. Placeat doloremque deserunt quia tenetur
								inventore laboriosam dolores totam odio. Aperiam incidunt et.
								Totam ut quos sunt atque modi molestiae dolorem.</p>
						</div>
						<div class="pt-2">
							<h6>3. Qui qui reprehenderit ut est illo numquam voluptatem?</h6>
							<p>Enim inventore in consequuntur ipsam voluptatem
								consequatur beatae. Nostrum consequuntur voluptates et
								blanditiis.</p>
						</div>
					</div>
				</div>
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">배송관련</h5>
						<div class="accordion accordion-flush" id="faq-group-1">
							<div class="accordion-item">
								<h2 class="accordion-header">
									<button class="accordion-button collapsed"
										data-bs-target="#faqsOne-1" type="button"
										data-bs-toggle="collapse">평균 배송 시간이 얼마나 되나요?</button>
								</h2>
								<div id="faqsOne-1" class="accordion-collapse collapse"
									data-bs-parent="#faq-group-1">
									<div class="accordion-body">택배기사가 가져다 주는데 내가 어떻게알어.</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header">
									<button class="accordion-button collapsed"
										data-bs-target="#faqsOne-2" type="button"
										data-bs-toggle="collapse">Omnis fugiat quis
										repellendus?</button>
								</h2>
								<div id="faqsOne-2" class="accordion-collapse collapse"
									data-bs-parent="#faq-group-1">
									<div class="accordion-body">In minus quia impedit est
										quas deserunt deserunt et. Nulla non quo dolores minima fugiat
										aut saepe aut inventore. Qui nesciunt odio officia beatae
										iusto sed voluptatem possimus quas. Officia vitae sit
										voluptatem nostrum a.</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header">
									<button class="accordion-button collapsed"
										data-bs-target="#faqsOne-3" type="button"
										data-bs-toggle="collapse">Et occaecati praesentium
										aliquam modi incidunt?</button>
								</h2>
								<div id="faqsOne-3" class="accordion-collapse collapse"
									data-bs-parent="#faq-group-1">
									<div class="accordion-body">Voluptates magni amet enim
										perspiciatis atque excepturi itaque est. Sit beatae animi
										incidunt eum repellat sequi ea saepe inventore. Id et vel et
										et. Nesciunt itaque corrupti quia ducimus. Consequatur maiores
										voluptatum fuga quod ut non fuga.</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header">
									<button class="accordion-button collapsed"
										data-bs-target="#faqsOne-4" type="button"
										data-bs-toggle="collapse">Quo unde eaque vero dolor
										quis ipsam?</button>
								</h2>
								<div id="faqsOne-4" class="accordion-collapse collapse"
									data-bs-parent="#faq-group-1">
									<div class="accordion-body">Numquam ut reiciendis
										aliquid. Quia veritatis quasi ipsam sed quo ut eligendi et
										non. Doloremque sed voluptatem at in voluptas aliquid dolorum.</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header">
									<button class="accordion-button collapsed"
										data-bs-target="#faqsOne-5" type="button"
										data-bs-toggle="collapse">Natus sunt quo atque
										mollitia accusamus?</button>
								</h2>
								<div id="faqsOne-5" class="accordion-collapse collapse"
									data-bs-parent="#faq-group-1">
									<div class="accordion-body">Aut necessitatibus maxime
										quis dolor et. Nihil laboriosam molestiae qui molestias
										placeat corrupti non quo accusamus. Nemo qui quis harum enim
										sed. Aliquam molestias pariatur delectus voluptas quidem qui
										rerum id quisquam. Perspiciatis voluptatem voluptatem eos. Vel
										aut minus labore at rerum eos.</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">계정에 관련된 질문</h5>
						<div class="accordion accordion-flush" id="faq-group-2">
							<div class="accordion-item">
								<h2 class="accordion-header">
									<button class="accordion-button collapsed"
										data-bs-target="#faqsTwo-1" type="button"
										data-bs-toggle="collapse">회원가입 승인이 되지 않고 있습니다.</button>
								</h2>
								<div id="faqsTwo-1" class="accordion-collapse collapse"
									data-bs-parent="#faq-group-2">
									<div class="accordion-body">기다려 임마</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header">
									<button class="accordion-button collapsed"
										data-bs-target="#faqsTwo-2" type="button"
										data-bs-toggle="collapse">Provident beatae eveniet
										placeat est aperiam repellat adipisci?</button>
								</h2>
								<div id="faqsTwo-2" class="accordion-collapse collapse"
									data-bs-parent="#faq-group-2">
									<div class="accordion-body">In minus quia impedit est
										quas deserunt deserunt et. Nulla non quo dolores minima fugiat
										aut saepe aut inventore. Qui nesciunt odio officia beatae
										iusto sed voluptatem possimus quas. Officia vitae sit
										voluptatem nostrum a.</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header">
									<button class="accordion-button collapsed"
										data-bs-target="#faqsTwo-3" type="button"
										data-bs-toggle="collapse">Minus aliquam modi id
										reprehenderit nihil?</button>
								</h2>
								<div id="faqsTwo-3" class="accordion-collapse collapse"
									data-bs-parent="#faq-group-2">
									<div class="accordion-body">Voluptates magni amet enim
										perspiciatis atque excepturi itaque est. Sit beatae animi
										incidunt eum repellat sequi ea saepe inventore. Id et vel et
										et. Nesciunt itaque corrupti quia ducimus. Consequatur maiores
										voluptatum fuga quod ut non fuga.</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header">
									<button class="accordion-button collapsed"
										data-bs-target="#faqsTwo-4" type="button"
										data-bs-toggle="collapse">Quaerat qui est iusto
										asperiores qui est reiciendis eos et?</button>
								</h2>
								<div id="faqsTwo-4" class="accordion-collapse collapse"
									data-bs-parent="#faq-group-2">
									<div class="accordion-body">Numquam ut reiciendis
										aliquid. Quia veritatis quasi ipsam sed quo ut eligendi et
										non. Doloremque sed voluptatem at in voluptas aliquid dolorum.</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header">
									<button class="accordion-button collapsed"
										data-bs-target="#faqsTwo-5" type="button"
										data-bs-toggle="collapse">Laboriosam asperiores eum?
									</button>
								</h2>
								<div id="faqsTwo-5" class="accordion-collapse collapse"
									data-bs-parent="#faq-group-2">
									<div class="accordion-body">Aut necessitatibus maxime
										quis dolor et. Nihil laboriosam molestiae qui molestias
										placeat corrupti non quo accusamus. Nemo qui quis harum enim
										sed. Aliquam molestias pariatur delectus voluptas quidem qui
										rerum id quisquam. Perspiciatis voluptatem voluptatem eos. Vel
										aut minus labore at rerum eos.</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">정산 관련</h5>
						<div class="accordion accordion-flush" id="faq-group-3">
							<div class="accordion-item">
								<h2 class="accordion-header">
									<button class="accordion-button collapsed"
										data-bs-target="#faqsThree-1" type="button"
										data-bs-toggle="collapse">결제일이 어떻게 되나요?</button>
								</h2>
								<div id="faqsThree-1" class="accordion-collapse collapse"
									data-bs-parent="#faq-group-3">
									<div class="accordion-body">줄 돈은 있고?</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header">
									<button class="accordion-button collapsed"
										data-bs-target="#faqsThree-2" type="button"
										data-bs-toggle="collapse">Consequatur saepe explicabo
										odio atque nisi?</button>
								</h2>
								<div id="faqsThree-2" class="accordion-collapse collapse"
									data-bs-parent="#faq-group-3">
									<div class="accordion-body">In minus quia impedit est
										quas deserunt deserunt et. Nulla non quo dolores minima fugiat
										aut saepe aut inventore. Qui nesciunt odio officia beatae
										iusto sed voluptatem possimus quas. Officia vitae sit
										voluptatem nostrum a.</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header">
									<button class="accordion-button collapsed"
										data-bs-target="#faqsThree-3" type="button"
										data-bs-toggle="collapse">Voluptates vel est fugiat
										molestiae rem sit eos sint?</button>
								</h2>
								<div id="faqsThree-3" class="accordion-collapse collapse"
									data-bs-parent="#faq-group-3">
									<div class="accordion-body">Voluptates magni amet enim
										perspiciatis atque excepturi itaque est. Sit beatae animi
										incidunt eum repellat sequi ea saepe inventore. Id et vel et
										et. Nesciunt itaque corrupti quia ducimus. Consequatur maiores
										voluptatum fuga quod ut non fuga.</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header">
									<button class="accordion-button collapsed"
										data-bs-target="#faqsThree-4" type="button"
										data-bs-toggle="collapse">Ab ipsa cum autem voluptas
										doloremque velit?</button>
								</h2>
								<div id="faqsThree-4" class="accordion-collapse collapse"
									data-bs-parent="#faq-group-3">
									<div class="accordion-body">Numquam ut reiciendis
										aliquid. Quia veritatis quasi ipsam sed quo ut eligendi et
										non. Doloremque sed voluptatem at in voluptas aliquid dolorum.</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header">
									<button class="accordion-button collapsed"
										data-bs-target="#faqsThree-5" type="button"
										data-bs-toggle="collapse">Aliquam magni ducimus
										facilis numquam dolorum harum eveniet iusto?</button>
								</h2>
								<div id="faqsThree-5" class="accordion-collapse collapse"
									data-bs-parent="#faq-group-3">
									<div class="accordion-body">Aut necessitatibus maxime
										quis dolor et. Nihil laboriosam molestiae qui molestias
										placeat corrupti non quo accusamus. Nemo qui quis harum enim
										sed. Aliquam molestias pariatur delectus voluptas quidem qui
										rerum id quisquam. Perspiciatis voluptatem voluptatem eos. Vel
										aut minus labore at rerum eos.</div>
								</div>
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

</body>

</html>