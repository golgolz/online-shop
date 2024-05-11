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

    public AdminGoodsDetailVO selectOneGoods(String code) throws SQLException {
        AdminGoodsDetailVO adminGoodsDetailVO = null;

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        StringBuilder selectQuery = new StringBuilder();

        DbConnection dbConn = DbConnection.getInstance();

        try {
            conn = dbConn.getConn("online-shop-dbcp");
            selectQuery.append(
                    "select code, name, sold_out_flag, default_img, description, detail_description, model, material, maker, amount, price, delivery_charge from goods");

            if (code != null) {
                selectQuery.append(" where code = ? ");
            }

            pstmt = conn.prepareStatement(selectQuery.toString());

            if (code != null) {
                pstmt.setString(1, code);
            }

            rs = pstmt.executeQuery();
            while (rs.next()) {
                adminGoodsDetailVO = new AdminGoodsDetailVO(rs.getString("code"), rs.getString("name"),
                        rs.getString("sold_out_flag"), rs.getString("default_img"), rs.getString("description"),
                        rs.getString("detail_description"), rs.getString("model"), rs.getString("material"),
                        rs.getString("maker"), rs.getInt("amount"), rs.getInt("price"), rs.getInt("delivery_charge"));
            }
        } finally {
            dbConn.closeCon(rs, pstmt, conn);
        }

        return adminGoodsDetailVO;
    }

    public String createSelectQuery(SearchVO searchVO, boolean isCount) throws SQLException {
        StringBuilder selectQuery = new StringBuilder();
        selectQuery.append(" select ");
        if (isCount) {
            selectQuery.append(" count(*) as count from goods where 1=1 ");
        } else {
            selectQuery
                    .append(" code, name, default_img, input_date, update_date, price, amount from goods where 1=1 ");
        }

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
                    selectQuery.append(" and trunc(input_date) = to_date(sysdate, 'yy-mm-dd') ");
                    break;
                case "week":
                    selectQuery.append(
                            " and input_date >= trunc(to_date(sysdate, 'yy-mm-dd'), 'IW') and input_date < trunc(to_date(sysdate, 'yy-mm-dd'), 'IW') + 7 ");
                    break;
                case "month":
                    selectQuery.append(
                            " and extract(month from input_date) = extract(month from to_date(sysdate, 'yy-mm-dd')) and extract(year from input_date) = extract(year from to_date('2024-04-01', 'yy-mm-dd'))");
                    break;
                default:
            }
        }

        if (searchVO.getUpdateDate() != null) {
            switch (searchVO.getUpdateDate()) {
                case "today":
                    selectQuery.append(" and trunc(update_date) = to_date(sysdate, 'yy-mm-dd') ");
                    break;
                case "week":
                    selectQuery.append(
                            " and update_date >= trunc(to_date(sysdate, 'yy-mm-dd'), 'IW') and update_date < trunc(to_date(sysdate, 'yy-mm-dd'), 'IW') + 7 ");
                    break;
                case "month":
                    selectQuery.append(
                            " and extract(month from update_date) = extract(month from to_date(sysdate, 'yy-mm-dd')) and extract(year from update_date) = extract(year from to_date('2024-04-01', 'yy-mm-dd'))");
                    break;
                default:
            }
        }

        if (searchVO.getSort() != null) {
            switch (searchVO.getSort()) {
                case "price":
                    selectQuery.append(" order by price desc ");
                    break;
                case "input_date":
                    selectQuery.append(" order by input_date desc ");
                    break;
            }
        }

        return selectQuery.toString();
    }

    public int selectGoodsCount(SearchVO searchVO) throws SQLException {
        int count = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String selectQuery = "";

        DbConnection dbConn = DbConnection.getInstance();

        try {
            conn = dbConn.getConn("online-shop-dbcp");
            selectQuery = createSelectQuery(searchVO, true);
            pstmt = conn.prepareStatement(selectQuery);

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

            if (rs.next()) {
                count = rs.getInt("count");
            }
        } finally {
            dbConn.closeCon(rs, pstmt, conn);
        }

        return count;
    }

    public int selectAllGoodsCount(String maker) throws SQLException {
        int count = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        StringBuilder selectQuery = new StringBuilder();

        DbConnection dbConn = DbConnection.getInstance();

        try {
            conn = dbConn.getConn("online-shop-dbcp");
            selectQuery.append("select count(*) as count from goods");

            if (maker != null) {
                selectQuery.append(" where maker=? ");
            }

            pstmt = conn.prepareStatement(selectQuery.toString());

            if (maker != null) {
                pstmt.setString(1, maker);
            }

            rs = pstmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt("count");
            }
        } finally {
            dbConn.closeCon(rs, pstmt, conn);
        }

        return count;
    }

    public List<AdminGoodsSimpleVO> selectGoods(SearchVO searchVO) throws SQLException {
        List<AdminGoodsSimpleVO> goods = new ArrayList<AdminGoodsSimpleVO>();

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String selectQuery = "";

        DbConnection dbConn = DbConnection.getInstance();

        try {
            conn = dbConn.getConn("online-shop-dbcp");

            selectQuery = createSelectQuery(searchVO, false);

            pstmt = conn.prepareStatement(selectQuery);

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
                goods.add(new AdminGoodsSimpleVO(rs.getString("code"), rs.getString("name"),
                        rs.getString("default_img"), rs.getDate("input_date"), rs.getDate("update_date"),
                        rs.getInt("price"), rs.getInt("amount")));
            }
        } finally {
            dbConn.closeCon(rs, pstmt, conn);
        }

        return goods;
    }

    public int updateGoods(AdminGoodsDetailVO adminGoodsDetailVO) throws SQLException {
        int count = 0;

        Connection conn = null;
        PreparedStatement pstmt = null;
        StringBuilder updateQuery = new StringBuilder();

        DbConnection dbConn = DbConnection.getInstance();

        try {
            conn = dbConn.getConn("online-shop-dbcp");
            updateQuery.append("update goods set ").append(
                    "sold_out_flag = ?, default_img = ?, description = ?, detail_description = ?, material = ?, amount = ?, price = ?, delivery_charge = ?, name = ?, input_date = sysdate")
                    .append(" where code = ? ");
            pstmt = conn.prepareStatement(updateQuery.toString());

            pstmt.setString(1, adminGoodsDetailVO.getSoldOutFlag());
            pstmt.setString(2, adminGoodsDetailVO.getDefaultImage());
            pstmt.setString(3, adminGoodsDetailVO.getDetailImage());
            pstmt.setString(4, adminGoodsDetailVO.getDescription());
            pstmt.setString(5, adminGoodsDetailVO.getMaterial());
            pstmt.setInt(6, adminGoodsDetailVO.getAmount());
            pstmt.setInt(7, adminGoodsDetailVO.getPrice());
            pstmt.setInt(8, adminGoodsDetailVO.getDeliveryCharge());
            pstmt.setString(9, adminGoodsDetailVO.getName());
            pstmt.setString(10, adminGoodsDetailVO.getCode());

            count = pstmt.executeUpdate();
        } finally {
            dbConn.closeCon(null, pstmt, conn);
        }

        return count;
    }

    public int updateSoldOut(String code) throws SQLException {
        int count = 0;

        Connection conn = null;
        PreparedStatement pstmt = null;
        StringBuilder updateQuery = new StringBuilder();

        DbConnection dbConn = DbConnection.getInstance();

        try {
            conn = dbConn.getConn("online-shop-dbcp");
            updateQuery.append("update goods set ").append("sold_out_flag = 'T', input_date = sysdate")
                    .append(" where code = ? ");
            pstmt = conn.prepareStatement(updateQuery.toString());

            pstmt.setString(1, code);

            count = pstmt.executeUpdate();
        } finally {
            dbConn.closeCon(null, pstmt, conn);
        }

        return count;
    }

    public int insertGoods(AdminGoodsDetailVO adminGoodsDetailVO) throws SQLException {
        int count = 0;

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        StringBuilder insertQuery = new StringBuilder();

        DbConnection dbConn = DbConnection.getInstance();

        try {
            conn = dbConn.getConn("online-shop-dbcp");
            insertQuery.append(
                    "insert into goods(code, name, amount, sold_out_flag, price, default_img, detail_description, description, delivery_charge, maker, model, material) ")
                    .append("values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            pstmt = conn.prepareStatement(insertQuery.toString());

            pstmt.setString(1, adminGoodsDetailVO.getCode());
            pstmt.setString(2, adminGoodsDetailVO.getName());
            pstmt.setInt(3, adminGoodsDetailVO.getAmount());
            pstmt.setString(4, adminGoodsDetailVO.getSoldOutFlag());
            pstmt.setInt(5, adminGoodsDetailVO.getPrice());
            pstmt.setString(6, adminGoodsDetailVO.getDefaultImage());
            pstmt.setString(7, adminGoodsDetailVO.getDescription());
            pstmt.setString(8, adminGoodsDetailVO.getDetailImage());
            pstmt.setInt(9, adminGoodsDetailVO.getDeliveryCharge());
            pstmt.setString(10, adminGoodsDetailVO.getMaker());
            pstmt.setString(11, adminGoodsDetailVO.getModel());
            pstmt.setString(12, adminGoodsDetailVO.getMaterial());

            pstmt.execute();
        } finally {
            dbConn.closeCon(rs, pstmt, conn);
        }
        return count;
    }
}
