<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/includes/header.jsp"%>
<div class="row">
	<div class="col-md-6">
		<div class="card">
			<form class="form-horizontal" id="actionForm">
				<div class="card-body">
					<h4 class="card-title">EquipmentManageFormPage</h4>
					<div class="form-group row">
						<label for="equipmentCode"
							class="col-sm-3 text-end control-label col-form-label">장비번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="equipmentCode" id="equipmentCode" 
								value="<c:out value='${equipmentManageVO.equipmentCode }'></c:out>" readonly="readonly">
						</div>
					</div>
					<div class="form-group row">
						<label for="tptb"
							class="col-sm-3 text-end control-label col-form-label">책임자</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="tptb" name="tptb"
								value="<c:out value='${equipmentManageVO.tptb }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="equipmentModelId"
							class="col-sm-3 text-end control-label col-form-label">장비모델</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="equipmentModelId" name="equipmentModelId" readonly="readonly"
								value="<c:out value='${equipmentManageVO.equipmentModelId }'></c:out>"><input type="button" value="장비모델검색"
								class="btn-info" onclick="modalShow()">
						</div>
					</div>
					<div class="form-group row">
						<label for="regularInspectionDate"
							class="col-sm-3 text-end control-label col-form-label">장비정검일자</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="regularInspectionDate" name="regularInspectionDate"
								value="<c:out value='${equipmentManageVO.regularInspectionDate }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="purchasePrice"
							class="col-sm-3 text-end control-label col-form-label">장비구매가격</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="purchasePrice" name="purchasePrice"
								value="<c:out value='${equipmentManageVO.purchasePrice }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="purchaseDatetime"
							class="col-sm-3 text-end control-label col-form-label">장비구매일시</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="purchaseDatetime" name="purchaseDatetime"
								value="<c:out value='${equipmentManageVO.purchaseDatetime }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="regularInspection"
							class="col-sm-3 text-end control-label col-form-label">장비관리유무</label>
						<div class="col-sm-9">
							<select name="regularInspection" id="regularInspection">
								<option value="care" <c:if test="${equipmentManageVO.regularInspection == 'care'}">selected="selected"</c:if>>관리유</option>
								<option value="dontCare" <c:if test="${equipmentManageVO.regularInspection == 'dontCare'}">selected="selected"</c:if>>관리무</option>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label for="equipmentStatus"
							class="col-sm-3 text-end control-label col-form-label">장비상태</label>
						<div class="col-sm-9">
							<select name="equipmentStatus" id="equipmentStatus">
								<option value="standby" <c:if test="${equipmentManageVO.equipmentStatus == 'standby'}">selected="selected"</c:if>>대기</option>
								<option value="useable" <c:if test="${equipmentManageVO.equipmentStatus == 'useable'}">selected="selected"</c:if>>사용</option>
								<option value="refuse" <c:if test="${equipmentManageVO.equipmentStatus == 'refuse'}">selected="selected"</c:if>>거절</option>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label for="sId"
							class="col-sm-3 text-end control-label col-form-label">지점명</label>
						<div class="col-sm-9">
							<select name="sId" id="sId" >
		 						<option>::: 지점 선택하기 :::</option>
									<c:forEach items="${getStoreList }" var="item2">
										<option value="${item2.sId }" <c:if test="${item2.sId==equipmentManageVO.sId}">selected="selected"</c:if>>${item2.sName }</option>
									</c:forEach>
								</select>
						</div>
					</div>
					<div class="border-top">
						<div class="card-body">
							<button type="button" id="modifyBtn" class="btn btn-primary" onclick="save()">저장</button>
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
	function init() {
		$('#modalSubmitBtn').hide();
		$('#modalAddBtn').hide();
		$('#modalAddBtn2').hide();
	}
	
	$(document).ready( () => {
		init();
	});
	
	function save() {
		const data = $('#actionForm').serializeObject();
		$.ajax({
			url : '/equipment/manage/form',
			type : 'PUT',
			//응답 받고 
			headers : { // Http header
				// 요청 보낼때 내가 보낼 data의 타입
				"Content-Type" : "application/json",
			},
			//
			dataType : 'JSON', // 데이터 타입 (html, xml, json, text 등등)
			data : JSON.stringify({equipmentManageVO: data}),
			success : function onData(data) {
				alert(data.message);
				if(data.success) {
					location.href = '/equipment/manage/list';
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
		form.action = "/equipment/manage/list";
		form.method = "get";
		form.innerHTML = "";
		form.submit();
	}
	
	function modalShow() {
		$('#modalSubmitBtn').hide();
		$('.modal .modal-body').load('/equipment/manage/popup/search?perSheet=5');
		$('.modal').show();
	}
	function modalHide() {
		$('.modal').hide();
	}
	function search() {
		const searchTxt = $('#equipmentName').val();
		$('.modal .modal-body').load('/equipment/manage/popup/search?perSheet=5&equipmentName='+searchTxt);
	}
	function goSelect(obj) {
		const equipmentModelId = $(obj).html().trim();
		$('#equipmentModelId').val(equipmentModelId);
		$('.modal').hide();
	}

	
</script>