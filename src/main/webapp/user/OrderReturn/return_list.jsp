<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="user.orderReturnSearch.ReturnVO"%>
<%@page import="java.util.List"%>
<%@page import="user.orderReturnSearch.OrderReturnDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>

<!-- DatePicker -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css"> 
<!-- DatePicker -->

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
								href="http://localhost/user/OrderReturn/order_list.jsp">주문내역조회
							</a></li>
							<li class="tab_class_cs selected"><a
								href="http://localhost/user/OrderReturn/return_list.jsp">반품
							</a></li>
							<li class="tab_class_old displaynone"><a
								href="/myshop/order/list_old.html?mode=old&amp;history_start_date=2024-01-25&amp;history_end_date=2024-04-24&amp;past_year=2023">이전
									주문내역 (<span id="xans_myshop_total_orders_old">0</span>)
							</a></li>
						</ul>
					</div>
<script>
$(function() {
	
	
    $("#btnToday").click(function() {// 오늘 날짜 불러오기
        const today = new Date();
        console.log("today : ", today);
        const year = today.getFullYear();
        console.log("year :", year)
        const month = String(today.getMonth() + 1).padStart(2, '0');
        const day = String(today.getDate()).padStart(2, '0');
        
        const formattedDate = year + '-' + month + '-' + day;
        console.log("Formatted date: ", formattedDate);
        
        $("#fr_date").val(formattedDate);
        $("#to_date").val(formattedDate);
        
     	// 페이지를 새로 고침하여 스크립틀릿에서 값을 다시 읽을 수 있도록 합니다.
        $("#fsearch").submit();
        
    });
    $("#btnWeekly").click(function() { // 1주일 전 날짜 불러오기
        // 현재 날짜를 가져옵니다.
        const today = new Date();

        // 일주일 전 날짜를 계산합니다.
        const lastWeek = new Date(today.getFullYear(), today.getMonth(), today.getDate() - 7);

        const year = lastWeek.getFullYear();
        const month = String(lastWeek.getMonth() + 1).padStart(2, '0');
        const day = String(lastWeek.getDate()).padStart(2, '0');
        const formattedDate = year + '-' + month + '-' + day;

        $("#fr_date").val(formattedDate);
        $("#to_date").val(today.toISOString().slice(0, 10));

        // 폼을 제출합니다.
        $("#fsearch").submit();
    });
    $("#btnMonthly").click(function() {
        // 현재 날짜를 가져옵니다.
        const today = new Date();

        // 한 달 전 날짜를 계산합니다.
        const lastMonth = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());

        // 한 달 전 날짜를 "yyyy-mm-dd" 형식으로 조합합니다.
        const year = lastMonth.getFullYear();
        const month = String(lastMonth.getMonth() + 1).padStart(2, '0');
        const day = String(lastMonth.getDate()).padStart(2, '0');
        const formattedDate = year + '-' + month + '-' + day;

        // 'fr_date' 입력 필드의 값을 한 달 전의 날짜로 설정합니다.
        $("#fr_date").val(formattedDate);
        // 'to_date' 입력 필드의 값을 오늘의 날짜로 설정합니다.
        $("#to_date").val(today.toISOString().slice(0, 10));

        // 폼을 제출합니다.
        $("#fsearch").submit();
    });
    $("#btnReset").click(function() {
        // 초기화 버튼을 누르면 userInfoManage.jsp로 리다이렉트합니다.
        window.location.href = "return_list.jsp";
    });
});
</script>



					<form name="fsearch" id="fsearch" method="get" onsubmit="return handleFormSubmit(event); " action="return_list.jsp">
						<div
							class="xans-element- xans-myshop xans-myshop-orderhistoryhead ">
							<fieldset class="ec-base-box">
								<legend>검색기간설정</legend>
								
									<input type="button" id="btnToday" onclick="" class="btn_small white" value="오늘">
									<input type="button" id="btnWeekly" onclick="" class="btn_small white" value="일주일">
									<input type="button" id="btnMonthly"onclick="search_date('fr_date','to_date',this.value);" class="btn_small white" value="1개월">
									<input type="button" id="btnReset"onclick="" class="btn_small white" value="초기화">
									
									
								<input type="text" name="fr_date" value="<%= (request.getParameter("fr_date") != null ? request.getParameter("fr_date") : "") %>" id="fr_date" class="frm_input w80 hasDatepicker" maxlength="10">
 								~ 
								<input type="text" name="to_date" value="<%= (request.getParameter("to_date") != null ? request.getParameter("to_date") : "") %>" id="to_date" maxlength="10">
								<input type="submit" name="btn_confirm" id="btn_confirm" value="검색" class="btn_medium">
							</fieldset>
						</div>
					</form>
					<!-- Flatpickr 라이브러리 추가 -->
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script>
        // Flatpickr를 사용하여 날짜 선택 input에 Datepicker 기능 추가
        document.addEventListener('DOMContentLoaded', function () {
            // 시작일과 종료일 input 요소 가져오기
            var frDateInput = document.getElementById('fr_date');
            var toDateInput = document.getElementById('to_date');

            // Flatpickr 적용
            flatpickr(frDateInput, {
                dateFormat: 'Y-m-d', // 날짜 형식 설정
                allowInput: true // 키보드로 직접 입력 허용
            });

            flatpickr(toDateInput, {
                dateFormat: 'Y-m-d', // 날짜 형식 설정
                allowInput: true // 키보드로 직접 입력 허용
            });
        });
    </script>
					
					
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
									<th scope="col">[주문번호]
									</th>
									<th scope="col">이미지</th>
									<th scope="col">상품정보</th>
									<th scope="col">반품상태</th>
									<th scope="col">상품구매금액</th>
									<th scope="col">환불금액</th>
									<th scope="col">반품</th>
								</tr>
							</thead>
							<tbody class="center ">
								<tr class="xans-record-">
								 <% 

				 String frDate = request.getParameter("fr_date");
				 String toDate = request.getParameter("to_date");
				 
				 String userId = (String) session.getAttribute("userId");
				 
				

				 // 입력값을 디버깅합니다.
				 System.out.println("fr_date: " + frDate + ", to_date: " + toDate);

				 
				 // 사용자 정보 목록을 얻는 로직
				 OrderReturnDAO dao = new OrderReturnDAO();
				 List<ReturnVO> userList = null;

				 // 날짜 포맷팅 및 초기값 설정
				 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				 String today = formatter.format(new Date());

				 if (frDate == null || frDate.trim().isEmpty()) {
				     frDate = "1970-01-01"; // 시작 날짜가 입력되지 않았을 때, 초기 날짜 설정
				 }
				 if (toDate == null || toDate.trim().isEmpty()) {
				     toDate = "2099-01-01"; // 종료 날짜가 입력되지 않았을 때, 오늘 날짜로 설정
				 }

				// 날짜 범위에 따른 사용자 정보 검색
				    try {
				      
				      System.out.println("Session User ID: " + userId);
				      
				        userList = dao.searchRefundHistoryByDateAndUserId(userId, frDate, toDate);
				        if (userList != null && !userList.isEmpty()) {
				          System.out.println("Orders found for user: " + userId);
				          for (ReturnVO refund : userList) {
				              System.out.println("Order Name: " + refund.getName());
				              // 필요한 다른 주문 정보들도 출력할 수 있습니다.
				          }
				      } else {
				          System.out.println("No orders found for user: " + userId);
				      }
				        System.out.println("------ 날짜 범위에 따른 사용자 정보가 조회되었습니다. ------");
				        System.out.println("frDate: " + frDate + ", toDate: " + toDate);
				    } catch (Exception e) {
				        e.printStackTrace();
				    }
				
				

				// 사용자 정보 출력
				 for (int i = 0;i < userList.size(); i++) {
				   	ReturnVO returnInfo = userList.get(i);
				   	String cartId = returnInfo.getCartId(); // 현재 행의 cartId 가져오기
				   	
				   	//날짜 포멧
				   	String refundDateString = returnInfo.getRefundDate();
					String formattedRefundDate = refundDateString.substring(0, 10);
					
				     %>
				     <tr id="<%=returnInfo.getCartId() %>">
				         <td class="tal"><span class="sv_wrap"><strong>[<%= cartId %>]</strong></span>
				         <td>
				         <img src="../../assets/images/goods/<%= returnInfo.getDefaultImg() %>" alt="Product Image" style="width: 110px; height: auto;">
				         </td>
				         <td><%= returnInfo.getCode() %> <br> <%= returnInfo.getName() %></td>
				         <td><%= returnInfo.getRefundState() %></td>
				         <td><%= formattedRefundDate %></td>
				         <td><strong><%= String.format("%,d", returnInfo.getRefundTotalPrice()) %> 원 </strong></td> <!--이 부분은 주문에 대한 총 가격임  -->
				     	 <td>
        					<form id="returnForm_<%= cartId %>" action="../../order/return_detail.jsp" method="post">
           						<input type="hidden" name="cartId" value="<%= cartId %>">
            					<button type="submit" onclick="submitForm('<%= cartId %>')">반품 상세</button>
       						</form>
    					 </td>
				     
				     </tr>
				     <%
				   	}//조건문
    %>
   
									
							</tbody>
						</table>
						<p class="message displaynone">주문 내역이 없습니다.</p>
					</div>
					 <script>
    function submitForm(cartId) {
        document.getElementById('returnForm_' + cartId).submit();
    }
	</script>

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