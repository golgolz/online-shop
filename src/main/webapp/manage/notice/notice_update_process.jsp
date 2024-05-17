<%@page import="java.sql.SQLException"%>
<%@page import="notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--bootstrap시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap끝-->

<!--jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->
<style type="text/css">
<% request.setCharacterEncoding("UTF-8"); %>
</style>
<jsp:useBean id="nVO" class="notice.NoticeVO" scope="page"/>
<jsp:setProperty property="*" name="nVO"/>
<script type="text/javascript">
	<%
try{
    NoticeDAO nDAO=NoticeDAO.getInstance();
    nVO.setTitle(request.getParameter("title"));
    nVO.setContent(request.getParameter("content"));
    System.out.println(request.getParameter("title"));
    System.out.println(request.getParameter("content"));
    int cnt= nDAO.updateNotice(nVO);
    if(cnt==1){
   %>
		alert("글을 수정했습니다."); 
		location.href="http://object.sist.co.kr/manage/notice/notice.jsp";
   <%
    }else{
   %>
     alert("글 수정에 실패했습니다. 다시 시도해주세요.");
   <%
    }
    }catch(SQLException se) {
        se.printStackTrace();
	%> 
	alert("오류발생");
	/* location.href="notice.jsp"; */
	<%
    }//end catch
	%> 

		$(function(){
			
		});//ready
</script>
</head>
<body>
<div>
	
</div>
</body>
</html>