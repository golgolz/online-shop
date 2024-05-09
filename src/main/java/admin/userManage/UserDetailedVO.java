package admin.userManage;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter

public class UserDetailedVO {
  private String name;
  private String id;
  private String email;
  private String tel;
  private String zipcode;
  private String defaultAddr;
  private String additionalAddr;
  private String inputDate;
  private String accessLimitFlag;
  private String adminMemo;
  private String totalPriceRecode;
}
