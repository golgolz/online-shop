package user.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import database.DbConnection;
import order.vo.CardVO;
import order.vo.DeliveryVO;
import order.vo.OrderProductVO;
import order.vo.OrderVO;
import order.vo.PaymentInfoVO;

public class CartDAO {
    private static CartDAO cDAO;

    private CartDAO() {}

    public static CartDAO getInstance() {
        if (cDAO == null) {
            cDAO = new CartDAO();
        }
        return cDAO;
    }// getInstance


    public void insertOrderProduct(OrderProductVO opVO) throws SQLException {

        Connection con = null;
        PreparedStatement pstmt = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn("online-shop-dbcp");
            // 1.JNDI 생성 객체 얻기
            // 2.DataSource 얻기
            // 3.쿼리문 생성 객체 얻기

            String insertQuery = ("insert into order_goods(order_goods_id,cart_id,code,amount) values(?,?,?,?)");

            pstmt = con.prepareStatement(insertQuery);
            // 4.바인드변수에 값 설정
            pstmt.setInt(1, 54); // 추후 시퀀스로 변경
            pstmt.setString(2, opVO.getCartId()); // cartId
            pstmt.setString(3, opVO.getCode()); // code
            pstmt.setInt(4, opVO.getQuantity()); // quantity

            // 5.쿼리문 수행 후 결과 얻기
            pstmt.execute();

        } finally {
            // 6.연결 끊기
            dbCon.closeCon(null, pstmt, con);
        } // end finally

    }// insertOrderProduct


    public void insertCart(OrderVO oVO) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn("online-shop-dbcp");

            String insertQuery =
                    "insert into cart(cart_id,id,name,input_date,purchase_state,order_flag,default_addr_flag,delivery_state) values(to_char(sysdate,'YYYYMMDDHHMMSS'),?,?,sysdate,?,?,?,?)";

            pstmt = con.prepareStatement(insertQuery);

            pstmt.setString(1, oVO.getCustomerId());
            pstmt.setString(2, oVO.getCustomerName());
            pstmt.setString(3, oVO.getPurchaseStauts());
            pstmt.setString(4, oVO.getStatusFlag());
            pstmt.setInt(5, oVO.getDefaultAddrFlag());
            pstmt.setString(6, oVO.getDeliveryStatus());

        } finally {
            dbCon.closeCon(null, pstmt, con);
        }
    }// insertCart

    public int updateCart(OrderProductVO opVO) throws SQLException {
        int cnt = 0;

        Connection con = null;
        PreparedStatement pstmt = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn("online-shop-dbcp");

            StringBuilder updateQuery = new StringBuilder();

            updateQuery.append("   update order_goods    ").append("   set amount=?    ")
                    .append("   where cart_id=? and code=?  ");

            pstmt = con.prepareStatement(updateQuery.toString());

            pstmt.setInt(1, opVO.getQuantity());
            pstmt.setString(2, opVO.getCartId());
            pstmt.setString(3, opVO.getCode());

            cnt = pstmt.executeUpdate();


        } finally {
            dbCon.closeCon(null, pstmt, con);
        } // end finally

        return cnt;
    }// updateCart

    public void insertDelivery(DeliveryVO dVO) throws SQLException {

        Connection con = null;
        PreparedStatement pstmt = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn("online-shop-dbcp");

            String insertQuery =
                    "insert into delivery(cart_id,receiver,zipcode,default_addr,additional_addr,tel,request) values(?,?,?,?,?,?,?)";

            pstmt = con.prepareStatement(insertQuery);

            pstmt.setString(1, dVO.getCartId());
            pstmt.setString(2, dVO.getRecipient());
            pstmt.setString(3, dVO.getZipcode());
            pstmt.setString(4, dVO.getDefaultAddr());
            pstmt.setString(5, dVO.getDetailAddr());
            pstmt.setString(6, dVO.getTel());
            pstmt.setString(7, dVO.getDeliveryMsg());

            pstmt.execute();

        } finally {
            dbCon.closeCon(null, pstmt, con);
        } // end finally
    }// insertDelivery

    public void insertCard(CardVO cVO) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn("online-shop-dbcp");

            String insertQuery = "insert into card(card_id,id,input_date) values(?,?,sysdate)";


            pstmt = con.prepareStatement(insertQuery);

            pstmt.setString(1, cVO.getCardId());
            pstmt.setString(2, cVO.getUserId());

            pstmt.execute();

        } finally {
            dbCon.closeCon(null, pstmt, con);
        } // end finally
    }// insertCard

    public void insertPayment(PaymentInfoVO piVO) throws SQLException {

        Connection con = null;
        PreparedStatement pstmt = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn("online-shop-dbcp");

            String insertQuery = "insert into payment_info(cart_id,card_id,id,purchase_date) values(?,?,?,?)";

            pstmt = con.prepareStatement(insertQuery);

            pstmt.setString(1, piVO.getCartId());
            pstmt.setString(2, piVO.getCardId());
            pstmt.setString(3, piVO.getUserId());
            pstmt.setDate(4, piVO.getPurchaseDate());

            pstmt.execute();

        } finally {
            dbCon.closeCon(null, pstmt, con);
        } // end finally
    }// insertPayment

    public int updateOrderStatus(String cartId, String orderFlag) throws SQLException {
        int cnt = 0;

        Connection con = null;
        PreparedStatement pstmt = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn("online-shop-dbcp");

            StringBuilder updateQuery = new StringBuilder();

            updateQuery.append("   update cart    ").append("   set order_flag=?, input_date=sysdate    ")
                    .append("   where cart_id=?   ");

            /*
             * if (orderFlag == "반품") { updateQuery.append(" and order_flag='주문' and purchase_state='구매미확정' ");
             * }
             */

            pstmt = con.prepareStatement(updateQuery.toString());

            pstmt.setString(1, orderFlag); // 주문/반품으로 변경
            pstmt.setString(2, cartId); // 주문번호

            cnt = pstmt.executeUpdate();

        } finally {
            dbCon.closeCon(null, pstmt, con);
        } // end finally

        return cnt;
    }// updateOrderStatus

    public int updateDeliveryStatus(String cartId, String deliveryStatus) throws SQLException {
        int cnt = 0;

        Connection con = null;
        PreparedStatement pstmt = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn("online-shop-dbcp");

            StringBuilder updateQuery = new StringBuilder();

            updateQuery.append("    update cart   ").append("    set delivery_status=?    ")
                    .append("    where cart_id=?    ");

            pstmt = con.prepareStatement(updateQuery.toString());

            pstmt.setString(1, deliveryStatus);
            pstmt.setString(2, cartId);

            cnt = pstmt.executeUpdate();

        } finally {
            dbCon.closeCon(null, pstmt, con);
        } // end finally

        return cnt;
    }// updateDeliveryStatus

    public int deleteCart(String cartId, String code) throws SQLException {
        int cnt = 0;

        Connection con = null;
        PreparedStatement pstmt = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn("online-shop-dbcp");

            StringBuilder deleteQuery = new StringBuilder();

            deleteQuery.append("    delete from order_goods   ").append("    where cart_id=?    ");

            if (code != null) {// 장바구니 상품 개별 삭제 : 상품 코드가 존재할 경우
                deleteQuery.append(" and code=?");
            }

            pstmt = con.prepareStatement(deleteQuery.toString());

            pstmt.setString(1, cartId);
            pstmt.setString(2, code);

            cnt = pstmt.executeUpdate();

        } finally {
            dbCon.closeCon(null, pstmt, con);
        } // end fianlly
        return cnt;
    }// deleteShopCart

    public List<OrderProductVO> selectCart(String cartId) throws SQLException {
        List<OrderProductVO> list = new ArrayList<OrderProductVO>();
        OrderProductVO opVO = null;

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn("online-shop-dbcp");

            StringBuilder selectQuery = new StringBuilder();

            // 해당 주문번호의 모든 장바구니 상품 조회
            selectQuery.append(
                    "    select gd.default_img,gd.name,og.code,gd.price,og.amount,gd.delivery_charge,(gd.price*og.amount+gd.delivery_charge) total    ")
                    .append("    from goods gd, order_goods og, cart ct   ")
                    .append("    where ((og.code=gd.code) and (ct.cart_id=og.cart_id)) and og.cart_id=? and order_flag='장바구니'    ");

            pstmt = con.prepareStatement(selectQuery.toString());

            pstmt.setString(1, cartId);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                opVO = new OrderProductVO(rs.getString("default_img"), rs.getString("name"), rs.getString("code"),
                        rs.getInt("price"), rs.getInt("amount"), rs.getInt("delivery_charge"), rs.getInt("total"),
                        cartId);

                list.add(opVO);
            } // end while

        } finally {
            dbCon.closeCon(rs, pstmt, con);
        } // end finally

        return list;
    }// selectCart



}
