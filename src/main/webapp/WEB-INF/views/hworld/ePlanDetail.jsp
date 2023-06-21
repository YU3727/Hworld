<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en">

<head>
	<meta charset="UTF-8">
    <c:import url="../temp/style.jsp"></c:import>    
    <title>요금 상세페이지</title>
 <style>
    .boxone {
    width:50%;
    padding-right: 5%;
    }
    .boxtwo {   
    width:50%;
    padding-left: 5%;
    }

    .login-section {
        background-color: #fff;
    }

    .box{
        border:1px solid black;  
    }
    
    .zcustom-box {
        width: 90%;
        border-radius: 10px;
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
        border:1px solid darkgray;
        padding:50px 150px 30px 150px;
        margin:40px;
        background-color: fff;
    }
    .zcustom-box h3 {
        color:black;
        text-align:center;
        margin-right:30px;
        margin-top:20px;
    }
    .zcustom-box li{
        margin-right:10px;
       
    }
    .zcustom-box img {
        width:70%;
        position:al;
    }
    .hbox {
        border-right: 2px lightgray solid;
        margin-left :20px;
        margin-right :20px;   
    }
    .hbox1 {
        border-right: 0px lightgray solid;
        margin-left :20px;  
    }

    .modal-dialog .modal-content{
        width: 70%;
        margin-left:15%;
    }

</style>
</head>

<body class="theme-color2 light ltr">
<c:import url="../temp/header.jsp"></c:import>
    <!-- Breadcrumb section start -->
    <section class="breadcrumb-section section-b-space">
        <ul class="circles">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h3>부가서비스 상세페이지</h3>
                    <nav>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="index.html">
                                    <i class="fas fa-home"></i>
                                </a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">5G</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb section end -->

    <!-- Shop Section start -->
    <section>
        <div class="container">
            <div class="material-details">
                <div class="title title1 title-effect title-left">
                    <h2>부가서비스</h2>
                    
                </div>
            <div class="row gx-4 gy-5">
                <div class="col-12">
                    <div class="details-items">
                        <div class="row g-4">
                            <div class="col-md-12 ">
                                <div class="justify-content-start" style="margin-top:-20px;">
                                    <a href="zyougeumje2_detail_edit.html" class="me-3">수정</a>
                                    <a href="javascript:void(0)" data-bs-toggle="modal"
                                                    data-bs-target="#bugadel">삭제</a>
                                </div>
                                <div class="details-image-concept" >
                                    <span class="text-start" style="font-size:30px; font-weight: 700;">${eplan.extraPlanName}</span>
                                    <span style="font-size:30px; font-weight: 500;"> (보이는 컬러링)</span>
                                </div>
                                <h3 class="text-start" style="color:gray;"> 이제는 눈으로 컬러링을 들어보세요 </h3>
                                <div class="container zcustom-box">
                                    <ul>
                                        <li class="">
                                            <h3> 전화를 걸면 전화를 거는 사람에게 영상이 보이는 컬러링 </h3>
                                        </li>
                                        <li>  
                                            <div class="container text-center" style="margin-right:-140px;">
                                            <div>
                                                <h2 class="theme-color">월 3,300원</h2> 
                                                    <span class="label-text">(부가세 포함)</span>
                                                <div class="" style="margin-top:30px;">
                                                <div class="product-buttons justify-content-center">
                                                <!-- 신청 모달 버튼  start -->
                                                <a href="javascript:void(0)" data-bs-toggle="modal"
                                                    data-bs-target="#bugajoin" class="btn btn-solid hover-solid btn-animation rounded-3">
                                                    <span>신청하기</span> 
                                                </a>
                                                </div>
                                                <div class="product-buttons justify-content-center">
                                                        <span class="btn btn-solid  rounded-3 disabled">이미 사용중인 부가서비스입니다.</span> 
                                                </div> 
                                                </div>
                                            </div> 
                                            </div>
                                        </li> 
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>    
            <div class="container">
                <ul class="product-count shipping-order">
                    <li>
                        <span class="lang">부가서비스는 청구금액에 포함되어 계산됩니다.</span>
                    </li>
                </ul>
                <div class="col-12">
                    <div class="cloth-review">
                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab"
                                    data-bs-target="#desc" type="button">상세정보</button>
                            </div>
                        <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="desc">
                                <div class="shipping-chart">
                                    <div class="part">
                                        <h4 class="inner-title mb-2">유의사항 쓰세요</h4>
                                        <p class="font-light fs-6">써.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
     </div>   
    </section>
    <!-- Shop Section end -->

