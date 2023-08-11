let board = $('#board').val();

let max = 1;
let count = 0;
let idx = 0;
let param = '';

function setMax(m) {
    max = m;
}

function setParam(p) {
    param = p;
}

function setCount(c) {
    count = c;
}



$('#deleteCheck').click(function(){
    let result = confirm('파일이 영구 삭제 됩니다\n삭제하시겠습니까?');
    let ch = $(this);
    if(result) {
        //ajax DB에서 삭제

        let num = $(this).attr('data-delete-id');
        
        $.ajax({
            type : 'POST',
            url : './'+board+'FileDelete',
            data : {
                num : num,
                board : board
            },
            success : function(response){
                if(response.trim() > 0) {
                    //ajax코드 내에서의 this는 ajax객체를 의미
                    // console.log($(this));
                    // $(this).parent().parent().remove();
                    
                    ch.parents('.file');
                    alert('삭제 되었습니다.');

                    count--;

                    location.reload();
                }
                else {
                    alert('삭제 실패, 관리자에게 문의 요망');
                }
            },
            error : function(){
                alert('파일 삭제 중 에러 발생. 관리자에게 문의 요망');
            }
        })

    }
})

$('#newFile').click(function(event) {

    // if($('#oriFile').val() != undefined || count >= max) {
    //     alert('('+max+'개까지 등록 가능)\n기존 파일 삭제 후 등록 가능합니다');
    //     event.preventDefault();
    //     return;
    // }

    checkAddFileCount($('#oriFile'), event);

})

function checkAddFileCount(element, event) {
    if(element.val() != undefined || count >= max) {
        alert('('+max+'개까지 등록 가능)\n기존 파일 삭제 후 등록 가능합니다');
        event.preventDefault();
        return;
    }
}









