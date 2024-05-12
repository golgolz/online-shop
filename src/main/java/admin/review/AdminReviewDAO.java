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
  private String[] columnNames;

  private AdminReviewDAO() {
    columnNames = new String[] {"title", "content", "id"};
  }

  public static AdminReviewDAO getInstance() {
    if (adminReviewDAO == null) {
      adminReviewDAO = new AdminReviewDAO();
    } // end if
    return adminReviewDAO;
  }// getInstance

  /**
   * 총 레코드의 수
   * 
   * @param sVO
   * @return
   * @throws SQLException
   */
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
      selectCnt.append("select count(*) cnt from review");

      pstmt = con.prepareStatement(selectCnt.toString());
      // 5. 바인트변수에 값 설정
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

  public List<ReviewBoardVO> selectBoard(SearchVO sVO) throws SQLException {
    List<ReviewBoardVO> review = new ArrayList<ReviewBoardVO>();

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
      StringBuilder selectReviewBoard = new StringBuilder();
      selectReviewBoard
          .append("   SELECT * FROM ( SELECT sub.*, ROW_NUMBER() OVER (ORDER BY sub.input_date DESC) AS rn    ")
          .append("     FROM ( SELECT r.review_id, g.default_img, g.name, r.title, r.input_date, r.id   ")
          .append("        FROM review r JOIN customer c ON r.id = c.id JOIN goods g ON r.code = g.code   ");

      /*
       * if (sVO.getKeyword() != null && !"".equals(sVO.getKeyword())) {
       * selectReviewBoard.append(" where instr(").append(columnNames[Integer.parseInt(sVO.getField())])
       * .append(", ? ) > 0"); } // end if
       */
      selectReviewBoard.append("   ) sub ) WHERE rn BETWEEN ? AND ?   ");

      pstmt = con.prepareStatement(selectReviewBoard.toString());
      // 5.바인드 변수 값 설정
      int bindIndex = 0;
      /*
       * if (sVO.getKeyword() != null && !"".equals(sVO.getKeyword())) { pstmt.setString(++bindIndex,
       * sVO.getKeyword()); } // end if
       */ pstmt.setInt(++bindIndex, sVO.getStartNum());
      pstmt.setInt(++bindIndex, sVO.getEndNum());
      // 6.쿼리문 수행 후 결과 얻기
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
      // 7.연결 끊기
      db.closeCon(rs, pstmt, con);
    }

    return review;
  }

  /*
   * public void insertBoard(ReviewBoardVO rVO) throws SQLException {
   * 
   * Connection con = null; PreparedStatement pstmt = null;
   * 
   * DbConnection db = DbConnection.getInstance();
   * 
   * try { // 1.JNDI 사용 객체 생성 // 2.DataSource 얻기 // 3.Connection 얻기 con =
   * db.getConn("online-shop-dbcp"); // 4.쿼리문 생성객체 얻기(Dynamic Query) StringBuilder selectBoard = new
   * StringBuilder(); selectBoard.
   * append("insert into board(num, title, content, id, cnt) values(seq_board.nextval, ?, ?, ?, ?)");
   * pstmt = con.prepareStatement(selectBoard.toString());
   * 
   * // 바인드 변수에 값 설정 pstmt.setString(1, rVO.getTitle()); pstmt.setString(2, rVO.getContent());
   * pstmt.setString(3, rVO.getId()); pstmt.setInt(4, rVO.getCnt());
   * 
   * pstmt.executeUpdate(); } finally { // 7.연결 끊기 db.closeCon(null, pstmt, con); }
   * 
   * }// insertBoard
   * 
   * public ReviewBoardVO selectDetailBoard(int seq , String id ) throws SQLException {// 로그인한 사람만 글을
   * 읽게 하려면 String id // 추가 ReviewBoardVO rVO = null;
   * 
   * Connection con = null; PreparedStatement pstmt = null; ResultSet rs = null;
   * 
   * DbConnection db = DbConnection.getInstance();
   * 
   * try { // 1.JNDI 사용 객체 생성 // 2.DataSource 얻기 // 3.Connection 얻기 con =
   * db.getConn("online-shop-dbcp"); // 4.쿼리문 생성객체 얻기(Dynamic Query) StringBuilder selectBoard = new
   * StringBuilder();
   * selectBoard.append("   select title, content, id, input_date, cnt   ").append("    from board   "
   * ) .append("    where num=?   ");
   * 
   * pstmt = con.prepareStatement(selectBoard.toString()); // 5.바인드 변수 값 설정 pstmt.setInt(1, seq); //
   * 6.쿼리문 수행 후 결과 얻기 rs = pstmt.executeQuery();
   * 
   * if (rs.next()) { StringBuilder content = new StringBuilder(); String temp = "";
   * 
   * // content는 clob데이터 형이어서 별도의 Stream을 연결하여 검색한다. BufferedReader br = null; try { br = new
   * BufferedReader(rs.getClob("content").getCharacterStream()); while ((temp = br.readLine()) !=
   * null) { content.append(temp).append("\n"); } br.close(); } catch (IOException ie) {
   * ie.printStackTrace(); }
   * 
   * rVO = new ReviewBoardVO(seq, rs.getInt("cnt"), rs.getString("title"), content.toString(),
   * rs.getString("id"), rs.getDate("input_date"));
   * 
   * } // end while
   * 
   * } finally { // 7.연결 끊기 db.closeCon(rs, pstmt, con); }
   * 
   * return rVO; }
   * 
   * 
   * public int updateBoard(ReviewBoardVO rVO) throws SQLException {
   * 
   * int cnt = 0;
   * 
   * Connection con = null; PreparedStatement pstmt = null;
   * 
   * DbConnection db = DbConnection.getInstance();
   * 
   * try { // 1.JNDI 사용 객체 생성 // 2.DataSource 얻기 // 3.Connection 얻기 con =
   * db.getConn("online-shop-dbcp"); // 4.쿼리문 생성객체 얻기(Dynamic Query)
   * 
   * StringBuilder updateBoard = new StringBuilder();
   * updateBoard.append("  update board    ").append("  set title=?, content=?, cnt=?    ")
   * .append("  where num=? and id=?   ");
   * 
   * pstmt = con.prepareStatement(updateBoard.toString());;
   * 
   * // 5. 바인드 변수에 값 설정 pstmt.setString(1, rVO.getTitle()); pstmt.setString(2, rVO.getContent());
   * pstmt.setInt(3, rVO.getCnt()); pstmt.setInt(4, rVO.getNum()); pstmt.setString(5, rVO.getId());
   * 
   * cnt = pstmt.executeUpdate();
   * 
   * } finally { // 7.연결 끊기 db.closeCon(null, pstmt, con); }
   * 
   * return cnt;
   * 
   * }// updateBoard
   * 
   * public int deleteBoard(ReviewBoardVO bVO) throws SQLException {
   * 
   * int cnt = 0;
   * 
   * Connection con = null; PreparedStatement pstmt = null;
   * 
   * DbConnection db = DbConnection.getInstance();
   * 
   * try { // 1.JNDI 사용 객체 생성 // 2.DataSource 얻기 // 3.Connection 얻기 con =
   * db.getConn("online-shop-dbcp"); // 4.쿼리문 생성객체 얻기(Dynamic Query)
   * 
   * StringBuilder deleteBoard = new StringBuilder();
   * deleteBoard.append("  delete from board    ").append("  where num=? and id=?   "); pstmt =
   * con.prepareStatement(deleteBoard.toString());;
   * 
   * // 바인드 변수에 값 설정 pstmt.setInt(1, bVO.getNum()); pstmt.setString(2, bVO.getId());
   * 
   * cnt = pstmt.executeUpdate();
   * 
   * } finally { // 7.연결 끊기 db.closeCon(null, pstmt, con); }
   * 
   * return cnt;
   * 
   * }// deleteBoard
   * 
   * public int updateCnt(int num) throws SQLException {
   * 
   * int cnt = 0;
   * 
   * Connection con = null; PreparedStatement pstmt = null;
   * 
   * DbConnection db = DbConnection.getInstance();
   * 
   * try { // 1.JNDI 사용 객체 생성 // 2.DataSource 얻기 // 3.Connection 얻기 con =
   * db.getConn("online-shop-dbcp"); // 4.쿼리문 생성객체 얻기(Dynamic Query)
   * 
   * StringBuilder updateCnt = new StringBuilder();
   * updateCnt.append("  update board set cnt=cnt+1    ").append("  where num=?   "); pstmt =
   * con.prepareStatement(updateCnt.toString());
   * 
   * // 바인드 변수에 값 설정 pstmt.setInt(1, num);
   * 
   * cnt = pstmt.executeUpdate();
   * 
   * } finally { // 7.연결 끊기 db.closeCon(null, pstmt, con); }
   * 
   * return cnt;
   * 
   * }// updateCnt
   */
}
