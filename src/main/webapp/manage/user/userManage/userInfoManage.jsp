<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
	<%@ page import="admin.userManage.UserManageDAO" %>
	<%@ page import="admin.userManage.UserManageVO" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="http://demofran.com/admin/css/admin.css?ver=20240430210223">
<link type="text/css" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/themes/base/jquery-ui.css" rel="stylesheet">
<link type="text/css" href="http://demofran.com/plugin/jquery-ui/style.css?ver=20240430210223">
<link rel="shortcut icon" href="http://demofran.com/data/banner/JnLfWUSUyR6sXJP5n3Re4Fvdc93k93.ico" type="image/x-icon">

<jsp:include page="../../../assets/jsp/admin/lib.jsp" />
<script type="text/javascript">
	$(function(){
    	$("#user_menu").addClass("bg-gradient-primary");
	});
	
	function openInNewWindow(url) {
	    // 새 창을 열고, 크기와 위치를 지정합니다.
	    // 'width=800'과 'height=600'은 새 창의 크기를 800x600 픽셀로 설정합니다.
	    // 'left=200'과 'top=100'은 새 창의 화면에서의 위치를 설정합니다.
	    window.open(url, 'newWindow', 'width=800,height=600,left=200,top=100');
	}
	
</script>
<!-- golgolz start -->
<!-- golgolz end -->
</head>
<body>
	<jsp:include page="../../../assets/jsp/admin/header.jsp" />
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
							aria-current="page">사용자 관리</li>
					</ol>
					<a href="#" onclick="http://localhost/online-shop/manage/user/userManage/userInfoManage.jsp" class="original">
					<h6 class="font-weight-bolder mb-0">사용자 관리</h6>
					</a>
				</nav>
			</div>
		</nav>
		<div class="container-fluid py-4">
		
			<!-- golgolz start -->
			
			<div class="s_wrap">
	<h4>회원 정보관리</h4>
	
	<%
		    // 폼에서 입력된 ID 값을 가져옵니다.

		%>
	
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/jquery-ui.min.js"></script>
<script>
jQuery(function($){
    $.datepicker.regional["ko"] = {
        closeText: "닫기",
        prevText: "이전달",
        nextText: "다음달",
        currentText: "오늘",
        monthNames: ["1월(JAN)","2월(FEB)","3월(MAR)","4월(APR)","5월(MAY)","6월(JUN)", "7월(JUL)","8월(AUG)","9월(SEP)","10월(OCT)","11월(NOV)","12월(DEC)"],
        monthNamesShort: ["1월","2월","3월","4월","5월","6월", "7월","8월","9월","10월","11월","12월"],
        dayNames: ["일","월","화","수","목","금","토"],
        dayNamesShort: ["일","월","화","수","목","금","토"],
        dayNamesMin: ["일","월","화","수","목","금","토"],
        weekHeader: "Wk",
        dateFormat: "yymmdd",
        firstDay: 0,
        isRTL: false,
        showMonthAfterYear: true,
        yearSuffix: ""
    };
	$.datepicker.setDefaults($.datepicker.regional["ko"]);
});

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
        window.location.href = "userInfoManage.jsp";
    });
    // tr 요소에 클릭 이벤트를 추가합니다.
    $("tr").on("click", function() {
        // 해당 tr 요소의 id 속성에서 userId를 가져옵니다.
        const userId = $(this).attr('id');
        
     // 디버깅: userId 값을 콘솔에 출력합니다.
        console.log("클릭된 tr 요소의 userId:", userId);
        
        // encodeURIComponent를 사용하여 userId를 URL 인코딩합니다.
        const encodedUserId = encodeURIComponent(userId);
        
     // 디버깅: 인코딩된 userId 값을 콘솔에 출력합니다.
        console.log("URL 인코딩된 userId:", encodedUserId);
        
        // 다른 JSP로 리다이렉트할 URL을 만듭니다.
		const url = "detailedInfoManage.jsp?userId=" + encodedUserId;
        
        // 해당 URL로 리다이렉트합니다.
        window.location.href = url;
    });
});

</script>


