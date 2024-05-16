<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.sql.SQLException"%>
<%@page import="admin.goods.AdminGoodsDAO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../assets/jsp/admin/lib.jsp" />
<script type="text/javascript">
	$(function(){
    	$("#dashboard_menu").addClass("bg-gradient-primary");
	});
</script>
<!-- golgolz start -->
<!-- golgolz end -->
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	File saveDir = new File("C:/Users/user/git/online-shop/src/main/webapp/assets/images/goods");
	int maxSize = 1024 * 1024 * 100;
	
	try{
		MultipartRequest mr = new MultipartRequest(request, saveDir.getAbsolutePath(), maxSize, "UTF-8", new DefaultFileRenamePolicy());
	    AdminGoodsDAO adminGoodsDAO = AdminGoodsDAO.getInstance();
	    
	    int count = adminGoodsDAO.deleteGoods(mr.getParameter("code"));
	    
	    if(count != 1){
	        // undo transaction or throws exception
	        return;
	    }
	    %>
	    <script type="text/javascript">
		    alert("삭제가 완료되었습니다.");
		    location.href="http://localhost/manage/goods/goods.jsp";
	    </script>
	    <%
	} catch(SQLException se){
	    se.printStackTrace();
	    // location.href="http://localhost/error/err_500.html"
	} catch(Exception e){
	    e.printStackTrace();
	}
%>
</body>
</html>