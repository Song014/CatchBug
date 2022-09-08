<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>

<!DOCTYPE html>
<html lang = "en">

<head>
    <meta charset = "utf-8">
    <meta content = "width=device-width, initial-scale=1.0" name = "viewport">

    <title>게시판 - 전체이용자 채팅</title>
    <meta content = "" name = "description">
    <meta content = "" name = "keywords">

    <!-- Favicons -->
    <link href = "assets/img/favicon.png" rel = "icon">
    <link href = "assets/img/apple-touch-icon.png" rel = "apple-touch-icon">

    <!-- Google Fonts -->
    <link href = "https://fonts.gstatic.com" rel = "preconnect">
    <link href = "https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel = "stylesheet">

    <!-- Vendor CSS Files -->
    <link href = "assets/vendor/bootstrap/css/bootstrap.min.css" rel = "stylesheet">
    <link href = "assets/vendor/bootstrap-icons/bootstrap-icons.css" rel = "stylesheet">
    <link href = "assets/vendor/boxicons/css/boxicons.min.css" rel = "stylesheet">
    <link href = "assets/vendor/quill/quill.snow.css" rel = "stylesheet">
    <link href = "assets/vendor/quill/quill.bubble.css" rel = "stylesheet">
    <link href = "assets/vendor/remixicon/remixicon.css" rel = "stylesheet">
    <link href = "assets/vendor/simple-datatables/style.css" rel = "stylesheet">

    <!-- Template Main CSS File -->
    <link href = "assets/css/style.css" rel = "stylesheet">

    <!--채팅방 CSS -->
    <link href = "assets/css/chat.css" rel = "stylesheet">

    <!-- Jquery 선언 -->
    <script src = "https://code.jquery.com/jquery-3.6.0.min.js"
            integrity = "sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin = "anonymous"></script>

    <!-- =======================================================
      * Template Name: NiceAdmin - v2.3.1
      * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
      * Author: BootstrapMade.com
      * License: https://bootstrapmade.com/license/
      ======================================================== -->
</head>
<body>

<!-- ======= Header ======= -->

<jsp:include page = "../mainInclude/header.jsp"></jsp:include>

<!-- End Header -->


<!-- ======= Sidebar ======= -->

<jsp:include page = "../mainInclude/sidebar.jsp"></jsp:include>

<!-- ======= Sidebar ======= -->

<main id = "main" class = "main">


    <div class = "card">
        <div class = "card-header">일대일 상담 채팅</div>
        <div class = "card-body">
            <h5 class = "card-title" style="text-align: center;">${member.ceo}님 방생성 버튼을 눌러주세요.</h5>
            <div class = "mb-3">
                <div class = "inbox_msg">
                    <div class = "inbox_people">
                        <div class = "headind_srch">
                            <div class = "recent_heading">
                                <h4>일대일 상담문의 채팅방</h4>
                            </div>
                            <div class = "srch_bar">
                                <div class = "stylish-input-group">
                                    <input type="text" id="roomName" placeholder="방제목을 입력해주세요."/>
                                    <button class = "btn btn-primary" type = "button" id = "createRoom">방생성
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class = "inbox_chat">
                            <c:forEach var = "room" items = "${roomList}">
                                <div class = "chat_list">
                                    <div class = "chat_people">
                                        <div class = "chat_img"><img
                                                src = "https://ptetutorials.com/images/user-profile.png" alt = "sunil">
                                        </div>
                                        <div class = "chat_ib" id = "roomIn">
                                            <h5>${room.member_ceo}
                                                <span class = "chat_date">${room.nowDate}</span>
                                            </h5>
                                            <h4>${room.roomName}</h4>
                                            <input type = "hidden" value = "${room.member_id}" id="${room.member_id}"/>
                                        </div>
                                        <div class = "chat_button">
                                            <button class = "btn btn-danger" type = "button" id = "deleteRoom"
                                                    value = "${room.member_id}">방삭제
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!--  카드바디 --> </main>

<!-- 본문 -->
<script>
    $(document).ready(function () {

        const username = '${member.ceo}';
        const level = '${member.level1}';
        if (username == "") {
            alert("로그인한 유저만 이용가능합니다.");
            location.href = "login_page.do";
        } else {
            if (level == 3) {
                alert("승인된 회원만 이용가능합니다.");
                location.href = "company_intro.do";
            }
        }
    });
</script>

<script>
    $(document).ready(function () {
        var today = new Date();

        var year = today.getFullYear();
        var month = ('0' + (today.getMonth() + 1)).slice(-2);
        var day = ('0' + today.getDate()).slice(-2);

        const nowDate = year + '-' + month + '-' + day;
        $(document).on("click", "#createRoom", function () {
            if($("#roomName").val() == ""){
                alert("채팅방 제목을 입력해주세요.");
            }else{
                if($('#${member.id}').length){
                    alert("이미 존재합니다.");
                }else{
                    var roomName = $("#roomName").val();
                    location.href = "/createRoom.do?member_id=${member.id}&member_ceo=${member.ceo}&nowDate=" + nowDate + "&roomName="+ roomName;
                }
            }
        }).on("click", "#deleteRoom", function () {
            var roomNo = $(this).parent().prev().find('input').val();
            var level = "${member.level1}";
            if (level == "") {
                level = 4;
            }
            if (roomNo == "${member.id}" || level == "1") {
                memberid = $(this).val();
                location.href = "/deleteRoom.do?member_id=" + memberid;
            } else {
                alert("본인의 채팅방만 삭제할 수 있습니다.");
            }

        }).on("click", "#roomIn", function () {
                var roomNo = $(this).find('input').val();
                var level = "${member.level1}";
                if (level == "") {
                    level = 4;
                }
                if (roomNo == "${member.id}" || level == "1") {
                    location.href = "/ViewChat.do?room=" + roomNo;
                } else {
                    alert("본인의 채팅방에만 접속할 수 있습니다.");
                }
            })

    })
</script>
<!-- ======= Footer ======= -->
<jsp:include page = "../mainInclude/footer.jsp"></jsp:include>
<!-- End Footer -->
<a href = "#" class = "back-to-top d-flex align-itemsf-center justify-content-center"><i
        class = "bi bi-arrow-up-short"></i></a>
<!-- Vendor JS Files -->
<script src = "assets/vendor/apexcharts/apexcharts.min.js"></script>
<script src = "assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src = "assets/vendor/chart.js/chart.min.js"></script>
<script src = "assets/vendor/echarts/echarts.min.js"></script>
<script src = "assets/vendor/quill/quill.min.js"></script>
<script src = "assets/vendor/simple-datatables/simple-datatables.js"></script>
<script src = "assets/vendor/tinymce/tinymce.min.js"></script>
<script src = "assets/vendor/php-email-form/validate.js"></script>
<!-- Template Main JS File -->
<script src = "assets/js/main.js"></script>
</body>
</html>