package user.wishlist;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
@Builder
public class WishlistVO {
  private int favoriteId;
  private String id, code, defaultImg, name, price, deliveryCharge;
  private Date inputDate;
}