<form name="fsearch" id="fsearch" method="get" onsubmit="return handleFormSubmit(event); " action="userInfoManage.jsp">
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
			<select name="sfl">
				<option value="id">아이디</option>
				<option value="name">회원명</option>
			</select>
			<input type="text" name="stx" value="" class="frm_input" size="30">
		</td>
	</tr>
	<tr>
		<th scope="row">가입일</th>
		<td>
			<label for="fr_date" class="sound_only">시작일</label>
<input type="text" name="fr_date" value="<%= (request.getParameter("fr_date") != null ? request.getParameter("fr_date") : "") %>" id="fr_date" class="frm_input w80 hasDatepicker" maxlength="10">
 ~ 
<label for="to_date" class="sound_only">종료일</label>
<input type="text" name="to_date" value="<%= (request.getParameter("to_date") != null ? request.getParameter("to_date") : "") %>" id="to_date" maxlength="10">
<span class="btn_group">
<input type="button" id="btnToday" onclick="" class="btn_small white" value="오늘">
<input type="button" id="btnWeekly" onclick="" class="btn_small white" value="일주일">
<input type="button" id="btnMonthly"onclick="search_date('fr_date','to_date',this.value);" class="btn_small white" value="1개월">
<input type="button" id="btnReset"onclick="" class="btn_small white" value="초기화">
</span>		</td>
	</tr>
	
	</tbody>
	</table>
</div>
<div class="btn_confirm">
	<input type="submit" value="검색" class="btn_medium">
</div>
</form>



<div class="local_ov mart30">
	총 회원수 : <b class="fc_red">3</b>명
