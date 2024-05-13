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
        int start = ((currentPage - 1) / btnScale) * btnScale + 1;
        int end = start + btnScale - 1;

        if (end > totalPage) {
            end = totalPage;
        }

        btns.append("<ol id='pageContainer'>");

        if (start != 1) {
            btns.append("<li class='pages'>").append("<a href='").append(baseURL).append("&page=").append(start - 1)
                    .append("'");
            btns.append(">").append(" < ").append("</a>").append("</li>");
        }

        while (start <= end) {
            btns.append("<li class='pages'>").append("<a href='").append(baseURL).append("&page=").append(start)
                    .append("'");
            if (currentPage == start) {
                btns.append("class='this'");
            }
            btns.append(">").append(start).append("</a>").append("</li>");
            start++;
        }

        if (end != totalPage) {
            btns.append("<li class='pages'>").append("<a href='").append(baseURL).append("&page=").append(end + 1)
                    .append("'");
            btns.append(">").append(" > ").append("</a>").append("</li>");
        }

        btns.append("</ol>");

        return btns.toString();
    }
}
