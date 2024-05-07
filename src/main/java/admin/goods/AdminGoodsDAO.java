package admin.goods;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import database.DbConnection;

public class AdminGoodsDAO {
    private static AdminGoodsDAO adminGoodsDAO;

    private AdminGoodsDAO() {}

    public static AdminGoodsDAO getInstance() {
        if (adminGoodsDAO == null) {
            adminGoodsDAO = new AdminGoodsDAO();
        }

        return adminGoodsDAO;
    }

    public List<AdminGoodsSimpleVO> selectGoods(SearchVO searchVO) throws SQLException {
        List<AdminGoodsSimpleVO> goods = new ArrayList<AdminGoodsSimpleVO>();

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        StringBuilder selectQuery = new StringBuilder();

        DbConnection dbConn = DbConnection.getInstance();

        try {
            conn = dbConn.getConn("online-shop-dbcp");
            selectQuery.append("select code, name, default_img, input_date, price, amount from goods where 1=1");

            if (searchVO.getCode() != null) {
                selectQuery.append(" and code like '%'||?||'%' ");
            }

            if (searchVO.getName() != null) {
                selectQuery.append(" and name like '%'||?||'%' ");
            }

            if (searchVO.getPriceMin() != 0) {
                selectQuery.append(" and price >= ? ");
            }

            if (searchVO.getPriceMax() != 0) {
                selectQuery.append(" and price <= ? ");
            }

            if (searchVO.getDate() != null) {
                switch (searchVO.getDate()) {
                    case "today":
                        selectQuery.append(" and trunc(input_date) = to_date(sysdate, 'yyyy-mm-dd') ");
                        break;
                    case "week":
                        selectQuery.append(
                                " and input_date >= trunc(to_date('2024-04-20', 'yyyy-mm-dd'), 'IW') and input_date < trunc(to_date('2024-04-20', 'yyyy-mm-dd'), 'IW') + 7 ");
                        break;
                    case "month":
                        selectQuery.append(
                                " and extract(month from input_date) = extract(month from to_date(sysdate, 'yyyy-mm-dd')) and extract(year from input_date) = extract(year from to_date('2024-04-01', 'yyyy-mm-dd'))");
                        break;
                    default:
                }
            }

            System.out.println(selectQuery.toString());

            pstmt = conn.prepareStatement(selectQuery.toString());
            int bindIndex = 0;

            if (searchVO.getCode() != null) {
                pstmt.setString(++bindIndex, searchVO.getCode());
            }

            if (searchVO.getName() != null) {
                pstmt.setString(++bindIndex, searchVO.getName());
            }

            if (searchVO.getPriceMin() != 0) {
                pstmt.setInt(++bindIndex, searchVO.getPriceMin());
            }

            if (searchVO.getPriceMax() != 0) {
                pstmt.setInt(++bindIndex, searchVO.getPriceMax());
            }

            rs = pstmt.executeQuery();

            while (rs.next()) {
                goods.add(
                        new AdminGoodsSimpleVO(rs.getString("code"), rs.getString("name"), rs.getString("default_img"),
                                rs.getDate("input_date"), rs.getInt("price"), rs.getInt("amount")));
            }
        } finally {
            dbConn.closeCon(rs, pstmt, conn);
        }

        return goods;
    }
}
