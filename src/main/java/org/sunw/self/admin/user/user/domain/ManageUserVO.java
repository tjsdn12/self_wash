package org.sunw.self.admin.user.user.domain;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class ManageUserVO {
	
	String memId;
	String memName;
	String phone;
	String kakaoAuthorizationKey;
	String pw;
	String memStatus;
	String joinDate;
	Long amountCharge;
	Integer point;
	String dateOfUse;
	
	

}
