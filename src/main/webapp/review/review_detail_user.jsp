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
<c:redirect url="http://localhost/online-shop/index.jsp"/>
</c:if>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../assets/jsp/user/lib.jsp" />
	<!-- golgolz start -->
	<link rel="stylesheet" type="text/css" href="https://img.echosting.cafe24.com/editors/froala/css/froala_style_ec.min.css?vs=2404251304" charset="utf-8"/>
	<link rel="stylesheet" type="text/css" href="https://insideobject.com/ind-script/optimizer.php?filename=nZExDgIxDAT7KC3vsOAJPIEfOMFwJxJv5DgS_J6jggYJ0o52doulBVVofzBqhqtxJZOOYVko904Xgzpl1AqNG9jRL3nJoaMMX6Eh4T4pDvfZ0cIPsTnVORWZVNFCWVVCYtWv-9waHcF2ptNn3YZjeuGYCvJtVjZpMP_Pft_7BA&type=css&k=ecd691e0c80070ef935d0e961272742f67437a3c&t=1681776733"/>
	<link rel="stylesheet" type="text/css" href="https://insideobject.com/ind-script/optimizer_user.php?filename=tdRLTsQwDAbgfcuWc3hGiHsgcYI83NYaJ47ipDC3J2UQiHWTXR7V5-iXa9gkIKCbq2JWYFqQjb28XK6QqmVy81YCg3qcPSqtEfRG8foKThWC-MoIVkz2kNH4N-NuZsWndvkM3WQnIWAsY_AgOx56Z5ZJi65ZauoMLzW6QhLPsWzuUgtYo-S-axwZd0cfB51RdFPb4FRpEFxEuFAapG_Io-iUW6O4UXkns1I0BUelbuwg2dZSurf2Ly6f4wLhUWG3z9w52i8skiFxbV3RdlPGnfDjbzXo5e0Cc7eR-lMm1PbD6ybpfaOUKK69CziJezPa2E4ncw-SMe73R40eQ_s_qHpoXw&type=css&k=0098db34b7f7c0214e4a2bddabcfc92b64957ce4&t=1678165953&user=T"/>
	<!-- golgolz end -->
  
<style type="text/css">
	#wrap{width: 1462px; height:749; margin:0px auto;}

	    	
</style>
<script type="text/javascript">
	$(function(){
	    $("#btnList").click(function () {
	        //history.back();
	        location.href="http://192.168.10.216/jsp_prj/board/board_list.jsp?currentPage=${param.currentPage}";
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
	    	$("#frmDetail")[0].action="review_delete_process.jsp";
	    	$("#frmDetail").submit();
			}//end if
	    
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
	    
	    $("#frmDetail")[0].action="review_update_process.jsp";
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

	<jsp:include page="../assets/jsp/user/header.jsp" />
	<div id="wrap">
		<div id="main">
			<!-- golgolz start -->
			<div class="titleArea">
            <h2><font color="#555555">REVIEW</font> </h2>
            <p>상품 사용후기입니다.</p>
        </div>
</div>

<div id="wrap">
<div id="boardContent">
<%
	UserReviewDAO rDAO=UserReviewDAO.getInstance();
	try{
	  String seq=request.getParameter("reviewId");
	  
	  rVO=rDAO.selectDetailReview(Integer.parseInt(seq));//상세보기
	 /*  rDAO.updateCnt(Integer.parseInt(seq)); *///조회수 올려주기(중요도가 덜한것이 아래로 내려가는게 좋음)
	 System.out.print(seq); 
	 
	  pageContext.setAttribute("rVO", rVO);
	}catch(SQLException se){
	  se.printStackTrace();
	  out.print("sql 에러");
	}
%>
<div class="xans-element- xans-board xans-board-product-4 xans-board-product xans-board-4 ec-base-box typeProduct ">
<p class="thumbnail">
<a href="#"><img src="http://localhost/online-shop/assets/images/goods/<c:out value='${rVO.defaultImg}'/>" style="width:60px; height:60px""/></a></p>
<div class="information"  style="padding-left:20px">
            <h3><a href="#"> <c:out value="${rVO.name}"/></a></h3>
        </div>
</div>
<form id="frmDetail" name="frmDetail" action="review_delete_process.jsp" method="post" target="_self" enctype="multipart/form-data" >
<input id="no" name="no" value="28387" type="hidden"  />
<input id="bulletin_no" name="bulletin_no" value="29332" type="hidden"  />
<input id="board_no" name="board_no" value="4" type="hidden"  />
<input id="member_id" name="member_id" value="" type="hidden"  />
<input id="list_url" name="list_url" value="/board/product/list.html?board_no=4" type="hidden"  />
<input id="bdf_modify_url" name="bdf_modify_url" value="/board/product/modify.html?board_act=edit&amp;no=28387&amp;board_no=4" type="hidden"  />
<input id="bdf_del_url" name="bdf_del_url" value="/exec/front/Board/del/4" type="hidden"  />
<input id="bdf_action_type" name="bdf_action_type" value="" type="hidden"  />
<input type="hidden" name="reviewId" value="${rVO.reviewId}"/>
<div class="xans-element- xans-board xans-board-read-4 xans-board-read xans-board-4">
<!--        $login_page_url = /member/login.html
            $deny_access_url = /board/product/list.html
        -->
<div class="ec-base-table typeWrite ">
            <table border="1" summary="">
<caption>상품 게시판 상세</caption>
            <colgroup>
<col style="width:130px;"/>
<col style="width:auto;"/>
</colgroup>
<tbody>
<tr>
<th scope="row">제목</th>
                    <td><strong><c:out value="${rVO.title}"/></strong></td>
                </tr>
<tr>
<th scope="row">작성자</th>
                    <td><strong><c:out value="${rVO.id}"/></strong></td>
                </tr>
<tr>
<td colspan="2">
                        <ul class="etcArea">
                             </li>
                            <li class="">
                                <strong>작성일</strong> <fmt:formatDate value="${rVO.inputDate}" pattern="yyyy-MM-dd EEEE HH:mm:ss"/>
                            </li>
                        </ul>
<div class="detail"><div class="fr-view fr-view-article"><c:out value="${ rVO.content }"/></div></div>
                    </td>
                </tr>
<tr class="attach displaynone">
<th scope="row">첨부파일</th>
                    <td></td>
                </tr>
<tr class=" " style="border:1px solid #dedede">
                </tr>
</tbody>
</table>
</div>
<div class="ec-base-button ">
            <span class="gLeft">
                <a href="http://localhost/online-shop/review/review_my_list.jsp" class="btnNormalFix sizeS">목록</a>
            </span>
            <span class="gRight">
                <a href="review_delete_process.jsp?reviewId=${rVO.reviewId }" class="btnNormalFix sizeS">삭제</a>
                <a href="http://localhost/online-shop/review/review_read_frm.jsp?reviewId=${rVO.reviewId }&currentPage=${empty param.currentPage ?1:param.currentPage}" class="btnEmFix sizeS ">수정</a>
            </span>
        </div>
</div>
</form></div>
</div>
			<!-- golgolz end -->
	    
</div>
</div>	
</body>
</html>