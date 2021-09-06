package org.sunw.self.admin.infomation.store.service;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.sunw.self.admin.infomation.store.domain.StoreInfoDTO;
import org.sunw.self.admin.infomation.store.domain.StoreInfoVO;

public interface StoreInfoService {
	
	public int insert(StoreInfoDTO storeInfoDTO);
	
	public List<StoreInfoVO>getAllStoreInfoList(StoreInfoDTO storeInfoDTO);

	public int getStoreInfoCnt(StoreInfoDTO storeInfoDTO);

	StoreInfoDTO getOneStoreInfo(String sId);
	
	public int update(StoreInfoDTO storeInfoDTO);
	
	public int delete(String sId);
	
	
}
