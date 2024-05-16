<%@page import="user.review.UserReviewDAO"%>
<%@page import="admin.review.SearchVO"%>
<%@page import="admin.review.ReviewBoardUtil"%>
<%@page import="admin.review.ReviewBoardVO"%>
<%@page import="java.util.List"%>
<%@page import="admin.review.AdminReviewDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="게시판 리스트"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String userId = (String) session.getAttribute("userId");
System.out.println("세션 로그인 상태: " + userId);

if (userId == null) {
    System.out.println("로그인이 필요합니다. ");
%>
    <script type="text/javascript">
        alert('로그인이 필요합니다.');
        window.location.href = '../user/login/userLogin.jsp'; // 경로 수정 필요

    </script>
<%
    return;
}
%>
<!DOCTYPE html>
<html>
<head>

	<jsp:include page="../assets/jsp/user/lib.jsp" />
	<!-- golgolz start -->
	<link rel="stylesheet" type="text/css" href="https://img.echosting.cafe24.com/editors/froala/css/froala_style_ec.min.css?vs=2404251304" charset="utf-8"/>
<link rel="stylesheet" type="text/css" href="https://insideobject.com/ind-script/optimizer.php?filename=nZExDgIxDAT7KC3vsOAJPIEfOMFwJxJv5DgS_J6jggYJ0o52doulBVVofzBqhqtxJZOOYVko904Xgzpl1AqNG9jRL3nJoaMMX6Eh4T4pDvfZ0cIPsTnVORWZVNFCWVVCYtWv-9waHcF2ptNn3YZjeuGYCvJtVjZpMP_Pft_7BA&type=css&k=ecd691e0c80070ef935d0e961272742f67437a3c&t=1681776733"/>
<link rel="stylesheet" type="text/css" href="https://insideobject.com/ind-script/optimizer_user.php?filename=tZRBbsQgDEX3k257Ds-o6j0q9QTEcYI1gBGGTOf2dTtVq64DO8DwvvX1MXiJBIRTUyoKgVcKbj6_nC-Q2xwYJ19jAF1oWkh5S6BXTpdXQFWIsrRAMIsriz3V-ubw6jZ6suIzdCMruYK-MxRdpSh7717XlrCypGPY4O7SKsxOGb81UGLsDn0cdIYSnmxDp8aDwFUkVM6D6J7CKHQuFhQc5Xd2GyfL9CjX3TyIPLdau0f7Fy4f4wwJo8y2a3gMvaxBpEAOzVJhu1Ohnen2txrUuRWodBupPzKx2YdXL_ndc86ctt4CKGk3ho3tfND3KIXSfn9o9Bja_4GqX7RP&type=css&k=d664d08dad9a7052b47cd7d6e8a0a70935bed9eb&t=1678165953&user=T"/>
	
	<!-- golgolz end -->

<style type="text/css">
	#wrap{width: 1462px; height:749; margin:0px auto;}
	.num{width: 80px}
	.title{width: 350px}
	.id{width: 120px}
	.date{width: 150px}
	.cnt{width: 100px}
	    	
