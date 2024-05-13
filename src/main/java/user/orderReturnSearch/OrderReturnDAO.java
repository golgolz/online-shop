package user.orderReturnSearch;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import database.DbConnection;

public class OrderReturnDAO {

  public static OrderReturnDAO orderReturnDAO;

  public OrderReturnDAO() {}

  public static OrderReturnDAO getInstance() {
    if (orderReturnDAO == null) {
      orderReturnDAO = new OrderReturnDAO();
    }

    return orderReturnDAO;
  }


  public List<OrderVO> searchOrdersByDateRange(String id, String fromDate, String toDate) throws SQLException {
    List<OrderVO> orders = new ArrayList<>();
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DbConnection dbConn = DbConnection.getInstance();

    try {
      conn = dbConn.getConn("online-shop-dbcp");

      StringBuilder sql = new StringBuilder();
      sql.append(
          "SELECT c.id, c.input_date, c.cart_id, fg.default_img, fg.code, fg.name, fg.amount AS product_amount, ");
      sql.append("ps.total_price, c.purchase_state, c.order_flag, c.delivery_state ");
      sql.append("FROM cart c ");
      sql.append("JOIN ( ");
      sql.append("    SELECT og.cart_id, SUM(g.price * og.amount) AS total_price ");
      sql.append("    FROM order_goods og ");
      sql.append("    JOIN goods g ON og.code = g.code ");
      sql.append("    GROUP BY og.cart_id ");
      sql.append(") ps ON c.cart_id = ps.cart_id ");
      sql.append("JOIN ( ");
      sql.append("    SELECT og.cart_id, g.code, g.name, og.amount, g.default_img, ");
      sql.append("    ROW_NUMBER() OVER (PARTITION BY og.cart_id ORDER BY g.code ASC) AS rn ");
      sql.append("    FROM order_goods og ");
      sql.append("    JOIN goods g ON og.code = g.code ");
      sql.append(") fg ON fg.cart_id = c.cart_id AND fg.rn = 1 ");
      sql.append("WHERE c.id = ? ");
      sql.append("AND c.input_date >= TO_DATE(?, 'YYYY-MM-DD') ");
      sql.append("AND c.input_date <= TO_DATE(?, 'YYYY-MM-DD') ");
      sql.append("ORDER BY c.input_date DESC, c.cart_id");

      pstmt = conn.prepareStatement(sql.toString());
      pstmt.setString(1, id);
      pstmt.setString(2, fromDate);
      pstmt.setString(3, toDate);

      rs = pstmt.executeQuery();

      while (rs.next()) {
        orders.add(new OrderVO(rs.getString("id"), rs.getDate("input_date"), rs.getString("cart_id"),
            rs.getString("default_img"), rs.getString("code"), rs.getString("name"), rs.getInt("product_amount"),
            rs.getInt("total_price"), rs.getString("purchase_state"), rs.getString("order_flag"),
            rs.getString("delivery_state")));
      }
    } finally {
      dbConn.closeCon(rs, pstmt, conn);
    }

    return orders;
  }// searchOrdersByDateRange

  public boolean updatePurchaseState(String cartId) throws SQLException {
    Connection conn = null;
    PreparedStatement pstmt = null;
    DbConnection dbConn = DbConnection.getInstance();

    try {
      conn = dbConn.getConn("online-shop-dbcp");
      String sql = "UPDATE cart SET purchase_state = '구매확정' WHERE cart_id = ? AND purchase_state = '구매미확정' ";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, cartId);

      int rowsAffected = pstmt.executeUpdate();
      return rowsAffected > 0; // 성공적으로 업데이트된 행이 있는지 여부를 반환
    } finally {
      dbConn.closeCon(null, pstmt, conn);
    }
  }// updatePurchaseState


}