<!-- 부가서비스 신청 모달창 start -->
    <div class="modal fade payment-modal" id="bugajoin">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="mb-4">
                            <p> 해당 부가서비스는 월 3,300원의 유료서비스로, 신청일부터 서비스가 시작되며 요금이 부과됩니다.</p>
                            <div class="category-option">
                                <div class="accordion category-name" id="accordionExample"> 
                                    <div class="accordion-item category-rating">
                                        <h4 class="accordion-header" id="headingThree">
                                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree">
                                                유의사항
                                            </button>
                                        </h4>
                                        <div id="collapseThree" class="accordion-collapse collapse show" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                                            <div class="accordion-body category-scroll">
                                                <ul class="category-list">
                                                    <li>
                                                        <p>요금제 변경일을 기준으로 1개월 내에는 <br>다른 요금제로 변경이 불가합니다.</p>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                <div class="col-12 ">
                                    <li class="checkbox-list mt-3 ">
                                        <div class="form-check user-checkbox ps-0 ">
                                            <input class="checkbox_animated check-it" type="checkbox" value="" id="flexCheckDefault1">
                                            <label class="form-check-label fw-bolder" for="flexCheckDefault1">위 안내사항을 확인하였습니다.</label>
                                        </div>
                                    </li>
                                </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer pt-0 text-end d-block">
                    <a href="zsuccess_modify.html" ><button class="btn btn-solid-default rounded-1">확인</button></a>
                </div>
            </div>
        </div>
    </div>
    <!-- Add number Modal End -->

    <!-- 부가서비스 삭제 모달창 start -->
    <div class="modal fade payment-modal" id="bugadel">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="mb-4">
                         <h3>정말 삭제하시겠습니까? </h3> <h5>삭제 후에는 복구가 불가합니다.</h5>
                        </div>
                    </form>
                </div>
                <div class="modal-footer pt-0 text-end d-block">
                    <a href="#" ><button class="btn btn-solid-default rounded-1">확인</button></a>
                </div>
            </div>
        </div>
    </div>
    <!-- Add number Modal End -->

<!-- Recommend product 1 -->
<section class="left-sidebar-section masonary-blog-section">
    <div class="container">
        <div class="title title1 title-effect mb-4 title-left">
            <h2>추천상품</h3>
        </div>
            <div class="col-lg-12 col-md-12 order-md-1 ratio_square">
                    <div class="row mb-3 justify-content-center">
                    <div class="col-2">
                        <div class="masonary-blog box-shadow">
                            <div class="card-body card-body-width">
                                <a href="blog-details.html">
                                    <h2 class="card-title">5G 슬림</h2>
                                </a>
                                <h3 class="masonary-name">월 55,000원</h3>
                                <p class="font-light">데이터 8GB 가성비로 이용하는 5G
                                </p>    
                            </div>
                        </div>
                    </div>
                    <div class="col-2">
                        <div class="masonary-blog box-shadow">
                            <div class="card-body card-body-width">
                                <a href="blog-details.html">
                                    <h2 class="card-title">5G 슬림</h2>
                                </a>
                                <h3 class="masonary-name">월 55,000원</h3>
                                <p class="font-light">데이터 8GB 가성비로 이용하는 5G
                                </p>    
                            </div>
                        </div>
                    </div>
                         
                            <div class="col-2">
                                <div class="masonary-blog box-shadow">
                                    <div class="card-body card-body-width">
                                        <a href="blog-details.html">
                                            <h2 class="card-title">5G 슬림</h2>
                                        </a>
                                        <h3 class="masonary-name">월 55,000원</h3>
                                        <p class="font-light">데이터 8GB 가성비로 이용하는 5G
                                        </p>    
                                    </div>
                                </div>
                            </div>

                    <div class="col-2">
                        <div class="masonary-blog box-shadow">
                            <div class="card-body card-body-width">
                                <a href="blog-details.html">
                                    <h2 class="card-title">5G 슬림</h2>
                                </a>
                                <h3 class="masonary-name">월 55,000원</h3>
                                <p class="font-light">데이터 8GB 가성비로 이용하는 5G
                                </p>    
                            </div>
                        </div>
                    </div>


                    <div class="col-2">
                        <div class="masonary-blog box-shadow">
                            <div class="card-body card-body-width">
                                <a href="blog-details.html">
                                    <h2 class="card-title">5G 슬림</h2>
                                </a>
                                <h3 class="masonary-name">월 55,000원</h3>
                                <p class="font-light">데이터 8GB 가성비로 이용하는 5G
                                </p>    
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
         
        </div>
    </div>
</section>
<!-- recommend product 1 end -->
<c:import url="../temp/footer.jsp"></c:import>
</body>

</html>