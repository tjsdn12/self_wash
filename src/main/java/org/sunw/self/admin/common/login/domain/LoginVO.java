package org.sunw.self.admin.common.login.domain;

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
public class LoginVO {

	String mgrId;
	String pw;
	String mgrName;
	String authorLevel;
	String phone;
	String email;
	String approvalStatus;
	String sId;
	String sName;
	public void setsId(String sId) {
		this.sId = sId;
	}
	public String getsId() {
		return this.sId;
	}
	public void setsName(String sName) {
		this.sName=sName;
	}
	public String getsName() {
		return this.sName;
	}
}
