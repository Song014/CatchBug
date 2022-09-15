<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="com.catchbug.biz.vo.MemberVO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Dashboard - NiceAdmin Bootstrap Template</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
            crossorigin="anonymous"></script>

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
<!-- main start -->

<main id="main" class="main">
    <div class="pagetitle">
        <h1>MyPage</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                <li class="breadcrumb-item active">마이페이지</li>
            </ol>
        </nav>
    </div>
    <section class="section profile">
        <div class="row">
            <div class="col-xl-4">
                <div class="card">
                    <div
                            class="card-body profile-card pt-4 d-flex flex-column align-items-center">
                        <img src="https://catchbugbucket.s3.ap-northeast-2.amazonaws.com/profileImg/${img.uploadPath }/${img.uuid}" alt="Profile"
                             class="rounded-circle">
                        <h2>${member.business_name}</h2>
                        <h3>${member.email}</h3>
                        <div class="social-links mt-2">
                            <a href="#" class="twitter"><i class="bi bi-twitter"></i></a> <a
                                href="#" class="facebook"><i class="bi bi-facebook"></i></a> <a
                                href="#" class="instagram"><i class="bi bi-instagram"></i></a> <a
                                href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-8">
                <div class="card">
                    <div class="card-body pt-3">
                        <ul class="nav nav-tabs nav-tabs-bordered" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" data-bs-toggle="tab"
                                        data-bs-target="#profile-overview" aria-selected="true"
                                        role="tab">자기소개</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" data-bs-toggle="tab"
                                        data-bs-target="#profile-edit" aria-selected="false"
                                        tabindex="-1" role="tab">MyPage 수정</button>
                            </li>
                            <!-- <li class="nav-item" role="presentation">
                                <button class="nav-link" data-bs-toggle="tab"
                                    data-bs-target="#profile-settings" aria-selected="false"
                                    tabindex="-1" role="tab">Settings</button>
                            </li> -->
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" data-bs-toggle="tab"
                                        data-bs-target="#profile-change-password" aria-selected="false"
                                        tabindex="-1" role="tab">비밀번호 변경</button>
                            </li>
                        </ul>
                        <div class="tab-content pt-2">
                            <div class="tab-pane fade show active profile-overview"
                                 id="profile-overview" role="tabpanel">
                                <!-- 자기소개 이미지 파일 변경 -->
                                <form  method="post" id="form_img_control">
                                    <div class="row mb-3">
                                        <label for="profileImage"
                                               class="col-md-4 col-lg-3 col-form-label">Profile
                                                                                        Image</label>

                                        <div class="col-md-8 col-lg-9">
                                            <div id="div-preview">
                                                <img id="image" src="https://catchbugbucket.s3.ap-northeast-2.amazonaws.com/profileImg/${img.uploadPath }/${img.uuid}" style="width:100px; heigth:100px;" />
                                                <input type="hidden" name="id" value="${member.id }">
                                                <input type="hidden" name="oldUuid" value="${member.uuid }">
                                            </div>
                                            <input type="file" name="multipartFile" />
                                            <div class="pt-2">

                                                <button type="reset" class="btn btn-danger btn-sm"
                                                        title="Remove my profile image">
                                                    <i class="bi bi-trash"></i>
                                                </button>
                                                <button type="button" class="btn btn-primary" onclick="onImgSubmit()">저장</button>
                                            </div>

                                            <!-- <button type="submit" class="class="btn btn-primary btn-sm"" title="Upload new profile image" <i	class="bi bi-upload"></i>></button>
                                                     -->
                                        </div>
                                    </div>
                                </form>
                                <!-- 자기소개 이미지 파일 변경 끝-->
                                <h5 class="card-title">Profile Details</h5>
                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label ">아이디</div>

                                    <div class="col-lg-9 col-md-8">${member.id}</div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label">사업자 등록번호</div>
                                    <div class="col-lg-9 col-md-8">${member.business_no}</div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label">법인명</div>
                                    <div class="col-lg-9 col-md-8">${member.business_name}</div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label">대표자</div>
                                    <div class="col-lg-9 col-md-8">${member.ceo}</div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label">연락처</div>
                                    <div class="col-lg-9 col-md-8">${member.contact}</div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label">Email</div>
                                    <div class="col-lg-9 col-md-8">${member.email}</div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label">사업장 주소지</div>
                                    <div class="col-lg-9 col-md-8">${member.business_address}</div>
                                </div>
                            </div>


                            <div class="tab-pane fade profile-edit pt-3" id="profile-edit"
                                 role="tabpanel">
                                <!-- 마이페이지 개인정보 변경 폼 시작 -->

                                <form id="updateForm" action="/myPageUpdate.do" method="post">

                                    <div class="row mb-3">
                                        <div class="col-md-8 col-lg-9">
                                            <input name="id" type="hidden" class="form-control" id="id"
                                                   value="${member.id}">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="about" class="col-md-4 col-lg-3 col-form-label">
                                            비밀번호 확인 </label>
                                        <div class="col-md-8 col-lg-9">
                                            <input name="pass" type="password" class="form-control"
                                                   id="pass">

                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <label for="about" class="col-md-4 col-lg-3 col-form-label">사업자
                                                                                                    등록번호</label>
                                        <div class="col-md-8 col-lg-9">
                                            <input name="business_no" type="text" class="form-control"
                                                   id="business_no" value="${member.business_no}">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="company" class="col-md-4 col-lg-3 col-form-label">법인명</label>
                                        <div class="col-md-8 col-lg-9">
                                            <input name="business_name" type="text" class="form-control"
                                                   id="business_name" value="${member.business_name}">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="Job" class="col-md-4 col-lg-3 col-form-label">대표자</label>
                                        <div class="col-md-8 col-lg-9">
                                            <input name="ceo" type="text" class="form-control" id="ceo"
                                                   value="${member.ceo}">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="Country" class="col-md-4 col-lg-3 col-form-label">연락처</label>
                                        <div class="col-md-8 col-lg-9">
                                            <input name="contact" type="text" class="form-control"
                                                   id="contact" value="${member.contact}">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="Address" class="col-md-4 col-lg-3 col-form-label">Email</label>
                                        <div class="col-md-8 col-lg-9">
                                            <input name="email" type="text" class="form-control"
                                                   id="email" value="${member.email}">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="Phone" class="col-md-4 col-lg-3 col-form-label">사업장
                                                                                                    주소지</label>
                                        <div class="col-md-8 col-lg-9">
                                            <input name="business_address" type="text"
                                                   class="form-control" id="business_address"
                                                   value="${member.business_address}">
                                        </div>
                                    </div>

                                </form>
                                <div class="text-center">
                                    <button type="button" class="btn btn-primary" id="submit">Save
                                                                                              Changes</button>
                                </div>
                            </div>

                            <div class="tab-pane fade pt-3" id="profile-change-password"
                                 role="tabpanel">
                                <!-- 비밀번호 변경 폼 시작 -->
                                <form id="passUpdateForm" action="updatePass.do" method="post">
                                    <div class="row mb-3">
                                        <input name="id" type="hidden" class="form-control" value="${member.id}">
                                        <label for="currentPassword"
                                               class="col-md-4 col-lg-3 col-form-label">현재 비밀번호 </label>
                                        <div class="col-md-8 col-lg-9">
                                            <input name="pass" type="password" class="form-control"
                                                   id="currentPassword">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="newPassword"
                                               class="col-md-4 col-lg-3 col-form-label">새 비밀번호</label>
                                        <div class="col-md-8 col-lg-9">
                                            <input name="newPassword" type="password" class="form-control"
                                                   id="newPassword">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="renewPassword"
                                               class="col-md-4 col-lg-3 col-form-label">새 비밀번호 확인</label>
                                        <div class="col-md-8 col-lg-9">
                                            <input name="renewpassword" type="password"
                                                   class="form-control" id="renewPassword">
                                        </div>
                                    </div>
                                    <div class="text-center">
                                        <button type="button" class="btn btn-primary" id="passUpdateBtn">비밀번호 변경</button>
                                    </div>
                                </form>
                                <!-- 비밀번호 변경 폼 끝 -->
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

