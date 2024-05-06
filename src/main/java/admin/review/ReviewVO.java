package admin.review;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

@AllArgsConstructor
@Builder
@Getter
public class ReviewVO {

  private int reviewId;
  private String id, cartId, title, content, code, removeFlag, defaultImg, name;
  private Date inputDate;

}
