package admin.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import database.DbConnection;


public class AdminReviewDAO {

  private static AdminReviewDAO adminReviewDAO;

  private AdminReviewDAO() {

  }

  public static AdminReviewDAO getInstance() {
    if (adminReviewDAO == null) {
      adminReviewDAO = new AdminReviewDAO();
    }
    return adminReviewDAO;
  }

  public int selectTotalCount(SearchVO sVO) throws SQLException {// 목록을 세줌
    int totalCnt = 0;

    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DbConnection db = DbConnection.getInstance();

    try {
      con = db.getConn("jdbc/dbcp");
      StringBuilder selectCnt = new StringBuilder();
      selectCnt.append("select count(*) cnt from review");

      pstmt = con.prepareStatement(selectCnt.toString());
      rs = pstmt.executeQuery();
      if (rs.next()) {
        totalCnt = rs.getInt("cnt");
      }
    } finally {
      db.closeCon(rs, pstmt, con);
    }
    return totalCnt;
  }

  public List<ReviewVO> selectAllReview(SearchVO sVO) throws SQLException {
    List<ReviewVO> review = new ArrayList<ReviewVO>();

    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DbConnection db = DbConnection.getInstance();
    try {

      con = db.getConn("jdbc/dbcp");

      StringBuilder selectReview = new StringBuilder();
      selectReview.append("  SELECT * FROM (   ")
          .append("     SELECT r.review_id, g.default_img, g.name, r.title, r.input_date, r.id,   ")
          .append("             ROW_NUMBER() OVER (ORDER BY r.input_date DESC) AS rn   ").append("  FROM review r   ")
          .append("  JOIN customer c ON r.id = c.id   ").append("  JOIN goods g ON r.code = g.code   ").append("  )   ")
          .append("  WHERE rn between ? and ?   ");

      pstmt = con.prepareStatement(selectReview.toString());

      pstmt.setInt(1, sVO.getStartNum());
      pstmt.setInt(2, sVO.getEndNum());

      rs = pstmt.executeQuery();

      ReviewVO rVO = null;

      while (rs.next()) {
        rVO = null;
        /*
         * rVO=new ReviewVO(rs.getInt("review_id"),rs.getString("default_img"), rs.getString("name"),
         * rs.getString("title"), rs.getDate("input_date"),rs.getString("id"));
         */
        rVO = ReviewVO.builder().reviewId(rs.getInt("review_id")).defaultImg(rs.getString("default_img"))
            .name(rs.getString("name")).title(rs.getString("title")).inputDate(rs.getDate("input_date"))
            .id(rs.getString("id")).build();
        System.out.println(rVO.getReviewId());
        review.add(rVO);
      }
    } finally {
      db.closeCon(rs, pstmt, con);
    }

    return review;
  }

}
