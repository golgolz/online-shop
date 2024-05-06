package admin.order;

public class AdminReturnDAO {
    private static AdminReturnDAO arDAO;

    private AdminReturnDAO() {}

    public static AdminReturnDAO getInstance() {
        if (arDAO == null) {
            arDAO = new AdminReturnDAO();
        }
        return arDAO;
    }// getInstance
}
