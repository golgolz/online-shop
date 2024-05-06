package user.order;

public class UserOrderDAO {
    private static UserOrderDAO uoDAO;

    private UserOrderDAO() {}

    public static UserOrderDAO getInstance() {
        if (uoDAO == null) {
            uoDAO = new UserOrderDAO();
        }
        return uoDAO;
    }// getInstance
}
