package org.sunw.self.admin.user.manager.domain;

import org.sunw.self.admin.common.domain.DefaultDTO;

import lombok.Data;

@Data
public class ManageManagerDTO extends DefaultDTO {
	ManageManagerVO manageManagerVO;
	
	String mgrId;
	
	String mgrName;
	
}
