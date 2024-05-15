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

    public int selectCount(SearchVO searchVO) throws SQLException {
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
                                " and trunc(input_date) = to_date('2024-04-19', 'yyyy-mm-dd') and order_flag='주문' ");
                        break;
                    case "week":
                        selectQuery.append(
                                " and input_date >= trunc(to_date('2024-04-18', 'yyyy-mm-dd'), 'IW') and order_flag='주문' ");
                        break;
                    case "month":
                        selectQuery.append(
                                " and extract(month from input_date) = extract(month from to_date('2024-04-12', 'yyyy-mm-dd')) ")
                                .append(" and extract(year from input_date) = extract(year from to_date('2024-04-13', 'yyyy-mm-dd')) ");
                        break;
                }
            }

            if (searchVO.getDelivery() != null) {
                selectQuery.append(" and delivery_state = ? ");
            }

            if (searchVO.getPurchase() != null) {
                selectQuery.append(" and purchase_state = ? ");
            }

            pstmt = conn.prepareStatement(selectQuery.toString());

            int bindIndex = 0;

            if (searchVO.getField() != -1) {
                pstmt.setString(++bindIndex, searchVO.getKeyword());
            }

            if (searchVO.getDelivery() != null) {
                pstmt.setString(++bindIndex, searchVO.getDelivery());
            }

            if (searchVO.getPurchase() != null) {
                pstmt.setString(++bindIndex, searchVO.getPurchase());
            }

            rs = pstmt.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(*)");
            }
        } finally {
            dbConn.closeCon(rs, pstmt, conn);
        }

        return count;
    }

    public List<OrderVO> selectOrders(SearchVO searchVO) throws SQLException {
        List<OrderVO> orders = new ArrayList<OrderVO>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        StringBuilder selectQuery = new StringBuilder();
        DbConnection dbConn = DbConnection.getInstance();

        try {
            conn = dbConn.getConn("online-shop-dbcp");

            selectQuery.append(
                    " select input_date, cart_id, id, name, purchase_state, order_flag, delivery_state, receiver, '카드결제' as payment, purchase_amount from ( ")
                    .append(" select row_number() over(order by cart.input_date desc) as rnum, input_date, cart.cart_id, cart.id, name, purchase_state, order_flag, delivery_state, receiver, '카드결제' as payment ")
                    .append(" , purchase_amount as purchase_amount from cart join delivery on delivery.cart_id = cart.cart_id left join ( ")
                    .append(" select order_goods.cart_id as cart_id, sum(goods.price * order_goods.amount) as purchase_amount from goods join order_goods on goods.code = order_goods.code ")
                    .append(" group by cart_id) purchase_amount on purchase_amount.cart_id = cart.cart_id where order_flag='주문' ");

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
                                " and trunc(input_date) = to_date('2024-04-19', 'yyyy-mm-dd') and order_flag='주문' ");
                        break;
                    case "week":
                        selectQuery.append(
                                " and input_date >= trunc(to_date('2024-04-18', 'yyyy-mm-dd'), 'IW') and order_flag='주문' ");
                        break;
                    case "month":
                        selectQuery.append(
                                " and extract(month from input_date) = extract(month from to_date('2024-04-12', 'yyyy-mm-dd')) ")
                                .append(" and extract(year from input_date) = extract(year from to_date('2024-04-13', 'yyyy-mm-dd')) ");
                        break;
                }
            }

            if (searchVO.getDelivery() != null) {
                switch (searchVO.getDelivery()) {
                    case "1":
                        selectQuery.append(" and delivery_state = '배송준비'");
                        break;
                    case "2":
                        selectQuery.append(" and delivery_state = '배송중'");
                        break;
                    case "3":
                        selectQuery.append(" and delivery_state = '배송완료'");
                        break;
                }
            }

            if (searchVO.getPurchase() != null) {
                switch (searchVO.getPurchase()) {
                    case "1":
                        selectQuery.append(" and delivery_state = '구매확정'");
                        break;
                    case "2":
                        selectQuery.append(" and delivery_state = '구매미확정'");
                        break;
                }
            }

            selectQuery.append(" ) where rnum between ? and ? ");

            pstmt = conn.prepareStatement(selectQuery.toString());

            int bindIndex = 0;

            if (searchVO.getField() != -1) {
                pstmt.setString(++bindIndex, searchVO.getKeyword());
            }

            if (searchVO.getDelivery() != null) {
                pstmt.setString(++bindIndex, searchVO.getDelivery());
            }

            if (searchVO.getPurchase() != null) {
                pstmt.setString(++bindIndex, searchVO.getPurchase());
            }

            pstmt.setInt(++bindIndex, searchVO.getStart());
            pstmt.setInt(++bindIndex, searchVO.getEnd());

            rs = pstmt.executeQuery();
            // System.out.println(selectQuery.toString());

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

    public OrderDetailInfoVO selectDetailInfo(String cartId) throws SQLException {
        OrderDetailInfoVO detailInfo = null;

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        StringBuilder selectQuery = new StringBuilder();
        DbConnection dbConn = DbConnection.getInstance();

        try {
            conn = dbConn.getConn("online-shop-dbcp");
            selectQuery.append(
                    " select cart.cart_id, cart.id, cart.input_date, purchase_amount.purchase_amount, delivery.receiver, delivery.tel, delivery.zipcode, delivery.default_addr, delivery.additional_addr, delivery.request from cart ")
                    .append(" join delivery on cart.cart_id = delivery.cart_id ")
                    .append(" join ( select order_goods.cart_id as cart_id, sum(goods.price * order_goods.amount) as purchase_amount from goods ")
                    .append(" join order_goods on goods.code = order_goods.code group by cart_id ) purchase_amount on purchase_amount.cart_id = cart.cart_id ")
                    .append(" where cart.cart_id = ? ");
            pstmt = conn.prepareStatement(selectQuery.toString());
            pstmt.setString(1, cartId);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                detailInfo = new OrderDetailInfoVO(rs.getString("cart_id"), rs.getString("id"),
                        rs.getString("input_date"), rs.getInt("purchase_amount"), rs.getString("receiver"),
                        rs.getString("tel"), rs.getString("zipcode"), rs.getString("default_addr"),
                        rs.getString("additional_addr"), rs.getString("request"));
            }
        } finally {
            dbConn.closeCon(rs, pstmt, conn);
        }

        return detailInfo;
    }

    public List<OrderDetailGoodsVO> selectDetailGoods(String cartId) throws SQLException {
        List<OrderDetailGoodsVO> goods = new ArrayList<OrderDetailGoodsVO>();

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        StringBuilder selectQuery = new StringBuilder();
        DbConnection dbConn = DbConnection.getInstance();

        try {
            conn = dbConn.getConn("online-shop-dbcp");
            selectQuery.append(
                    "select goods.code, cart.cart_id, default_img, goods.name, price, delivery_charge, order_goods.amount, delivery_state, purchase_state from goods ")
                    .append(" join order_goods on goods.code = order_goods.code ")
                    .append(" join cart on cart.cart_id = order_goods.cart_id ").append(" where cart.cart_id = ? ");
            pstmt = conn.prepareStatement(selectQuery.toString());
            pstmt.setString(1, cartId);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                goods.add(new OrderDetailGoodsVO(rs.getString("code"), rs.getString("default_img"),
                        rs.getString("name"), rs.getInt("price"), rs.getInt("delivery_charge"), rs.getInt("amount"),
                        rs.getString("delivery_state"), rs.getString("purchase_state")));
            }
        } finally {
            dbConn.closeCon(rs, pstmt, conn);
        }

        return goods;
    }

    public int updateDelivery(String cartId, String status) throws SQLException {
        int count = 0;

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        StringBuilder updateQuery = new StringBuilder();
        DbConnection dbConn = DbConnection.getInstance();

        try {
            conn = dbConn.getConn("online-shop-dbcp");
            updateQuery.append("update cart set ");

            if (status != null && status != "") {
                switch (status) {
                    case "반품접수":
                        updateQuery.append(" order_flag = ? where cart_id = ?");
                        break;
                    default:
                        updateQuery.append(" delivery_state = ? where cart_id = ?");
                        break;
                }
            }

            pstmt = conn.prepareStatement(updateQuery.toString());

            int bindIndex = 0;

            if (status != null && status != "") {
                switch (status) {
                    case "배송시작":
                        pstmt.setString(++bindIndex, "배송중");
                        pstmt.setString(++bindIndex, cartId);
                        break;
                    case "배송완료":
                        pstmt.setString(++bindIndex, "배송완료");
                        pstmt.setString(++bindIndex, cartId);
                        break;
                    case "반품접수":
                        pstmt.setString(++bindIndex, "반품");
                        pstmt.setString(++bindIndex, cartId);
                        break;
                }
            }

            count = pstmt.executeUpdate();
        } finally {
            dbConn.closeCon(rs, pstmt, conn);
        }

        return count;
    }
}
