package org.sunw.self.admin.customer.qna.domain;

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
public class InquiryVO {
	
		String inquiryId;	
		String mgrId;		
		String qnaTitle;	
		String qnaContents;
		String classification;
		String memId;		
		String replyContent;
		String replyTitle;	
		String dateOfInquiry;
		String answerDate;	
		String answerId;	
		String whetherItIsPrivate;
		
		String memName;
		String mgrName;
		
		
		
	

}
