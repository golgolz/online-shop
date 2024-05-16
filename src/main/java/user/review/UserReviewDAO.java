package user.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import admin.review.ReviewBoardVO;
import admin.review.SearchVO;
import database.DbConnection;


public class UserReviewDAO {
  private String[] columnNames;
  private static UserReviewDAO userReviewDAO;

  private UserReviewDAO() {
    columnNames = new String[] {"title", "content", "id", "r.code"};
  }

  public static UserReviewDAO getInstance() {
    if (userReviewDAO == null) {
      userReviewDAO = new UserReviewDAO();
    }
    return userReviewDAO;
  }

  public int selectTotalCount(SearchVO sVO) throws SQLException {
    int totalCnt = 0;

    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DbConnection db = DbConnection.getInstance();

    try {
      // 1. JNDI 사용객체 생성
      // 2. DataSource 얻기
      // 3. Connection 얻기
      con = db.getConn("online-shop-dbcp");
      // 4. 쿼리문 생성객체 얻기(Dynamic Query)
      StringBuilder selectCnt = new StringBuilder();
      selectCnt.append("    select count(*) cnt from review ");

      if (sVO.getKeyword() != null && sVO.getKeyword() != "") {
        selectCnt.append("  where code=?  ");
      }

      pstmt = con.prepareStatement(selectCnt.toString());
      // 5. 바인트변수에 값 설정
      int bindIndex = 0;
      if (sVO.getKeyword() != null && sVO.getKeyword() != "") {
        pstmt.setString(++bindIndex, sVO.getKeyword());
      }
      // 6. 쿼리문 수행 후 결과 얻기
      rs = pstmt.executeQuery();
      if (rs.next()) {
        totalCnt = rs.getInt("cnt");
      }
    } finally {
      // 7. 연결 끊기
      db.closeCon(rs, pstmt, con);
    }
    return totalCnt;
  }

  public int selectReviewId(ReviewBoardVO rVO) throws SQLException {
    int num = 0;

    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DbConnection db = DbConnection.getInstance();

    try {
      // 1. JNDI 사용객체 생성
      // 2. DataSource 얻기
      // 3. Connection 얻기
      con = db.getConn("online-shop-dbcp");
      // 4. 쿼리문 생성객체 얻기(Dynamic Query)
      StringBuilder selectReviewId = new StringBuilder();
      selectReviewId.append(" select max(review_id) rid from review    ").append(" order by review_id desc  ");

      pstmt = con.prepareStatement(selectReviewId.toString());
      // 5. 바인트변수에 값 설정
      // 6. 쿼리문 수행 후 결과 얻기
      rs = pstmt.executeQuery();
      if (rs.next()) {
        num = rs.getInt("rid");
      }
    } finally {
      // 7. 연결 끊기
      db.closeCon(rs, pstmt, con);
    }

    return num + 1;
  }

