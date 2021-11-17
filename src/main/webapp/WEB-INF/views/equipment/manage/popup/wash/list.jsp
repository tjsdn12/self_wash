<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
			<div class="list-responsive">
				<table class="table">
					<thead class="thead-light">
						<tr>
							<th><label class="customcheckbox mb-3"> <input
									type="checkbox" id="mainCheckbox" /> <span class="checkmark"></span>
							</label></th>
							<th scope="col">장비관리번호</th>
							<th scope="col">장비명</th>
							<th scope="col">용량</th>
							<th scope="col">장비 유형</th>
							<th scope="col">제조회사 이름</th>
						</tr>
					</thead>

					<tbody class="customtable">
						<c:forEach items="${getAllEquipmentModelList }" var="item2">
							<tr>
								<td><label class="customcheckbox"> <input
										type="checkbox" class="listCheckbox" value="${item2.equipmentModelId }" />
										<span class="checkmark"></span>
								</label></td>
								<td><a href="#" onclick="goSelect(this)">${item2.equipmentModelId }</a></td>
								<td>${item2.equipmentName }</td>
								<td>${item2.capacityGbName }</td>
								<td>${item2.equipmentTypeName }</td>
								<td>${item2.manufacturingCompany }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>