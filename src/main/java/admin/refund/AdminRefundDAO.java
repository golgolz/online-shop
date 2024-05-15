package admin.refund;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import database.DbConnection;

public class AdminRefundDAO {
    private static AdminRefundDAO adminRefundDAO;

    private AdminRefundDAO() {}

    public static AdminRefundDAO getInstance() {
        if (adminRefundDAO == null) {
            adminRefundDAO = new AdminRefundDAO();
        }
        return adminRefundDAO;
    }

    public List<RefundSimpleVO> selectRefunds(SearchVO searchVO) throws SQLException {
        List<RefundSimpleVO> refunds = new ArrayList<RefundSimpleVO>();

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        StringBuilder selectQuery = new StringBuilder();

        DbConnection dbConn = DbConnection.getInstance();

        try {
            conn = dbConn.getConn("online-shop-dbcp");


            selectQuery.append(
                    " select order_date, cart_id, id, name, refund_date, refund_state, purchase_amount as refund_amount, '카드결제' as payment from ( ")
                    .append(" select row_number() over(order by cart.input_date desc) as rnum, cart.input_date as order_date, cart.cart_id, cart.id, name, refund.input_date as refund_date, refund_state, purchase_amount as purchase_amount, '카드결제' as payment ")
                    .append(" from cart join refund_history refund on refund.cart_id = cart.cart_id left join ( ")
                    .append(" select order_goods.cart_id as cart_id, sum(goods.price * order_goods.amount) as purchase_amount from goods ")
                    .append(" join order_goods on goods.code = order_goods.code group by cart_id) purchase_amount on purchase_amount.cart_id = cart.cart_id ")
                    .append(" where order_flag='반품' ");

            if (searchVO.getField() != -1) {
                switch (searchVO.getField()) {
                    case 0:
                        selectQuery.append(" and cart.cart_id = ? ");
                        break;
                    case 1:
                        selectQuery.append(" and id = ? ");
                        break;
                    case 2:
                        selectQuery.append(" and name = ? ");
                        break;
                    case 3:
                        selectQuery.append(" and receiver = ? ");
                        break;
                    default:
                }
            }

            if (searchVO.getDate() != null) {
                switch (searchVO.getDate()) {
                    case "today":
                        selectQuery.append(
                                " and trunc(input_date) = to_date('2024-04-19', 'yyyy-mm-dd') and order_flag='반품' ");
                        break;
                    case "week":
                        selectQuery.append(
                                " and input_date >= trunc(to_date('2024-04-18', 'yyyy-mm-dd'), 'IW') and order_flag='반품' ");
                        break;
                    case "month":
                        selectQuery.append(
                                " and extract(month from input_date) = extract(month from to_date('2024-04-12', 'yyyy-mm-dd')) ")
                                .append(" and extract(year from input_date) = extract(year from to_date('2024-04-13', 'yyyy-mm-dd')) ");
                        break;
                }
            }

            if (searchVO.getRefund() != null) {
                selectQuery.append(" and refund_state = '?' ");
            }

            selectQuery.append(") where rnum between ? and ? ");
            pstmt = conn.prepareStatement(selectQuery.toString());

            int bindIndex = 0;

            if (searchVO.getField() != -1) {
                pstmt.setString(++bindIndex, searchVO.getKeyword());
            }

            if (searchVO.getRefund() != null) {
                pstmt.setString(++bindIndex, searchVO.getRefund());
            }

            pstmt.setInt(++bindIndex, searchVO.getStart());
            pstmt.setInt(++bindIndex, searchVO.getEnd());

            rs = pstmt.executeQuery();
            System.out.println(selectQuery.toString());

            while (rs.next()) {
                refunds.add(new RefundSimpleVO(rs.getDate("order_date"), rs.getString("cart_id"), rs.getString("id"),
                        rs.getString("name"), rs.getString("refund_state"), rs.getDate("refund_date"),
                        rs.getInt("refund_amount"), rs.getString("payment")));
            }
        } finally {
            dbConn.closeCon(rs, pstmt, conn);
        }
        return refunds;
    }
}
