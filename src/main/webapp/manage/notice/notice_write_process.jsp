<%@page import="java.sql.SQLException"%>
<%@page import="notice.NoticeDAO"%>
<%@page import="notice.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.217/jsp_prj/common/favicon.ico"/>
<!--bootstrap시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap끝-->
<link rel="stylesheet" href="http://192.168.10.217/jsp_prj/common/css/main.css" media="all" />
<link rel="stylesheet" href="http://192.168.10.217/jsp_prj/common/css/board.css" type="text/css" media="all" />

<!--jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->

<style type="text/css">

</style>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="nVO" class="notice.NoticeVO" scope="page"/>
<jsp:setProperty property="*" name="nVO"/>
<script type="text/javascript">
		<%
		try{
		//nVO.setAuthor((NoticeVO)session.getAttribute("adminData")).getAuthor();
		//관리자 아이디 어케 받는지 물어보쇼..
		
		NoticeDAO nDAO=NoticeDAO.getInstance();
		nDAO.insertNotice(nVO);
		%>
		alert("작성을 완료했습니다.");
		location.href="notice.jsp";
		<%
		}catch(SQLException se){
			se.printStackTrace();
		 %>
		 alert("오류가 발생했습니다.");
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