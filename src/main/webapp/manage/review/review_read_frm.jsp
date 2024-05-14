<%@page import="user.review.UserReviewDAO"%>
<%@page import="admin.review.ReviewBoardVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="게시판 글 읽기"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <%
WebMemberVO wmVo=(WebMemberVO)session.getAttribute("loginData");
if(wmVo == null) { //로그인 하지 않았음
    
}//end if
%> --%>
<%/* 로그인한 사람만 읽게 하려면 쓰고 아니면 지우기 */
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

	#reply_wrap{height:200px; margin-top:20px}
	#reply_content{height:170px; overflow:auto; margin-top:10px}
	    	
</style>
<script type="text/javascript">
	$(function(){
	    $("#btnList").click(function () {
	        //history.back();
	        location.href="http://localhost/online-shop/manage/review/review_my_list.jsp?currentPage=${param.currentPage}";
	    });//click
	    $("#btnUpdate").click(function () {
	    	if(confirm("글을 수정하시겠습니까?")){
	    	chkNull();	    		
	    	}//end if
	    });//click
	    $("#btnDelete").click(function () {
			if(confirm("글을 정말 삭제하시겠습니까?")){
	    	//<form태그의 action 변경
	    	//var frm=document.frmDetail.action="back-end URL"
	    	$("#frmDetail")[0].action="board_delete_frm_process.jsp";
	    	$("#frmDetail").submit();	
			}//end if
	    
	    });//click
	    
	    $("#btnWrite").click(function(){
	    	var content=$("#rContent").val();	    	
	    	var writer=$("#rWriter").val();
	    	
	    	if(content==""){
	    		alert("댓글의 내용은 필수 입력입니다.");
	    		$("#rContent").focus();
	    		return;
	    	}
	    	if(writer==""){
	    		alert("작성자는 필수 입력입니다.");
	    		$("#rWriter").focus();
	    		return;
	    	}
	    	
	    	var param={num: $("#seq").val(), content:content, writer:writer};
	    	
	    	$.ajax({
	    		url : "add_reply.jsp",
	    		type : "POST",
	    		data : param,
	    		dataType : "JSON",
	    		error : function(xhr){
	    			alert("죄송 잠시 후 다시시도 해주세요.");
	    			console.log(xhr+"/"+xhr.status);
	    		},
	    		success:function(jsonObj){
					var msg="댓글 작성 실패";
					if(jsonObj.flag){
						msg="댓글을 작성하였습니다.";
						$("#rContent").val("");
						$("#rWriter").val("");
						
						var menuText=$("#replyMenu").text();
						if(menuText=="열기"){
				    		menuText="닫기";
				    	$("#replyContent").toggle();
				    	}
				    		searchReply();
				    	$("#replyMenu").text(menuText);
					}
					alert(msg);
				}
	    	});//ajax
	    	
	    });//click
	    
	    $("#replyMenu").click(function(){
	    	replyShow();
	    });
	    
	});//ready
	
	function replyShow(){
		var menuText=$("#replyMenu").text();
    	
    	if(menuText=="열기"){
    		menuText="닫기";
    		searchReply();
    	}else{
    		menuText="열기";
    	}
    	$("#replyContent").toggle();
    	$("#replyMenu").text(menuText);
	}
	
	function searchReply(){
		var param={ refNum : $("#seq").val()};
		$.ajax({
			url:"reply_search.jsp",
			type:"POST",
			data:param,
			dataType:"JSON",
			error: function(xhr){
				alert("ㅈㅅ~");
				console.log(xhr.status)
			},
			success:function(jsonObj){
				var output="댓글을 읽어올 수 없습니다.";
				if(jsonObj.flag){
					output="";
					if(jsonObj.dataSize==0){
						output="작성된 댓글이 없습니다. 당신의 의견을 작성해 보세요.";
					}
					$.each(jsonObj.data,function(i, jsonTemp){
						output+="<div><strong>내용</strong> : "+ jsonTemp.content+"<br/>";
						output+="<div><strong>작성자</strong> : "+ jsonTemp.writer
								+"<strong>작성일</strong>"+ jsonTemp.input_date
								+"<strong>ip</strong>"+ jsonTemp.ip
								+"<input type='button' value='삭제' class='btn btn-warning btn-sm' onclick='removeReply("+jsonTemp.num+")'>"+"</div>";
					});
				}
				$("#replyContent").html(output);
			}
		});//ajax
	}
	
	function removeReply(num){
		if(confirm("댓글을 삭제하시겠습니까?")){
			var param={num : num};
			$.ajax({
				url:"remove_reply.jsp",
				type:"POST",
				data:param,
				dataType:"JSON",
				error:function(xhr){
					alert("ㅈㅅ~");
					console.log(xhr.status);
				},
				success:function(jsonObj){
					var output="댓글이 삭제되지 않았습니다.";
					if(jsonObj.result){
						output="댓글이 삭제되었습니다.";
					}
					searchReply();
					alert(output);
					
				}//success
			});
		}//end if
	}//removeReply
	
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
	    
	    $("#frmDetail")[0].action="board_update_process.jsp";
	    $("#frmDetail").submit();
	
	}//chkNull
