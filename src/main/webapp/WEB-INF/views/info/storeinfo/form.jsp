<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/includes/header.jsp"%>
<div class="row">
	<div class="col-md-6">
		<div class="card">
			<form class="form-horizontal" id="actionForm">
				<div class="card-body">
					<h4 class="card-title">StoreInfoFormPage</h4>
					<div class="form-group row">
						<label for="sId"
							class="col-sm-3 text-end control-label col-form-label">매장번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="sId" name="sId" readonly="readonly"
								value="<c:out value='${StoreInfoDTO.sId }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="sName"
							class="col-sm-3 text-end control-label col-form-label">상호명</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="sName" name="sName"
								placeholder="<c:out value='${StoreInfoDTO.sName }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="sLocation"
							class="col-sm-3 text-end control-label col-form-label">가게주소</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="sLocation" name="sLocation"
								placeholder="<c:out value='${StoreInfoDTO.sLocation }'></c:out>">
						</div>
					</div>
				<div class="form-group row">
					<label for="manager"
						class="col-sm-3 text-end control-label col-form-label">관리자</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="manager" name="manager"
							placeholder="<c:out value='${StoreInfoDTO.manager }'></c:out>">
					</div>
				</div>
				<div class="form-group row">
					<label for="attemptClassification"
						class="col-sm-3 text-end control-label col-form-label">시도구분</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="attemptClassification" name="attemptClassification"
							placeholder="<c:out value='${StoreInfoDTO.attemptClassification }'></c:out>">
					</div>
				</div>
				<div class="form-group row">
					<label for="cityCountyClassification"
						class="col-sm-3 text-end control-label col-form-label">시군구분</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="cityCountyClassification" name="cityCountyClassification"
							placeholder="<c:out value='${StoreInfoDTO.cityCountyClassification }'></c:out>">
					</div>
				</div>
				<div class="form-group row">
					<label for="businessNumber"
						class="col-sm-3 text-end control-label col-form-label">사업자 번호</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="businessNumber" name="businessNumber"
							placeholder="<c:out value='${StoreInfoDTO.businessNumber }'></c:out>">
					</div>
				</div>
				<div class="form-group row">
					<label for="managerResidentNumber"
						class="col-sm-3 text-end control-label col-form-label">관리자 주민번호</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="managerResidentNumber" name="managerResidentNumber"
							placeholder="<c:out value='${StoreInfoDTO.managerResidentNumber }'></c:out>">
					</div>
				</div>
				<div class="form-group row">
					<label for="postCode"
						class="col-sm-3 text-end control-label col-form-label">우편번호</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="postCode" name="postCode"
							placeholder="<c:out value='${StoreInfoDTO.postCode }'></c:out>">
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
			url : '/info/storeinfo/form',
			type : 'PUT',
			//응답 받고 
			headers : { // Http header
				// 요청 보낼때 내가 보낼 data의 타입
				"Content-Type" : "application/json",
			},
			//
			dataType : 'JSON', // 데이터 타입 (html, xml, json, text 등등)
			data : JSON.stringify({storeInfoVO: data}),
			success : function onData(data) {
				alert(data.message);
				if(data.success) {
					location.href = '/info/storeinfo/list';
				}
			},
			error : function onError(error) {
				console.log("AA");
				console.error(error);
			}
		});
	}
	
</script>