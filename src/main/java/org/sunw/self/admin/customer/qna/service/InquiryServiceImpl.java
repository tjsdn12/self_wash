package org.sunw.self.admin.customer.qna.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.sunw.self.admin.customer.qna.domain.InquiryDTO;
import org.sunw.self.admin.customer.qna.domain.InquiryVO;
import org.sunw.self.admin.customer.qna.mapper.InquiryMapper;
import org.sunw.self.admin.user.manager.domain.ManageManagerVO;
import org.sunw.self.admin.user.manager.mapper.ManageManagerMapper;
import org.sunw.self.admin.user.user.domain.ManageUserVO;

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
		InquiryDTO inquiryDTO =new InquiryDTO();
		inquiryDTO.setInquiryVO(inquiryMapper.getOneInquiry(inquiryId));
		return inquiryDTO;
	}

	@Override
	public int update(InquiryDTO inquiryDTO) {
		
		return inquiryMapper.update(inquiryDTO.getInquiryVO());
	}

	@Override
	public int delete(String inquiryId) {
		
		return inquiryMapper.delete(inquiryId);
	}


	@Override
	public List<ManageUserVO> getUserList() {
		List<ManageUserVO>list = inquiryMapper.getUserList();
		return list;
	}

	@Override
	public List<ManageManagerVO> getManagerList() {
		List<ManageManagerVO>list = inquiryMapper.getManagerList();
		return list;
	}

	

}
