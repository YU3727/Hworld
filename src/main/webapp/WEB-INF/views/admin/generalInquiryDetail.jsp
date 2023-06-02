<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
	<meta charset="UTF-8">
   <c:import url="adminStyle.jsp"></c:import>  

</head>


<body>
   <c:import url="adminHeader.jsp"></c:import>  

        <!-- Page Body Start-->
        <div class="page-body-wrapper">
            <!-- Page Sidebar Start-->
            <div class="sidebar-wrapper">
                <div>
                    <div class="logo-wrapper logo-wrapper-center">
                        <a href="index.html" data-bs-original-title="" title="">
                            <img class="img-fluid for-dark" src="/admin/images/logo/logo-white.png" alt="">
                        </a>
                        <div class="back-btn">
                            <i class="fa fa-angle-left"></i>
                        </div>
                        <div class="toggle-sidebar">
                            <i class="status_toggle middle sidebar-toggle" data-feather="grid"></i>
                        </div>
                    </div>
                    <div class="logo-icon-wrapper">
                        <a href="index.html">
                            <img class="img-fluid main-logo" src="/admin/images/logo/logo.png" alt="logo">
                        </a>
                    </div>
                    <nav class="sidebar-main">
                        <div class="left-arrow" id="left-arrow">
                            <i data-feather="arrow-left"></i>
                        </div>

                        <div id="sidebar-menu">
                            <ul class="sidebar-links" id="simple-bar">
                                <li class="back-btn"></li>


                                <li class="sidebar-list">
                                    <a class="sidebar-link sidebar-title link-nav" href="adminHome">
                                        <i data-feather="home"></i>
                                        <span>홈</span>
                                    </a>
                                </li>

                                <li class="sidebar-list">
                                    <a class="sidebar-link sidebar-title" href="javascript:void(0)">
                                        <i data-feather="users"></i>
                                        <span>회원</span>
                                    </a>
                                    <ul class="sidebar-submenu">
                                        <li>
                                            <a href="memberList">회원 목록</a>
                                        </li>
                                        <li>
                                            <a href="phoneList">회선 목록</a>
                                        </li>
                                        <li>
                                            <a href="memberAdd">회원 추가</a>
                                        </li>
                                    </ul>
                                </li>


                                <li class="sidebar-list">
                                    <a class="sidebar-link sidebar-title link-nav" href="orderList">
                                        <i data-feather="archive"></i>
                                        <span>주문</span>
                                    </a>
                                    <!-- <ul class="sidebar-submenu">
                                        <li>
                                            <a href="">Order List</a>
                                        </li>
                                        <li>
                                            <a href="order-detail.html">Order Detail</a>
                                        </li>
                                        <li>
                                            <a href="order-tracking.html">Order Tracking</a>
                                        </li>
                                    </ul> -->
                                </li>

                                <li class="sidebar-list">
                                    <a class="linear-icon-link sidebar-link sidebar-title" href="javascript:void(0)">
                                        <i data-feather="box"></i>
                                        <span>상품</span>
                                    </a>
                                    <ul class="sidebar-submenu">
                                        <li>
                                            <a href="productList">상품 목록</a>
                                        </li>

                                        <li>
                                            <a href="productReview">상품 리뷰</a>
                                        </li>
                                    </ul>
                                </li>

                                <li class="sidebar-list">
                                    <a class="linear-icon-link sidebar-link sidebar-title" href="javascript:void(0)">
                                        <i data-feather="phone"></i>
                                        <span>문의</span>
                                    </a>
                                    <ul class="sidebar-submenu">
                                        <li>
                                            <a href="productInquiry">상품 문의</a>
                                        </li>
                                        <li>
                                            <a href="generalInquiry">일반 문의</a>
                                        </li>
                                    </ul>
                                </li>
                        
                                <li class="sidebar-list">
                                    <a class="linear-icon-link sidebar-link sidebar-title" href="javascript:void(0)">
                                        <i data-feather="archive"></i>
                                        <span>납부</span>
                                    </a>
                                    <ul class="sidebar-submenu">
                                        <li>
                                            <a href="paymentList">납부 목록</a>
                                        </li>
                                        <li>
                                            <a href="unpaidList">미납 목록</a>
                                        </li>
                                    </ul>
                                </li>
                                



                                <li class="sidebar-list">
                                    <a class="linear-icon-link sidebar-link sidebar-title" href="javascript:void(0)">
                                        <i data-feather="settings"></i>
                                        <span>설정</span>
                                    </a>
                                    <ul class="sidebar-submenu">
                                        <li>
                                            <a href="profileSetting">프로필 설정</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="right-arrow" id="right-arrow">
                            <i data-feather="arrow-right"></i>
                        </div>
                    </nav>
                </div>
            </div>
            <!-- Page Sidebar Ends-->


            <!-- Page Sidebar Start -->
            <div class="page-body">
                <div class="title-header">
                    <h5>일반 문의</h5>
                </div>
                <!-- New User start -->
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                                                <li class="nav-item" role="presentation">
                                                    <button class="nav-link active" id="pills-home-tab"
                                                        data-bs-toggle="pill" data-bs-target="#pills-home"
                                                        type="button">문의 내용</button>
                                                </li>
                                            </ul>

                                            <div class="tab-content" id="pills-tabContent">
                                                    <form class="theme-form theme-form-2 mega-form radio-section">
                                                        <div class="row">
                                                            <div class="mb-4 row align-items-center">
                                                                <label
                                                                    class="form-label-title col-lg-2 col-md-3 mb-0">작성자</label>
                                                                    admin@gmail.com
                                                            </div>
                                                            <div class="mb-4 row align-items-center">
                                                                <label
                                                                    class="form-label-title col-lg-2 col-md-3 mb-0">작성날짜</label>
                                                                    2023/10/05
                                                            </div>
                                                            <div class="mb-4 row align-items-center">
                                                                <label
                                                                    class="form-label-title col-lg-2 col-md-3 mb-0">제목</label>
                                                                    입영 통지서 제출합니다.
                                                            </div>

                                                            <div class="mb-4 row align-items-center">
                                                                <label
                                                                    class="col-lg-2 col-md-3 col-form-label form-label-title">내용</label>
                                                                갑자기 군대를 가게 되어서 입영 통지서 제출합니다.
                                                            </div>

                                                            <div class="mb-4 row align-items-center">
                                                                <label
                                                                    class="col-lg-2 col-md-3 col-form-label form-label-title">답변</label>
                                                                <div class="col-md-9 col-lg-9">
                                                                    <textarea class="row" rows="10" style = "width: 100%;" ></textarea>
                                                                </div>
                                                            </div>

                                                            
                                                            </form>
                                                        </div>
                                                    </div>

                                                <div class="card-footer text-end border-0 pt-0">
                                                    <button class="btn btn-primary me-3" type="submit">답변 작성</button>
                                                    <button class="btn btn-outline-primary" type="button">취소</button>
                                                </div>
                                            
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- footer start -->
                   <c:import url="adminHeader.jsp"></c:import>  
                </div>
                <!-- New User End -->

            </div>
            <!-- Page Sidebar End -->
        </div>
    </div>
    <!-- page-wrapper End -->


    <!-- latest js -->
    <script src="/admin/js/jquery-3.6.0.min.js"></script>

    <!-- Bootstrap js -->
    <script src="/admin/js/bootstrap/bootstrap.bundle.min.js"></script>

    <!-- feather icon js -->
    <script src="/admin/js/icons/feather-icon/feather.min.js"></script>
    <script src="/admin/js/icons/feather-icon/feather-icon.js"></script>

    <!-- scrollbar simplebar js -->
    <script src="/admin/js/scrollbar/simplebar.js"></script>
    <script src="/admin/js/scrollbar/custom.js"></script>

    <!-- Sidebar js-->
    <script src="/admin/js/config.js"></script>

    <!-- Plugins JS -->
    <script src="/admin/js/sidebar-menu.js"></script>
   

    <!--Dropzon js -->
    <script src="/admin/js/dropzone/dropzone.js"></script>
    <script src="/admin/js/dropzone/dropzone-script.js"></script>

    <!-- Theme js -->
    <script src="/admin/js/script.js"></script>
</body>

</html>