  public List<ReviewBoardVO> selectReviewBoard(SearchVO sVO) throws SQLException {
    List<ReviewBoardVO> review = new ArrayList<ReviewBoardVO>();

    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DbConnection db = DbConnection.getInstance();

    try {
      con = db.getConn("online-shop-dbcp");
      StringBuilder selectReviewBoard = new StringBuilder();
      selectReviewBoard
          .append("   SELECT * FROM ( SELECT sub.*, ROW_NUMBER() OVER (ORDER BY sub.input_date DESC) AS rn    ")
          .append("     FROM ( SELECT r.review_id, g.default_img, g.name, r.title, r.input_date, r.id   ")
          .append("        FROM review r JOIN customer c ON r.id = c.id JOIN goods g ON r.code = g.code   ");


      if (sVO.getKeyword() != null && !"".equals(sVO.getKeyword())) {
        selectReviewBoard.append(" where instr(").append(columnNames[Integer.parseInt(sVO.getField())])
            .append(", ? ) > 0");
      } // end if

      /*
       * if (sVO.getKeyword() != null && sVO.getKeyword() != "") {
       * selectReviewBoard.append("  where r.code=?  "); }
       */

      selectReviewBoard.append("   ) sub ) WHERE rn BETWEEN ? AND ?   ");

      pstmt = con.prepareStatement(selectReviewBoard.toString());
      int bindIndex = 0;

      if (sVO.getKeyword() != null && !"".equals(sVO.getKeyword())) {
        pstmt.setString(++bindIndex, sVO.getKeyword());
      } // end if

      /*
       * if (sVO.getKeyword() != null && sVO.getKeyword() != "") { pstmt.setString(++bindIndex,
       * sVO.getKeyword()); }
       */

      pstmt.setInt(++bindIndex, sVO.getStartNum());
      pstmt.setInt(++bindIndex, sVO.getEndNum());
      rs = pstmt.executeQuery();

      ReviewBoardVO rVO = new ReviewBoardVO();
      while (rs.next()) {
        rVO = null;
        rVO = ReviewBoardVO.builder().reviewId(rs.getInt("review_id")).defaultImg(rs.getString("default_img"))
            .name(rs.getString("name")).title(rs.getString("title")).inputDate(rs.getDate("input_date"))
            .id(rs.getString("id")).build();

        review.add(rVO);
      } // end while

    } finally {
      db.closeCon(rs, pstmt, con);
    }

    return review;
  }// selectReviewBoard

  public ReviewBoardVO selectImgName(ReviewBoardVO rVO) throws SQLException {

    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DbConnection db = DbConnection.getInstance();

    try {
      // 1.JNDI 사용 객체 생성
      // 2.DataSource 얻기
      // 3.Connection 얻기
      con = db.getConn("online-shop-dbcp");
      // 4.쿼리문 생성객체 얻기(Dynamic Query)
      StringBuilder selectImgName = new StringBuilder();
      selectImgName.append("  SELECT g.default_img, g.name FROM order_goods og  ")
          .append("  JOIN goods g ON og.code = g.code  ").append("  WHERE og.code = ? AND og.cart_id = ?   ");

      pstmt = con.prepareStatement(selectImgName.toString());
      // 5.바인드 변수 값 설정
      pstmt.setString(1, rVO.getCode());
      pstmt.setString(2, rVO.getCartId());
      // 6.쿼리문 수행 후 결과 얻기
      rs = pstmt.executeQuery();

      if (rs.next()) {

        rVO = ReviewBoardVO.builder().defaultImg(rs.getString("default_img")).name(rs.getString("name")).build();

      } // end while

    } finally {
      // 7.연결 끊기
      db.closeCon(rs, pstmt, con);
    }

    return rVO;

  }

  public void insertReview(ReviewBoardVO rVO) throws SQLException {

    Connection con = null;
    PreparedStatement pstmt = null;

    DbConnection db = DbConnection.getInstance();

    try {
      // 1.JNDI 사용 객체 생성
      // 2.DataSource 얻기
      // 3.Connection 얻기
      con = db.getConn("online-shop-dbcp");
      // 4.쿼리문 생성객체 얻기(Dynamic Query)
      StringBuilder insertReview = new StringBuilder();
      insertReview.append(
          "insert into review(review_id, id, cart_id, title, content, code, input_date, remove_flag) values(?, ?, ?, ?, ?, ?, ?, ?)");
      pstmt = con.prepareStatement(insertReview.toString());

      // 바인드 변수에 값 설정
      pstmt.setInt(1, rVO.getReviewId());
      pstmt.setString(2, rVO.getId());
      pstmt.setString(3, rVO.getCartId());
      pstmt.setString(4, rVO.getTitle());
      pstmt.setString(5, rVO.getContent());
      pstmt.setString(6, rVO.getCode());
      pstmt.setDate(7, rVO.getInputDate());
      pstmt.setString(8, rVO.getRemoveFlag());


      pstmt.executeUpdate();
    } finally {
      // 7.연결 끊기
      db.closeCon(null, pstmt, con);
    }

  }// insertReview

