<%@page import="java.sql.SQLException"%>
<%@page import="admin.goods.AdminGoodsDAO"%>
<%@page import="admin.goods.AdminGoodsDetailVO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
    <% request.setCharacterEncoding("UTF-8"); %>
<%
	File saveDir = new File("C:/Users/user/git/online-shop/src/main/webapp/assets/images/goods");
	int maxSize = 1024 * 1024 * 100;
	
	try{
	    AdminGoodsDAO adminGoodsDAO = AdminGoodsDAO.getInstance();

	    MultipartRequest mr = new MultipartRequest(request, saveDir.getAbsolutePath(), maxSize, "UTF-8", new DefaultFileRenamePolicy());
%>
<script>
<%
		if(mr.getParameter("code").equals("") || mr.getParameter("name").equals("") 
		        || mr.getParameter("description").equals("") || mr.getParameter("model").equals("")
		        || mr.getParameter("material").equals("") || mr.getParameter("maker").equals("") 
		        || mr.getParameter("price").equals("") || mr.getParameter("deliveryCharge").equals("")
		        || mr.getParameter("soldOutFlag").equals("") || (mr.getParameter("soldOutFlag").equals("F") && mr.getParameter("amount").equals(""))
		        || mr.getFilesystemName("defaultImage") == null || mr.getFilesystemName("detailImage") == null){
%>
		alert("값이 유효하지 않습니다. 상품 등록 페이지로 돌아갑니다.");
		location.href="http://localhost/manage/goods/detail.jsp";
<%		} %>
</script>
<%
	    AdminGoodsDetailVO adminGoodsDetailVO = new AdminGoodsDetailVO();
	    
	    StringBuilder code = new StringBuilder();
	    code.append(mr.getParameter("maker").equals("1") ? "SAMSUNG" : "APPLE").append("_").append(mr.getParameter("model")).append("_");
	    code.append(adminGoodsDAO.selectAllGoodsCount(mr.getParameter("maker").equals("1") ? "삼성" : "애플") + 1);
	    System.out.println(code);
	    adminGoodsDetailVO.setCode(code.toString());
	    adminGoodsDetailVO.setName(mr.getParameter("name"));
	    adminGoodsDetailVO.setSoldOutFlag(mr.getParameter("soldOutFlag"));
	    adminGoodsDetailVO.setDefaultImage(mr.getFilesystemName("defaultImage") == null ? mr.getParameter("defaultImageOrigin") : mr.getFilesystemName("defaultImage"));
	    adminGoodsDetailVO.setDetailImage(mr.getFilesystemName("detailImage") == null ? mr.getParameter("detailImageOrigin") : mr.getFilesystemName("detailImage"));
	    adminGoodsDetailVO.setDescription(mr.getParameter("description"));
	    adminGoodsDetailVO.setModel(mr.getParameter("model"));
	    adminGoodsDetailVO.setMaterial(mr.getParameter("material").equals("1") ? "실리콘" : "하드");
	    adminGoodsDetailVO.setMaker(mr.getParameter("maker").equals("1") ? "삼성" : "애플");
	    adminGoodsDetailVO.setAmount(Integer.parseInt(mr.getParameter("soldOutFlag").equals("T") ? "0" : mr.getParameter("amount")));
	    adminGoodsDetailVO.setPrice(Integer.parseInt(mr.getParameter("price")));
	    adminGoodsDetailVO.setDeliveryCharge(Integer.parseInt(mr.getParameter("deliveryCharge")));
	    
	    adminGoodsDAO.insertGoods(adminGoodsDetailVO);
	    %>
	    <script type="text/javascript">
		    alert("등록이 완료되었습니다.");
		    location.href="http://localhost/manage/goods/detail.jsp?code=<%= code %>";
	    </script>
	    <%
	} catch(SQLException se){
	    se.printStackTrace();
	    // location.href="http://localhost/error/err_500.html"
	} catch(Exception e){
	    e.printStackTrace();
	}
%>