<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en">

<head>
	<meta charset="UTF-8">
    <c:import url="../temp/style.jsp"></c:import>
    <title>상품등록</title>
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
                    <h3>악세사리 등록</h3>
                    <nav>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="index.html">
                                    <i class="fas fa-home"></i>
                                </a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">상품 > 상품등록</li>
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
                <div class="col-lg-7" >
                    <h3 class="mb-3 fw-bold">상품</h3>
                    <form action="./accessoryUpdate" method="post" enctype="multipart/form-data" class="needs-validation" onsubmit="return generateDirectCode(event)" id="form">
                        <div class="row g-4">
                            <!-- 상품 정보 -->
                            <div class="col-md-6">
                                <label for="categoryCode" class="form-label" >카테고리</label>
                                <div class="col-12">
                                    <select class="form-select custome-form-select" id="categoryCode" name="categoryCode">
                                        <option value="02" ${list.get(0).getCategoryCode().equals("02") ? 'selected' : ''}>음향기기</option>  
                                        <option value="03" ${list.get(0).getCategoryCode().equals("03") ? 'selected' : ''}>충전기기</option>                                   
                                        <option value="04" ${list.get(0).getCategoryCode().equals("04") ? 'selected' : ''}>워치</option>                                   
                                        <option value="05" ${list.get(0).getCategoryCode().equals("05") ? 'selected' : ''}>케이스/기타</option>                                   
                                                                         
                                    </select>
                                </div>
                            </div> 
                            <div class="col-md-6">
                                <label for="brandCode" class="form-label" >브랜드</label>
                                <div class="col-12">
                                    <select class="form-select custome-form-select" id="brandCode" name="brandCode">
                                        <option value="S" ${list.get(0).getBrandCode().equals("S") ? 'selected' : ''}>삼성</option>
								        <option value="A" ${list.get(0).getBrandCode().equals("A") ? 'selected' : ''}>애플</option>
                                        <option value="0" ${list.get(0).getBrandCode().equals("0") ? 'selected' : ''}>해당 없음</option>
                                        
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label for="directName" class="form-label">상품명</label>
                                <input type="text" class="form-control" id="directName" placeholder="상품명" name="directName" value="${list.get(0).getDirectName()}" readonly="readonly">
                            </div>
                            <div class="col-md-6">
                                <label for="directCode" class="form-label">제품코드</label>
                                <input type="text" class="form-control" id="productCode" placeholder="ex) G2301" value="${directVO.slicedCode}" readonly="readonly">
                            </div>
                            <div class="col-md-2 mt-5 d-flex ">
                            	<button type="button" class="btn btn-outline-danger btn-sm mt-2 me-2" id="optionAdd">+옵션추가</button>    
                            	<button type="button" class="btn btn-outline-secondary btn-sm mt-2" id="optionDelete">-옵션삭제</button>                                                   
                            </div>

                            <div class="option">
								<c:forEach items="${list}" var="directCode" varStatus="index"> 
									<div class="row g-2 my-2 options">
						    			<div class="col-md-4">
								            <div class="col-12">
								                <select class="form-select custome-form-select" name="colorCode">
								                	
								                	<option value="0" ${directCode.colorCode == '0' ? 'selected' : ''}>없음</option>
								                    <option value="W" ${directCode.colorCode == 'W' ? 'selected' : ''}>white</option>
										            <option value="G" ${directCode.colorCode == 'G' ? 'selected' : ''}>gray</option>
										            <option value="B" ${directCode.colorCode == 'B' ? 'selected' : ''}>black</option>
								                </select>
								             </div>
								        </div>  
								                <select class="form-select custome-form-select" name="saveCapacity" hidden>
										            <option value="000" selected="" >없음</option>
								                </select>
								     
								       
								        <div class="col-md-4">
								            <input type="text" class="form-control" name="directPrice" value="${directCode.directPrice}" placeholder="금액 숫자만 입력"> 
								        </div>
								        <div class="col-md-4">
								            <input type="text" class="form-control" name="directStock" value="${directCode.directStock}" placeholder="재고 숫자만 입력">
								        </div> 
								        <input type="hidden" id="directCode" name="directCode">
								     </div>
															
                           		</c:forEach> 
    							
                            </div>
							
                            
                            
                                <div class="mb-2">
                                    <label for="directThumbFilePath" class="form-label">썸네일 이미지</label>
                                    <input class="form-control" type="file" id="directThumbFilePath" name="multipartFiles">
                                </div>
                                <div class="mb-3">
                                    <label for="directFilePath" class="form-label">상품 이미지</label>
                                    <input class="form-control" type="file" id="directFilePath" name="multipartFiles">
                                </div>
            
                            <!-- 상세정보 서머노트하자 -->
                            <div class="col-md-12">
                                <label for="directContents" class="form-label">상세정보</label>
                                <textarea class="form-control col-md-12" name="directContents" id="directContents" cols="100" rows="10"></textarea>
                            </div>

                            <!-- 확인버튼 -->
                            <div class="col-12 d-flex justify-content-center">
                                <button type="submit" class="btn btn-solid-default mx-auto" id="btn2">등록하기</button>
                            </div> 
                        </div>
                    </form>
                    </div>
                </div>
            </div>
        </section>
    <!-- Shop Section end -->       
<c:import url="../temp/footer.jsp"></c:import>


<script>	
	//옵션 추가
	$('#optionAdd').click(()=>{
        let child = `
        			<div class="row g-2 my-2 options">
        			<div class="col-md-4">
			            <div class="col-12">
			                <select class="form-select custome-form-select" name="colorCode" value="${option.colorCode}">
			                    <option selected="" value="0">없음</option>
			                    <option value="W">white</option>
			                    <option value="G">gray</option>
			                    <option value="B">black</option>
			                </select>
			            </div>
			        </div> 

			                <select class="form-select custome-form-select" name="saveCapacity" value="${option.saveCapacity}" hidden>
			                    <option selected="" value="000">없음</option>
			                </select>

			        <div class="col-md-4">
			            <input type="text" class="form-control" name="directPrice" value="${option.directPrice}" placeholder="금액 숫자만 입력"> 
			        </div>
			        <div class="col-md-4">
			            <input type="text" class="form-control" name="directStock" value="${option.directStock}" placeholder="재고 숫자만 입력">
			        </div> 
			        <input type="hidden" id="directCode" name="directCode">
			        </div>

			      `;
					
        $('.option').append(child);
	})
	
	//옵션 삭제 
	$('#optionDelete').click(()=>{
		$('.options').last().remove();
	});
	
	//제품코드 합치기 
    function generateDirectCode(event) {
        event.preventDefault();
        
        let options = document.getElementsByName("colorCode");
        for (let i = 0; i < options.length; i++) {

            let categoryCode = document.getElementById("categoryCode").value;
            let brandCode = document.getElementById("brandCode").value;
            let colorCode = document.getElementsByName("colorCode")[i].value;
            let saveCapacity = document.getElementsByName("saveCapacity")[i].value;
            let productCode = document.getElementById("productCode").value;

            let directCode = "P" + categoryCode + "B" + brandCode + "C" + colorCode + "V" + saveCapacity + productCode;

            document.getElementsByName("directCode")[i].value = directCode;
          }

          // 폼 데이터를 서버로 전송
          document.getElementById("form").submit();
        }
	
</script>

<script>
	//썸머노트 
	$('#directContents').summernote({
        placeholder: '상세 내용을 입력해주세요.',
        tabsize: 2,
        height: 300,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
        ]
      });
</script>

</body>

</html>