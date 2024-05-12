package admin.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import database.DbConnection;

public class AdminOrderDAO {
    private static AdminOrderDAO adminOrderDAO;

    private AdminOrderDAO() {}

    public static AdminOrderDAO getInstance() {
        if (adminOrderDAO == null) {
            adminOrderDAO = new AdminOrderDAO();
        }
        return adminOrderDAO;
    }

    public int selectCount() throws SQLException {
        int count = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        StringBuilder selectQuery = new StringBuilder();
        DbConnection dbConn = DbConnection.getInstance();

        try {
            conn = dbConn.getConn("online-shop-dbcp");

            selectQuery.append(" select count(*) from cart ")
                    .append(" join delivery on delivery.cart_id = cart.cart_id ").append(" left join ( ")
                    .append(" select order_goods.cart_id as cart_id, sum(goods.price * order_goods.amount) as purchase_amount from goods ")
                    .append(" join order_goods on goods.code = order_goods.code ")
                    .append(" group by cart_id ) purchase_amount on purchase_amount.cart_id = cart.cart_id ")
                    .append(" where order_flag='주문' ");

            pstmt = conn.prepareStatement(selectQuery.toString());

            rs = pstmt.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(*)");
            }
        } finally {
            dbConn.closeCon(rs, pstmt, conn);
        }

        return count;
    }

    public List<OrderVO> selectOrders() throws SQLException {
        List<OrderVO> orders = new ArrayList<OrderVO>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        StringBuilder selectQuery = new StringBuilder();
        DbConnection dbConn = DbConnection.getInstance();

        try {
            conn = dbConn.getConn("online-shop-dbcp");

            selectQuery.append(
                    " select input_date, cart.cart_id, cart.id, name, purchase_state, order_flag, delivery_state, receiver, '카드결제' as payment, purchase_amount as purchase_amount from cart ")
                    .append(" join delivery on delivery.cart_id = cart.cart_id ").append(" left join ( ")
                    .append(" select order_goods.cart_id as cart_id, sum(goods.price * order_goods.amount) as purchase_amount from goods ")
                    .append(" join order_goods on goods.code = order_goods.code ")
                    .append(" group by cart_id ) purchase_amount on purchase_amount.cart_id = cart.cart_id ")
                    .append(" where order_flag='주문' ");

            pstmt = conn.prepareStatement(selectQuery.toString());

            rs = pstmt.executeQuery();

            while (rs.next()) {
                orders.add(new OrderVO(rs.getString("input_date"), rs.getString("cart_id"), rs.getString("id"),
                        rs.getString("name"), rs.getString("purchase_state"), rs.getString("delivery_state"),
                        rs.getString("receiver"), rs.getString("payment"), rs.getInt("purchase_amount")));
            }
        } finally {
            dbConn.closeCon(rs, pstmt, conn);
        }

        return orders;
    }
}
