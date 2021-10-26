package org.sunw.self.admin.customer.qna.domain;

import org.sunw.self.admin.common.domain.DefaultDTO;

import lombok.Data;

@Data
public class InquiryDTO extends DefaultDTO {

	InquiryVO inquiryVO;
	
	String inquiryId;
	
	String qnaTitle;
}
