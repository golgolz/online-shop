package user.orderReturnSearch;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter

public class ReturnVO {

  private String refundDate;
  private String cartId;
  private String defaultImg;
  private String code;
  private String name;
  private int refundTotalPrice;
  private String refundState;
}