<script type="text/javascript">
    function onImgSubmit(){
        const $form = $("#form_img_control");
        let data = {
            "fileName": $form.find("input[name='fileName']").val(),
            "uuid": $form.find("input[name='uuid']").val(),
            "uploadPath": $form.find("input[name='uploadPath']").val(),
            "id" : $form.find("input[name='id']").val()
        }

        // ajax 통신
        $.ajax({
            type : "POST",
            url : "/profileUpdate",
            data : data,
            dataType : "text",
            success : function(res){
            	alert("이미지 변경이 완료되었습니다.\n 다시 로그인해 주세요.")
                location.href="/logout.do";
            },
            error : function(XMLHttpRequest, textStatus, errorThrown){
                alert("통신 실패.")
            }
        });
        /* str += "<input type='hidden' name='fileName' value='" + obj.fileName + "'>";
         str += "<input type='hidden' name='uuid' value='" + obj.uuid +"_" +obj.fileName + "'>";
         str += "<input type='hidden' name='uploadPath' value='" + obj.uploadPath + "'>"; */
    }
</script>

<!-- 이미지 관련 -->
<script type="text/javascript">
    /* 이미지 업로드 메서드 */
    $("input[type='file']").on("change", function(e) {
        /*이미지 미리보기 소스*/
        var reader = new FileReader();

        reader.onload = function(e) {
            // get loaded data and render thumbnail.
            document.getElementById("image").src = e.target.result;
            document.getElementById("image").style.width = "100px";
            document.getElementById("image").style.heigth = "100px";
        };

        // read the image file as a data URL.
        reader.readAsDataURL(this.files[0]);

        let formData = new FormData();
        console.log(formData)

        let fileInput = $('input[name="multipartFile"]');
        let fileList = fileInput[0].files;
        let fileObj = fileList[0];

        if (!fileCheck(fileObj.name, fileObj.size)) {
            return false;
        }

        formData.append("multipartFile", fileObj);

        $.ajax({
            url : '/myProfileUpload',
            processData : false,
            contentType : false,
            enctype : 'multipart/form-data',
            data : formData,
            type : 'POST',
            dataType : 'json',
            success : function(result) {
                showUploadImage(result);
            },
            error : function(result) {
                alert("통신실패");
            }
        });
    });

    let regex = new RegExp("(.*?)\.(jpg|png)$");
    let maxSize = 10485760; //10MB
    /*이미지 파일 검증 메서드 */
    function fileCheck(fileName, fileSize) {

        if (fileSize >= maxSize) {
            alert("파일 사이즈 초과");
            return false;
        }

        if (!regex.test(fileName)) {
            alert("해당 종류의 파일은 업로드할 수 없습니다.");
            return false;
        }

        return true;

    }
    /* 이미지 출력 */
    function showUploadImage(obj) {

        /* 전달받은 데이터 검증 */
        /* if (uploadResultArr || uploadResultArr.length == 0) {
         return
         } */

        let uploadResult = $("#div-preview");

        let str = "";

        let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g,
                '/')
            + "/s_" + obj.uuid + "_" + obj.fileName);
        str += "<input type='hidden' name='fileName' value='" + obj.fileName + "'>";
        str += "<input type='hidden' name='uuid' value='" + obj.uuid +"_" +obj.fileName + "'>";
        str += "<input type='hidden' name='uploadPath' value='" + obj.uploadPath + "'>";
        str += "</div>";
        uploadResult.append(str);

    }
