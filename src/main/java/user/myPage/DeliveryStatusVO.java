package user.myPage;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter

public class DeliveryStatusVO {

  private int readyCount;
  private int progressCount;
  private int doneCount;
}
