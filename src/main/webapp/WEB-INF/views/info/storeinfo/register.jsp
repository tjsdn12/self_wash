<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/includes/header.jsp"%>
<div class="row">
	<div class="col-md-6">
		<div class="card">
			<form class="form-horizontal" id="actionForm">
				<div class="card-body">
					<h4 class="card-title">StoreInfoRegisterPage</h4>
					<div class="form-group row">
						<label for="sId"
							class="col-sm-3 text-end control-label col-form-label">매장번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="sId" name="sId" 
								value="<c:out value='${storeInfoVO.sId }'></c:out>" readonly="readonly">
						</div>
					</div>
					<div class="form-group row">
						<label for="sName"
							class="col-sm-3 text-end control-label col-form-label">상호명</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="sName" name="sName"
								value="<c:out value='${storeInfoVO.sName }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="sLocation"
							class="col-sm-3 text-end control-label col-form-label">가게주소</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="sLocation" name="sLocation"
								value="<c:out value='${storeInfoVO.sLocation }'></c:out>">
						</div>
					</div>
				<div class="form-group row">
					<label for="manager"
						class="col-sm-3 text-end control-label col-form-label">관리자</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="manager" name="manager"
							value="<c:out value='${storeInfoVO.manager }'></c:out>">
					</div>
				</div>
				<div class="form-group row">
					<label for="attemptClassification"
						class="col-sm-3 text-end control-label col-form-label">시도구분</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="attemptClassification" name="attemptClassification"
							value="<c:out value='${storeInfoVO.attemptClassification }'></c:out>">
					</div>
				</div>
				<div class="form-group row">
					<label for="cityCountyClassification"
						class="col-sm-3 text-end control-label col-form-label">시군구분</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="cityCountyClassification" name="cityCountyClassification"
							value="<c:out value='${storeInfoVO.cityCountyClassification }'></c:out>">
					</div>
				</div>
				<div class="form-group row">
					<label for="businessNumber"
						class="col-sm-3 text-end control-label col-form-label">사업자 번호</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="businessNumber" name="businessNumber"
							value="<c:out value='${storeInfoVO.businessNumber }'></c:out>">
					</div>
				</div>
				<div class="form-group row">
					<label for="managerResidentNumber"
						class="col-sm-3 text-end control-label col-form-label">관리자 주민번호</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="managerResidentNumber" name="managerResidentNumber"
							value="<c:out value='${storeInfoVO.managerResidentNumber }'></c:out>">
					</div>
				</div>
				<div class="form-group row">
					<label for="postCode"
						class="col-sm-3 text-end control-label col-form-label">우편번호</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="postCode" name="postCode"
							value="<c:out value='${storeInfoVO.postCode }'></c:out>">
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
			url : '/info/storeinfo/register',
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
	
	function goList() {
		const form = document.querySelector("#actionForm");
		form.action = "/info/storeinfo/list";
		form.method = "get";
		form.innerHTML = "";
		form.submit();
	}


	
</script>