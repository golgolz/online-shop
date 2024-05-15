<%@page import="util.PageController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../assets/jsp/admin/lib.jsp" />
<link href="http://localhost/online-shop/assets/css/pagenation.css" rel="stylesheet" />
<link href="http://localhost/online-shop/assets/css/manage/order/admin.css" rel="stylesheet" />
<link href="http://localhost/online-shop/assets/css/manage/order/reset.css" rel="stylesheet" />
<script type="text/javascript">
	$(function() {
		$("#refund_menu").addClass("bg-gradient-primary");
	});
</script>
<!-- golgolz start -->
<style>
.od_status {
	font-size: 12px;
	color: black;
}
</style>
<!-- golgolz end -->
</head>
<body>
	<jsp:useBean id="searchVO" class="admin.refund.SearchVO" scope="page" />
	<jsp:setProperty property="*" name="searchVO" />
	<%
		// pagenation
		int pageScale = 5;
		int currentPage = Integer.parseInt(request.getParameter("page"));
		int startNum = pageScale * (currentPage - 1) + 1;
		int endNum = startNum + pageScale - 1;
		searchVO.setStart(startNum);
		searchVO.setEnd(endNum);
				
		PageController pageController = PageController.getInstance();
		String params = pageController.createQueryStr(request);
		int searchResultCount = 10;
	%>
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
							class="opacity-5 text-dark" href="javascript:;"> 관리자 기능</a></li>
						<!-- 하단의 대시보드 텍스트를 본인 기능으로 변경 필요  -->
						<li class="breadcrumb-item text-sm text-dark active"
							aria-current="page">반품 관리</li>
					</ol>
					<h6 class="font-weight-bolder mb-0">반품 관리</h6>
				</nav>
			</div>
		</nav>
		<div class="container-fluid py-4">
			<!-- golgolz start -->
			<div class="s_wrap">
				<form name="fsearch" id="fsearch">
					<input type="hidden" name="code" value="list">
					<div class="tbl_frm01">
						<table>
							<colgroup> 
								<col class="w100">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">검색어</th>
									<td>
										<input type="hidden" name="page" value="1" />
										<select name="category">
												<option value="0"${param.category eq '0' ? " selected" : "" }>주문번호</option>
												<option value="1"${param.category eq '1' ? " selected" : "" }>회원아이디</option>
												<option value="2"${param.category eq '2' ? " selected" : "" }>주문자명</option>
												<option value="3"${param.category eq '3' ? " selected" : "" }>수령자명</option>
										</select> 
										<input type="text" name="keyword" value="${ param.keyword }" class="frm_input" size="30">
									</td>
								</tr>
								<tr>
									<th scope="row">기간검색</th>
	              					<td class="box text">
	              						<input type="hidden" id="date" name="date" value="${param.date}" />
	              						<img id="btn_today" class="clickable-image${param.date eq 'today' ? " clicked" : "" }" src="http://localhost/online-shop/assets/images/manage/goods/btn_today.gif" />
										<img id="btn_week" class="clickable-image${param.date eq 'week' ? " clicked" : "" }" src="http://localhost/online-shop/assets/images/manage/goods/btn_thisWeek.gif" />
										<img id="btn_month" class="clickable-image${param.date eq 'month' ? " clicked" : "" }" src="http://localhost/online-shop/assets/images/manage/goods/btn_thisMonth.gif" />
						                <img id="btn_total" class="clickable-image${param.date eq 'total' ? " clicked" : "" }" src="http://localhost/online-shop/assets/images/manage/goods/btn_total.gif" />
	              					</td>
								</tr>
								<tr>
									<th scope="row">반품상태</th>
									<td>
										<label class="od_status">
											<input type="radio" name="delivery" value="0"${param.delivery eq '0' ? " checked" : "" }> 전체
										</label> 
										<label class="od_status">
											<input type="radio" name="delivery" value="1"${param.delivery eq '1' ? " checked" : "" }> 반품접수
										</label> 
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btn_confirm">
						<input type="submit" value="검색" class="btn_medium"> 
						<!-- <input type="button" value="초기화" id="frmRest" class="btn_medium grey"> -->
					</div>
				</form>
				<div class="local_ov mart30">
						<%-- 전체 : <b class="fc_red"><%= searchResultCount %></b> 건 조회 --%>
				</div>
				<div class="tbl_head01">
					<table id="sodr_list">
						<colgroup>
							<col class="w120">
							<col class="w100">
							<col class="w40">
							<col class="w40">
							<col class="w60">
							<col class="w120">
							<col class="w100">
							<col class="w90">
						</colgroup>
						<thead>
						<tr>
							<th scope="col">주문일시</th>
							<th scope="col">주문번호</th>
							<th scope="col">주문자ID</th>
							<th scope="col">주문자명</th>
							<th scope="col">반품상태</th>
							<th scope="col">반품일시</th>
							<th scope="col">환불금액</th>
							<th scope="col">결제수단</th>
						</tr>
						</thead>
						<tbody>
						<tr class="list0">
							<td>2024-02-01 11:53</td>
							<td>202402011153</td>
							<td>lee</td>
							<td>이명화</td>
							<td>반품완료</td>
							<td>2024-02-07 22:11</td>
							<td>100,000원</td>
							<td>카드결제</td>
						</tr>
						</tbody>
					</table>
				</div>
				<div class="alignCenter">
          			<table cellpadding="0" cellspacing="0" border="0" width="100%">
            			<tbody>
              				<tr>
                				<td align="center">
                 					<%
							        	String pageNation = 
									        	pageController.createPagingBtns("http://localhost/online-shop/manage/order/orders.jsp", params
							        	        , Integer.parseInt(request.getParameter("page")), (searchResultCount / pageScale) + 1);
						        	%>
						        	<div id="pageNation">
								        <%= pageNation %>
							        </div>		
                				</td>
              				</tr>
            			</tbody>
          			</table>
        		</div>	
			</div>
			<!-- golgolz end -->
		</div>
	</main>
</body>
</html>