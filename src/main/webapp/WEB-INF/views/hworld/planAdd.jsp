<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en">
<head>
	<meta charset="UTF-8">
    <c:import url="../temp/style.jsp"></c:import>
 
 <style>
    .input-container {
        position: relative;
    }
    
    .input-container::before {
        content: "원";
        position: absolute;
        top: 50%;
        right: 10px;
        transform: translateY(-50%);
        color: #999999;
    }
    
    .input-field {
        padding-right: 30px; /* '원' 글자를 고려하여 오른쪽 padding 추가 */
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
                    <h3>요금제 등록</h3>
                    <nav>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="index.html">
                                    <i class="fas fa-home"></i>
                                </a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">요금제</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb section end -->

    <!-- Shop Section start -->
    <section class="section-b-space">
        <div class="container">
            <div class="row g-4 justify-content-center">
                <div class="col-lg-6" >
                    <h3 class="mb-3 fw-bold">요금제</h3>
                    <form action="./planAdd" method="POST" class="planAdd">
                        <div class="row g-4">
                            <!-- 요금제 정보 -->
                            <table id="commonCodeTable">
                               <thead>
                               <tr class="table-head col-md-12">
                               <th class="col-3">Type </th>
                               <th class="col-3">Code</th> 
                               <th class="col-3">Value</th> 
                               <th class="col-3">Note</th>
                                </tr>
                               </thead>
                               <tbody>
                               
                                <c:forEach items="${commonCode}" var="common">
                                <tr class="code-row">	
                                		<td class="code-row">${common.type}</td>
                                		<td class="code-row">${common.code}</td>
                                		<td class="code-row">${common.value}</td>
                                		<td class="code-row">${common.note}</td>
                                </tr>
                                </c:forEach>
                                
                                </tbody>
                                </table> 
                            <div class="col-md-6">
                                <label for="validationCustom04" class="form-label" >종류</label>
                                
                                <div class="col-12">
                                    <select class="form-select custome-form-select" id="validationCustom04">
                                        <option selected="" value="G">5G 요금제</option>
                                        <option value="S">시니어 요금제</option>
                                        <option value="T">청소년 요금제</option>
                                        <option value="Z">ZEM 요금제</option>
                                        <option value="H">군인 요금제</option>
                                        <option value="W">복지 요금제</option>
                                    </select>
                                </div>
                               
                              <input type="hidden" id="planNum" name="planNum" value=""> 
                            </div>
                             <!-- 월요금 -->
                             <div class="col-md-6">
                                <label for="planPrice" class="form-label">월 가격</label>
                                <input type="text" class="form-control" id="planPrice" placeholder="월 요금제">
                            </div>
                            <div class="col-md-6">
                                <label for="planName" class="form-label">이름</label>
                                <input type="text" class="form-control" id="planName" placeholder="요금제명">
                            </div>
                            <div class="col-md-6">
                                <label for="planExplainS" class="form-label">부가설명</label>
                                <input type="text" class="form-control" id="planExplainS" placeholder="간략소개">
                            </div>
                            <!-- 한 줄 -->
                            <div class="col-md-12">
                                <label for="planExplain" class="form-label">한 줄 설명</label>
                                <input type="text" class="form-control" id="planExplain" >
                            </div>
                            <!-- 데이터량 -->
                            
                            <div class="col-md-4">
                                <label for="dataCapacity" class="form-label">데이터량</label>
                                <input type="text" class="form-control" id="dataCapacity" value="GB">
                            </div>
                            <div class="col-md-4">
                                <label for="" class="form-label">통화량</label>
                                <input type="text" class="form-control disabled" id="" value="기본제공" >
                            </div>
                            <div class="col-md-4">
                                <label for="lnum" class="form-label">문자량</label>
                                <input type="text" class="form-control" id="fnum" value="기본제공">
                            </div>
                          
                            <!-- 상세정보 서머노트하자 -->
                            <div class="col-md-12">
                                <label for="fnum" class="form-label">상세정보</label>
                                <textarea class="form-control col-md-12" name="" id="" cols="100" rows="10" readonly> 서머노트로 상세정보 입력할예정</textarea>
                            </div>

                            <!-- 확인버튼 -->
                            <div class="col-12 d-flex justify-content-center">
                                <button class="btn btn-solid-default mx-auto" id="btn2">등록하기</button>
                            </div>     
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>


<c:import url="../temp/footer.jsp"></c:import>

<script>
$(document).ready(function() {
	  // 셀렉트 박스 선택 시 공통 코드 리스트 가져오기
	  $("#validationCustom04").on("change", function() {
	    var selectedType = $(this).val();
	    loadCommonCodes(selectedType);
	    generatePlanNum(selectedType);
	  });
	});

	// AJAX 호출하여 공통 코드 리스트 가져오기
	function loadCommonCodes(selectedType) {
	  $.ajax({
	    url: "./getCommonCode",
	    method: "POST",
	    data: { type: selectedType },
	    dataType: "json",
	    success: function(commonCodeList) {
	      displayCommonCode(commonCodeList);
	    },
	    error: function() {
	      console.error("Failed to get common code list.");
	    }
	  });
	}

	// 가져온 공통 코드 리스트를 동적으로 표시
function displayCommonCode(commonCodeList) {
  const tableBody = $("#commonCodeTable tbody");
  tableBody.empty();
  let lastCode = "";
  for (let i = 0; i < commonCodeList.length; i++) {
    const type = commonCodeList[i].type;
    const code = commonCodeList[i].code;
    console.log(code);
    const value = commonCodeList[i].value;
    const note = commonCodeList[i].note;
    const row = $("<tr>").addClass("code-row");
    $("<td>").text(type).appendTo(row);
    $("<td>").addClass("code-cell").text(code).appendTo(row); // 코드 셀에 클래스 추가
    $("<td>").text(value).appendTo(row);
    $("<td>").text(note).appendTo(row);
    row.appendTo(tableBody);
    
    // 마지막 코드 값 갱신
    lastCode = code;
  }
  
  // 생성한 planNum을 hidden 필드에 설정
  generatePlanNum(lastCode);
}

	
function generatePlanNum(lastCode) {
	  let nextCode = parseInt(lastCode) + 1; // 마지막 코드 값의 다음 값 계산
	  let selectedType = $("#validationCustom04").val(); // 선택한 타입 값 가져오기
	  let planNum = selectedType + ("0" + nextCode).slice(-2); // 새로운 planNum 생성

	  $("#planNum").val(planNum); // 생성한 planNum을 hidden 필드에 설정
	}	
</script>
<!-- <script>
function generatePlanNum() {
	  var type = document.getElementById("validationCustom04").value; // 선택한 타입 값 가져오기
	  var codes = document.getElementById("codeOptions").options; // 코드 셀렉트 박스 옵션들 가져오기
	  var lastCode = codeOptions[codeOptions.length - 1].value; // 마지막 코드 값 가져오기
	  var nextCode = parseInt(lastCode) + 1; // 마지막 코드 값의 다음 값 계산

	  var planNum = type + ("0" + nextCode).slice(-2); // 새로운 planNum 생성
		console.log(planNum);
	  document.getElementById("planNum").value = planNum; // 생성한 planNum을 hidden 필드에 설정
	}

</script> -->
</body>

</html>