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
	<jsp:useBean id="goodsVO" class="admin.goods.AdminGoodsDetailVO" scope="page" />
	<jsp:setProperty property="*" name="goodsVO" />
	<%
		System.out.println(goodsVO.toString());
	%>
	${param.name }
</body>
</html>