</script>

<script>
    $(document).ready(function() {

        const username = '${member.ceo}';
        const level = '${member.level1}';
        if (level == 3) {
            alert(username + "님 안녕하세요 아직 승인이 완료되지 않았습니다.");
        }
    });
</script>
<script type="text/javascript">
    $(document).ready(function() {
        $("#submit").on("click", function() {
            if ($("#business_no").val() == "") {
                alert("비밀번호를 입력해주세요.");
                $("#business_no").focus();
                return false;
            }
            if ($("#business_name").val() == "") {
                alert("성명을 입력해주세요.");
                $("#business_name").focus();
                return false;
            }
            if ($("#ceo").val() == "") {
                alert("대표자를 입력해주세요.");
                $("#ceo").focus();
                return false;
            }
            if ($("#contact").val() == "") {
                alert("연락처를 입력해주세요.");
                $("#contact").focus();
                return false;
            }
            if ($("#email").val() == "") {
                alert("이메일을 입력해주세요.");
                $("#email").focus();
                return false;
            }
            if ($("#business_address").val() == "") {
                alert("사업장 주소지를 입력해주세요.");
                $("#business_address").focus();
                return false;
            }
            $.ajax({
                url : "/passChk.do",
                type : "POST",
                dateType : "json",
                data : $("#updateForm").serializeArray(),
                success : function(data) {
                    console.log(data);
                    if (data == true) {
                        if (confirm("회원수정하시겠습니까?")) {
                            $("#updateForm").submit();
                            return;
                        }
                    } else {
                        alert("패스워드가 틀렸습니다.");
                        return;

                    }
                }
            })
        })
    });
</script>

<script type="text/javascript">
    $(document).ready(function() {
        $("#passUpdateBtn").on("click", function() {
            if ($("#currentPassword").val() == "") {
                alert("비밀번호를 입력해주세요.");
                $("#currentPassword").focus();
                return false;
            }
            if ($("#newPassword").val() == "") {
                alert("새 비밀번호를 입력해주세요.");
                $("#newPassword").focus();
                return false;
            }
            if ($("#renewPassword").val() == "") {
                alert("새 비밀번호 확인을 입력해주세요.");
                $("#renewPassword").focus();
                return false;
            }
            if ($("#renewPassword").val() != $("#newPassword").val()) {
                alert("새비밀번호를 다르게 입력하였습니다.");
                $("#newPassword").val('');
                $("#renewPassword").val('');
                $("#renewPassword").focus();
                return false;
            }

            $.ajax({
                url : "/passChk.do",
                type : "POST",
                dateType : "json",
                data : $("#passUpdateForm").serialize(),
                success : function(data) {
                    if (data == true) {
                        if (confirm("비밀번호를 변경하시겠습니까?")) {
                            $("#passUpdateForm").submit();
                        }
                    } else {
                        alert("패스워드가 틀렸습니다.");
                        return;

                    }
                }
            })
        })
    });
</script>

</body>


</html>