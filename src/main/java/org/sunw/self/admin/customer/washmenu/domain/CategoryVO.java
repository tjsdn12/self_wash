package org.sunw.self.admin.customer.washmenu.domain;

import java.util.HashMap;
import java.util.Map;

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
public class CategoryVO {
	
	String categoryId;
	String largeCategory;
	String largeCategoryName;
	String middleCategory;
	String middleCategoryName;
	String smallCategory;
	String smallCategoryName;
	String usageStatus;
	String categoryDesc;
}
