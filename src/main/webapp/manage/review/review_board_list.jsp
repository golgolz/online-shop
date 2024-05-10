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

<style type="text/css">
	#wrap{width: 1462px; height:749; margin:0px auto;}
	/* #header{height:100px; background:#FFFFFF url('http://192.168.10.216/jsp_prj/common/images/header.png') no-repeat;} */
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
		});//ready
		
		function chkNull() {
			if($("#keyword").val().trim() !="") {
				//alert("검색 키워드를 입력해주세요.")
				$("#frmBoard").submit();
				
			}//end if
		}//chkNull
</script>
</head>
<body>
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
		    int pageScale=10;
		    //3.총 페이지 수
		    /*
		    int totalPage=totalCount/pageScale;
		    if(totalPage % pageScale !=0){
		        totalPage++;
		    }//end if
		    */
		    int totalPage=(int)Math.ceil((double)totalCount/pageScale);
		    //4.게시물의 시작번호
		    String tempPage=sVO.getCurrentPage();
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
		    
		    List<ReviewBoardVO> list=rDAO.selectBoard(sVO);//시작번호와 끝 번호 사이의 글 조회
		   	pageContext.setAttribute("list", list);
		    
		    pageContext.setAttribute("totalCount", totalCount);
		    pageContext.setAttribute("pageScale", pageScale);
		    pageContext.setAttribute("currentPage", currentPage);
	%>   
	   <%--  총 레코드의 수 : <%=totalCount%>건<br/>
	    한 화면에 보여줄 게시물의 수 :<%=pageScale%>건<br/>
	    총 페이지 수 :<%=totalPage%>건<br/>
	    클릭한 페이지 :<%=tempPage%>/<%=currentPage%>번<br/>
	    시작번호 :<%=startNum%>번<br/>
	    끝번호 :<%=endNum%>번<br/> --%>
	    
	   <div>
	    <table class="table">
	    	<thead>
	    	<tr>
	    		<th class="num">번호</th>
	    		<th class="title">이미지</th>
	    		<th class="title">상품명</th>
	    		<th class="title">제목</th>
	    		<th class="date">작성일</th>
	    		<th class="id">작성자</th>
<!-- 	    		<th class="cnt">조회수</th> -->
	    	</tr>
	    	</thead>
	    	<tbody>
	    		<c:forEach var="rVO" items="${list }" varStatus="i">
				<tr>
				<%-- <td> <c:out value="${totalCount - (currentPage - 1) * pageScale - i.index}"/></td> --%>
				<td> <c:out value="${rVO.reviewId}"/></td>
				<td> <c:out value="${rVO.defaultImg}"/></td>
				<td> <c:out value="${rVO.name}"/></td>
				<td> <c:out value="${rVO.title}"/></td>
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
	    	<input type="text" name="keyword" id="keyword" value="${param.keyword }" style="width:230px;"/>
	    	<input type="button"  value="검색" id="btnSearch" class="btn btn-info btn-sm"/>
	    	<input type="button"  value="전체글" id="btnAllSearch" class="btn btn-info btn-sm"/>
	    	<input type="text" style="display: none;">
	    </form>
	    </div>
	    
	    
	  <div style="text-align: center;">
	  
	  <%
	  	  String param="";
	  	  %>
        <c:if test="${not empty param.keyword }">
        <%
        param="&field="+request.getParameter("field")+"&keyword="+request.getParameter("keyword");
        %>
            <c:set var="link2" value="&field=${param.field}&keyword=${param.keyword }" />
        </c:if>
       <%--  <% for(int i = 1; i <= totalPage; i++){ %>
            [<a href="board_list.jsp?currentPage=<%= i %>${link2}"><%= i %></a>]
        <% } %> --%>
        
        <%-- <%
        //1. 한 화면에서 보여줄 페이지 인덱스 수
        int pageNumber=3;
        //2. 화면에 보여줄 시작 페이지 번호
        int startPage=((currentPage-1)/pageNumber)*pageNumber+1;
        //3. 화면에 보여줄 마지막 페이지 번호
        int endPage=(((startPage-1)+pageNumber)/pageNumber)*pageNumber;
        //4. 총 페이지의 수가 연산된 마지막 페이지 수보다 작다면 총 페이지 수가 마지막 페이지 번호로 설정된다.
        if(totalPage <= endPage){
          endPage=totalPage;
        }
        
        //5. 첫 페이지가 인덱스 화면이 아닌 경우
        String prevMark="[<<]";
        int movePage=0;
        if(currentPage > pageNumber){//시작페이지보다 1 적은 페이지로 이동
          movePage=startPage-1;
          prevMark="[<a href='board_list.jsp?currentPage="+movePage+"'>&lt;&lt;</a>]";
        }
        
        //6. 시작페이지 번호 부터 끝 페이지 번호까지 화면에 출력
        String pageLink="";
        
        movePage=startPage;
        System.out.println( movePage+" / " +startPage+" / " +endPage);
        while(movePage <= endPage){
          if(movePage == currentPage){//현재 페이지에 대해서는 링크를 생성하지 않는다.
            pageLink+="[<span style='font-size:20px'>"+currentPage+"</span>]";
          }else{
            pageLink+="[<a href='board_list.jsp?currentPage="+movePage+"'>" + movePage + "</a>]";
          }
          movePage++;
        }
        
        //7. 뒤에 페이지가 더 있는 경우
        String endMark="[&gt;&gt;]";
        if( totalPage > endPage ){
          movePage=endPage+1;
          endMark="[<a href='board_list.jsp?currentPage="+movePage+"'> &gt;&gt; </a>]";
        }
        
        %> --%>
        <%-- <br/>
        시작번호 <%= startPage %>
        <br/>
        끝번호 <%= endPage %>
        <br/> --%>
        <%=ReviewBoardUtil.getInstance().pageNation("board_list.jsp", param, totalPage, currentPage)%>
        
        <%-- <%= prevMark %> ... <%= pageLink %> ...<%= endMark %> --%>
    </div>
    
    <%
		}catch (SQLException se){
			se.printStackTrace();
			out.println(".");
		}
	%>
	    </div>
	    
</div>
	
</body>
</html>