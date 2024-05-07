package admin.userManage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import database.DbConnection;

public class UserManageDAO {

  public static UserManageDAO userManageDAO;

  public UserManageDAO() {}

  public static UserManageDAO getInstance() {
    if (userManageDAO == null) {
      userManageDAO = new UserManageDAO();
    }

    return userManageDAO;
  }

  // 아이디로 검색
  public List<UserManageVO> selectUserInfoById(String id) throws SQLException {
    List<UserManageVO> userList = new ArrayList<>();

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    StringBuilder selectQuery = new StringBuilder();

    DbConnection dbConn = DbConnection.getInstance();

    try {
      conn = dbConn.getConn("online-shop-dbcp");
      if (conn == null) {
        System.err.println("Error: Connection is null. Check your DbConnection settings.");
        return null; // 데이터베이스 연결이 null이면 메서드를 종료합니다.
      }

      selectQuery.append("SELECT ").append("c.name, c.id, c.tel, c.input_date, ")
          .append("NVL(SUM(og.amount), 0) AS total_amount, ").append("c.withdrawal_flag, c.access_limit_flag ")
          .append("FROM customer c ").append("LEFT JOIN cart ct ON c.id = ct.id ")
          .append("LEFT JOIN order_goods og ON ct.cart_id = og.cart_id ").append("WHERE c.id = ? ")
          .append("GROUP BY c.name, c.id, c.tel, c.input_date, c.withdrawal_flag, c.access_limit_flag ")
          .append("ORDER BY c.id");

      pstmt = conn.prepareStatement(selectQuery.toString());
      pstmt.setString(1, id);
      System.out.println("Executing query with ID: " + id);

      rs = pstmt.executeQuery();

      // 반복적으로 ResultSet에서 레코드를 읽어서 userList에 추가
      while (rs.next()) {
        UserManageVO userManageVO =
            new UserManageVO(rs.getString("name"), rs.getString("id"), rs.getString("tel"), rs.getString("input_date"),
                rs.getInt("total_amount"), rs.getString("withdrawal_flag"), rs.getString("access_limit_flag"));
        userList.add(userManageVO);
      }

      if (userList.isEmpty()) {
        System.out.println("No users found with ID: " + id);
      } else {
        System.out.println("Users found with ID: " + id);
      }

    } catch (Exception e) {
      System.err.println("Error while getting connection: " + e.getMessage());
      e.printStackTrace();
      return null; // 오류 발생 시 null을 반환합니다.
    } finally {
      dbConn.closeCon(rs, pstmt, conn);
    }

    return userList; // 사용자 목록 반환
  }

  // 입력값이 널일때
  public List<UserManageVO> selectUserInfoById2(String id) throws SQLException {
    List<UserManageVO> userList = new ArrayList<>();

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    StringBuilder selectQuery = new StringBuilder();

    DbConnection dbConn = DbConnection.getInstance();

    try {
      conn = dbConn.getConn("online-shop-dbcp");

      // 쿼리 구성
      // 입력받은 id 값이 NULL이면 모든 id에 대해 검색
      selectQuery.append("SELECT ").append("c.name, c.id, c.tel, c.input_date, ")
          .append("NVL(SUM(og.amount), 0) AS total_amount, ").append("c.withdrawal_flag, c.access_limit_flag ")
          .append("FROM customer c ").append("LEFT JOIN cart ct ON c.id = ct.id ")
          .append("LEFT JOIN order_goods og ON ct.cart_id = og.cart_id ").append("WHERE c.id = NVL(?, c.id) ")
          .append("GROUP BY c.name, c.id, c.tel, c.input_date, c.withdrawal_flag, c.access_limit_flag ")
          .append("ORDER BY c.id");

      // PreparedStatement 설정
      pstmt = conn.prepareStatement(selectQuery.toString());

      if (id != null) {
        pstmt.setString(1, id);
      } else {
        pstmt.setNull(1, java.sql.Types.VARCHAR);
      }

      // 쿼리 실행
      rs = pstmt.executeQuery();

      // 결과 처리
      while (rs.next()) {
        UserManageVO userManageVO =
            new UserManageVO(rs.getString("name"), rs.getString("id"), rs.getString("tel"), rs.getString("input_date"),
                rs.getInt("total_amount"), rs.getString("withdrawal_flag"), rs.getString("access_limit_flag"));
        userList.add(userManageVO);
      }
    } finally {
      dbConn.closeCon(rs, pstmt, conn);
    }

    return userList;
  }



}
