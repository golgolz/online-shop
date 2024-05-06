package admin.userManage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import database.DbConnection;

public class UserManageDAO {

  private static UserManageDAO userManageDAO;

  private UserManageDAO() {}

  public static UserManageDAO getInstance() {
    if (userManageDAO == null) {
      userManageDAO = new UserManageDAO();
    }

    return userManageDAO;
  }

  // 아이디로 검색
  public UserManageVO selectUserInfoById() throws SQLException {

    UserManageVO userManageVO = null;

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    StringBuilder selectQuery = new StringBuilder();

    DbConnection dbConn = DbConnection.getInstance();



    try {
      conn = dbConn.getConn("online-shop-dbcp");

      selectQuery.append("SELECT ").append("c.name, ").append("c.id, ").append("c.tel, ").append("c.input_date, ")
          .append("NVL(SUM(og.amount), 0) AS total_amount, ").append("c.withdrawal_flag, ")
          .append("c.access_limit_flag ").append("FROM ").append("customer c ").append("LEFT JOIN ")
          .append("cart ct ON c.id = ct.id ").append("LEFT JOIN ").append("order_goods og ON ct.cart_id = og.cart_id ")
          .append("WHERE ").append("c.id = '?' ").append("GROUP BY ")
          .append("c.name, c.id, c.tel, c.input_date, c.withdrawal_flag, c.access_limit_flag ").append("ORDER BY ")
          .append("c.id");

      pstmt = conn.prepareStatement(selectQuery.toString());
      rs = pstmt.executeQuery();

      if (rs.next()) {
        userManageVO =
            new UserManageVO(rs.getString("name"), rs.getString("id"), rs.getString("tel"), rs.getString("input_date"),
                rs.getInt("total_amount"), rs.getString("withdrawal_flag"), rs.getString("access_limit_flag"));
      }

    } finally {
      dbConn.closeCon(rs, pstmt, conn);
    }
    return userManageVO;
  }
}
