<%@page import="java.sql.SQLException"%>
<%@page import="admin.goods.AdminGoodsDetailVO"%>
<%@page import="admin.goods.AdminGoodsDAO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
		// 3. 업로드 컴포넌트 생성 (cos.jar), 생성과 동시에 파일이 업로드된다.
		MultipartRequest mr = new MultipartRequest(request, saveDir.getAbsolutePath(), maxSize, "UTF-8", new DefaultFileRenamePolicy());
	    AdminGoodsDAO adminGoodsDAO = AdminGoodsDAO.getInstance();
	    
	    int count = adminGoodsDAO.updateSoldOut(mr.getParameter("code"));
	    
	    if(count != 1){
	        // undo transaction or throws exception
	        return;
	    }
	    %>
	    <script type="text/javascript">
		    alert("수정이 완료되었습니다.");
		    location.href="http://localhost/manage/goods/detail.jsp?code=<%= mr.getParameter("code") %>";
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