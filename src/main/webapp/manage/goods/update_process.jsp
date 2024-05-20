<%@page import="admin.goods.AdminGoodsDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="admin.goods.AdminGoodsDetailVO"%>
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
		// 3. 업로드 컴포넌트 생성 (cos.jar), 생성과 동시에 파일이 업로드된다.
		MultipartRequest mr = new MultipartRequest(request, saveDir.getAbsolutePath(), maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
	    AdminGoodsDetailVO adminGoodsDetailVO = new AdminGoodsDetailVO();
	    adminGoodsDetailVO.setCode(mr.getParameter("code"));
	    adminGoodsDetailVO.setName(mr.getParameter("name"));
	    adminGoodsDetailVO.setSoldOutFlag(mr.getParameter("soldOutFlag"));
	    adminGoodsDetailVO.setDefaultImage(mr.getFilesystemName("defaultImage") == null ? mr.getParameter("defaultImageOrigin") : mr.getFilesystemName("defaultImage"));
	    adminGoodsDetailVO.setDetailImage(mr.getFilesystemName("detailImage") == null ? mr.getParameter("detailImageOrigin") : mr.getFilesystemName("detailImage"));
	    adminGoodsDetailVO.setDescription(mr.getParameter("description"));
	    adminGoodsDetailVO.setModel(mr.getParameter("model"));
	    adminGoodsDetailVO.setMaterial(mr.getParameter("material").equals("1") ? "실리콘" : "하드");
	    adminGoodsDetailVO.setMaker(mr.getParameter("maker").equals("1") ? "삼성" : "애플");
	    adminGoodsDetailVO.setAmount(Integer.parseInt(mr.getParameter("amount")));
	    adminGoodsDetailVO.setPrice(Integer.parseInt(mr.getParameter("price")));
	    adminGoodsDetailVO.setDeliveryCharge(Integer.parseInt(mr.getParameter("deliveryCharge")));
	    
	    AdminGoodsDAO adminGoodsDAO = AdminGoodsDAO.getInstance();
	    
	    int count = adminGoodsDAO.updateGoods(adminGoodsDetailVO);
	    
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