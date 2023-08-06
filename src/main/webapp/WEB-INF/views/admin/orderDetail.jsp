<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
	<meta charset="UTF-8">
   	<c:import url="adminStyle.jsp"></c:import>  
</head>

<body>
   <c:import url="adminHeader.jsp"></c:import>  
		<c:forEach var="orderVO" items="${orderDetail}">
		<c:forEach var="orderDirectVOs" items="${orderVO.orderDirectVOs}">
        <c:forEach var="directVOs" items="${orderVO.directVOs}">
            <!-- tracking section start -->
            <div class="page-body">
                <div class="title-header title-header-block package-card">
                    <div>
                        <h5>주문번호 #${orderVO.orderNum}</h5>
                    </div>
                    <div class="card-order-section">
                        <ul>
                        	<li>
                                <fmt:formatDate value="${orderVO.orderDate}" pattern="yyyy/MM/dd" var="formattedDate" />
                                <span style="font-weight:400;">${formattedDate}</span>
                            </li>
	                                                 
                            <li>총 가격 ${orderVO.orderFinalPrice}</li>
                        </ul>
                    </div>
                </div>

                <!-- tracking table start -->
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="bg-inner cart-section order-details-table">
                                        <div class="row g-4">
                                            <div class="col-xl-8">
                                                <div class="table-responsive table-details">
                                                    <table class="table cart-table table-borderless">
                                                        <thead>
                                                            <tr>
                                                                <th colspan="2">상품</th>
                                                                <th class="text-end" colspan="3">

                                                                </th>
                                                            </tr>
                                                        </thead>

                                                        <tbody>
                                                            <tr class="table-order">
                                                                <td>
                                                                    <!-- <a href="javascript:void(0)">
                                                                        <img src="/admin/images/profile/1.jpg"
                                                                            class="img-fluid blur-up lazyload" alt="">
                                                                    </a> -->
                                                                </td>
                                                                <td>
                                                                    <p>제품명</p>
                                                                    <h5>${directVOs.directName}</h5>
                                                                </td>
                                                                <td>
                                                                    <p>수량</p>
                                                                    <h5>${orderDirectVOs.orderAmount}</h5>
                                                                </td>
                                                                <td>
                                                                    <p>가격</p>
                                                                    <h5>${directVOs.directPrice * orderDirectVOs.orderAmount}</h5>
                                                                </td>
                                                                <td>
                                                                </td>
                                                            </tr>                                                            
                                                        </tbody>

                                                        <tfoot>                                                            
                                                            <tr class="table-order">
                                                                <td colspan="3">
                                                                    <h4 class="theme-color fw-bold">총 액 :</h4>
                                                                </td>
                                                                <td>
                                                                    <h4 class="theme-color fw-bold">$6935.00</h4>
                                                                </td>
                                                            </tr>
                                                        </tfoot>
                                                    </table>
                                                </div>
                                            </div>

                                            <div class="col-xl-4">
                                                <div class="order-success">
                                                    <div class="row g-4">
                                                        <h4>주문 내역</h4>
                                                        <ul class="order-details">
                                                            <li>주문 번호: ${orderVO.orderNum}</li>
                                                            <li>
								                                <fmt:formatDate value="${orderVO.orderDate}" pattern="yyyy/MM/dd" var="formattedDate" />
								                                <span style="font-weight:400;">주문 날짜: ${formattedDate}</span>
								                            </li>
                                                            <li>주문 가격: ${orderVO.orderFinalPrice}</li>
                                                        </ul>

                                                        <h4>배송지</h4>
                                                        <ul class="order-details">
                                                            <li>(${orderVO.orderAddress1})</li>
                                                            <li>${orderVO.orderAddress2}</li>
                                                            <li>${orderVO.orderAddress3}</li>
                                                        </ul>

                                                        <h4>받는이 【연락처】</h4>
                                                        <ul class="order-details">
                                                        	<li>${orderVO.orderReceiver} 【 ${orderVO.orderTelNum} 】</li>
                                                        </ul>
                                                        
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- section end -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- tracking table end -->
            </div>
        </c:forEach>
        </c:forEach>
        </c:forEach>
            <!-- tracking section End -->
            

  
<c:import url="adminFooter.jsp"></c:import>  

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

<!-- Sidebar js -->
<script src="/admin/js/config.js"></script>

<!-- Plugins js -->
<script src="/admin/js/sidebar-menu.js"></script>


<!-- Theme js -->
<script src="/admin/js/script.js"></script>
</body>

</html>