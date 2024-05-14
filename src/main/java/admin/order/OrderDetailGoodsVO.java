package admin.order;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class OrderDetailGoodsVO {
    private String code;
    private String defaultImage;
    private String name;
    private int price;
    private int deliveryCharge;
    private int amount;
    private String orderStatus;
    private String purchaseStatus;
}
