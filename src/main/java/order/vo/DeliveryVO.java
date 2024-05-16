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
public class DeliveryVO {
    private String cartId;
    private String zipcode;
    private String defaultAddr;
    private String detailAddr;
    private String tel;
    private String deliveryMsg;
    private String recipient;

    public DeliveryVO(String zipcode, String defaultAddr, String detailAddr, String tel, String recipient) {
        super();
        this.zipcode = zipcode;
        this.defaultAddr = defaultAddr;
        this.detailAddr = detailAddr;
        this.tel = tel;
        this.recipient = recipient;
    }
}
