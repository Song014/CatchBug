
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!-- cdn -->

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<!-- cdn end -->
<!-- ======= Header ======= -->


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
			<li class="nav-item dropdown">
			</li>

			<!-- End Messages Dropdown Items -->
			<!-- End Messages Nav -->

			<!-- login info -->


			<li class="nav-item dropdown pe-3"><a
				class="nav-link nav-profile d-flex align-items-center pe-0" href="#"
				data-bs-toggle="dropdown" aria-expanded="false"> <img
					src="assets/img/profile-img.jpg" alt="Profile"
					class="rounded-circle"> <c:choose>
						<c:when test="${memberId.level1 eq 1 }">
							<span class="d-none d-md-block dropdown-toggle ps-2">${memberId.business_name }관리자님
								안녕하세요</span>
						</c:when>
						<c:when test="${memberId.level1 eq 2 }">
							<span class="d-none d-md-block dropdown-toggle ps-2">${memberId.business_name }가맹점님
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
							<c:when test="${memberId.level1 eq 1 }">
								<h6>${memberId.business_name }님</h6></li>
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
					<c:when test="${memberId.level1 eq 2 }">
						<h6>${memberId.business_name }가맹점</h6></li>
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


	<script
		src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	<script>
            $(document).ready(function(){

            const username = '${memberId.ceo}'

            $("#disconn").on("click", (e) => {
                disconnect();
            })
            
            $("#button-send").on("click", (e) => {
                send();
            });

            const websocket = new WebSocket("ws://192.168.0.39:8080/ws/chat");

            websocket.onmessage = onMessage;
            websocket.onopen = onOpen;
            websocket.onclose = onClose;

            function send(){

                let msg = document.getElementById("msg");

                console.log(username + ">>" + msg.value);
                websocket.send(username + ">>" + msg.value);
                msg.value = '';
            }
            
            //채팅창에서 나갔을 때
            function onClose(evt) {
                var str = username + ": 님이 방을 나가셨습니다.";
                websocket.send(str);
            }
            
            //채팅창에 들어왔을 때
            function onOpen(evt) {
                var str = username + ": 님이 입장하셨습니다.";
                websocket.send(str);
            }

            function onMessage(msg) {
                var data = msg.data;
                var sessionId = null;
                //데이터를 보낸 사람
                var message = null;
                var arr = data.split(":");

                for(var i=0; i<arr.length; i++){
                    console.log('arr[' + i + ']: ' + arr[i]);
                }

                var cur_session = username;

                //현재 세션에 로그인 한 사람
                console.log("cur_session : " + cur_session);
                sessionId = arr[0];
                message = arr[1];

                console.log("sessionID : " + sessionId);
                console.log("cur_session : " + cur_session);

                //로그인 한 클라이언트와 타 클라이언트를 분류하기 위함
                if(sessionId == cur_session){
                    var str = "<div class='col-6'>";
                    str += "<div class='alert alert-secondary'>";
                    str += "<b>" + sessionId + " : " + message + "</b>";
                    str += "</div></div>";
                    $("#msgArea").append(str);
                }
                else{
                    var str = "<div class='col-6'>";
                    str += "<div class='alert alert-warning'>";
                    str += "<b>" + sessionId + " : " + message + "</b>";
                    str += "</div></div>";
                    $("#msgArea").append(str);
                }
            }
            })
</script>

</header>