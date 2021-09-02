package org.sunw.self.admin.customer.qna.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.sunw.self.admin.customer.qna.domain.InquiryDTO;
import org.sunw.self.admin.customer.qna.domain.InquiryVO;
import org.sunw.self.admin.customer.qna.mapper.InquiryMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class InquiryServiceImpl implements InquiryService {
	
	private final InquiryMapper inquiryMapper;

	@Override
	public int insert(InquiryDTO inquiryDTO) {
		return inquiryMapper.insert(inquiryDTO.getInquiryVO());
	}

	@Override
	public List<InquiryVO> getAllInquiryList(InquiryDTO inquiryDTO) {
		List<InquiryVO> list = inquiryMapper.getAllInquiryList(inquiryDTO);
		return list;
	}

	@Override
	public int getInquiryCnt(InquiryDTO inquiryDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public InquiryDTO getOneInquiry(String inquiryId) {
		
		return toInquiryDTO(inquiryMapper.getOneInquiry(inquiryId));
	}

	@Override
	public int update(InquiryDTO inquiryDTO) {
		
		return inquiryMapper.update(toInquiryVO(inquiryDTO));
	}

	@Override
	public int delete(String inquiryId) {
		
		return inquiryMapper.delete(inquiryId);
	}
	
	

}