</script>
<script>
$(function(){
	
      $('#content').summernote({
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
<%
	UserReviewDAO rDAO=UserReviewDAO.getInstance();
	try{
	  String seq=request.getParameter("seq");
	  
	  rVO=rDAO.selectDetailReview(Integer.parseInt(seq));//상세보기
	  /* rDAO.updateCnt(Integer.parseInt(seq));//조회수 올려주기(중요도가 덜한것이 아래로 내려가는게 좋음) */
	  
	  pageContext.setAttribute("rVO", rVO);
	}catch(NumberFormatException nfe){
	  %>
	  <c:redirect url="http://localhost/online-shop/manage/review/review_my_list.jsp"/>
	  
	  <%
	}catch(SQLException se){
	  se.printStackTrace();
	  %>
	  <script type="text/javascript">
	location.href="http://192.168.10.216/jsp_prj/error/err_500.html";
</script>
	  <%
	}
%>

	<!-- <h3>글쓰기</h3> -->
	<form method="post" name="frmDetail" id="frmDetail">
	<input type="hidden" name="reviewId" value="${ rVO.reviewId }"/>
	<input type="hidden" name="cartId" value="${ rVO.cartId }"/>
	<input type="hidden" name="code" value="${ rVO.code }"/>
	<input type="hidden" name="currentPage" value="${ param.currentPage }"/>
	<table>
	<tr>
		<td colspan="2"> <h3>글읽기</h3></td>
	</tr>
	<tr>
		<td>제목</td>
		<td>
		<input type="text" name="title" id="title" style="width: 600px"
			value="${ rVO.title }"/>
		</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
		<textarea id="content" name="content">${ rVO.content }</textarea>
		</td>
	</tr>
	<tr>
		<td>조회수</td>
		<td>
		<input type="text" name="cnt" id="cnt" value="${ rVO.cnt }" style="width: 600px"/>
		</td>
	</tr>
	<tr>
		<td>작성일</td>
		<td><strong><fmt:formatDate value="${rVO.input_date}" pattern="yyyy-MM-dd EEEE HH:mm:ss"/></strong></td>
	</tr>
	<tr>
		<td>작성자</td>
		<td><strong><c:out value="${rVO.id}"/></strong></td>
	</tr>
	<tr>
		<td colspan="2" style="text-align : center;">
		<%-- <c:if test="${not empty sessionScope.loginData }"> --%><!-- 로그인한 사람 누구나 삭제 수정 할 수 있다. -->
		<c:if test="${ rVO.id eq sessionScope.loginData.id }"><!-- 내 글만 수정 삭제 가능 -->
		<input type="button" value="글 수정" class="btn btn-success btn-sm" id="btnUpdate"/>
		<input type="button" value="글 삭제" class="btn btn-warning btn-sm" id="btnDelete"/>
		</c:if>
		<input type="button" value="글 목록" class="btn btn-info btn-sm" id="btnList"/>
		</td>
	</tr>
	</table>
	</form>
	<div id="reply_wrap">
		<div id="reply_frm">
		<input type="hidden" id="seq" name="seq" value="${ param.seq }"/>
		내용<input type="text" name="rContent" id="rContent" style="width:300px"/>
		작성자<input type="text" name="rWriter" id="rWriter" style="width:100px"/>
		<input type="button" value="댓글작성" id="btnWrite" class="btn btn-success btn-sm"/><br/>
		</div>
		<a href="#" id="replyMenu">열기</a>
		<div id="replyContent" style="display:none"></div>
	</div>
	    
</div>
</div>	
</body>
</html>