package user.favorite;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class FavoriteVO {
  private int favoriteId;
  private String id, code;
  private Date inputDate;
}
