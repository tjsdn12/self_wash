package org.sunw.self.admin.infomation.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.sunw.self.admin.infomation.store.domain.StoreInfoDTO;
import org.sunw.self.admin.infomation.store.domain.StoreInfoVO;

public interface StoreInfoMapper {
	
	public int insert(StoreInfoVO storeInfoVO);
	
	public List<StoreInfoVO> getAllStoreInfoList(StoreInfoDTO storeInfoDTO);
	
	public int getStoreInfoCnt(StoreInfoDTO storeInfoDTO);
	
	StoreInfoVO getOneStoreInfo(@Param("sId")String sId);
	
	public int getStoreStatueCnt();
	
	public int update(StoreInfoVO storeInfoVO);
	
	public int delete(String sId);

}
