$(document).ready(function() {

    //console.log('myPage js 실행');

    //대표회선의 납부금액 합계 구하기 - 미납금액의 총합
    let totalPrice = 0;
    $('.unpaid').each(function(){
        let value = $(this).text().replace(/[^0-9]/g, '');
        console.log(value);
        totalPrice += parseInt(value);
        $('#totalUnpaid').text(totalPrice.toLocaleString()+" 원");
    })

});
//document.ready 끝


//////이벤트부
////요금 청구/납부
//즉시 납부 버튼 클릭
$('#insPayment').click(function(){
    console.log('즉시 납부 버튼 클릭');
})


//비밀번호 변경 버튼을 누르고, 확인을 누른 경우
$('#updatePwBtn').click(function(){
    console.log('비밀번호 변경 클릭');

    let pw = $('#pw').val();
    let pwCheck = $('#pwCheck').val();

    chkPw = isEmpty(pw);
    chkPwCheck = isEmpty(pwCheck);

    if(chkPw && chkPwCheck && pw == pwCheck){
        //폼 전송
        $('#updatePwForm').submit();
    }else{
        alert("값을 확인해주세요");S
        $('#pw').val('');
        $('#pwCheck').val('');
    }

})


//정보 변경 버튼을 누르고, 확인을 누른 경우
$('#updateInfoBtn').click(function(){
    console.log('정보 변경 클릭');

    let tel = $('#tel').val();
    let address1 = $('#address1').val();
    let address2 = $('#address2').val();
    let address3 = $('#address3').val();

    chkTel = isEmpty(tel);
    chkAdd1 = isEmpty(address1);
    chkAdd2 = isEmpty(address2);
    chkAdd3 = isEmpty(address3);

    if(chkTel && chkAdd1 && chkAdd2 && chkAdd3){
        //폼 전송
        $('#updateInfoForm').submit();
    }else{
        alert("값을 입력해주세요");
        $('#tel').val('');
        $('#address1').val('');
        $('#address2').val('');
        $('#address3').val('');
    }

})



//유효성 검사
//전화번호 11자리, 숫자만 입력
$('#tel').on("blur", function() {
    //숫자만 입력되게 하는 정규식
    let checkValue = $(this).val().replace(/[^\d]/g, "");
    $(this).val(checkValue);
    
    let length = checkValue.length;

    if(length != 11) {
        $('#tel').val("");
        $('#telResult').empty();
        $('#telResult').append('<p class="theme-color">전화번호는 11자리여야 합니다.</p>');
    }else{
        $('#telResult').empty();
    }
});



//번호변경 모달창 검사
//유효성 검사
//전화번호 11자리, 숫자만 입력 + 중복검사까지 ajax로 실행
$('#numChangeValue').on("blur", function() {
    //숫자만 입력되게 하는 정규식
    let inputValue = $(this).val().replace(/[^\d]/g, "");
    $(this).val(inputValue);
    
    let length = inputValue.length;

    if(length !== 11) {
        //this.setCustomValidity("전화번호는 11자리여야 합니다.");
        //alert("전화번호는 11자리여야 합니다.");
        $('#numChangeValue').val('');
        $('#searchResult').empty();
        $('#searchResult').append('<p class="theme-color">전화번호는 11자리여야 합니다.</p>');
    }else{
        //11자리인 경우 번호 중복체크
        //responseBody에 담겨져 응답 돌아옴
        $.ajax({
            type: 'GET',
            url: './isChangeableNum',
            dataType: 'JSON',
            data: {
                phoneNum: inputValue
            },
            success: function(response) {
                //console.log('요청 성공');
                //console.log(response);
                if(response == true){
                    $('#searchResult').empty().append('<p class="theme-color">사용 불가능한 번호입니다</p>');
                    $('#checkAllowed').val('false');
                }else if(response == false){
                    $('#searchResult').empty().append('<p>사용 가능한 번호입니다</p>');
                    $('#checkAllowed').val('true'); //이 값이 true일 때 변경창 작동하게끔 만들기
                }else{
                    $('#searchResult').empty();
                    $('#checkAllowed').val('false');
                }
            },
            error: function(error) {
                console.log('요청 실패');
            }
        });
    }

});


