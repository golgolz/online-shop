package user.order;

public class CartDAO {
    private static CartDAO cDAO;

    private CartDAO() {}

    public static CartDAO getInstance() {
        if (cDAO == null) {
            cDAO = new CartDAO();
        }
        return cDAO;
    }// getInstance
}
