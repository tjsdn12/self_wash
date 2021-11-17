<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
			<form class="form-horizontal" id="actionForm">
					<!-- 페이지1 -->
					<div class="step-1">
						<div class="list-responsive">
							<table class="table">
								<thead class="thead-light">
									<tr>
										<th><label class="customcheckbox mb-3"> <input
												type="checkbox" id="mainCheckbox" onclick="checkAll()" /> <span class="checkmark"></span>
										</label></th>
										<th scope="col">주문메뉴 번호</th>
										<th scope="col">상품가격</th>
										<th scope="col">장비번호</th>
										<th scope="col">메뉴명</th>
										<th scope="col">세제 사용 여부</th>
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
											<td>${item2.weight }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
			</form>
			<script>
				function checkAll() {
					$('#mainCheckbox').click(() => {
						$('.listCheckbox').prop('checked',$('#mainCheckbox').prop('checked'));
					});
				}
			</script>