//번호 변경할 때 번호 변경 입력창 비우기
$('.numChange').click(function(){
    //새로 버튼을 누를 때 마다 값을 비워주기
    $('#numChangeValue').val('');
    $('#searchResult').empty();
    $('#checkAllowed').val('');
})


//번호 변경하기
$('#executiveChangeNumber').click(function() {
    $('#numChangeValue').blur();
    let checkAllowed = $('#checkAllowed').val();
    let inputValue = $('#numChangeValue').val();
    console.log("값 성공?", checkAllowed);

    //번호 중복 없이 변경 가능한 경우
    if(checkAllowed=='true'){
        console.log('중복없음');
        console.log(inputValue);

        //번호 변경하는 ajax
        // $.ajax({
        //     type: 'POST',
        //     url: './changeNum',
        //     dataType: 'JSON',
        //     data: {
        //         phoneNum: inputValue
        //     },
        //     success: function(response) {
        //         //console.log('요청 성공');
        //         //console.log(response);
        //         if(response == true){
        //             $('#searchResult').empty().append('<p class="theme-color">사용 불가능한 번호입니다</p>');
        //             $('#checkAllowed').val('false');
        //         }else if(response == false){
        //             $('#searchResult').empty().append('<p>사용 가능한 번호입니다</p>');
        //             $('#checkAllowed').val('true'); //이 값이 true일 때 변경창 작동하게끔 만들기
        //         }else{
        //             $('#searchResult').empty();
        //             $('#checkAllowed').val('false');
        //         }
        //     },
        //     error: function(error) {
        //         console.log('요청 실패');
        //     }
        // });

    }else{
        console.log('이게 보이면 안됨');
    }
});


//대표회선 변경 changeKingNum
$('#changeKingNum').click(function(){

    //어떤 번호로 변경하려는지 라디오 버튼이 체크된 것의 value 가져오기 - 잘 가져와짐
    let selPhoneNum = $("input[name='phoneNum']:checked"). val();
    //console.log(selPhoneNum);

    //selPhoneNum으로 대표 번호 변경하기 작업
    //근데 이거 이렇게 할거면 모달을 만들 필요가 있나 싶기도 하고 흠; 나중에 체크하기
    if(selPhoneNum){
        //변경할 번호가 선택 되었을 때 
        console.log('선택된 번호', selPhoneNum);
        //대표회선을 변경을 요청하는 ajax
        $.ajax({
            type: 'post',
            url: './changeKingNum',
            dataType: 'JSON',
            data: {
                phoneNum: selPhoneNum
            },
            success: function(response) {
                //변경에 성공하면 번호변경에 성공했다는 모달 띄우기
                //업데이트 성공(result값이 1이상), 실패(0)로 구분짓기
                console.log(response);
                if(response == 1){
                    //기존 모달창 숨기고 새 모달 띄우기
                    $('#kingModal').modal('hide');
                    $('#kingChangeDoneModal').modal('show');
                    $('.kingCheck').click(function(){
                        window.location.href = '/myPage/home';
                    })
                } else {
                    //변경에 실패함
                    $('#kingModal').modal('hide');
                    $('#kingChangeFailModal').modal('show');
                    $('.kingCheck').click(function(){
                        window.location.href = '/myPage/home';
                    })
                }
            },
            error: function(error) {
            //에러 발생
            console.log(error);
            alert('문제가 발생했습니다.');
            window.location.href = '/myPage/home';
            }
        });
    } else {
        //변경할 번호가 선택 되지 않았을 때 동작
        console.log('선택된 번호가 없어요');
    }
})


