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
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../assets/jsp/admin/lib.jsp" />
<script type="text/javascript">
	$(function(){
    	$("#review_menu").addClass("bg-gradient-primary");
	});
</script>
<!-- golgolz start -->
<link rel="stylesheet" href="https://demo01.swm.whoismall.com/common/css/admin_community.css?v=202008110000" type="text/css" />
	<link href="https://demo01.swm.whoismall.com/common/css/bbs_data_naver.css?v=202008110000" type="text/css" rel="stylesheet" >
<body class="mainlayout">

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td height="125" valign="top"><link type="text/css" href="https://demo01.swm.whoismall.com/common/css/admin_general.css?v=202008110000" rel="stylesheet">
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
			$("#btnSearch").click(function(){
				chkNull;
			});//click
			$("#btnAllSearch").click(function(){
				location.href="board_list.jsp";
			});//click
			$("#btnWrite").click(function(){
				location.href="board_write_frm.jsp";
			});//click
			
			$("#keyword").keydown(function(evt) {
				if(evt.which ==13){
					chkNull();
				}//end if
			});//keydown
		
			$("#submit1").click(function(){
				var searchText=document.getElementById("inputText").value;
				alert(searchText)
				var select=document.getElementById("sc").value;
				alert(select)
			});
			

			$("#date_term3").click(function(){//이번주
				
			});
			$("#date_term4").click(function(){//이번달
				
			});
			$("#date_term5").click(function(){//전체
				
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
			
			
			/* alert(data); */
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
			    cell5.innerHTML = '<a href="review_board_list?seq=${rVO.reviewId }&currentPage=${empty param.currentPage ?1:param.currentPage}">'+boardList[i].title+'</a>';
			    cell6.innerHTML = boardList[i].inputDate;
			    cell7.innerHTML = boardList[i].id;
			}//end for
			
			/* pagination(data); */
			
		}//displayTable
		
		/* function pagination(data){
			
			var paging = document.getElementById("paging");
			paging.innerHTML="";
			
			var object = JSON.parse(data);
			var totalPage = object.totalPage;
			var currentPage = object.currentPage;
			
			$("#paging").html(newPagination);
		} */
		
		function chkNull() {
			if($("#keyword").val().trim() !="") {
				//alert("검색 키워드를 입력해주세요.")
				$("#frmBoard").submit();
				
			}//end if
		}//chkNull
</script>
</head>
<body>
<jsp:include page="../../assets/jsp/admin/header.jsp" />
	<main
		class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ps--active-y">
		<nav
			class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl"
			id="navbarBlur" data-scroll="true">
			<div class="container-fluid py-1 px-3">
				<nav aria-label="breadcrumb">
					<ol
						class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
						<li class="breadcrumb-item text-sm"><a
							class="opacity-5 text-dark" href="http://localhost/online-shop/manage/index.jsp">
							관리자 기능</a></li>
						<!-- 하단의 대시보드 텍스트를 본인 기능으로 변경 필요  -->
						<li class="breadcrumb-item text-sm text-dark active"
							aria-current="page"><a href="http://localhost/online-shop/manage/review/review.jsp">리뷰 관리</a></li>
					</ol>
					<!-- <h6 class="font-weight-bolder mb-0"><a href="http://localhost/online-shop/manage/review/review.jsp">리뷰 관리</a></h6> -->
				</nav>
			</div>
		</nav>
		<div class="container-fluid py-4">
			<!-- golgolz start -->
<div id="wrap">
<div id="header"></div>
<div id="content">
	<%
	request.setCharacterEncoding("UTF-8");
	%>
