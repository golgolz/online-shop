package order.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@AllArgsConstructor
@ToString
public class OrderProductVO {
    private int orderGoodsId;
    private String productImg;
    private String productName;
    private String code;
    private int price;
    private int quantity;
    private int delivertyFee;
    private int total;

    private String cartId;

    public OrderProductVO(String cartId, String code, int quantity) {
        super();
        this.cartId = cartId;
        this.code = code;
        this.quantity = quantity;
    }

    public OrderProductVO(String productImg, String productName, String code, int price, int delivertyFee) {
        super();
        this.productImg = productImg;
        this.productName = productName;
        this.code = code;
        this.price = price;
        this.delivertyFee = delivertyFee;
    }


}
