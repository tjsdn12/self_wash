<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/includes/header.jsp"%>
<div class="row">
	<div class="col-md-6">
		<div class="card">
			<form class="form-horizontal" id="actionForm">
				<div class="card-body">
					<h4 class="card-title">EquipmentModelFormPage</h4>
					<div class="form-group row">
						<label for="equipmentModelId"
							class="col-sm-3 text-end control-label col-form-label">장비관리번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="equipmentModelId" name="equipmentModelId"
								value="<c:out value='${equipmentModelVO.equipmentModelId }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="equipmentName"
							class="col-sm-3 text-end control-label col-form-label">장비명</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="equipmentName" name="equipmentName"
								placeholder="<c:out value='${equipmentModelVO.equipmentName }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="manufacturingCompany"
							class="col-sm-3 text-end control-label col-form-label">제조회사이름</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="manufacturingCompany" name="manufacturingCompany"
								placeholder="<c:out value='${equipmentModelVO.manufacturingCompany }'></c:out>">
						</div>
					</div>
				<div class="form-group row">
					<label for="categoryId"
						class="col-sm-3 text-end control-label col-form-label">제조회사 전화번호</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="categoryId" name="categoryId"
							placeholder="<c:out value='${equipmentModelVO.categoryId }'></c:out>">
					</div>
				</div>
				<div class="form-group row">
					<label for="categoryId"
						class="col-sm-3 text-end control-label col-form-label">카테고리 번호</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="categoryId" name="categoryId"
							placeholder="<c:out value='${equipmentModelVO.categoryId }'></c:out>">
					</div>
				</div>
				<div class="form-group row">
					<label for="repairer"
						class="col-sm-3 text-end control-label col-form-label">수리처</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="repairer" name="repairer"
							placeholder="<c:out value='${equipmentModelVO.repairer }'></c:out>">
					</div>
				</div>
					<div class="form-group row">
					<label for="repairerNumber"
						class="col-sm-3 text-end control-label col-form-label">수리처 전화번호</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="repairerNumber" name="repairerNumber"
							placeholder="<c:out value='${equipmentModelVO.repairerNumber }'></c:out>">
					</div>
				</div>
				<div class="form-group row">
					<label for="exposureYesNo"
						class="col-sm-3 text-end control-label col-form-label">소비자 노출여부</label>
					<div class="col-sm-9">
						<select name="exposureYesNo" id="exposureYesNo">
							<option value="1" selected="selected">노출</option>
							<option value="0" selected="selected">비노출</option>
						</select>
					</div>
				</div>
				<div class="form-group row">
					<label for="equipmentPhoto"
						class="col-sm-3 text-end control-label col-form-label">장비사진</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="equipmentPhoto" name="equipmentPhoto"
							placeholder="<c:out value='${EquipmentModelDTO.equipmentPhoto }'></c:out>">
					</div>
				</div>
					<div class="form-group row">
					<label for="equipmentSpec"
						class="col-sm-3 text-end control-label col-form-label">장비스펙</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="equipmentSpec" name="equipmentSpec"
							placeholder="<c:out value='${EquipmentModelDTO.equipmentSpec }'></c:out>">
					</div>
				</div>
				<div class="border-top">
					<div class="card-body">
						<button type="button" id="modifyBtn" class="btn btn-primary" onclick="save()">저장</button>
						<button type="button" id="cancelBtn" class="btn btn-primary"
							onclick="goLists()">취소</button>
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
			url : '/equipment/model/form',
			type : 'PUT',
			//응답 받고 
			headers : { // Http header
				// 요청 보낼때 내가 보낼 data의 타입
				"Content-Type" : "application/json",
			},
			//
			dataType : 'JSON', // 데이터 타입 (html, xml, json, text 등등)
			data : JSON.stringify({equipmentModelVO: data}),
			success : function onData(data) {
				alert(data.message);
				if(data.success) {
					location.href = '/equipment/model/list';
				}
			},
			error : function onError(error) {
				console.log("AA");
				console.error(error);
			}
		});
	}
	
</script>