<jsp:useBean id="sVO" class="admin.review.SearchVO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="sVO"/>
	<%
	try{
		    AdminReviewDAO rDAO=AdminReviewDAO.getInstance();
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
		
		<table cellpadding="0" cellspacing="1" border="0" class="tbstyleB" width="100%">
			<col width="120">
		    <col width="*">
			<tr><td colspan="2" class="top5"></td></tr>
		    <!-- <tr>
		    	<td class="label">상품검색</td>
		        <td class="box text">
					<input type='radio' name='category' value='apple' />애플
					<input type='radio' name='category' value='samsung' />삼성
		        </td>
		    </tr> -->
			<tr>
				<td class="label">검색 키워드</td>
				<td class="box text">
					<select id="sc" name="sc" style="width:75px;">
						<option value="good_name">상품명</option>
						<option value="good_code">상품코드</option>
						<option value="user_id">아이디</option>
						<option value="bbs_title">제목</option>
						<option value="bbs_content">내용</option>
					</select>
					<input type="text" id="inputText" name="ss" value="" style="width:145px;" class="inputbox">
				</td>
			</tr>
			<tr>
				<td class="label">등록일</td>
				<td class="box text">
				<input type="text" id="bbs_sdate" name="bbs_sdate" style="width:68px;" class="inputbox" value=""> ~ <input type="text" id="bbs_edate" name="bbs_edate" style="width:68px;" class="inputbox" value="">
				<a href="#" id="date_term1" mode="yesterday"><img src="https://demo01.swm.whoismall.com/admin/images/button/btn_yesterday.gif"></a>
				<a href="#" id="date_term2" mode="this_day"><img src="https://demo01.swm.whoismall.com/admin/images/button/btn_today.gif"></a>
				<a href="#" id="date_term3" mode="this_week"><img src="https://demo01.swm.whoismall.com/admin/images/button/btn_thisWeek.gif"></a>
				<a href="#" id="date_term4" mode="this_month"><img src="https://demo01.swm.whoismall.com/admin/images/button/btn_thisMonth.gif"></a>
				<a href="#" id="date_term5" mode=""><img src="https://demo01.swm.whoismall.com/admin/images/button/btn_total.gif"></a></td>
			</tr>
		</table>
		
		<!--검색버튼-->
		<div class="alignCenter"><a href="#"><img src="https://demo01.swm.whoismall.com/admin/images/button/btn_Search.gif" id="submit1"/></a></div>
		
		<!-- 리스트 -->
		<div class="boxContainer">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td class="left"> 
						<!-- <select id="bbs_cate_code" name="bbs_cate_code" style="width:100px;">
							<option value="">전체</option>
														<option value="01">기본</option>
													</select> -->
						<span class="bul">검색결과 : </span><span class="fc_red"><strong>2</strong>건</span>
					</td>
					<td align="right" class="right">
						<select id="list_num" name="list_num" style="width:95px;" onchange="changePageScale()">
							<option value="5" >5개 출력</option>
		                    <option value="10" selected>10개 출력</option>
		                    <option value="20">20개 출력</option>
		                    <option value="50">50개 출력</option>
		                    <option value="100">100개 출력</option>
						</select>
					</td>
				</tr>
			</table>
		</div>
		
	   <div>
	    <table class="table">
	    	<thead>
	    	<tr align="center">
	    		<th class="thL"><input type="checkbox" id="check_all" name="check_all" value="bbs_seq[]"></th>
	    		<th class="num">번호</th>
	    		<th class="title">이미지</th>
	    		<th class="title">상품명</th>
	    		<th class="title">제목</th>
	    		<th class="date">작성일</th>
	    		<th class="id">작성자</th>
<!-- 	    		<th class="cnt">조회수</th> -->
	    	</tr>
	    	</thead>
	    	<tbody id="tbody" align="center">
	    		<c:forEach var="rVO" items="${list }" varStatus="i">
				<tr>
				<%-- <td> <c:out value="${totalCount - (currentPage - 1) * pageScale - i.index}"/></td> --%>
				<td class="tdL" align="center"><input type="checkbox" name="bbs_seq[]" value="23"></td>
				<td> <c:out value="${rVO.reviewId}"/></td>
				<td><img src="http://localhost/online-shop/assets/images/goods/<c:out value='${rVO.defaultImg}'/>" style="width:60px; height:60px"></td>
				<td> <c:out value="${rVO.name}"/></td>
				<td><a href="review_detail_admin.jsp?seq=${rVO.reviewId }&currentPage=${empty param.currentPage ?1:param.currentPage}"><c:out value="${rVO.title}"/></a></td>
				<td> <c:out value="${rVO.inputDate}"/></td>
				<td> <c:out value="${rVO.id}"/></td>
				</tr>	    	
	    	</c:forEach>
	    	</tbody>
	    </table>
	    
</div>

	    <div style="text-align: center;">
	    <form action="board_list.jsp" name="frmBoard" id="frmBoard">
	    	<select name="field" id="field">
	    		<option value="0" ${param.field eq 0?" selected='selected'":""}>제목</option>
	    		<option value="1" ${param.field eq 1?" selected='selected'":""}>내용</option>
	    		<option value="2" ${param.field eq 2?" selected='selected'":""}>작성자</option>
	    	</select>
	    	<input type="text" name="keyword" id="keyword" value="${param.keyword }" style="width:230px; border:1px solid #dedede;"/>
	    	<input type="button"  value="검색" id="btnSearch" class="btn btn-info btn-sm"/>
	    	<input type="button"  value="전체글" id="btnAllSearch" class="btn btn-info btn-sm"/>
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
        <%=ReviewBoardUtil.getInstance().pageNation("review_board_list.jsp", param, totalPage, currentPage)%>
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
	</main>

</body>
</html>