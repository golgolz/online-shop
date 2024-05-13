package util;

import java.util.Enumeration;
import javax.servlet.http.HttpServletRequest;

public class PageController {
    private static PageController pageController;

    private PageController() {}

    public static PageController getInstance() {
        if (pageController == null) {
            pageController = new PageController();
        }

        return pageController;
    }

    public String createQueryStr(HttpServletRequest request) {
        Enumeration<String> reqParams = request.getParameterNames();
        StringBuilder queryStr = new StringBuilder();
        String name = "";

        while (reqParams.hasMoreElements()) {
            name = (String) reqParams.nextElement();
            if (!name.equals("page")) {
                queryStr.append(name).append("=").append(request.getParameter(name)).append("&");
            }
        }

        if (queryStr.length() != 0) {
            queryStr.insert(0, "?");
            queryStr.deleteCharAt(queryStr.length() - 1);
        }

        return queryStr.toString();
    }

    public String createPagingBtns(String baseURL, int currentPage, int totalPage) {
        StringBuilder btns = new StringBuilder();
        int btnScale = 3;
        int start = currentPage;
        int end = 0;

        if (totalPage >= currentPage + btnScale) {
            end = currentPage + btnScale - 1;
        } else {
            end = totalPage;
        }

        while (start <= end) {
            btns.append("[<a href='").append(baseURL).append("&page=").append(start).append("'>").append(start)
                    .append("</a>]");
            start++;
        }

        return btns.toString();
    }
}
