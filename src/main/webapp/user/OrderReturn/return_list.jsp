<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../assets/jsp/user/lib.jsp" />
<!-- golgolz start -->
<style>
.ec-base-box {
	padding: 20px;
	margin-left: auto;
	margin-right: auto;
	border: 5px solid #e8e8e8;
	color: #404040;
}

.xans-myshop-orderhistoryhead .stateSelect {
	display: inline-block;
	padding: 0 12px 0 0;
	margin: 0 5px 0 2px;
	background: url(//img.echosting.cafe24.com/skin/base/common/ico_bar.gif)
		no-repeat 100% 6px;
}

[class^='btnNormal'], a[class^='btnNormal'] {
	display: inline-block;
	box-sizing: border-box;
	padding: 2px 8px;
	border: 1px solid #d1d1d1;
	border-radius: 2px;
	font-family: "굴림", Gulim;
	font-size: 12px;
	line-height: 18px;
	font-weight: normal;
	text-decoration: none;
	vertical-align: middle;
	word-spacing: -0.5px;
	letter-spacing: 0;
	text-align: center;
	white-space: nowrap;
	color: #222;
	background-color: #fff;
}

.xans-myshop-orderhistoryhead fieldset button {
	width: 14px;
	height: 14px;
	margin: 0 5px 0 2px;
	background: none;
}

.xans-myshop-orderhistoryhead fieldset img {
	vertical-align: middle;
}

fieldset {
	display: block;
	margin-inline-start: 2px;
	margin-inline-end: 2px;
	padding-block-start: 0.35em;
	padding-inline-start: 0.75em;
	padding-inline-end: 0.75em;
	padding-block-end: 0.625em;
	min-inline-size: min-content;
	border-width: 2px;
	border-style: groove;
	border-color: rgb(192, 192, 192);
	border-image: initial;
}

.xans-myshop-orderhistoryhead fieldset .period a {
	padding: 0;
	border: 0;
}

.xans-myshop-orderhistoryhead fieldset .fText {
	width: 72px;
	height: 22px;
	margin: 0 0 0 2px;
	padding: 0 6px;
	border: 1px solid #d5d5d5;
	line-height: 22px;
	font-size: 12px;
}

.xans-myshop-orderhistoryhead ul {
	margin: 10px 0 0;
	color: #939393;
	line-height: 1.5;
}

.xans-myshop-orderhistoryhead ul li {
	padding: 0 0 0 9px;
	background:
		url(//img.echosting.cafe24.com/skin/base/common/ico_square2.gif)
		no-repeat 4px 7px;
}

.xans-myshop-orderhistorylistitem .title {
	margin: 40px 0 10px 10px;
}

.xans-myshop-orderhistoryhead fieldset .period img {
	margin: 0 0 0 -1px;
}

.xans-myshop-orderhistoryhead fieldset .period {
	display: inline-block;
	margin: 0 2px;
	font-size: 0;
	vertical-align: middle;
}

.xans-myshop-orderhistorylistitem.ec-base-table td .line {
	text-decoration: underline;
}
th{ 
	text-align: center;
}
table,td{
	text-align: center;
}

#history_start_date,#history_end_date{
	width: 90px;
}
</style>
<!-- golgolz end -->
</head>
<body>
	<jsp:include page="../../assets/jsp/user/header.jsp" />
	<div id="wrap">
		<div id="main">
			<div id="container">
				<div id="contents">

					<div class="path">
						<span>현재 위치</span>
						<ol>
							<li><a href="/">홈</a></li>
							<li><a href="/myshop/index.html">마이쇼핑</a></li>
							<li title="현재 위치"><strong>주문조회</strong></li>
						</ol>
					</div>

					<div class="titleArea">
						<h2>주문조회</h2>
					</div>

					<div
						class="xans-element- xans-myshop xans-myshop-orderhistorytab ec-base-tab ">
						<ul class="menu">
							<li class="tab_class"><a
								href="http://localhost/online-shop/user/OrderReturn/order_list.jsp">주문내역조회
									(<span id="xans_myshop_total_orders">1</span>)
							</a></li>
							<li class="tab_class_cs selected"><a
								href="http://localhost/online-shop/user/OrderReturn/return_list.jsp">반품
									내역 (<span id="xans_myshop_total_orders_cs">1</span>)
							</a></li>
							<li class="tab_class_old displaynone"><a
								href="/myshop/order/list_old.html?mode=old&amp;history_start_date=2024-01-25&amp;history_end_date=2024-04-24&amp;past_year=2023">이전
									주문내역 (<span id="xans_myshop_total_orders_old">0</span>)
							</a></li>
						</ul>
					</div>

					<form method="GET" id="OrderHistoryForm" name="OrderHistoryForm">
						<div
							class="xans-element- xans-myshop xans-myshop-orderhistoryhead ">
							<fieldset class="ec-base-box">
								<legend>검색기간설정</legend>
								<div class="stateSelect displaynone"></div>
								<span class="period"> <a href="#none" class="btnNormal"
									days="00"><img
										src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date1.gif"
										offimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date1.gif"
										onimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date1_on.gif"
										alt="오늘"></a> <a href="#none" class="btnNormal" days="07"><img
										src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date2.gif"
										offimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date2.gif"
										onimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date2_on.gif"
										alt="1주일"></a> <a href="#none" class="btnNormal" days="30"><img
										src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date3.gif"
										offimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date3.gif"
										onimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date3_on.gif"
										alt="1개월"></a> <a href="#none" class="btnNormal" days="90"><img
										src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date4.gif"
										offimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date4.gif"
										onimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date4_on.gif"
										alt="3개월"></a> <a href="#none" class="btnNormal" days="180"><img
										src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date5.gif"
										offimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date5.gif"
										onimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date5_on.gif"
										alt="6개월"></a>
								</span> <input id="history_start_date" name="history_start_date"
									class="fText hasDatepicker" readonly="readonly" size="10"
									value="2024-01-25" type="text">
								<button type="button" class="ui-datepicker-trigger">
									<img
										src="//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/ico_cal.gif"
										alt="..." title="...">
								</button>
								~ <input id="history_end_date" name="history_end_date"
									class="fText hasDatepicker" readonly="readonly" size="10"
									value="2024-04-24" type="text">
								<button type="button" class="ui-datepicker-trigger">
									<img
										src="//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/ico_cal.gif"
										alt="..." title="...">
								</button>
								<input alt="조회" id="order_search_btn" type="image"
									src="//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/btn_search.gif">
							</fieldset>
							<ul>
								<li>기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.</li>
								<li>주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
								<li class="displaynone">취소/교환/반품 신청은 일까지 가능합니다.</li>
							</ul>
						</div>
						<input id="mode" name="mode" value="cs" type="hidden"> <input
							id="term" name="term" value="" type="hidden">
					</form>
					<div
						class="xans-element- xans-myshop xans-myshop-orderhistorylistitem ec-base-table typeList">
						<!--
        $login_url = /member/login.html
    -->
						<div class="title">
							<h6>반품 상품 정보</h6>
						</div>
						<table border="1" summary="">
							<caption>반품</caption>
							<colgroup>
								<col style="width: 135px;">
								<col style="width: 93px;">
								<col style="width: auto;">
								<col style="width: 61px;">
								<col style="width: 111px;">
								<col style="width: 111px;">
								<col style="width: 111px;">
								<col style="width: 111px;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">주문일자<br>[주문번호]
									</th>
									<th scope="col">이미지</th>
									<th scope="col">상품정보</th>
									<th scope="col">수량</th>
									<th scope="col">상품구매금액</th>
									<th scope="col">반품일자</th>
									<th scope="col">반품상태</th>
									<th scope="col">환불금액</th>
								</tr>
							</thead>
							<tbody class="center ">
								<tr class="xans-record-">
									<td class="number ">2024-04-07
										<p>
											<a href="http://localhost/user_src/order/returndetail.html"
												class="line">[20240407-0000129]</a>
										</p>




									</td>
									<td class="thumb"><a
										href="/product/detail.html?product_no=6183&amp;cate_no=523"><img
											src="//insideobject.com/web/product/medium/202307/890ea578b65f474e850a49e0862f1158.jpg"
											onerror="this.src='//img.echosting.cafe24.com/thumb/img_product_small.gif';"
											style="width: 100px;" alt=""></a></td>
									<td class="product left top"><strong class="name"><a
											href="/product/i-live-with-six-cats-고양이의-바다-유광-카드-하드-케이스/6183/category/523/"
											class="ec-product-name">[i live with six cats] 고양이의 바다 유광
												카드 하드 케이스</a></strong>
										<div class="option ">[옵션: galaxy s22 (카드하드불가)/유광하드]</div>
										<p class="gBlank5 displaynone">무이자할부 상품</p></td>
									<td>1</td>
									<td class="state"><strong>20,000원</strong>
										<div class="displaynone"></div></td>
									<td class="state">
										<p>2024-04-10</p>
									</td>
									<td class="state">
										<p class="txtEm">반품완료</p>
										<p class="displaynone">
											<a href="#" target="_self"></a>
										</p>
										<p class="displaynone">
											<a href="#none" class="line" onclick="">[]</a>
										</p>
									</td>
									<td>
										<p>20,000원</p>
										<p class="displaynone">-</p>
									</td>
								</tr>
							</tbody>
						</table>
						<p class="message displaynone">주문 내역이 없습니다.</p>
					</div>

					<div
						class="xans-element- xans-myshop xans-myshop-orderhistorypaging ec-base-paginate">
						<a
							href="?page=1&amp;mode=cs&amp;history_start_date=2024-01-25&amp;history_end_date=2024-04-24&amp;past_year=2023"
							class="first"><img
							src="//img.echosting.cafe24.com/skin/base/common/btn_page_first.gif"
							alt="첫 페이지"></a> <a
							href="?page=1&amp;mode=cs&amp;history_start_date=2024-01-25&amp;history_end_date=2024-04-24&amp;past_year=2023"><img
							src="//img.echosting.cafe24.com/skin/base/common/btn_page_prev.gif"
							alt="이전 페이지"></a>
						<ol>
							<li class="xans-record-"><a
								href="?page=1&amp;mode=cs&amp;history_start_date=2024-01-25&amp;history_end_date=2024-04-24&amp;past_year=2023"
								class="this">1</a></li>
						</ol>
						<a
							href="?page=1&amp;mode=cs&amp;history_start_date=2024-01-25&amp;history_end_date=2024-04-24&amp;past_year=2023"><img
							src="//img.echosting.cafe24.com/skin/base/common/btn_page_next.gif"
							alt="다음 페이지"></a> <a
							href="?page=1&amp;mode=cs&amp;history_start_date=2024-01-25&amp;history_end_date=2024-04-24&amp;past_year=2023"
							class="last"><img
							src="//img.echosting.cafe24.com/skin/base/common/btn_page_last.gif"
							alt="마지막 페이지"></a>
					</div>
				</div>
			</div>
			<hr class="layout">
			<div id="banner"></div>
			<div id="quick"></div>
		</div>
	</div>
</body>
</html>