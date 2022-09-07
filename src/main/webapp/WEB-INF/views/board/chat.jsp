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

    <!-- Jquery 선언 -->
    <script src = "https://code.jquery.com/jquery-3.6.0.min.js"
            integrity = "sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin = "anonymous"></script>

    <!-- =======================================================
      * Template Name: NiceAdmin - v2.3.1
      * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
      * Author: BootstrapMade.com
      * License: https://bootstrapmade.com/license/
      ======================================================== -->


    <script src = "https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
    <script type = "text/javascript">
        var webSocket = {
            init          : function (param) {
                this._url = param.url;
                this._initSocket();
            },
            sendChat      : function () {
                this._sendMessage('${member.ceo}','${room}', 'CMD_MSG_SEND', $('#message').val());
                $('#message').val('');
            },
            sendEnter     : function () {
                this._sendMessage('${member.ceo}','${room}', 'CMD_ENTER', $('#message').val());
                $('#message').val('');
            },
            receiveMessage: function (msgData) {
                console.log(msgData);

                // 내가 보낸 메세지
                if (msgData.cmd == 'CMD_MSG_SEND' && msgData.ceo == "${member.ceo}") {
                    $('#divChatData').append('<div class="alert alert-secondary">' + msgData.msg + '</div>');
                }
                // 상대방이 보낸 메시지
                else if (msgData.cmd == 'CMD_MSG_SEND' && msgData.ceo != "${member.ceo}") {
                    $('#divChatData').append('<div class="alert alert-warning">' + msgData.msg + '</div>');
                }
                // 입장
                else if (msgData.cmd == 'CMD_ENTER') {
                    $('#divChatData').append('<div>' + msgData.msg + '</div>');
                }
                // 퇴장
                else if (msgData.cmd == 'CMD_EXIT') {
                    $('#divChatData').append('<div>' + msgData.msg + '</div>');
                }
            },
            closeMessage  : function (str) {
                $('#divChatData').append('<div>' + '연결 끊김 : ' + str + '</div>');
            },
            disconnect    : function () {
                this._socket.close();
            },
            _initSocket   : function () {
                this._socket = new SockJS(this._url);
                this._socket.onopen = function (evt) {
                    webSocket.sendEnter();
                };
                this._socket.onmessage = function (evt) {
                    webSocket.receiveMessage(JSON.parse(evt.data));
                };
                this._socket.onclose = function (evt) {
                    webSocket.closeMessage(JSON.parse(evt.data));
                }
            },
            _sendMessage  : function (ceo, room, cmd, msg) {
                var msgData = {
                    ceo : ceo,
                    room: room,
                    cmd : cmd,
                    msg : msg
                };
                var jsonData = JSON.stringify(msgData);
                this._socket.send(jsonData);
            }
        };
    </script>
    <script type = "text/javascript">
        $(window).on('load', function () {
            webSocket.init({url: '<c:url value="/chat" />'});
        });
    </script>
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
        <div class = "card-header">${room}번 방에 오신것을 환영합니다.'</div>
        <div class = "card-body">
            <h5 class = "card-title">${member.ceo}님 자유롭게 채팅하세요.</h5>

            <div id = "divChatData" class = "col"></div>

        </div>
        <div class = "card-footer">
            <div class = "input-group mb-3">
                <input type = "text" id = "message" class = "form-control" aria-label = "Recipient's username"
                       aria-describedby = "button-addon2" onkeypress = "if(event.keyCode==13){webSocket.sendChat();}">
                <div class = "input-group-append">
                    <button class = "btn btn-outline-secondary" type = "button" id = "btnSend"
                            onclick = "webSocket.sendChat()">전송
                    </button>
                </div>
            </div>

        </div>
    </div>


    <!--  카드바디 --> </main>

<!-- 본문 -->
<!-- ======= Footer ======= -->
<jsp:include page = "../mainInclude/footer.jsp"></jsp:include>
<!-- End Footer -->
<a href = "#" class = "back-to-top d-flex align-items-center justify-content-center"><i
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