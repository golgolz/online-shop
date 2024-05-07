package admin.userManage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
  public UserManageVO selectUserInfoById(String id) throws SQLException {
    UserManageVO userManageVO = null;

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    StringBuilder selectQuery = new StringBuilder();

    DbConnection dbConn = DbConnection.getInstance();

    try {
      // 데이터베이스 연결을 얻습니다.
      conn = dbConn.getConn("online-shop-dbcp");
      // 디버깅 문을 추가하여 데이터베이스 연결에 문제가 있는지 확인합니다.
      if (conn == null) {
        System.err.println("Error: Connection is null. Check your DbConnection settings.");
        return null; // 데이터베이스 연결이 null이면 메서드를 종료합니다.
      }

      selectQuery.append("SELECT ").append("c.name, ").append("c.id, ").append("c.tel, ").append("c.input_date, ")
          .append("NVL(SUM(og.amount), 0) AS total_amount, ").append("c.withdrawal_flag, ")
          .append("c.access_limit_flag ").append("FROM ").append("customer c ").append("LEFT JOIN ")
          .append("cart ct ON c.id = ct.id ").append("LEFT JOIN ").append("order_goods og ON ct.cart_id = og.cart_id ")
          .append("WHERE ").append("c.id = ? ").append("GROUP BY ")
          .append("c.name, c.id, c.tel, c.input_date, c.withdrawal_flag, c.access_limit_flag ").append("ORDER BY ")
          .append("c.id");

      pstmt = conn.prepareStatement(selectQuery.toString());
      // 매개변수로 받은 id를 쿼리의 ?에 바인딩합니다.
      pstmt.setString(1, id);
      System.out.println("Executing query with ID: " + id);

      rs = pstmt.executeQuery();

      if (rs.next()) {
        System.out.println("User found with ID: " + id);
        userManageVO =
            new UserManageVO(rs.getString("name"), rs.getString("id"), rs.getString("tel"), rs.getString("input_date"),
                rs.getInt("total_amount"), rs.getString("withdrawal_flag"), rs.getString("access_limit_flag"));
      } else {
        System.out.println("No user found with ID: " + id);

      }

    } catch (Exception e) {
      System.err.println("Error while getting connection: " + e.getMessage());
      e.printStackTrace();
      return null; // 오류 발생 시 null을 반환합니다.
    } finally {
      dbConn.closeCon(rs, pstmt, conn);
    }

    return userManageVO;
  }

  // main 메서드 추가: selectUserInfoById 메서드 테스트
  public static void main(String[] args) {
    // 테스트할 사용자 ID를 지정합니다.
    String testId = "haa"; // 테스트할 사용자 ID를 입력

    // UserManageDAO 인스턴스를 가져옵니다.
    UserManageDAO dao = UserManageDAO.getInstance();

    try {
      // 사용자 정보를 검색합니다.
      UserManageVO userInfo = dao.selectUserInfoById(testId);

      // 결과를 출력합니다.
      if (userInfo != null) {
        System.out.println("사용자 정보가 검색되었습니다:");
        System.out.println("이름: " + userInfo.getName());
        System.out.println("ID: " + userInfo.getId());
        System.out.println("전화번호: " + userInfo.getTel());
        System.out.println("가입 날짜: " + userInfo.getInput_date());
        System.out.println("총 금액: " + userInfo.getTotal_amount());
        System.out.println("탈퇴 여부: " + userInfo.getWithdrawal_flag());
        System.out.println("접근 제한 여부: " + userInfo.getAccess_limit_flag());
      } else {
        System.out.println("해당 ID에 대한 사용자 정보를 찾을 수 없습니다: " + testId);
      }
    } catch (Exception e) {
      System.err.println("사용자 정보를 검색하는 중 오류가 발생했습니다: " + e.getMessage());
      e.printStackTrace();
    }
  }

}
