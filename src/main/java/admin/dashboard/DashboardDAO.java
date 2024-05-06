package admin.dashboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import database.DbConnection;

public class DashboardDAO {
    private static DashboardDAO dashboardDAO;

    private DashboardDAO() {}

    public static DashboardDAO getInstance() {
        if (dashboardDAO == null) {
            dashboardDAO = new DashboardDAO();
        }

        return dashboardDAO;
    }

    public DashboardOrderVO selectOrderInfo() throws SQLException {
        DashboardOrderVO orderVO = null;

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        StringBuilder selectQuery = new StringBuilder();

        DbConnection dbConn = DbConnection.getInstance();

        try {
            conn = dbConn.getConn("online-shop-dbcp");
            selectQuery.append(" select (select count(*) from cart ").append(
                    " where trunc(input_date) = to_date('2024-04-20', 'yyyy-mm-dd') and order_flag='주문') as today, ")
                    .append(" (select count(*) from cart ")
                    .append(" where input_date >= trunc(to_date('2024-04-20', 'yyyy-mm-dd'), 'IW') ")
                    .append(" and input_date < trunc(to_date('2024-04-20', 'yyyy-mm-dd'), 'IW') + 7 and order_flag='주문' ) as this_week, ")
                    .append(" (select count(*) from cart ")
                    .append(" where extract(month from input_date) = extract(month from to_date('2024-04-19', 'yyyy-mm-dd')) ")
                    .append(" and extract(year from input_date) = extract(year from to_date('2024-04-19', 'yyyy-mm-dd')) ")
                    .append(" and order_flag='주문' ) as this_month, ").append(" (select count(*) from cart ")
                    .append(" where order_flag='반품') as refund from dual");
            pstmt = conn.prepareStatement(selectQuery.toString());
            rs = pstmt.executeQuery();

            if (rs.next()) {
                orderVO = new DashboardOrderVO(rs.getInt("today"), rs.getInt("this_week"), rs.getInt("this_month"),
                        rs.getInt("refund"));
            }
        } finally {
            dbConn.closeCon(rs, pstmt, conn);
        }

        return orderVO;
    }

    public DashboardOrderProgressVO selectPregressInfo() throws SQLException {
        DashboardOrderProgressVO progressVO = null;

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        StringBuilder selectQuery = new StringBuilder();

        DbConnection dbConn = DbConnection.getInstance();

        try {
            conn = dbConn.getConn("online-shop-dbcp");
            selectQuery.append(" select ( select count(*) from cart where order_flag != '장바구니') as order_done, ")
                    .append(" (select count(*) from cart where delivery_state = '배송 준비중') as delivery_ready, ")
                    .append(" (select count(*) from cart where delivery_state = '배송중') as delivery_progress, ")
                    .append(" (select count(*) from cart where delivery_state = '배송 완료') as delivery_done, ")
                    .append(" (select count(*) from cart where purchase_state = '구매확정') as order_confirm ")
                    .append(" from dual ");

            pstmt = conn.prepareStatement(selectQuery.toString());
            rs = pstmt.executeQuery();

            if (rs.next()) {
                System.out.println(rs.getInt("order_confirm"));
                progressVO = new DashboardOrderProgressVO(rs.getInt("order_done"), rs.getInt("delivery_ready"),
                        rs.getInt("delivery_progress"), rs.getInt("delivery_done"), rs.getInt("order_confirm"));
            }
        } finally {
            dbConn.closeCon(rs, pstmt, conn);
        }

        return progressVO;
    }
}