</div>
<div class="tbl_head01">
	<table>
	<colgroup>
		<col class="w50">
		<col class="w130">
		<col class="w150">
		<col>
		<col class="w130">
		<col class="w100">
		<col class="w130">
		<col class="w60">
		<col class="w60">
		<col class="w60">
				<col class="w90">
	</colgroup>
	<thead>
	<tr>
		<th scope="col">번호</th>
		<th scope="col"><a href="/admin/member.php?code=list&amp;page=&amp;filed=name&amp;orderby=asc">회원명</a></th>
		<th scope="col"><a href="/admin/member.php?code=list&amp;page=&amp;filed=id&amp;orderby=asc">아이디</a></th>
		<th scope="col">핸드폰</th>
		<th scope="col"><a href="/admin/member.php?code=list&amp;page=&amp;filed=reg_time&amp;orderby=asc">가입일시</a></th>
		<th scope="col">구매수</th>
		<th scope="col"><a href="/admin/member.php?code=list&amp;page=&amp;filed=intercept_date&amp;orderby=asc">접근차단</a></th>
		<th scope="col"><a href="/admin/member.php?code=list&amp;page=&amp;filed=intercept_date&amp;orderby=asc">탈퇴여부</a></th>
	</tr>
	</thead>
	<tbody class="list">
	
				 <% 
				 String inputId = request.getParameter("stx");
				 String sfl = request.getParameter("sfl");

				 String frDate = request.getParameter("fr_date");
				 String toDate = request.getParameter("to_date");

				 // 입력값을 디버깅합니다.
				 System.out.println("fr_date: " + frDate + ", to_date: " + toDate);

				 // inputId를 trim()하여 공백을 제거한 후, 빈 문자열인지 확인.
				 if (inputId != null && inputId.trim().isEmpty()) {
				     inputId = null; // 공백 값인 경우 inputId를 null로 설정.
				 }

				 System.out.println("------"+inputId+"-----"+sfl);
				 System.out.println("inputId 값 디버깅: " + (inputId == null ? "null" : inputId));

				 // 사용자 정보 목록을 얻는 로직
				 UserManageDAO dao = new UserManageDAO();
				 List<UserManageVO> userList = null;

				 // 날짜 포맷팅 및 초기값 설정
				 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				 String today = formatter.format(new Date());

				 if (frDate == null || frDate.trim().isEmpty()) {
				     frDate = "1970-01-01"; // 시작 날짜가 입력되지 않았을 때, 초기 날짜 설정
				 }
				 if (toDate == null || toDate.trim().isEmpty()) {
				     toDate = today; // 종료 날짜가 입력되지 않았을 때, 오늘 날짜로 설정
				 }

				// 검색 조건에 따라 DAO 메소드 호출
				 if (sfl != null && sfl.equals("id") && inputId != null && !inputId.trim().isEmpty() && frDate != null && !frDate.trim().isEmpty() && toDate != null && !toDate.trim().isEmpty()) {
				     // inputId와 날짜 범위에 따른 검색 수행
				     try {
				         userList = dao.selectUserInfoByIdAndDateRange(inputId, frDate, toDate);
				         System.out.println("------ inputId와 날짜 범위 조건에 따른 사용자가 조회되었습니다. ------");
				         System.out.println("inputId: " + inputId + ", frDate: " + frDate + ", toDate: " + toDate);
				     } catch (Exception e) {
				         e.printStackTrace();
				     }
				 } else if (inputId != null && !inputId.trim().isEmpty() && sfl != null && sfl.equals("name")) {
				     // inputName과 날짜 범위에 따른 검색 수행
				     try {
				         userList = dao.selectUserInfoByNameAndDateRange(inputId, frDate, toDate);
				         System.out.println("------ inputName과 날짜 범위 조건에 따른 사용자가 조회되었습니다. ------");
				         System.out.println("inputName: " + inputId + ", frDate: " + frDate + ", toDate: " + toDate);
				     } catch (Exception e) {
				         e.printStackTrace();
				     }
				 } else if (inputId != null && sfl != null) {
				     // sfl 값에 따라 다른 검색 수행
				     switch (sfl) {
				         case "id":
				             userList = dao.selectUserInfoById(inputId);
				             System.out.println("------ 사용자 ID에 따른 정보가 조회되었습니다. ------");
				             break;
				         case "name":
				             userList = dao.selectUserInfoByName(inputId);
				             System.out.println("------ 사용자 이름에 따른 정보가 조회되었습니다. ------");
				             break;
				         default:
				             System.out.println("sfl 값이 유효하지 않습니다.");
				             break;
				     }
				 } else {
				     // 날짜 범위에 따른 검색 수행
				     userList = dao.selectUserInfoByDateRange(frDate, toDate);
				     System.out.println("------ 날짜 범위에 따른 사용자 정보가 조회되었습니다. ------");
				 }

				// 사용자 정보 출력
				 for (int i = 0;i < userList.size(); i++) {
				     UserManageVO userInfo = userList.get(i);
				     // 각 사용자에 대한 행 번호(rowNum)를 i + 1로 설정
				     int rowNum = i + 1;
				     %>
				     <tr id="<%=userInfo.getId() %>">
				         <td><%= rowNum %></td> <!-- 행 번호 출력 -->
				         <td class="tal"><span class="sv_wrap"><%= userInfo.getName() %></span></td>
				         <td class="tal"><%= userInfo.getId() %></td>
				         <td><%= userInfo.getTel() %></td>
				         <td><%= userInfo.getInput_date() %></td>
				         <td><%= userInfo.getTotal_amount() %></td>
				         <td><%= userInfo.getWithdrawal_flag() %></td>
				         <td><%= userInfo.getAccess_limit_flag() %></td>
				     </tr>
				     <%
				 } 
    %>
	
	
	
		</tbody>
	</table>
</div>


<script>
function chk_use_app(mb_id) {
	var error = "";
	var token = get_ajax_token();
	if(!token) {
		alert("토큰 정보가 올바르지 않습니다.");
		return false;
	}

	$.ajax({
		url: tb_admin_url+"/member/member_use_app.php",
		type: "POST",
		data: {"mb_id": mb_id, "token": token },
		dataType: "json",
		async: false,
		cache: false,
		success: function(data, textStatus) {
			error = data.error;
		}
	});

	if(error) {
		alert(error);
		return false;
	}
}

$(function(){
	// 날짜 검색 : TODAY MAX값으로 인식 (maxDate: "+0d")를 삭제하면 MAX값 해제
	$("#fr_date, #to_date").datepicker({ changeMonth: true, changeYear: true, dateFormat: "yy-mm-dd", showButtonPanel: true, yearRange: "c-99:c+99", maxDate: "+0d" });
});
</script>
</div>
			<!-- golgolz end -->
		</div>
	</main>
</body>
</html>