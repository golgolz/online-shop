<%@page import="admin.review.ReviewBoardVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="게시판 글 작성"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%
WebMemberVO wmVo=(WebMemberVO)session.getAttribute("loginData");
if(wmVo == null) { //로그인 하지 않았음
    
}//end if
%> --%>
<%
//개발의 편의성을 위해 로그인한 것처럼 코드를 작성항 후 작업 진행
ReviewBoardVO rVO=new ReviewBoardVO();
rVO.setId("haa");
session.setAttribute("loginData", rVO);
%>
<c:if test="${empty sessionScope.loginData }">
<c:redirect url="http://192.168.10.216/jsp_prj/index.jsp"/>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.216/jsp_prj/common/favicon.ico"/>
<!--bootstrap시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap끝-->
<link rel="stylesheet" href="http://192.168.10.216/jsp_prj/common/css/main.css" media="all" />
<link rel="stylesheet" href="http://192.168.10.216/jsp_prj/common/css/board.css" type="text/css" media="all" />

<!--jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->
<!-- summernote시작 -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<!-- summernote끝 -->
  
<style type="text/css">
	#wrap{width: 1462px; height:749; margin:0px auto;}

	    	
</style>
<script type="text/javascript">
	$(function(){
	    $("#btnList").click(function () {
	        history.back();
	    });//click
	    $("#btnWrite").click(function () {
	        $("#frmWrite").submit();
	    });//click
	});//ready
	
	function chkNull() {
	    if($("#title").val().trim() == "") {
	        alert("글 제목은 필수입력");
	        $("#title").focus();
	        return;
	    }//end if
	    if($("#content").val().trim() == "") {
	        alert("내용은 필수입력");
	        $("#content").focus();
	        return;
	    }//end if
	    if($("#cnt").val().trim() == "") {
	        $("#cnt").val(0);
	    }
	
	    $("#frmWrite").submit();
	
	}//chkNull
</script>
<script>
$(function(){
	
      $('#content').summernote({
        placeholder: '${sessionScope.loginData.id}님 글을 작성하세요',
        tabsize: 2,
        width:600,
        height: 200,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });//summernote
})//ready
    </script>
</head>
<body>
<div id="wrap">
<div id="header"></div>
<div id="boardContent">
	<!-- <h3>글쓰기</h3> -->
	<form method="post" action="board_write_frm_process.jsp" name="frmWrite" id="frmWrite">
	<table>
	<tr>
		<td colspan="2"> <h3>글쓰기</h3></td>
	</tr>
	<tr>
		<td>제목</td>
		<td>
		<input type="text" name="title" id="title" style="width: 600px"/>
		</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
		<textarea id="content" name="content"></textarea>
		</td>
	</tr>
	<tr>
		<td>작성자</td>
		<td><strong><c:out value="${sessionScope.loginData.id}"/></strong></td>
	</tr>
	<tr>
		<td colspan="2" style="text-align : center;">
		<input type="button" value="글 작성" class="btn btn-success btn-sm" id="btnWrite"/>
		<input type="button" value="글 목록" class="btn btn-success btn-sm" id="btnList"/>
		</td>
	</tr>
	</table>
	</form>
	
	    
</div>
</div>	
</body>
</html>