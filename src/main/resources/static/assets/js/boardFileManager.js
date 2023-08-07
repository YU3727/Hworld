let board = $('#board').val();

$('.dels').click(function(){
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

$('.newFile').click(function(event) {
    let oriFile = $('.oriFile');

    if(oriFile.val() != '' && oriFile.val() != undefined ) {
        alert('(1개까지 등록 가능)\n기존 파일 삭제 후 등록 가능합니다');
        event.preventDefault();
        return;
    }
})

$('#board-del').click(function(event) {
    event.preventDefault();
    let result = confirm('글을 삭제하시겠습니까?');

    if(result) {
        let num = $(this).attr('data-delete-id');
        let board = $(this).attr('data-board-id');

        $.ajax({
            type : 'POST',
            url : './'+board+'Delete',
            data : {
                num : num,
                board : board
            },
            success : function (response) {
                if(response.trim() > 0) {
                    alert('글이 삭제되었습니다');
                    location.href = './'+board;
                }
                else {
                    alert('삭제 실패');
                }
            },
            error : function(){
                alert("글 삭제중 에러 발생. 관리자에게 문의 요망")
            }
        })
    }
})


