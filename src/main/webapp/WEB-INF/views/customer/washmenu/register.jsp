<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/includes/header.jsp"%>
<div class="row">
	<div class="col-md-6">
		<div class="card">
			<form class="form-horizontal" id="actionForm">
				<div class="card-body">
					<h4 class="card-title">WashMenuRegisterPage</h4>
					<div class="form-group row">
						<label for="washMenuId"
							class="col-sm-3 text-end control-label col-form-label">주문메뉴 번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="washMenuId" id="washMenuId"
								value="<c:out value='${washMenuVO.washMenuId }'></c:out>" readonly="readonly">
						</div>
					</div>
					<div class="form-group row">
						<label for="menuPrice"
							class="col-sm-3 text-end control-label col-form-label">상품가격</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="menuPrice" id="menuPrice"
								value="<c:out value='${washMenuVO.menuPrice }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="equipmentModelId"
							class="col-sm-3 text-end control-label col-form-label">장비명</label>
						<div class="col-sm-9">
								<select name="equipmentModelId" id="equipmentModelId" >
	 						<option>::: 장비 선택하기 :::</option>
								<c:forEach items="${getEquipmentModelList }" var="item2">
									<option value="${item2.equipmentModelId }">${item2.equipmentName }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label for="menuName"
							class="col-sm-3 text-end control-label col-form-label">메뉴명</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="menuName" name="menuName"
								value="<c:out value='${washMenuVO.menuName }'></c:out>">
						</div>
					</div>
				<div class="form-group row">
					<label for="detergentUseAt"
						class="col-sm-3 text-end control-label col-form-label">세제사용 여부</label>
					<div class="col-sm-9">
						<select name="detergentUseAt" id="detergentUseAt">
							<option value="using" <c:if test="${washMenuVO.detergentUseAt == 'using'}">selected="selected"</c:if>>세제사용o</option>
							<option value="notUsed" <c:if test="${washMenuVO.detergentUseAt == 'notUsed'}">selected="selected"</c:if>>세제사용x</option>
						</select>
					</div>
				</div>
				<div class="border-top">
					<div class="card-body">
						<button type="button" id="modifyBtn" class="btn btn-primary" onclick="save()">저장</button>
						<button type="button" id="cancelBtn" class="btn btn-primary"
							onclick="goList()">취소</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/includes/modal.jsp"%>
<%@include file="/WEB-INF/views/includes/footer.jsp"%>
<script>
	function save() {
		const data = $('#actionForm').serializeObject();
		$.ajax({
			url : '/customer/washmenu/register',
			type : 'PUT',
			//응답 받고 
			headers : { // Http header
				// 요청 보낼때 내가 보낼 data의 타입
				"Content-Type" : "application/json",
			},
			//
			dataType : 'JSON', // 데이터 타입 (html, xml, json, text 등등)
			data : JSON.stringify({washMenuVO: data}),
			success : function onData(data) {
				alert(data.message);
				if(data.success) {
					location.href = '/customer/washmenu/list';
				}
			},
			error : function onError(error) {
				console.log("AA");
				console.error(error);
			}
		});
	}
	
	function goList() {
		const form = document.querySelector("#actionForm");
		form.action = "/customer/washmenu/list";
		form.method = "get";
		form.innerHTML = "";
		form.submit();
	}

	document
			.querySelector("#modifyBtn")
			.addEventListener(
					"click",
					function(e) {
						const form = document.querySelector("#actionForm");
						form.action = "/customer/washmenu/register";
						document.querySelector("#actionForm").submit();
					});


	
</script>