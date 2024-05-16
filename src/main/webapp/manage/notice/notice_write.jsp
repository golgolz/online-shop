<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
	
<%-- <%
Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");
System.out.println("세션 로그인 상태: " + isLoggedIn);
if (!Boolean.TRUE.equals(isLoggedIn)) {
%>
  <script type="text/javascript">
      alert('로그인이 필요합니다.');
      window.location.href = '../../adminLogin/adminLogin.jsp'; // 경로 수정 필요
  </script>
<%
  return;
}
%> --%>

<!DOCTYPE html>
<html>
<head>

<jsp:include page="../../assets/jsp/admin/lib.jsp" />

<link rel="stylesheet" type="text/css" href="https://img.echosting.cafe24.com/editors/froala/css/froala_style_ec.min.css?vs=2404180600" charset="utf-8"/>
<link rel="stylesheet" type="text/css" href="https://insideobject.com/ind-script/optimizer.php?filename=nZExDgIxDAT7KC3vsOAJPIEfOMFwJxJv5DgS_J6jggYJ0o52doulBVVofzBqhqtxJZOOYVko904Xgzpl1AqNG9jRL3nJoaMMX6Eh4T4pDvfZ0cIPsTnVORWZVNFCWVVCYtWv-9waHcF2ptNn3YZjeuGYCvJtVjZpMP_Pft_7BA&type=css&k=ecd691e0c80070ef935d0e961272742f67437a3c&t=1681776733" />
<link rel="stylesheet" type="text/css" href="https://insideobject.com/ind-script/optimizer_user.php?filename=tZRBbsQgDEX3k257Ds-o6j0q9QTEcYI1gBGGTOf2dTtVq64DO8DwvvX1MXiJBIRTUyoKgVcKbj6_nC-Q2xwYJ19jAF1oWkh5S6BXTpdXQFWIsrRAMIsriz3V-ubw6jZ6suIzdCMruYK-MxRdpSh7717XlrCypGPY4O7SKsxOGb81UGLsDn0cdIYSnmxDp8aDwFUkVM6D6J7CKHQuFhQc5Xd2GyfL9CjX3TyIPLdau0f7Fy4f4wwJo8y2a3gMvaxBpEAOzVJhu1Ohnen2txrUuRWodBupPzKx2YdXL_ndc86ctt4CKGk3ho3tfND3KIXSfn9o9Bja_4GqX7RP&type=css&k=d664d08dad9a7052b47cd7d6e8a0a70935bed9eb&t=1678165953&user=T" />
<!-- summernote -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<!-- summernote -->
<script type="text/javascript">
	$(function(){
    	$("#notice_menu").addClass("bg-gradient-primary");
    	
		$("#btnList").click(function(){
			history.back();
		});//click
		$("#btnWrite").click(function(){
			$("#frmWrite").submit();
		});//click
		$("#btnCancel").click(function(){
			alert("글작성을 취소합니다.");
			location.href="http://localhost/manage/notice/notice.jsp";
		});//click
		$('#content').summernote({
	        placeholder: 'Hello stand alone ui',
	        tabsize: 2,
	        height: 400,
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
	});//ready
	
	function chkNull() {
		/* $("#frmWrite").submit(); */
		$("#frmWrite").submit(function() {
        // 추가 작업을 수행합니다.
        // 예: 폼이 제출되기 전에 유효성을 검사하는 등의 작업을 수행할 수 있습니다.
	    });
	}//chkNull
		
</script>
<!-- golgolz start -->
<!-- golgolz end -->

</head>
<style type="text/css">
	.txt_01{text-align:center}
	.txt_02{text-align:center}
	#table_01{margin: auto ; border:1px solid #b3b3b3}
	th{background-color: #F5F5F5; text-align:center}
	.btnInsert{float:right}
</style>
<body>
	<jsp:include page="../../assets/jsp/admin/header.jsp" />
	<main
		class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ps ps--active-y">
		<nav
			class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl"
			id="navbarBlur" data-scroll="true">
			<div class="container-fluid py-1 px-3">
				<nav aria-label="breadcrumb">
					<ol
						class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
						<li class="breadcrumb-item text-sm"><a
							class="opacity-5 text-dark" href="javascript:;">
							관리자 기능</a></li>
						<!-- 하단의 대시보드 텍스트를 본인 기능으로 변경 필요  -->
						<li class="breadcrumb-item text-sm text-dark active"
							aria-current="page">공지사항 관리</li>
					</ol>
					<h6 class="font-weight-bolder mb-0">공지사항 관리</h6>
				</nav>
			</div>
		</nav>
		<div class="container-fluid py-4">
			<!-- golgolz start -->
			<div id="container">
		<div id="contents">
		
<!-- <div class="xans-element- xans-board xans-board-writepackage-4 xans-board-writepackage xans-board-4 "><div class="xans-element- xans-board xans-board-title-4 xans-board-title xans-board-4 "><div class="path">
            <span>현재 위치</span>
            <ol>
<li><a href="/">홈</a></li>
                <li><a href="/board/index.html">게시판</a></li>
                <li title="현재 위치"><strong>공지사항</strong></li>
            </ol>
</div> -->
<div class="titleArea" style="padding-top : 3px ">
            <h2><font color="333333">공지사항</font></h2>
            <p>공지사항 작성</p>
        </div>
</div>
<form id="frmWrite" name="frmWrite" action="notice_write_process.jsp" method="post">

<div class="ec-base-table typeWrite ">
            <table border="1" summary="">
<caption>글쓰기 폼</caption>
            <colgroup>
<col style="width:130px;"/>
<col style="width:auto;"/>
</colgroup>
<tbody>
<tr>
	<th scope="row">제목</th>
      <td>
      <select id="board_category" name="board_category" fw-filter="" fw-label="" fw-msg="">
		<option value="1">선택</option>
		<option value="2">공지사항</option>
	  </select>
		<input id="title" name="title" class="inputTypeText" placeholder="" maxLength="125" value="" type="text"  />
 			 </td>
 </tr>
</tbody>
</table>
</div>
  <textarea id="content" name="content"></textarea>
</form>

<div class="ec-base-button ">
            <span class="gLeft">
                <input type="button" value="목록" class="btnNormalFix sizeS" id="btnList" name="btnList"/>
            </span>
            <span class="gRight">
            	<input type="button" value="등록" class="btnSubmitFix sizeS" id="btnWrite" name="btnWrite"/>
            	<input type="button" value="취소" class="btnBasicFix sizeS" id="btnCancel" name="btnCancel"/>
            	
            	
               <!--  <a href="#none" class="btnSubmitFix sizeS" onclick=";">등록</a>
                <a href="notice.jsp" class="btnBasicFix sizeS">취소</a> -->
            </span>
        </div>
</div>
</div>
			<!-- golgolz end -->
		</div>
	</main>
</body>
</html>