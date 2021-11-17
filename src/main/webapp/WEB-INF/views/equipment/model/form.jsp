<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/includes/header.jsp"%>
<div class="row">
	<div class="col-md-6">
		<div class="card">
			<form class="form-horizontal" id="actionForm" enctype="multipart/form-data">
				<div class="card-body">
					<h4 class="card-title">EquipmentModelFormPage</h4>
					<div class="form-group row">
						<label for="equipmentModelId"
							class="col-sm-3 text-end control-label col-form-label">장비관리번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="equipmentModelId" name="equipmentModelId" readonly="readonly"
								value="<c:out value='${equipmentModelVO.equipmentModelId }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="equipmentName"
							class="col-sm-3 text-end control-label col-form-label">장비명</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="equipmentName" name="equipmentName"
								value="<c:out value='${equipmentModelVO.equipmentName }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="manufacturingCompany"
							class="col-sm-3 text-end control-label col-form-label">제조회사이름</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="manufacturingCompany" name="manufacturingCompany"
								value="<c:out value='${equipmentModelVO.manufacturingCompany }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="manufacturerNumber"
							class="col-sm-3 text-end control-label col-form-label">제조회사 전화번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="manufacturerNumber" name="manufacturerNumber"
								value="<c:out value='${equipmentModelVO.manufacturerNumber }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="categoryId"
							class="col-sm-3 text-end control-label col-form-label">카테고리 번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="categoryId" name="categoryId"
								value="<c:out value='${equipmentModelVO.categoryId }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="repairer"
							class="col-sm-3 text-end control-label col-form-label">수리처</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="repairer" name="repairer"
								value="<c:out value='${equipmentModelVO.repairer }'></c:out>">
						</div>
					</div>
						<div class="form-group row">
						<label for="repairerNumber"
							class="col-sm-3 text-end control-label col-form-label">수리처 전화번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="repairerNumber" name="repairerNumber"
								value="<c:out value='${equipmentModelVO.repairerNumber }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="equipmentPhoto"
							class="col-sm-3 text-end control-label col-form-label">장비사진</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="equipmentPhoto" name="equipmentPhoto" readonly="readonly"
								value="<c:out value='${equipmentModelVO.equipmentPhoto }'></c:out>">
							<input type="file" id="equipmentPhotoFile" name="equipmentPhotoFile"  accept=".gif, .jpg, .png">
						</div>
					</div>
					<div class="form-group row">
						<label for="equipmentSpec"
							class="col-sm-3 text-end control-label col-form-label">장비스펙</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="equipmentSpec" name="equipmentSpec"
								value="<c:out value='${equipmentModelVO.equipmentSpec }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="capacityGb"
							class="col-sm-3 text-end control-label col-form-label">용량</label>
						<div class="col-sm-9">
							<select name="capacityGb" id="capacityGb">
								<option value="1" <c:if test="${equipmentModelVO.capacityGb == '1'}">selected="selected"</c:if>>기본(13kg)</option>
								<option value="2" <c:if test="${equipmentModelVO.capacityGb == '2'}">selected="selected"</c:if>>대량(18kg)</option>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label for="equipmentType"
							class="col-sm-3 text-end control-label col-form-label">장비 유형</label>
						<div class="col-sm-9">
							<select name="equipmentType" id="equipmentType">
								<option value="1" <c:if test="${equipmentModelVO.equipmentType == '1'}">selected="selected"</c:if>>세탁기</option>
								<option value="2" <c:if test="${equipmentModelVO.equipmentType == '2'}">selected="selected"</c:if>>건조기</option>
								<option value="3" <c:if test="${equipmentModelVO.equipmentType == '3'}">selected="selected"</c:if>>신발세탁기</option>
								<option value="4" <c:if test="${equipmentModelVO.equipmentType == '4'}">selected="selected"</c:if>>세탁건조기</option>
							</select>
						</div>
					</div>
					<div class="border-top">
						<div class="card-body">
							<button type="button" id="modifyBtn" class="btn btn-primary" onclick="check()">저장</button>
							<button type="button" id="cancelBtn" class="btn btn-primary"
								onclick="goList()">목록</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/includes/modal.jsp"%>
<%@include file="/WEB-INF/views/includes/footer.jsp"%>
<script>
function check() {
	if(equipmentPhotoFile.files[0] != null) {
		fileUpload();
	}else {
		save();
	}
}
function fileUpload() {
	const formData = new FormData();
	//Object.keys(data).forEach((key) => {formData.append(key,data[key])});
	formData.append('file', equipmentPhotoFile.files[0]);
	$.ajax({
		url : '/equipment/model/form/fileUpload',
		type : 'PUT',
		processData: false,
		contentType: false, // 데이터 타입 (html, xml, json, text 등등)
		data : formData,
		success : function onData(data) {
			$('#equipmentPhoto').val(data.data);
			save();
		},
		error : function onError(error) {
			console.error(error);
		}
	});
}
function save() {
	const data = $('#actionForm').serializeObject();
	//const formData = new FormData();
	//Object.keys(data).forEach((key) => {formData.append(key,data[key])});
	//formData.append('equipmentPhotoFile', equipmentPhotoFile.files[0]);
	//formData.append('equipmentModelVO', JSON.stringify(data));
	$.ajax({
		url : '/equipment/model/form',
		type : 'PUT',
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
			console.error(error);
		}
	});
}
	
	function goList(){
		const form = document.querySelector("#actionForm");
		form.action = "/equipment/model/list";
		form.method = "get";
		form.innerHTML="";
		form.submit();
	}


	
</script>