//회선 일시정지
$('#stopTelephone').click(function(){
    console.log('일시정지 하기');
    //정지를 눌렀을 때, 일시정지 상태인지 아닌지 판별해서 정지기능을 보여줄지, 해제기능을 보여줄지 정해야 함.
    //우선 정지먼저 해보자

    //어떤 번호를 일시정지 할지 선택(지금은 대표회선만 되긴 함 - 여기에 값 추가해야함)
    //일시정지 하려는 번호를 선택자로 가져와야함 - 반복문 내에 input tag로 selectedValue를 class명으로넣고, value값을 각각 지정해서 선택자로 selectedValue 값을 가져오면 해당 번호를 받아올 수 있게끔 해봄
    let selPhoneNum = $('.selectedValue').val();

    //마지막 일시정지 날로부터 기간 계산 후 조건에 맞으면 ajax 요청이 실행되고, 조건에 맞지 않으면 안내 문구 출력

    //일시정지 요청 ajax - 조건에 만족하는 경우
    $.ajax({
        type: 'post',
        url: './stopTelephone',
        dataType: 'JSON',
        data: {
            phoneNum: selPhoneNum
        },
        success: function(response) {
            //일시정지 시작날짜 컬럼에 값 추가하기 - 시작 날짜에 값이 있고, 종료날짜에 값이 없으면 취소가 나오게끔
            //업데이트 성공(result값이 1이상), 실패(0)로 구분짓기
            console.log(response);
            if(response == 1){
                //기존 모달창 숨기고 새 모달 띄우기
            } else {
                //변경에 실패함
            }
        },
        error: function(error) {
        //에러 발생
        console.log(error);
        alert('문제가 발생했습니다.');
        window.location.href = '/myPage/home';
        }
    });
})



//유효성 검사
//rrnl 7자리, 숫자만 입력
// $('#rrnl').on("blur", function() {
//     //숫자만 입력되게 하는 정규식
//     let checkValue = $(this).val().replace(/[^\d]/g, "");
//     $(this).val(checkValue);
    
//     let length = checkValue.length;

//     if(length != 7) {
//         $('#rrnl').val("");
//         $('#rrnlResult').empty();
//         $('#rrnlResult').append('<p class="theme-color">주민번호 뒷자리는 7자리여야 합니다.</p>');
//         //유효성검사용 체크값 false로 입력
//     }else{
//         $('#rrnlResult').empty();
//     }
// });



//////함수부


//빈값 체크
function isEmpty(value){
    if(typeof value == "undefined" || value == null || value == '')
        return false;
    else
        return true;
}


//비밀번호?
function fnSubmit() {

    if ($("#npw").val() != "" && $("#pwCheck").val() == "") {
        alert("비밀번호 확인을 입력해주세요.");
        $("#npw").focus();
        return false;
    }

    if ($("#npw").val() == "" && $("#pwCheck").val() != "") {
        alert("비밀번호를 입력해주세요.");
        $("#pwCheck").focus();
        return false;
    }

    if ($("#npw").val() != $("#pwCheck").val()) {
        alert("비밀번호가 일치하지 않습니다.");
        $("#pwCheck").focus();
        return false;
    }

    if (confirm("수정하시겠습니까??")) {
        $("#pwUpdate").submit();
        return false;
    }
}


/* 다음 주소 연동 */
function execution_daum_address(){
	
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수
            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }
            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 주소변수 문자열과 참고항목 문자열 합치기
      			addr += extraAddr;
            
            } else {
                addr += ' ';
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            $(".address_input_1").val(data.zonecode);
            //$("[name=memberAddr1]").val(data.zonecode);	// 대체가능
            $(".address_input_2").val(addr);
            //$("[name=memberAddr2]").val(addr);			// 대체가능
            // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
            $(".address_input_3").attr("readonly",false);
            $(".address_input_3").focus();
            
        }
    }).open();   
    
}


