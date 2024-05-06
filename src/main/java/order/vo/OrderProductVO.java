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
    private String productName;
    private String productImg;
    private String productExplanation;
    private int quantity;
    private int price;
    private int delivertyFee;

    private String cartId;
    private String code;

    public OrderProductVO(String cartId, String code, int quantity) {
        super();
        this.cartId = cartId;
        this.code = code;
        this.quantity = quantity;
    }

}
