package org.sunw.self.admin.customer.qna.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.sunw.self.admin.customer.qna.domain.InquiryDTO;
import org.sunw.self.admin.customer.qna.domain.InquiryVO;

public interface InquiryMapper {
	
	public int insert(InquiryVO inquiryVO);
	
	public List<InquiryVO>getAllInquiryList(InquiryDTO inquiryDTO);
	
	public int getInquiryCnt(InquiryDTO inquiryDTO);
	
	InquiryVO getOneInquiry(@Param("inquiryId")String inquiryId);
	
	public int getInquirystatusCnt();
	
	public int update(InquiryVO inquiryVO);
	
	public int delete(String inquiryId);

}
