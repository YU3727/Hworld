let board = $('#board').val();

let max = 1;
let count = 0;
let idx = 1;
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

    checkAddFile($('#oriFile'), event);

})


$('.fileAdd').click(function(){
    let countChk = checkAddFiles();

    if(!countChk) {
        return;
    }

    count++;
    idx++;

    let child = '<div class="mb-3 d-flex justify-content-between" id="del'+idx+'">'
    child += '<input class="form-control" type="file" id="formFile" name="'+param+'">';
    child += '<button class="btn btn-solid-default dels" type="button" data-delete-id="'+idx+'">X</button>';
    child += '</div>';

    $(this).parent().siblings('.fileList').append(child);


})

$('.fileList').on('click', '.dels', function(){
    let fileId = $(this).attr('data-delete-id');
    $(this).parents('.fileList').find('#del'+fileId).remove();
    count--;
})

function checkAddFile(element, event) {

    if(element.val() != undefined || count >= max) {
        alert('('+max+'개까지 등록 가능)\n기존 파일 삭제 후 등록 가능합니다');
        event.preventDefault();
        return ;
    }


}

function checkAddFiles() {


    if(count >= max) {
        alert(max+'개까지 등록 가능');
        return false;
    }

    return true;
}









