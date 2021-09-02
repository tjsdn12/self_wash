package org.sunw.self.admin.customer.qna.service;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.sunw.self.admin.customer.qna.domain.InquiryDTO;
import org.sunw.self.admin.customer.qna.domain.InquiryVO;

public interface InquiryService {
	
	public int insert(InquiryDTO inquiryDTO);
	
	public List<InquiryVO>getAllInquiryList(InquiryDTO inquiryDTO);
	
	public int getInquiryCnt(InquiryDTO inquiryDTO);
	
	InquiryDTO getOneInquiry(String inquiryId);
	
	public int update(InquiryDTO inquiryDTO);
	
	public int delete(String inquiryId);

	default InquiryDTO toInquiryDTO(InquiryVO inquiryVO) {
		InquiryDTO inquiryDTO= new InquiryDTO();
		BeanUtils.copyProperties(inquiryDTO,inquiryVO);
		return inquiryDTO;
	}
	default InquiryVO toInquiryVO(InquiryDTO inquiryDTO) {
		InquiryVO inquiryVO =new InquiryVO();
		BeanUtils.copyProperties(inquiryVO, inquiryDTO);
		return inquiryVO;
	}

}
