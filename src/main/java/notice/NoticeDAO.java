package notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import database.DbConnection;

public class NoticeDAO {
    public static NoticeDAO noticeDAO;

    private NoticeDAO() {}

    public static NoticeDAO getInstance() {
        if (noticeDAO == null) {
            noticeDAO = new NoticeDAO();
        }
        return noticeDAO;
    }// getInstance

    // 조회수
    public int SelectTotalCount(NoticeVO nVO) throws SQLException {
        int totalCnt = 0;

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        DbConnection dbConn = DbConnection.getInstance();

        try {
            con = dbConn.getConn("online-shop-dbcp");

            StringBuilder selectCnt = new StringBuilder();
            selectCnt.append("select count(*) view_count from notice");

            pstmt = con.prepareStatement(selectCnt.toString());
            rs = pstmt.executeQuery();
            if (rs.next()) {
                totalCnt = rs.getInt("view_count");
            } // end if
        } finally {
            dbConn.closeCon(rs, pstmt, con);
        }
        return totalCnt;
    }// SelectTotalCount

    // 공지사할 조회
    public List<NoticeVO> selectNotice(NoticeVO nVO) throws SQLException {
        List<NoticeVO> list = new ArrayList<NoticeVO>();

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        DbConnection dbConn = DbConnection.getInstance();
        try {
            con = dbConn.getConn("online-shop-dbcp");
            StringBuilder selectNotice = new StringBuilder();
            selectNotice.append("select notice_id, input_date, author, view_count, title, content ")
                    .append("from (select notice_id, input_date, author, view_count, title, content,")
                    .append("row_number() over (order by input_date desc) as rnum from notice)")
                    .append("where rnum between ? and ?");
            pstmt = con.prepareStatement(selectNotice.toString());

            // pstmt.setInt(1, nVO.getStartNum());
            // pstmt.setInt(2, nVO.getEndNum());

            rs = pstmt.executeQuery();
            // NoticeVO nVO = null;
            while (rs.next()) {
                // String, date, string, int, string,string
                // nVO = new NoticeVO(rs.getString("notice_id"), rs.getString("title"), rs.getString("author"),
                // rs.getDate("input_date"), rs.getInt("view_count"), "");
                // nVO = new NoticeVO(rs.getString("notice_id"), rs.getDate("input_date"), rs.getString("author"),
                // rs.getInt("view_count"), rs.getString("title"), "");
                // notice_id String이어도 ㄱㅊ은지??
                list.add(nVO);
            } // end while

        } finally {
            dbConn.closeCon(rs, pstmt, con);
        }
        return list;
    }// selectNotice

    public void insertNotice(NoticeVO nVO) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        DbConnection dbConn = DbConnection.getInstance();
        try {
            String insertNotice = " insert into notice (notice_id, input_date, author, view_count, title, content)\r\n"
                    + "values (? ,? ,? ,? ,? ,?) ";
            pstmt.setString(1, nVO.getNotice_id());
            pstmt.setDate(2, nVO.getInput_date());
            pstmt.setString(3, nVO.getAuthor());
            pstmt.setInt(4, nVO.getView_count());
            pstmt.setString(5, nVO.getTitle());
            pstmt.setString(6, nVO.getContent());

            pstmt.executeUpdate();
        } finally {
            dbConn.closeCon(rs, pstmt, con);
        }
    }// insertNotice

    public void updateNotice(NoticeVO nVO) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        DbConnection dbConn = DbConnection.getInstance();

        try {
            StringBuilder updateNotice = new StringBuilder();
            updateNotice.append("update notice").append("set  title=?, content=?").append("where notice_id=?");

            pstmt = con.prepareStatement(updateNotice.toString());

            pstmt.setString(1, nVO.getNotice_id());
            pstmt.setDate(2, nVO.getInput_date());
            pstmt.setString(3, nVO.getAuthor());
            pstmt.setInt(4, nVO.getView_count());
            pstmt.setString(5, nVO.getTitle());
            pstmt.setString(6, nVO.getContent());

            pstmt.executeUpdate();
        } finally {
            dbConn.closeCon(rs, pstmt, con);
        } // end finally

    }// updateNotice

    public boolean deleteNotice(String noticeId) throws SQLException {
        int cnt = 0;
        DbConnection dbConn = DbConnection.getInstance();

        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            String deleteNotice = "delete from notice where notice_id=?";
            pstmt = con.prepareStatement(deleteNotice);
            cnt = pstmt.executeUpdate();

            if (cnt == 1) {
                return true;
            }
            return false;
        } finally {
            dbConn.closeCon(null, pstmt, con);
        }
    }// deleteNotice

}// class
