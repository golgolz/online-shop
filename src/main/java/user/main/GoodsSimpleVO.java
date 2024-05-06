package user.main;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class GoodsSimpleVO {
    private String code;
    private String name;
    private String defaultImage;
    private String detailDescription;
    private int soldCount;
    private int reviewCount;
    private int likeCount;
    private int price;
    private Date inputDate;
}
