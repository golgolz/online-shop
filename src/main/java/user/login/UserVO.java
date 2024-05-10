package user.login;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class UserVO {

  private String id;
  private String password;
  private String name;
  private String tel;
  private String email;
  private Date inputDate;
  private String adminMemo;
  private String zipcode;
  private String defaultAddr;
  private String additionalAddr;
  private String withdrawalFlag;
  private String accessLimitFlag;

}
