<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>

<!DOCTYPE html>
<html lang = "en">

<head>
    <meta charset = "utf-8">
    <meta content = "width=device-width, initial-scale=1.0" name = "viewport">

    <title>재고관리 - 상품등록</title>
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
</head>

<body>

<!-- ======= Header ======= -->

<jsp:include page = "../mainInclude/header.jsp"></jsp:include>

<!-- End Header -->


<!-- ======= Sidebar ======= -->

<jsp:include page = "../mainInclude/sidebar.jsp"></jsp:include>

<!-- End Sidebar -->

<main id = "main" class = "main">

    <div class = "pagetitle">
        <h1>본사 재고 현황</h1>
        <nav>
            <ol class = "breadcrumb">
                <li class = "breadcrumb-item"><a href = "index.html">Home</a></li>
                <li class = "breadcrumb-item">재고관리</li>
                <li class = "breadcrumb-item active">상품 등록</li>
            </ol>
        </nav>
    </div>
    <div class = "tab-pane fade profile-edit pt-3 active show" id = "profile-edit" role = "tabpanel">
        <form action = "insertProduct.do" method = "post">
            <div class = "row mb-3">
                <label for = "product_img" class = "col-md-4 col-lg-3 col-form-label">상품
                                                                                      이미지</label>
                <div class = "col-md-4 col-lg-9">
                    <input class = "form-control" type = "file" id = "formFile" name = "product_img">
                </div>
            </div>

            <div class = "row mb-3">
                <label class = "col-md-4 col-lg-3 col-form-label">카테고리</label>
                <div class = "col-md-8 col-lg-4">
                    <select class = "form-select" aria-label = "Default select example" name = "main_category">
                        <option selected = "">상위 카테고리</option>
                        <c:forEach items = "${maincategory }" var = "maincategory">
                            <option value = "${maincategory.main_category }"> ${maincategory.main_name }</option>

                        </c:forEach>
                    </select>
                </div>
                <div class = "col-md-4 col-lg-1"></div>
                <div class = "col-md-8 col-lg-4">
                    <select class = "form-select" aria-label = "Default select example" name = "sub_category">
                        <option selected = "" value = "0">하위 카테고리</option>
                    </select>
                </div>
            </div>

            <div class = "row mb-3">
                <label for = "product_no" class = "col-md-4 col-lg-3 col-form-label">상품 번호</label>
                <div class = "col-md-8 col-lg-9">
                    <input name = "product_no" type = "text" class = "form-control" id = "product_no" value = ""
                           placeholder = "상품번호" maxlength = "8">
                </div>
            </div>

            <div class = "row mb-3">
                <label for = "brand" class = "col-md-4 col-lg-3 col-form-label">브랜드
                                                                                / 제조사</label>
                <div class = "col-md-8 col-lg-9">
                    <input name = "brand" type = "text" class = "form-control" id = "brand" value = ""
                           placeholder = "브랜드 / 제조사">
                </div>
            </div>

            <div class = "row mb-3">
                <label for = "product_name" class = "col-md-4 col-lg-3 col-form-label">상품명</label>
                <div class = "col-md-8 col-lg-9">
                    <input name = "product_name" type = "text" class = "form-control" value = "" placeholder = "상품명">
                </div>
            </div>

            <div class = "row mb-3">
                <label for = "price" class = "col-md-4 col-lg-3 col-form-label">개당
                                                                                가격</label>
                <div class = "col-md-8 col-lg-9">
                    <input name = "price" type = "text" class = "form-control" value = "" placeholder = "개당 가격 (원)">
                </div>
            </div>

            <div class = "col-sm-10">
                <button type = "submit" class = "btn btn-primary">상품 등록</button>
            </div>
            <div id = "uploadResult" class = "col-md-12 col-lg-12" name = "uploadResult">
                <img id = "image" />
            </div>
        </form>
    </div>

</main>

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

<!-- 날짜 검색시 오늘로 셋팅해주는 스크립트-->
<!-- 	<script>
    document.getElementById('inputSearchDate').valueAsDate = new Date();
</script> -->

