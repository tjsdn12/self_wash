package org.sunw.self.admin.common.domain;

import lombok.Data;

@Data
public class ResultDTO {
	boolean isSuccess;
	String message;
	//dto나 vo
	Object data;
}
