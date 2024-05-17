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

    public int selectCount(SearchVO searchVO) throws SQLException {
        int count = 0;

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        StringBuilder selectQuery = new StringBuilder();

        DbConnection dbConn = DbConnection.getInstance();

        try {
            conn = dbConn.getConn("online-shop-dbcp");

            selectQuery.append(" select count(*) as count from ( ").append(
                    " select row_number() over(order by cart.input_date desc) as rnum, cart.input_date as order_date, cart.cart_id, cart.id, name, refund.input_date as refund_date, refund_state, purchase_amount as purchase_amount, '카드결제' as payment ")
                    .append(" from cart join refund_history refund on refund.cart_id = cart.cart_id join delivery on delivery.cart_id = cart.cart_id left join ( ")
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
                                " and to_date(cart.input_date, 'yyyy-mm-dd') = to_date(sysdate, 'yyyy-mm-dd') and order_flag='반품' ");
                        break;
                    case "week":
                        selectQuery.append(
                                " and to_date(cart.input_date, 'yyyy-mm-dd') >= trunc(to_date(sysdate, 'yyyy-mm-dd'), 'IW') and order_flag='반품' ");
                        break;
                    case "month":
                        selectQuery.append(
                                " and extract(month from to_date(cart.input_date, 'yyyy-mm-dd')) = extract(month from to_date(sysdate, 'yyyy-mm-dd')) ")
                                .append(" and extract(year from to_date(cart.input_date, 'yyyy-mm-dd')) = extract(year from to_date(sysdate, 'yyyy-mm-dd')) ");
                        break;
                }
            }

            if (searchVO.getRefund() != null) {
                switch (searchVO.getRefund()) {
                    case "1":
                        selectQuery.append(" and refund_state = '반품 접수' ");
                        break;
                    case "2":
                        selectQuery.append(" and refund_state = '반품 완료' ");
                        break;
                }
            }

            selectQuery.append(") where rnum between ? and ? ");
            pstmt = conn.prepareStatement(selectQuery.toString());

            int bindIndex = 0;

            if (searchVO.getField() != -1) {
                pstmt.setString(++bindIndex, searchVO.getKeyword());
            }

            pstmt.setInt(++bindIndex, searchVO.getStart());
            pstmt.setInt(++bindIndex, searchVO.getEnd());

            rs = pstmt.executeQuery();

            if (rs.next()) {
                count = rs.getInt("count");
            }
        } finally {
            dbConn.closeCon(rs, pstmt, conn);
        }

        return count;
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
                    " select order_date, cart_id, id, name, refund_date, refund_state, purchase_amount + 3000 as refund_amount, '카드결제' as payment from ( ")
                    .append(" select row_number() over(order by cart.input_date desc) as rnum, cart.input_date as order_date, cart.cart_id, cart.id, name, refund.input_date as refund_date, refund_state, purchase_amount as purchase_amount, '카드결제' as payment ")
                    .append(" from cart join refund_history refund on refund.cart_id = cart.cart_id join delivery on delivery.cart_id = cart.cart_id left join ( ")
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
                                " and to_date(cart.input_date, 'yyyy-mm-dd') = to_date(sysdate, 'yyyy-mm-dd') and order_flag='반품' ");
                        break;
                    case "week":
                        selectQuery.append(
                                " and to_date(cart.input_date, 'yyyy-mm-dd') >= trunc(to_date(sysdate, 'yyyy-mm-dd'), 'IW') and order_flag='반품' ");
                        break;
                    case "month":
                        selectQuery.append(
                                " and extract(month from to_date(cart.input_date, 'yyyy-mm-dd')) = extract(month from to_date(sysdate, 'yyyy-mm-dd')) ")
                                .append(" and extract(year from to_date(cart.input_date, 'yyyy-mm-dd')) = extract(year from to_date(sysdate, 'yyyy-mm-dd')) ");
                        break;
                }
            }

            if (searchVO.getRefund() != null) {
                switch (searchVO.getRefund()) {
                    case "1":
                        selectQuery.append(" and refund_state = '반품 접수' ");
                        break;
                    case "2":
                        selectQuery.append(" and refund_state = '반품 완료' ");
                        break;
                }
            }

            selectQuery.append(") where rnum between ? and ? ");
            pstmt = conn.prepareStatement(selectQuery.toString());

            int bindIndex = 0;

            if (searchVO.getField() != -1) {
                pstmt.setString(++bindIndex, searchVO.getKeyword());
            }

            pstmt.setInt(++bindIndex, searchVO.getStart());
            pstmt.setInt(++bindIndex, searchVO.getEnd());

            rs = pstmt.executeQuery();

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

    public RefundDetailInfoVO selectDetailInfo(String cartId) throws SQLException {
        RefundDetailInfoVO refundInfo = null;

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        StringBuilder selectQuery = new StringBuilder();

        DbConnection dbConn = DbConnection.getInstance();

        try {
            conn = dbConn.getConn("online-shop-dbcp");

            selectQuery.append(" select id, refund_date, purchase_amount as refund_amount from ( ").append(
                    " select cart.cart_id, cart.id, refund.input_date as refund_date, purchase_amount as purchase_amount ")
                    .append(" from cart join refund_history refund on refund.cart_id = cart.cart_id join delivery on delivery.cart_id = cart.cart_id left join ( ")
                    .append(" select order_goods.cart_id as cart_id, sum(goods.price * order_goods.amount) as purchase_amount from goods ")
                    .append(" join order_goods on goods.code = order_goods.code group by cart_id) purchase_amount on purchase_amount.cart_id = cart.cart_id ")
                    .append(" where order_flag='반품' and cart.cart_id = ? )");
            pstmt = conn.prepareStatement(selectQuery.toString());
            pstmt.setString(1, cartId);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                refundInfo = new RefundDetailInfoVO(rs.getString("id"), rs.getDate("refund_date"),
                        rs.getInt("refund_amount"));
            }
        } finally {
            dbConn.closeCon(rs, pstmt, conn);
        }

        return refundInfo;
    }

    public int updateRefund(String cartId) throws SQLException {
        int count = 0;

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        StringBuilder updateQuery = new StringBuilder();

        DbConnection dbConn = DbConnection.getInstance();

        try {
            conn = dbConn.getConn("online-shop-dbcp");
            updateQuery.append("update refund_history set refund_state='반품 완료' where cart_id = ? ");
            pstmt = conn.prepareStatement(updateQuery.toString());
            pstmt.setString(1, cartId);

            count = pstmt.executeUpdate();
        } finally {
            dbConn.closeCon(rs, pstmt, conn);
        }

        return count;
    }
}
