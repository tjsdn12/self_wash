package org.sunw.self.admin.user.user.domain;

import com.google.protobuf.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
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
	String name;
	String phone;
	String kakaoAuthorizationKey;
	String pw;
	String memStatus;
	String joinDate;
	Long amountCharge;
	Integer point;
	String dateOfUse;
	
	

}
