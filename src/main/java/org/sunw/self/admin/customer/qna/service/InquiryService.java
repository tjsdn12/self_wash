package org.sunw.self.admin.customer.qna.service;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.sunw.self.admin.customer.qna.domain.InquiryDTO;
import org.sunw.self.admin.customer.qna.domain.InquiryVO;
import org.sunw.self.admin.user.manager.domain.ManageManagerVO;
import org.sunw.self.admin.user.user.domain.ManageUserVO;

public interface InquiryService {
	
	public int insert(InquiryDTO inquiryDTO);
	
	public List<InquiryVO>getAllInquiryList(InquiryDTO inquiryDTO);
	
	public int getInquiryCnt(InquiryDTO inquiryDTO);
	
	InquiryDTO getOneInquiry(String inquiryId);
	
	public int update(InquiryDTO inquiryDTO);
	
	public int delete(String inquiryId);
	
	public List<ManageUserVO> getUserList();
	
	public List<ManageManagerVO> getManagerList();
}
