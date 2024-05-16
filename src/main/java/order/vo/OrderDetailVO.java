package order.vo;

import java.sql.Date;
import java.util.List;
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
public class OrderDetailVO {
    private String cartId;
    private Date orderDate;
    private List<OrderProductVO> productList;
    private String deliveryStatus;
    private String purchaseStatus;
    private String zipcode;
    private String defaultAddr;
    private String detailAddr;
    private String tel;
    private String deliveryMsg;
    private String recipient;
    private String statusFlag;
}
