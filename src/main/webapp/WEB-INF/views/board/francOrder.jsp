<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- main start -->
<main id="main" class="main">
<div class="pagetitle">
	<h1>발주서 작성</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="/">Home</a></li>
			<li class="breadcrumb-item active">발주서 작성</li>
		</ol>
	</nav>
</div>
<!-- End Page Title -->

<section class="section dashboard">


	<div class="card">
		<div class="card-body">
			<div class="row">
				<!-- 카테고리  -->
				<div class="col-lg-2">
					<div class="list-group" style="padding-top: 30px">
						<button type="button"
							class="list-group-item list-group-item-action active getCategory"
							aria-current="true">카테고리1</button>
						<button type="button"
							class="list-group-item list-group-item-action getCategory">카테고리2</button>
					</div>

				</div>
				<div class="col-lg-10">
					<!-- 카테고리 선택창 -->
					<div>
						<div align="right" class="dataTable-top">
							<div class="dataTable-dropdown">
								<label><select class="dataTable-selector"><option
											value="5">5</option>
										<option value="10" selected="">10</option>
										<option value="15">15</option>
										<option value="20">20</option>
										<option value="25">25</option></select> entries per page</label>
							</div>
							<div class="dataTable-search">
								<form>
									<input type="date" name="beforeDate"> <input
										type="date" name="afterDate" id='currnetDate'> <select
										name="searchOption">
										<option value="orderNumber" selected="selected">상품번호</option>
										<option value="content">상품명</option>
										<option value="remarks">등록일자</option>
									</select> <input type="text" name="input" placeholder="검색어를 입력해 주세요.">
									<!-- <input type="button" name="inputBtn" value="검색"> -->
									<button>검색</button>
								</form>
							</div>
						</div>
						<!-- 가져온거 -->
						<table class="table table-borderless top-selling" id="category">
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">이미지</th>
									<th scope="col">상품 번호</th>
									<th scope="col">상품 명</th>
									<th scope="col">등록 일자</th>
									<th scope="col">전체 수량</th>
									<th scope="col">개당 가격</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<th scope="row"><a href="#"><img
											src="https://via.placeholder.com/60" alt=""></a></th>
									<td>상품1</td>
									<td><a class="primary" data-bs-toggle="modal"
										data-bs-target="#modalProduct">상품 모달띄우기 </a></td>
									<td>등록일1</td>
									<td>재고량1</td>
									<td>9999</td>
									<td><button type="button"
											class="btn btn-primary btn-sm addBucket">추가</button></td>
								</tr>

							</tbody>
						</table>
						<!-- 가져온거 -->
					</div>
					<!-- 장바구니 -->
					<div>
						<form action="">
							<table class="table" id="bucket">
								<thead>
									<tr>
										<th></th>
										<th>상품 번호</th>
										<th>상품 명</th>
										<th>구매 수량</th>
										<th>개당 가격</th>
										<th>버튼</th>
									</tr>
								</thead>
								<tbody>

								</tbody>
							</table>
							<div class="d-grid gap-2 mt-3">
								<button class="btn btn-primary" type="button">주문하기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>


	</div>
</section>

</main>
<!-- End #main -->

<%@ include file="../static/footer.jsp"%>
<div class="modal fade" id="modalProduct" tabindex="-1">
	<div class="modal-dialog modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">주문번호 : 123456789</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="card">
					<div class="card-body">
						<div class="card-title">
							<h5 style="text-align: right;">총 주문금액</h5>
							<div style="text-align: right;">
								<i class="bx bx-won">가격 적어주세요</i>
							</div>
						</div>
						<table class="table" tex>
							<thead>
								<tr>
									<th scope=" col" style="width: 20%;">상품코드</th>
									<th scope="col" style="width: 52%;">품목명</th>
									<th scope="col" style="width: 13%;">수량</th>
									<th scope="col" style="width: 15%;">가격</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">00001</th>
									<td>무선 마우스 GB110</td>
									<td>5</td>
									<td>10000123123</td>
								</tr>

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
</div>
<script type="text/javascript">
				$(".getCategory").on("click", function(e) {
					e.preventDefault();
					
					const value = $(this).text();
					console.log(value);
					$.ajax({
						type : "GET", //요청 메소드 방식
						url : "test.do?category="+value,
						dataType : "json", //서버가 요청 URL을 통해서 응답하는 내용의 타입
						success : function(result) {
							$("#category tbody tr").remove();
							//서버의 응답데이터가 클라이언트에게 도착하면 자동으로 실행되는함수(콜백)
							//result - 응답데이터
							
							const str =`
							<tr>
								<td>1</td>
								<th scope="row"><a href="#"><img
										src="https://via.placeholder.com/60" alt=""></a></th>
								<td>`+result.product_no+`</td>
								<td><a class="primary" data-bs-toggle="modal"
									data-bs-target="#modalProduct">`+result.product_name+`</a></td>
								<td>`+result.add_day+`</td>
								<td>재고량1</td>
								<td>`+result.price+`</td>
								<td><button type="button"
										class="btn btn-primary btn-sm addBucket">추가</button></td>
							</tr>
							`;
							
							$("#category tbody").append(str);
							console.log("ajax 성공");
						},
						error : function(a, b, c) {
							//통신 실패시 발생하는 함수(콜백)
							console.log("실패" + a, b, c);
						}
					});
				})
				let trArr = new Array();
				
				$("#category").on("click",".addBucket",function() {
					
					const $tr = $(this).parent().parent();
					const $td = $tr.children();
					console.log("클릭한 Row의 모든 데이터 : " + $tr.text());

					const no = $td.eq(2).text();
					const name = $td.eq(3).text();
					const quantity = $td.eq(4).text();
					const price = $td.eq(5).text();
					
					const str =`
					<tr>
						<td><input type="checkbox" name="checkBox"></td>
						<td><input type="hidden" value=`+no+` >`+no+`</td>
						<td><input type="hidden" value=`+name+`><a class="primary" data-bs-toggle="modal" data-bs-target="#modalProduct">`+name+`</a></td>
						<td><input type="number" value="1"></td>
						<td><input type="hidden" value=`+price+`>`+price+`</td>
						<td><button type="button" class="btn btn-primary btn-sm delBucket">삭제</button></td>
					</tr>
					`;
					
					console.log(trArr.indexOf(no))
					if(trArr.indexOf(no)!=-1){
						alert(no+"과 같은 상품이 있습니다")
					} else {
						trArr.push(no);
						$("#bucket tbody").append(str);
					}
					
				})
				
				
				 $("#bucket").on("click", ".delBucket", function() {
					 const $tr = $(this).parent().parent();
					 const $td = $tr.children();
					 const no = $td.eq(1).text();
					 if(trArr.indexOf(no)!=-1){
						 trArr.pop();
						}
					 $tr.remove();
			    });
			</script>