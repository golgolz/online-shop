package user.order;

public class UserReturnDAO {
    private static UserReturnDAO urDAO;

    private UserReturnDAO() {}

    public static UserReturnDAO getInstance() {
        if (urDAO == null) {
            urDAO = new UserReturnDAO();
        }
        return urDAO;
    }
}
