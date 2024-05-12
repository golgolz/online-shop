package admin.order;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class OrderDetailInfoVO {
    private String cartId;
    private String customerId;
    private String inputDate;
    private int purchaseAmount;
    private String receiver;
    private String receiverTel;
    private String zipcode;
    private String defaultAddr;
    private String additionalAddr;
    private String request;
}