<%--상품 등록시 기존상품과 코드가 일치하는지 여부를 체크--%>
<script>
    $("form").on("submit", function () {
        var product_no = $('input[name=product_no]').val();
        var productList = JSON.parse('${productList}');
        var category_no = $('select[name=sub_category]').val();
        for (var list in productList) {
            if (productList[list].product_no == product_no) {
                alert("상품번호가 이미 존재합니다.");
                return false;
            } else if (category_no == '0') {
                alert("카테고리를 선택하세요.");
                return false;
            } else if ($('input[name=brand]').val() == '') {
                alert("제조사나 브랜드를 입력하세요.");
                return false;
            } else if ($('input[name=price]').val() == '') {
                alert("가격을 입력해주세요.");
                return false;
            } else if ($('input[name=product_name]').val() == '') {
                alert("상품명을 입력해주세요.");
                return false;
            } else {
                alert("새로운 상품이 등록되었습니다.");
                return false;
            }
        }
    })

</script>

<!-- 기능 작동을위한 JS파일 링크 -->
<script type = "text/javascript">
    $(document).ready(function () {

        const username = '${member.ceo}';
        const level = '${member.level1}';
        if (username == "") {
            alert("로그인한 유저만 이용가능합니다.");
            location.href = "login_page.do";
        } else {
            if (level != 1) {
                alert("관리자만 이용가능합니다.");
                location.href = "company_intro.do";
            }
        }
        $(document).on("change", "select[name='main_category']", function () {
            let data = JSON.parse('${subCategory}')

            //두번째 셀렉트 박스를 삭제 시킨다.
            var subCategorySelectBox = $("select[name='sub_category']");
            subCategorySelectBox.children()
                .remove(); //기존 리스트 삭제

            //선택한 첫번째 박스의 값을 가져와 일치하는 값을 두번째 셀렉트 박스에 넣는다.
            $("option:selected", this).each(function () {
                var selectValue = $(this).val(); //main category 에서 선택한 값
                subCategorySelectBox.append("<option value=''>하위 카테고리</option>");
                for (var i = 0; i < data.length; i++) {
                    if (selectValue == data[i].main_category) {
                        subCategorySelectBox
                            .append("<option value='" + data[i].sub_category + "'>"
                                + data[i].sub_name
                                + "</option>");

                    }
                }
            });
        })
        /*이미지 미리보기 소스*/
        document.getElementById("formFile").onchange = function () {
            var reader = new FileReader();

            reader.onload = function (e) {
                // get loaded data and render thumbnail.
                document.getElementById("image").src = e.target.result;
                document.getElementById("image").style.width = "350px";
            };

            // read the image file as a data URL.
            reader.readAsDataURL(this.files[0]);
        };

    })

    /* 이미지 업로드 메서드 */
    $("input[type='file']").on("change", function (e) {

        let formData = new FormData();
        console.log(formData)

        let fileInput = $('input[name="product_img"]');
        let fileList = fileInput[0].files;
        let fileObj = fileList[0];

        if (!fileCheck(fileObj.name, fileObj.size)) {
            return false;
        }

        formData.append("uploadFile", fileObj);

        $.ajax({
            url        : '/uploadAjaxAction',
            processData: false,
            contentType: false,
            enctype    : 'multipart/form-data',
            data       : formData,
            type       : 'POST',
            dataType   : 'json',
            success    : function (result) {
                showUploadImage(result);
            },
            error      : function (result) {
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
    function showUploadImage(uploadResultArr) {

        /* 전달받은 데이터 검증 */
        /* if (uploadResultArr || uploadResultArr.length == 0) {
         return
         } */

        let uploadResult = $("#uploadResult");
        console.log(uploadResult)

        let obj = uploadResultArr[0];

        let str = "";

        let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g,
                '/')
            + "/s_" + obj.uuid + "_" + obj.fileName);
        str += "<input type='hidden' name='fileName' value='" + obj.fileName + "'>";
        str += "<input type='hidden' name='uuid' value='" + obj.uuid + "_" + obj.fileName + "'>";
        str += "<input type='hidden' name='uploadPath' value='" + obj.uploadPath + "'>";
        str += "</div>";

        uploadResult.append(str);

    }
</script>

</body>

</html>