</style>
<script type="text/javascript">
		$(function(){
			/* $("#btnSearch").click(function(){
				chkNull;
			});//click */
			$("#btnAllSearch").click(function(){
				location.href="review_my_list.jsp";
			});//click
			$("#btnWrite").click(function(){
				location.href="review_write.jsp";
			});//click
			
			$("#keyword").keydown(function(evt) {
				if(evt.which ==13){
					chkNull();
				}//end if
			});//keydown
			
			$("#search").click(function(){
				$("#frmBoard").submit();
			});
			
		});//ready
		
		/*
		5,10,15,20을 눌렀을때 발생하는 함수 [테이블 새로 생성,]
		*/
		function changePageScale(){
			var selectOption = document.getElementById("list_num").value;
			$.ajax({
				type: "GET",
				url: "reviewTableAjax.jsp",
				data: {
					selectOption: selectOption
				},
				success: function(data){
					displayTable(data);
				},
				error: function(xhr){
					alert("에러발생  : " + xhr.status)
				}
			})
		}

		function displayTable(data){
			var tbody = document.getElementById("tbody");
			tbody.innerHTML="";
			
			
			alert(data);
			var object = JSON.parse(data);
			
			var boardList = object.boardList;
			
			for(var i=0 ; i < boardList.length; i++){
				var row = tbody.insertRow(i);
				
				//각속성에 대한 열 추가
				var cell1 = row.insertCell(0);
				var cell2 = row.insertCell(1);
				var cell3 = row.insertCell(2);
				var cell4 = row.insertCell(3);
				var cell5 = row.insertCell(4);
				var cell6 = row.insertCell(5);
				var cell7 = row.insertCell(6);
				
				 // 각 열에 체크박스 요소 추가
			    cell1.innerHTML = '<input type="checkbox" name="checkbox' + i + '">'; // 체크박스 추가
			    cell2.innerHTML = boardList[i].reviewId;
			    cell3.innerHTML = boardList[i].defaultImg;
			    cell4.innerHTML = boardList[i].name;
			    cell5.innerHTML = '<a href="review_my_list.jsp?seq=${rVO.reviewId }&currentPage=${empty param.currentPage ?1:param.currentPage}">'+boardList[i].title+'</a>';
			    cell6.innerHTML = boardList[i].inputDate;
			    cell7.innerHTML = boardList[i].id;
			}//end for
			
			pagination(data);
			
		}//displayTable
		
		function pagination(data){
			
			var paging = document.getElementById("paging");
			paging.innerHTML="";
			
			var object = JSON.parse(data);
			var totalPage = object.totalPage;
			var currentPage = object.currentPage;
			
			$("#paging").html(newPagination);
		}
		
		function chkNull() {
			if($("#keyword").val().trim() !="") {
				//alert("검색 키워드를 입력해주세요.")
				$("#frmBoard").submit();
				
			}//end if
		}//chkNull
</script>
</head>
<body>
	<jsp:include page="../assets/jsp/user/header.jsp" />
	<div id="wrap">
		<div id="main">
			<!-- golgolz start -->
			<div class="main_pro_title width1240 cboth"  style="margin-bottom:40px">
		<div class="txt_01"><font color="#555555">REVIEW</font></div>
		<!-- <div class="txt_02">오브젝트 내 리뷰게시판입니다.</div> -->
</div>

<div class="boardSort">
                <span class="xans-element- xans-board xans-board-replysort-4 xans-board-replysort xans-board-4 "></span>
    </div>
<div class="ec-base-table typeList gBorder">
        <table border="1" summary="">
<caption>상품 게시판 목록</caption>
        <colgroup class="xans-element- xans-board xans-board-listheader-4 xans-board-listheader xans-board-4 "><col style="width:70px;"/>
<col style="width:150px;"/>
<col style="width:130px;" class="displaynone"/>
<col style="width:auto;"/>
<col style="width:84px;"/>
<col style="width:77px;" class=""/>
<col style="width:55px;" class=""/>
<col style="width:55px;" class="displaynone"/>
<col style="width:80px;" class="displaynone"/>
</colgroup>
<thead class="xans-element- xans-board xans-board-listheader-4 xans-board-listheader xans-board-4 ">
<div id="content">
	<%
	request.setCharacterEncoding("UTF-8");
	%>
