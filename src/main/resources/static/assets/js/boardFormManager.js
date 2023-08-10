

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


