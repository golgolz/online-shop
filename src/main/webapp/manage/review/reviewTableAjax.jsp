<%@page import="admin.review.ReviewBoardUtil"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="admin.review.ReviewBoardVO"%>
<%@page import="java.util.List"%>
<%@page import="admin.review.AdminReviewDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSON"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="sVO" class="admin.review.SearchVO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="sVO"/>
<%

ReviewBoardUtil util = ReviewBoardUtil.getInstance();

String selectOptionParam = request.getParameter("selectOption");
int pageScale = 10; // 기본 페이지 스케일 값
pageScale = Integer.parseInt(selectOptionParam);

AdminReviewDAO rDAO=AdminReviewDAO.getInstance();
//1.총 레코드 수 얻기
int totalCount = rDAO.selectTotalCount(sVO);

//2.한 화면에 보여줄 게시물의 수
//3.총 페이지 수
int totalPage=(int)Math.ceil((double)totalCount/pageScale);
//4.게시물의 시작번호
String tempPage=sVO.getCurrentPage();
int currentPage=1;
if(tempPage !=null) {
    try{
    currentPage=Integer.parseInt(tempPage);
    }catch(NumberFormatException nfe){
    }
}//end if
int startNum=currentPage *pageScale-pageScale+1;
//5.게시물의 끝 번호
int endNum=startNum+pageScale-1;

sVO.setStartNum(startNum);
sVO.setEndNum(endNum);
AdminReviewDAO arDAO = AdminReviewDAO.getInstance();
//여기서는 데이터베이스 조회 결과인 list를 사용하여 tbody 내용을 구성합니다.
List<ReviewBoardVO> list = arDAO.selectBoard(sVO);
//list는 ReviewBoardVO 객체들의 리스트로 가정합니다.

JSONObject jsonObj = new JSONObject();
JSONArray jsonArr = new JSONArray();
JSONObject jsonTemp = null;
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String date = "";

try{
  for(int i=0 ; i<list.size(); i++){
    ReviewBoardVO rbVO = list.get(i);
    date = sdf.format(rbVO.getInputDate());
    jsonTemp = new JSONObject();
    jsonTemp.put("reviewId",rbVO.getReviewId());
    jsonTemp.put("defaultImg",rbVO.getDefaultImg());
    jsonTemp.put("name",rbVO.getName());
    jsonTemp.put("title",rbVO.getTitle());
    jsonTemp.put("inputDate",date);
    jsonTemp.put("id",rbVO.getId());
    
    jsonArr.add(jsonTemp);
  }
  
  jsonObj.put("status", "SUCCESS" );
  jsonObj.put("boardList",jsonArr );
  jsonObj.put("totalPage", totalPage);
  jsonObj.put("currentPage", currentPage);
}catch(Exception e){
  e.printStackTrace();
}
%>
<%=jsonObj.toJSONString() %>

<script>
    var paginationHTML = "<%= util.pageNation("review_board_list.jsp", "", totalPage, currentPage) %>";
</script>
 