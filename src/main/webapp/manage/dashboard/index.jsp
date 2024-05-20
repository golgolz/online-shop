<%@page import="admin.dashboard.DashboardSalesVO"%>
<%@page import="admin.dashboard.DashboardOrderProgressVO"%>
<%@page import="admin.dashboard.DashboardOrderVO"%>
<%@page import="admin.dashboard.DashboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%
Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");

if (!Boolean.TRUE.equals(isLoggedIn)) {
%>
  <script type="text/javascript">
      alert('로그인이 필요합니다.');
      window.location.href = 'http://localhost/manage/adminLogin/adminLogin.jsp';
  </script>
<%
  return;
}
%>
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
<link href="../../assets/css/manage/dashboard/index.css" rel="stylesheet" />
<style>
.dashboard-container{
	margin-left:24px;
}

.chart_tit{
	margin-top: 20px;
	margin-bottom: 10px;
}

.dashboard-container .chart_tit:first-child{
	margin-top:0px;
}
</style>
<!-- golgolz end -->
</head>
<body>
	<jsp:include page="../../assets/jsp/admin/header.jsp" />
	<%
		DashboardDAO dashboardDAO = DashboardDAO.getInstance();
		DashboardOrderVO orderVO = dashboardDAO.selectOrderInfo();	
		DashboardSalesVO salesVO = dashboardDAO.selectSalesInfo();
		DashboardOrderProgressVO progressVO = dashboardDAO.selectPregressInfo();
	%>
	<main
		class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ps ps--active-y">
		<nav
			class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl"
			id="navbarBlur" data-scroll="true">
			<div class="container-fluid py-1 px-3">
				<nav aria-label="breadcrumb">
					<ol
						class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
						<li class="breadcrumb-item text-sm"><a
							class="opacity-5 text-dark" href="javascript:;">
							관리자 기능</a></li>
						<!-- 하단의 대시보드 텍스트를 본인 기능으로 변경 필요  -->
						<li class="breadcrumb-item text-sm text-dark active"
							aria-current="page">대시보드</li>
					</ol>
					<h6 class="font-weight-bolder mb-0">대시보드</h6>
				</nav>
			</div>
		</nav>
		<div class="container-fluid py-4">
			<!-- golgolz start -->
			<div class="dashboard-container">
				<div class="chart_tit">
	           		<h6 class="font-weight-bolder mb-0">주문건수</h6>
	            </div>
	            <table class="chart_tb02">
	            	<tbody>
						<tr>
	                    	<th scope="col" width="310">오늘</th>
	                     	<th scope="col" width="310">이번주</th>
	                      	<th scope="col" width="310">이번달</th>
	                  	</tr>
	                    <tr id="data_stat_month" bgcolor="#f1f1f1">
	                    	<td><strong><%= orderVO.getToday() %>건</strong></td>
	                      	<td><strong><%= orderVO.getWeek() %>건</strong></td>
	                      	<td><strong><%= orderVO.getMonth() %>건</strong></td>
	                  	</tr>
	             	</tbody>
	          	</table>
	          	<div class="chart_tit">
	           		<h6 class="font-weight-bolder mb-0">매출현황</h6>
	            </div>
	            <table class="chart_tb02">
	            	<tbody>
						<tr>
	                    	<th scope="col" width="310">오늘</th>
	                     	<th scope="col" width="310">이번주</th>
	                      	<th scope="col" width="310">이번달</th>
	                  	</tr>
	                    <tr id="data_stat_month" bgcolor="#f1f1f1">
	                    	<td><strong><%= salesVO.getToday() %>원</strong></td>
	                      	<td><strong><%= salesVO.getWeek() %>원</strong></td>
	                      	<td><strong><%= salesVO.getMonth() %>원</strong></td>
	                  	</tr>
	             	</tbody>
	          	</table>
	          	<div class="chart_tit">
	           		<h6 class="font-weight-bolder mb-0">주문현황</h6>
	            </div>
	            <table class="chart_tb02">
	            	<tbody>
						<tr>
	                    	<th scope="col">주문완료</th>
	                     	<th scope="col">배송준비</th>
	                      	<th scope="col">배송중</th>
	                      	<th scope="col">배송완료</th>
	                      	<th scope="col">구매확정</th>
	                  	</tr>
	                    <tr id="data_stat_month" bgcolor="#f1f1f1">
	                    	<td><strong><%= progressVO.getOrderDone() %>건</strong></td>
	                      	<td><strong><%= progressVO.getDeliveryReady() %>건</strong></td>
	                      	<td><strong><%= progressVO.getDeliveryInProgress() %>건</strong></td>
	                      	<td><strong><%= progressVO.getDeliveryDone() %>건</strong></td>
	                      	<td><strong><%= progressVO.getOrderConfirmed() %>건</strong></td>
	                  	</tr>
	             	</tbody>
	          	</table>
	          	<div class="chart_tit">
	           		<h6 class="font-weight-bolder mb-0">반품현황</h6>
	            </div>
	            <table class="chart_tb02">
	            	<tbody>
						<tr>
	                      	<th scope="col" width="310">반품건수</th>
	                  	</tr>
	                    <tr id="data_stat_month" bgcolor="#f1f1f1">
	                    	<td><strong><%= orderVO.getRefund() %>건</strong></td>
	                  	</tr>
	             	</tbody>
	          	</table>
			</div>
			<!-- golgolz end -->
		</div>
	</main>
</body>
</html>