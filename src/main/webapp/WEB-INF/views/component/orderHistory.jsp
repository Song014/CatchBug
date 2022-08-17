<%@ page contentType="text/html; charset=UTF-8" %>
<div>
	<form>
		<p>미 승인 발주 현황</p>
		<input type="date" name="beforeDate"> <input type="date"
			name="afterDate" id='currnetDate'> <select
			name="searchOption">
			<option value="orderNumber" selected="selected">주문번호</option>
			<option value="content">내용</option>
			<option value="remarks">비고</option>
		</select> <input type="text" name="input" placeholder="검색어를 입력해 주세요.">
		<!-- <input type="button" name="inputBtn" value="검색"> -->
		<button>검색</button>
	</form>
	<table class="table">
		<tr>
			<th>No</th>
			<th>주문번호</th>
			<th>사업자명</th>
			<th>주문일자</th>
			<th>내용</th>
			<th>비고</th>
			<th>상태</th>
			<th>결제</th>
		</tr>
		<tr>
			<td>1</td>
			<td>A0001</td>
			<td>늑대와여우</td>
			<td>22.08.12</td>
			<td>재고부족으로 발주요청</td>
			<td></td>
			<td>취소</td>
			<td><input type="button" name="ok" value="재승인"></td>
		</tr>
		<tr>
			<td>2</td>
			<td>A0001</td>
			<td>늑대와여우</td>
			<td>22.08.12</td>
			<td>재고부족으로 발주요청</td>
			<td></td>
			<td>승인</td>
			<td><input type="button" name="ok" value="재승인"></td>
		</tr>
		<tr>
			<td>3</td>
			<td>A0001</td>
			<td>늑대와여우</td>
			<td>22.08.12</td>
			<td>재고부족으로 발주요청</td>
			<td></td>
			<td>승인</td>
			<td><input type="button" name="ok" value="재승인"></td>
		</tr>
	</table>
</div>
<script>
	// 오늘 날짜
	document.getElementById('currnetDate').value = new Date().toISOString()
			.slice(0, 10);
</script>
