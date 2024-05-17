<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@page import="user.wishlist.WishlistVO"%>
<%@page import="user.wishlist.WishlistDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="게시판 리스트"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String userId = (String) session.getAttribute("userId");

if (userId == null) {
	System.out.println("로그인이 필요합니다. ");
%>
<script type="text/javascript">
	alert('로그인이 필요합니다.');
	window.location.href = '../user/login/userLogin.jsp'; // 경로 수정 필요
</script>
<%
return;
}
%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../assets/jsp/user/lib.jsp" />
<!-- golgolz start -->
<link rel="stylesheet" type="text/css"
	href="https://insideobject.com/ind-script/
.php?filename=nc1LCoAwDIThfXHrOYLeqC3xAU2mpCno7RW8gHQ7zMdPB4RpWY2qYbcoZNzQLTPl1mgzqFOGCHR6h5n-_DmHhtL9hIaEaxB299FoiTfbGPWYCg9S1FBO5ZCi6td_AA&type=css&k=37c9481ac0212340e132f81eba4d1049fee7f18e&t=1681776733" />
<link rel="stylesheet" type="text/css"
	href="https://insideobject.com/ind-script/optimizer_user.php?filename=tZRNbsQgDIX3Sbc9h2dU9SQ9ARBPsGowwpCZ3L5Mp-rPtoEdxuh71tPD4CUgoJurYlZguiAbe3o5nSFVy-RmXwKDLjgvqLRG0HeK51dwqhBkqYwQdvWS4ErqmbQ8tdYz_JfLZpdawBol9yniJASJnaGPi85QdFMrcKo0CFxEuFAaRPfIo9Apt6S4UX4ns1I0BUe5buwgsq2ldI_2N1xu4wzhUWa3Z-4YermwSIbEtaWiVVPGjfD6cxo0eWtgPsb-tVO_ZEJtH_6-Xd88pURx7S3gJG6NQRLTQd-DZIzb_tDosbT_AlXvtA8&type=css&k=61d67ea986b85067e25ce62f278f06dce83b4fcb&t=1678165953&user=T" />

<!-- golgolz end -->
<style type="text/css">
#wrap {
	width: 1462px;
	height: 749;
	margin: 0px auto;
}

.num {
	width: 80px
}

.title {
	width: 350px
}

.id {
	width: 120px
}

.date {
	width: 150px
}

.cnt {
	width: 100px
}
</style>
<script type="text/javascript">
	$(function() {
		$("#btnSearch").click(function() {
			chkNull;
		});//click
		$("#btnAllSearch").click(function() {
			location.href = "board_list.jsp";
		});//click
		$("#btnWrite").click(function() {
			location.href = "board_write_frm.jsp";
		});//click

		$("#keyword").keydown(function(evt) {
			if (evt.which == 13) {
				chkNull();
			}//end if
		});//keydown
	});//ready

	function chkNull() {
		if ($("#keyword").val().trim() != "") {
			//alert("검색 키워드를 입력해주세요.")
			$("#frmBoard").submit();

		}//end if
	}//chkNull
	function deleteAllWishlist() {

		var flag = confirm("관심상품이 모두 비워집니다. 삭제하시겠습니까?");

		if (flag == false) {
			return;
		}//end if

		//예를 누른 경우 삭제 코드 실행
		var param = {
			userId : $("#userId").val(),
			method : "deleteAll"
		};
		$.ajax({
			url : "wishlist_delete_process.jsp",
			type : "POST",
			data : param,
			dataType : "JSON",
			error : function(xhr) {
				alert("AJAX 요청 실패:" + xhr.status + " " + xhr.statusText);
			},
			success : function(jsonObj) {
				if (jsonObj.result) {
					alert("위시가 비워졌습니다.");
					location.reload();
				} else {
					alert("관심상품 비우기 실패했습니다. 잠시 후 다시 시도해주세요.");
				}
			}
		})
	}//function
	function deleteWishlist() {

		var flag = confirm("관심상품 목록에서 삭제하시겠습니까?");

		if (flag == false) {//아니오를 누른 경우
			return;
		}//end if 

		//예를 누른 경우 삭제 코드 실행
		var param = {
			favoriteId : $("#favoriteId").val(),
			method : "deleteOne"
		};
		$.ajax({
			url : "wishlist_delete_process.jsp",
			type : "POST",
			data : param,
			dataType : "JSON",
			error : function(xhr) {
				alert("AJAX 요청 실패: " + xhr.status + " " + xhr.statusText);
			},
			success : function(jsonObj) {
				if (jsonObj.result) {
					/* 						alert("삭제가 완료되었습니다."); */
					location.reload();
				} else {
					alert("관심상품 삭제를 실패했습니다. 잠시 후 다시 시도해주세요.");
				}
			}
		})
	}
