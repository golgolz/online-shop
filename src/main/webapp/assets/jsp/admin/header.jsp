<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<noscript>
	<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NKDMSK6"
		height="0" width="0" style="display: none; visibility: hidden"></iframe>
</noscript>

<aside
	class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3 bg-gradient-dark ps bg-white"
	id="sidenav-main">
	<div class="sidenav-header">
		<a class="navbar-brand m-0"
			href="http://localhost/manage/dashboard/index.jsp"
			> <span class="ms-1 font-weight-bold text-white"
			style="font-size: 25px">관리자</span>
		</a>
	</div>
	<hr class="horizontal light mt-0 mb-2" />
		<ul class="navbar-nav">
			<li class="nav-item">
				<a
					id="dashboard_menu"
					class="nav-link text-white"
					href="http://localhost/manage/dashboard/index.jsp">
					<span class="nav-link-text ms-1">대시보드</span>
				</a>
			</li>
			<li class="nav-item">
				<a 
					id="order_menu"
					class="nav-link text-white"
					href="http://localhost/manage/order/orders.jsp?page=1">
					<span class="nav-link-text ms-1">주문 관리</span>
				</a>
			</li>
			<li class="nav-item">
				<a
					id="refund_menu"
					class="nav-link text-white"
					href="http://localhost/manage/refund/refunds.jsp?page=1">
					<span class="nav-link-text ms-1">반품 관리</span>
				</a>
			</li>
			<li class="nav-item">
				<a 
					id="goods_menu"
					class="nav-link text-white"
					href="http://localhost/manage/goods/goods.jsp?page=1">
					<span class="nav-link-text ms-1">상품 관리</span>
				</a>
			</li>
			<li class="nav-item">
				<a
					id="user_menu"
					class="nav-link text-white"
					href="http://localhost/manage/user/user.jsp">
					<span class="nav-link-text ms-1">사용자 관리</span>
				</a>
			</li>
			<li class="nav-item">
				<a
					id="review_menu"
					class="nav-link text-white"
					href="http://localhost/manage/review/review_board_list.jsp">
					<span class="nav-link-text ms-1">리뷰 관리</span>
				</a>
			</li>
			<li class="nav-item">
				<a
					id="notice_menu"
					class="nav-link text-white"
					href="http://localhost/manage/notice/notice.jsp">
					<span class="nav-link-text ms-1">공지사항 관리</span>
				</a>
			</li>
		</ul>
</aside>