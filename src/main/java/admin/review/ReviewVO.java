package admin.review;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
public class ReviewVO {

  private int reviewId;
  private String id, cartId, title, content, code, removeFlag, defaultImg, name;
  private Date inputDate;

}
