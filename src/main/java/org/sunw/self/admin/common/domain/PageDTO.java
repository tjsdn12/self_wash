package org.sunw.self.admin.common.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PageDTO {
	@Builder.Default
	private int page =1;
	@Builder.Default
	private int perSheet = 10;
	
	private String type; //t,tc,tcw
	
	private String keyword;
	
	public int getSkip() {
		return (page -1) * perSheet;
	}
	
	public String[] getArr() {
		if(keyword == null || keyword.trim().length() == 0) {
			return null;
		}
		if(type == null ) {
			return null;
		}
		return type.split("");
	}
}
