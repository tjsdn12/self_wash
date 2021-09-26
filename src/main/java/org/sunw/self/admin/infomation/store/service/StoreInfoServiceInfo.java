package org.sunw.self.admin.infomation.store.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.sunw.self.admin.infomation.store.domain.StoreInfoDTO;
import org.sunw.self.admin.infomation.store.domain.StoreInfoVO;
import org.sunw.self.admin.infomation.store.mapper.StoreInfoMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StoreInfoServiceInfo implements StoreInfoService {
	
	private final StoreInfoMapper storeInfoMapper;
	
	@Override
	public int insert(StoreInfoDTO storeInfoDTO) {
		
		return storeInfoMapper.insert(storeInfoDTO.getStoreInfoVO());
	}

	@Override
	public List<StoreInfoVO> getAllStoreInfoList(StoreInfoDTO storeInfoDTO) {
		List<StoreInfoVO> list = storeInfoMapper.getAllStoreInfoList(storeInfoDTO);
		return list;
	}

	@Override
	public int getStoreInfoCnt(StoreInfoDTO storeInfoDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public StoreInfoDTO getOneStoreInfo(String sId) {
		StoreInfoDTO storeInfoDTO = new StoreInfoDTO();
		storeInfoDTO.setStoreInfoVO(storeInfoMapper.getOneStoreInfo(sId));
		return storeInfoDTO;
		
	}

	@Override
	public int update(StoreInfoDTO storeInfoDTO) {
		
		return storeInfoMapper.update(storeInfoDTO.getStoreInfoVO());
		//return storeInfoMapper.update(toStoreInfoVO(storeInfoDTO));
	}

	@Override
	public int delete(String sId) {
		
		return storeInfoMapper.delete(sId);
	}

}
