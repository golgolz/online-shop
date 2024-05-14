package user.orderReturnSearch;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter

public class OrderVO {

  private String id;
  private Date inputDate;
  private String cartId;
  private String defaultImg;
  private String code;
  private String name;
  private int productAmount;
  private int totalPrice;
  private String purchaseState;
  private String orderFlag;
  private String deliveryState;
}
