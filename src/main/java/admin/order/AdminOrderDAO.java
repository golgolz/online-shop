package admin.order;

public class AdminOrderDAO {
    private static AdminOrderDAO aoDAO;

    private AdminOrderDAO() {}

    public static AdminOrderDAO getInstance() {
        if (aoDAO == null) {
            aoDAO = new AdminOrderDAO();
        }
        return aoDAO;
    }// getInstance
}