</script>
</head>
<body>
	<div id="wrap">
		<div id="content">
			<%
			request.setCharacterEncoding("UTF-8");
			%>
			<jsp:useBean id="sVO" class="admin.review.SearchVO" scope="page" />
			<jsp:setProperty property="*" name="sVO" />
			<jsp:useBean id="wVO" class="user.wishlist.WishlistVO" scope="page" />
			<jsp:setProperty property="*" name="wVO" />
			<%
			String code = request.getParameter("code");

			try {
			    WishlistDAO wDAO = WishlistDAO.getInstance();
			    //1.총 레코드 수 얻기
			    int totalCount = wDAO.selectTotalCount(sVO);

			    //2.한 화면에 보여줄 게시물의 수
			    int pageScale = 10;
			    //3.총 페이지 수

			    int totalPage = (int) Math.ceil((double) totalCount / pageScale);
			    //4.게시물의 시작번호
			    String tempPage = sVO.getCurrentPage();
			    int currentPage = 1;
			    if (tempPage != null) {
			        try {
			    currentPage = Integer.parseInt(tempPage);
			        } catch (NumberFormatException nfe) {
			        }
			    } //end if
			    int startNum = currentPage * pageScale - pageScale + 1;
			    //5.게시물의 끝 번호
			    int endNum = startNum + pageScale - 1;

			    sVO.setStartNum(startNum);
			    sVO.setEndNum(endNum);
			    /* 	    //
			    	    String userId="lee";
			    	    session.setAttribute("userId", userId);
			    	    // */
			    List<WishlistVO> list = wDAO.selectWishlist(userId);//시작번호와 끝 번호 사이의 글 조회
			    pageContext.setAttribute("list", list);


			    pageContext.setAttribute("totalCount", totalCount);
			    pageContext.setAttribute("pageScale", pageScale);
			    pageContext.setAttribute("currentPage", currentPage);
			%>
			<jsp:include page="../assets/jsp/user/header.jsp" />
			<div style="text-align: center;">
				<%
				String param = "";
				%>
				<c:if test="${not empty param.keyword }">
					<%
					param = "&field=" + request.getParameter("field") + "&keyword=" + request.getParameter("keyword");
					%>
					<c:set var="link2"
						value="&field=${param.field}&keyword=${param.keyword }" />
				</c:if>
			</div>
			<%
			} catch (SQLException se) {
			se.printStackTrace();
			out.println("ㅈㅅ");
			}
			%>
			<div id="container">
				<div id="contents">

					<div class="path">
						<span>현재 위치</span>
						<ol>
							<li><a href="/">홈</a></li>
							<li><a href="/myshop/index.html">마이쇼핑</a></li>
							<li title="현재 위치"><strong>관심상품</strong></li>
						</ol>
					</div>

					<div class="titleArea">
						<h2>관심상품</h2>
					</div>

					<div
						class="xans-element- xans-myshop xans-myshop-wishlist ec-base-table typeList xans-record-">
						<!--
        $login_page = /member/login.html
        $count = 10
    -->
						<table border="1" summary="" class="" style="margin-right: 100px">
							<caption>관심상품 목록</caption>
							<colgroup>
								<col style="width: 92px" />
								<col style="width: auto" />
								<col style="width: 105px" />
								<col style="width: 100px" />
								<col style="width: 100px" />
								<col style="width: 105px" />
								<col style="width: 110px" />
							</colgroup>
							<thead>
								<tr style="text-align: center; width: 10px">
									<!-- <th scope="col"><input type="checkbox" onclick="NewWishlist.checkAll(this);"/></th> -->
									<th scope="col" style="width: 20px">번호</th>
									<th scope="col">이미지</th>
									<th scope="col">상품정보</th>
									<th scope="col">판매가</th>
									<th scope="col">배송비</th>
									<th scope="col">합계</th>
									<th scope="col">선택</th>
								</tr>
							</thead>
							<tbody
								class="xans-element- xans-myshop xans-myshop-wishlistitem center">
								<c:forEach var="wVO" items="${list}" varStatus="i">
									<tr class="xans-record-">
										<input type="hidden" id="userId" name="userId" value="<%=userId%>" />
										<!-- <td><input name="wish_idx[]" id="wish_idx_0" enable-order="1" reserve-order="N" enable-purchase="1" class="" is-set-product="F" value="184531" type="checkbox" /></td> -->
										<td style="width: 20px"><input type="hidden"
											id="favoriteId" name="favoriteId" value="${wVO.favoriteId}" />
											<c:out value="${i.index+1}" /></td>
										<td class="thumb" style="width: 90px"><img
											src="http://objec.sist.co.kr/assets/images/goods/<c:out value="${wVO.defaultImg}"/>" /></td>

										<td class="left" style="width: 200px; text-align: center;">
											<strong class="name"><a
												href="http://objec.sist.co.kr/goods/detail.jsp?goods=${wVO.code}"
												class="ec-product-name"><c:out value="${wVO.name}" /></a></strong>
										</td>
										<td class="price right" style="text-align: center"><strong
											class=""><c:out value="${wVO.price}" /><br /></strong><br />
											<strong class="displaynone">2000</strong></td>
										<td><span class=""><c:out
													value="${wVO.deliveryCharge}" />원<br /></span></td>
										<td class="price right" style="text-align: center"><c:out
												value="${wVO.price + wVO.deliveryCharge}" />원</td>
										<td class="button">
											<!-- <a href="#none" onclick="" class="btnSubmit ">장바구니담기</a> -->
											<%-- <a href="wishlist_delete_process.jsp?favoriteId=${wVO.favoriteId }" class="btnNormal"> 삭제</a> --%>
											<input type="button" class="btnNormal"
											onclick="deleteWishlist()" value="삭제" />
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<p class="message displaynone">관심상품 내역이 없습니다.</p>
					</div>

					<div
						class="xans-element- xans-myshop xans-myshop-wishlistbutton ec-base-button xans-record-">
						<span class="gLeft"> </span> <span class="gRight"> <a
							href="javascript:history.back()" class="btnEmFix sizeM">이전</a> <a
							href="#none" class="btnEmFix sizeM" onclick="deleteAllWishlist()">관심상품
								비우기</a>
						</span>
					</div>
					<!-- golgolz end -->
				</div>
			</div>
</body>
</html>