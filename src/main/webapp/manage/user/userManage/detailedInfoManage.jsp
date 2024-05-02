<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="http://demofran.com/admin/css/admin.css?ver=20240430213218">

<jsp:include page="../../../assets/jsp/admin/lib.jsp" />
<script type="text/javascript">
	$(function(){
    	$("#user_menu").addClass("bg-gradient-primary");
	});
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
					<h6 class="font-weight-bolder mb-0">사용자 관리</h6>
				</nav>
			</div>
		</nav>
		<div class="container-fluid py-4">
		
			<!-- golgolz start -->
			<section class="new_win_desc marb50">

	<ul class="anchor">
	<li><a href="./pop_memberform.php?mb_id=tubeweb3">회원정보수정</a></li>
</ul>

	<h3 class="anc_tit">기본정보</h3>
	<div class="tbl_frm01">
		<table class="tablef">
		<colgroup>
			<col class="w130">
			<col>
			<col class="w130">
			<col>
		</colgroup>
		<tbody>
		<tr>
			<th scope="row">회원명</th>
			<td>
				<input type="text" name="name" value="세글만" required="" itemname="회원명" class="frm_input required" style="background-position: right top; background-repeat: no-repeat;">
			</td>
			<th scope="row">아이디</th>
			<td>tubeweb3</td>
		</tr>
		<tr>
			<th scope="row">비밀번호</th>
			<td><input type="text" name="passwd" value="" class="frm_input"></td>
		</tr>
		<tr>
			<th scope="row">E-Mail</th>
			<td><input type="text" name="email" value="tubeweb3@gmail.com" email="" itemname="E-Mail" class="frm_input" size="30"></td>
		</tr>
		<tr>
			<th scope="row">휴대전화</th>
			<td><input type="text" name="cellphone" value="010-3333-3333" class="frm_input"></td>
		</tr>
		<tr>
			<th scope="row">주소</th>
			<td colspan="3">
				<input type="text" name="zip" value="02230" class="frm_input" size="8" maxlength="5">
				<a href="javascript:win_zip('fmemberform', 'zip', 'addr1', 'addr2', 'addr3', 'addr_jibeon');" class="btn_small grey">주소검색</a>
				<p class="mart5"><input type="text" name="addr1" value="서울 중랑구 겸재로 74-3" class="frm_input" size="60"> 기본주소</p>
				<p class="mart5"><input type="text" name="addr2" value="2323" class="frm_input" size="60"> 상세주소</p>
				<p class="mart5"><input type="text" name="addr3" value="(면목동)" class="frm_input" size="60"> 참고항목
				<input type="hidden" name="addr_jibeon" value="R"></p>
			</td>
		</tr>
		</tbody>
		</table>
	</div>

	<h3 class="anc_tit mart30">기타정보</h3>
	<div class="tbl_frm01">
		<table class="tablef">
		<colgroup>
			<col class="w130">
			<col>
			<col class="w130">
			<col>
		</colgroup>
		<tbody>
		<tr>
			<th scope="row">회원가입일</th>
			<td>2020-10-04 18:05:42</td>
		</tr>
		<tr>
			<th scope="row">총구매금액</th>
			<td>31,560 원</td>
		</tr>
		<tr>
			<th scope="row">접근차단일자</th>
			<td>
				<input type="text" name="intercept_date" value="" id="intercept_date" class="frm_input" size="10" maxlength="8">
				<a href="" class="btn_small grey">접근차단</a>
			</td>
		</tr>
		<tr>
			<th scope="row">관리자메모</th>
			<td colspan="3"><textarea name="memo" class="frm_textbox" rows="3"></textarea></td>
		</tr>
		</tbody>
		</table>
	</div>

	<div class="btn_confirm">
		<input type="submit" value="저장" class="btn_medium" accesskey="s">
		<button type="button" class="btn_medium bx-white" onclick="window.close();">닫기</button>
	</div>
	</section>
			<!-- golgolz end -->
		</div>
	</main>
</body>
</html>