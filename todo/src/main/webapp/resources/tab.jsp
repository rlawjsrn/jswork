<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>

<body>
    <div id="tab">
        <span data-url="board.jsp">게시판</span>
        <span data-url="todo.html">할일</span> <!-- 경로 파악하기 (/가 있으면 절대경로, 없으면 상대경로-->
        <div id="content"></div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script>
        $("span").on("click", function () {
           //$("#content").load($(this).data("url"));
           $.ajax({  //load함수 구성 바꿔보기
               url : $(this).data("url"),
               //mrthod :
               //data :
               dataType : 'html'
           }).done(function(result){ //받아온 페이지 전체를 태그에 넣어주기(?)
            $("#content").html(result);
           });
        })
    </script>
</body>

</html>