  public ReviewBoardVO selectDetailReview(int seq) throws SQLException {
    ReviewBoardVO rVO = null;

    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DbConnection db = DbConnection.getInstance();

    try {
      // 1.JNDI 사용 객체 생성
      // 2.DataSource 얻기
      // 3.Connection 얻기
      con = db.getConn("online-shop-dbcp");
      // 4.쿼리문 생성객체 얻기(Dynamic Query)
      StringBuilder selectDetailReview = new StringBuilder();
      selectDetailReview
          .append("   SELECT r.review_id, g.default_img, g.name, r.title, r.content, r.input_date, r.id   ")
          .append("    from review r  ").append("    JOIN goods g ON r.code = g.code  ")
          .append("    where r.review_id=?   ");

      pstmt = con.prepareStatement(selectDetailReview.toString());
      // 5.바인드 변수 값 설정
      pstmt.setInt(1, seq);
      // 6.쿼리문 수행 후 결과 얻기
      rs = pstmt.executeQuery();

      if (rs.next()) {

        rVO = ReviewBoardVO.builder().reviewId(rs.getInt("review_id")).defaultImg(rs.getString("default_img"))
            .name(rs.getString("name")).title(rs.getString("title")).content(rs.getString("content"))
            .inputDate(rs.getDate("input_date")).id(rs.getString("id")).build();
        rVO.setReviewId(seq);

      } // end while

    } finally {
      // 7.연결 끊기
      db.closeCon(rs, pstmt, con);
    }

    return rVO;

  }// selectDetailReview


  public int updateReview(ReviewBoardVO rVO) throws SQLException {

    int cnt = 0;

    Connection con = null;
    PreparedStatement pstmt = null;

    DbConnection db = DbConnection.getInstance();

    try {
      // 1.JNDI 사용 객체 생성
      // 2.DataSource 얻기
      // 3.Connection 얻기
      con = db.getConn("online-shop-dbcp");
      // 4.쿼리문 생성객체 얻기(Dynamic Query)

      StringBuilder updateReview = new StringBuilder();
      updateReview.append("  update review    ").append("  set title= ? , content= ?  ")
          .append("  where review_id= ? and id=?   ");

      pstmt = con.prepareStatement(updateReview.toString());

      // 5. 바인드 변수에 값 설정
      pstmt.setString(1, rVO.getTitle());
      pstmt.setString(2, rVO.getContent());
      pstmt.setInt(3, rVO.getReviewId());
      pstmt.setString(4, rVO.getId());

      cnt = pstmt.executeUpdate();

    } finally {
      // 7.연결 끊기
      db.closeCon(null, pstmt, con);
    }

    return cnt;

  }// updateReview

  public int deleteReview(ReviewBoardVO rVO) throws SQLException {

    int cnt = 0;

    Connection con = null;
    PreparedStatement pstmt = null;

    DbConnection db = DbConnection.getInstance();

    try {
      // 1.JNDI 사용 객체 생성
      // 2.DataSource 얻기
      // 3.Connection 얻기
      con = db.getConn("online-shop-dbcp");
      // 4.쿼리문 생성객체 얻기(Dynamic Query)

      StringBuilder deleteBoard = new StringBuilder();
      deleteBoard.append("  delete from review    ").append("  where review_id=? and id=?  ");
      pstmt = con.prepareStatement(deleteBoard.toString());

      // 바인드 변수에 값 설정
      pstmt.setInt(1, rVO.getReviewId());
      pstmt.setString(2, rVO.getId());

      cnt = pstmt.executeUpdate();

    } finally {
      // 7.연결 끊기
      db.closeCon(null, pstmt, con);
    }

    return cnt;

  }// deleteReview

}
