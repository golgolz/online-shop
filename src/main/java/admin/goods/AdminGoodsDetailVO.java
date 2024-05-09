package admin.goods;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class AdminGoodsDetailVO {
    private String code;
    private String name;
    private String soldOutFlag;
    private String defaultImage;
    private String detailImage;
    private String description;
    private String model;
    private String material;
    private String maker;
    private int amount;
    private int price;
    private int deliveryCharge;
}
