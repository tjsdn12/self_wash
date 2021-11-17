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
							<th scope="col">주문메뉴 번호</th>
							<th scope="col">상품가격</th>
							<th scope="col">장비번호</th>
							<th scope="col">메뉴명</th>
							<th scope="col">삭제
							</th>
						</tr>
					</thead>

					<tbody class="customtable">
						<c:forEach items="${getAllWashMenuList }" var="item2">
							<tr>
								<td><label class="customcheckbox"> <input
										type="checkbox" class="listCheckbox" value="${item2.washMenuId }" />
										<span class="checkmark"></span>
								</label></td>
								<td><a href="#" onclick="goSelect(this)">${item2.washMenuId }</a></td>
								<td>${item2.menuPrice }</td>
								<td>${item2.equipmentModelId }</td>
								<td>${item2.menuName }</td>
								<td>
									<div class="card-body">
										<button type="button" id="modifyBtn" class="btn btn-primary" onclick="deleteWashMenuMapping(<c:out value='${item2.menuEquipmentMappingId }'/>)">삭제</button>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>