<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.sql.SQLException"%>
<%@page import="admin.review.SearchVO"%>
<%@page import="admin.review.ReviewBoardVO"%>
<%@page import="java.util.List"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="user.review.UserReviewDAO"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    trimDirectiveWhitespaces="true"%>
<%
// params
int startNum = Integer.parseInt(request.getParameter("start"));
int endNum = Integer.parseInt(request.getParameter("end"));
String code = request.getParameter("code");

UserReviewDAO reviewDAO = UserReviewDAO.getInstance();
SearchVO searchVO = new SearchVO("3", code, null, startNum, endNum);

JSONObject reviewObj = new JSONObject();
reviewObj.put("flag", false);

try{
    int totalCount = reviewDAO.selectTotalCount(searchVO);
	List<ReviewBoardVO> reviews = reviewDAO.selectReviewBoard(searchVO);
	reviewObj.put("flag", true);
	
	Iterator<ReviewBoardVO> reviewIta = reviews.iterator();
	JSONArray reviewArr = new JSONArray();
	JSONObject tempJSON = null;
	ReviewBoardVO reviewVO = null;
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	
	while(reviewIta.hasNext()){
	    reviewVO = reviewIta.next();
	    tempJSON = new JSONObject();
	    tempJSON.put("title", reviewVO.getTitle());
	    tempJSON.put("review_id", reviewVO.getReviewId());
	    tempJSON.put("id", reviewVO.getId());
	    tempJSON.put("input_date", dateFormat.format(reviewVO.getInputDate()));
	    
	    reviewArr.add(tempJSON);
	}
	
	reviewObj.put("review", reviewArr);
} catch(SQLException e){
    e.printStackTrace();
}
%>
<%= reviewObj.toJSONString() %>