<jsp:useBean id="sVO" class="admin.review.SearchVO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="sVO"/>
	<%
	try{
		    UserReviewDAO rDAO=UserReviewDAO.getInstance();
		    //1.총 레코드 수 얻기
		    int totalCount = rDAO.selectTotalCount(sVO);
		    
		    //2.한 화면에 보여줄 게시물의 수
		    int pageScale=  10;
		    //3.총 페이지 수
		    int totalPage=(int)Math.ceil((double)totalCount/pageScale);
		    //4.게시물의 시작번호
		    String tempPage=sVO.getCurrentPage();
		    /* System.out.println(totalPage); */
		    int currentPage=1;
		    if(tempPage !=null) {
		        try{
		        currentPage=Integer.parseInt(tempPage);
		        }catch(NumberFormatException nfe){
		        }
		    }//end if
		    int startNum=currentPage *pageScale-pageScale+1;
		    //5.게시물의 끝 번호
		    int endNum=startNum+pageScale-1;
		    
		    sVO.setStartNum(startNum);
		    sVO.setEndNum(endNum);
		    
		    List<ReviewBoardVO> list=rDAO.selectReviewBoard(sVO);//시작번호와 끝 번호 사이의 글 조회
		   	pageContext.setAttribute("list", list);
		    
		    pageContext.setAttribute("totalCount", totalCount);
		    pageContext.setAttribute("pageScale", pageScale);
		    pageContext.setAttribute("currentPage", currentPage);
	%>   
	    
	    <div class="contents">
		<!--begin of submain-->
		<form name="dataForm" action="./" method="post">
		<input type="hidden" name="act"  value="community">
		<input type="hidden" name="ch"   value="community">
		<input type="hidden" name="mode" value="search">
		<input type="hidden" name="oc"   value="">
		<input type="hidden" name="os"   value="">
		<input type="hidden" name="bbs_code"  value="user_review">
		<input type="hidden" name="bbs_mode"  value="list">
		<input type="hidden" name="cate_code" value="GD">
		<input type="hidden" name="seq"  value="">
		</form>
	   <div>
	    <table class="table">
	    	<thead>
	    	<tr align="center">
	    		<th class="thL"><input type="checkbox" id="check_all" name="check_all" value="bbs_seq[]"></th>
	    		<th class="num">번호</th>
	    		<th class="title">상품정보</th>
	    		<th class="title" style="width:700px">제목</th>
	    		<th class="date">작성일</th>
	    		<!-- <th class="id">작성자</th> -->
<!-- 	    		<th class="cnt">조회수</th> -->
	    	</tr>
	    	</thead>
	    	<tbody id="tbody" align="center">
	    		<c:forEach var="rVO" items="${list }" varStatus="i">
				<tr>
				<%-- <td> <c:out value="${totalCount - (currentPage - 1) * pageScale - i.index}"/></td> --%>
				<td class="tdL" align="center"><input type="checkbox" name="bbs_seq[]" value="23"></td>
				<td> <c:out value="${rVO.reviewId}"/></td>
				<td> <img src="http://localhost/online-shop/assets/images/goods/<c:out value='${rVO.defaultImg}'/>" style="width:60px; height:60px">
				      		<c:out value="${rVO.name}"/></td>
				<td><a href="review_detail_user.jsp?reviewId=${rVO.reviewId }&currentPage=${empty param.currentPage ?1:param.currentPage}"><c:out value="${rVO.title}"/></a></td>
				<td> <c:out value="${rVO.inputDate}"/></td>
				<%-- <td> <c:out value="${rVO.id}"/></td> --%>
				</tr>
	    	</c:forEach>
	    	</tbody>
	    </table>
	    
</div>

	    <div style="text-align: center; margin-top:10px">
	    <form action="review_my_list.jsp" name="frmBoard" id="frmBoard" method="get">
	    	<select name="field" id="field">
	    		<option value="0" ${param.field eq 0?" selected='selected'":""}>제목</option>
	    		<option value="1" ${param.field eq 1?" selected='selected'":""}>내용</option>
	    		<%-- <option value="2" ${param.field eq 2?" selected='selected'":""}>작성자</option> --%>
	    	</select>
	    	<input type="text" name="keyword" id="keyword" value="${param.keyword }" style="width:230px; border:1px solid #dedede;"/>
	    	<input type="button"  value="검색" id="search" class="btn btn-info btn-sm"/>
	    	<input type="button"  value="전체글" id="btnAllSearch" class="btn btn-info btn-sm" />
	    	<!-- <input type="button"  value="글쓰기" id="btnWrite" class="btn btn-warning btn-sm"/> -->
	    	<!-- <a href="http://localhost/online-shop/review/review_write.jsp?code=SAMSUNG_S24_1&cartId=20240419131320" class="btn btn-warning btn-sm">글쓰기</a> -->
	    	<input type="text" style="display: none;">
	    </form>
	    </div>
	    
	    
	  <div style="text-align: center;">
	  
	  <%
	  	  String param="";
	  		pageContext.setAttribute("param", param);
	  		pageContext.setAttribute("param", totalPage );
	  		pageContext.setAttribute("param", currentPage );
	  	  %>
        <c:if test="${not empty param.keyword }">
        <%
        param="&field="+request.getParameter("field")+"&keyword="+request.getParameter("keyword");
        %>
            <c:set var="link2" value="&field=${param.field}&keyword=${param.keyword }" />
        </c:if>
        <div id="paging">
        <%=ReviewBoardUtil.getInstance().pageNation("review_my_list.jsp", param, totalPage, currentPage)%>
        </div>
    </div>
    
    <%
		}catch (SQLException se){
			se.printStackTrace();
			out.println(".");
		}
	%>
	    </div>
	    
</div>
			<!-- golgolz end -->
</div>
</div>
	</main>

</body>
</html>